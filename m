Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04B3E4C7B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093668; cv=none; b=klZE5IrU0B/5gkm3mY+QBB0NVURo+vt8aTCxPG+lfxkfL8i0LA3uOpROf3pbhGEpYY8JM/WwhOJ9/NiDV3mjrItnF0Y/svL2/zT4lCxOBkXzsNfqB7qVQIXt9+UfUgPHpGSb5BwPNxnexWvAl84JdD0qR5oFufrLE2b9UBATuRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093668; c=relaxed/simple;
	bh=RZuZtaSSZR2YiKqvwXhNUTvBapW8zGRrbC8b0uJEjB8=;
	h=From:Date:Subject:Message-Id:In-Reply-To:References:To:Cc; b=q70mGS/FpwSNgHTPnVSD8ZdqAWj2i5+vSze71SS0ExFdI49LgNwZ9uXf3bfuVAKFqOQlJshft2qzyYuMZYPmY6zjMDG6Hkx+081YIjgy2RF/mQdpQZs1XUNzZmrMOLFVkwMtZ4Hnqk8QlczsGAGEgCvTt5MCbZa75H3HGyeeRhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+HoCCHf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+HoCCHf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-869ac301739so294810b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789093666; x=1789698466; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jrRmtzgJrhcnTyWN4ddzwpfMPQykj+K/5w8UnPOxI8g=;
        b=Q+HoCCHfTsvQ3Na9e1juYakfvpf0Wq6PW2UpwYFtkq9/kK5z12a10yG1mcdiYhYdQL
         5u88IWhsxDeXE/GIWcQazVOQbVqTU5iISAhyOE+AV6Juio8McRWPhvhuaDoZreOrIQ2J
         ayPsQGr+NAf5OzY8f2KEVYjGu9tFsQra6LS+8R4PJSkk+8Q7qtZM7+6fBBwsJklYxXgo
         zkg5duQn5YaTH23d6rz0I/2w+3VAMDVYIej9EUHRTKNc3VA7tYI7Jd6fvsDM7iW7Az0C
         s2ZOVf+na2jipfkFeyEbyPJjpwV8Blw5eDhbuSsy/aWO4vGb/J3MsH5IzYapGCBWMl1p
         ry0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789093666; x=1789698466;
        h=cc:to:references:in-reply-to:message-id:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrRmtzgJrhcnTyWN4ddzwpfMPQykj+K/5w8UnPOxI8g=;
        b=aW7aPy6hlvidCNfFu4YGh/niPeA5zzTC2VPmMeIk0w7/EB443zRqBbE1AyGDcY/nU5
         sZ0rTl6D7nJM9OxCzSorup/KFRGKDBdgz2jrw7CgTBsrqfawt++TwQOdpaZmQxwRP/BU
         MXmtBy3yL6xEuQ5SsTxynz0yXdppAePSC5f5wscohvH9QIAlIPIKNzdVGBgKFK1Lc9Mm
         WWCFdCqQzB+TQHPxznDLdJnMNZTMJpxblvQgpXao+onjO87Qa3dGetKmyBkzVHA+dtlt
         natkbIBqZk2tJBs9mx5K5roPj7eOvop+55Qm5nWTrpFHDsRlK12pc+jcmHXcrqgh0c7y
         37ZQ==
X-Gm-Message-State: AFuF++mOAHJhaZhUwt+5rCVKHw7LdKsNuXsg5kg3BJUAWJSourKaFiOy
	5ZUMydnGSZNwhF20M/CxwWvMal7zGItFfveRADQKgJsxo3c7ZiQKn4ti
X-Gm-Gg: AYBFou1gU/zIfG4BeYi5/xnkNWm58WKEuV2M3veJpueB6sASrbEU8Qzw8iGwAD2yrqH
	UHkxZL2VxXThtmJHrQE43zaQ3kID54jCkQYBiGWhe0e+tQTsNvmT53oJrGUGDULo817OTiKeZjJ
	uMtNma84PBlJsqYv+AZRJ2ecG7Lok0eAnjpIlAF6EQdng1x+K9UWLyamyjfJNEvYtPj6CeP2VF2
	D+2/LAOI1D//xOD6S/71y8/NjGcmaKAQcK7+2YUY9ijpBNfO8PntxZlxs+gW6L7IaJK0zhM/RZJ
	1DE3pVDLN6ow2cE8i4B3r6KSQ9OYxM6w3CH1oiniBrQO0rDAeXlUVUt0a07U+FIjyhQpp8NoKPo
	mMe/NZ5c951BlV1AX1MEvHGqqH6YeouxrMbYh/s/NanH9EdIHHDlmhSxV2NS9egD2XNIzmsHjRw
	sNxf4tqnypvqbomSU+wBL87+urhIWRjzXs4A5sBzK00ogvCgsViq+5sSGetWzYMuuQpagN05/JQ
	Y328+krfvofpz7XYTX2
