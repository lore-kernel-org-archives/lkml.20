Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765850;
	b=Yry53Na1GtLfiASSeYZCNB4tbWWL6rM/i8G04x7FiIYRbXJOsPyTLvWzza0B95uYaHFs
	 S9AFz9Wej7mEH7FKrU3B9hd8hze+PmQtZ1pa2LxoQnHL72/JZ72h/52w4rh0iM1xJLYW2
	 Do+EiyOTKvcTRcJ2bCeymcTm2GZHQZtItRkU+mr1XQXUjKnTBQhl70nUJZTr9uXwr5cBx
	 oaV/2MrJB8KH1wxlZCqN6RvhVXCs09Jx2XdTw4S5OuslhIgVjwDghdo7lI5uGzp7mgC+P
	 KoRs2fYv+MxM0q1Th391Mal5LvU9GYwVLcyno867oYgfVQ7JYJKmw55+GKQX83adrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
	b=VVw0bYx1C1cpSb9NjVeIy9d+Rkw9bWmWki7eY8g2L6Nkmp1PFNyziU+neOQepGEc4sag
	 WUf/g4HoSenCNRSfaLJMXdpnO/vRhYKRfNCKOkqnmWv37oU1cR2riiuSd9J6vcLoqU3Kf
	 QK7MiqIFt+SMcOMNHe31M3in82XMotDXkwUlNxSfwUAbgTOob3ADpjMj4790VPt1dbvVX
	 xMzEu7VV8/SkK5+HpCfroFTjKhTZiZNUyn7GoMq8ihDdaVApE5mHQWI4sg06wN7ub2kt6
	 a6mFQz8S+nY5tBeWoU8szls/Aoop5tiFkm2Kdgfzq5EpURb3jYZqn9QzOqWDTakTVbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWsT5qNH;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE0560A3804
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCE0560A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vWsT5qNH
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so1173800f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765848; x=1795370648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
        b=vWsT5qNHBHS1DVwii+PWCaUBbHAppQCmj2gOj682zzeHiV/k+DiOVZTV4Zl2ufwliV
         XcMy5JwYQTOOTrflDWHklMKFP0ooIAzTXmcrljZcbXEBcGgQJ8AuhPrA2Kdo4FY+A5sq
         RFhUdhdmB/HnkpDHfaoEqGopcQTyaUw/BkwbFNx/miBcx95zanVxTEo04YAIEeC/HESP
         VTbUAbTYu4JhjZfi4+Q1P2yCrswvDMacYAFanAg5eyigD2bOBBTTJke+hK+xYQgFlnL9
         BoGEzGfJ3RScREWw+h4ers02dYcW83csAclxW+91LVfFDsMDpf8UySKYC2UjgIBdPzYJ
         P8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765848; x=1795370648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA38+n7c+RqbQlIN4Q8phpqWE0RWPQHALE9HzRQmyvE=;
        b=c0OP67wPhKaIP0Z7s61owraqprEJ1z5xnZ9fu2EcLAIgmw44qY5hz0JoaHwUOmatdX
         AEWR+UWpleinXzs6nzGanLN8eiQCsmGI6PDJDGc5I0XVAz+iz9xXRlhdrBX102Nm+/kS
         HC+FHOANFicCWYJiwr3a0gQ8d0nq9MR+swZ6ruayqX5QdxHec/TIunBMkkEvxgyug1bv
         rdcswphN+uffFTEb0t55H671NHwdOn4U31Eynje7uRYHbXIH9jT9CJzrhVMWjLg+Crp8
         WLOwNutKrxeBDtgQqDOnFyaSq1WbxNqNkKpDcrzjb0eR21vjsxSI6N7fikfoseqPVztk
         dXzQ==
X-Forwarded-Encrypted: i=1; AL+hErFpwj9lecfcn1i4l3sOoPd+NMz6f8C4ZXe9dTtxgSt+sJQY6ghE+47oq6lidrHajwujOWHxTtvH1O10v4E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ti0MfpaGgeJvNe8okUb36ybISrg1PM4E0CPe4lZ3kdBnRYTrt
	G/c1QX55qVy7QVAeLmPNnMvo7oSPdE+0BWbGdCQwtpP4FxA6A9KvdRvn
