Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311048;
	b=GPkZ0cNnDvyIlfdQAJ4fhCXa1kfAlsgz/hMz7GjqdKXsl2xBKJhQjagJ6z86M2xxZlQs
	 OPh0lM7E6fxGMQ/NxkfYU4SY12ewOLe82qKfo+erkPUaIF0G8EMpyDIFW4Lqiv7aROYuD
	 NGG9qb+/In9ewNkQfGw+sryoCztH1MexKwbxzErOK+MauRrqJCQWUzC2LUR8S0KqNtCm+
	 14I1Ok3jn6RHtTzCeDwT7HhOIv4JSAI3NiqbTjfWzIW891GiLYThl55gt/D3NdvIVdL6p
	 CcPXds6S3tXmmrykWic4Leo5Ae8OdA5DtwxZOl9pXKjXuMoDHJx28eJMtcvN2iXGpNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
	b=Txq5JddXXRIdBGMdhuvcONpz8TvGzl0ZS9eyHGmqNtP2wHP2NOQ7cNiCxUhqP/yA1fsp
	 9qcAJOR6cEP1o/8zr6R9gsgYYWew1/UHZspNjrtE1nsbNOnPzcnkufD6OEGaT0x3UEWW2
	 Fq7/zTB9uDN1xVdx5zS7JLZZxeCGHdqDPTX+/A13boLjr3+In67WmsTPrHilIt/ZopBo6
	 jz8Ao/i5kukdv4IfzhMZ0ULDpUueN54NMO+xVMSgxnBP8/VYHaHVyNIYcONkUrRMi7ozM
	 SakyjQQ61NZZ3tVYJMEUw9whXm3h+oWDeqa/KXqqzPMUYyOV1mKozTb6MkMFTlq575g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6HMWVBV;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9432F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6HMWVBV
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3130583c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311048; x=1794915848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=O6HMWVBVln5XP80c2bMEK8+zD7RjvqUj8izRi31qCuDgXZ4dYDMjCL+gRh4os4IzmA
         1nuQGss7B7ZgejBA+qzsIHKjGh3cxcTB8YsHbxCAIlBIoqIt2Wevjo2asv0YjOZqt+w8
         EcKbYVGSvRzodNPjM7fVMqfBsMwVx08e+XX1vYee1/0joE9wbdyvnyC4IPBK7ngcY2tN
         LkxmqpQZvLKJntF6zADGKa8xXba7omnUSlsdABiro03BZVe96JK5NPFwV6c0QN/yfl1r
         LpA9286AFWzQkEoK1qBW8jt0CwB5G5PVttu/ree8u/aXOU/odXxkkMfF+UFKnBM+2HYA
         KJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311048; x=1794915848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=AG2GYA239R/KDGkRqVbtkPh6XXk5xQ7topQRGZuS0mZiMSlKT22uMKccOFBSjD8u/E
         V4fFKDqpMj0PCpp7FgFt3aG66I3gtrWOkYxzcPfiGdCfeYfbfdsm/gpJT5tbx70yg08R
         DObqkRZtyQhnQrvhv8kTiJY/dgLgQYC3MPy9Yn2eCNjK/aisbcN33484r5msbeeE1/kc
         eLy9CYIZ7dFRTvo3wWsKKtwCLhY03yvGkfCE6MiW0tdfCY4nGyYpO/OULD7qUb02Ewfc
         IRnhuaLFIGQ1WT4aeS06wbin7KEbYIZDJSR7oJtTUpj/1QqiiSmzcSwF5GW/wItvxWYh
         0/1A==
X-Forwarded-Encrypted: i=1; AL+hErFHWBcvWtjIshy648bmWAMKQhxX5n1sB6o16G98GbAw4AWs5Jxix6Ch8qfumAAvEzRh5jtXuSuDuQmMQeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c86iY1ynUBwzdCZiiRwshfMiL5nJd91TIy8xSNFJDJ9QyrxjY
	JUTJ3D1vrDQR7aUVyBpGijYfFdVDPBgWRc7DJliGIDU2d9a1vdJ5dj5f
X-Gm-Gg: AYBFou0VbdRJYPll3joq7MyHdQLS9wUtGt3z6Z2ElGxALXaYxez0LQcWorvMPOG8a+i
	v+8Fu3819YQqlX++HvIWn62TvhDvVr3cmNyiZgSLZDwr2x9q3GC5F5nDEtSm2zInG0cmjpTmB7c
	umJQrdR1f7XK80WmiQaST+SU6kwsGvStC4R3OneUxZxc9Vf1TaF9CNmZ2RqGgLj8Ab8KLhE0pnc
	4Fm84SWkK1CFUVUumku7shhAz1DbKV0VlOJupZjd8BeL7qqe5zsbtJQZo73eiYacF3Vt04Yh8od
	muhTJQx8n6efKPsKcEVbw0AFTOOaJnBWUI2fNoWfKDNX5yIJ8VS8RUhjf8D+KwJcZbBDjb7cD1y
	O6koF3BVbgMNkEXNnjKGRaQUPIlmEFwpDUio2201f7TbL01WlKwDIMudjIwSoYXqZCL5qelNThK
	sBBt9ZWpGrCZRrLlaczzx7G8xakEI4udwHIAN+9/aNImhw/bDP3sNMMQE29Ov3hWn20CRDB9fRf
	CuD5p4/b82FgOWgI0Xh7c905FJcvvSFP69/QNbyUTWY7pxDJrruhTp+ik2GL0wh6KJM8Y/pTagR
	DogI6paHOlD0PmIQmDFx8+RvkeaQOJ5oQu5+KYEYZAi3oJX5
X-Received: by 2002:a05:7022:3a86:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3b60249b4mr3330257c88.20.1794311046423;
        Tue, 10 Nov 2026 03:44:06 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm6648791c88.6.2026.11.10.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:44:05 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 20:43:51 +0900
Message-ID: <20261110114351.2524921-1-hj351016@gmail.com>
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

isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
isp1301 i2c pull-up access from process context. The work handler
(pullup_work) dereferences udc and touches the isp1301 i2c client.

udc is allocated with devm_kmemdup(), so devres frees it after
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which can
schedule pullup_job -- and also puts the isp1301 i2c client, but it never
drains the work. A pullup_job still pending can then run after udc has
been freed (and the isp1301 client put), dereferencing freed memory -- a
use-after-free.

Cancel pullup_job in lpc32xx_udc_remove(), after the final pullup(udc, 0)
and before the udc and its isp1301 client are released.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3..210fa1f 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3186,6 +3186,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup() schedules pullup_job to do the slow isp1301 i2c access; the
+	 * work dereferences udc, so drain it before the devm-allocated udc (and
+	 * the isp1301 i2c client it uses) are released.
+	 */
+	cancel_work_sync(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0
