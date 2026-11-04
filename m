Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829604;
	b=xn/euoWozd7CLOi6FK2pLYJWEysD8OtIjohr+mkOqKmF8TQQYgqwia5zvQBVb573U+1E
	 gNFCk4V7hlmjvd5Xm8c6aicsLIJLeb3FA6ZbxfnPDKbc10H81i/gY0ugR7zkiRxzDRovv
	 IqA1YRzb1Yyu7TWIa30ubTqOsIfxObm0bFcsiQzCjBdwbZ/sW6vidKXeEmwNbV3Y8iJDd
	 QrxbGUGxnHJUSoq2nIm+YKd+xrUfNOzwCWVGwuUV6InmrMpwxIr9ni4lX4Vwvh++5tNxd
	 TiDhlzMS6VliddvsQaO5OPq5tv1pLBOKgJRFUtVyCLTknUE/WHJMukZhU+Dsr5i8Q0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
	b=1c236T4CkTXg4hif2dkEfPBxx3+UpEFMoXfaJ8h0HtgxcmLgVw447kQHc02H+ZyfSCNL
	 bytpIYZlLYUUuFJTFj94cKa9eSElSG3CsXv4tpIHeIONf3fGPdZdGlp/Pw+XQhZh8tqIw
	 gMk7VzhX7iPNDTU5GnLw2OxUJBhN5AQCKymPB4Dpc6eI8RsSSHXDxY9BTz5KwaOYLOkW1
	 iDCzFVVgvQtzFgQPuROigYnK3wQBJci1ou2N2F0QBZYVBgl8BIffB66FMyc7Qa3GJlsoh
	 XECLEnjf4GhiyGStjmEaE3rQBRKignU2hmeCG45dv8Gmm6VUeCdgre+R8rf5BoO6AeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7EyQPdT;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E86E6075DC1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E86E6075DC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7EyQPdT
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso27046a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829604; x=1794434404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
        b=h7EyQPdTHGRBJC/MZIucnXYjrS5YFVIC7dor9ijgRMhgf936Ljo9gz031Dh2uTgv6k
         FRJzPt3+Wyd1OWzZdPrJ7gKvn/9/wBw+eg+luyPMOOJ4Bp2tJrx9gLz8sZP8W4oiMQiX
         fn09CTk0v1qxnG6lfDytttE61Wozden10+JzwbLjieHhViKp6mBC45io6YfpWBqMhv9l
         3fXUi5e8H2Z0dC0lP3nSCt90mKFuwACDesE4vJX/cqjZWKEEKukjch/tdO96IlZPpXfl
         nUdQiqpZ/ueC1WrtYUOBp5gzS1+AfQnxr/7jlBG/+DWjGaWGj/S8Mt37JIZuGP9xxoE4
         tr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829604; x=1794434404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
        b=ZydZoYImORxJmFQhCGnN4GRRUWvLPzYGrMt87r1SV+SxKyJcuGfdwRnRozi/4gPNBw
         L52y9ILE6w9LVJ6j/M6rjPzuWDWIBQLVSSlD4DyT7G09U6qfAyQs7OrxbHCZ6zUi2Pyi
         WIl4U5a9XqgdvsbFQ+5q+olwmTVaeBoVgnZZU5EuJuvu6Yj+dUIp46BrmpmGBtpqpAlU
         G8gR7pkd7naYq+8hQNyLgy+xUIeiGCgNOJrCfaZzurKpagpnT13s3DMkDs2+YntekaOl
         Ukm4S5q4Wr8EtXD7EaxHoR6VmFC1NBJWvRknAzv6ErscAQb08i7wKbbK1oRJxGJMl8si
         ifvA==
X-Forwarded-Encrypted: i=1; AKwUvBw6jzTvkY/z0XwUuoSLdV7Ucs6+c4WoNrs7doHybJL2FTsiu+N1h52C2ZcB7U7DXZNhqQQobcgTXuKYMuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l5hd+aPLdqVLW+hKbsDbO323jePhXWxBjHUiAdpuua9WbMOo+
	NfpCW4cMW2nmtZ333wp9+uyaDDIt/lXLai3fL+x6Ksc2rH+Qcke4rM26
X-Gm-Gg: AYBFou0xVZQjqNeMhHqBdbGtOItNBDJhE0+F5wumfitvgRnOKGZYX+rj/Hg/Wk+qk0W
	nGF8lBSniilUWxt/YkJ7ptxtIc4hMgISeTmcK/TI29+Mjo1tpl3Jolrh44aID2TDHao2cI1JDIy
	nOqyRKj9Hdr+hsxELJeaD2OzhunOa6Z4GFQRjcLGNK3hIJF6gY2/vAhwpzw1CLQwD4WbJPcAT08
	K8q1ogKPj75Duo8Mr9ttq/jIcU0OJ7POpemybVzHEhYL8sZdsLTnAeAVHrAZGT/aWcGC0dT+MIk
	VrRxZSs/o5WaVIBG0WnkIQOkINe7J/s/u+YJv+WFRJK35gvK9x8AFHrDPGajGDCvzbDyFmAhoeE
	dzJRGxyT9V+pnTAEOPB2JHxD9uNx0/jvaPYeKTBvTkxiI0r7DF4hD8iKsVPxK1d46wy3XKrtazs
	hFV3/UiuO+25puXL8lNzB6V+z1qPoBB0JeFHhOlpY/TCudG/OYVmP7QCClqwdmoA+HWsumjDrB/
	08Kdh7lno4SQEucD/t7dpdhcwbicRQtylrclfwMTQ2UInsRQrRpaH2k5LD6cNPB7m/u/ibBWJyI
	dqJOwAslRmoxWyQ4gaaddEdYtpqhLZ40EPZej6k8TpDdtqBy8uV4ggYRuHIVwLBdRAcr36f0Um3
	Sc0eqdmcFps/Ne4yBdv6f/yOZ1wDDNGVxHOfuE9XJJj9BECUDlZ/K+VMoaPZSxxndVvM1AwX2fj
	Tt0EaRTMGDO8Gt7FBa04Iz/+A=
X-Received: by 2002:a17:90b:3fcc:b0:3ad:6090:a17f with SMTP id 98e67ed59e1d1-3b0afdce8aamr519591a91.10.1793829603412;
        Wed, 04 Nov 2026 14:00:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] gpio: ppc44x: drop redundant label and parent assignments
Date: Wed,  4 Nov 2026 13:59:55 -0800
Message-ID: <20261104215959.24035-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
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

gpio_generic_chip_init() already sets gc->parent to the device and
gc->label to dev_name() of it. Drop the duplicate assignments from
probe.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 189667e0e1ba..01dd5e7cc311 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -178,8 +178,6 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 		return ret;
 
 	gc = &chip->chip.gc;
-	gc->label = dev_name(dev);
-	gc->parent = dev;
 	gc->direction_input = ppc44x_gpio_dir_in;
 	gc->direction_output = ppc44x_gpio_dir_out;
 
-- 
2.56.0

