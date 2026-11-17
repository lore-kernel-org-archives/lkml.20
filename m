Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884357;
	b=5C6Lm9YRRclD/roGpWDI/L/LdiDPvYP90Mk+ye2csN47G47jF9JJV4xpWn9Aq181KZYr
	 kM8x5PZQ9pd8e8W28C0GX8cuB/YAJVSZSARtomTxxqaTLKvlJ+ESGVkCdkXhR3vcUvaXj
	 fIIhnGIVo4j5yRvVX4bSKHbuwuYSv44vhtsHkHV1w3BhLYH+7KyyYCgHDrazbA4EY1L6i
	 bCVeT0IfKGVI7pFA3PoOZ+f/WQHco9ek5zkf2uPkEbkaEm/0xpl010zWY3XGbkqqqNeCL
	 pqJyz+dNvQL19/EqMs7TUz3bhCu1IbFQgAosCMHQaG5LBrfAOqWItJhI6xKKIu4L0gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
	b=HckgwP2tlhPyezUI97VwASBgHmSZw3XsK4Egg87yFU225tFuyBQ42dlSFAwo9bmRM1QT
	 lz5OUXGNVyvdXECwvgSGgTUzNc6sO4pyxQLyy9gaS/EcvQT3UPYURI4hNQ5mUPXiQRNu2
	 X8DGvjrlgBhHjCdvKZ1Qt5K5Cr/Bt8JukbuhmoiyvWPG26MGXRK9TJLsXkV9leslaWhtk
	 GH12auqnPkoG41Sj64VXTPmSTZUlE13/M/gdiPeREots6am9ut6YU5UUW4ySAmOL8ltfc
	 zUi8KwnVj55E0QSZQo+ZAg7mfygeuWXxJSuPZgarKFUCztVo4vq2K5H93Heqt7qt6mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F1606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200F1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4e246acc2so11511107b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884356; x=1795489156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=GufmHECwABO7UKejS9V0/k/4iN0Nfpe04t416Pjq799GhiP7h4Cak+ke9GOYKXHxuU
         +Q2d1kFnb7uw7piGNFmMPNdtdd7XU8QfTYP1Yhr0EjegxbPWMwMmayAc3TNkD1Rk13uV
         Xs6sQz1YggwRBE+NVOAppkTBRCnYckQ3sM84/44MLVceB+WcvyshHqNAPaDVCv2QI9Ou
         rLMHK87Ez/irHc97+5TL9v4CypZohb9Mr2zzDiuueZniQ9qmI9M5gfoMT3W1yzcZe+JA
         Qa2MzVe6LqdpGfyxUNpiCUzWAO6/Hf7rsWwNNECCJUsVTK7AuCOFVysomLWrGVpEut3G
         jSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884356; x=1795489156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=uRh0N7VbZgSZd43nSOyOusnrbzyt0QhexwG7r9YUfHvK1ahUiK7rhHSNDobULeR1ij
         zCUmlk1Y1ZTi6X/3cCTzrqNOZKrm12cIkc2XJke2UPQldRnmgfOmOgQmLlwtqSOQvbJP
         w/c8yFKqsJO2HKpwOMRC4rxA8K6xHRcd+U+2qg6l7WsuDIzjibygxKYUVro/Qd3rL9s+
         Y5tVITchG1qi5UpDNnLmI65jYBYN78QXOgNRsN4AiLwEwl2QpqI3H+HBOPxluOQSICOP
         0/H+gYsd/zP/dLGbPrMR1oqZ55fcIh9zT7dpFq93iwDMRU1J6SoZmc0yzZMu9x7H7MJs
         NjEw==
X-Forwarded-Encrypted: i=1; AL+hErGE6NYTeqIk6Aa5RAtKSHiM+YvS8zrB9cKMGepzv4BZ1Sp/onimnGL9C7kwsqwDAyLu0ncoOkjdtjDoj48=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2texI+c1JUkHfSjUPHBwpZ1f+d4NZGnFrwnmFpLwcjyQA+eB5
	Bmn4OMrGeQgHFs+0/pwhgnZBXVV8WFd4Q2JHjf5W2MGxxr//JsiYnbWD
X-Gm-Gg: AZFdTZd5PL/4u0j77TwgIImNbck8276yTnSJnlO4/IEglBefAm9bEywxhV1KJc2sVIJ
	Wj3fDWp56p7MH7fGlnxwlT2EXg0FYDlA9dQpIyw+PysW99lh094YJp7xZpnMGeUqd3IGkzWFUDl
	FszQqqRvm3yNNhzXF7rFMhRsSYDYzZkSbs5vkHckNnpeL4gW+/CM8wafqQ7oK1RyF8P82DP7jPY
	os0tSq6nIOGlX0k0hE8HTb193rGChDHf2Oob14BpoQoqkKU7qYN1oBYkB2Hb9U/s6K/WmXn2PFJ
	y8AKhUeqU0pXk4XbaYOWtt39mPW6x1uOhc1u4sPJfXcIdffVi/ymS2QHnbLAYBAUSVx64cnnXSB
	mw4LtLIVwUBlhvlTuDG5nHPpOLaHf2SzX6tpvZZQOSDsxF4JE/YlHCiG3oujLue5gIIIfeOelbr
	46jVc9sj5XD9veBbFbsPAo4G9u4R6iklPjd7285avQfWXupD693beFgYo9YANjuSf1tDgVYI5LK
	eZA1yjl1JdGZs+GiTIVqO0jpJ2tssAroZm+HptZzj86OO0DPcsrEDuWB1RR48t2QPFauQuMRdpn
	4MfFT3QVeq2XHPslhqllxN9jzrq0qxVFKm2OACnhJHlPQhxeyqaI4AQNnMM2vZghabWPaiNIYUz
	UGi1C07V6mS9uMr6A/RSRAvzuL4RHG+VvymMu0zOxQbCZQZ4QnN+fX2q9SflVOP3i5XXzOPxuOh
	njhuzHqvsxzfX+86OyKQ==
X-Received: by 2002:a05:690c:d8b:b0:8b4:c71b:e4f6 with SMTP id 00721157ae682-8b4c71beb96mr41119167b3.3.1794884355050;
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm14326407b3.41.2026.11.16.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:14 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:09 -0500
Subject: [PATCH v2 2/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
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
Message-Id: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hvA3Q0T5bLITKm5NNV73hsX++cwWKaI8fp/0V4p4/zI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oj9XQ74+/CihkSieIccSG7w9892PD6MkvjTeNKi
 YOFRwQ6Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYagUeMDEuz09/9+X
 pB71uTU+2kCX/L1SZucD1dOfu4QsF/BWlOFS5Ghk5no+WK+95mGB753qu6xiVYyy2bN3Mp63RmK
 es7zFUyjAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 85f7a56816ce..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -37,7 +37,6 @@ marvel_env_state(u16 state)
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1

