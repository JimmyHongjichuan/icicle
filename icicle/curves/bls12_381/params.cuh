#pragma once
#include "../../utils/storage.cuh"

namespace PARAMS_BLS12_381 {
  struct fp_config {
    // field structure size = 8 * 32 bit
    static constexpr unsigned limbs_count = 8;
    static constexpr unsigned omegas_count = 32;
    // modulus = 52435875175126190479447740508185965837690552500527637822603658699938581184513
    static constexpr storage<limbs_count> modulus = {0x00000001, 0xffffffff, 0xfffe5bfe, 0x53bda402,
                                                     0x09a1d805, 0x3339d808, 0x299d7d48, 0x73eda753};
    // modulus*2 = 104871750350252380958895481016371931675381105001055275645207317399877162369026
    static constexpr storage<limbs_count> modulus_2 = {0x00000002, 0xfffffffe, 0xfffcb7fd, 0xa77b4805,
                                                       0x1343b00a, 0x6673b010, 0x533afa90, 0xe7db4ea6};
    static constexpr storage<limbs_count> modulus_4 = {0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                       0x00000000, 0x00000000, 0x00000000, 0x00000000};

    static constexpr storage<2 * limbs_count> modulus_wide = {
      0x00000001, 0xffffffff, 0xfffe5bfe, 0x53bda402, 0x09a1d805, 0x3339d808, 0x299d7d48, 0x73eda753,
      0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
    // modulus^2
    static constexpr storage<2 * limbs_count> modulus_squared = {
      0x00000001, 0xfffffffe, 0xfffcb7fe, 0xa77e9007, 0x1cdbb005, 0x698ae002, 0x5433f7b8, 0x48aa415e,
      0x4aa9c661, 0xc2611f6f, 0x59934a1d, 0x0e9593f9, 0xef2cc20f, 0x520c13db, 0xf4bc2778, 0x347f60f3};
    // 2*modulus^2
    static constexpr storage<2 * limbs_count> modulus_squared_2 = {
      0x00000002, 0xfffffffc, 0xfff96ffd, 0x4efd200f, 0x39b7600b, 0xd315c004, 0xa867ef70, 0x915482bc,
      0x95538cc2, 0x84c23ede, 0xb326943b, 0x1d2b27f2, 0xde59841e, 0xa41827b7, 0xe9784ef0, 0x68fec1e7};
    // note: doesnt actually fit into 384 bits, and shouldnt be used! is added for compilation
    static constexpr storage<2 * limbs_count> modulus_squared_4 = {
      0x00000002, 0xfffffffc, 0xfff96ffd, 0x4efd200f, 0x39b7600b, 0xd315c004, 0xa867ef70, 0x915482bc,
      0x95538cc2, 0x84c23ede, 0xb326943b, 0x1d2b27f2, 0xde59841e, 0xa41827b7, 0xe9784ef0, 0x68fec1e7};
    static constexpr unsigned modulus_bit_count = 255;
    // m = floor(2^(2*modulus_bit_count) / modulus)
    static constexpr storage<limbs_count> m = {0x830358e4, 0x509cde80, 0x2f92eb5c, 0xd9410fad,
                                               0xc1f823b4, 0xe2d772d,  0x7fb78ddf, 0x8d54253b};

    static constexpr storage<limbs_count> one = {0x00000001, 0x00000000, 0x00000000, 0x00000000,
                                                 0x00000000, 0x00000000, 0x00000000, 0x00000000};
    static constexpr storage<limbs_count> zero = {0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                  0x00000000, 0x00000000, 0x00000000, 0x00000000};
    static constexpr storage<limbs_count> montgomery_r = {0xfffffffe, 0x00000001, 0x00034802, 0x5884b7fa,
                                                          0xecbc4ff5, 0x998c4fef, 0xacc5056f, 0x1824b159};
    static constexpr storage<limbs_count> montgomery_r_inv = {0xfe75c040, 0x13f75b69, 0x09dc705f, 0xab6fca8f,
                                                              0x4f77266a, 0x7204078a, 0x30009d57, 0x1bbe8693};

    // static constexpr storage<limbs_count> omega[32]= { {0x00000000, 0xffffffff, 0xfffe5bfe, 0x53bda402, 0x09a1d805,
    // 0x3339d808, 0x299d7d48, 0x73eda753}, {0x00000000, 0x00010000, 0x76030000, 0xec030002, 0x760304d0, 0x8d51ccce,
    // 0x00000000, 0x00000000}, {0x688bc087, 0x8dd702cb, 0x78eaa4fe, 0xa0328240, 0x98ca5b22, 0xa733b23a, 0x25a31660,
    // 0x3f96405d}, {0x0411fe73, 0x95df4b36, 0xebc1e1bb, 0x1ef4e672, 0x60afca4a, 0x6e92a9c4, 0x753e4fcc, 0x4f2c596e},
    // {0xba60eaa6, 0x9733f3a6, 0x77487ae7, 0xbd7fdf9c, 0xc8b6cc00, 0xd84f8612, 0x6162ffab, 0x476fa2fb}, {0xac5db47f,
    // 0xd2fc5e69, 0x15d0b8e4, 0xa12a70a6, 0xbc8de5d9, 0x293b1d67, 0x57f86f5e, 0x0e4840ac}, {0xab28e208, 0xb750da4c,
    // 0x3be95635, 0x501dff64, 0xf0b4b276, 0x8cbe2437, 0xa94a946e, 0x07d0c802}, {0x2fe322b8, 0x2cabadec, 0x15412560,
    // 0x752c84f3, 0x1a3b0aef, 0x32a732ae, 0xa33dcbf2, 0x2e95da59}, {0xfe0c65f4, 0x33811ea1, 0x687f28a2, 0x15c1ad4c,
    // 0x42dee7f4, 0xecfbede3, 0x9a5d88b1, 0x1bb46667}, {0x2d010ff9, 0xd58a5af4, 0x570bf109, 0x79efd6b0, 0x6350721d,
    // 0x3ed6d55a, 0x58f43cef, 0x2f27b098}, {0x8c130477, 0x74a1f671, 0xb61e0abe, 0xa534af14, 0x620890d7, 0xeb674a1a,
    // 0xca252472, 0x43527a8b}, {0x7ea8ee05, 0x450d9f97, 0x37d56fc0, 0x565af171, 0x93f9e9ac, 0xe155cb48, 0xc8e9101b,
    // 0x110cebd0}, {0x59a0be92, 0x23c91599, 0x7a027759, 0x87d188ce, 0xcab3c3cc, 0x70491431, 0xb3f7f8da, 0x0ac00eb8},
    // {0x69583404, 0x13e96ade, 0x5306243d, 0x82c05727, 0x29ca9f2a, 0x77e48bf5, 0x1fe19595, 0x50646ac8}, {0xa97eccd4,
    // 0xe6a354dd, 0x88fbbc57, 0x39929d2e, 0xd6e7b1c8, 0xa22ba63d, 0xf5f07f43, 0x42c22911}, {0xcfc35f7a, 0x137b458a,
    // 0x29c01b06, 0x0caba63a, 0x7a02402c, 0x0409ee98, 0x56aa725b, 0x6709c6cd}, {0x8831e03e, 0x10251f7d, 0x7ff858ec,
    // 0x77d85a93, 0x4fb9ac5c, 0xebe905bd, 0xf8727901, 0x05deb333}, {0xb9009408, 0xbf87b689, 0xdd3ccc96, 0x4f730e7d,
    // 0x4610300c, 0xfd7f05ba, 0x0b8ac903, 0x5ef5e8db}, {0x17cd0c14, 0x64996884, 0x68812f7f, 0xa6728673, 0x22cc3253,
    // 0x2e1d9a19, 0xaa0a1d80, 0x3a689e83}, {0x41144dea, 0x20b53cbe, 0xc2f0fcbd, 0x870c46fa, 0x537d6971, 0x556c35f6,
    // 0x5f686d91, 0x3436287f}, {0x436ba2e7, 0x007e082a, 0x9116e877, 0x67c6630f, 0xfb4460f7, 0x36f8f165, 0x7e7046e0,
    // 0x6eee34d5}, {0xa53a56d1, 0xc5b670ee, 0x53037d7b, 0x127d1f42, 0xa722c2e2, 0x57d4257e, 0x33cbd838, 0x03ae26a3},
    // {0x76504cf8, 0x1e914848, 0xb63edd02, 0x55bbbf1e, 0x4e55aa02, 0xbcdafec8, 0x2dc0beb0, 0x5145c4cd}, {0x1ab70e2c,
    // 0x5b90153a, 0x75fb0ab8, 0x8deffa31, 0x46900c95, 0xc553ae23, 0x6bd3118c, 0x1d31dcdc}, {0x59a2e8eb, 0x801c894c,
    // 0xe12fc974, 0xbc535c5c, 0x47d39803, 0x95508d27, 0xac5d094f, 0x16d9d3cd}, {0xcca1d8be, 0x810fa372, 0x82e0bfa7,
    // 0xc67b8c28, 0xe2d35bc2, 0xdbb4edf0, 0x5087c995, 0x712d1580}, {0xfd88f133, 0xeb162203, 0xf010ea74, 0xac96c38f,
    // 0xe64cfc70, 0x4307987f, 0x37b7a114, 0x350fe98d}, {0x42f2a254, 0xaba2f518, 0xa71efc0c, 0x4d7f3c3a, 0xd274a80a,
    // 0x97ae418d, 0x5e3e7682, 0x2967385d}, {0x575a0b79, 0x75c55c7b, 0x74a7ded1, 0x3ba4a157, 0xa04fccf3, 0xc3974d73,
    // 0x4a939684, 0x705aba4f}, {0x14ebb608, 0x8409a9ea, 0x66bac611, 0xfad0084e, 0x811c1dfb, 0x04287254, 0x23b30c29,
    // 0x086d072b}, {0x67e4756a, 0xb427c9b3, 0x02ebc38d, 0xc7537fb9, 0xcd6a205f, 0x51de21be, 0x7923597d, 0x6064ab72},
    // {0x0b912f1f, 0x1b788f50, 0x70b3e094, 0xc4024ff2, 0xd168d6c0, 0x0fd56dc8, 0x5b416b6f, 0x0212d79e}}; Quick fix for
    // linking issue
    static constexpr storage<limbs_count> omega1 = {0x00000000, 0xffffffff, 0xfffe5bfe, 0x53bda402,
                                                    0x09a1d805, 0x3339d808, 0x299d7d48, 0x73eda753};
    static constexpr storage<limbs_count> omega2 = {0x00000000, 0x00010000, 0x76030000, 0xec030002,
                                                    0x760304d0, 0x8d51ccce, 0x00000000, 0x00000000};
    static constexpr storage<limbs_count> omega3 = {0x688bc087, 0x8dd702cb, 0x78eaa4fe, 0xa0328240,
                                                    0x98ca5b22, 0xa733b23a, 0x25a31660, 0x3f96405d};
    static constexpr storage<limbs_count> omega4 = {0x0411fe73, 0x95df4b36, 0xebc1e1bb, 0x1ef4e672,
                                                    0x60afca4a, 0x6e92a9c4, 0x753e4fcc, 0x4f2c596e};
    static constexpr storage<limbs_count> omega5 = {0xba60eaa6, 0x9733f3a6, 0x77487ae7, 0xbd7fdf9c,
                                                    0xc8b6cc00, 0xd84f8612, 0x6162ffab, 0x476fa2fb};
    static constexpr storage<limbs_count> omega6 = {0xac5db47f, 0xd2fc5e69, 0x15d0b8e4, 0xa12a70a6,
                                                    0xbc8de5d9, 0x293b1d67, 0x57f86f5e, 0x0e4840ac};
    static constexpr storage<limbs_count> omega7 = {0xab28e208, 0xb750da4c, 0x3be95635, 0x501dff64,
                                                    0xf0b4b276, 0x8cbe2437, 0xa94a946e, 0x07d0c802};
    static constexpr storage<limbs_count> omega8 = {0x2fe322b8, 0x2cabadec, 0x15412560, 0x752c84f3,
                                                    0x1a3b0aef, 0x32a732ae, 0xa33dcbf2, 0x2e95da59};
    static constexpr storage<limbs_count> omega9 = {0xfe0c65f4, 0x33811ea1, 0x687f28a2, 0x15c1ad4c,
                                                    0x42dee7f4, 0xecfbede3, 0x9a5d88b1, 0x1bb46667};
    static constexpr storage<limbs_count> omega10 = {0x2d010ff9, 0xd58a5af4, 0x570bf109, 0x79efd6b0,
                                                     0x6350721d, 0x3ed6d55a, 0x58f43cef, 0x2f27b098};
    static constexpr storage<limbs_count> omega11 = {0x8c130477, 0x74a1f671, 0xb61e0abe, 0xa534af14,
                                                     0x620890d7, 0xeb674a1a, 0xca252472, 0x43527a8b};
    static constexpr storage<limbs_count> omega12 = {0x7ea8ee05, 0x450d9f97, 0x37d56fc0, 0x565af171,
                                                     0x93f9e9ac, 0xe155cb48, 0xc8e9101b, 0x110cebd0};
    static constexpr storage<limbs_count> omega13 = {0x59a0be92, 0x23c91599, 0x7a027759, 0x87d188ce,
                                                     0xcab3c3cc, 0x70491431, 0xb3f7f8da, 0x0ac00eb8};
    static constexpr storage<limbs_count> omega14 = {0x69583404, 0x13e96ade, 0x5306243d, 0x82c05727,
                                                     0x29ca9f2a, 0x77e48bf5, 0x1fe19595, 0x50646ac8};
    static constexpr storage<limbs_count> omega15 = {0xa97eccd4, 0xe6a354dd, 0x88fbbc57, 0x39929d2e,
                                                     0xd6e7b1c8, 0xa22ba63d, 0xf5f07f43, 0x42c22911};
    static constexpr storage<limbs_count> omega16 = {0xcfc35f7a, 0x137b458a, 0x29c01b06, 0x0caba63a,
                                                     0x7a02402c, 0x0409ee98, 0x56aa725b, 0x6709c6cd};
    static constexpr storage<limbs_count> omega17 = {0x8831e03e, 0x10251f7d, 0x7ff858ec, 0x77d85a93,
                                                     0x4fb9ac5c, 0xebe905bd, 0xf8727901, 0x05deb333};
    static constexpr storage<limbs_count> omega18 = {0xb9009408, 0xbf87b689, 0xdd3ccc96, 0x4f730e7d,
                                                     0x4610300c, 0xfd7f05ba, 0x0b8ac903, 0x5ef5e8db};
    static constexpr storage<limbs_count> omega19 = {0x17cd0c14, 0x64996884, 0x68812f7f, 0xa6728673,
                                                     0x22cc3253, 0x2e1d9a19, 0xaa0a1d80, 0x3a689e83};
    static constexpr storage<limbs_count> omega20 = {0x41144dea, 0x20b53cbe, 0xc2f0fcbd, 0x870c46fa,
                                                     0x537d6971, 0x556c35f6, 0x5f686d91, 0x3436287f};
    static constexpr storage<limbs_count> omega21 = {0x436ba2e7, 0x007e082a, 0x9116e877, 0x67c6630f,
                                                     0xfb4460f7, 0x36f8f165, 0x7e7046e0, 0x6eee34d5};
    static constexpr storage<limbs_count> omega22 = {0xa53a56d1, 0xc5b670ee, 0x53037d7b, 0x127d1f42,
                                                     0xa722c2e2, 0x57d4257e, 0x33cbd838, 0x03ae26a3};
    static constexpr storage<limbs_count> omega23 = {0x76504cf8, 0x1e914848, 0xb63edd02, 0x55bbbf1e,
                                                     0x4e55aa02, 0xbcdafec8, 0x2dc0beb0, 0x5145c4cd};
    static constexpr storage<limbs_count> omega24 = {0x1ab70e2c, 0x5b90153a, 0x75fb0ab8, 0x8deffa31,
                                                     0x46900c95, 0xc553ae23, 0x6bd3118c, 0x1d31dcdc};
    static constexpr storage<limbs_count> omega25 = {0x59a2e8eb, 0x801c894c, 0xe12fc974, 0xbc535c5c,
                                                     0x47d39803, 0x95508d27, 0xac5d094f, 0x16d9d3cd};
    static constexpr storage<limbs_count> omega26 = {0xcca1d8be, 0x810fa372, 0x82e0bfa7, 0xc67b8c28,
                                                     0xe2d35bc2, 0xdbb4edf0, 0x5087c995, 0x712d1580};
    static constexpr storage<limbs_count> omega27 = {0xfd88f133, 0xeb162203, 0xf010ea74, 0xac96c38f,
                                                     0xe64cfc70, 0x4307987f, 0x37b7a114, 0x350fe98d};
    static constexpr storage<limbs_count> omega28 = {0x42f2a254, 0xaba2f518, 0xa71efc0c, 0x4d7f3c3a,
                                                     0xd274a80a, 0x97ae418d, 0x5e3e7682, 0x2967385d};
    static constexpr storage<limbs_count> omega29 = {0x575a0b79, 0x75c55c7b, 0x74a7ded1, 0x3ba4a157,
                                                     0xa04fccf3, 0xc3974d73, 0x4a939684, 0x705aba4f};
    static constexpr storage<limbs_count> omega30 = {0x14ebb608, 0x8409a9ea, 0x66bac611, 0xfad0084e,
                                                     0x811c1dfb, 0x04287254, 0x23b30c29, 0x086d072b};
    static constexpr storage<limbs_count> omega31 = {0x67e4756a, 0xb427c9b3, 0x02ebc38d, 0xc7537fb9,
                                                     0xcd6a205f, 0x51de21be, 0x7923597d, 0x6064ab72};
    static constexpr storage<limbs_count> omega32 = {0x0b912f1f, 0x1b788f50, 0x70b3e094, 0xc4024ff2,
                                                     0xd168d6c0, 0x0fd56dc8, 0x5b416b6f, 0x0212d79e};

    static constexpr storage_array<omegas_count, limbs_count> omega = {
      omega1,  omega2,  omega3,  omega4,  omega5,  omega6,  omega7,  omega8,  omega9,  omega10, omega11,
      omega12, omega13, omega14, omega15, omega16, omega17, omega18, omega19, omega20, omega21, omega22,
      omega23, omega24, omega25, omega26, omega27, omega28, omega29, omega30, omega31, omega32,
    };

    // static constexpr storage<limbs_count> omega_inv[32]={ {0x00000000, 0xffffffff, 0xfffe5bfe, 0x53bda402,
    // 0x09a1d805, 0x3339d808, 0x299d7d48, 0x73eda753}, {0x00000001, 0xfffeffff, 0x89fb5bfe, 0x67baa400, 0x939ed334,
    // 0xa5e80b39, 0x299d7d47, 0x73eda753}, {0xae99502e, 0x6037fe81, 0x94b04fd8, 0x8e749036, 0xca86bf65, 0xbabc5aff,
    // 0x5ce11044, 0x1333b22e}, {0x7dc08d74, 0x7f847ee4, 0x04eeaf5a, 0xbd433896, 0x1832fc60, 0xd66c91d6, 0x607e449b,
    // 0x551115b4}, {0x4e7773cb, 0xee5bcecc, 0xf6dab086, 0x45593d6f, 0x4016e2bd, 0xa3a95d2d, 0xaf96816f, 0x047cb16c},
    // {0x982b68c5, 0xb891fa3f, 0x1d426b52, 0xa41e8501, 0x882952d6, 0x566009b5, 0x7b3c79d6, 0x199cdaee}, {0xcf28601b,
    // 0x571ba2fc, 0xac74db12, 0x166fb582, 0x3501370b, 0x51420be4, 0x52f970ba, 0x1996fa8d}, {0x6a2f777a, 0xe9561c17,
    // 0x2393991b, 0xc03cae03, 0x5a5bfd4f, 0x91b00023, 0x272e58ee, 0x6d64ed25}, {0xf02a116e, 0xfb350dbe, 0xb4543a3e,
    // 0x1c510ebf, 0x37ad4eca, 0xf675522e, 0x80f82b2d, 0x1907a56e}, {0x4eb71aa6, 0xb0ad8003, 0xaa67e0be, 0x50a32c41,
    // 0x19141f44, 0x105f0672, 0xa3dad316, 0x2bcd9508}, {0x0f6fb2ac, 0x3dc9e560, 0x9aa58ff5, 0x3cc5bb32, 0x36f376e1,
    // 0xdeae67bc, 0x65ba213e, 0x394fda0d}, {0x60b82267, 0x09f239f7, 0x8b24f123, 0x14180e0e, 0x45625d95, 0xad5a5340,
    // 0x6d174692, 0x58c3ba63}, {0x348b416f, 0x0acf21c2, 0xbc086439, 0x798b6bf6, 0xb1ca111d, 0x222d411f, 0x30ba1e0f,
    // 0x044107b7}, {0x014abe84, 0xa3b861b8, 0x427ed008, 0x37c017e4, 0xae0ff4f5, 0xae51f613, 0xcb1218d3, 0x1a2d00e1},
    // {0x4de7eb2b, 0x48aaa3bf, 0x6772057d, 0x4a58d54d, 0x7093b551, 0xce25f16c, 0xd206337c, 0x242150ac}, {0x9ed57ae5,
    // 0xdf3ec9ae, 0x7166577f, 0xea7df73a, 0x022fbbe4, 0x6ca8d281, 0x151e3f6b, 0x5850c003}, {0x645e1cfa, 0x903a0a0c,
    // 0x34788c37, 0xfbac54cb, 0x8cf73d78, 0xdc127d11, 0x975d3c82, 0x6d0b5c7c}, {0x14b1ba04, 0xb49d6b05, 0xf00b84f2,
    // 0x56e466b4, 0x0b904f22, 0x30c390cf, 0x3ee254cc, 0x3e11cfb7}, {0xbe8201ab, 0x84dfa547, 0x530715d2, 0x3887ce8b,
    // 0x3eed4ed7, 0xa4c719c6, 0x8f8007b4, 0x18c44950}, {0x7d813cd1, 0xdaf0346d, 0xf755beb1, 0xeccf6f9a, 0xe08143e3,
    // 0x167fce38, 0x6f5d6dfa, 0x545ad9b2}, {0x577605de, 0x973f5466, 0x974f953c, 0x0ce8986e, 0x074382f9, 0x8941cf4b,
    // 0x6fa2672c, 0x156cd7f6}, {0x33b66141, 0x24315404, 0x1992f584, 0x5d1375ab, 0x8b20ca1a, 0xf193ffa6, 0x2701a503,
    // 0x47880cd5}, {0xe9f7b9af, 0xf7b6847d, 0x62c83ce2, 0x9a339673, 0x6e5e6f79, 0xfabf4537, 0x35af33a3, 0x0975acd9},
    // {0x0eddd248, 0x4fb4204a, 0xc9e509b3, 0x8c98706a, 0x2bb27eb1, 0xd0be8987, 0xc831438b, 0x6ec5f960}, {0x20238f62,
    // 0xa13c95b7, 0x83b476b9, 0x130aa097, 0x14860881, 0x758a04e0, 0x97066493, 0x58e2f8d6}, {0xe8bff41e, 0x65b09c73,
    // 0x37f1c6a3, 0x8b3280e8, 0x2846fb21, 0xe17b82ce, 0xb1ae27df, 0x476534bf}, {0xd5fdb757, 0x8480c0e7, 0x365bf9fd,
    // 0x3644eea0, 0xb776be86, 0x4ca116ca, 0x8b58390c, 0x17b6395f}, {0x252eb0db, 0x2c811e9a, 0x7479e161, 0x1b7d960d,
    // 0xb0a89a26, 0xb3afc7c1, 0x32b5e793, 0x6a2f9533}, {0x08b8a7ad, 0xe877b2c4, 0x341652b4, 0x68b0e8f0, 0xe8b6a2d9,
    // 0x2d44da3b, 0xfd09be59, 0x092778ff}, {0x7988f244, 0x84a1aa6f, 0x24faf63f, 0xa164b3d9, 0xc1bbb915, 0x7aae9724,
    // 0xf386c0d2, 0x24e5d287}, {0x41a1b30c, 0xa70a7efd, 0x39f0e511, 0xc49c55a5, 0x033bb323, 0xab307a8f, 0x17acbd7f,
    // 0x0158abd6}, {0x0f642025, 0x2c228b30, 0x01bd882b, 0xb0878e8d, 0xd7377fea, 0xd862b255, 0xf0490536, 0x18ac3666}};
    // Quick fix for linking issue
    static constexpr storage<limbs_count> omega_inv1 = {0x00000000, 0xffffffff, 0xfffe5bfe, 0x53bda402,
                                                        0x09a1d805, 0x3339d808, 0x299d7d48, 0x73eda753};
    static constexpr storage<limbs_count> omega_inv2 = {0x00000001, 0xfffeffff, 0x89fb5bfe, 0x67baa400,
                                                        0x939ed334, 0xa5e80b39, 0x299d7d47, 0x73eda753};
    static constexpr storage<limbs_count> omega_inv3 = {0xae99502e, 0x6037fe81, 0x94b04fd8, 0x8e749036,
                                                        0xca86bf65, 0xbabc5aff, 0x5ce11044, 0x1333b22e};
    static constexpr storage<limbs_count> omega_inv4 = {0x7dc08d74, 0x7f847ee4, 0x04eeaf5a, 0xbd433896,
                                                        0x1832fc60, 0xd66c91d6, 0x607e449b, 0x551115b4};
    static constexpr storage<limbs_count> omega_inv5 = {0x4e7773cb, 0xee5bcecc, 0xf6dab086, 0x45593d6f,
                                                        0x4016e2bd, 0xa3a95d2d, 0xaf96816f, 0x047cb16c};
    static constexpr storage<limbs_count> omega_inv6 = {0x982b68c5, 0xb891fa3f, 0x1d426b52, 0xa41e8501,
                                                        0x882952d6, 0x566009b5, 0x7b3c79d6, 0x199cdaee};
    static constexpr storage<limbs_count> omega_inv7 = {0xcf28601b, 0x571ba2fc, 0xac74db12, 0x166fb582,
                                                        0x3501370b, 0x51420be4, 0x52f970ba, 0x1996fa8d};
    static constexpr storage<limbs_count> omega_inv8 = {0x6a2f777a, 0xe9561c17, 0x2393991b, 0xc03cae03,
                                                        0x5a5bfd4f, 0x91b00023, 0x272e58ee, 0x6d64ed25};
    static constexpr storage<limbs_count> omega_inv9 = {0xf02a116e, 0xfb350dbe, 0xb4543a3e, 0x1c510ebf,
                                                        0x37ad4eca, 0xf675522e, 0x80f82b2d, 0x1907a56e};
    static constexpr storage<limbs_count> omega_inv10 = {0x4eb71aa6, 0xb0ad8003, 0xaa67e0be, 0x50a32c41,
                                                         0x19141f44, 0x105f0672, 0xa3dad316, 0x2bcd9508};
    static constexpr storage<limbs_count> omega_inv11 = {0x0f6fb2ac, 0x3dc9e560, 0x9aa58ff5, 0x3cc5bb32,
                                                         0x36f376e1, 0xdeae67bc, 0x65ba213e, 0x394fda0d};
    static constexpr storage<limbs_count> omega_inv12 = {0x60b82267, 0x09f239f7, 0x8b24f123, 0x14180e0e,
                                                         0x45625d95, 0xad5a5340, 0x6d174692, 0x58c3ba63};
    static constexpr storage<limbs_count> omega_inv13 = {0x348b416f, 0x0acf21c2, 0xbc086439, 0x798b6bf6,
                                                         0xb1ca111d, 0x222d411f, 0x30ba1e0f, 0x044107b7};
    static constexpr storage<limbs_count> omega_inv14 = {0x014abe84, 0xa3b861b8, 0x427ed008, 0x37c017e4,
                                                         0xae0ff4f5, 0xae51f613, 0xcb1218d3, 0x1a2d00e1};
    static constexpr storage<limbs_count> omega_inv15 = {0x4de7eb2b, 0x48aaa3bf, 0x6772057d, 0x4a58d54d,
                                                         0x7093b551, 0xce25f16c, 0xd206337c, 0x242150ac};
    static constexpr storage<limbs_count> omega_inv16 = {0x9ed57ae5, 0xdf3ec9ae, 0x7166577f, 0xea7df73a,
                                                         0x022fbbe4, 0x6ca8d281, 0x151e3f6b, 0x5850c003};
    static constexpr storage<limbs_count> omega_inv17 = {0x645e1cfa, 0x903a0a0c, 0x34788c37, 0xfbac54cb,
                                                         0x8cf73d78, 0xdc127d11, 0x975d3c82, 0x6d0b5c7c};
    static constexpr storage<limbs_count> omega_inv18 = {0x14b1ba04, 0xb49d6b05, 0xf00b84f2, 0x56e466b4,
                                                         0x0b904f22, 0x30c390cf, 0x3ee254cc, 0x3e11cfb7};
    static constexpr storage<limbs_count> omega_inv19 = {0xbe8201ab, 0x84dfa547, 0x530715d2, 0x3887ce8b,
                                                         0x3eed4ed7, 0xa4c719c6, 0x8f8007b4, 0x18c44950};
    static constexpr storage<limbs_count> omega_inv20 = {0x7d813cd1, 0xdaf0346d, 0xf755beb1, 0xeccf6f9a,
                                                         0xe08143e3, 0x167fce38, 0x6f5d6dfa, 0x545ad9b2};
    static constexpr storage<limbs_count> omega_inv21 = {0x577605de, 0x973f5466, 0x974f953c, 0x0ce8986e,
                                                         0x074382f9, 0x8941cf4b, 0x6fa2672c, 0x156cd7f6};
    static constexpr storage<limbs_count> omega_inv22 = {0x33b66141, 0x24315404, 0x1992f584, 0x5d1375ab,
                                                         0x8b20ca1a, 0xf193ffa6, 0x2701a503, 0x47880cd5};
    static constexpr storage<limbs_count> omega_inv23 = {0xe9f7b9af, 0xf7b6847d, 0x62c83ce2, 0x9a339673,
                                                         0x6e5e6f79, 0xfabf4537, 0x35af33a3, 0x0975acd9};
    static constexpr storage<limbs_count> omega_inv24 = {0x0eddd248, 0x4fb4204a, 0xc9e509b3, 0x8c98706a,
                                                         0x2bb27eb1, 0xd0be8987, 0xc831438b, 0x6ec5f960};
    static constexpr storage<limbs_count> omega_inv25 = {0x20238f62, 0xa13c95b7, 0x83b476b9, 0x130aa097,
                                                         0x14860881, 0x758a04e0, 0x97066493, 0x58e2f8d6};
    static constexpr storage<limbs_count> omega_inv26 = {0xe8bff41e, 0x65b09c73, 0x37f1c6a3, 0x8b3280e8,
                                                         0x2846fb21, 0xe17b82ce, 0xb1ae27df, 0x476534bf};
    static constexpr storage<limbs_count> omega_inv27 = {0xd5fdb757, 0x8480c0e7, 0x365bf9fd, 0x3644eea0,
                                                         0xb776be86, 0x4ca116ca, 0x8b58390c, 0x17b6395f};
    static constexpr storage<limbs_count> omega_inv28 = {0x252eb0db, 0x2c811e9a, 0x7479e161, 0x1b7d960d,
                                                         0xb0a89a26, 0xb3afc7c1, 0x32b5e793, 0x6a2f9533};
    static constexpr storage<limbs_count> omega_inv29 = {0x08b8a7ad, 0xe877b2c4, 0x341652b4, 0x68b0e8f0,
                                                         0xe8b6a2d9, 0x2d44da3b, 0xfd09be59, 0x092778ff};
    static constexpr storage<limbs_count> omega_inv30 = {0x7988f244, 0x84a1aa6f, 0x24faf63f, 0xa164b3d9,
                                                         0xc1bbb915, 0x7aae9724, 0xf386c0d2, 0x24e5d287};
    static constexpr storage<limbs_count> omega_inv31 = {0x41a1b30c, 0xa70a7efd, 0x39f0e511, 0xc49c55a5,
                                                         0x033bb323, 0xab307a8f, 0x17acbd7f, 0x0158abd6};
    static constexpr storage<limbs_count> omega_inv32 = {0x0f642025, 0x2c228b30, 0x01bd882b, 0xb0878e8d,
                                                         0xd7377fea, 0xd862b255, 0xf0490536, 0x18ac3666};

    static constexpr storage_array<omegas_count, limbs_count> omega_inv = {
      omega_inv1,  omega_inv2,  omega_inv3,  omega_inv4,  omega_inv5,  omega_inv6,  omega_inv7,  omega_inv8,
      omega_inv9,  omega_inv10, omega_inv11, omega_inv12, omega_inv13, omega_inv14, omega_inv15, omega_inv16,
      omega_inv17, omega_inv18, omega_inv19, omega_inv20, omega_inv21, omega_inv22, omega_inv23, omega_inv24,
      omega_inv25, omega_inv26, omega_inv27, omega_inv28, omega_inv29, omega_inv30, omega_inv31, omega_inv32,
    };

    // Quick fix for linking issue
    static constexpr storage<limbs_count> inv1 = {0x80000001, 0x7fffffff, 0x7fff2dff, 0xa9ded201,
                                                  0x04d0ec02, 0x199cec04, 0x94cebea4, 0x39f6d3a9};
    static constexpr storage<limbs_count> inv2 = {0x40000001, 0x3fffffff, 0x3ffec4ff, 0xfece3b02,
                                                  0x07396203, 0x266b6206, 0x5f361df6, 0x56f23d7e};
    static constexpr storage<limbs_count> inv3 = {0x20000001, 0x1fffffff, 0x9ffe907f, 0xa945ef82,
                                                  0x086d9d04, 0x2cd29d07, 0xc469cd9f, 0x656ff268};
    static constexpr storage<limbs_count> inv4 = {0x10000001, 0x0fffffff, 0xcffe763f, 0xfe81c9c2,
                                                  0x8907ba84, 0xb0063a87, 0xf703a573, 0x6caeccdd};
    static constexpr storage<limbs_count> inv5 = {0x08000001, 0x07ffffff, 0xe7fe691f, 0x291fb6e2,
                                                  0xc954c945, 0xf1a00947, 0x9050915d, 0x704e3a18};
    static constexpr storage<limbs_count> inv6 = {0x04000001, 0x03ffffff, 0xf3fe628f, 0x3e6ead72,
                                                  0xe97b50a5, 0x126cf0a7, 0xdcf70753, 0x721df0b5};
    static constexpr storage<limbs_count> inv7 = {0x02000001, 0x01ffffff, 0xf9fe5f47, 0x491628ba,
                                                  0xf98e9455, 0xa2d36457, 0x834a424d, 0x7305cc04};
    static constexpr storage<limbs_count> inv8 = {0x01000001, 0x00ffffff, 0xfcfe5da3, 0x4e69e65e,
                                                  0x0198362d, 0xeb069e30, 0xd673dfca, 0x7379b9ab};
    static constexpr storage<limbs_count> inv9 = {0x00800001, 0x007fffff, 0xfe7e5cd1, 0x5113c530,
                                                  0x059d0719, 0x8f203b1c, 0x8008ae89, 0x73b3b07f};
    static constexpr storage<limbs_count> inv10 = {0x00400001, 0x003fffff, 0xff3e5c68, 0x5268b499,
                                                   0x079f6f8f, 0xe12d0992, 0x54d315e8, 0x73d0abe9};
    static constexpr storage<limbs_count> inv11 = {0x00200001, 0x801fffff, 0x7f9e5c33, 0x53132c4e,
                                                   0x08a0a3ca, 0x8a3370cd, 0x3f384998, 0x73df299e};
    static constexpr storage<limbs_count> inv12 = {0x00100001, 0x400fffff, 0xbfce5c19, 0xd3686828,
                                                   0x89213de7, 0x5eb6a46a, 0xb46ae370, 0x73e66878};
    static constexpr storage<limbs_count> inv13 = {0x00080001, 0x2007ffff, 0xdfe65c0c, 0x93930615,
                                                   0x49618af6, 0x48f83e39, 0xef04305c, 0x73ea07e5};
    static constexpr storage<limbs_count> inv14 = {0x00040001, 0x9003ffff, 0x6ff25c05, 0xf3a8550c,
                                                   0xa981b17d, 0x3e190b20, 0x8c50d6d2, 0x73ebd79c};
    static constexpr storage<limbs_count> inv15 = {0x00020001, 0x4801ffff, 0xb7f85c02, 0xa3b2fc87,
                                                   0x5991c4c1, 0x38a97194, 0xdaf72a0d, 0x73ecbf77};
    static constexpr storage<limbs_count> inv16 = {0x00010001, 0xa400ffff, 0x5bfb5c00, 0x7bb85045,
                                                   0x3199ce63, 0xb5f1a4ce, 0x824a53aa, 0x73ed3365};
    static constexpr storage<limbs_count> inv17 = {0x00008001, 0xd2007fff, 0x2dfcdbff, 0x67bafa24,
                                                   0x1d9dd334, 0x7495be6b, 0x55f3e879, 0x73ed6d5c};
    static constexpr storage<limbs_count> inv18 = {0x00004001, 0x69003fff, 0x96fd9bff, 0xddbc4f13,
                                                   0x939fd59c, 0xd3e7cb39, 0xbfc8b2e0, 0x73ed8a57};
    static constexpr storage<limbs_count> inv19 = {0x00002001, 0x34801fff, 0x4b7dfbff, 0x18bcf98b,
                                                   0xcea0d6d1, 0x8390d1a0, 0x74b31814, 0x73ed98d5};
    static constexpr storage<limbs_count> inv20 = {0x00001001, 0x1a400fff, 0x25be2bff, 0x363d4ec7,
                                                   0x6c21576b, 0x5b6554d4, 0x4f284aae, 0x73eda014};
    static constexpr storage<limbs_count> inv21 = {0x00000801, 0x0d2007ff, 0x12de43ff, 0x44fd7965,
                                                   0x3ae197b8, 0x474f966e, 0xbc62e3fb, 0x73eda3b3};
    static constexpr storage<limbs_count> inv22 = {0x00000401, 0x069003ff, 0x096e4fff, 0xcc5d8eb4,
                                                   0x2241b7de, 0xbd44b73b, 0x730030a1, 0x73eda583};
    static constexpr storage<limbs_count> inv23 = {0x00000201, 0x034801ff, 0x84b655ff, 0x100d995b,
                                                   0x95f1c7f2, 0xf83f47a1, 0x4e4ed6f4, 0x73eda66b};
    static constexpr storage<limbs_count> inv24 = {0x00000101, 0x01a400ff, 0x425a58ff, 0xb1e59eaf,
                                                   0xcfc9cffb, 0x95bc8fd4, 0x3bf62a1e, 0x73eda6df};
    static constexpr storage<limbs_count> inv25 = {0x00000081, 0x00d2007f, 0x212c5a7f, 0x82d1a159,
                                                   0x6cb5d400, 0x647b33ee, 0x32c9d3b3, 0x73eda719};
    static constexpr storage<limbs_count> inv26 = {0x00000041, 0x0069003f, 0x10955b3f, 0xeb47a2ae,
                                                   0x3b2bd602, 0xcbda85fb, 0x2e33a87d, 0x73eda736};
    static constexpr storage<limbs_count> inv27 = {0x00000021, 0x0034801f, 0x8849db9f, 0x1f82a358,
                                                   0xa266d704, 0xff8a2f01, 0xabe892e2, 0x73eda744};
    static constexpr storage<limbs_count> inv28 = {0x00000011, 0x001a400f, 0xc4241bcf, 0xb9a023ad,
                                                   0xd6045784, 0x99620384, 0xeac30815, 0x73eda74b};
    static constexpr storage<limbs_count> inv29 = {0x00000009, 0x000d2007, 0x62113be7, 0x06aee3d8,
                                                   0x6fd317c5, 0xe64dedc6, 0x8a3042ae, 0x73eda74f};
    static constexpr storage<limbs_count> inv30 = {0x00000005, 0x00069003, 0xb107cbf3, 0x2d3643ed,
                                                   0x3cba77e5, 0x8cc3e2e7, 0x59e6dffb, 0x73eda751};
    static constexpr storage<limbs_count> inv31 = {0x00000003, 0x00034801, 0x588313f9, 0x4079f3f8,
                                                   0xa32e27f5, 0xdffedd77, 0x41c22ea1, 0x73eda752};
    static constexpr storage<limbs_count> inv32 = {0x00000002, 0x0001a400, 0xac40b7fc, 0x4a1bcbfd,
                                                   0xd667fffd, 0x099c5abf, 0xb5afd5f5, 0x73eda752};

    static constexpr storage_array<omegas_count, limbs_count> inv = {
      inv1,  inv2,  inv3,  inv4,  inv5,  inv6,  inv7,  inv8,  inv9,  inv10, inv11, inv12, inv13, inv14, inv15, inv16,
      inv17, inv18, inv19, inv20, inv21, inv22, inv23, inv24, inv25, inv26, inv27, inv28, inv29, inv30, inv31, inv32,
    };
  };

