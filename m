Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53D265621
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791436691; cv=none; b=Zp0zZxijQPwb5RmsGG2ltDwvymqpEO11/l2DqoqrrN2Y8Ed8BnmwKLhpgHBliEQSH3ZtmgxO9EzjmqW7rSKYxDNK2jHBnLkALxKTKYfML6Fm+UKfwhabB2MLRrH8cQMfiqZM4sI7+CyQP6F5T0ChbUvZqt1XqPd8+1u8QDkJ7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791436691; c=relaxed/simple;
	bh=K25jnv2p4L1k4pPo64hCRP+kpLFkxyB8fVdBs7e2h8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4jA3D+AUIMM0ZsrLqtu7+gaPxOmijXkr+0DKNHDjzUpHutbUyLtDjmClIDHm9PfK+N2kTk0eTIXgV3gbM6lK1LNaBBHkdEtuXMkN+57h5FqP5c+hkHnsVQZarYhv6NHYsRtKs2JmR/BiCxoK1Jp4QCS5vcE2FVvvylbpn+vZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCtPmrYC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCtPmrYC"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso1315386a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791436689; x=1792041489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DpTgnww+452bruhm0n4E4Dy06w8HMJjZi8g9dGEf8PM=;
        b=LCtPmrYCTZlh9YURxerZZV8fLpdYqv14BdBefV8iyP5XH2sRjImFEFWZthVyTy7D2i
         J3B+ene6l9qlwP0V5cpeS5DD6dMjfZRPtQuXOXcCt7RuTvIPBI+6FiLfpDUlduYTB2Bk
         KB9j3KHUed2zlaGLIOYMoRADkqOsz3LvBoBob1w5vWA8Z6nyOnECOi+4JPNlsGuqxuCm
         08BRrmMyRqATeFd2yXj+GaoN3oKyrNcouOdSUaYBbu50iEwcr+NUCTvlPx8wkVKgla6a
         td8G5b1O7tYKVHh+OGz6Xn6mwMxaQkCp/AXWfrtQzcWjP9wAcS+kx+8GQNt31HTc0n7t
         fclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791436689; x=1792041489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DpTgnww+452bruhm0n4E4Dy06w8HMJjZi8g9dGEf8PM=;
        b=LcXf3qDxUuh6SDSd6/FIkdP0CHcqs9GXK2l2itRExg0/6PrutBstwhzzrMM+9XyvpG
         W5ftiXhftilk6Y84rOVPf/XLiKIvZz/pU0YYA1SovEABUUCCz6ZPBRMn2mjrUo+6ePLS
         KG98mrSvoCqeuhNH3D03BV/GyORtLlU1GyioHdZ+Oq0yjy2GDOpbjCNEpF2PMcooqu/J
         tDWQuzMjtLgdqcAqHMgk8GIgxmLpw9BVhb6/RL4jNK5y6pll6skXj6lRXUNHkAmEUX1X
         UnK3sq0OQUmnJScJS7Ny9H33b/8CD+9R/xnsDRJ8E1FWxb36IVh/ctbZtW/goTDKeNwO
         quXA==
X-Forwarded-Encrypted: i=1; AKwUvBxs4g1VZo8CKbyQzh35n6aSj+oivuiZtSDyITraowODG5HJiNDe1WBSiT6COfipMyi7fdeQCjjjJjJetJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqy87jWJoyHZWzYQqjgNnaM6+x8Naxcuw9bX8hDykTEqABj23l
	pQ4tc6NifChMmHTCg8rQz0uRfVHZ807J7tJYof54pouHi67CCzk8BH42
