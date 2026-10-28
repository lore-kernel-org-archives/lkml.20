Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199847;
	b=D2R8Qjt4JVhxnGTA+FqUG8Hi3VRVcXf10xmpAhZDAyKQptKHCvKFCH8auNdG8Ms5vhXp
	 gvEXzxQQmQwQ/44WGK+AVJjdvukCwN5VTFtdEPBkQrrl2Bg436QE5qHa7dlZ9zHxqVevK
	 6BS2pAd95IwkZa8u9h5cBGKN2jdw4YXLeeSw/ANCKODPFW9XVH84SMzwIGDaAE4TF06qx
	 VI0z3cz0ii8J6qOqM5L8nTjs9Ogi2h6olqEPUALULWiR25x0Pz6heODrB3xDPEdxCvjhW
	 9aiIXGmuhm580fa3OqaxFHHhApclL2aXhCwYFiVrGl+3mMRuO7OQn5lIvcnjM+x61ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4kjgCSLosXq/SLvCwDVJ+pxPOiRFESJ6Fwr6qQ2Iw0U=;
	b=oYb6dHQhRLnAR/y/F3kDT0ybrxuRsCbq4tHWHEU2edxonZpKzHV9gVdVtYHw1tHdvRIT
	 ZBUkYRfU9UE9jIqOgJl5c10ymCjK9Z9bDIX+qnE3WPGA1CW3YrNjB+e3AgDfd6itBFm5k
	 mLwLMalUlyxCGp6aPNf2Y6uySwhCnCA6h6MEEMc8t9kjH4KoMssNvxjOkXY/Twns1wByF
	 ZJh2b70W225i02Rql5uyhv91+euz/+mPVvco63hwzaMap1zF5q2WIlsHxYuWMqzEZLe2t
	 K6M9hn95O5oqu+Mzpgiv7CLSRRsZzIF9Ww24sW/xIm1JhWo2cp35Zscem6zVlsPDZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXbwKFNt;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29808606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29808606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bXbwKFNt
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7471585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199845; x=1793804645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kjgCSLosXq/SLvCwDVJ+pxPOiRFESJ6Fwr6qQ2Iw0U=;
        b=bXbwKFNt+U6tJ6iAZmYjP4JiGxbGg+dtYAdC3ZStzFIwyNbrd2NALJBOPl6EEJF66X
         bQzB7kUc+hZY8ChlVQNhwoFkLUgq1XW0SFu+/jUfsmCreAp9oY59Kul+1rXuO8OpKcRG
         o2jYK9sWVAeI2rCZmkwpsqtjsBv6tRq1CsKqc5s0jzNWZ2PHj9wIvQ2DSCkgumFmK/mU
         NbExgyJSIFcZ5RpjoVgW4qMcarhn8H8Oa7QcEOEfxgu0GCAcnJiA1/qyEd0Q/xW9/OBV
         vhRwRHGAYJ9Pb3v8sgB5tXkHr7eIBMlFMfin2vgd9LtrsaOcYzETk9sM5WUMKBQSH/Yp
         O2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199845; x=1793804645;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kjgCSLosXq/SLvCwDVJ+pxPOiRFESJ6Fwr6qQ2Iw0U=;
        b=TU6Bl0ha68mlPCnzCMFx0olZfbbwv6KpLBjqVLA3EVkJw6ATtPwZKE+wGW7aI+2VWl
         bh/ZeqHIMXmJuDiRwUbcxRnIl2P6PTwnNAVv+m0DUfnSfNu1ouvHJncY6kIxmxhK7DIz
         0lMHpbGI8EUVzKnVitMfi7lvXZtwokpUK973g7t1w7hz7jRPOC5lWk7N7pE06BWyso4Q
         ThrgmbE4TI1mtgQG/HQuoSHeWhu4vc3qNN9/pJsy9r76mEiTRiF5M73Bb4C1ZgaJODp1
         jrWGiD2SV3wOjdt9x1cTK/3uGlYLpQ45UjPD00uWbh29n7OiGXmMVLfxLGLRAyiVQgb6
         //2g==
