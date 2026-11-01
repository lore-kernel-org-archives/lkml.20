Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541511;
	b=PI+keNY3/Sn2yrYehHd/8qnF3s+05oguumEX8CBZxS1e6wzX6MLE6e9nopOT0oWblzsZ
	 yy6fmv7GwjUv6H9XxQHZLVS56vwuKUz5/xcNd88TSTdQLSvpopXOb31aBvJG3vMHzoABd
	 i/yjt0O9E/TN97LSyldawC7nkBgsYAMMPWfGz2tGCNw0pm5xIBuRqrhL3+Wy80PL/ghd4
	 bmmeE58Zqc42EElWpUQwMtsvoZiX1PjEFye0Jka2v9Jbq8bgqTurtYJbiLi/W/BPqWBxX
	 oRk7c8wKT/XbvzGxghMZmCCWhBycDr2jBSs0RUqxd4VDD9Y68aDth5s8xGJuf7NhUIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0N5nUgx8ZMLxJqfyvYD6hcQNRPzT9h9VL4zQ6alvcP0=;
	b=ThaRjniksf2HtxJI6XykkueP+EzjBoVEiEh4xgUaP40XtOUkBs6cHi6PTzVM5r/l4S2z
	 4as6QxuRSIly7zBmZXXQ3bZAxMMaO+oV7jLmTXQjKGIlrEfcF1rK9qeiX0EZX6Ob5KebC
	 qumpAVM/XvKPHYw3JX8nwZa3NenDxSij7F0rPaph6Uq+KlVJ39LTsD7dIsOCY4fBkjVo9
	 Cz2E3129eHz5hHe6k9uPaZIDTBZLNdLf0mVXVvT1JI7MEFqzsaWmJmIE3PVpmu3uj2lVi
	 fCdkPZYTyN9G6qU/GEypmQLZwV4OLyky7vqT1WXFWNp3C4pZkYV5lCWMD0E3xgiDivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlkcUtDn;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726F606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D726F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BlkcUtDn
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so991702a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793541510; x=1794146310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0N5nUgx8ZMLxJqfyvYD6hcQNRPzT9h9VL4zQ6alvcP0=;
        b=BlkcUtDnQWw4+c3UyQKCqUQ36H4KdrG0vbQBpOUE8bQMOcK1l2v7e+ai434uK+glT3
         MIT1zuB1Z2p9GA/+03nkFP2tweBZU71D46he/bVjzOca28p8wVmFHjDRh05/EtHxR31g
         hv0JE3xyilWlBvfz4T8CxTDTOaP+e6Ohbwc4pUvjnVYFFVmGQwAe6oDoFrGe+e+K8Qlk
         UIrXSJFNlf7HrgKjpW6n+SAj7Pn7l6+5eQ/QPynAGEdC+Yu5sEWKeZbeNZeLjgYcqfXj
         1hJC3zl1SKVF8bVO9PDqXwx3Q3j+uYsVIFlVujDE5ypCNiiGRNq0576hocA3Y0d2oCTi
         T5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541510; x=1794146310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0N5nUgx8ZMLxJqfyvYD6hcQNRPzT9h9VL4zQ6alvcP0=;
        b=kVaR4fcaUfjqqwhm7sDLk5X6nqlfA3OYiCmTE3ArZ5AN4UzuNM4gO02ylv79f64FcR
         XCHFtV0ehGpJbWrq1zFCmvcDgZAsWXttKudq0iQc6uEdpxAxzA5Tx2jzZvCLY7vGxzCv
         qW7ig378x+xZxtrxrZhLwElZlrmgTEtTviQmMROCq0+Zqx+RoA3bTtTevArRTuVw5b4x
         9p0r1OYu9BP6K+eqJtJ3dshJ8bb8gbI3tm0IJgyMuolmgxZxrmWcLzJPiPdMfoMQe0vl
         9vJOzG8isUt2/6yZK1FcWiRwdJY4I4idum4UwuS8zQIaCQC7ZngSZjTsJH1mMeoM3NBL
         uQ8w==
X-Forwarded-Encrypted: i=1; AKwUvBwR4CAix8tylq0kT57Sz+Uol9YLKndftEULPVzEkKoK6ofbD3OtdhBcCidBV2x4+wU79dfGhFjzXMx21T0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IM4paDA6MLYKmNmwHYndUPwYi6hIf9dtYXSNKeBYZHQkmZBzb
	n17XWpEhtQGInAoehqkN9KggJfM6oC40in/QXc2I3m9hDQObzI04hEuNP9AsbA==