X-Gm-Gg: AYBFou27iE6xWqX82NYlY6wyjUZfA5d1IZYSf/T8dpt00/IJIje5thim359EuweRVLW
	SHuPdcrVVIS/81cdbVWWeIBES4BvnMue+ZZcFdnxmXs5oSFA6LozWvetAQGSAR0zMVlKfaNG6nK
	EdZlZfrgpdDnw5aAy5Rp8o4cKqhNZSOpTnRDBJ7eyOz8iw7v5yyXShF3R99v131QWT4l/aLgmn6
	UYPlDKirvsgeGS7PvTAUQSEIjcpfel14crWCTlZe/FzNWZO9Cb9/epfpXSOZ23gti7Xc4KyzXrJ
	satTD9w/9GcZBjDO8d4nwJ+sgxl5QRFcDjuPomoUup8ixXBJVP7Fq+BCherL1l0vIq59ZFwyTMY
	zH0hdJ8Y0hcXPiyRx+eKJ0Bhx6jZi/7+Yylq7JFZVG/KgYqkwPkzIFKMYZ8pYlQ0Szyn8xwiPWV
	YWC80aPG5csCrS88vaogNLC/9PUMM2ehTY2fYXBmrZsql7qnFfdPzxhaYbBZ7UcsFR6aMbEp6Se
	De+2Q==
X-Received: by 2002:a17:90b:164d:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab04135113mr533585a91.41.1791436689169;
        Wed, 07 Oct 2026 22:18:09 -0700 (PDT)
Received: from dungbv.. ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a92d6161sm2349155a12.16.2026.10.07.22.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:18:08 -0700 (PDT)
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bui Viet Dung <dungvn2345@gmail.com>
Subject: [PATCH] Bluetooth: selftest: Pin module for selftest debugfs file operations
Date: Thu,  8 Oct 2026 12:18:03 +0700
Message-ID: <20261008051803.526248-1-dungvn2345@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An open debugfs file retains its file_operations pointer in the
debugfs proxy state. However, test_smp_fops in net/bluetooth/smp.c and
test_ecdh_fops in net/bluetooth/selftest.c have no .owner set to
THIS_MODULE.

As a result, full_proxy_open_regular() calls fops_get() which succeeds
without taking a reference to the bluetooth module. When CONFIG_BT=m
and selftests are enabled, a userspace process can open either
/sys/kernel/debug/bluetooth/selftest_smp or
/sys/kernel/debug/bluetooth/selftest_ecdh and keep the file descriptor
open while the module is unloaded (rmmod bluetooth).

When the userspace process subsequently closes the descriptor,
full_proxy_release() accesses the already unmapped file_operations
structure, triggering a kernel oops in full_proxy_release():

  BUG: unable to handle page fault for address: fffffbfff8056f03
  #PF: supervisor read access in kernel mode
  Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:full_proxy_release+0x8e/0x140
  Call Trace:
   <TASK>
   __fput+0x39f/0xa60
   fput_close_sync+0xff/0x200
   __x64_sys_close+0x8c/0xf0
   do_syscall_64+0x115/0x6a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

The issue was discovered via manual code audit of net/bluetooth/smp.c
and net/bluetooth/selftest.c.

Set .owner = THIS_MODULE on test_smp_fops and test_ecdh_fops so that
debugfs keeps the module pinned until the file descriptors are closed.

Fixes: 64dd374eac15 ("Bluetooth: Export SMP selftest result in debugfs")
Fixes: 6de50f9fdb60 ("Bluetooth: Export ECDH selftest result in debugfs")
Cc: stable@vger.kernel.org
Signed-off-by: Bui Viet Dung <dungvn2345@gmail.com>
---
 net/bluetooth/selftest.c | 1 +
 net/bluetooth/smp.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/net/bluetooth/selftest.c b/net/bluetooth/selftest.c
index ae5b44bb9d3d..cdfc40e0016b 100644
--- a/net/bluetooth/selftest.c
+++ b/net/bluetooth/selftest.c
@@ -188,6 +188,7 @@ static ssize_t test_ecdh_read(struct file *file, char __user *user_buf,
 }
 
 static const struct file_operations test_ecdh_fops = {
+	.owner		= THIS_MODULE,
 	.open		= simple_open,
 	.read		= test_ecdh_read,
 	.llseek		= default_llseek,
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 2df303f6a38f..81d255525fe0 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -3696,6 +3696,7 @@ static ssize_t test_smp_read(struct file *file, char __user *user_buf,
 }
 
 static const struct file_operations test_smp_fops = {
+	.owner		= THIS_MODULE,
 	.open		= simple_open,
 	.read		= test_smp_read,
 	.llseek		= default_llseek,
-- 
2.43.0

