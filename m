Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675239;
	b=VILakEDIYH3KCauuf5Ceo4gShsKG4mEzFcZZZILVsFynuP45EthxgVnV01+TLY35sWYg
	 /346ZusU5+tIqd9bPISbmnZ7a60pflLF0XKyu+POH1h+fF38YzRhZiNIvzR1tBFlITcdI
	 4p5xOPP8tPfwHXStIwE0EVYd0ksbFW7TR6CFl5WFOHXbvBuQC2/HQGyJRSCXT57KYa0yQ
	 h4az3o5/jsNaRJmOPvjNbLuqw/Uj1xvHbUbrR6JGeigOKSmSzqYUTN1Gz46N1tqkp5o4W
	 5E5/fITqWT60u1XxDGv340dB0qJYCElyy3RPhwFnOTV7KLz+c24ZPke7DoRNNPvzWzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HpRBkZWND8kAqnAVXLSY+m+WbnEs0skB5MrleQMApE=;
	b=C8jFwfrCctzQN3M8jlDMs2UHjUNKrb7JMDSQXjY3D9rp/fZmMbSEIm2sILenO7nQaj0C
	 ewM15rY9y7pp9YPJ1DnYJ5/HN10ycfgIgZbSpi+WwCVekVq/l+WviUV/UQEl9Mi1B7wBi
	 5bBdHnJ068WdjCPmXc0W5LPB0f2LosXhiqydT/Tdrm5fDkUB2pYbzyKrnhdh/FH/fYdTh
	 eyHoT3L/y5/zsesKCo3AImttqzNV1I84hXpTxnOHRJl6in4Nifj7b0+0OMbjr4R3rEzVP
	 /FvECz7eSd1LVdW3dadzjsGVjqWk1Us3uBt+4syuG0nOsCQYFLQ1t5N9e2ZxLxSEwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaAucoMA;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19435606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19435606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaAucoMA
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a058315c79so1731454b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675238; x=1794280038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HpRBkZWND8kAqnAVXLSY+m+WbnEs0skB5MrleQMApE=;
        b=UaAucoMAtxIS0vX25M4GZfjBxd3zVK2jAok3co7+iXUdys43rBzz7gtP8VTJK7JhZX
         mZEEz0sTjjzQqo12p/PGU4RJtm8HiD/fVBTN2qpHIeASoU/UnrvnE6dOohx9QwbRzj5O
         sdfpPeWmMic6rt1W2YUGo74BDos90TGcznEI8npgwbRCN+dSHepPOnHejLnLn1peMFpf
         NAFXzus0ZCbAVT8GWspSCjoAStj2gwtxJBPH3BQP3vNi1ySqQbSHS3Q1BU2cJuGQrXzs
         YpJP3Kn5k3RVTRH1sc5jyJurgdLd0DDSZeYRwYXxQrTOOxffaA/ctlrvmyH/elAMyAcK
         yPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675238; x=1794280038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HpRBkZWND8kAqnAVXLSY+m+WbnEs0skB5MrleQMApE=;
        b=g87VLhpCT3CpNXF/yLH8OjXWbBVj7uJQ0gXLiOPVkDEEeQM2GX8mI1oR2v6yjsZIlw
         GYUh2eaFOBSeFsUL5+I1tdR2S0Jo0jZhA8kVUQW6yFkqb3M23noPX97ezhlgJkh3ArYS
         pK7uSYVy7nOvK/WT4bWhFepvsxwYZLO/bcxC+qOY95/X49yqIAPo0cW403TWhvDMjUdB
         i2WxSZfNr/3K1czgZJeT5gLuvZ9OkApPCJn1VTN8si7PFntpvPEmADSbYLSWKBc4opRE
         HgYIv+MdbrdxjjoDa6qI9ZpeflVx5RgStypFTHmD9pPwvNM3avLg/rY3qK9Za7CRtt+L
         jJVg==
X-Forwarded-Encrypted: i=1; AKwUvBxNIwIYS47dnwZ0QkEEt7IuKYPAAcXB7KCiwD2D9h7i8vsZMUNd93qOSxx01WzCLhljWqIrBpfRm87eUd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZhIcpcR5aKhN9x2bto3+k7URU/6DjnqMAk7jwAYTMZ97NTf9U
	rz6eAJsC4WLkhaTbK5AMA9YtYLZzT3ps8vaNssNY6FuzmMZmsXEjJyNP
