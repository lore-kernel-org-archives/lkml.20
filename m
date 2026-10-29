Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266087;
	b=sQ5kQwEjQ/FyaYRZWH6QuWUvaVCi+h0kQtOS66CzqRcazG4CSyjWTqygVWp61JnQlXtf
	 u4b1E0zecoFSeZ2t+cMAJ6EXVenYL8TAOrXvZtKVFlFCGwgIM2us4Li7EaW3p8bqW68Pu
	 /kUvc+G64W1Oglw9ygSnEIhS6glq8Svfe8CQunzXBd0pLRfHou22yB4sjM2Xq4VnbhCoM
	 0dobCFNnbtYMXPidI+/1iuThPYjVMsUh8lvOi2ukxN8s04PqdjrW7yszvEB5EbpmkqR6E
	 yQQHM1S8jI6l4IKtBXeiCEdcmK+BkRUrgHQuv44ICiS+jLfMadE96Ni96m8n9Sb3Khg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
	b=iH1PL8Q7Sb/8s1s0h1GjYAlcZN9GKAuxoajBJSuXsH4c/XoGwKFfInWWLn8l6d+4rDcw
	 GJgCzdzsnpM5uwIJglFM0pvcrcav8SDxHJT7PE9kDzHw+XSMybuyzvrI9NP0C6FnDnIlv
	 dtbM15mEKU1BiE1Aa5RXLodmNXzXtjr0tw+XKu1Tw1viTBF9vzUalw2XZm2SYDg3MSs/C
	 Ipy4fWyZ17gVh3jT5tTd4xfhQT2sWtRUurmGSuVwIrW42iuEx7T51usqxgw5UIo1lj+Td
	 dbTgpq2Uc7QsEHky0VsMkYc3Ax/3KNqjJ1WIkq4OOf9MlyJFjm3Ks9afFwWSwH1pAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXkK1GyT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB4606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BB4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gXkK1GyT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so22502775e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266085; x=1793870885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
        b=gXkK1GyTNmWf7o0dX1xpL7bTBKfWl9+vIFq0LUAtw/jC/by41htTXRcD/DLb0GSNMV
         OOsFuITCrsYgHZw2yjXVb+ss1pzvslxE4siBCX9ISWmrUWeyJPpBdeSYWG+93o2ASOwF
         Vf38cTYqwXkmoiZ8/iPSL6Df/qEE5E9Sd3Nn0mHzzes6p6RtgKEDfyz4GFAwPXcrK+f3
         2kS2oCsIG6l8Gm8U03g4izsbQZnuzdlyXR1uG72q9qhwa60ecFUJew88NU+XQY9l4Q5T
         6v15XFE4wiscDhe7IDNfkiBYsVc8pitmmQxZiAlFjKLRXAMYLByj/DLNe2VsdGNYjt+W
         humg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266085; x=1793870885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+KCgDr9UJJbQIx7mC4i/I2OBN1kJKNwj5V2SZ0eQ6k=;
        b=C3QmAlKXrn82sH3R2KQPfaDtgJ8tOjxLwazuMSl7U4APutJoP6QhVDpirIWD19aMeE
         wcepK+hmrSlB6+xs81lORlY8J8FsDHQOE1ANG+31ncWZ0v/ZSJgEfjZBb+UtBIOl/3eM
         SdefV87CS8FC33u84H+ceO8+Nt1yIAND35ezgqHzAFAmo2kd7iui+y+A2CJYmVWgmnbz
         qT0CeQWrltHjJCIQklGbY3NNNupZDA0ZEx9xC3sKzR5z9C99ljS04i68rre47sYyYh2v
         FSSyp4ABpSYzRYLIaPlETPAIRy4rXf/39UhFP6hPAwDmEknnOG/yKQkR4PSVdkil7hVx
         05Sg==
X-Forwarded-Encrypted: i=1; AKwUvBx0iNv15pBQEjd/jds2F/BUkht0EKp1QEqQV6+8dz2m0d6iNYI8vfWUxMCklXDqcypUpRJBb+93JPDe5Rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo1HQoA+wi/jdIdjzC0pFIinC8xq0hfIu8aAHoMI8QWsDDbYu/
	K3nKhwwENhdz8wDEEsohzjBJLajZoXZMPcfjqcx5Dhb2e11Ulw1ex8dr