  struct fq_config {
    // field structure size = 12 * 32 bit
    static constexpr unsigned limbs_count = 12;
    // modulus =
    // 4002409555221667393417789825735904156556882819939007885332058136124031650490837864442687629129015664037894272559787
    static constexpr storage<limbs_count> modulus = {0xffffaaab, 0xb9feffff, 0xb153ffff, 0x1eabfffe,
                                                     0xf6b0f624, 0x6730d2a0, 0xf38512bf, 0x64774b84,
                                                     0x434bacd7, 0x4b1ba7b6, 0x397fe69a, 0x1a0111ea};
    // modulus*2 =
    // 8004819110443334786835579651471808313113765639878015770664116272248063300981675728885375258258031328075788545119574
    static constexpr storage<limbs_count> modulus_2 = {0xffff5556, 0x73fdffff, 0x62a7ffff, 0x3d57fffd,
                                                       0xed61ec48, 0xce61a541, 0xe70a257e, 0xc8ee9709,
                                                       0x869759ae, 0x96374f6c, 0x72ffcd34, 0x340223d4};
    // modulus*4 =
    // 16009638220886669573671159302943616626227531279756031541328232544496126601963351457770750516516062656151577090239148
    static constexpr storage<limbs_count> modulus_4 = {0xfffeaaac, 0xe7fbffff, 0xc54ffffe, 0x7aaffffa,
                                                       0xdac3d890, 0x9cc34a83, 0xce144afd, 0x91dd2e13,
                                                       0xd2eb35d,  0x2c6e9ed9, 0xe5ff9a69, 0x680447a8};

