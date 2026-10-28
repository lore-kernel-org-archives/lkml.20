Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197360;
	b=GzwY4QdHaN+ktR9YMDT70DvEnV8hJjpyfnb1xFSFiTJ5DyDNc3FLRnc4FnoJxbuYdRg4
	 5M8num8NT83SkHB/lCMFXpEV7K3N6Xb5QH/BYdOGWVgg36cgX/beayyTcKdR6jQgqoU5z
	 rmeobu9i+pZF/UZNzQHwySJI3SrPZTe//ZH7CGUITGrI0U0CoJQVQvkw8JjSxnQ2qZmjT
	 c2CGYwXtUIqu5YcUVUfwm2fZzimAkk7pTz38UNYoOS6/jUr66SwdDQ0Mjur0AMXZPW6Ca
	 XYnZqwkvleCUjRIoHHvqlqEC7nTSdwwHyfMXh/KHht0SKDrg/NcIAFs4ZLa4SBQW5ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d6xo5cJLzMRcEzyBwDsvWjXaejYriCDwwrXb5CZ5N94=;
	b=vL4uikmAsTCPXiJmQCd5No9H15/UQm4iuohFsy6mhiFcM33jE6Y7IhE69pq1SbwxoPZ1
	 pyqpoM4DhSVDucKhsBrxOZkytnceczq8q7uYrkkxGFn3YDSvwIxMh6BbSzptuYwueXmDG
	 R10WZpfqB0pm27WEkRYlYaEIYjemLmr+xV/hmzy0u8ehSYBP7be2T0nArtaAFYoIYD2yB
	 Mrs2r3Z5NVWCQ1xNB4et/0cIYBlxTs7EEbZ0C8sxCS2Wmorz83HsI7zlPHc9R/5ZzxJny
	 0Ggk3ras1M9KHRyHp7A7Sj7r6ucH/YDsDyR9nqPaYCssxXD9OlpVkhSr3NPHl/GZOlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYFX5FBy;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C03E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QYFX5FBy
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so8447075ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197360; x=1793802160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6xo5cJLzMRcEzyBwDsvWjXaejYriCDwwrXb5CZ5N94=;
        b=QYFX5FBy3/KO2MAF1zdZmN0FZcrCcprFxmjM3IgVmExPv/cdUmYODAZiVqqFUpyZv8
         HRfV1q/1tPZh+J1RQWtL9/dauWbXyi6wD0veX3qTkO7HNIK6sFmNRTloFQWc0Usz6I8K
         eP0351D4C5rXW3pDsClwJBLNUdWtniyDNMFmYvi8MQNPPGs0PZRyxGNS+zMB5ZI2XmX4
         bVblquPgCSvW16twws9nr95pNg4gjLO+bgc3U9joxk9GUEM4Kc0n4bxxIZIZYgYN4jr1
         yoEMwILo94+NcludKGnzm19tlGdC6/HbWikvah8WhuqSDbU7S4afLDAjY3eatyNkGL5W
         7ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197360; x=1793802160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6xo5cJLzMRcEzyBwDsvWjXaejYriCDwwrXb5CZ5N94=;
        b=JPRC4AeTNiU6dbxRYIXfEtgjm49ZOTdkvseEbEoXqkwW98/LSz1NF2oAdMSjQc93Qq
         tYz4wOz10omjzz0oQb91cxuXNzzqbIfDy+C3ra4ecnEPyuWJSbxmxtCMGLPHsILue+3P
         arH7nL+s1CF3vlhaWRSaTv/FiY0l0elLb38P0wyFR8OJkZ2byvd7SuZOeB9BSDhTAQ2l
         bP0FeqfzIXJDeNkE3c7PduN4Ceu9ixNsjZqWAYrFASiPvV+IBtH5WZlB3AytBRljVgP5
         Z49iurecFOGGyhDJbVZYLa9SG/JctVgMCKJxyffS/w1MLtKcdknG2KWMmTQznugqLX5l
         MWdA==