X-Forwarded-Encrypted: i=1; AKwUvBw+wkaRXe1k8teD71xVU1laXv1KPjx/fUnsO+UOAZc+q795FmEmMk3DLtwSh7/3e23xL2Xxavw5mY91Xug=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1DCIkuwEv4G8/wWYgboPMb0/22KTKPMMmKFs/b4i1ILjVTU8m
	r2oAd0SrIFxVDuaYusPM54QSPxc+xCmeFDorDRKS2hWPsdRmzDh5Dt8l
X-Gm-Gg: AYBFou3x0mYhPfl+H2y5HFTMfRdNGXwcFypwEGACt1PatuPKCCj8CsEkzXKP6RLXx78
	zMM/fo61FQ6seF1KrfzHfd5ZPhxXXWc3ymNQJivtbLgcMSuW8WEJVQFWhdQ5RW7kgLL2mlIZ5DV
	eFegLuaVU3BwUnzJ0BlnNO6em+EfdxNiOjak4KwmMYMl2wcW9dkajEuMx5lveSf4L/qZNALUqz9
	UL5TT0xp0zSt8A2Gcvp/P9QRvmcDOROU2rzFL6wUVpPZi2W6l2W9AHO/qrd20uWYi6UwjRJ10Kh
	sIZ+KC7i7zvOFhNv+S9I6bw9DuLpYc2UQBj04EoFBWsYSq+VjtVK/vF3ueoIrrah32L5rk985Gw
	SMGpOWG9i4X7eiyxZRyZS1KoetaqOEFLB/HB6LcYXX3mM8DtW5r43WCFYEEF/f6tdYZAO66Wqjr
	xBQoh87FEFPY65sppbQBfon8Vpn/ONKM6V5ZlphhYUa3BvFvC4NJIVlXrjarePQ1LZCvAptwSfi
	Wm1Ye1LmwYdV78AbO5uLA7s+1nfAIaLcuyaCB/h0R8MDSnPO6OSfY0MPzV/0lX88LLUi9rUlktI
	xXE5t05NIh5o2f+abzaDT1xykH6WeJ0eTyuhTD77cHJab13q3m4xpqLyDMYfp7mmbw==
X-Received: by 2002:a05:600c:354a:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4a96667c86dmr56028895e9.8.1793199845349;
        Wed, 28 Oct 2026 08:04:05 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f5311bdsm62547865e9.5.2026.10.28.08.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:04:01 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: uinput: document -ERANGE for UI_ABS_SETUP axis codes
Date: Wed, 28 Oct 2026 12:03:46 -0300
Message-ID: <97e5c71542aa8074c6db4d4146d9aab53f0ce04f.1793199818.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831192752.258550-3-ivanrwcm25@gmail.com>
References: <20260831192752.258550-3-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

uinput_abs_setup() returns -ERANGE when the axis code is greater than
ABS_MAX. The UI_ABS_SETUP kernel-doc only listed -EINVAL, -ENOMEM and
-EFAULT, which led to a mistaken attempt to change the errno.

Document -ERANGE instead of changing the long-standing user-visible
return value.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/linux-input/20260831192752.258550-3-ivanrwcm25@gmail.com/
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 include/uapi/linux/uinput.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
index c9e677e3af1d..4bbb9db1dbad 100644
--- a/include/uapi/linux/uinput.h
+++ b/include/uapi/linux/uinput.h
@@ -127,7 +127,8 @@ struct uinput_abs_setup {
  * old kernel that does not support this ioctl.
  *
  * This ioctl may fail with -EINVAL if it is not supported or if you passed
- * incorrect values, -ENOMEM if the kernel runs out of memory or -EFAULT if the
+ * incorrect values, -ERANGE if the axis code is greater than ABS_MAX,
+ * -ENOMEM if the kernel runs out of memory or -EFAULT if the
  * passed uinput_setup object cannot be read/written.
  * If this call fails, partial data may have already been applied to the
  * internal device.
-- 
2.43.0

