Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB23749FD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786056; cv=none; b=gc0ZpoTNzOlXwtOoR+V6o2ucIQmTaDWmYYoDVfeePjDdMhg33nWLhbh0jqb/N1fwZ1YUMg1O+uwA1NQAn83hoc/n5R6xMnpaXzFchyWrY3f7FlesEpvrD1SNNmajhrZdMPpMVjc7e29E/fGn1B+afFKJt1EPARtPzfVAvDIpJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786056; c=relaxed/simple;
	bh=9piVnzzTpDGOUB/XgmmsQqOPCQ1xP7svRw2Qao/S/d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pphbO1DQnnNz4dgureN8CXUl4RyCFdt6HuWcdxdCs1N6bXdQ0ekiDxjqZlywWwasc5xCcsr/5LAs0DNfzVZVEwVp5G+ReOBRS1Wr/6ixcXs+yVsSK7q7UAUuCnGFsmxc23dcXdWAT/AcW0ItDQqhKVCph29xqcBwuBXqX7Y2pck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZRoGuHx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZRoGuHx"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-88b5f43cb8aso409674b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786053; x=1792390853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8f49ADw9ZxOCEdvn9SFzc+X11PWrPoWHnRCJMWofOQ=;
        b=DZRoGuHx7nRp0Q+arhicY0mD7PzLBX8RIy+wPOLV5ScS9k9Wruwq+qIg5kI08OvDBx
         7y5mtuQoTEKSJdf4JbJFczQLoKzUGOrveV+5eQm7f7rSySPs0RYzKl6hsSsbQLAmEtUX
         /6PU09H1xh5bp5+lXp+UhQsf+ql+Fyb5ODvzIOzYTCBjUzmJ/+x1RvSSLpOVDJmYiTNz
         i62eKn0DMhTC93CNH5yM4KYbh3moOxU4KsN2Q1Tb6E+AWZshPleK8VrNkKD4T8SEMmAp
         ZK4WaatA3L6IHXwPXEBh5D0zVt5u/rfM8jJfq4GCR5kexbSLaeDlkRguaRns7iJpnEqh
         O9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786053; x=1792390853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8f49ADw9ZxOCEdvn9SFzc+X11PWrPoWHnRCJMWofOQ=;
        b=EHHCP6x2tXpvgosF1cxjjnM/Wty653pdOCM4enxXNfJM9CDYmLQVcjePu6SBuZFi3U
         oRtGy2w4HLdLo1UwgVnfaSsVevwzwO8XhheI7eyFCQZZF3Zt1LV/xHol4ZIhFb7xIIaR
         5sy5GfsDFOUA2uacKwTv8C6ACTwgLAxlc43kk7XnlrkK5F1YKNSRiYZicSt4DJWr61OS
         /2T9k1F8SidCVajltUGdqJamLmYecAjPu08uC4ledqterin4Pp3T4i16OiSfsgLqO3wf
         2I5wa25spvxgbP5TuNYzVoIBsQsZbl6Nh23NhkGtBSsQ8i/ABeJji+e8bs03DkzzSa6v
         vpBw==
X-Forwarded-Encrypted: i=1; AKwUvByliKmblZb0xfBnsy6gPR/9mOcbHhWKE9YsrlNgafF3hdmV8hGO7z8hr1/1N1VAWDSCbTcCPZAvaC5qIe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh23zpLYKPMXulHzLcHEdmWc72a/hU99l5ZJrE//u2A8hKV3Rp
	0WMOOkr7ntDHhng1JQfLivWUxCi7OvCIQCJyHaa9j86S11eLXaLAHrQyrPa/KQ==
X-Gm-Gg: AYBFou0ZnW7U6PovQWKp62R/hTIeKAGprOXwzGSxX+7/63wwW6A0QsanQixOkrxmVvp
	e/i2sxHo2zzyEF0TIKKiOLUtr9MUxol6tVrdLWMtMJhFqDyoZWGi3EAlJ/0a1jTR5OhzYCkWX1T
	UcbiILHoUqjtpG4O4a8M1BR8zgKipwFkLqotmE6faYiJ1WjyUNTU3xKIcZ6LN3Rlw8a//osTZ+Q
	bkec8UPCn9aXT/A/jZW9bKaagZfOGT1juEAUaWaiGpU4BLxDV3iqf4nPLwC3Ad5yi6q56MVTyQc
	8BGBUlinyIVa6aSx1WG8eKOSf0BkFZRHaUIdOm6c0qk3WzoIpg/tibRQph3DDepMoCcdHI/dbmc
	3naJofih5A+OHhPnbcl9XMKNe8bhm5/Odbj6xlK3ZRl2V5bgg9oOqE1Xk3PIk1OtIhhb5dIFjey
	e4uEJiBGQzK4wcu91YxTtP86p/2UWCiwhXlrQcVi1U3RuaunVHSIFrth6pibHeb0IyqlMxoMhdO
	fdvnPdFhIU=
X-Received: by 2002:a05:6a20:e293:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e16be7214fmr7296993637.42.1791786052877;
        Sun, 11 Oct 2026 23:20:52 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d93c2c75sm3990091a12.0.2026.10.11.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:20:52 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 2/2] ntfs: reject direct I/O reads of encrypted files
Date: Mon, 12 Oct 2026 14:20:40 +0800
Message-ID: <20261012062040.3826828-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_read_iter() refuses direct I/O for compressed and WOF
compressed attributes but lets encrypted ones reach iomap_dio_rw().
ntfs_read_iomap_begin_non_resident() has no NInoEncrypted() test, so it
reports IOMAP_MAPPED for the attribute's real clusters and the raw
on-disk ciphertext is copied to the caller.  Buffered reads are refused
by ntfs_read_folio(), but direct I/O never calls it.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 9c87959601e8 ("ntfs: update file operations")
---
 fs/ntfs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 007d1614b9ac6..eb8ed1959cd4c 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -460,8 +460,8 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	if (NVolShutdown(NTFS_SB(sb)))
 		return -EIO;
 
-	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi))) &&
-	    iocb->ki_flags & IOCB_DIRECT)
+	if ((NInoCompressed(NTFS_I(vi)) || NInoWofCompressed(NTFS_I(vi)) ||
+	     NInoEncrypted(NTFS_I(vi))) && iocb->ki_flags & IOCB_DIRECT)
 		return -EOPNOTSUPP;
 
 	inode_lock_shared(vi);
-- 
2.43.0