    static constexpr storage<2 * limbs_count> modulus_wide = {
      0xffffaaab, 0xb9feffff, 0xb153ffff, 0x1eabfffe, 0xf6b0f624, 0x6730d2a0, 0xf38512bf, 0x64774b84,
      0x434bacd7, 0x4b1ba7b6, 0x397fe69a, 0x1a0111ea, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
      0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};

    // modulus^2
    static constexpr storage<2 * limbs_count> modulus_squared = {
      0x1c718e39, 0x26aa0000, 0x76382eab, 0x7ced6b1d, 0x62113cfd, 0x162c3383, 0x3e71b743, 0x66bf91ed,
      0x7091a049, 0x292e85a8, 0x86185c7b, 0x1d68619c, 0x0978ef01, 0xf5314933, 0x16ddca6e, 0x50a62cfd,
      0x349e8bd0, 0x66e59e49, 0x0e7046b4, 0xe2dc90e5, 0xa22f25e9, 0x4bd278ea, 0xb8c35fc7, 0x02a437a4};
    // 2*modulus^2
    static constexpr storage<2 * limbs_count> modulus_squared_2 = {
      0x38e31c72, 0x4d540000, 0xec705d56, 0xf9dad63a, 0xc42279fa, 0x2c586706, 0x7ce36e86, 0xcd7f23da,
      0xe1234092, 0x525d0b50, 0x0c30b8f6, 0x3ad0c339, 0x12f1de02, 0xea629266, 0x2dbb94dd, 0xa14c59fa,
      0x693d17a0, 0xcdcb3c92, 0x1ce08d68, 0xc5b921ca, 0x445e4bd3, 0x97a4f1d5, 0x7186bf8e, 0x05486f49};
    // 4*modulus^2
    static constexpr storage<2 * limbs_count> modulus_squared_4 = {
      0x71c638e4, 0x9aa80000, 0xd8e0baac, 0xf3b5ac75, 0x8844f3f5, 0x58b0ce0d, 0xf9c6dd0c, 0x9afe47b4,
      0xc2468125, 0xa4ba16a1, 0x186171ec, 0x75a18672, 0x25e3bc04, 0xd4c524cc, 0x5b7729bb, 0x4298b3f4,
      0xd27a2f41, 0x9b967924, 0x39c11ad1, 0x8b724394, 0x88bc97a7, 0x2f49e3aa, 0xe30d7f1d, 0x0a90de92};
    static constexpr unsigned modulus_bit_count = 381;
    // m = floor(2^(2*modulus_bit_count) / modulus)
    static constexpr storage<limbs_count> m = {0xd59646e8, 0xec4f881f, 0x8163c701, 0x4e65c59e, 0x80a19de7, 0x2f7d1dc7,
                                               0x7fda82a5, 0xa46e09d0, 0x331e9ae8, 0x38a0406c, 0xcf327917, 0x2760d74b};
    static constexpr storage<limbs_count> one = {0x00000001, 0x00000000, 0x00000000, 0x00000000,
                                                 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                 0x00000000, 0x00000000, 0x00000000, 0x00000000};
    static constexpr storage<limbs_count> zero = {0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                  0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                  0x00000000, 0x00000000, 0x00000000, 0x00000000};
    static constexpr storage<limbs_count> montgomery_r = {0x0005555,  0x60100000, 0xeac00004, 0x15400014,
                                                          0x94f09dbe, 0x8cf2d5f0, 0xc7aed409, 0xb88b47b0,
                                                          0xcb453289, 0x4e45849b, 0x6801965b, 0x5feee15c};
    static constexpr storage<limbs_count> montgomery_r_inv = {0x05c40fe,  0xaa212c9c, 0xccfd7e14, 0x70093ae9,
                                                              0xc85a96b4, 0x6d05c02d, 0x025fecd3, 0x1f193851,
                                                              0xeb48f4c6, 0x84d32f44, 0xed8ffb1a, 0xbefcc91e};
    // i^2, the square of the imaginary unit for the extension field
    static constexpr uint32_t i_squared = 1;
    // true if i^2 is negative
    static constexpr bool i_squared_is_negative = true;
    // G1 and G2 generators
    static constexpr storage<limbs_count> g1_gen_x = {0xdb22c6bb, 0xfb3af00a, 0xf97a1aef, 0x6c55e83f,
                                                      0x171bac58, 0xa14e3a3f, 0x9774b905, 0xc3688c4f,
                                                      0x4fa9ac0f, 0x2695638c, 0x3197d794, 0x17f1d3a7};
    static constexpr storage<limbs_count> g1_gen_y = {0x46c5e7e1, 0x0caa2329, 0xa2888ae4, 0xd03cc744,
                                                      0x2c04b3ed, 0x00db18cb, 0xd5d00af6, 0xfcf5e095,
                                                      0x741d8ae4, 0xa09e30ed, 0xe3aaa0f1, 0x08b3f481};
    static constexpr storage<limbs_count> g2_gen_x_re = {0xc121bdb8, 0xd48056c8, 0xa805bbef, 0x0bac0326,
                                                         0x7ae3d177, 0xb4510b64, 0xfa403b02, 0xc6e47ad4,
                                                         0x2dc51051, 0x26080527, 0xf08f0a91, 0x024aa2b2};
    static constexpr storage<limbs_count> g2_gen_x_im = {0x5d042b7e, 0xe5ac7d05, 0x13945d57, 0x334cf112,
                                                         0xdc7f5049, 0xb5da61bb, 0x9920b61a, 0x596bd0d0,
                                                         0x88274f65, 0x7dacd3a0, 0x52719f60, 0x13e02b60};
    static constexpr storage<limbs_count> g2_gen_y_re = {0x08b82801, 0xe1935486, 0x3baca289, 0x923ac9cc,
                                                         0x5160d12c, 0x6d429a69, 0x8cbdd3a7, 0xadfd9baa,
                                                         0xda2e351a, 0x8cc9cdc6, 0x727d6e11, 0x0ce5d527};
    static constexpr storage<limbs_count> g2_gen_y_im = {0xf05f79be, 0xaaa9075f, 0x5cec1da1, 0x3f370d27,
                                                         0x572e99ab, 0x267492ab, 0x85a763af, 0xcb3e287e,
                                                         0x2bc28b99, 0x32acd2b0, 0x2ea734cc, 0x0606c4a0};
  };

  static constexpr storage<fq_config::limbs_count> weierstrass_b = {0x00000004, 0x00000000, 0x00000000, 0x00000000,
                                                                    0x00000000, 0x00000000, 0x00000000, 0x00000000,
                                                                    0x00000000, 0x00000000, 0x00000000, 0x00000000};
  static constexpr storage<fq_config::limbs_count> weierstrass_b_g2_re = {
    0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
  static constexpr storage<fq_config::limbs_count> weierstrass_b_g2_im = {
    0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
} // namespace PARAMS_BLS12_381
