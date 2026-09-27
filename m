Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23A231A3B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790486136; cv=none; b=QbnmafaRMygaPB38CGqP8RXh6y96Y7AVBOPK55KlOSatoIco8W2l3d4gglI7yntTKuqAzFqdCBlNM19zmnNzout5Xvml3kffIuM7Q+09uZCP2Ld0GGX3eGj9+jJV9TLeNR5JVijI4t+dXEs2USxKJA9mx8Btx87rM0b0+mdrGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790486136; c=relaxed/simple;
	bh=H1vpmDd5WB+FOr05SbJeKBR7M/NGBe7t31aKbMuzHLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUDYxab9JGnpRQk05qUMtYH2hkAi+YWj4UgonY37rZRbvNKeBufq0EabE2/iLeHf1cyZOr7/1VezUHSMMDjZfiIF4kMitMVM7RijtqITNyEKcYGVKyFAmevENJVZv989muuf2EDJpGGzqzKu4oo9VCgAh8Fb3mdLJ3LeDZc1d48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg8HHXy1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg8HHXy1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so9139225ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790486134; x=1791090934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZV36k4LG5hOENl2ipOArtqLUiTWzZUggvKm8WD05KJA=;
        b=Bg8HHXy1Dl0DWzs83lQvTNbZGV/WqYK1wK47wgDjLTPYkWrPabJtNkhoAssyCYZz1T
         z7UMVVmnEjUmVpCqzIJzjhaZgEkzaQ7WyDteOkO6BGAX+GPnOkuP0+/FyUwUuwn1aGGL
         utXceiwhnpsbQpSNHnJeA4NrK0an/7+K/DdH7jQb8OdMfMubVPe+1B4ZBbd+sPJtPIyn
         AAbBQKiGNOp5HB8kU/YkxjU/B5w3cVWiy/6noVr1qqegaGaFv4XFYK0Kca/yYkFPgUA4
         YZSPeMvTa3GG7KxhWjvZ5Tgdv6Jox/K5C6Pt10NuCflOS6lzxBX5T0HgNKzRgxQryLKe
         bVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790486134; x=1791090934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZV36k4LG5hOENl2ipOArtqLUiTWzZUggvKm8WD05KJA=;
        b=2KDLE0XuMcTkdjcCTtzWDiBjs1nDMnLr77ZRflALCSQCjt2kgXyFkPVlHv3shLKtMS
         rMAG66monJmMLb68r3fVca0AKpS9DEIs1wdncdI5AUB9ZNwbfzfDpUI/ldHwNWmbu/c1
         euoQvDlCpCwuCif6EuA5+iWoalvGOu/uR6RSTymLtGdPlfMc/1j1cu3nwVrsMerJYu0q
         tTkkilkmYWxopVNBOPrxqUirAK4P9hMZusw7wSpL7lyZsbH+ftYf7DLXHhS7MfrnQRf4
         KFiwdMWO5wFZk7SCb16+Lz/YABdVIIc1EjrROvKmfpENrS6/TvSGhVaEiWhASSMA74w4
         N5eA==
X-Forwarded-Encrypted: i=1; AKwUvBzjieLcO180sBSiSaSjFCo3DU27vQWsmcAMNnsYuNth8VT9E8+HpT4cjJgrfmmBjDPX4Nmx/xR07BR8w88=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi0LddsK+ooCJ5WUoIWP17LHQLpOnBvHZS9ApmkApGhLAVkAJf
	8IKRE0cOKLHPNh16GMUvG3GVlDxpfFH+STSkkfJEa9qiaIBFAcAfr0EA
X-Gm-Gg: AYBFou3hGq65P7M8A2cL8PdzZVHYDQswHFGaV9lWz4/SUDIreEjp6llD0m7pUis0Aos
	E1RdV3LeUdWHGF6O5WMOJz1WF5assgO+ogN5YtFjygrctuMwzFEoDrNNFYDxgsWW02onkBgFi6I
	+2zTwq2bMBkCrWl/kxYhEXMnG1SIWz0pFdjJi5RcxFD0IBj2WgZCpswLh1ZuSgfmWlLkpI9wYEd
	K4qRi6AShshC+W0SXfFwLsZERxZxnaVrGX7dV6x3aQOEDktaQ9XisMoPp5N2y3tat7e6NgGc/mo
	QBFJIauIpK75L1Upx3YNPv9UFPjQyIk3C3bFbfPdPwTqasY8BgxPadtHXLVWBERodAZ6o3m1+O/
	7lmT3OBFwKMT5IV2Vjhm7HIvrMJqS24YRtYrJA5odPXvtfge7azMfIGRlieqca8gNeVHzS1hUgw
	x4GERssIRU1TutZCCu/Qvab5Ae6R5mxFOAbESg9Rj2K3AyLLLN/CqzXPlbo1fWd2G9PgJid0TRe
	pN+1a60AxTtRACO
X-Received: by 2002:a17:902:f552:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2df7da424a2mr80618055ad.8.1790486134390;
        Sat, 26 Sep 2026 22:15:34 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91460aaasm26296305ad.73.2026.09.26.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:15:34 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darrick J . Wong" <djwong@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+afa7aef0c237038586e7@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] block: make blkdev_fallocate() zeroout killable
Date: Sun, 27 Sep 2026 12:15:28 +0700
Message-ID: <20260927051528.34698-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blkdev_fallocate() zeroes the requested range while holding i_rwsem
and invalidate_lock exclusively, but does not pass BLKDEV_ZERO_KILLABLE
to blkdev_issue_zeroout().  On a large device that falls back to
writing zero pages (e.g. null_blk), the loop keeps going after the
caller received SIGKILL, and every buffered reader of the device
blocks behind it:

  rwsem_down_read_slowpath+0x61e/0x920 kernel/locking/rwsem.c:1086
  down_read+0x99/0x2e0 kernel/locking/rwsem.c:1539
  blkdev_read_iter+0x2f8/0x440 block/fops.c:854

syzbot reports this as a hung task.  BLKZEROOUT already sets the flag
for the same reason; do the same for fallocate.

Reported-by: syzbot+afa7aef0c237038586e7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=afa7aef0c237038586e7
Fixes: 25f4c41415e5 ("block: implement (some of) fallocate for block devices")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 block/fops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/fops.c b/block/fops.c
index 2ce7c6c4714e..a2fe27d8ceff 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -909,7 +909,8 @@ static long blkdev_fallocate(struct file *file, int mode, loff_t start,
 		goto fail;
 
 	error = blkdev_issue_zeroout(bdev, start >> SECTOR_SHIFT,
-				     len >> SECTOR_SHIFT, GFP_KERNEL, flags);
+				     len >> SECTOR_SHIFT, GFP_KERNEL,
+				     flags | BLKDEV_ZERO_KILLABLE);
  fail:
 	filemap_invalidate_unlock(inode->i_mapping);
 	inode_unlock(inode);
-- 
2.43.0

