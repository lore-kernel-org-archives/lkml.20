Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912090;
	b=3S1h1EjvjUy+yKXJIZE1ew3YjAim6BS+CJdctcglQFbC0XG4ligGylthko5nENY+CsTO
	 e56T73KfKje60G4/8aBcOK1i6Uocsbv4RO5YT7e0KkvQAAgpZzrzZ8b+wFepjGLsnzt3K
	 P2obZZVVW5EA8753lkiYdLUxwerV8cJwBMA/YWwan1YZfn/YB3dFuhcXeCxVWocyAvJ2d
	 03gRbooNjZIYg3tsiKvMTkqL0x7C7LcqGxuJzwap7X3yVPExjgX0GCB8+GtT1MtbQy0JS
	 FsCakr9KpiVhtALTw7g4fzlThWiTjsHxwPtkQfRRix6ddF7fJAXuaAuwSXBYqDxgU8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
	b=RN1bPbQfD5QQxsO83qOxH1mQKmpTMPtzZr+ovsDn2TDYSNmlaUUwW2QF8stWPOo+SxAo
	 pukzCesxR3TwMhQ4FHOj5s93lxSJVIDpUuiXPsU2usMGDjdrG4cTYQVD07uDT2PO+q48i
	 8WuMHN2w3RpQ/OPUrJIIqclaaNqXJ1oUOZCLBLfKbKD05yG4tD4JTA2qDK9jSIkUFoIUU
	 D/S4U8BTrHVydX+aINYlJNgmGTX9VO9kyKxxmrleaUa39ReCcxoGd+BxC72ETGEK1lJ1N
	 Ai55gETh9pURBswjjzoZJWPxxbsHWZWLrOrWJy4e95RThu6qGaBYCQafYpeyWyfgVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzTKbVTa;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF46606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzTKbVTa
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so3394116b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912089; x=1795516889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
        b=vzTKbVTaO0mnOjT0wrC9bJuj2U7c8JCBOJXeERXLXjO6BfmdRweqdJxvATO5aSRSHj
         SXb9XVeZEaBHEWOO2LUH8py3vAozCejmhPwtmDUBrZi4zh1Az2YxxawDJJz8Ml7lH5wd
         cnrD9bJqzzgyTEoscy4of5hkrgQDPSLHsjyaApIpOGz/V3CtmNtFnDppf79BVRrpsCzn
         nQUYFA3GFydj38LtNiRADuY95g6sUsnytyW70R+5lCmFfR3lWNafrMTBuzYZgT09nVi6
         vV8qmPYcO67Sg/XsSJIXbi9pwdzhbSr5k1Eq7p3ooNns1OQXih4gPtmlRxyRI3d3p11k
         rEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912089; x=1795516889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaga9iq2xMzHbd5n0lWO/WLBwljw+5hVBVM+gVZj3uk=;
        b=CNHj623nx20s/xRaKpCbYRwQ5Bd5rfVgG+zX4/tZlK90vTOxp2eeqQJ5fYL+215rmZ
         1VCwxuz6Ati83JW6DS3AUWemdO92vFP4MPzg9u2dn2AC7r6mwijl/F89LMIvDNSMhYKs
         WNMHxxXqW3ZCWHVs8SDybRWRxhTEX/yLyOAGEI7evN7qGWMHySnssLwsNHiABEU/HRbW
         mdzdLaJIY+1LOL3SbjW86s/kow9IcSU3KHwN7g48DvCIzSXzkFlEhPUGswOTr+3uaT3m
         0aPrKeZgSJ/P+sll6fJIa2xSouylEnUxawlSUAXkDd/S8u82X7sC5g8uKrS2X+YxDzkr
         22mw==
X-Forwarded-Encrypted: i=1; AL+hErH7nz+x2rXj4CaB7AHrHiY3g14ifkjt01D2WlEX8BtyiKff3HlV4S9AsWiUcrMMX/8+clBI2aD06ElghDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SJgO3GJSBX0m66D0z1hS+cuEa7+wszVPJi+dxCmLOQk7tdWEk
	hWL+TvQ3DM2m6XmsRRioa3fa7+TwOBtY6k1JjiNCnGyZ3qLidMAkne0Y
