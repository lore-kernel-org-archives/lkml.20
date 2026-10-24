Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812647;
	b=he4XRHVDnw3xC+1mWhd5UoTypf3dEFkI/BurzE+l81X6aClDH6F+FaV81IB+wA3Em7EI
	 vCD5G4rMrz//YAFLFpgAroDnsQbKMUDxc49PRslZadzjy56C6D1KqxFNyX9cVJFumL23K
	 llP6NKx7i90S7jakvqHGyHfhyniJ5Nl8a+skKkWfMsAvaTN9NT7TkiBSopFJnNSMgB0Jz
	 Yw4LmQ/MLrDnPsi1kHgIhQvZXwhTWGLc6bcKd0IJJXzYH2yu2LMBvSKSK3Ky6qbFadGCL
	 RdhoicGKsUcCRI/fOUp6KMQHsa2GmEnSQQ5D0a5PA0vQZWvPiPPnYxwJU/S2ba5dPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OZMDdE1sz75D6sUxXlzqCF8BQygc6BjWQNC85XiMV0U=;
	b=zBASt0BJskD/lhe8w/OaOOV0Prwc11Jut87mO6NzLj6uD8fZT9PPZRzH72DDEILyB7Az
	 yypQjp027PVCWG8f1/1vpEUzAumloblp/9oA6Db2f7OEUtDYnH/QUQyNuIlOsDY1/rQmU
	 s8W2AGYngnF12LJkWiEbyRu8s9gFRo1bjSk1KF/oLY3u4Rvbq46TIMheeZ9c8iIz2EZ66
	 QD6APzZLYBxJHUx/KvTLn+l09aN/OmgwMjzX8anALknhD+pflElxLpWtiw3D4exIHHaC2
	 oghP4c9sw9PYEv/+omKNriiCr3uKITma2S6XEUD5wy+vb5zbaovKoeyr0aEyqZm7a1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Gtu0Vp/H";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B7606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gtu0Vp/H
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso2249171eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812646; x=1793417446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZMDdE1sz75D6sUxXlzqCF8BQygc6BjWQNC85XiMV0U=;
        b=Gtu0Vp/H5EfWSIIaFdMd9y7DYtDlr38BhaEIteYiOBAlHVJ895c6jCEOTfnuMjRiDr
         gb9Bnui5eMkyisoYaH8xLFFDx1KWNMq9FMgEjUkXHXht+ZenwbpFIoJCDHT8zLEmVelp
         AJZ2lODAamK/P9ypcWuohJNCyhbwdRCIJnWBArEhgDYadnYESPOXuRxSMVIh3g21bIZN
         wzB9IqC9grdxl4hXkY/fM+Qjju5xqt55WHV5MBEl32CEyqNPY5FjVJGzCDAwfRj1NHcg
         buY0NPqeRxJLAeI858zPtQa9ceBlv4o2CUJmA6XhlcWWxOEvVxLy+UcIDBRwVixMS6hx
         gz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812646; x=1793417446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZMDdE1sz75D6sUxXlzqCF8BQygc6BjWQNC85XiMV0U=;
        b=zNRl6Pr1U5sqqoSKr4x0i5cqhJTmPXa3gUuNt6knpjQ5i8iLs3I9nnJJUSvZEZewtk
         q8dGn8yF5HvIJ5MvEI0YQDA0cDl+1xiaL7MqIfco1gfF3xsc5pnRGfGHmSlh7wOhFTMF
         Cx4y5DxQj41dayA0H5pqRBQanvJQkRIgq4HJ+Z4mSNcgXmG2jotM184vKx5Vi3cVsqRR
         tp9sbheFfqpMrV0ojIQsSRdG8xAhQqa/fdLy4PshvvNSeQrq9nVZ+WqAN0s1i5pgD84d
         /TabeoIPcJtorwqpVcOuCdkBvYGNIsRtk4X5KhC8cDbAcxmbwwR0tl0UO7qGvCOffLr3
         XNjg==
X-Forwarded-Encrypted: i=1; AKwUvBzaFI0OcQ1ONkEgEZ2o/nQGird7RqZGFjpomb4GR4BLiyHyZyB7caLns1XG/AZrT0t2Pg9ksIWnuyRq8/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXw+161AanfIwXxKlCfO6kgsZCkRPS7M22RboI7AOGyC4DVNX9
	FAXjOLXoKNd6m56HdcVUrDgpQw9iXRfftMK8AFmutp/YMosWIt7iwwe9
