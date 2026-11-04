Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763986;
	b=xo9dGnHwn7Z0Z3uLp6hS/aczKRnWrAFuBODkDXcCunaX3X+8aVGQfaw1AiR6Wq+LKYti
	 E+GFaMrwqOjR6XZIo+cRdNjZw7w2NRWhYeo3XpChf20JvQUINj+biGQPwcg6QRFbD0atf
	 AtVobz3vZIUUuUvACLw5ODfwub6+/JdNeYRmqFVl3CXCLOcN3zcRJfVWL5UwrPxYRfkB+
	 jNtg2SneopgKJZquzW6tQCIp0BlD/9NdjRKfpL1CdyuGcUcXHu7RDqB2bzdvguecRrA7m
	 W9A39U62yLhvAin+dYs5ySdmMuwa9CiDFz5eN0+54jMNwJFKl/sNQyEWSJXpuoyLoJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cPyjzrLxXwGGm06CwHQCWWTm8AUJ7SVjwiiyoo6HSCE=;
	b=iiJIXbFQRSpscmlElQRM+USzSTb31YlyVUGQv8VYxLndmeH3/UhRBhTJbdXTmHMKXYa5
	 Zw9/u3utUCD/4Vlv/Tld5ndOxzoRfcnbJvycutYg/J7NmqrjVygoTvhiBX9oETGpTIGnC
	 AwXssFDrYiaHBfZB+sl5eOEgxgjockJVrc4QgWGcaNsXBtmOelAm4OGMVRq2kN/pBvqA2
	 Gy17bux8ZN/h9pW+xdQeuTNQIOHnvaT+eJ5HLRI4sOT129kX/6OJGcygncUTr9YKb5R6K
	 9c3/YqiGbNyzLMxlfe5mlHQ4cXmusiSsbhMbRmYBvUl0zzSqw5dr0KfU7S7t0GpNUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n+KRKiLF;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6E606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA6E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n+KRKiLF
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b118bea471so1979267b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1793763985; x=1794368785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPyjzrLxXwGGm06CwHQCWWTm8AUJ7SVjwiiyoo6HSCE=;
        b=n+KRKiLFVw3fuxocD3w8AwP09lJ+LToZY7bcpUPR0+BUnATJSm3lD72izayogPqpPM
         zw9hmjFl8mJg9fNJ3Bvv+PCIAqaMzYKLXsMOadyxt0/XTHkBgVeGqpv7V+ccSEnEnXUj
         uqs/hUzb0uVEfWK1XVfgOM8x8lDeGW9cB6bIK6WjUaWJ6oCDtoyhzWxiYKv4SXt24A9n
         k0wx1aeFHq0RsQqBWaT9Q54QKBl/rS4+ecJc7PFYUANKd6JHIfpcGeuvXW5L15uuTpVA
         OdMs3CTOms3jd8NwjR8zNnFf4aarX3bYvaiFKtvpRYD/nfeiW2z+3oBP7IP+qAc3dWCa
         FesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763985; x=1794368785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPyjzrLxXwGGm06CwHQCWWTm8AUJ7SVjwiiyoo6HSCE=;
        b=C0s6xGJPe9X850XAdGbEeFCaX56ZpPGp/klxOa1yeJriEiALP2C6bmBl2vVqN79zvr
         6+ECQ6w1ozS0hqLbj7cBRZSCRFpSNuwiZ21FT8ItfqiLKfPKnbJON5nHzlStekZ7pmO7
         PL3Q26u5sXRzQTv4DtWB9hPhx/WlbvYDxPu4rIMF9AYIhJK7wYIl6FR8wR1jJdpNaaKX
         nmiwz7cx8xGp0h4oQI/zp7FnhjilW5mysPC085XtoUVJJiGaR3b4R2tccKE7NWtlqrPV
         oJQzJqc9RuYEGpiak8aW/iQ4HD7LRyd+ePGToGK9/iyEFz00ymU7+//cSpTwI/0K4YPv
         w8FQ==
X-Forwarded-Encrypted: i=1; AKwUvByiYxhpTjrmNeDtS6uNHrjtgUF71JQxShNDaYfc63PBORajYOgfobZPFSFKBPYfPJdIuvWxa/FMQzjyS6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z//huAvaf4aKGEx9ax5+yuQBdKFCYhS74HTYV7wnz/bPSoMg0BK
	GJDCSmbi4ULK6ecu3Qq5dv/dc2vLZlR7Ulhw62UmoBtVeZP3IGbciVXO3Bm1eeVCGRY=
