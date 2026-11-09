Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233493;
	b=CK7mU/dFO3cGzlrj+j+foMP3VaL0cPsQrbT8wpGqtzQT09PgOQt5tRFKRzQk2ZAHY347
	 r29G5qsg9bWD2y0B6ozNssFldtjYSsfmQHtPYsrER7Dndix56yGDIh7bUL+H8oxEmM0pu
	 l7U1Tj2IYM08NDu93oIo1I2mEJjPKpaK3foLE8cc5M6f1tQ7xEW2g6e+reWH0//JzPeMl
	 XeN7uQPRG7INqQtCSvPTJR0UaGpxBks1hJ+i2iWia/rltep9NaPLjmhlihL73BxPGIGN9
	 wZfUd2x2EIOHkUUPRNwodMDMur1c5wSD0vnCIvnIzAQiwe4YLxXH/E02ixiVsgOTMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
	b=y256Xmm/7amL1OlsnqXywPKJgeQtn7hGMfSSbuakqB/IQP68XxlMd3mXkEAK8m1kLAvJ
	 YCFDE6QAO8WcMOZ0OQYYNX49O9BszRqn4rigyPdGQig7j3bwH76tdeGNSlq+9PcpqXoyZ
	 lGRI/5KyRAvDu7gP00/DMli8LZv4wgGcLZo7B0JOtnP1hYjM/k/S2+ph85rtvvaFsAXlp
	 ozMP5sowZ6Z7tmb1QYGvQ8ll9TRUz9LVQzYPBEpfmr9RgdzZwQnj2LfvWpdsTEr+Sd1RV
	 OfSwvYyfpTzxFcarxhPxNCqRsVYlYIGUZU2TkpGiTE4VSInuReB4sSwmFshgZII3uXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iwb6fJkc;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63093606D825
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63093606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iwb6fJkc
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so591865eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233492; x=1794838292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
        b=Iwb6fJkcCT8MXHNa1hBk0ISw11TIiSTAdr0h7XAg57SBCSoOHrOwiuTzAYiLgyQNQ5
         vi1y5iwawn/PmPReXz5YF8g+EpzVqCVlcnbQkzkLVGeRwTVAg4YdlSGagCKjiZ7peiSh
         pIyd/zFfPkB/ju6TppD8IW1VnwX30tpWacTyeD09txT1PtP6TQDAbxf+0pRjz5ufUGpf
         kLTXwh+spXEXMFo5KDYh2VmYffIKZt4d95w0R8r7DVyRDq0wAgn+6t7zMBilWUyLQQvm
         bC3Qyg0nS/HPN97EEOQCdxzi/lpDAS8mRIdtx0e4TeudwoW1tt0c4ERSYLSini2KsrcX
         aKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233492; x=1794838292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94IXRk93nt74TzOoS1Le6GCJeHsVAm9GcFaLl22SAUQ=;
        b=GC0M1+gScbre1n9QfKCq8sJRUKuI3BkDndIysgzSKsyujQiMjmsZQMw5xPcVm5GzBm
         UZ/z2qibaOmz9moEsx5IlxoAXz+xcRMVTW231114l0nxTNOXXLq3/HOqWyolGS4HzGjt
         aVi+cqFtXOLsErAPbOXsDK8IsaHUzguUh4tMvU6qLGTXRte4UQRiUQVe0j5htzWCpQgv
         IFNH5I0slzhnFy+NglnPTgJA9uFpGAkGOOIu8RIj6Im0gs9wDbpaAvvSLCeECLaONh71
         BC9Q9E64V172sY8CJzJ4zT/d8FtRQDOeE0d0n86Zk2WwDfsd/8/Gx1Kl+dtGU5eK6ZXF
         HucQ==
X-Forwarded-Encrypted: i=1; AL+hErFklOR45zWMr12ziFrQPbrQznH1RPaBNc6J8umvkfck1SV7pSwDRGqcqqVyYzpMM0JDV48ceNgHKRw24iI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9HqiqMYIdQ2yaaviPEGJRytysmO5OSX3Shhz3eUCSwIrfFN22
	FNyaH97LByWG7PVTXUYZYMJtBl/NwqNMc9dCLmfqFbDXWSOvgV6E58LR
