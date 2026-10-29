Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306130;
	b=gBjkGPue3sI/oi3uJnVvONVcROy9D2ZDNv45njHIG8rGkeZd8qGxLFwOPMyiQeXpzvNl
	 JkRFbHtPHJyUwi7LYWHc8RMhY/BOQjOsq15LJJes6kPJD1bhDvT9UOPTp0e2aKPTzGA0Z
	 E/pTTS31u3NW+Z/jrDufw0qGILldWzZTGNtb9fugOtE/spg+o4+eXhA5sVJA9SOg9J+Ai
	 xXAs7DFa184kCdvkGX3Qi0S+3yuO8yTYgSQ/pPxLb8rEtBQ9EuYiaZeUOvL2aifAP5zft
	 s7lmYo/fA5ulh+uowwNTmX9cEWGQsT9LEnxlifcGPUc6EiqrmGOfbrZMpNNzA5EDzMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
	b=b5spdt9FHLziRf09Ft3tGVg9tbf0/RwLekBqO2idA39pVbqWqCk82Tqc8QNJw7JbzevP
	 zk8agBZjMw7tC26Lrr5ZO9yFfx7rGcMjH7zDs9UukwMEMVjxccorAaydEb6v71VE2ZpbG
	 AxDP5KVwfkVTAUs7T1v6U1XO1aS2TDBNjEqWY2xwQNedHyN/2GAYofIZmMVHkVpEofLW+
	 6NL1NYVVKTc9PFFyylgfIqwBsb33+OwivIGu2gOY60gzwVdxwMrFXzW3jzq5lbf40QKB/
	 i6UYjlIhu+4DXIX98Xzj1mY+scU3DaRMxd9S9tJKxOL7Uk+ITG4G8vJhbZwDoeHkzzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zfElnprs;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B860A2616
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3B860A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zfElnprs
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so37012eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793306129; x=1793910929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
        b=zfElnprs3bd8FJhhaiq9y++DLA1RQ7UXviuuuoo6gneNaTe5X1ECba6IhjI91/y9fr
         SI5F/bLYM6xs/u+ranyBHtEL/Y02GuyqZ1NDX5DnozaJmIKv8u0OBMtjIKq4sRLkfYqf
         12iei9PUsCF9KpCjXoM1ATY94bdG5xBns6Zi4673UvqnJBCPZQUnkKRbQaVcecqQSPM3
         WkDN3m8FI2Wn8+LwOdMhpeUup8rnMzTMBAe0+27yRNKgQV13RS0bSmPW1MZCFKmbSz3f
         nNNHBiy9eus2WfiQrWNdeyu9Vy6IyRrhr79ZAGLxtD/3MtAdd5oI+YQCkPajibZNocIz
         EwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793306129; x=1793910929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcJgrIbiHATKK/40hSI/RITxVRqGHCvmwYIWBjFMRA4=;
        b=zaT9QlV4+QdNldaxkRfWToX8VpEfopVB2+Fh5z8DYtFI2eZk95PoRDn8o5hZY7TfNl
         iV/k4QSzpTFhXyVjA8ULombruVGz6FvuwBftemeX9M2l4AE6m5toDpUqAbfLKPSmGs2a
         jOGvFfQsXHiVFjkVciTA3HlX/1G0CMRhOlv3Q8u23kOaWNq2sadQGVK6rYddTJqI/MwL
         mRZBQ6Zi7VZuSpzqi1L1LkclT57S+PN+T6MCC6VvevjVNUNwOl5FrjAS/fYrTKLZa0Ql
         /e/r8qu1yY6mkcYXkFzNRcZy+VbnTjajIZ5qF0WnWi5pZ2AKx1DhDdyRLu5TA3zFDxqa
         0gOw==
X-Forwarded-Encrypted: i=1; AKwUvBw3d8sU4WjdANa5OYpUjY/jFerDeTjXqZ3C2dRsNi/9RMYKfkozjv1vnHpRo26vHSJ8c52pdZuLLnFkgGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoiahm/DvBIa8FlD/LuigadOxBEsCTYZFZMSgdLPY//KbjqbBR
	O5SWgPAX5czHlkyaR5VLXZe8on6WLqxmT149Ei8xt/trFWbpsJMYtZqO
