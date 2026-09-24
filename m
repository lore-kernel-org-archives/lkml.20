Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20A434A797
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235568; cv=none; b=ulj7Jd+GP9RdTP7UQsXFiX/yGp27lApu78nIn21mxhndoRt4C5qnU0EGw3Iy8Xo/WnlShvfHd9Bzlz4oEOp3f2qRvt8ftjywW3W0t3P0lbrKjcf9qjMFbR4VPtT0fNVmSeR+8VmJDpA5VnS6P+pLCIE5rcI/420oWUPM5sF6tJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235568; c=relaxed/simple;
	bh=IXQA/g2/TtuU53NTwmNM9C9/HvhvdSxLCYNOlhYyQQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMUXoBnO7OXsI9BlYuwhQIGI9gpfaRK/xVDviijIaEcrhS6YjxNqedlnJygUSubZxjSvwVpkNKzsfysFGZ7IP3IY2TXo82zBHzmXhYLxEAGlNaLDcpo8FcnutTX7aoa1GXFul5LF2Es4B6psb4JVPa2wU7fI6Q0jNkCaaHSrn4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s48Ceb5W; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s48Ceb5W"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so913444a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235564; x=1790840364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs8AxoWUxhLFlNeCv96y8zKxhfgG9jkD4bCJjaoeEwo=;
        b=s48Ceb5WjJjdaSHK23h4CqYfxo3dVqtXQc12NJfukJducfTqJgnlGR+hSAtVIxwZ2g
         1ljXhTxmObVEx/dv/kEEKvYoXSdfY1+O5ue3/vKahh/GzfT9xKKICGVnLsmR2DSshvFe
         pKxhhN+pNui89pw+ypXgELjtvA5oSSP523MPuvszMCvWa8D9jC2edBS8a5O53W0H+6rP
         id4EvZfy/GjxcWgNPiebN0l8bGnX3TxC1dSrYF/VFURcbnMR9JdCoopkIoSqJgf/En2h
         1QIyyhbalTVuKuy4NYJSRib+iWxZUmNhiOWLG2YMJ7Prm4FXOWqd/gLmHykWzlLFu9do
         B8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235564; x=1790840364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs8AxoWUxhLFlNeCv96y8zKxhfgG9jkD4bCJjaoeEwo=;
        b=ttvJXIyvU1RmKFGsAlRPc7BtXNFrPBMnftFijCnk1TYPXDOAstShEJ29kgha7fVIii
         +Q1S9EkocEtWWkRvmiM3lGjdmI0RbLNo3ZtPhsUb5r+PVvswRWEBSCaKKcPo0+QmEAdG
         847Y049dG+VUI0CkjCsBiajtglK8uYM3ZXms8/ElJoOFwuklfEcn6mhQD0MH3Q5+rp46
         sq4nUvIHTVnn+2yZmPtsCttS4WzXsExn7ejviyZpuV+o11jj5VKW/eb9o5Fgrh46MOdZ
         v4N+a8VmBUA0pBh2ZjUPpccY8gdaD3Tm/aG1CPdlbUyxXR/KA3Ysek5Kn4HK3MeI63I7
         PKww==
X-Forwarded-Encrypted: i=1; AKwUvBxo57N2XVSEEmD0QQs8D6Zwvy4Sstw5JP2vHXZ3m/EtRdGSASoSgVcnFlBbeb2tkFd0v4t0WMrEtYqNkz4=@vger.kernel.org
X-Gm-Message-State: AFuF++lpluukBIs4qU+/t/BT/Vtw/AB7g2a1u+go0lWumAsiB71+W8zv
	U2I0CcaCDNbRACPMdflzCjx1b4HTlnL4lmtH6VwB43PDiFP3Yob4qWxy
X-Gm-Gg: AYBFou2VlidprBt7ImKikJrl7MkYwxX4r1vadbD6xR3UPC9rfC9JhBrBjw/txgAGHql
	ogQ88ACurObOJJfwclGS/J6HRedQet4Rm4oS7isBHGBJuoCTROh+TN5Gr1+fnSvcsw4FleTbUgV
	X2ewK8fJggk44koCmpbh7WjI+iDXZfcCfq1v9AY3+jxoZ2AklU/KJ0ThXsIOu2KRziT/uTDBSoW
	lEiutURh+vvsRxJeWL2k5RlfcOToZINSd7xfFzgZqCJGInAOitVLCsu/W25+fr5meZu9Fjbsag3
	neObdmIfxN/dIxwL0v/P5UoUxUYoxSeI80rxIoHo5BI89AUC7f0nqdAXNPfpSFupgTFLo4r0G9j
	v7bhxjnpkErIft8PpH2dcYdkevSi1Zz0g7obAMDN7NtMehBSNLAtCI3Bbi4DARVkGaBvK1Jw4Al
	rQMf082Be9kZWfmemf1zNuwRFajCx8Dgo/8aA+vKK8/meb1rkDT5nY0Idj6wiEVyqNY5nmf9UUX
	qvkjzxBDcfgXXBKCkZDx8bmJk2lZkueZl5o3I2lwPye+ioNaZRQgUxFpAnOi6FOOYB7ScJOIw0m
	4eRxFXWVa2HcDnhOYUes
X-Received: by 2002:a05:6a21:3d95:b0:3de:13b3:e964 with SMTP id adf61e73a8af0-3de13b3f96cmr775896637.79.1790235564107;
        Thu, 24 Sep 2026 00:39:24 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 5/6] qnx6: abort mount on superblock magic mismatch when silent is set
Date: Thu, 24 Sep 2026 07:39:18 +0000
Message-ID: <20260924073920.2782917-6-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-6-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-6-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_fill_super() and qnx6_mmi_fill_super(), when the superblock magic
number check fails and silent is non-zero, the function prints no message
but continues executing into superblock parameter processing, resulting in
invalid memory accesses on non-qnx6 filesystem images.

Jump to the error cleanup label when superblock magic mismatch occurs
regardless of the silent flag setting.

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add Tested-by and Reviewed-by tags from Matthias Goergens.
- Update Fixes: tag SHA to 5d026c724220 ("fs: initial qnx6fs addition").

Changes in v2:
- Split out as patch 5/6 as requested by maintainers.

 fs/qnx6/inode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 49e29a918a2d..a32066d98188 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -328,8 +328,10 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
 	if (dfs->s_magic != cpu_to_fs32(sbi, QNX6_SUPER_MAGIC)) {
 		if (!silent)
 			pr_err("wrong signature\n");
+		brelse(sb_buf);
+		sb_buf = NULL;
 	} else {
 		sbi->s_bytesex = BYTESEX_LE;
 	}
