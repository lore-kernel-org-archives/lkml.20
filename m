Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721115;
	b=DdGWKQO8jTrwkNSAQl4J5TnlV2hCO8IMSJeJhDaMSMmwcTletqMQaPUIIVKuik+TD/ey
	 NkzCNsdcHKvabIXewuVHoYFN+G907h08J/69kLSOwHB++URtIliN4cl3DIJ2WFFN3T9+X
	 yLRRNsCKO+Fpb8/G9lyAH3lT04ge57tAJgH2gsi+VpGRGQS/Za9vEmqwuiY7rjNiaHeuS
	 rsOj+pU/8MBWdgTHmGnVU1fAEpYfkvpnpi3gJsb4L9lfQvqkBEvVGSlZqBpK9f0F6bCyD
	 VSdDVBLn0yYfFBaqGJvQcTDHfIpd+gMb1LxqCHkrF+LtyLAjmjJkKXK9uJvU9QwFbaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
	b=EqRbAaUi7v813L50mvRKfe1LunD43XGwIP9vHwGcaKDMv3LEJn/L0bXxBQYurzjVFN8A
	 hClpT20JPntmuBK9oR3w/nziIV4SMz9nvCoHVwE5wEial2/0loDjDPMMwDk2ZhjDAhLd9
	 iG/y6ObyFUQLA85GmRTB9rrycXWonTa9jFWWmcDdG88hDTJtIadOLtEQQ9XnCzeSAzj3u
	 C/4I71Z6jKh6mgcgm5VIO3PV9v0VUYQsJ8hvltFp2K5xJdFq4Wxm2+xgrCHI3OEs3a+0d
	 qhQz6yOCKbrJ3fc+AZlgyHF/rI3l/gRdpv7MrnYISTUqxPY9IiCdbrdxrcrMxc3Yeiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=my3X4+Tt;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE5606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DE5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=my3X4+Tt
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso35524115e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721114; x=1794325914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
        b=my3X4+TtDs+etsFJM0QPWkM4NeYyEbNHjCYNtWnJnUlBuQxi682Nl2lnTjOA35mrQX
         6HNYFaYg86KIh3nnQvpw26zuJthu/MISqFjldM19hSY0VLKfqwuf2ufqr4zQhNVg7rQ2
         hDb7buElKYxoOVIZS3F9b2fPTL2VWXGMVgoywQj0oBxKqThU5l9JzjL8UtUAZDAR4uUP
         Y58h8Pik/FZqlPNcB4czEP8KwWH2a+O9XNbZA5xMo8esnijDlqYhV53efebJ44um84pC
         tlI7Sy15vS6QsqlhNMEeoBm3SP1ogWRZxV0Z34LENUdZGvBsxYhDD+1w+aLjHyP3sbSA
         0pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721114; x=1794325914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElunOHsCbJmsk6qqG837NqX15fcbk0oSvq6+bth2r9U=;
        b=hkYyJZib60o3T+T+5Tem3csuhdtHYuArsBZD+dkAkYl96T1QiHRdlYTVY1duUbu6jh
         tXIqUXkfuDxTH0vp1Pkx5RReMpAefWUO1r0BBdxJsy/BJbsM8ZifjEU46F+wkNKZnSiV
         xfUBwhnMG43GV2P+AO3hMJJ5Ddk83zEzpFZq9dAByNAHD4iv1pQCYHlKm4ymySGnRtBM
         ysgQsuycpyU0GqpnMM1X4rQQPJwsWjn4XjdTMfcvPBshmD/qLkRtEgSpWdl6Cbjn8aYa
         tiLqFtMa/XWr6lqQjX8ffm9E9mXLW4CMY2CyO7rC12RAEd0ykNFvq62v6Vg2LKC79Qgj
         cLWg==