X-Gm-Gg: AYBFou1aNqRj8+BpFJqJEy6MCqKCuptdd0nUr5VFV6AQ6OyKuJCQGfE576ITN1tFbRo
	YpLtzjMNTZ7DEsBLESXpIPBjEOJq5MxkXUpv2/j28XBIKALGoGQ6sbeCFs1RtahpEFYglwAP5Kc
	eIn3oxgnILUn/UAui3RcA8WawOd3XxpvYI9FtfOSjbXTwBlw+8YaRcu83byT8SU89B+7al/OWjR
	kj/pB0+VBv4gO8lVdQLQy1foWGxm+MxhLAUK7Ohq8/VddDcGbDwg6N0Im5NydwuDgYtIuC/q933
	mGH2Or3UAhPz7CBqJ58Fp2xu4cbTdL9zlcXAUNpxqllhTWh67SZt7EukmmjlqraHxFfI2eb+WM0
	1GMOefxbjGigBmSCMZWXBWm8k3VWUOHKb07btFgRfnzoLLnR5P/6E/otdcczaLAshrB5Ut8Qoai
	Ndms84357zkh0aPH5rM2SS8NkZY+NXmc6zw3n66ywmTASf+K07usACxIbql4xS4ImEN3RSdnN4a
	y04rbPM1WvMr5zIOsGQjEP2uDGakzX/w/AHxnLon2Qis/pndXxsTqtYRyV0s1vP2qPZSRjzh5Fc
	7kL0Nr2AKenJXEpmmDTO+1vmDQrK55QW8v6s7aO4gYGrU+pc0wH7x3vIcUG7ZGJNIGhKc+gvCvU
	lag==
X-Received: by 2002:a05:693c:41c9:20b0:36a:15ee:c20e with SMTP id 5a478bee46e88-36a42430362mr654438eec.33.1793306128640;
        Thu, 29 Oct 2026 13:35:28 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm982137eec.18.2026.10.29.13.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:35:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fs/ntfs3: preserve colons in symlink targets
Date: Thu, 29 Oct 2026 20:34:57 +0000
Message-ID: <20261029203457.59990-1-dennylin0707@gmail.com>
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

ntfs_nls_to_utf16() parses colon-delimited ADS names when the ads mount
option is enabled. ntfs_create_reparse_buffer() also uses it to convert
the complete symlink target, so "ln -s foo:bar link" succeeds but stores
"foo" as the target. Following a link to a named data stream can then
access the unnamed stream instead.

