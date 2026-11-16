Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801014;
	b=P0O6rfP606x5Iju7rwDbC/XSa+zAPPrJG0K4ZLA5TxR1t/0YX1eyLh6ETqX9rf+1QWKg
	 jdJow8Kg1H59OZ+IuM7xhwxlZ9J1sFUMPT9Um8BzAXXdvcjIl18hdXBJQ0fQmYxubvn8B
	 YXGsPhH6aCzc/MH5ZgcY+IkQ+IPg8g2SJb5qNlEad+e8OKXspcUFZnoW7kX35BdnyNzoz
	 MHWjAytZq8heZ1/n5Q5ZHZzgfgMNyZ9eN2f2UVaIHYNuPCcrp+KRpOUxeEQ4gIQdoRmi0
	 ofIED3wXX9cZC28zM1U4JNedv1zS9uEaVEd7dV9EjQQOhgXVXtlLiVpoj7LEoS5UT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801014;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DVKNMHiAne/pAOxESoHWHgqgvhvXGeMeX7vs9NEnLB0=;
	b=fPeIGtzu7hONEzl2VdqwXIRw15G2NoAuwzao9hut8A3OkV0ZwYKefCsRIQgzllG8cvq8
	 SURK7nPdVNH1NSp++3xlARUurT2riYZ4kxZi3T4oHrWKm1OMW2zD6JJICKPt5kldxCXMJ
	 kan0cLqyFb8NhwQLzimVC/NC0Uu5wgT8bIIvcOIP2qarqZSdKmK8BspHv354oyC/ShKSN
	 m4MNA9Dqu3qOSsvsIRH6JHjOROiwiIPBuhSH5fUMR8us/KoiKSbvSouIpGfDK+KCU617q
	 mdMC0ca4LGRv7kUJHc0NHBYHGMkdwakKG6ojvce0zn0GMivURWrheP1SF08tcyFNJ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xzBAUww+;
	arc=none smtp.remote-ip=61.135.153.170
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A179606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A179606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=xzBAUww+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1794801011;
	bh=DVKNMHiAne/pAOxESoHWHgqgvhvXGeMeX7vs9NEnLB0=;
	h=From:Subject:Date:Message-ID;
	b=xzBAUww+EDLZa2iabiRT2mUl9FeyxuRXjHXf4LoDfNjKUAZAJtUL5EwldZ+jZ8X+o
	 Hsgw2uAugyIGBZqbGGw8NhCVf6bakpu5Upj194dv0cLPaP8KXW+J5vzbz69uNsO2L+
	 6yuXNbqLFV08/lXz0u2H2QCa5bhzYnsimeGv8vDA=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.34) with ESMTP
	id 6AFA7D6500000196; Mon, 16 Nov 2026 11:50:01 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 087026292468
X-SMAIL-UIID: 7972829F43C148A3A8F8107745C86F51-20261116-115001-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+667788430769ef9ddf25@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org,
	richardcochran@gmail.com,
	driver-core@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dakr@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] ptp: posix clock is available after it has been successfully registered
Date: Mon, 16 Nov 2026 11:49:57 +0800
Message-ID: <20261116034957.40991-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6af9e1eb.920b2b3a.148c65.002f.GAE@google.com>
References: <6af9e1eb.920b2b3a.148c65.002f.GAE@google.com>
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

In posix_clock_register() (kernel/time/posix-clock.c), clk->dev and
clk->cdev.owner are assigned only after cdev_device_add(&clk->cdev, dev)
returns. As soon as cdev_add() executes inside cdev_device_add(), the
character device is live and can be opened by userspace. 
If posix_clock_open() runs in this window while clk->dev is still NULL,
get_device(clk->dev) is a no-op and fails to acquire a reference on the
device. When the file is later closed, posix_clock_release() calls
put_device(clk->dev) on the now-initialized pointer, causing an unbalanced
reference drop that prematurely frees the struct ptp_clock; subsequent
invocation of cdev_put(inode->i_cdev) in __fput() then accesses the freed
memory, causing a slab use-after-free.

Reject posix clock open if it has not been successfully registered.

Fixes: a33121e5487b ("ptp: fix the race between the release of ptp_clock and cdev")
Reported-by: syzbot+667788430769ef9ddf25@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=667788430769ef9ddf25
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 kernel/time/posix-clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/posix-clock.c b/kernel/time/posix-clock.c
index dab37295c8c2..37cc015cd8b0 100644
--- a/kernel/time/posix-clock.c
+++ b/kernel/time/posix-clock.c
@@ -99,7 +99,7 @@ static int posix_clock_open(struct inode *inode, struct file *fp)
 
 	down_read(&clk->rwsem);
 
-	if (clk->zombie) {
+	if (clk->zombie || !clk->dev) {
 		err = -ENODEV;
 		goto out;
 	}
-- 
2.43.0

