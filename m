Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721120;
	b=EsnQpYs0wq6KAlDDNt4DYYgi0JdqGY23NUGGAz/I753IK2NeBb8Ka/N6oji2XNqOVd2C
	 hx6VZZf5NqOc0f84qhA+CMbK3j7Ve0GDHkmz3HQhOmjqNiJfV9mWDkbsSC/QU3V+lwpZC
	 f9louC2kqfWQwGnDbCGwHgJQEiC9WKFsCJRVPmVbpHYpJjzztAmtT++hGobCtKtTSlUx6
	 4QFkPfgUOQiA5HR87u928IbIkZdZuHn/PmVGfm2+VYWATi9/aEMQMV2RlP3he4XPP3a+v
	 aRACauAZrqbpJDlVyOGjuJ8FQhd+0mKAz+QyyPsPmksapBWtkj8vQB1tS5EDbZGY5RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
	b=qsetTgdL7qrOKYMMJftxeoDvHO5kyCX8rRmhHX4SP2NEtMtOgZ+mcX+5eXkYCpVUe0zg
	 cbSWjaJuexFewLet3qOI2eXxxNzR2kLb2kKh8tdXN84IkhjRdYBs2hg4NY8hd/Cuun+26
	 oNqsKLaFdNveEVXfyHSV7e49grrYyGtbzLqxNMb81DUdcdhuTNhGszHzGPttXLbAzR+zn
	 ct8ab5ljLHpSuRQLWLZX1GXThp1ZPBIBi+PmgMMYE0pgJdxXPiOVIGKMrHb/5oA5SA/A4
	 qVu2AB/1fQ+t1fw5A16/tcc/5IXrL+RvKn9FaoMxl3Yd0eVPZITPZBZ6GupdSm8vjpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UQbTpRt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF49D606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF49D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UQbTpRt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so48244325e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721118; x=1794325918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
        b=0UQbTpRt5x4bFKA10POaXWgH7o2SI4d1Ye/f1CT+wpxWVp2oFRjQXbm1r+VxoUpzL+
         dctptXzSSZXP8mZmQjwCmrPtv09cKw6ekn5h1gLKabZpAbI0+SX/3+lktdnjEj4IAtyM
         Hg5BnLmXUuXMt5oiL5KOAMcPK3MPMTztSWnbriOe2R3iYtr5qTf9iu2SdG9P3l3uY6zQ
         FybEjfEKMnYetiIUeFltwHyzgdM7aGyw73b1OZsT3bHcXUNGO7bAaELgZGd71KaYoi5x
         lNHacUUFUMH7gRdtMya0yVhDHvw571QfrkAmorD+cdwFBL+tbEFxeIWpubcPt9/g2ALC
         9E5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721118; x=1794325918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxH63X4dAorJkZztMsnQ7q2lWTpXKUKEQkHtJyrOa4s=;
        b=pnHNSaedMmzQcHaiJMlPg7VmUDWC4mf489mEAJKHcmt5//VI2Uw4M2U98X/8t7MYav
         IWbwq1qN4KFJC6EGlE9WVNBFbW4YQRdiUEACOhWf10kMerxHlM7ccOU1MWzkmDmUAhNy
         Is2IzMn1Zx5GRtVzPDTT4dz0UKAjKYATRqRA5PczL0qIDvIWN6X/1CWm4/HE+8EdKsxg
         xYEV7h6BYFgSaVc60vd5ThoqIfDGKSYJpkE8rTsJAoSqOG/naWGWTIf4WnFIGezUzDFe
         DY7MM5AWxTIVngfWWbUC7N49O8H+D3Lnqa1t3jNXD3p8iC6sPhAJ5iQX5EkQ4Y2ezgAo
         Zv2w==