X-Gm-Gg: AYBFou29FrX7nik0NN0Z+cAaqXTR2AkM5lsn+rYqR5loRCT0flsrIH8nYQUQ/mTdHif
	q6c6jKLgpbIYGxgu8k/lXqG6LCVpZy/mnGFftbzIl/CANeFB9wNz3PGFtLlvHMLM4sAHvu1XtcF
	+98usY2U8FMUFpePZCZ9n7stMbDWjx7Swds72xP3hBVq5kHgO+UUxzd8jVNuKXL4CO/dumtDH6k
	h7TX7E3K0bS1At3AurwIpYvZaNAUHLA6JEs+W0HtdnvEjlJNEvBOyRDDxLOH5BjJDLNpMvjDyON
	IiBAe4SSqUZiqXjAS5aI05cGQPrwpDPatJdBFaHRVSE5Nkc0gv+e2/FA6swiThh6tKsTRyS9HCf
	bU+UdQR5Zp7Czmsxqzozlh2BU61hItikvhnNqywHiE4rJeI0srb/70VbW5uFD4kdQrMLKapCr5O
	kfrnU+ACgFKB2bykJs0burnvU0kKVCt+MB7Tj46aAxCrGeTD1FsGnEOr5TQiLwUcmyqEudkaISK
	UoN62EXCbRgf5IhkaTz9ArpMQ+DWA6ZWPQ5oReB1DqruSUHledlKITZwa9qwA5L+qhOy0eZLyQl
	S6kpWFXyXksfWEwUsYb5XohkJ96E2I8=
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr6332189a91.4.1793541510205;
        Sun, 01 Nov 2026 05:58:30 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d459:2e1e::498:63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm9887771a91.11.2026.11.01.05.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:58:29 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b3fca27eb4005f0111f4@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH net] netdevsim: check the driver is bound in new_port/del_port
Date: Sun,  1 Nov 2026 20:58:24 +0700
Message-ID: <20261101135824.24484-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
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

new_port and del_port are attributes of the bus device, so they stay
reachable after the driver is unbound. nsim_drv_remove() clears
drvdata, yet both handlers pass it straight to priv_to_devlink() and
devl_lock(), which faults on a small negative pointer:

  BUG: unable to handle page fault for address: fffffffffffffeb0
  RIP: 0010:__lock_acquire+0x41/0x2de0 kernel/locking/lockdep.c:5140
  Call Trace:
   lock_acquire+0x115/0x350
   mutex_lock_nested+0x55/0x1d0
   nsim_drv_port_add+0x5a/0x140 drivers/net/netdevsim/dev.c:1760
   new_port_store+0x1a5/0x280 drivers/net/netdevsim/bus.c:96
   kernfs_fop_write_iter+0x3a5/0x540

The nsim_bus_dev->init check does not help: it is only cleared when
the whole device is deleted, not on unbind.

Do what sriov_numvfs already does: take device_lock() so the driver
cannot be unbound underneath us, and return -ENOENT if drvdata is
NULL.

Fixes: 794b2c05ca1c ("netdevsim: extend device attrs to support port addition and deletion")
Reported-by: syzbot+b3fca27eb4005f0111f4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b3fca27eb4005f0111f4
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced in QEMU (x86_64, KASAN + lockdep) with the syzbot C repro:
the unpatched kernel oopses in nsim_drv_port_add() right after unbind.
With the patch, the write to new_port returns -ENOENT, a 40s stress of
bind/unbind + new_device/del_device racing with new_port/del_port/
sriov_numvfs runs clean (no splat, no lockdep report, no hung task),
and new_port/del_port still work as before on a bound device.
 drivers/net/netdevsim/bus.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netdevsim/bus.c b/drivers/net/netdevsim/bus.c
index 5c55c308487b..d843b3c985cf 100644
--- a/drivers/net/netdevsim/bus.c
+++ b/drivers/net/netdevsim/bus.c
@@ -93,8 +93,13 @@ new_port_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 	}
 
-	ret = nsim_drv_port_add(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF, port_index,
-				addr_set ? eth_addr : NULL);
+	device_lock(dev);
+	ret = -ENOENT;
+	if (dev_get_drvdata(dev))
+		ret = nsim_drv_port_add(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF,
+					port_index, addr_set ? eth_addr : NULL);
+	device_unlock(dev);
+
 	return ret ? ret : count;
 }
 
@@ -115,7 +120,13 @@ del_port_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	ret = nsim_drv_port_del(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF, port_index);
+	device_lock(dev);
+	ret = -ENOENT;
+	if (dev_get_drvdata(dev))
+		ret = nsim_drv_port_del(nsim_bus_dev, NSIM_DEV_PORT_TYPE_PF,
+					port_index);
+	device_unlock(dev);
+
 	return ret ? ret : count;
 }
 
-- 
2.43.0

