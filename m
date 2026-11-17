Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897607;
	b=wA3ktOsKkm91KCz+fioLPGswaSQlCyFTSzocziprH7XuEv8ghoqJjQsxIkzJ2cNvzU8f
	 D7RLNk6G/GydSZGdT35oS6q0CnL8zb6gQSem7T5fWUi2SHkwCeF46jz7C5G0OIEuIVx/g
	 R3MW1NnCXAdYkWfgBjtOzRT40k/jIBsl8MJ+2z6juwD/StDjel3DAtvTmbsT019vS9Iea
	 2YA9kdnztsRE+skHBm9qyBWbCqgCu6nC+QuYKNKS6kX8aeS1Ifyz8qnAtF5xN3OCiNY9s
	 ntprA5Fv4/LambWaRpSi0UoCb7zX8Q/9JB91JdQhSpWKuTOcdsnJVxthBDtXwkeRYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eDKHBCbv46PsJNdfpvRyzWGbD1LCk4RnEYpm63YeSeg=;
	b=po8z5hTUAnJtqs9NcX3qyNTCX35HOnWItN/A3ow4z95I9VKRFKo7xr5FH98QouxBexdN
	 3k+lZaj13TkfYTAr6mMiC7Og9FRqrSJS9fA8r3A9BfO8bYrIM90mE/Po8/W9ZVWoNBDhT
	 VDh8lZnpea90J7WWb8f/Pz5g5KQ3mvOPNL3fEtKOmGjz4levMNF3vMyyuoGxfxIMW/5rr
	 h0eyPH/i+x5Jw7HimCwIE+r/EzAGDePoyk/AYs2h85QGahxw3uD0eVjBKfgoOCwY9HGIq
	 nsGtpH6o4AcLt+jdUd+scSrGldVlQRp38HEiids/2D0pfJOXhIjxfUTpvxdJoy2n1nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmuviNTO;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE68606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmuviNTO
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5143824a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897606; x=1795502406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDKHBCbv46PsJNdfpvRyzWGbD1LCk4RnEYpm63YeSeg=;
        b=EmuviNTOml9NblDFN+jbH8OYRt3gq2gOmuKrEDuZjpnEvbU7MgKOZvYtAmMdstndUF
         rzF/FM+4bSr/8tCY28rYPKEU1yTD+70ER/FRptnpuhDz1sD8Dp224hmHHJQz+uhEqOIv
         ue6f4xihEXeyRe++LfJGVKFceXFVsTuP511/LP6nRMkH6uRha4JUErn9RGIBoaT2Qyi2
         7PbnmTOnl861EFh+O9630VdIlsuQ5lDt5g/rYU8cUSGBqyMgHgvQDE0vLJVzI37aOM+/
         Kw3Jsa3Psbj7fyd70QtNQ99vAMdDrqIXLrkXyizP2ANNtdza0jAUOODaFWiG1d3PJ4Hn
         vFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897606; x=1795502406;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eDKHBCbv46PsJNdfpvRyzWGbD1LCk4RnEYpm63YeSeg=;
        b=jgSNm6FpgS5m4LT1m6Q3n1/LhnSKTPEwVoZGi4acF+S1Z8+IqkhZi7fY8HGgiqDaBW
         AnsF2z0P45F69lZvUJQe7GWp76N4061n5+t3GX17HTdvhzVOm0yZJtDShMBfHOeCNEmj
         o/0aOFtMyXZ7U9AIacy8IccSInrEKsY9vSUHSonC5KA6c4kzFGcqOzWsQgfG0URA96X5
         dYIjFmLb6WiXDXLH2jsRVS3cC4asFgffmVkJ8q8M5WHCQUC5MK8mzQ1tzkvtdRXcSP5V
         8vzNtA3NhbD83gHZC8xzehuaLXHxGGSNwLJlDsIvcZ6Kyqe7ozz8IUxSVu63jDS27ukt
         /jJg==
