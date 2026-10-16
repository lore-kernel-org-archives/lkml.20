Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B92D9ECA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151937; cv=none; b=PAfgEu7yUnhHND8WWPr0guRHYzEZD+TamV9PvYhE06dCbHGTx+DEQpdHJXyZbK+bQ7XzazaOLe7Sc7HbO7rZDyhbyAqR5Uolsb1F2DNZSWFXgSCaqrACXjGM4pVVNBZ490CsQZ4AI2NpkCWb8YfxmPYz1pvGB/Ahh5OSZzf4HQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151937; c=relaxed/simple;
	bh=XWJhrf9bPy7m8cTmjHd5g/ZCR9ncCcb2WG8cntVMrec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUlfEvovyZUwQmzt4gpuJ1WP5+502VzhmrscrJUe5IfhGn5EMh7PAUvypzkxNwtUqTKCUau8gxT+t8cID8uenxwqH1fvAtHwtNeGFYfjPu+QwZKVDw9ZD/usvkDA1v/dwrHT51KIS47h4ps0+wFt23BfhuZpjLckpA/KcrdZf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQR5Oq3I; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQR5Oq3I"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so773682a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151936; x=1792756736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxdDa/5ciMRdv/9eQf773tGBdimu+xTTwUw9N85FYNg=;
        b=eQR5Oq3IKe36xyZUQSIaGUGIzHWJeVvUouccQhE8vVX2Va99zYuojLNNa9qoBDaGzC
         tWvJP+GnK8MZQHPSuxkhkx3F2Q7aIa3z4INm52ENnemu6B0j+w+3gfcDe4gh42D3B0xM
         YulcUWDfFdHXMJuLReGgUV2vgIn1dZUhom2oxqD9lx9z2FxRsjs1uwsWjJGRWgcZ4WfQ
         IBE+OGPc9jG7+J10hf58a5B++JW1rXffjDpEc8JobJn7dVp8LA3HNSPND6kjAoOxGptM
         XNFzFq52eHLpuuFnTfk4ySZO/n+Gr61pVK2Aie3hg5RIOZtNyJ1wQKRDO8DAuC/S3TN2
         11+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151936; x=1792756736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxdDa/5ciMRdv/9eQf773tGBdimu+xTTwUw9N85FYNg=;
        b=qNQQ3TR/+ZlyDu2VSVTle6PMEmh1ZAvXnPs4IjxwNnf0nEWc+eysS1JwqKVi6SyHRe
         MV2UZlMgneQmGnR0mF/xr17YbXFtoWNkNmAb6jYsE7QGvoEM6GlAAStaN76q7Eybt6q0
         tF7AhG3A2xbthvKfaKFTUp1Vp3xCXDiAADIVAoxwjAs4sp3h8QLkSQwftmP9NYM/aISu
         SLG5hRq8RT9rDlILBidr0Z/VRjEYV6lG+IKEAS2d7fyV2eawoDxtpEGSzMPfeABq5uPt
         42HRUJ4GskaSK6iKrlRjlP42k/r3p7srE7gPlJNKMFevHLePmbUrhAS2wSJ/eIoSndEN
         qn9Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9nMLPMNnzPCLekqe9tdxGgFiEkblDXEYQiKRhm+HOP6URPFXa1q7zvPd5u6Nxi461Fej3NNSC6C1VrJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX0o0Z+6MRsDMLOJqYm2vKRoe20bnz4SD6lsmc1Ffk3T/JXu7u
	i4xXBk3U8/BcVEp1VBbF7qyiVVma8jMYvaALeHBusu0gqcx2ZFBJUNeP
X-Gm-Gg: AYBFou2cDN2ZCchSOtFXyeWV60YMnIa4XAwwsoRSCsd+RoOs6hIHIfjU/KgzxMnmMVY
	cTvu+eT8s5UlVGkns/p1Bjgga6eGsN3rz7d37/jp2VeL7jPfHiGE1o269yeVOx4t33PdEco/wYT
	AXC8CFyMK9ThRh1sRUpLTRmw9fHzU/XOYQtks8El71r0BMYT6x8sQoYW2Yxq8eX+QKpMkWcTERl
	uZILbM2aHvlv1PwZbF2iT2FiieQ5RAEcpq6uyuqjljWPoeXtUwmgwcH3zy8O2eYWYPUAM4xAuZ3
	Y+lBITfjLRNe2ksbRvg5yrvwO++6DAEoujO+GuMklgQmKaxyoopvcnm+3L1RFeueRYEUT+NN6m+
	XKGMv/hchtZHVViRr1YD/K0ZQ//h5UCu5qqxqchSnSflBoloVQ5FpFdtNQyKazkYuDqqAam00IO
	RUXTdidc7swztq0+nnTcHLcJqsYvrItmmS3ArfkpHW45/0EnhE/ch2ftmgx2CcBjtuDzqBa2fcE
	g==
X-Received: by 2002:a17:90b:58ec:b0:3ac:17c:6e8a with SMTP id 98e67ed59e1d1-3ac017c707cmr13397731a91.51.1792151935956;
        Fri, 16 Oct 2026 04:58:55 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16dc::247:b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd9c4b4eesm1809055a91.2.2026.10.16.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:58:55 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jan Kara <jack@suse.cz>,
	Jori Koolstra <jkoolstra@xs4all.nl>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8420e667af06b1709c00@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] minix: reject rmdir of a directory with a corrupted link count
Date: Fri, 16 Oct 2026 18:58:51 +0700
Message-ID: <20261016115851.14276-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

minix_rmdir() calls minix_unlink(), which drops the victim's link
count once, and then drops it a second time for the "." entry. An
image where an empty directory has i_nlink < 2 makes the second drop
hit drop_nlink() with i_nlink == 0:

  WARNING: fs/inode.c:408 at drop_nlink
   minix_rmdir+0xe9/0x150
   vfs_rmdir
   filename_rmdir
   __do_sys_unlinkat

The parent's link count is already validated; do the same for the
directory being removed and fail with -EFSCORRUPTED.

Reported-by: syzbot+8420e667af06b1709c00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8420e667af06b1709c00
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/minix/namei.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/minix/namei.c b/fs/minix/namei.c
index 5525ba367ed7..344cc70ba878 100644
--- a/fs/minix/namei.c
+++ b/fs/minix/namei.c
@@ -172,6 +172,10 @@ static int minix_rmdir(struct inode * dir, struct dentry *dentry)
 		minix_error_inode(dir, "inode has corrupted nlink");
 		goto out;
 	}
+	if (inode->i_nlink < 2) {
+		minix_error_inode(inode, "inode has corrupted nlink");
+		goto out;
+	}
 
 	err = -ENOTEMPTY;
 	if (!minix_empty_dir(inode))
-- 
2.43.0