X-Gm-Gg: AYBFou0g6d0pGYg/66/3w+6AtqDUPuF4l5jUbjQclZre7rg43lTljmYSbq3J6LBDwEa
	zYxY0rlYIvZR8bxNnuxBxa6LrbVi/8p8DN+bAwzuKsAPjcgN6BO3v6L8Mq7qtnTnMVQ3yjzroct
	St/B32C26GYdlaxSE05CvZ2EZm9EZzSWxmb8VcbsMhmm/lp1NuoYlDtTA/cMim2V4gurwOjgerh
	paTaZZ5ist9X8OL1bqZrIY3DzYMCwEH6pcEnbTP+cYw/rwRi+en6/lKEvRqnp906aOZ/51yGkkk
	JYdMXCaRo1wKd8QklqioQ5Fn9h8+CV18vr9vhoVfRRX3J/QzY3vk871HsEurFZFgR8UM8BhUY1P
	Yio1wh6cLSbqY9OMYumAGAqfnlgUZhKlUNozBsw8ckOMTmQ/u5TyqK89gvzEgp7ci9/Q+5GwECt
	lNdbc2ThwehbGP7qW4w0O5aDcn3Kth5ulbS9ctBGyHOq4wtWlgiVONhii537EVA1urxWIfy0qs6
	9g9b5ewQjHewP+XGxWFRKXvCVHt83Vgvextz1Degk0PgVEsbaEeLqCf8QRv7UUUYlX2aZbVfrFc
	nW1F/tTgIEtKXqxU44W4qwdDp/whjbm3OvNk1m08Ne6cdC68t91cq032b8CIp4tT5ROHPsSIbNC
	KhD3UHtnPxsm4C49pyB2w3Ce2NxpohfWFhiTGNAVhdTFUfQjSw7pYU7rznxk=
X-Received: by 2002:a05:690c:c513:b0:8b0:a857:654f with SMTP id 00721157ae682-8b2b67b73cemr101835337b3.63.1793763984905;
        Tue, 03 Nov 2026 19:46:24 -0800 (PST)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:1921:d22d:3124:a258])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309711412sm10918117b3.3.2026.11.03.19.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:46:24 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 2/2] hfsplus: add KUnit check for hidden directory name
Date: Tue,  3 Nov 2026 19:46:05 -0800
Message-ID: <20261104034605.1582293-3-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104034605.1582293-1-slava@dubeyko.com>
References: <20261104034605.1582293-1-slava@dubeyko.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hidden directory is created and looked up by means of
precomputed UTF-16 name hfsplus_hidden_dir_name_utf16, while its
Linux representation HFSP_HIDDENDIR_NAME_UTF8 is still used
elsewhere. Add regression test that checks that hfsplus_asc2uni()
converts HFSP_HIDDENDIR_NAME_UTF8 with utf8 nls table into exactly
the same UTF-16 string, with decomposition enabled and disabled.
In particular, it checks that every U+2400 (SYMBOL FOR NULL) of
HFSP_HIDDENDIR_NAME_UTF8 is stored as U+0000 (NUL), as macOS
expects, and that the length of the converted name is
HFSP_HIDDENDIR_NAME_UTF16_LEN.

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfsplus/hfsplus_fs.h   |  1 +
 fs/hfsplus/super.c        |  4 ++-
 fs/hfsplus/unicode_test.c | 55 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index e2d3f488142b..dd88053cc9b3 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -487,6 +487,7 @@ int hfs_part_find(struct super_block *sb, sector_t *part_start,
 		  sector_t *part_size);
 
 /* super.c */
+extern const struct hfsplus_unistr hfsplus_hidden_dir_name_utf16;
 struct inode *hfsplus_iget(struct super_block *sb, unsigned long ino);
 void hfsplus_mark_mdb_dirty(struct super_block *sb);
 void hfsplus_prepare_volume_header_for_commit(struct hfsplus_vh *vhdr);
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 57858d8685ff..4e878641fb59 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/vfs.h>
 #include <linux/nls.h>
+#include <kunit/visibility.h>
 
 static struct inode *hfsplus_alloc_inode(struct super_block *sb);
 static void hfsplus_free_inode(struct inode *inode);
@@ -406,7 +407,7 @@ static int hfsplus_statfs(struct dentry *dentry, struct kstatfs *buf)
  * by U+2400 (SYMBOL FOR NULL). The catalog key of the hidden directory
  * must not depend on the nls table of the mount.
  */