X-Received: by 2002:a05:6a00:2da8:b0:853:59ed:5539 with SMTP id d2e1a72fcca58-86b3031c937mr2803613b3a.16.1789093665981;
        Thu, 10 Sep 2026 19:27:45 -0700 (PDT)
Received: from smtp.gmail.com ([185.151.146.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f70sm377098b3a.18.2026.09.10.19.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:27:45 -0700 (PDT)
From: "lichen.wang" <wanglichen9110@gmail.com>
Date: Thu, 10 Sep 2026 22:10:55 +0800
Subject: [PATCH 2/2] ubifs: add KUnit tests for key helpers
Message-Id: <178909365090.247910.18065335763055144004.p2-of-2@gmail.com>
In-Reply-To: <178909365090.247910.11265261850560199708.p0-of-2@gmail.com>
References: <178909365090.247910.11265261850560199708.p0-of-2@gmail.com>
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Add KUnit coverage for the key.h helpers: on-flash encoding and
decoding, comparison, the key constructors and the hash handling. These
are pure functions, so the whole set runs in the same offline KUnit
environment as the scan tests.

The tests reuse the fake struct ubifs_info from kunit_helpers.h, and
key_kunit.o is built into the ubifs module for the same reason as
scan_kunit.o: key.h needs no exported symbols, but the suite is kept
next to the code it tests.

Signed-off-by: lichen.wang <wanglichen9110@gmail.com>
---
 fs/ubifs/Makefile          |   2 +-
 fs/ubifs/tests/key_kunit.c | 555 +++++++++++++++++++++++++++++++++++++
 2 files changed, 556 insertions(+), 1 deletion(-)
 create mode 100644 fs/ubifs/tests/key_kunit.c

diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 4a83b822c..96e277611 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -6,7 +6,7 @@ ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o debug.o
 ubifs-y += misc.o sysfs.o
-ubifs-$(CONFIG_UBIFS_FS_KUNIT_TEST) += tests/scan_kunit.o
+ubifs-$(CONFIG_UBIFS_FS_KUNIT_TEST) += tests/scan_kunit.o tests/key_kunit.o
 ubifs-$(CONFIG_FS_ENCRYPTION) += crypto.o
 ubifs-$(CONFIG_UBIFS_FS_XATTR) += xattr.o
 ubifs-$(CONFIG_UBIFS_FS_AUTHENTICATION) += auth.o
diff --git a/fs/ubifs/tests/key_kunit.c b/fs/ubifs/tests/key_kunit.c
new file mode 100644
index 000000000..71d4fba70
--- /dev/null
+++ b/fs/ubifs/tests/key_kunit.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for fs/ubifs/key.h
+ *
+ * The tested helpers are self-contained, so they only need a zeroed fake
+ * struct ubifs_info; the ones which call c->key_hash use the test hash
+ * function installed by ubifs_test_info().
+ */
+
+#include <kunit/test.h>
+
+#include "kunit_helpers.h"
+
+/*
+ * Check that @buf holds the little-endian on-flash form of the key word pair
+ * (@v0, @v1).
+ */
+static void expect_le_key(struct kunit *test, const void *buf, u32 v0, u32 v1)
+{
+	__le32 expected[2];
+
+	expected[0] = cpu_to_le32(v0);
+	expected[1] = cpu_to_le32(v1);
+	KUNIT_EXPECT_MEMEQ(test, buf, expected, sizeof(expected));
+}
+
+/* ------------------------------------------------------------------------- */
+/* key_write() / key_read() / key_write_idx()                                 */
+/* ------------------------------------------------------------------------- */
+
+static void key_write_encodes_key_and_zeroes_tail(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0x12345678, 0x89ABCDEF } };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	u8 buf[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(buf, 0xaa, sizeof(buf));
+	key_write(c, &key, buf);
+
+	expect_le_key(test, buf, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, buf + 8, zero, sizeof(zero));
+}
+
+static void key_write_stays_within_sixteen_bytes(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0xDEADBEEF, 0xCAFEBABE } };
+	const u8 zero[8] = { 0 };
+	u8 guard[8];
+	u8 buf[32];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(guard, 0xaa, sizeof(guard));
+	memset(buf, 0xaa, sizeof(buf));
+	key_write(c, &key, buf + 8);
+
+	/* Nothing before the 16-byte key and nothing after it is written. */
+	KUNIT_EXPECT_MEMEQ(test, buf, guard, sizeof(guard));
+	KUNIT_EXPECT_MEMEQ(test, buf + 24, guard, sizeof(guard));
+	expect_le_key(test, buf + 8, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, buf + 16, zero, sizeof(zero));
+}
+
+static void key_read_reads_only_first_eight_bytes(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const u8 src[UBIFS_MAX_KEY_LEN] = {
+		0x78, 0x56, 0x34, 0x12, 0xef, 0xcd, 0xab, 0x89,
+		0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
+	};
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	key_read(c, src, &key);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x12345678);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x89ABCDEF);
+}
+
+static void key_write_read_roundtrip(struct kunit *test)
+{
+	static const u32 keys[][2] = {
+		{ 0x00000000, 0x00000000 },
+		{ 0x00000001, 0x00000000 },
+		{ 0xffffffff, 0xffffffff },
+		{ 0x12345678, 0x9abcdef0 },
+		{ 0xdeadbeaf, UBIFS_INVALID_KEY },
+	};
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key in, out;
+	u8 buf[UBIFS_MAX_KEY_LEN];
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	for (i = 0; i < ARRAY_SIZE(keys); i++) {
+		in.u32[0] = keys[i][0];
+		in.u32[1] = keys[i][1];
+		key_write(c, &in, buf);
+		key_read(c, buf, &out);
+		KUNIT_EXPECT_EQ(test, out.u32[0], in.u32[0]);
+		KUNIT_EXPECT_EQ(test, out.u32[1], in.u32[1]);
+	}
+}
+
+static void key_write_idx_does_not_zero_tail(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key = { .u32 = { 0x01020304, 0x05060708 } };
+	const u8 zero[8] = { 0 };
+	const u8 guard[8] = { 0xaa, 0xaa, 0xaa, 0xaa,
+			      0xaa, 0xaa, 0xaa, 0xaa };
+	u8 idx[UBIFS_MAX_KEY_LEN];
+	u8 full[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(idx, 0xaa, sizeof(idx));
+	memset(full, 0xaa, sizeof(full));
+	key_write_idx(c, &key, idx);
+	key_write(c, &key, full);
+
+	expect_le_key(test, idx, key.u32[0], key.u32[1]);
+	KUNIT_EXPECT_MEMEQ(test, idx, full, 8);
+	KUNIT_EXPECT_MEMEQ(test, idx + 8, guard, sizeof(guard));
+	KUNIT_EXPECT_MEMEQ(test, full + 8, zero, sizeof(zero));
+}
+
+static void key_copy_copies_whole_key(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key from = { .u32 = { 0x11223344, 0x55667788 } };
+	union ubifs_key to;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	to.u64[0] = 0;
+	key_copy(c, &from, &to);
+	KUNIT_EXPECT_EQ(test, to.u32[0], from.u32[0]);
+	KUNIT_EXPECT_EQ(test, to.u32[1], from.u32[1]);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &from, &to), 1);
+}
+
+/* ------------------------------------------------------------------------- */
+/* keys_cmp() / keys_eq()                                                     */
+/* ------------------------------------------------------------------------- */
+
+static void keys_cmp_orders_by_inum_first(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key k1 = { .u32 = { 1, 0xffffffff } };
+	union ubifs_key k2 = { .u32 = { 2, 0x00000000 } };
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k2), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k2, &k1), 1);
+}
+
+static void keys_cmp_orders_by_second_word(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key k1 = { .u32 = { 7, 0x00000000 } };
+	union ubifs_key k2 = { .u32 = { 7, 0x00000001 } };
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k2), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k2, &k1), 1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &k1, &k1), 0);
+}
+
+static void keys_cmp_and_keys_eq_agree(struct kunit *test)
+{
+	static const u32 pairs[][4] = {
+		{ 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
+		{ 0x00000001, 0x00000000, 0x00000001, 0x00000001 },
+		{ 0x00000001, 0x00000001, 0x00000001, 0x00000000 },
+		{ 0xffffffff, 0x00000000, 0x00000000, 0xffffffff },
+		{ 0x00000005, 0x40000000, 0x00000005, 0x40000000 },
+	};
+	struct ubifs_info *c = ubifs_test_info(test);
+	int i;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	for (i = 0; i < ARRAY_SIZE(pairs); i++) {
+		union ubifs_key a = { .u32 = { pairs[i][0], pairs[i][1] } };
+		union ubifs_key b = { .u32 = { pairs[i][2], pairs[i][3] } };
+		int cmp = keys_cmp(c, &a, &b);
+
+		KUNIT_EXPECT_EQ(test, cmp, -keys_cmp(c, &b, &a));
+		KUNIT_EXPECT_EQ(test, keys_eq(c, &a, &b), cmp == 0);
+	}
+}
+
+/* ------------------------------------------------------------------------- */
+/* Key constructors                                                           */
+/* ------------------------------------------------------------------------- */
+
+static void ino_key_init_sets_type_and_inum(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const ino_t inum = 0x12345678;
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	ino_key_init(c, &key, inum);
+	KUNIT_EXPECT_EQ(test, key.u32[0], inum);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_INO_KEY <<
+			UBIFS_S_KEY_BLOCK_BITS);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_INO_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum(c, &key), inum);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0);
+}
+
+static void ino_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	const ino_t inum = 0x12345678;
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	ino_key_init_flash(c, flash, inum);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	ino_key_init(c, &key, inum);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+}
+
+static void dent_key_init_sets_type_and_hash(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u32 hash = 0x00000005;
+	union ubifs_key key;
+	u32 expected;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	expected = c->key_hash(fname_name(&nm), fname_len(&nm));
+	KUNIT_EXPECT_LE(test, expected, UBIFS_S_KEY_HASH_MASK);
+
+	dent_key_init(c, &key, 0x1234, &nm);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x1234);
+	KUNIT_EXPECT_EQ(test, key.u32[1], expected |
+			(UBIFS_DENT_KEY << UBIFS_S_KEY_HASH_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DENT_KEY);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), expected);
+
+	dent_key_init_hash(c, &key, 0x1234, hash);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x40000005);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), hash);
+}
+
+static void dent_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	dent_key_init_flash(c, flash, 0x20, &nm);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	dent_key_init(c, &key, 0x20, &nm);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+	KUNIT_EXPECT_EQ(test, key_type(c, &out), UBIFS_DENT_KEY);
+}
+
+static void xent_key_init_sets_type_and_hash(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	union ubifs_key key;
+	u32 expected;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	expected = c->key_hash(fname_name(&nm), fname_len(&nm));
+	xent_key_init(c, &key, 0x1234, &nm);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x1234);
+	KUNIT_EXPECT_EQ(test, key.u32[1], expected |
+			(UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_XENT_KEY);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), expected);
+}
+
+static void xent_key_init_flash_zeroes_tail_and_roundtrips(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	const u8 zero[UBIFS_MAX_KEY_LEN - 8] = { 0 };
+	union ubifs_key key, out;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	memset(flash, 0xaa, sizeof(flash));
+	xent_key_init_flash(c, flash, 0x20, &nm);
+	KUNIT_EXPECT_MEMEQ(test, flash + 8, zero, sizeof(zero));
+
+	key_read(c, flash, &out);
+	xent_key_init(c, &key, 0x20, &nm);
+	KUNIT_EXPECT_EQ(test, keys_eq(c, &key, &out), 1);
+	KUNIT_EXPECT_EQ(test, key_type(c, &out), UBIFS_XENT_KEY);
+}
+
+static void data_key_init_sets_type_and_block(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	data_key_init(c, &key, 0x77, 0x12345);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x12345 |
+			(UBIFS_DATA_KEY << UBIFS_S_KEY_BLOCK_BITS));
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0x12345);
+}
+
+static void trun_key_init_sets_truncation_type(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	trun_key_init(c, &key, 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0x77);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_TRUN_KEY <<
+			UBIFS_S_KEY_BLOCK_BITS);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x80000000);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_TRUN_KEY);
+}
+
+static void invalid_key_init_sets_invalid_marker(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	invalid_key_init(c, &key);
+	KUNIT_EXPECT_EQ(test, key.u32[0], 0xDEADBEAF);
+	KUNIT_EXPECT_EQ(test, key.u32[1], UBIFS_INVALID_KEY);
+	KUNIT_EXPECT_EQ(test, key.u32[1], 0x00000004);
+	/* UBIFS_INVALID_KEY is not shifted, unlike UBIFS_TRUN_KEY. */
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_INO_KEY);
+}
+
+static void lowest_and_highest_keys_are_bounds(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key lino, hino, ldent, lxent, hdata, dzero;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	lowest_ino_key(c, &lino, 1);
+	highest_ino_key(c, &hino, 1);
+	lowest_dent_key(c, &ldent, 1);
+	lowest_xent_key(c, &lxent, 1);
+	highest_data_key(c, &hdata, 1);
+	data_key_init(c, &dzero, 1, 0);
+
+	KUNIT_EXPECT_EQ(test, lino.u32[1], 0x00000000);
+	KUNIT_EXPECT_EQ(test, hino.u32[1], 0xffffffff);
+	KUNIT_EXPECT_EQ(test, ldent.u32[1], 0x40000000);
+	KUNIT_EXPECT_EQ(test, lxent.u32[1], 0x60000000);
+	KUNIT_EXPECT_EQ(test, hdata.u32[1], 0x3fffffff);
+
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &lino, &dzero), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &dzero, &hdata), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &hdata, &ldent), -1);
+	KUNIT_EXPECT_EQ(test, keys_cmp(c, &ldent, &lxent), -1);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Key accessors                                                              */
+/* ------------------------------------------------------------------------- */
+
+static void key_accessors_roundtrip(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+	u8 flash[UBIFS_MAX_KEY_LEN];
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	data_key_init(c, &key, 0x77, 0x12345);
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum(c, &key), 0x77);
+	KUNIT_EXPECT_EQ(test, key_hash(c, &key), 0x12345);
+	KUNIT_EXPECT_EQ(test, key_block(c, &key), 0x12345);
+
+	key_write(c, &key, flash);
+	KUNIT_EXPECT_EQ(test, key_type_flash(c, flash), UBIFS_DATA_KEY);
+	KUNIT_EXPECT_EQ(test, key_inum_flash(c, flash), 0x77);
+	KUNIT_EXPECT_EQ(test, key_hash_flash(c, flash), 0x12345);
+	KUNIT_EXPECT_EQ(test, key_block_flash(c, flash), 0x12345);
+}
+
+static void highest_ino_key_type_is_out_of_range(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	highest_ino_key(c, &key, 1);
+	/* 7 is the sorting upper bound, not a valid key type. */
+	KUNIT_EXPECT_EQ(test, key_type(c, &key), 7);
+	KUNIT_EXPECT_GT(test, key_type(c, &key), UBIFS_KEY_TYPES_CNT - 1);
+}
+
+static void is_hash_key_identifies_hashed_keys(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+	struct fscrypt_name nm = { .disk_name = FSTR_INIT("abc", 3) };
+	union ubifs_key key;
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	ino_key_init(c, &key, 1);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+	data_key_init(c, &key, 1, 0);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+	dent_key_init_hash(c, &key, 1, 3);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 1);
+	xent_key_init(c, &key, 1, &nm);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 1);
+	trun_key_init(c, &key, 1);
+	KUNIT_EXPECT_EQ(test, is_hash_key(c, &key), 0);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Hash helpers                                                               */
+/* ------------------------------------------------------------------------- */
+
+static void key_mask_hash_maps_reserved_values(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0), 3);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(1), 4);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(2), 5);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(3), 3);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0x1fffffff), 0x1fffffff);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0xffffffff), 0x1fffffff);
+	KUNIT_EXPECT_EQ(test, key_mask_hash(0x20000002), 5);
+}
+
+static void key_r5_hash_invariants(struct kunit *test)
+{
+	static const char *const names[] = { "", "a", "abc", "file", "name" };
+	int i;
+
+	/* An empty name hashes to the first non-reserved value. */
+	KUNIT_EXPECT_EQ(test, key_r5_hash("", 0), 3);
+
+	for (i = 0; i < ARRAY_SIZE(names); i++) {
+		const char *name = names[i];
+		int len = strlen(name);
+		u32 h = key_r5_hash(name, len);
+
+		KUNIT_EXPECT_GE(test, h, 3);
+		KUNIT_EXPECT_LE(test, h, UBIFS_S_KEY_HASH_MASK);
+		KUNIT_EXPECT_EQ(test, h, key_r5_hash(name, len));
+	}
+}
+
+static void key_test_hash_invariants(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, key_test_hash("", 0), 3);
+	KUNIT_EXPECT_GE(test, key_test_hash("abc", 3), 3);
+	KUNIT_EXPECT_LE(test, key_test_hash("abc", 3),
+			UBIFS_S_KEY_HASH_MASK);
+
+	/* Only the first four bytes of the name are read. */
+	KUNIT_EXPECT_EQ(test, key_test_hash("abcd", 100),
+			key_test_hash("abcd", 4));
+	KUNIT_EXPECT_EQ(test, key_test_hash("abcd", 100),
+			key_test_hash("abcd", 5));
+}
+
+static void key_max_inode_size_depends_on_key_fmt(struct kunit *test)
+{
+	struct ubifs_info *c = ubifs_test_info(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, c);
+
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c), 2199023255552ULL);
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c),
+			(1ULL << UBIFS_S_KEY_BLOCK_BITS) * UBIFS_BLOCK_SIZE);
+
+	/* An unknown key format has no size limit to report. */
+	c->key_fmt = 1;
+	KUNIT_EXPECT_EQ(test, key_max_inode_size(c), 0);
+}
+
+/* ------------------------------------------------------------------------- */
+/* Test suite registration                                                    */
+/* ------------------------------------------------------------------------- */
+
+static struct kunit_case ubifs_key_test_cases[] = {
+	KUNIT_CASE(key_write_encodes_key_and_zeroes_tail),
+	KUNIT_CASE(key_write_stays_within_sixteen_bytes),
+	KUNIT_CASE(key_read_reads_only_first_eight_bytes),
+	KUNIT_CASE(key_write_read_roundtrip),
+	KUNIT_CASE(key_write_idx_does_not_zero_tail),
+	KUNIT_CASE(key_copy_copies_whole_key),
+	KUNIT_CASE(keys_cmp_orders_by_inum_first),
+	KUNIT_CASE(keys_cmp_orders_by_second_word),
+	KUNIT_CASE(keys_cmp_and_keys_eq_agree),
+	KUNIT_CASE(ino_key_init_sets_type_and_inum),
+	KUNIT_CASE(ino_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(dent_key_init_sets_type_and_hash),
+	KUNIT_CASE(dent_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(xent_key_init_sets_type_and_hash),
+	KUNIT_CASE(xent_key_init_flash_zeroes_tail_and_roundtrips),
+	KUNIT_CASE(data_key_init_sets_type_and_block),
+	KUNIT_CASE(trun_key_init_sets_truncation_type),
+	KUNIT_CASE(invalid_key_init_sets_invalid_marker),
+	KUNIT_CASE(lowest_and_highest_keys_are_bounds),
+	KUNIT_CASE(key_accessors_roundtrip),
+	KUNIT_CASE(highest_ino_key_type_is_out_of_range),
+	KUNIT_CASE(is_hash_key_identifies_hashed_keys),
+	KUNIT_CASE(key_mask_hash_maps_reserved_values),
+	KUNIT_CASE(key_r5_hash_invariants),
+	KUNIT_CASE(key_test_hash_invariants),
+	KUNIT_CASE(key_max_inode_size_depends_on_key_fmt),
+	{}
+};
+
+static struct kunit_suite ubifs_key_test_suite = {
+	.name = "ubifs-key",
+	.test_cases = ubifs_key_test_cases,
+};
+
+kunit_test_suite(ubifs_key_test_suite);
-- 
2.43.0


