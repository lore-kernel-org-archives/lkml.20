Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259481;
	b=sdA8yhMmEB8LOO+SYTVOWlwbA7yhDzWDEUYX0RKNs8sU1O9W/sH5eLXOK1RuK6BKx+5B
	 PDISCNqEcnDgaMCy9SVEHZ1mI0tkZvVdx7qV7C5FwlDw26UAj9r9mmD7T1KasktTc1XA9
	 JU5G96vbQ38YA4Got6LgbpBjG/3al1vWBgdD89qtkTWbDg1ldXvhy+14s2TUiuc71d39s
	 3sLRCsmfoasJHmi0u+IRNI0qoOpTw+JN3K4HLIvc9QgIDUUQGh5naKLazM/ysuavX4Z0c
	 8a+C0VA+aWrVw/efAjCxHLCHH7m+yCwhLcQyNQ6yQtMDPs6SOt9+GAcvSTVhKzjyAgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259481;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CL6QqpfnJhtMsW+Wk25vV5+RCK7S/uUdyzGdAZjc1Qg=;
	b=L0RJNhPrveed0X11Qfup/1MQLevttmr1GPAUCUhbeJ50Fwp4HhMr5+f0ho27/ionqJGY
	 Wj6zbOnqrKQ2U6mmNpP+ag8gSNnNMMT8vrV9zVO7hHHr7L4YMgWzfzkyZr4ATXnTPaPNo
	 yvNV4d92VK/QMTI3UFtmeeaxdV+pWbOcXdFqGzD1+tcwCjhrjJJ9YkwKxadAinSF1Y1xD
	 YqHjsg1t89I9hVo3Z2JoXC89nqNyQSooowNI9A6OEpla9fl3/Wonm/HQYEUr6tjQvYFvo
	 mRgfbU3KsJGDV/T2UJWkdOuChb4ldlWpYQqJpgmE22jGdPBqQPYNihC4JSwoSAkRc5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=vAeXWns6;
	arc=none smtp.remote-ip=202.108.3.22
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0B606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC0B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=vAeXWns6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793259478;
	bh=CL6QqpfnJhtMsW+Wk25vV5+RCK7S/uUdyzGdAZjc1Qg=;
	h=From:Subject:Date:Message-ID;
	b=vAeXWns6c+0gzL4FoScIhHCKw+lSOAVwHXw+ScZvISeaJJAb9eJugryFAWoIdm6jX
	 lH6k+aQ821yKJIco+N7SaaPKXhuIBy6ZZMuHm8LrzJ0dK5GMbOtPrh8rE9yTAuNn02
	 e5TSKNbshizQ46GtWylfNGUIm4r9pFGsIwDPGa10=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AE2F7CA00005611; Thu, 29 Oct 2026 15:37:48 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6526086685373
X-SMAIL-UIID: 34C01B5D1B974F4393E722263868930D-20261029-153748-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunjunchao@bytedance.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] block: remove inode lock for buffered write
Date: Thu, 29 Oct 2026 15:37:45 +0800
Message-ID: <20261029073745.324823-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae2d5bd.84012103.26b497.074c.GAE@google.com>
References: <6ae2d5bd.84012103.26b497.074c.GAE@google.com>
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

Commit 2fec4fd97cc3 ("block: take i_rwsem for the direct I/O write fallback")
added shared inode locking around ordinary buffered writes, but commit
1b1be9ea4e34 move the lock to blkdev_buffered_write() and didn't remove the
shared inode lock in blkdev_write_iter(), potentially hitting:

WARNING: possible recursive locking detected
--------------------------------------------
syz.2.64/6167 is trying to acquire lock:
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_buffered_write block/fops.c:734 [inline]
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_write_iter+0xd12/0x11d0 block/fops.c:812

but task is already holding lock:
ffff88802a5f1ee8 (&sb->s_type->i_mutex_key#9){++++}-{4:4}, at: blkdev_write_iter+0xc5e/0x11d0 block/fops.c:811

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&sb->s_type->i_mutex_key#9);
  lock(&sb->s_type->i_mutex_key#9);

 *** DEADLOCK ***

Call Trace:
 inode_lock_shared include/linux/fs.h:1039 [inline]
 blkdev_buffered_write block/fops.c:734 [inline]
 blkdev_write_iter+0xd12/0x11d0 block/fops.c:812

Let's remove shared inode lock from blkdev_write_iter().

Fixes: 1b1be9ea4e34 ("block: take the inode lock for buffered write fallback")
Reported-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39e465d3f7a1555b0f96
Tested-by: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 block/fops.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index 517b96c9d262..375ec2c15926 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -808,9 +808,7 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			} else {
 				ssize_t ret2;
 
-				inode_lock_shared(bd_inode);
 				ret2 = blkdev_buffered_write(iocb, from);
-				inode_unlock_shared(bd_inode);
 				ret = direct_write_fallback(iocb, from, ret,
 							    ret2);
 				need_sync = true;
-- 
2.43.0

