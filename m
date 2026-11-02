Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615646;
	b=h5+4TBreQv+hHsR8dr2t5U/UmrdfSW8dsYQabnA2DRDphnxMrHDqn1El5s86yAIzJY6K
	 AvMgzTUGgHlVHUJpnJX0FE+x2bloEbhKUtO52pTvarkWJ5VQrUTyOlNtvD+0UsnFVYo5C
	 wtGYaZ8J+WoLameESoYvgUGZpd35lAPVF1yOST4dARSGd7dAjq04EijfCbXOMaiXV/TzC
	 VgLZLaT7HlGDPsvCNUb/urjnkQTK02KRyDQWWrvh/kfVF4jybRf5FewJip34MSAEL2n0N
	 FnI0vq89syP+ffFiZoAAordyAbYMBVHD8ysaGU9Nn1hF97IJntjE/UHpQ1enqJOL1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615646;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zOuEJl576VYtRf0K3AP7aY3pIr+oXdhrrj9wOG3kLFg=;
	b=NImEUXQWrer7YkceL+tBqc06U28OF5MQ+7Y+Vwe3RNJkxo84kzmQm/EGLLLHjQVDJVro
	 PI7daki5JKKauuzARe/9gME8w7g7W73/9wyx10c+tQzgWyS6Kv3j/TO7tMkpgpn0lEETi
	 Bg9oO8FMKreTJf56W5mn9OZ9/nmYR7SJWwrMmjYfpuimI3JSKqpBNAjcXzRBnb+JE0R9Y
	 WZVkwvRLuuLZSVjf5BSJBNwo5nx1QFVAn+pDk1Sbshl3QzTVNXUrY+AXseCFwcjoSH+Gb
	 TXjv9iFhLmtLF+arrZcnIh5Ms10lLrXmW6V2sp8HDDGwM0SxkM0QIvAXEc9Xw6T5lKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=hHF4vOIb;
	arc=none smtp.remote-ip=61.135.153.168
Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C7606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222C7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=hHF4vOIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793615641;
	bh=zOuEJl576VYtRf0K3AP7aY3pIr+oXdhrrj9wOG3kLFg=;
	h=From:Subject:Date:Message-ID;
	b=hHF4vOIbK3qINx/hzviPwPT4ByY+ed8tsU6Ukf3zkuous1dvdhQqoNJbs4sWZhcWy
	 F0vTlezhxM/WFjvBTk/8x9WCjRndyKDCjfSUN2qKoXev51f1NPIAswKpsusOtyZoFb
	 CauscwCsBpr/+k5eM77WS8NVQxA/Ggi3eRdStRWw=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AE86712000031A4; Mon, 2 Nov 2026 18:33:57 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 4421456685334
X-SMAIL-UIID: AA9BDDEC5C4B40D699DF352E469666A8-20261102-183357-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+a31cda410a4ccd419712@syzkaller.appspotmail.com
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] loop: prohibit the use of sysfs as a backing file
Date: Mon,  2 Nov 2026 18:33:54 +0800
Message-ID: <20261102103354.427722-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae807da.c8ffc79a.e3697.002b.GAE@google.com>
References: <6ae807da.c8ffc79a.e3697.002b.GAE@google.com>
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

The loop driver's backing file validation in loop_validate_file() and
loop_check_backing_file() only checks for the presence of read_iter/
write_iter operations, S_ISREG/S_ISBLK inode mode, and direct loop-to-loop
device recursion. Because sysfs/kernfs attribute files are regular files
(S_IFREG) and implement read_iter/write_iter, a loop device can be configured
with its own sysfs queue attribute (such as /sys/block/loop0/queue/scheduler)
as its backing file. When an I/O request is submitted to the loop device,
loop_workfn processes the request while holding a reference on the queue's
q->q_usage_counter and writes to the sysfs file via lo_rw_aio(). The sysfs
write handler (elv_iosched_store -> elevator_change -> blk_mq_freeze_queue)
then attempts to freeze the loop device's own queue, waiting indefinitely
in blk_mq_freeze_queue_wait() for q->q_usage_counter to reach zero, causing
an unresolvable self-deadlock, potentially hitting:

INFO: task kworker/u8:1:13 blocked for more than 143 seconds.
Call trace:
 blk_mq_freeze_queue_wait+0xe0/0x160 block/blk-mq.c:191
 blk_mq_freeze_queue_nomemsave+0x28/0x38 block/blk-mq.c:207
 blk_mq_freeze_queue include/linux/blk-mq.h:956 [inline]
 elevator_change+0x174/0x35c block/elevator.c:668
 elv_iosched_store+0x2a8/0x3bc block/elevator.c:826
 queue_attr_store+0x1c0/0x24c block/blk-sysfs.c:906
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 lo_rw_aio+0xaa0/0xd04 include/linux/percpu-rwsem.h:-1
 do_req_filebacked drivers/block/loop.c:-1 [inline]
 loop_handle_cmd drivers/block/loop.c:1949 [inline]

Add a sysfs file check to prevent loop devices from using such files
as backing files.

Reported-by: syzbot+a31cda410a4ccd419712@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a31cda410a4ccd419712
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/block/loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a3325ceab484..71647793a717 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -534,6 +534,9 @@ static int loop_check_backing_file(struct file *file)
 	if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
 		return -EINVAL;
 
+	if (file_inode(file)->i_sb->s_magic == SYSFS_MAGIC)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.43.0

