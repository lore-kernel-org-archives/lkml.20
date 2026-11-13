Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530284;
	b=cTA022OrtrIVFMq/mfyY0FXlb16fmTM/ALxiUUIspwPIY6VqfZr+vEqxcBCt4NhBTPLN
	 f64FB//q8DGkZSHHtq+FlPzWEaLqlh8JRcnAA6FB1Ib1mrzT3j1eKSitYlE4dEDytevRW
	 NEWdDYH4pn6FMxXt4ko7+Vrt/ERJmx27UUlwpJQhMq9w4goNQWmDeI2zSEwKuPgTIMSWY
	 Z7p6LKEycxkcbqy7xTu+vZdjrLK8MoW7T90tuSR30NyY/BIp4JrjUKMqF9lqj4Qy5bxTb
	 ll/3E8c71ijJLfGPlIPHGTqo11r7FxJo4lnKi7J6dWgTIOd/APbAhlslIgpx+Nx+u3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yvnB08mB1Yr/sTOxjBu451e6X91xT4mCIJMKnwmb83k=;
	b=DX4Qb9k03TANwyGSpzHVILcR2OdfAX/RiLb61ekHyMZW08fWTG1hsNTI8Cj4imTcCPK7
	 jKyZj10l170B+4N27o5rWK6gCjC3r8Iw7/X/RIvkkA0YcvXN5DrS4uZvYGb6/kgAD+bj8
	 ElUIakG/8tviHkDdgUyE6g3c8agqhxw75qg3JjkbkGxV+fQwVz5RO7S7opxhn9R4zx6Vj
	 a4Hq42Mqjwoqvk4pJSGjcaWiNmw/hM7Jjo0wdM7h7Bv05YeGbYp7/uPiFGST/b5TZmQBI
	 bosZGvra5H7QE4t8qmvT0pnC0fWAHnFKEY5v/3f28h8CqKJgzjHbKP7w/gX9vewDL+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VETePA8S;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77775606A899
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77775606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VETePA8S
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be1e468a8so318208d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794530284; x=1795135084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvnB08mB1Yr/sTOxjBu451e6X91xT4mCIJMKnwmb83k=;
        b=VETePA8SaTBgwPLR66wcxj/CWzGZGW63wgzGCaPpKDKjyzEs9IvmpDWjHpmJl/Bfrw
         1JCHbgUiUkPp07I+aq0kzZc3Dv8jk13hDZomic25cNl3OIn4qiSfB65ItZLykcrJ6Hf9
         Ju3iElnm19xcrdrtwNAFK5elRtPYfkxbRObQLxW9TMneYKG9yMolBF3799fWxvu2qBD8
         9HrBMLxM5q7PzeV2UoSffiPZbU+lS6tCAA1baFRgnLAl0A+pGdrvbmm2CYmELQAO+vKh
         3I14/QaL2nCTo1pFaIR10Kc+O9sp9j7VN/4Kquv6AeTUPaH+B5g6l/+XvFOrzdsbnZf/
         KPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530284; x=1795135084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvnB08mB1Yr/sTOxjBu451e6X91xT4mCIJMKnwmb83k=;
        b=oICHGVG8Uc9/ZCdMxVKCDYFlZlxQXhC0YnrjBmyx7G+fiRgxUq4goxhHmoT7KIzVD+
         h77YyoP/1zgDHhTqrN63pmA7HDM+uYmFCuxRjqYihUeXnji8laMvNqC9eEJ6PyXx7EB5
         jgxTaYGbDLp7iF51vdgxymR+ez4feXHNHXkRM2UpfTt7eK2ugjOlZI1OS+caEWC/I2hY
         IKnoWcaMmYkph5nhtxQnSulf6JZZSR16hpIKIxbMhSWpPk6AV7yPMcLis1O6wY7Y/+Xy
         +I8iQjMzkimkfyiRvm0XrKBDnZm7DTeHs2E7LYrpMBSsoM8W0rs1TrmbOpSpumX2DBcP
         kZGg==
X-Forwarded-Encrypted: i=1; AL+hErH4W1572N/IcdxAIw1cU/XlDChL4O9V2u/Y4GBaMdvRuReS6VrCxf66lFYLemkt1cESJYpgM0x6xc778p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vHoURpwjnh5siUBnnlNSnAgaJSc4kJK+1OVKpkt5SeuyBg73t
	eUwYhbnvID0fvrnX+PpNEIfJRYPFQMn2vGFPQ+gzz8/qVc12BXc51M4Yiq2PU3XGrqs=