X-Forwarded-Encrypted: i=1; AL+hErGZ5jEbBNJAqF00WHo/LDq7/YqAh05b30BuTgS/cTkofL3eIRW/sgtamvgKPujGgRvN9cAaTZOLf/VpKUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fxtdFkKYIw+LAPo5euwhsYFOAmsuRHPRYjp1NZa+cjy6fuEhe
	cWNIM531ASj+9WqgSQMCGQoIyZreFvaf1tPihHYOxWX1Nz7s6ERWCNp8
X-Gm-Gg: AZFdTZe5eRwc9aBptuZsXosodGB0lWYIcK6SWE3KNOE22TyGgvHK1fwbwm4txCs4TEJ
	q5Vqg/LDEiG9c+uq282SKDAJ49WEb0viw65oeZXUzHbNbn2rn/VNf8CFhE7oDX0kB6oT/pXZwb7
	vRw3yw20aY0wahBhnkk5PtXBqlq3dOYCtYwdKT6IU9TpueSApqtLUydALY4TYPZYyOTAjRNwv1D
	t1V4LOkOPc5c/XMgOODh5rUU8BFUu2+TB/3AR/V7yUdCerLqNOX4yT2AdwAFpPZHe+JsBq+PVrz
	zRHrpIhPxIDNtxjjGKNgCqMJdHRAKFU+4hiLvzTtvz7wmRjkxfyHHYE3K53rndiF4L5VrUd1JXc
	Jhrr/gcp3qg7UYr4RYVpmw5EbvWnz8ougkfR9BlVqRPfiY45a1soM+kRL5SleKdnNT1gapetzoF
	1Q7vzWKXHGFLA2HyZFTNxSps2FmhWJV+9mvyEz/QBebrQPJW2LYKR6Fvibt07jRi0RZkgQ+eBsJ
	xc6VV2ND5cdsYx8Ts5i9Nz3f6VGDTBjCkeJTFG93bfNwHPsRMYvvZhVSUxV/5Z0EdDzRDIz+Kx7
	OTuCY87GW6JgC6ueRrKlrKq+pIjUWoF6emfYmXIdkp3EPg==
X-Received: by 2002:a17:90b:1fc4:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3b1b0b57dc8mr12548473a91.18.1794897606443;
        Mon, 16 Nov 2026 22:40:06 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3a3f1224asm1612793a91.4.2026.11.16.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:40:05 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: ebiggers@kernel.org,
	krisman@kernel.org,
	andrealmeid@igalia.com,
	qkrwngud825@gmail.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2] f2fs: fold casefolded names of F2FS_NAME_LEN bytes or more
Date: Tue, 17 Nov 2026 14:39:59 +0800
Message-ID: <20261117063959.2925223-1-zhanxusheng1024@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

f2fs_init_casefolded_name() folds into an F2FS_NAME_LEN byte buffer,
but utf8_casefold() also writes a terminating NUL, and canonical
decomposition can make a name up to three times longer.  A name that
folds to F2FS_NAME_LEN bytes or more is therefore not folded, and is
hashed and compared as given.  In a casefolded directory, creating
'A' x 255 fails with EINVAL under utf8:strict.  Without strict, after
creating 'A' x 255, stat of 'a' x 255 returns ENOENT and creating it
adds a second entry, and 'Å' x 127 (254 bytes) cannot be found as
'å' x 127.

Fold into 3 * F2FS_NAME_LEN + 1 bytes.  Entries created before this
for such names are hashed by the name as given, so search linearly
for them before concluding that the name is absent.

Fixes: 43c780ba2624 ("f2fs: rework filename handling")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v2:
- fold into 3 * F2FS_NAME_LEN + 1 bytes, as decomposition can expand
  a name to three times its length (Eric)
- find entries hashed by the name as given with the existing linear
  search instead of a second hashed lookup, which used the hash of the
  name as typed and missed entries created with other case, could
  create a duplicate that shadowed them, and was skipped during
  roll-forward recovery after cf_name is freed (Sashiko)
- don't fall back after the hashed lookup failed with an error, which
  the existing fallback also did not check (Sashiko)

