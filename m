Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12951282F30
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788839777; cv=none; b=GWMunXE5UseALNR5KohMDRmNmJB5elMWOaKJPlB8JfbmxB5BTU644g8pzN+3PlyqnkXWKoSQhRz+22rVa/T3CAcSEdidgfVGTC/pRKc9kHec71j+rVaw+l8Ufz6npq5Met9Seb8w8xQ9lx1nYP0cfZ72QAsfjZn9FvgE4DU1Jtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788839777; c=relaxed/simple;
	bh=xF23A56s+3D6NRTLDK2xRJOhzghX3Tn1Neio0fVKNxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahxlX4DsP6bFuOUIyo02ogHASiQXN8Ay/WFtf56y/dx/hYmsZ6ikjAgbBbWlVmL1rZ7Pwsbf2Hkrzqs8niybvgJaK1PzCBAaKWnG2uF/Bt/r0xSHUN9yvtbuE77WAumXG8fVhYrOc/L1yQ4tuautxemGjkWradhi3A6ZBG+lXCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7TPsm+H; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7TPsm+H"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d715f4a587so58033345ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788839765; x=1789444565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wHuXN+TozonanTrHY2nOVJpLzPnOvGV5cbx8xr3LhCY=;
        b=H7TPsm+HG7j4HxWtWxy9NQVwAeL0Y6QQWRSEMQcdidjYaks/6yy6wbb273/7xH+OUo
         L36Rg8DcCQVkew4nkFDibK9OzZg+2FvkI/4yGpf6N5R/6sy+fok0LOuRNCZLTDLff2Q6
         bkuf9KtZHDAeoRu9Xjz8FUUQcaxalkIL7OUQ5OKTkbMh1qKWNty7tYvv6b3vyzsiAng1
         bZDiwqOf+ceQDXtWT0OaciW9NoXnf/DW86tnTOzVrk2o4T3V3GCCjNFjs54+Svkss6Ec
         8q1zcZk9QXsKifcSqZ7/iVG3gD1sMkdD8cJWS3LhltKzTUpOlB/TNo3OvNqZLn8U9rpV
         ofrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788839765; x=1789444565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wHuXN+TozonanTrHY2nOVJpLzPnOvGV5cbx8xr3LhCY=;
        b=su9cLSe4qDNe2CCESnchb9wJxHBRUXC9V2h1i+RNf7tgQdkRuEEhFMhzP/++JG0nvO
         ZltXFcIVvnGLRk6sJu++8pLwpLF+HvytLvl8jQQ0nljVDP6Wih9KriMFrr8fwRrTQVxo
         tzhPxAfOWGLBY3XfDiXALTS6V7D4FWIdfzWk1bsKmleTCwn9D9EuO52UePi5ydOryiG1
         flB2X5SpbK1Xh4U5kDb7QOIeg872YAk5d5/N9jwnJ4+5Ax/RAbE1FrpKQ7d2fDSs99sq
         vHQlvveJPsfQA7nqE8IB8jh9VTCyTngmmDjYo7NY7mTccslfpGC8p8zz8e/2PNhs2hdH
         1iKA==
X-Forwarded-Encrypted: i=1; AKwUvBy/iJkrFmOZ3PDf/jlKViY8TMPWYVPaemsv2d1M7iilbqd3WRCNnbLL0/FtO+Fdv4JINve+CSp0UEhWnJk=@vger.kernel.org
X-Gm-Message-State: AFuF++mjVCEAgHH5h2vOWtAyT7QePXi/HkCRe1gv2s1wYRgV8lz0HruH
	f8FwgbsJBl7q36x1YNBIBqCUEjV/Ejbe/m4+7E6YnyC0DS4pH+jcxrsI
