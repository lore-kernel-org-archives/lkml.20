Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895450;
	b=wwTwnNrotgFIevIplHtqDQTrE/ZC69l7vbyODrysIbB8URGKVJ7v1QOVdhejYw9n39nT
	 sp3I/Iip98AQ1if+Az3eMnQj/z9yNffIeIBGTusqFeLB2kCyCV5hwqmhW5AHWcUkJF38p
	 bkn1NrOOG5xvQS38Ft8CnIWUXEGSvV23uOHvx6be+zEw4X1PMdtEzBko4RbLSw/gl5lrk
	 s9KNA/PLl+tRLw2fF/gMboAO13YS1MAoGyfLCu6nkKPOS/rEBIxk5H9aKMOylqkCSF0OV
	 4bJcke6jeGkfN1BH3ArWCE/ZtbvOGsqaWEmTkC5W5HSi6dSaOxbh8b4WIcCdefwztiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
	b=PtDVl2B9ynqIEE8eygE4K4mq+kRL879LarSYLCXECPEzieVztkHVIesnW8QiXuC2LXjk
	 KKrY+T/+1pWdcZytywbnPkWsAxkBjuxoqMfjoh4DRND05e9DSCwGaRRPjHQ9aEIUvazF6
	 zGYavGvo782QE0QQVJ76gzvRaOQkPyi80XbVpTFE1ZQtEIpFDQTJy1+FOcxrQbfwz3Kmv
	 htd92z69WwJU+Zmw0MFUnp+Ys3+Uho9CLqmTTM41i9azbQ/CGHMkfRucLh27yZIhK2l+J
	 5b+aqV6+lDRg2JCiu7KVVt2FGuUmWlXZ4Udh85fN2NgX5vgOolHrTlCfjVV2qMMcmig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDNfrB3Q;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95ABD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CDNfrB3Q
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1565072a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895449; x=1794500249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=CDNfrB3QWkcw3bHQk2ZCbhn3TPdm+TPLYPphUrcMMoxtsCPfIuBlSOriGNZmxZUqUM
         kN1lslhA1wCk487S11RhEfQR/BIOJLuHnPEg3PGvoK/fJ5X2ZtEULcCne0KKHHCjLwkO
         8N4aGYBKKQv9oD8Rgx0AtPDwCIIymyZ25QwtNRNKoUR33w4TA0Y9iOSA5C533VsDuyAn
         GbTNTxXxxMK5HNsIg4bS2qtOQ1guxO/rvziC9c2i0wpjUuW2jlhJfsEktLc+NiM15vSH
         H56m7CDUnzSQPK41lRnIIypwOpJLsvj48KdMMUpt7l9wgVOOaohOe2ieMuPo2pfJEkm6
         +88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895449; x=1794500249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=WO6LpXZYJg1yxEaNPfHk6y+6uDUF6/q9w9lZCrHkO/MlREg3KeC8Ye2lmbQIe1xmi2
         CR5U7wHRkW3RlEfP1vTDOmpOh47LfGNsG/9iVE4i3duBrAPcFWpo0mjZ1dtH9+Q/QB1X
         8FVRnaD+bg83Squ8oBQR2DOIlGcdDP3c0H4TJdTsEFygeX3b85+IOT65xU5NvSMwvfRN
         jK5GLz91ptV+cXfuQnaokV+g+NHFRw1OxttQ4L1+Bk6yi+6lDaGP2PHfDylkI6TGqpOk
         3tn7+w58NqyzaEm/b73TWDN7cPp+KS/p0zEdYyRqMbloUWOUOHcLC5AyC84ATZIBAdpt
         x+Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzkto1Z8yn7ldmKjVgeqmigFINc5GRotzyEqixLTv4bcwVrnrGLrgzTkDMHogdTGowy3sh67YoBLEwXEJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rQx4rZgFZ3MY0u9zBGa11LDRmn5BiXyUt7E1HgRkhjzpVQ5gX
	3a7FNZDUrmxxkJryWZ4Jkzfw1sDC8zbexJM34xqO0+OUglJLiMCZ+dWz
X-Gm-Gg: AYBFou0qQg8LMPMt12EavFxcASmosAx5FKMk2hBusP5Vfzfm4ocvrGKHSEHnEEtj6yX
	UQ5ZOohTbfTo4ItYMY4mDumSty7Ew2XwsG5jvpwy4KTDKjotLL5a/rCR6+yPkDqdi2SqSlqChEQ
	gnuOeMEIxSz4XJZwVb2b+Ch/WMd+NgDFbD1e6Oktgb+4mV9cgjbbLCMLrCkC9hx6EUxv5Pobzj3
	tKdRH7kuVfbMk+9Mt4rBDKRz2QWek31DE9oz5drFAVNjpG8JvwAIrW3/ABgjc9Y/PuzibR4zv9F
	xW03Q1m5nKW/w9daglFlXKt0QOA7NbMNfpUE3UJNIsQegUwxCqdr61Y6FH57C/YbEFwD40/QyoF
	hN03pWJKGfIpRX1ORZsJRInTGfciaK0Zs0ZJSJgBXfVABQ0EG4PwsbvhZKkeJ2SMJnwk1IpPmSd
	U7I0YOmXV7SLCKds5KpDqi2/6bguDp/uv+JcDD1JiDWIpH9Kx27E+wng/7jqMwF1ncvt39lodMu
	tqTSjhF8LCyJO6CFgMXBLjJHpXSQPpRcsqm9Dqu/HINH3lOHqyeuWFtF8QMiouQixK7vrRpgbGh
	J4j8/d1ghXZ4GmMmfAgLo5cyncKa3xH3tqZ6ALOw+zGE65Jd7WRkMfVCTXQG+Ax2ht0HLCb2JLl
	SDmsc/E3a52N2ujRmiDlnP+w=
X-Received: by 2002:a17:90a:e70c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3ae89835d94mr17591365a91.40.1793895448800;
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/8] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu,  5 Nov 2026 16:16:54 +0000
Message-ID: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

The goldfish timer driver was previously only used and tested on
single core m68k virt, but the same device is also present on other
qemu virt machines such as riscv and or1k, where running on SMP exposes
several issues.

Fix the concurrency, oneshot, and registration bugs in the driver, add
device tree probing support so it can be used across these platforms,
and add a MAINTAINERS entry.

Tested on qemu m68k virt and on qemu riscv64 virt with 4 SMP cores. On
riscv64, testing was done by passing clocksource=goldfish_timer on the
kernel command line and locally bumping the clock_event_device rating
above the architected timer to verify both clocksource and oneshot
clockevent operation.

Kuan-Wei Chiu (8):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 113 +++++++++++++++++++++------
 3 files changed, 99 insertions(+), 25 deletions(-)

-- 
2.56.0.398.g882cbad275-goog