X-Gm-Gg: AYBFou3KxcYVZ84FfmujHS/L2yWZUP9pgw7Y2rLDUXcATp2fmPPUYeQqCqHjVwSeKgu
	AJFvVoavWzHuNSGLW+iMAsxL4JphJ2XUwugz79AKol10BVM8vF7MVgtdauOJRJVMOX6kJ3OeopC
	/zVSl5S9kE2s9Znrq+Me+9MtduVA9cWHl8eJwImnDuuv1NILJ7NbzKIT8bbGBdwhRlPHyCPkbcl
	F+WRGOybzBgPYRlwh2NxyiwF1xWIYOJZFEY7in2MkCT8udxhKYp3DVd9tyWcXuwI6jeTUvXQCPC
	RxWemoHdBDHulIdtjXOCYtWaDSv8nHwzQeMaLMIfdLHpvPWv746lvMQkK0TApd3HYzD1T6yAdXV
	0WwiWYDf8nxM0Dp7bV01uYdiPrd4DNcbpuhnESc1rYIs1ha5lFHq49OeQOOcBOUQSK2ua/cQTHj
	3QyUnZg74Wm2TgLhsXTqY84L1TQSiX79w7RdyMMKzc9c7X8sCIkCd2py8j8Emv/Cbsovt1b1U4p
	kPw7WK7YMn5ARbO7s9PgZGav0ta/OF21sEAK5zC7VEbT9b+9BVWQO517rbDA8i6gPhTruUfEBpN
	4sx7oLYb9Vbc0IY8UsoTL2RtZUiHtpupyfZxvdIB83kYfNAk
X-Received: by 2002:a05:6a00:2350:b0:8b3:15b4:45f2 with SMTP id d2e1a72fcca58-8beb6b6baffmr12020475b3a.25.1794912089476;
        Tue, 17 Nov 2026 02:41:29 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm4900102b3a.48.2026.11.17.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:41:29 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] gpio: mpsse: reject bulk-in endpoints smaller than 3 bytes
Date: Tue, 17 Nov 2026 19:41:10 +0900
Message-ID: <20261117104110.240112-1-hj351016@gmail.com>
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

mpsse_read() reads min(len + 2, wMaxPacketSize) bytes and then copies
len_actual - 2 bytes to the caller. A device that declares a bulk-in
endpoint with wMaxPacketSize 1 completes the read with len_actual 1, so
the copy length becomes -1 and memcpy() runs far past the one byte
buffer on the caller's stack and past bulk_in_buf:

  memcpy: detected buffer overflow: 18446744073709551615 byte write of buffer size 1
  WARNING: lib/string_helpers.c:1036 at __fortify_report+0x6e/0xc0
  Call Trace:
   __fortify_panic+0xd/0x10
   gpio_mpsse_get_multiple+0x767/0x780
   gpio_mpsse_gpio_get+0xa2/0xf0
   gpiod_get_raw_value_commit+0xf8/0x1f0
   gpiod_get_value_cansleep+0x1e/0xa0
   value_show+0x42/0x90

Reproduced with dummy_hcd and raw-gadget. A read needs room for the two
status bytes plus at least one data byte, so refuse to bind otherwise.

Fixes: c46a74ff05c0 ("gpio: add support for FTDI's MPSSE as GPIO")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/gpio/gpio-mpsse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 61c5ca96314b..3ad7048f009f 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -676,6 +676,10 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 	if (err)
 		return err;
 
+	/* Every read carries two status bytes ahead of the data */
+	if (usb_endpoint_maxp(priv->bulk_in) < 3)
+		return -EINVAL;
+
 	priv->bulk_in_buf = devm_kmalloc(dev, usb_endpoint_maxp(priv->bulk_in),
 					 GFP_KERNEL);
 	if (!priv->bulk_in_buf)
-- 
2.43.0