X-Gm-Gg: AYBFou18Rlt87OAlni5X0UEFpoGcgutgWsHc6S6r1Y0/EuO6rBPrexL23kHuQ91neFq
	Kds/2fAdl2PinABkqyGqwtPDqyNUWx/I/WACfMwlKunK4aWnhSdXd6M3tfgORMTlRRjbiVbDxzy
	LR1BMhskdowhJMkuJcI86cHm9GvLM76lHlJ4/sPTJ4KZgWeI3rIuY+bJY3030Cr1UhTPfPqdbXH
	LVTh0ebZUvad2y0C0KcLywzvqgxt/gzAc6bHqAMvL4+YUUtT5RMnuubsa9DhorQ1Mw/ARip837i
	FyzDE0nDA9LttE7Kysh6ElLX134RxY1tT/NE6OUtj87lw79d2BLHzKhZ6T9IvvlW7rFrNJKAVCH
	tRz98crRUlOgACHEQLESPTFOlCL3eblZMtIxt7EovzkVVMbljUZ/hnh7v02ZuMcz3LU0bFg2dLY
	qZqRQv5Nn57DltPUhgpKLZtZH9o/cLl7Dmo5aS3Q3g7ya5pcrsQ8KZ4DKi2LJDXngrlGiV+Bn1w
	omwgnM5swHIc6PXjMeh1r59qOMviyMXXXAmobaGMBO2p4xLfZ36i8gJYFNNM/RtGFLfK9dGHx/k
	03Fqo2ELj1P+RNWaECquFk5N8PLQ+k+xCwP/SOY60g3fPovhcQ9uwF6Je3xGadDlcvEhrvfpBfc
	pux70vUFJjbO0J1exXkxOqFrhV5UByqJSQjqVWYJJMY40NwZK8bgWylU=
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr6713983eec.30.1794233492230;
        Mon, 09 Nov 2026 06:11:32 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:31 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 0/2] usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race
Date: Mon,  9 Nov 2026 19:41:08 +0530
Message-Id: <20261109141110.3538-1-varun.singh10011@gmail.com>
X-Mailer: git-send-email 2.34.1
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

2/2 fixes the use-after-free reported by syzbot in check_tty_count(). It
is based on v2, with the device unregistration change moved into 1/2.

1/2 is new. While reviewing v2 I noticed that ports[n].lock protected the
ports[n].port slot but not the matching tty device registration, letting
concurrent function creation and removal race so that creation fails with
-EEXIST. That is independent of the reported use-after-free, but 2/2
relies on the slot and the device changing together, so it goes first.

v2 -> v3:
 - new 1/2: hold ports[n].lock across slot assignment and device
   registration, and across slot clearing and device unregistration
 - 2/2: unregister-before-free moved into 1/2; otherwise unchanged

v1 -> v2:
 - look the port up in .install and hold a tty_port reference for the
   lifetime of the tty, instead of clearing tty->driver_data on close
 - drop the close_wait handshake: with a correct port count it blocks
   rmdir until userspace closes /dev/ttyGS*, seen as a hung task
 - hang up any tty still installed on a freed line, and recheck in
   gs_open() that tty->driver_data matches the registered port

Testing, in QEMU against a configfs mkdir/rmdir and open() race
reproducer, A/B against unmodified master each time:
 - clean under KASAN and, separately, under lockdep (PROVE_LOCKING,
   DEBUG_ATOMIC_SLEEP, DETECT_HUNG_TASK); kmemleak reported no leaks
 - slab fault injection exercised 1/2's registration-failure rollback
   107 times, after which the line was still allocatable and openable
 - 1/2 was built and booted on its own, to check bisectability
 - the series passed #syz test on 2026-11-08 against syzbot's own
   reproducer, which covers the acm path the local one does not:
   "testing succeeded, no crash reproduced"

Not addressed here: gserial_alloc_line() re-reads ports[0].port after the
line's lock has been dropped and passes it to gs_console_init(), which has
no NULL check, so a concurrent gserial_free_line(0) can leave it NULL.
This predates the series. I have left it out rather than pull
register_console() under ports[n].lock without investigating that further,
and can send a separate patch for it.

Link: https://lore.kernel.org/all/20261102193436.6044-1-varun.singh10011@gmail.com/ [v2]

Varun Singh (2):
  usb: gadget: u_serial: serialise line setup against line teardown
  usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race

 drivers/usb/gadget/function/u_serial.c | 132 ++++++++++++++++---------
 1 file changed, 85 insertions(+), 47 deletions(-)

-- 
2.34.1