Add a parse_ads argument and disable parsing when converting symlink
targets. Keep parsing enabled for the other callers to preserve their
existing behavior.

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/dir.c     |  5 +++--
 fs/ntfs3/fsntfs.c  |  2 +-
 fs/ntfs3/inode.c   |  2 +-
 fs/ntfs3/namei.c   | 10 +++++-----
 fs/ntfs3/ntfs_fs.h |  2 +-
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 14ca54e54578..be3c6a7fc57a 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -173,6 +173,7 @@ static int _utf8s_to_utf16s(const u8 *s, int inlen, enum utf16_endian endian,
  * @uni:	Destination memory.
  * @max_ulen:	Destination memory.
  * @endian:	Endian of target UTF-16 string.
+ * @parse_ads:	Whether to parse an ADS delimiter.
  *
  * This function is called:
  * - to create NTFS name
@@ -182,7 +183,7 @@ static int _utf8s_to_utf16s(const u8 *s, int inlen, enum utf16_endian endian,
  */
 int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 		      struct cpu_str *uni, u32 max_ulen,
-		      enum utf16_endian endian)
+		      enum utf16_endian endian, bool parse_ads)
 {
 	int ret, slen, i;
 	const u8 *end;
@@ -239,7 +240,7 @@ int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 
 	uni->len = ret;
 	uni->ads_len = 0;
-	if (ret > 0 && ads) {
+	if (ret > 0 && ads && parse_ads) {
 		uname = uni->name;
 		/* Find delimiter in range [1 : ret-2). */
 		for (i = 1; i + 1 < ret; i++) {
diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 97c04ab2763a..b06de8566a72 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -2668,7 +2668,7 @@ int ntfs_set_label(struct ntfs_sb_info *sbi, u8 *label, int len)
 		return -ENOMEM;
 
 	err = ntfs_nls_to_utf16(sbi, label, len, uni, (PATH_MAX - 2) / 2,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, true);
 	if (err < 0)
 		goto out;
 
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 5a8d362155ac..d883c4b47e83 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1315,7 +1315,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	/* Convert link name to UTF-16. */
 	err = ntfs_nls_to_utf16(sbi, symname, size,
 				(struct cpu_str *)(rp_name - 1), 2 * size,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, false);
 	if (err < 0)
 		goto out;
 
diff --git a/fs/ntfs3/namei.c b/fs/ntfs3/namei.c
index ae88cb66fb7e..ab9da0faa104 100644
--- a/fs/ntfs3/namei.c
+++ b/fs/ntfs3/namei.c
@@ -45,7 +45,7 @@ int fill_name_de(struct ntfs_sb_info *sbi, void *buf, const struct qstr *name,
 		/* Convert input string to unicode. */
 		err = ntfs_nls_to_utf16(sbi, name->name, name->len,
 					(struct cpu_str *)&fname->name_len,
-					NTFS_NAME_LEN, UTF16_LITTLE_ENDIAN);
+					NTFS_NAME_LEN, UTF16_LITTLE_ENDIAN, true);
 		if (err < 0)
 			return err;
 	}
@@ -82,7 +82,7 @@ static struct dentry *ntfs_lookup(struct inode *dir, struct dentry *dentry,
 
 	err = ntfs_nls_to_utf16(ni->mi.sbi, dentry->d_name.name,
 				dentry->d_name.len, uni, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 
 	if (err < 0) {
 		kfree(uni);
@@ -437,7 +437,7 @@ static int ntfs_d_hash(const struct dentry *dentry, struct qstr *name)
 	sbi = dentry->d_sb->s_fs_info;
 
 	err = ntfs_nls_to_utf16(sbi, name->name, name->len, uni, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 	if (err < 0)
 		goto out;
 
@@ -496,7 +496,7 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
 		return -ENOMEM;
 
 	ret = ntfs_nls_to_utf16(sbi, str, len1, uni1, NTFS_NAME_LEN,
-				UTF16_HOST_ENDIAN);
+				UTF16_HOST_ENDIAN, true);
 	if (ret < 0)
 		goto out;
 
@@ -509,7 +509,7 @@ static int ntfs_d_compare(const struct dentry *dentry, unsigned int len1,
 
 	ret = ntfs_nls_to_utf16(sbi, name->name, name->len,
 				(struct cpu_str *)uni2, NTFS_NAME_LEN,
-				UTF16_LITTLE_ENDIAN);
+				UTF16_LITTLE_ENDIAN, true);
 	if (ret < 0)
 		goto out;
 
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index 689151fcf993..5475eaeb49fe 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -540,7 +540,7 @@ int ntfs_utf16_to_nls(struct ntfs_sb_info *sbi, const __le16 *name, u32 len,
 		      u8 *buf, int buf_len);
 int ntfs_nls_to_utf16(struct ntfs_sb_info *sbi, const u8 *name, u32 name_len,
 		      struct cpu_str *uni, u32 max_ulen,
-		      enum utf16_endian endian);
+		      enum utf16_endian endian, bool parse_ads);
 struct inode *dir_search_flags(struct inode *dir, const struct cpu_str *uni,
 			       struct ntfs_fnd *fnd, u32 flags);
 static inline struct inode *dir_search(struct inode *dir,
-- 
2.43.0