-static const struct hfsplus_unistr hfsplus_hidden_dir_name_utf16 = {
+const struct hfsplus_unistr hfsplus_hidden_dir_name_utf16 = {
 	.length = cpu_to_be16(HFSP_HIDDENDIR_NAME_UTF16_LEN),
 	.unicode = {
 		/* unicode[0 .. HFSP_HIDDENDIR_NUL_COUNT - 1] are U+0000 */
@@ -420,6 +421,7 @@ static const struct hfsplus_unistr hfsplus_hidden_dir_name_utf16 = {
 		cpu_to_be16('a'),
 	},
 };
+EXPORT_SYMBOL_IF_KUNIT(hfsplus_hidden_dir_name_utf16);
 
 /*
  * Create the hidden directory that keeps the indirect node files
diff --git a/fs/hfsplus/unicode_test.c b/fs/hfsplus/unicode_test.c
index a683c6d5fc22..cb237a40c0c3 100644
--- a/fs/hfsplus/unicode_test.c
+++ b/fs/hfsplus/unicode_test.c
@@ -1165,6 +1165,60 @@ static void hfsplus_asc2uni_legacy_seq_fixup_test(struct kunit *test)
 	free_mock_sb(mock_sb);
 }
 
+/*
+ * Test that the precomputed Unicode name of the hidden directory is
+ * exactly what hfsplus_asc2uni() produces from HFSP_HIDDENDIR_NAME_UTF8
+ * with utf8 nls table. Otherwise, the catalog key of the hidden
+ * directory created or looked up by the driver will not match the key
+ * that macOS (and older versions of the driver) uses for this folder.
+ * The result must not depend on the decomposition setting either.
+ */
+static void hfsplus_hidden_dir_name_test(struct kunit *test)
+{
+	struct test_mock_sb *mock_sb;
+	struct hfsplus_unistr ustr;
+	const struct hfsplus_unistr *expected = &hfsplus_hidden_dir_name_utf16;
+	u16 len = be16_to_cpu(expected->length);
+	int result;
+
+	mock_sb = setup_mock_sb();
+	KUNIT_ASSERT_NOT_NULL(test, mock_sb);
+
+	mock_sb->nls.char2uni = test_char2uni_utf8;
+
+	KUNIT_EXPECT_EQ(test, HFSP_HIDDENDIR_NAME_UTF16_LEN, len);
+
+	/* Decomposition is enabled by default */
+	memset(&ustr, 0, sizeof(ustr));
+	result = hfsplus_asc2uni(&mock_sb->sb, &ustr, HFSPLUS_MAX_STRLEN,
+				 HFSP_HIDDENDIR_NAME_UTF8,
+				 HFSP_HIDDENDIR_NAME_UTF8_LEN,
+				 HFS_REGULAR_NAME);
+
+	KUNIT_EXPECT_EQ(test, 0, result);
+	KUNIT_EXPECT_EQ(test, len, be16_to_cpu(ustr.length));
+	KUNIT_EXPECT_MEMEQ(test, expected->unicode, ustr.unicode,
+			   len * sizeof(ustr.unicode[0]));
+	KUNIT_EXPECT_EQ(test, 0, hfsplus_strcmp(expected, &ustr));
+
+	/* The same name with disabled decomposition */
+	set_bit(HFSPLUS_SB_NODECOMPOSE, &mock_sb->sb_info.flags);
+
+	memset(&ustr, 0, sizeof(ustr));
+	result = hfsplus_asc2uni(&mock_sb->sb, &ustr, HFSPLUS_MAX_STRLEN,
+				 HFSP_HIDDENDIR_NAME_UTF8,
+				 HFSP_HIDDENDIR_NAME_UTF8_LEN,
+				 HFS_REGULAR_NAME);
+
+	KUNIT_EXPECT_EQ(test, 0, result);
+	KUNIT_EXPECT_EQ(test, len, be16_to_cpu(ustr.length));
+	KUNIT_EXPECT_MEMEQ(test, expected->unicode, ustr.unicode,
+			   len * sizeof(ustr.unicode[0]));
+	KUNIT_EXPECT_EQ(test, 0, hfsplus_strcmp(expected, &ustr));
+
+	free_mock_sb(mock_sb);
+}
+
 /* Mock dentry for testing hfsplus_hash_dentry */
 static struct dentry test_dentry;
 
@@ -1873,6 +1927,7 @@ static struct kunit_case hfsplus_unicode_test_cases[] = {
 	KUNIT_CASE(hfsplus_unicode_combining_reorder_roundtrip_test),
 	KUNIT_CASE(hfsplus_asc2uni_legacy_decomp_test),
 	KUNIT_CASE(hfsplus_asc2uni_legacy_seq_fixup_test),
+	KUNIT_CASE(hfsplus_hidden_dir_name_test),
 	KUNIT_CASE(hfsplus_hash_dentry_basic_test),
 	KUNIT_CASE(hfsplus_hash_dentry_casefold_test),
 	KUNIT_CASE(hfsplus_hash_dentry_special_chars_test),
-- 
2.43.0