X-Gm-Gg: AYBFou2vVDw591WORl6v/fCUKdEe30AutMZIND1QQU0fNdQrghQRryTTJaMFxyAkbfE
	jwlYgAafYpbYoODLByjGrS24j4h4Fmowkdpm3L36E6Ly8sVYCye6HQF+XuzcSwyikj/k8ZjiztQ
	OcutRhunAPYsi5n29AiF5HzLx9shYqFPq5MZS0RBCrVKFNrTTOVpIReJNtXaP3eQIFaBu5UM8BB
	N7JbmYmHTmit5ULf+As7UgDEKpM9bHJ/vdSu7WApSIkvxs61BkZak680R5mNRlLGSnDieB+MHia
	d5Jpe5tOf7EkEjiRxR+dXmuMiRof7p01M8quu0GZLiHJogqEaJ2iC4zw1jlsFpKTzsAE8bJe8hZ
	dPxa7GiBitzfD7foGQ8k9sVjaRYiftHPjn37TuGUzXdsAkAtD7jVSZ/g9dam5ihG8pphQ8EUzXS
	0ckhSmrzlt6G9E4TTc4LelzxQe9aZ31NtUlbk+UImtGXzLR/M1PJBOA4NHXguXxX4HMU+0lHQvI
	4Amn1ftxRbGoO4BAYpzg0t+Nfs4STcuaEGKen6VT7VB/F1ZtNMtp0JESX+AxmUY+enUTfSmaD63
	9I2W9EcXUO2ARXY8WzdDfLQbEMxKQKiofkRCzax9tB6qUg3Axi5pG68FLAZn9iBzNqfC9pjvtWD
	X9E7hPrUGVjuuvtUEl++wej6uwWZh+8PdFXlok4lSq9STAp715dLWkam67bIYTJ5EgEOB
X-Received: by 2002:a05:600c:3541:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a9672014d4mr112987925e9.26.1793266084969;
        Thu, 29 Oct 2026 02:28:04 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:04 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:54 +0100
Subject: [PATCH v2 3/3] media: i2c: ov5693: Use autosuspend when stopping
 the stream
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ov5693-fixes-v2-3-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=1994;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=BqAoIHyVW+q0T8uthFLboYE8msP1bRHlLUc4VCxhsMQ=;
 b=Y0QvG3xcjMxxLXTF4F+2flEq82TPB7jiPZad8NGBRrx41VECDt0aFdmfPrXTHRbjwh0dKJgCu
 bTWvI5jf3TADUeL/wFqcbs2nwGwxWQDvoxU2XyC0rNuU8rzP0np3ahW
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

The driver enables runtime PM autosuspend with a 1 second delay at
probe, but drops the usage count at stream stop with pm_runtime_put(),
which doesn't update the device's last busy time. The autosuspend
delay is then counted from the runtime resume at stream start rather
than from stream stop, so after any stream longer than the delay the
sensor is powered off right away.

Use pm_runtime_put_autosuspend(), which marks the device busy, so that
the delay counts from stream stop as intended, and a following stream
started within it doesn't power the sensor up from scratch again. With
the mode now programmed on every stream start, keeping the sensor
powered between streams no longer leaves it in a stale mode.

On a Surface Pro 9 (IPU6) with autosuspend_delay_ms set to 3000, the
sensor suspended 1-2 ms after a 5 s stream stopped; with this change,
3.7 s after it, i.e. the delay plus the autosuspend timer slack. On a
Surface Pro 5 (IPU3) with the default 1 s delay, the sensor suspended
as soon as a 2 s stream stopped; with this change, 1.1 s after it.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://github.com/linux-surface/kernel/pull/181#issuecomment-6436016335
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Chris Simpson <chris@nilk.net>
Tested-by: Tony Garcia <tony@loafecho.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 9fedc087e..086f9df07 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1065,7 +1065,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		goto err_power_down;
 
 	if (!enable)
-		pm_runtime_put(ov5693->dev);
+		pm_runtime_put_autosuspend(ov5693->dev);
 
 	return 0;
 err_power_down:

-- 
2.56.0