X-Gm-Gg: AYBFou3KtD3EsCtKI93qXPsbv7Cmfoqcn3KiklzbELL7OxD9xEXsF9FmmHBW/8gjyUI
	nToKIZDFS809+eAkaGfQvgp0JpFo6iV69M4omBwafXnz0APD0za9jUsymR5HUMeHAUxs2VyoDO1
	1lkHMMOAYv4Pt81dtTNNGiaxgiVD/C/gFkCvoO8fiV0e3f+/i2r0xrXBL212bKhIoU6fCjXbdt6
	mu7HsUU2LyMK9+PFRH2vfGixmV+Qc2K2WS0kKeVM9M1XIwuz7E68fsq+xvCq6tFJogQugSzHeTv
	GCu4OKe18KAHaXAkmBTip2yJGMs5Awqg5MqO+2UjGv0t/Ek9fKZWDOS+xRJuQPFIG+gqwyaoogo
	a2LZlseJU01SAlM1FvNgmFmAvn56JwI5pqvh5T8Up3V423McLxuXKBA5Sj50vbCUxc4fn95gLnQ
	pRmq1qeHdSEhHLdrztM0ef9R39H7PcXJs74iQ8DsK0cKgXztofWp/gJKuNRU39xQw5pwa10YCH1
	wfRgB/dbt3rWOsCiVfRZ5+UiqiE1clOgXHyBFn/Z51xetu6fPQNjHnO8SXCVtg68mM55BabrV2t
	ablFhEf3lf5lMVu+Fov7vAXCtZj3lOHWXXqp6Wli7E8iRp8iAA==
X-Received: by 2002:a05:7300:8816:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-369e9306c7emr1047457eec.30.1792812645741;
        Fri, 23 Oct 2026 20:30:45 -0700 (PDT)
Received: from jmoon.tail8e743c.ts.net ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm2827283eec.27.2026.10.23.20.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:30:44 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v4 0/6] HID: wacom: guard against NULL input devices on successful probe
Date: Sat, 24 Oct 2026 12:30:34 +0900
Message-ID: <20261024033040.316652-1-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
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

When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
the corresponding input pointer is set to NULL but probe still succeeds.
Subsequent irq handlers dereference those pointers unconditionally,
causing NULL-pointer dereferences reachable from a spoofed HID device.

This series adds per-function NULL guards across all affected handlers.

Changes in v4:
  - wacom_intuos_pad() now returns 2 for the normal path, 1 for the
    NULL-guard path; wacom_intuos_irq() applies "result - 1" uniformly,
    suppressing the spurious input_sync() the old "return 1" would
    trigger (Jason).
  - Added pen_input NULL guard at the top of wacom_intuos_irq() to
    protect its helpers wacom_intuos_inout() and
    wacom_intuos_general() (Jason).
  - Added pen_input NULL guard to wacom_bpt_pen() (Jason).

Changes in v3:
  - Fixed wacom_dtus_irq(): DTUSX is pen-only, so do not require
    pad_input for it (sashiko-bot).
  - Added patch 6: touch_input guards for wacom_intuos_pro2_bt_touch(),
    wacom_24hdt_irq(), and wacom_bamboo_pad_touch_event().

Changes in v2:
  - Restructured per Jason's review: per-function checks for dtus_irq,
    graphire_irq, and the Bamboo handlers.
  - wacom_intuos_pad() returns non-zero when pad_input is NULL so the
    report does not fall through to wacom_intuos_inout() (sashiko-bot).
  - wacom_intuos_bt_irq() guards both pen_input and pad_input (Jason).
  - Added dev_warn_once at every guard (Jason).
  - Dropped the cp2112 patch (Benjamin prefers Dmitry's series).

Jinmo Yang (6):
  HID: wacom: check the input device in the shared report helpers
  HID: wacom: check the input devices in the legacy irq handlers
  HID: wacom: add NULL input guards to wacom_intuos_irq() and its
    helpers
  HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
  HID: wacom: add NULL input guards to Bamboo handlers
  HID: wacom: add NULL touch_input guards to remaining touch handlers

 drivers/hid/wacom_wac.c | 127 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 122 insertions(+), 5 deletions(-)

--
2.53.0

