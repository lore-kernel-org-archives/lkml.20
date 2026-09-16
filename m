Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB084BF933
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598464; cv=none; b=MdzJc/p+rqa7UbPBM4unhCKW+EgcskuYGYZmIOskWJuGxXuMAwoUdMxza+bEer5JbY/eVs7M46CsfBzDp6DRHrAtkJk+J0gLRdyyjuRhDsAzfDg/l19yISmyixCLsnuQVVOgPww1753XBtG6+kuYLsdp6tsoRqSiUJ6TKr4tAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598464; c=relaxed/simple;
	bh=wmJV7UlkNABprPy5JGp8YnLyxdnU3PP/y/DAmlXHOHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oEwWtrmE5PLuUOYhimRUbc3/gJAPovRhcsLTgpvYQgs6u4uLhHnv4xMPKspFE4GpHIvokh4Dy3aR2iaJmhV4JqMJly49qLNFR0/9Y+isr0sLKjhpfypNjbKsY5LLGlICtWla2AozMMHj3uw4uiC0WqmZ/xYDsFuFN7FHHcDMlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+ca20Tl; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+ca20Tl"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so132289a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789598453; x=1790203253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5VttPhmwrMHoUqXXmaUFtTG8MKFE+6yQbb1G29GHpw=;
        b=E+ca20TlYAKR7jADSMiSZdYQPNm07r5fQRGxm+goZ6cRTf72Ry5XTX2BKs4GQuvWFG
         jPr005C2MfVFWe/fbn4bzlob7KhOvKMxsYaxXGMarh6EPnwz+Qrdyp6JYHPzHfjwRwU8
         89EKzHODEQeI5uilkq960hbBH10vazjBH7mmfouG4VQsQqlMRG2XKboNOMYv2J+3TTx6
         SIfrkiTK9KITVaq48lacaJMZJMGwNqETnEb14sodkN/Fi7UV69rJI/i6eYg96uk7Pw5s
         zfeUEK8WNdsg5djewlNlhHfr8OpY/RFcikY+kbLLPfg4xQlBaQhX4HHn4++G/Kp1J01m
         lGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598453; x=1790203253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5VttPhmwrMHoUqXXmaUFtTG8MKFE+6yQbb1G29GHpw=;
        b=qNSPI7p0bGNixCaFVNMXyAgkhIJ3TP+neRuGlcLtmZ/lzLKRA0V3BVsYfz5I+/MVcK
         ngvmFi4mTRNoQhdej+TXn7RgMLawm4ZdFWH5GB20101Di6K2gn3b6v2b/Y0DSAAbwNHd
         NWlr+coNdKQ72az23fG+/qGmuJnhhHSxzMqf5MlOVih4YkVgFZAu4nlTQ1rYFIxyfxpm
         5tYroVNYe6bjH5T0xEfELXlMps5RYPlYVBQ9HYWNlAZ20JU2CDdLOVFAMf2AIZIQevMr
         DgfKGUxKnHXIdNApr3EBEq1t6bqgWZU1bROYAdbGgU8deiUdDOzfcvM737T3dVYF4TLO
         +1/A==
X-Forwarded-Encrypted: i=1; AKwUvBzeCkIIl5vdPd/Va4hWcdsVz2p8QDLfGpMY52+26bx60k/jZBA0I2DTd3e9vIqCQk6I42KFJK4v5cUsQrM=@vger.kernel.org
X-Gm-Message-State: AFuF++kx5lBdHDzTR9DhXexUh8DcxPhoXRX29yvwps+nHMIAnh2ruVR9
	UUIP5FgNLfHTuMXm/LPUuBUORbO6Yo5R2B8hdbLBtQi7eeI/wDaSzTfi/8iLv49k
X-Gm-Gg: AYBFou1OdszW79tGEPkAMXtn8+Kx/HINTYAEZCJaalJQfpTbtGV0JPvKDbOOM4ryD8u
	qDu9iO7Chc6haUeMKwP19KLbfYbvP16kRd+JCbt/K73MALbK5ySl1ifRRJiNla3kvcvrFbiYOV5
	vXko2GzxVOgUHjJPSmbcL0mgBv1kEoORoTa3F7cNWJDq/UjpWNSahgPhWTFtW1fhm03jHAdkIvi
	3Ijip00T/X7nhRz+zeqVYd4fCP/KgjxaGH7ewpovK5zqktmf2IrikW2rtDcvo7ValN1ZpzCacYB
	KXWcQFYaCJ2pxVQ8V7xjHNxkuAOLMK0cZRY79Dw6uG+wmMSmVtjCpnH2QUR+1B0nRxytAc0K3xv
	8ecJb9iCg3b0gWBXTQ7PA+55Of4HWINGX9Y1QnvZRNcitdQgwaLll7U6+a8UWwYZ3vGugozO6sL
	j2jJU/fFq+kRnnEUUxUCyF7Gm4L4RAdTo3YAJnYENSqWse3Ichdxfv6BL/7wgHMiFWJpv42u15t
	1FLrk1L865WlomrhvLkC84vdjxm1jJWgTbRb4KGBL/aEklnCgMw1Q5QXsdI
X-Received: by 2002:a17:90b:4ece:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e1e491176mr13405869a91.16.1789598453080;
        Wed, 16 Sep 2026 15:40:53 -0700 (PDT)
Received: from bazzite ([2804:1830:101:9875:e21:c5c7:50e5:d44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb05e604sm8941720eec.12.2026.09.16.15.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:40:52 -0700 (PDT)
From: Davy Felipe <davyfelipe34@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Davy Felipe <davyfelipe34@gmail.com>
Subject: [PATCH] hfs: return -EPERM for unsupported setattr changes
Date: Wed, 16 Sep 2026 19:40:16 -0300
Message-ID: <20260916224016.266800-1-davyfelipe34@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_inode_setattr() rejects unsupported UID, GID and mode changes,
but returns the value stored in error when the filesystem is not
mounted with the quiet option.

At this point error is zero, as execution has already passed a
successful setattr_prepare() call. As a result, unsupported attribute
changes are incorrectly reported to userspace as successful even
though the inode remains unchanged.

Return -EPERM for these operations while preserving the existing
behavior for quiet mounts.

A chown test on an HFS image reproduces the problem. Without the fix,
chown 1234:1234 returns success while ownership remains 0:0. With the
fix, the same operation fails with EPERM and ownership remains
unchanged.

Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
---
 fs/hfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index 2aef3c36a150..cce3a7bb95e9 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -663,7 +663,7 @@ int hfs_inode_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	     ((S_ISDIR(inode->i_mode) &&
 	       (attr->ia_mode != inode->i_mode)) ||
 	      (attr->ia_mode & ~HFS_VALID_MODE_BITS)))) {
-		return hsb->s_quiet ? 0 : error;
+		return hsb->s_quiet ? 0 : -EPERM;
 	}
 
 	/* map file permissions to the closest allowable permissions in HFS */
-- 
2.55.0