X-Forwarded-Encrypted: i=1; AKwUvBxzK7FYHKoFsfHWl82wmaSPf34l4Tj2QpksXMVX0r+liB2Q8V8F7KFIEq4EI+lUkAnHSSBz4UMTQKHYc6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cw8BVuTZMvSNyc3rLWNcfu8GKvRahP+INyuU8rMRrZOHc7sBS
	mHuoInpsC8R5zEQfUqK/JjhdNUA4QLtINO5dG1Fnn3Zcdol/vHmBlzfI
X-Gm-Gg: AYBFou19FGZ9JokQKcXOU30pnx84fAAOW7CxD4qI7yn1W0TpJjhmF5zpVRldJZQUVV2
	jKvzI4iwRxpjL/LfmXkZIBxOyNTw6y2pLila2RzQu6D07BriydUMXrVUkEVyra7hd2t7KQUooPa
	hyBlrYnIwlMKy0GPMKeLm2gxM/tnp4d3i6tlgyNfHKUTcIagmoO+lC9iOFNodwXNNHV3pAlzxB7
	MGB0MQFgq5gRJxpPa8BOKAVOycOSq9v/HdgHr4Kq2PjxDPPtrbH8x9e+5UIFmcMalUR0bs0HzI6
	czK3x4JGAXj64TNy5+sq/BVV2Gy8C/J+p2+9yPXx8U+aEe3VLxDCORupdt9x8RjzZgOm1TIqDwS
	FiHNpjlCawJZ07j/sGadVVurd9rC165ytN90KWKicx1ZWB9rvmEZ4Z80uroDUV6rKkKmeQmgPZ9
	fMMW+tTcS6d3+TKs3Uh+hch5cDmi1BagpGL9Vz2u9EurlExxtY1hOpm2Z779Du8362zrLJsYUN0
	Dg7pQwV7brs6TOgBQZi9Thf5GOSzK1b+dyCj8TdkPN6fe/BY6RdbnWHLJqMTEUfHrxJyYsqA/mq
	YocidEd4QuzyNoiy+TP7/XD8N5oQSqrgHexzPCCaVy66wbe1gTFFwNau7I1kxuozSWFDMJUFf48
	2GlDLIazod0wYp7kBo2xkyY6ZaTMWGUcXwbSRZcD271iqnmh4LGBJ
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr316895325e9.33.1793721113383;
        Tue, 03 Nov 2026 07:51:53 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:52 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 0/3] serial: Support driver-selected TTY wakeup defaults
Date: Tue,  3 Nov 2026 16:51:24 +0100
Message-ID: <cover.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

The initial goal was to enable TTY wakeup by default on NXP LPUART ports
marked with wakeup-source, without requiring a userspace write. Instead
of keeping this entirely within fsl_lpuart, this series introduces a
common serial core mechanism that other UART drivers can also adopt.

The new tty_wakeup_default field in struct uart_port lets a driver request
wakeup to be enabled when its TTY device is registered. Each driver
decides whether to use it. This series adds wakeup-source to the LPUART
binding and makes fsl_lpuart the first user, setting the field from that
property. Other drivers retain their existing behavior, userspace can
still change power/wakeup, and serdev wakeup policy is unchanged.

Tested on a Variscite VAR-SOM-MX93 with a Symphony carrier board using
LPUART1 (ttyLP0) as the console: with wakeup-source present, power/wakeup
was enabled after boot, and the board resumed from deep suspend when
Enter was pressed on the serial console.

Stefano Radaelli (3):
  dt-bindings: serial: fsl-lpuart: Allow wakeup-source
  serial: core: Allow drivers to enable TTY wakeup at registration
  serial: fsl_lpuart: Enable TTY wakeup for wakeup-source ports

 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 2 ++
 drivers/tty/serial/fsl_lpuart.c                          | 1 +
 drivers/tty/serial/serial_core.c                         | 8 ++++++++
 include/linux/serial_core.h                              | 1 +
 4 files changed, 12 insertions(+)


base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
-- 
2.47.3

