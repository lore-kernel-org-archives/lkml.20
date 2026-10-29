Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257073;
	b=lHB64Wt03zG4phFAwVPycmVv8iVU3V81XzoxTdkg9XpeBjLR9FldNQUhHI21QQZ/aEU9
	 Brgb7NsJesXmi0SHojMw+kNKMRQtZmJgBTJCOBBlI5xEBKiwcT+DMnYRdzM+yiQP3VzmE
	 M83iafDnD2FtcMBGkrZLcS5LTcgkrx/lueZD0kkHDa0DITB0ZJl6m+n+CyllqLuBZ4zqu
	 sqtlG4OjlRVRDY4X47cU9xQAUaTS+loDCcUax5q12qJJ8BN4G4GqDWDdjBmsISfYm+GJ2
	 +miRASx5EKBGuT8HcshJP7dz2hUdvvEgNDI4dgovbM4tcyzFrHchLb0sv17h/onYfDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257073;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=W3NmM9mDvxyk5gB8yJ3Yoy6pCva/lWLj9+Ej1QlBC5c=;
	b=msZf1ddVX4DziBfwMooegH5yM80aQx4csxoqkEAbJR8kYmoFH0zbeCWwRqm948tItBhW
	 rHb6FEIA6eD/2Dbql6/C7/5hqoi5ZJplhUkaOEzYvJyp2UOvGPaW+4cMJlnqZhpyjm1D8
	 eZnX/h8oDg2Dzi9Dd1qsVunLHUW2OUSEwHJpn16CDZeNmD5++LaS/cpXtO2MOd/95LNGf
	 9/R6fGpAiHQW9OtFbjWnMeX5jEIzRsV7qmnmnLLjPtEnMAwvxRr5L9eBQ3dP44428TZP2
	 hvfbOxR7XUibQhqxSmEt1RlhE5rryrREy0k2+ppMF38xKFLvqwZCS+PLIn/5ziY/C8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=hMEGnkNZ;
	arc=none smtp.remote-ip=202.108.3.19
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FA6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=hMEGnkNZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793257071;
	bh=W3NmM9mDvxyk5gB8yJ3Yoy6pCva/lWLj9+Ej1QlBC5c=;
	h=From:Subject:Date:Message-ID;
	b=hMEGnkNZcQ417vFqBqNjXak9gg0ITkY7VHL3hLedocxe/7W6HCtq7KqXLy1gfdA4Y
	 FlLiB3Srw594IzHTKn67oZS38+oc3AZgMAjGyW37thMLdOlRIxW8LjpHTHUoExMB0M
	 FtYHQq0/pY/pwAkQ2TTaukZ1FyBpcRjP8PdOkdP8=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AE2EE63000051AE; Thu, 29 Oct 2026 14:57:42 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6550524456956
X-SMAIL-UIID: FC015026F41A464CA73F2E05D4E274F3-20261029-145742-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+39e465d3f7a1555b0f96@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] possible deadlock in blkdev_write_iter
Date: Thu, 29 Oct 2026 14:57:39 +0800
Message-ID: <20261029065739.320434-1-eadavis@sina.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 330517c63aa9

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
