Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498250;
	b=D5r/wkcxdfK2bN5VB0fBVM6AX4SSjxxwIVo5hWDJ7o6vIFI+Qf4+mD5l1Q64ikTYHJR8
	 4kx06FFthtpStTmrL4RsPAf+K6MTGljkI8wjZp1NKU6wmseQfcgnPNKkRJ6uW1rvek688
	 tEu0Ayjshm+vXB3CNGLhH0nLSrLFJskK1wJvl6upGEc0ALqLsZDMvE2tE9n37io2slJ13
	 Y8CbhuzY54kWaShC9DrPILd/GuS7gmpDREYjAaHMVfsYiNDWO1TdJfKSn/zjy083HGAwN
	 neFvzW6hrO+fhJOnG1cQNzLEaZjdNYmrh6idCaUWoVGV4w75MUld5Hb0LyhF34XFbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
	b=Z1RTlxogOXOa+GM2Epg3lMcmRVX6L4ppGqjP47tmR/BzD6m6mpH0g6+Je3JIRfE3Nkov
	 ywe6Pk1REUtnvLcVkiv4fHitbpNE0hwP31Or6pG/nIWCpGRgcE5yGMo1DPrWqnxSf1EN/
	 0kQhVb+LLq6j2lcNOM835/W2A3sQkiGldbj64G8KMHv8K52fODVfvO4NzNTARh3tHDWh4
	 nmS9+mWHu0HlXUQMYH+FBTHqvOFwlkaAu5xY5BLFroj4EXb3fM5YHGUrxscFPYAEg77t5
	 n2FezH+2JMy/G9N/+nWlpIBXF3PdnX3VK2UfCcIU1OKQ2dvxugj/7iFsy+VBt5KMoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BsuMTcX/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF24160A3803
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF24160A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsuMTcX/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so19808995e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498248; x=1794103048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
        b=BsuMTcX/BjdxIN1q3x96RSbSUJhcQimg9AITR+6CL0Jk0S52NUmp2phDSjd9arPfrG
         SyC/+LPuBtqBdhxAhqypEFo1DMutXeqtJVZIrB36WKs+5+A2aT3QmuRxQn7GWMdYnit0
         UIkhudzFiZjSp/8PytPE0qRP/nQv/GeMwXqNfCfDidbW/TSEyMc8NpHF3IILfV0IxPYj
         /LAfNVTcTLQMV3z3wsdEuTHMkFY4Bqk9Co8VRDbXglFKwGY6NZDIEwQnOsotnkrFEJ4/
         WivLN1GoM1uxHzydbRxByfB5XEoIG3GmEOw8gh1zOXULD+II7ZwqSRJT4VNoINdioqDH
         LTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498248; x=1794103048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5MG08yt3Dfb74iEQhSFMIkh2RLd3WaV8uSunF8a+30=;
        b=ARHXW8hKjZ+hjyoCup+y93BhnalJMCNFHEKOVHgQKZmefQ3zm584set21DCO7gfG6O
         O6JMH3UJuHGppmgvcoSwQspeuMhOSq+G5Kc70AsYOIBZEPfghL09uF8wEU5xVzDC9Gao
         gLlLExTcvZENrzwcMb9sgNNvEuF560RJvCRXz/wsT1KE7adsAtkjVRvS+kIhWDUJ+Seh
         y1LvV8TXptEVVo2NYLGAox/0z6PYPeg0Uom9f9t3OpyVdstVFRzKsUR/yIHYV5H7uvid
         +N2Q4foh1cZDEM9vA1vJPVL62I9HCedzjNaFm0EY0qKbwGk89SSr6NSvUK7VoGPahZ6k
         uBDw==
X-Forwarded-Encrypted: i=1; AKwUvByPHiFGuRuWTNHdSNVp5gpYLRP7LfVe39K6CxYIZ+4pvMN2o5JtDExujYdpe98PBFdPsCtt7jGtvYfhNnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTdZyaJ7Tu4Mk1XcpYkbosBXpGNvoe17SVAJlUBtm9QzVi2ZVP
	7YSGoVmyMBtf6fzAv/7XuJTBV5i+iFRRkRsX/sSKy9KjH9xWCEdymZw3