X-Forwarded-Encrypted: i=1; AKwUvBzy9BjVcZhtKJ5wu9dAXWvFM2D2Wqy2c3fZz1ek3FdyZ+XnKXlq/jg+e5E+o+avZYMFGOdSeLtjAFjRR+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4bd2aZ4ZUudmBIIAhaUmhhPfr4nBjnGJAtWfjf3dwkLzlbaYf
	6T0adRMUueSuxV5nv0z6E4CGu0gZtBn6mxOptOKdhFqFa+7eTItRQ47j7R9fjg==
X-Gm-Gg: AYBFou1rYsjG64oQixYxoTVtq7vNXtwJnUCRX/caDL+Iocnk+yBmD2STjqbSEDshbKE
	BG66LwsCuh93+X2mVOLaWSj74LQoba1Tp7umCr8b8MC5HfT/TJvUeHlb8gQ/Il1FabkDVOwspnF
	LFHVirfequvOhzBWqvv6vuUkDQFfPi5Yda0gBGG1CkP/82LthEDSkHtO0C/UUs/F7JMmg/b/0ib
	rXofY6FBwJvCtjPt2tCNylHDhn3JPQyMgzM1/HGYPmBO8x2j9XTiVGYBnZh7m5s6AtJqvD4Kz3M
	mXJg6yPWlUA4jSHjLE3one2GGFqhZJheJoMiIiKJijfNCJXE3MV3GOnS2kwWnnwvrAALEJuHnzt
	nBn8/CSkWmnozFEUV+cLBWFT/fDFpW30qQ82VMmVArkPVU6PW1MWUe1r/kU8+rjWT6VWnHjD7rK
	g0bzLp979SWE63I1XuUp1LGzN+DzpAS8u48CEl+F6ljtd/30LSypAoSvHvglSk4hZnAn3wB1yF2
	CH2DmBknnPK0BV0B0e1FiCf4jGvnVJ1vG/WmgJDCtsq5yp11BXKKe2hPEkF47vULb354BKomv5H
	0cVWejer1kTSuH84us2aV1pfg5ns
X-Received: by 2002:a17:902:d4c4:b0:2e9:776f:66b3 with SMTP id d9443c01a7336-2eb001d0688mr25784005ad.2.1793197359610;
        Wed, 28 Oct 2026 07:22:39 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ac0:50::246:47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9ea8asm23149375ad.66.2026.10.28.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:22:39 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Eric Dumazet <edumazet@google.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] nbd: reclassify the socket lock on reconnect too
Date: Wed, 28 Oct 2026 21:22:35 +0700
Message-ID: <20261028142235.24675-1-ngocthang2710.1999@gmail.com>
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

Commit d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular
dependency") moves nbd sockets to their own lockdep class, but only in
nbd_add_socket(). A socket installed by NBD_CMD_RECONFIGURE keeps the
generic sk_lock-AF_INET class, so the false positive comes back as soon
as recv_work() shuts it down under tx_lock:

  WARNING: possible circular locking dependency detected
  kworker/u20:0/67 is trying to acquire lock:
  (sk_lock-AF_INET){+.+.}-{0:0}, at: inet_shutdown+0x67/0x410
  but task is already holding lock:
  (&nsock->tx_lock){+.+.}-{4:4}, at: recv_work+0x657/0xa70
  ...
  Chain exists of:
    sk_lock-AF_INET --> &cmd->lock --> &nsock->tx_lock

Reclassify the socket in the reconnect path as well.

Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Found while testing the fix for
https://syzkaller.appspot.com/bug?extid=a246ab421a728c78b4ad
("nbd: don't take cpu_hotplug_lock under tx_lock on reconnect", sent
separately): once that splat is gone, the same reproducer reports this
one. Independent of that patch; applies on its own.

Tested in x86_64 QEMU (KASAN + PROVE_LOCKING): with both fixes the
reproducer runs clean 5/5.

 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a567c0bce90e..b24f69a2bd82 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1357,6 +1357,7 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
+	nbd_reclassify_socket(sock);
 
 	args = kzalloc_obj(*args);
 	if (!args) {
-- 
2.43.0