RFC: https://lore.kernel.org/all/20261103030712.1514800-1-zhanxusheng1024@gmail.com/

Only names that fold to 255 bytes or more pay for the linear search,
on a miss, which includes every create of such a name.

Tested in a VM on f2fs/dev 9b12299b437e with lookup_mode=perf (the
default) and lookup_mode=compat, and in a directory with 3000 more
entries (depth 5), same results.  Entries created by the
unpatched kernel, then looked up and created by each kernel:

                                     unpatched   patched
  stat 'a' x 255                     ENOENT      found
  touch 'a' x 255                    2nd entry   no new entry
  'Å' x 85 as decomposed (255B)      ENOENT      found
  'Å' x 127 as 'å' x 127             ENOENT      found
  utf8:strict, create 'S' x 255      EINVAL      ok
  utf8:strict, create U+D7A3 x 85
  (folds to 765 bytes)               EINVAL      ok
  rm + recreate 'A' x 255, fsync,
  crash, roll-forward                -           one entry, new data

Entries created by the patched kernel are hashed by the folded name.
An unpatched kernel finds them only by their exact name and only with
lookup_mode=compat.  fsck.f2fs, which folds into PATH_MAX, computes the
same hash for them, and still rewrites the hash of the old entries.
Encrypted directories are not tested.
---
 fs/f2fs/dir.c   |  8 +++++---
 fs/f2fs/f2fs.h  | 13 +++++++++++++
 fs/f2fs/super.c |  2 +-
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 70847313ca6a..e209cdb58752 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -76,7 +76,7 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 			return -ENOMEM;
 
 		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
-				    buf, F2FS_NAME_LEN);
+				    buf, F2FS_CF_NAME_LEN);
 		if (len <= 0) {
 			kmem_cache_free(f2fs_cf_name_slab, buf);
 			if (sb_has_strict_encoding(sb))
@@ -86,6 +86,7 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 		}
 		fname->cf_name.name = buf;
 		fname->cf_name.len = len;
+		fname->cf_name_long = len >= F2FS_NAME_LEN;
 	}
 
 	return 0;
@@ -389,8 +390,9 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
 
 out:
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (f2fs_should_fallback_to_linear(dir) &&
-		IS_CASEFOLDED(dir) && !de && use_hash) {
+	if ((f2fs_should_fallback_to_linear(dir) || fname->cf_name_long) &&
+		IS_CASEFOLDED(dir) && !de && !IS_ERR(*dentry_block) &&
+		use_hash) {
 		use_hash = false;
 		goto start_find_entry;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4fa4d8042f70..d4a48ef274fd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -661,9 +661,22 @@ struct f2fs_filename {
 	 * we fall back to treating the name as an opaque byte sequence.
 	 */
 	struct qstr cf_name;
+	/*
+	 * The casefolded name is F2FS_NAME_LEN bytes or longer.  Older kernels
+	 * could not fold such names and hashed them as given, so a lookup has
+	 * to search linearly before it can conclude that the name is absent.
+	 * This stays set after cf_name is freed.
+	 */
+	bool cf_name_long;
 #endif
 };
 
+/*
+ * Canonical decomposition can make a name up to three times longer, and
+ * utf8_casefold() also writes a terminating NUL.
+ */
+#define F2FS_CF_NAME_LEN	(3 * F2FS_NAME_LEN + 1)
+
 struct f2fs_dentry_ptr {
 	struct inode *inode;
 	void *bitmap;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78dbf1e92285..33fdc037d5cc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -505,7 +505,7 @@ struct kmem_cache *f2fs_cf_name_slab;
 static int __init f2fs_create_casefold_cache(void)
 {
 	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
-						   F2FS_NAME_LEN);
+						   F2FS_CF_NAME_LEN);
 	return f2fs_cf_name_slab ? 0 : -ENOMEM;
 }
 

base-commit: 9b12299b437e0cc3ebf402e7b36a89cc69151238
-- 
2.43.0

