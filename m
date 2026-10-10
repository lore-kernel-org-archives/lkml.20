Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5626FD97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607965; cv=none; b=gnyTdXCLHFrHGXxeaCfprAZY6WEkKyf6xWyTozTSOgBjSlzuCd2MnxV3JNK2AqI+2mLMpG/gNa9w4V116EQh4w038N5FF5/kF+MnAofkmNntcw2zFLu3XooyjaNqpcUh7sBV/5iqCnUuy9297FdNgP7/1D4Vw9UbSdR+pSJOfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607965; c=relaxed/simple;
	bh=indP8u5ErlDBlEbDJ73E7lpccIOnRAgGO3JQCr6tKuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjMDL2BN5VZyWoUyxY1K8hgm9CPBD8A1J8CUYIdLYSewa5KafKZV3tp/V8/J0vANPODNODCfJpBve/iQpP+E9gzZeIhBkShcBLq4ub/x2OVQOKKRwrGwPDFf0Dy+oA6lVnav0KtursISt7rS/LH3HVuDijkv/C5kzypjxmT7Tm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=m1sUtJMG; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="m1sUtJMG"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5339733feb9so3465161cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791607962; x=1792212762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dcJoubrr5zFEKtQA78Ir1Mu8Xuoy77V/79B9yY3I7o=;
        b=m1sUtJMGyBzEMeM+pRTWXLsSofS7AZ1sk0jFrVI+ZZ8pl65V8zTBGl0W7CgAVcleRA
         InkkLKvmVitKiXkr/yjaM/5pNOxq6+It3IRduFubyHgDD3ZtZgOI+pVpO7uFWfWCsw8R
         1CshHAfkB7/XwlOEm1x/5qcUqrNUpG3ocTiM1VkcJUrjlVoUTPq0hIGeuRzlmzGe+Get
         Wo1jjcGafap5GiEZ2ZKKnUPPfNlaIxAazDmSvp7MFTp9iIbXu/jeUKGAY2dD+DmaT48T
         HnRxpBG+vURU6uTDG2/djRr3tyRxiRvsxPTKcuT98pm2ijGnTHmjy6Wzg/pUNKpNQVUd
         MgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607962; x=1792212762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dcJoubrr5zFEKtQA78Ir1Mu8Xuoy77V/79B9yY3I7o=;
        b=b170BeKjcBrKPrRy/KNp32TnTASWCkbe3fMclTYan6XSB5PztbW3cIf1Ut3YgZSy/E
         xCHWHjrJ3jLwia9DhvJIXwDIAevKb6HrYUX7B5odqETlD6YorK4PZm3nyWpUw+qgji38
         Z0opdlrQdrAsP98WbXG9NHCrVH6GtzjtBcRwoRHD2Czb7VVmzm93kLtefVT6i5gnI15X
         fxYvELOVx5Ia9pwdilHsVzo7E30etFp9gLPbjir/1U8jFk/ML/ugzsC4NklI+JyJoSmu
         /my5dnAYtp85/O7dpiTFxcsRqQCrIKayhHhrGeWHbEHNiyHKfppjVCBhh+0X0ziT/lrs
         3m8w==
X-Forwarded-Encrypted: i=1; AKwUvBxj17lb2y8DAzXVBEOoVXhmAVmHyW9qk4qU3ZBEVmR+e6SJYlyCwqzK7gdJ6UaMoorRx0Ta5TWexfcFY7c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2VpskK3oEzpKex4u6xoOwe4hGy9rndCcR1I9vGgxSzwbCPiAW
	Xse7SxSDeufge9kisMo3d9meb8ScVKzYBcRTSOnybyykeWx8uYYlKPA6a3K9lV/GGg==
X-Gm-Gg: AYBFou0OkbGdHtKBgHQS5/kLJgiVrvWAlYWs0Yu7yONMaDLsYYq/dHoW9HN+RFLggHg
	S8ugs7vZ+oKXuDW8JGzxLVLyWPlNH9F9rxfOTWbZOa1zQUngraIL6Z6TBmo0UivaoIJM+3XR17z
	TU0KHa//YOo8cRdTbPKdF3cTpvFKqkhfRR7L/SsQk8O5/XOL3+QsWSe9WW7XtoUYadnLBvNBoPa
	eaOieHyWJFpAgdmWicC3Me8XB3ByFgHgnRsrsYsZSViUrv/8W2L3ekzOjxV+Q6WGQOo7ESEmktr
	izGbXPYhojO4ChrlpnyvRfN+eUDLX2Ug876empdIuN5MRAm1gi1EnsgucdYRc+Hyu3jQ7WxmGOp
	l03b84enhQypv5al99uaiAQ3PbMsD8ttej7BrS0T0q70OB21JC0XuN9X3HTq/xZqdZ0sdF7xtk9
	DaYN37MjE9pUc8GReEITj6y599Tqaaru2Q5al6n4q1QFDoNxO7v4mjpKn7FcbrnfAPQ2QQQKQVK
	EgqptPF6UBip1qlcQJoJg==
X-Received: by 2002:ac8:5f49:0:b0:535:1a66:d406 with SMTP id d75a77b69052e-5359fb31582mr72152881cf.29.1791607961694;
        Fri, 09 Oct 2026 21:52:41 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501750fsm36208786d6.14.2026.10.09.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:52:41 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: restore the file size when fallocate() fails on a sparse file
Date: Sat, 10 Oct 2026 00:52:06 -0400
Message-ID: <20261010045206.4051041-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a sparse file, ntfs_fallocate() first extends the file with
ntfs_set_size() and then allocates the clusters of the range.

However, when this allocation fails, the function returns without
putting the size back. As of now, a fallocate() that fails with ENOSPC
still leaves the file at the requested size, with a part of the range
allocated.

The issue can be reproduced on a volume mounted with the sparse option:

    truncate -s 16M img
    mkntfs -F -q img
    mount -t ntfs3 -o loop,sparse img /mnt
    dd if=/dev/zero of=/mnt/hole bs=512k count=1
    dd if=/dev/zero of=/mnt/fill bs=4k
    sync
    rm /mnt/hole
    sync
    fallocate -l 1M /mnt/f
    ls -l /mnt/f
    df -k /mnt

The fallocate command fails with "No space left on device". Before this
patch, /mnt/f is then 1048576 bytes long and the available space has
dropped from 912K to 400K. After this patch, /mnt/f is empty and the
available space is still 912K.

This patch will set the size back when the allocation fails, with the
call that FALLOC_FL_KEEP_SIZE already uses.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/ntfs3/file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 95dfe6878860..98fb4116031b 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -673,8 +673,12 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t vbo, loff_t len)
 				err = attr_data_get_block(ni, vcn, cend - vcn,
 							  &lcn, &clen, &new,
 							  true, NULL, false);
-				if (err)
+				if (err) {
+					/* Do not leave the file extended. */
+					if (new_size > i_size)
+						ntfs_set_size(inode, i_size);
 					goto out;
+				}
 			}
 		}
 
-- 
2.53.0