X-Gm-Gg: AYBFou2oOqzZjBg9nEdbI77YbjqSPVui1uAlWxxjJsRZPIo2wDtdExNlNyvwGxXweyT
	N2lcdIJqIQ3jSx0uTh+2uG1KLProc/xk7C2S1wl64h3EarI6vM2aP2RcdH6dxgdouvRwxsdbq5q
	YzyDNOs2iXfZgLu1NZo+WY6Bdj6le5C7Y/BwDa3YYkvQ82o3vr6DUQidwQ1JrYj+YrGtO1L7yTC
	2LIgaLif3FB40w7CMmCtCBPX/V+IFkHrDGVv0yf8w/BJq7xM2Bp8cKe8SHVKUjAxPcpvanfbKTg
	40olj8N4pkgSg/GiTk95UUWpVmYbhQK7gqshb2tQD+82vsEzqCRuDBCSYD457N5YoeDUQ80Rixl
	u1bZieHEMBWVbG/NLv9w42RmNr6cqlHGgwcj72TBvagnpFvcPYashMUbKc9YPHO/gBv1dILh/sS
	kcMeYW7jXjS13ujItaXo6wbMqFVqGuIvdA01ZEu0rgpZ2d5EgNQrPoms3Ky8f2Z4qhMbBrR5Ylm
	cuwvmjM5XmpkHZsr3GYj0nKGSe1FEDJZRXThpT/wzNvpIEqF9SRYEKffmB5pBqE9Czka5e+63Zk
	tQmu9xp3wz2DKUTEO5zVj1+t
X-Received: by 2002:a05:600c:46d1:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ac187a72f4mr145723175e9.22.1793498247899;
        Sat, 31 Oct 2026 18:57:27 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:26 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
Date: Sun,  1 Nov 2026 02:55:49 +0100
Message-ID: <20261101015551.786044-4-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
References: <20261101015551.786044-1-koray.fra@gmail.com>
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

Since NTFS supports user-settable file creation timestamps, map
provenance time (ptime) to NTFS file creation time (crtime) by using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
persist to disk in ni_write_inode().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/ntfs3/file.c    | 14 ++++++++++++--
 fs/ntfs3/frecord.c |  8 +++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..b334449e9beb 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -124,6 +124,10 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	fa->fsx_ptime.tv_sec = ni->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ni->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -142,7 +146,7 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	if (fileattr_has_fsx(fa))
+	if (fileattr_has_fsx_mask(fa, FS_XFLAG_PTIME))
 		return -EOPNOTSUPP;
 
 	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
@@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (flags & FS_APPEND_FL)
 		new_fl |= S_APPEND;
 
+	if (fa->fsx_xflags & FS_XFLAG_PTIME) {
+		ni->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ni->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
 	inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
 
 	/* Save nodump flag to return in ntfs_getattr. */
@@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime = ni->i_crtime;
+	stat->ptime = ni->i_crtime;
 	stat->blksize = ni->mi.sbi->cluster_size; /* 512, 1K, ..., 2M */
 
 	if (inode->i_flags & S_IMMUTABLE)
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16ac847de48d..5e4f743a5930 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3215,6 +3215,13 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		}
 
 		/* Update the access times if they have changed. */
+		ts = ni->i_crtime;
+		dup.cr_time = kernel2nt(&ts);
+		if (std->cr_time != dup.cr_time) {
+			std->cr_time = dup.cr_time;
+			modified = true;
+		}
+
 		ts = inode_get_mtime(inode);
 		dup.m_time = kernel2nt(&ts);
 		if (std->m_time != dup.m_time) {
@@ -3250,7 +3257,6 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		    (modified || (ni->ni_flags & NI_FLAG_UPDATE_PARENT))
 		    /* Avoid __wait_on_freeing_inode(inode). */
 		    && (sb->s_flags & SB_ACTIVE)) {
-			dup.cr_time = std->cr_time;
 			/* Not critical if this function fail. */
 			re_dirty = ni_update_parent(ni, &dup, sync);
 
-- 
2.56.0