X-Gm-Gg: AYBFou1pwGZ/1EdcxYsOCE7Jaftg7a4FBYYE5C4EKF/nr+KYfmGSXZ/vp5DPyAPO/mZ
	zp5VErvuUmfejzkCKeSp8gk3rOEedMV35r9KfFkJ5FLYmKykoYpjkNsdV+kueIPMoH7UFguh8x+
	okNuTRb+Mxaz2Y6YtiSPThI5JXsi5BpDkReCKIDkZCb8L0tslddEYHNWYHgNLXzTccXMYPBmFGW
	7lrPCiYsECwQj/pbF7Vugx/vKB/zv/VUMbog5p1J5MiYGCCpl6gXNDhYYV3PABcIiDlIEoIpEZA
	fsU6tj9Wsk6ogXFoTeObG81ZuFVwbb56wxBBZxQPIJDziQv2lmzc2BhmJcx7vS4opJL6bGmJBzN
	ShvPEeOIhTmyojrAGlx8o8a67FwJQ9KfmRnEq72i9IBZQc1y9LD88Yd4nRW/y4dMXW9LNexbfOe
	VvNqrw7i5RQk7jM0NiaLBkwPpRkQQBfs11OKYSRpbToqMBMqKho1UksXhUzFVCgiDfA4hUxeSAI
	JzxpDEyep6xlRu0M7XTGoh65I1pfYxpwWNAC4GReQTGTEDmrLxiJJy0u6jBDo0b/43K1oHQ0O5n
	N2WYP79QA5xiepv+N2dMpwJpTRoPxOr4drGx8It4DDr/B37ENRDPy3DjuoXINbDDzE2hLdTCtd1
	m4IWl49Q42vvO0/6yykSn60aKsO1qSjvAGiP0TlKrkKd8OtSFRi625RllLq0W4+YD2r0JRok=
X-Received: by 2002:a53:dac3:0:b0:67b:ea61:fe6 with SMTP id 956f58d0204a3-67d897ce9b6mr535293d50.106.1794530283607;
        Thu, 12 Nov 2026 16:38:03 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:3a31:6c95:5610:70f6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm706463d50.10.2026.11.12.16.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:03 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 2/2] hfs: don't take inode_lock in hfs_file_fsync()
Date: Thu, 12 Nov 2026 16:37:56 -0800
Message-ID: <20261113003756.1066989-3-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113003756.1066989-1-slava@dubeyko.com>
References: <20261113003756.1066989-1-slava@dubeyko.com>
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

hfs_file_fsync() takes inode_lock() around the metadata part of fsync.
For HFS it is not needed, because everything done under the lock is
already serialized by other means:

- write_inode_now() ends up in hfs_write_inode(), which is also called
  by the flusher threads and by sync without holding inode_lock.
  Concurrent writeback of the same inode is serialized by the
  writeback code itself (I_SYNC), and the extent and catalog records
  are updated under the extents and catalog b-tree locks taken by
  hfs_find_init().

- flush_delayed_work() of mdb_work runs flush_mdb(), which commits the
  MDB, the alternate MDB and the volume bitmap under sbi->mdb_lock.
  This state is per-superblock, so inode_lock of one file never
  protected it anyway.

- sync_blockdev() works on the block device and needs no inode lock.

So inode_lock only serializes fsync() of an inode against write(),
truncate and setattr on the same inode, and against another fsync() of
it, without protecting any state that is not already protected, while
holding off writers of that file for the whole duration of the MDB
commit and the block device flush. Drop inode_lock()/inode_unlock()
from hfs_file_fsync().

Fixes: 02c24a82187d ("fs: push i_mutex and filemap_write_and_wait down into ->fsync() handlers")
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfs/inode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
index ef1275bbbcbb..f1122ffae712 100644
--- a/fs/hfs/inode.c
+++ b/fs/hfs/inode.c
@@ -773,7 +773,6 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	ret = file_write_and_wait_range(filp, start, end);
 	if (ret)
 		return ret;
-	inode_lock(inode);
 
 	/* sync the inode to buffers */
 	ret = write_inode_now(inode, 0);
@@ -785,7 +784,6 @@ static int hfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	err = sync_blockdev(sb->s_bdev);
 	if (!ret)
 		ret = err;
-	inode_unlock(inode);
 	return ret;
 }
 
-- 
2.53.0