X-Gm-Gg: AYBFou31MXXD2gUVHvEiG9jPJ/oJqpUdGxoRSe/2zNAwRPW40dz6MFOOsobg3Dk5/wO
	MADI8kwGSALwg7ZQqNNNOvLrtcanZA4OtougsH+iA6dStj6mExxT1b2H2TwxquvihYI+86gd9t+
	exxpreMxSQLakwAKBJOStKFYNd9qqzDwo6B47e8+EcfPe+Dnp+zCAsj+HsOH6Fv3wCWriz7qayZ
	jHTjpchkL43NR3B2gtJDHTFkIHITdSzTWMWYoSmMbV5+F/a4+Cv+skykwzjV3HxtUoo4YuTbsz8
	82gA/Uu9HdQMx5g8jAcZMaZPD+Xc9J6NlsE3FVGsXAAry12PspsBmryzi95Z6qm+Dmv/A1v1uyP
	50ty337DWA6IHf15f7fBMHthOLEI2byFL2RzCkVuSZ7F7LYZtEWk6Edj3SZDNYcTnb4UIOobNqQ
	NxPnvpJNFb1K/joLwz7btLTJY0qF8PZ97ION64KGACjC59ZZErCesBita9K0IraDZZStqhZ4824
	bR+DKy0ijYqJlniko4Se58TZho0jKI+WI1DmJSHAQzvctygVseVcOlOyG387N6bFDXaiVE80Cl+
	qkpE2FUzgrOxRo+8fN6PTdVOnaEm903Qu9ONlCdKyTmG8A==
X-Received: by 2002:a05:6a21:e181:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3e928d4401bmr7514623637.23.1793675238189;
        Mon, 02 Nov 2026 19:07:18 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364ac001sm511302a12.25.2026.11.02.19.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:07:17 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	andrealmeid@igalia.com,
	qkrwngud825@gmail.com,
	zhanxusheng@xiaomi.com
Subject: [RFC PATCH] f2fs: fold casefolded names of F2FS_NAME_LEN bytes
Date: Tue,  3 Nov 2026 11:07:12 +0800
Message-ID: <20261103030712.1514800-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

utf8_casefold() needs room for the terminating NUL, but
f2fs_init_casefolded_name() gives it only F2FS_NAME_LEN bytes, so a
name that folds to exactly 255 bytes is not folded. In a casefolded
directory, creating 'A' x 255 fails with EINVAL under utf8:strict.
Without strict, after creating 'A' x 255, stat of 'a' x 255 returns
ENOENT and creating it adds a second entry.

Fold into F2FS_NAME_LEN + 1 bytes. Existing entries for these names
are hashed by the name as given, so on a miss also try that hash.

Fixes: 43c780ba2624 ("f2fs: rework filename handling")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
RFC because new entries for these names get a different hash on disk.
Results in a VM, with dentries dropped before each stat:

                                 'A'x255  'a'x255  'C'x255  'c'x255
  current kernel creates 'A'        ok    ENOENT
  this patch creates 'C', 'c'       ok    ENOENT     ok       ok
                                    (one 'c' entry)
  back on the current kernel        ok    ENOENT   ENOENT   ENOENT
  strict, current kernel        create 'S' x 255: EINVAL
  strict, this patch            create ok, found in both cases

Each fsck.f2fs version matches only one side. 1.16 folds into PATH_MAX
and rewrote 'A' to the folded hash, after which the current kernel
cannot find it. The dev branch rewrote 'C' to the raw hash, after
which this patch finds it only as 'C'. fsck would need to accept both
hashes for these names. Encrypted directories are not tested.

Is the second lookup acceptable? The alternative is to keep hashing
these names as given, which fixes the EINVAL but leaves them
case-sensitive.

 fs/f2fs/dir.c   | 21 ++++++++++++++++++++-
 fs/f2fs/super.c |  2 +-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 70847313ca6a..05ae0fa2e22b 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -76,7 +76,7 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 			return -ENOMEM;
 
 		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
-				    buf, F2FS_NAME_LEN);
+				    buf, F2FS_NAME_LEN + 1);
 		if (len <= 0) {
 			kmem_cache_free(f2fs_cf_name_slab, buf);
 			if (sb_has_strict_encoding(sb))
@@ -359,6 +359,10 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 	unsigned int max_depth;
 	unsigned int level;
 	bool use_hash = true;
+#if IS_ENABLED(CONFIG_UNICODE)
+	struct f2fs_filename raw;
+	bool raw_tried = false;
+#endif
 
 	*dentry_block = NULL;
 
@@ -389,6 +393,21 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
+	/*
+	 * Entries for names that fold to F2FS_NAME_LEN bytes used to be
+	 * hashed by the name as given.  Try that hash too.
+	 */
+	if (!de && !IS_ERR(*dentry_block) && use_hash && !raw_tried &&
+	    IS_CASEFOLDED(dir) && fname->cf_name.name &&
+	    fname->cf_name.len == F2FS_NAME_LEN) {
+		raw = *fname;
+		raw.cf_name.name = NULL;
+		f2fs_hash_filename(dir, &raw);
+		raw.cf_name = fname->cf_name;
+		fname = &raw;
+		raw_tried = true;
+		goto start_find_entry;
+	}
 	if (f2fs_should_fallback_to_linear(dir) &&
 		IS_CASEFOLDED(dir) && !de && use_hash) {
 		use_hash = false;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78dbf1e92285..4172429da862 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -505,7 +505,7 @@ struct kmem_cache *f2fs_cf_name_slab;
 static int __init f2fs_create_casefold_cache(void)
 {
 	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
-						   F2FS_NAME_LEN);
+						   F2FS_NAME_LEN + 1);
 	return f2fs_cf_name_slab ? 0 : -ENOMEM;
 }
 
-- 
2.43.0