X-Gm-Gg: AYBFou0AfbTvkXSaW9Q8jyL4Gzi3tiPBROKdtkvGvfuEBIQ/QgQ8sLk2tpqqFB11/1e
	l9bwfg4WPnGCvyLBVEjyGr+blOgCrnNo427ks5lqaHJcAP538dD90bP13Xg5C1nahBtlr/FPKMB
	zFgWnFBGA9ZlcP57FHe+Hw/Kw+hNsDiTqYhKcovv67So0v0w3TVAuQnl5FvcOPyvaTDE2/5GQYL
	ZgfngnukfJ7oYRpciMDEqNnHPZgXfvSMtZ5qj8SSdP3z1VEVmXMvm0DJIsbzjo/LY77Q5QbpzuD
	ar9jQUBIUZBjTzE6Fnz7ivtYB+2JyWYIiZenJGfAuMilx+xKlKtI4p1TPj2lGIlb3Q/8e3IOb3H
	+dqXDSm37dDwDgiIFAkYs5G734qUJXxiE4x8SKGFQPVgn/M7PhFjpoeMgZ4WSVCl25rbfAdyDM5
	4B0oAgygmre/kuaZOnoXKOW9YnyLPWl1xYo8yiFhkJEiF5Hhx926vF6nJIsETbnA2R4SaJGhJ3+
	9INQTTMeiV3O2lm/80e8bkdsSR5pg+dyaiG8vtgsl9l5p53rHyifSLVKsxMPzZDSA5t6WJNjB7X
	SicFZQ1X7XoqcZLF9NUZ3Xudzs+RaqCUL0HN2QDcfODSxw==
X-Received: by 2002:a05:6000:455c:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-49c73259e6bmr12985016f8f.13.1794765848134;
        Sun, 15 Nov 2026 10:04:08 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:07 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 04/10] exfat: make crtime user-settable using ptime
Date: Sun, 15 Nov 2026 19:03:37 +0100
Message-ID: <20261115180343.576773-5-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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

Since exFAT supports user-settable file creation timestamps, map
provenance time (ptime) to exFAT file creation time (crtime) using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, implement exfat_fileattr_set(), set .fileattr_set to it for
both file_inode and dir_inode operations and update exfat_fileattr_get()
and exfat_getattr().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/exfat/exfat_fs.h |  2 ++
 fs/exfat/file.c     | 42 +++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c    |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index eee573d1697c..aff96afa258a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -619,6 +619,8 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		  unsigned int query_flags);
 struct file_kattr;
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		       struct file_kattr *fa);
 int exfat_file_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 long exfat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 long exfat_compat_ioctl(struct file *filp, unsigned int cmd,
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 435bbef288b8..02390b03eecd 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -384,15 +384,22 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 
 	generic_fillattr(idmap, request_mask, inode, stat);
 	exfat_truncate_atime(&stat->atime);
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime.tv_sec = ei->i_crtime.tv_sec;
 	stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
+	stat->ptime.tv_sec = ei->i_crtime.tv_sec;
+	stat->ptime.tv_nsec = ei->i_crtime.tv_nsec;
 	stat->blksize = EXFAT_SB(inode->i_sb)->cluster_size;
 	return 0;
 }
 
+#define EXFAT_SUPPORTED_XFLAGS		(FS_XFLAG_PTIME)
+
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
 	/*
 	 * exFAT compares filenames through an upcase table, so lookup
 	 * is always case-insensitive. Long names are stored in UTF-16
@@ -400,6 +407,12 @@ int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	 */
 	fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
 	fa->flags |= FS_CASEFOLD_FL;
+
+	fa->fsx_ptime.tv_sec = ei->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ei->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+	fa->fsx_xflags_mask |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -485,6 +498,32 @@ int exfat_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	return error;
 }
 
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa)
+{
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
+		return -EOPNOTSUPP;
+
+	if (fa->flags & ~FS_CASEFOLD_FL)
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
+		ei->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ei->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
+	inode_set_ctime_current(inode);
+	mark_inode_dirty(inode);
+
+	return 0;
+}
+
 /*
  * modified ioctls from fat/file.c by Welmer Almesberger
  */
@@ -1110,4 +1149,5 @@ const struct inode_operations exfat_file_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..15ec7f1942c8 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1349,4 +1349,5 @@ const struct inode_operations exfat_dir_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
-- 
2.56.0