X-Forwarded-Encrypted: i=1; AKwUvBzKbj0RrbtBp2R9EY/avP69kczHQcZbwCr5gcPJPCdAvQ//VIJX0/j1X1rE6HY8J86Z/4Woy0PGV45F824=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MTADfb+YHpzO3PZEUL35zHiKKwwvNAYS3au7rNgM2+D44hnFm
	Z36l2HGq87L6NkAftER5Pr8ozh2CksKO79JVkw600ny1Ttw3fyEw5mAZ
X-Gm-Gg: AYBFou2GW0wsBPZmHiecwR4RuleEmC/DiJW5LVkHDRLbivPcKHE3l51oRmNqpgOa+Ov
	Rjpfw/KWskSjGKI8iXBz12JhbTlG0vPTK4T5SeU0ejX7kq/qk+t5Fy1w/r1E81fqbTTaMn6PR4P
	e4pinGPAdrqBp55BV2TGDpWJeqZFw6UH6WF/QsOETxuNei63Cz9/06qzD30BAZLFeWsR9xKkOPB
	APqzuHCqvhyAz4035A4zae69f/h+JoSewy21M4zbE6tAYGZvS72sdR7IWtUbwmsdkvCX7DVmLKJ
	OmsfP0t/firaZpenyy/PFWRUGdS8T+eebLuqVgD4mgQkd1vPurS0oaA30aoU4vCSVDYt0xq0zSJ
	+KYvrs/py4rE5bSuQ46TVJ5WkRAxevpEzbrN8zk6nRThLu+U32d7I7JPNdOSERj8n90/n2RQF2r
	OxG8Vg0sax3MMuX/FOJEY/QUa5itcSrq2V2LoTWi/ukWdx+XQZgvCdnWL7UYAwNcqI/O1oh7vKs
	NNXTGxln0P8xLKKWpIgWlMtbPmAHFCvJuKcROznuuuAAL1hXiVq0Oa0KcPwVCmtac34QyvgPTNS
	4oiWAiBbxCpBoVP4ZXCzqiuBwMDinPDsDq83Ue/1IpfggRZQDJO6iVW0228kk3iA2R+wjEu/Qow
	t+lXjyu6nUTtw2mGUw447fP+prgMkGwSP8RaMemcxPkpKq6DaqUwV
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr310741055e9.29.1793721118269;
        Tue, 03 Nov 2026 07:51:58 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:57 -0800 (PST)
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
Subject: [PATCH v1 3/3] serial: fsl_lpuart: Enable TTY wakeup for wakeup-source ports
Date: Tue,  3 Nov 2026 16:51:27 +0100
Message-ID: <58d65b44ca054ea83eb835bf5decebd688cad04d.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793719239.git.stefano.r@variscite.com>
References: <cover.1793719239.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

LPUART checks the TTY wakeup policy when preparing a port for system
suspend, but does not currently use the wakeup-source DT property.
Consequently, userspace must enable TTY wakeup even for ports marked as
wakeup sources.

Set tty_wakeup_default from wakeup-source before registering the port.
For TTY ports with the property, the serial core then enables wakeup at
registration. Ports without it keep the existing default, and userspace
can still disable wakeup through power/wakeup. The port must still be
open and initialized for receive activity to wake the system.

Tested on a Variscite VAR-SOM-MX93 with a Symphony carrier board using
LPUART1 (ttyLP0) as the console. With wakeup-source present, power/wakeup
was enabled after boot without a userspace write. After requesting deep
suspend, the board stayed suspended until Enter was pressed on the serial
console, then resumed.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/tty/serial/fsl_lpuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..35397152a39b 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -2905,6 +2905,7 @@ static int lpuart_probe(struct platform_device *pdev)
 		sport->port.ops = &lpuart_pops;
 	sport->port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_FSL_LPUART_CONSOLE);
 	sport->port.flags = UPF_BOOT_AUTOCONF;
+	sport->port.tty_wakeup_default = of_property_read_bool(np, "wakeup-source");
 
 	if (lpuart_is_32(sport))
 		sport->port.rs485_config = lpuart32_config_rs485;
-- 
2.47.3