X-Gm-Gg: AYBFou2rZS47Frb3cUsm170O6dcdjpCPdpn3ra3VzOUYwFCdr75aHH8j1Q8f9kfzhz1
	mP/kMfUOXFIvGiE6NKGOa8nnWJA2BEceOPcmODHu61n05rAsuk6yKM+ukO2DMwkhFDZBWifoG6o
	ASUVrqeo61M7JegBsikIi0su8hvA52rbTYOubliX+kNNL9IhBmJB2plHgGMZkG0CvpGciuYSxD7
	jm4o6HnRx1SZXw+1CZMdWp6ORtgGcTS98NsFPBIQzz05Nyg4zyf/1dJnVNNRHdeCbFXduDLN9eT
	hmhrEqV6Oly5zGQwwleI7XAANobMLf5pAPCNKgwz79fcTt8yGurLi6GcZOPW0R46t6yY6k9kokn
	xS8M2HVHksvnN5qdHXJhUevRfHg6TxAGGh4IH+WlaD/Iz5mF7EPQj6gDt37mo3B7SYx6uZ6NRxk
	GteRimOvgqhcvtNZAIYLXSfGaJapmSUf7T4bduCFKOl5p10PAwSGVlJbm9QSueGfGtitYXaC2wA
	NX4sI8/bcabHbSX7FFz3PEU
X-Received: by 2002:a17:902:f70f:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2db1225b297mr394667095ad.0.1788839765501;
        Mon, 07 Sep 2026 20:56:05 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aeaf74sm51899295ad.81.2026.09.07.20.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:56:05 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com,
	syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Subject: [PATCH v5 2/2] f2fs: enable buffered RWF_DONTCACHE
Date: Tue,  8 Sep 2026 11:55:43 +0800
Message-ID: <1cd46ad6e0e566c283dd70be7864248f504b1997.1788795700.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788795700.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <cover.1788795700.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass FGP_DONTCACHE to f2fs_filemap_get_folio() for
IOCB_DONTCACHE writes and advertise FOP_DONTCACHE.

The address-space write_begin callback is also used by internal
callers that pass a NULL kiocb, including page_symlink(). Check iocb before
inspecting its flags.

Keep the F2FS-specific lookup because write_begin_get_folio() adds
FGP_STABLE, which can deadlock here.

Reported-by: syzbot+cid5582b8164122eda@syzkaller.appspotmail.com
Closes: https://ci.syzbot.org/series/cbb9ded8-1388-4a7b-bfa7-44082b04025b
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v4:

- handle internal write_begin callers that pass a NULL kiocb;
- add syzbot report attribution.

 fs/f2fs/data.c | 9 ++++++---
 fs/f2fs/file.c | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index fc48a752fe9..c9b29882f07 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3883,11 +3883,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	struct inode *inode = mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *folio;
+	fgf_t fgp_flags = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
+	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
+		fgp_flags |= FGP_DONTCACHE;
+
 	trace_f2fs_write_begin(inode, pos, len);
 
 	if (!f2fs_is_checkpoint_ready(sbi)) {
@@ -3933,9 +3937,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 * Do not use FGP_STABLE to avoid deadlock.
 	 * Will wait that below with our IO control.
 	 */
-	folio = f2fs_filemap_get_folio(mapping, index,
-				FGP_LOCK | FGP_WRITE | FGP_CREAT,
-				mapping_gfp_mask(mapping));
+	folio = f2fs_filemap_get_folio(mapping, index, fgp_flags,
+				       mapping_gfp_mask(mapping));
 	if (IS_ERR(folio)) {
 		err = PTR_ERR(folio);
 		goto fail;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c763fb972e8..92f916ca8b9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5920,6 +5920,6 @@ const struct file_operations f2fs_file_operations = {
 	.splice_read	= f2fs_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fadvise	= f2fs_file_fadvise,
-	.fop_flags	= FOP_BUFFER_RASYNC,
+	.fop_flags	= FOP_BUFFER_RASYNC | FOP_DONTCACHE,
 	.setlease	= generic_setlease,
 };
-- 
2.43.0
