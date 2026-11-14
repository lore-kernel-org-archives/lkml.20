Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637233;
	b=wozgpwAL7EcWLZLt7zVo2yVX4JPIj36NL9djKDZZMYqByHwAprr508XbxoaBFdUDSOym
	 hb5IthkDVPRVIZrJTrpMnXVQzNV3jk0+zrrXXtg4/NJL5lXLljj5zTxwlkoSIEWaSR20i
	 ssW4RqYYSCNnwLVD4/v9i/otvsOzTznEdNLg5Lit9SMoa2L5s2MDDETJse9Lu0D9vHrXm
	 baEyzWxpM/eh9CSfopNiATay0Wk6oVSeCxFaJF1p+qVX1AmBUguVI4Rhrq0baPf/zfw7S
	 AlKgYvo2VdF6uJWgIRR+lXlmcFQkUFy1Hc6LByUTj8fvjzpE43I9fvOChQS7CIYvwLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
	b=IkhOkh5/GFWSwsNrU8CwcqNAH53qsGZlTTdtF7EIDe0gGBPjG7hPqAmTWO+9XBKE3gzo
	 kH5dyVY88q9TNGTa5FKdGAqb24njQdZY/Pk5p5CoDZvzumvsk3LdZ/1yjqZ1L+mBUQsKk
	 fUsODAx01yhi7/EEeMee1n1YEyfEhf9pH/TMWArM1d+Asfb2PuP4fFjZI3xV9ZfYAJriQ
	 YRH2BZrl14cbEvfylw0jaOaE0EfNEUuOWqhnGIuxU0pNr6RBLCNgmMlAlcuDkZVPo75Ob
	 QP8ugZY9voayKmXSy7FVQzEBZ4J+qROnbpMWN5KcrZEZuEDvdCout3w5ZyKvtj8UXfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+MJVgc;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E8606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16E8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+MJVgc
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so2366132c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637232; x=1795242032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
        b=e1+MJVgcRc9Epn35HjhtJxhkjV9XWXESgdOr4r+JvaZ1VT5sXq6aP8SQ6WfLUxosjh
         btQc08dVr1WGAtAJqqK3VRnxCNTYH+D7TjWDJKbLr746qe8wk0iiT4wKfhmyJtJcZgsc
         dKF0prJ7NHh6Y6i5IIHolUHJ1Js0+2qrsPtY22Dnnck08up6vrJE68EscS3lemBr6Z9e
         FzWbCpg2Cdo2zsnWBZDytlULbKQ5WMSGxCUDnp5CZsGIws7Xl2+ixIZZpjgg8EnkHuzd
         w+Xtx0aAE356eayWbP687DR3gC2a9Rk/oKaiLc35ZArN5EhpE1u6AQ8vUBqc8q6jUe/K
         tz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637232; x=1795242032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
        b=jtYyYGERlWWtfOYwp+c+UIelmSyc4FcoLMTo3lMnxpwc0QZFU5TwSIwNh/35lnpoLq
         575ekrdymaGFmDWOuyvuKbCRvp24MzxO1OfoQ2BhhcZb74M7QsNfxs7qwf27jbk9HMik
         vt5HiiFzge+1+RPGmBNdiasYNH1/gDFpc4qkyyWr+RM1e7JTpsul0Kbd4oBzCoDe+SuC
         GygG7QuCaSfSScLisNb/fMrKrOt6BIsr4hO9wQerFTI/CbWFB/DArm9n4kQjaA7Dl/NM
         ciWn5YY8t7DpLQQ8SEBPU8+ax11FFY9dxooLMV8PYkXzJIlHmuGgXbg2fSTVB0FxhKEr
         VGzw==
X-Forwarded-Encrypted: i=1; AL+hErGGzcOYqs9kcnT/NBTSgrUMXLbbcoJx9P3xV1az8ABE5PCtOIu0+QB0dhS/flUMvkEx2uR7fOjo0tY2kxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xNKCpm7DC+chvdhm80xbxKQoIn9hRqvW9718Za74jCostS3kO
	dtYE0cCdEuJXrwXMrIfnUEDuPmYxtSK1zO7Xc9rnj4rdqzNUcNpSZW6YLdi3AQ==
X-Gm-Gg: AYBFou0mURfChGlxCUA5AdXolZEDTsKkf7Ua7Jv57sHOtRrdudw7uwWbhG4a1z3bhgs
	xMOBuAp08ZdngyVnCFwHUnafjtg+OIe/KOeFq7RnlQMbSHl+12/gYpOIxEZSaSuCleGSZEJ/4gX
	jchIr+6b8QM51IravmdZ3vM9K3cPmrWp2Vh9lze/xNg5cZcRjjRybjzHom1uGsuQv1H0e/aHDtf
	5geZN+cyvtRDcU2JoSns9PwpKjrPEVu4XpeaUbIn42U5EtU02gNkK/RA3Ghscb89D3Mdk3h9ub9
	JbV0Tf+pL89ibsa7eB+VmzVPq0ysKNYx9+gBThVJ4MlbZ9P91MHE8y4swpZOLhg0xBHTVFmmo/k
	JM8MYpdlNIMD8cBTKBUlBN3I23qbuMhF2kNzB6g/nydI5Gz87W2jnoUmxwez8gXRiLU0gNu0xlg
	wp6iZHRgkjbdjjD5nQjCVdRngo4iCnzE5z658AmP/EmF4KhMvdtjS8R3sl6hr+lqotid8DutO9c
	Lif1yAenDRMWFrfOuXylQKkJco6tFPC54y7Ze6UCwhyYsiQLXPjoc8ljcwpUxMp/a8qbx0POKd+
	thIyi7fPHyxHyO0MZjNdOCkdSfqmLoeK9BsDeC4uU4lFJ/JHgmoU9YnWg2UWpKScgR77Vgf7d5J
	j5i2WCJ672vhZEXTsBB5WEaGX+jdUIYOLNLrq8kcdTqfi1QTUB5pafGrEi7ocL+DDzT9BEC0t+u
	4NmYoOGORRWfqAu2eX4NyHiYk=
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b503112a76mr4605504c88.12.1794637231910;
        Fri, 13 Nov 2026 22:20:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (dell-smm) Clamp the pwm value before scaling it
Date: Fri, 13 Nov 2026 22:20:22 -0800
Message-ID: <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

dell_smm_write() scales the value written to pwmN with

	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)

before clamping the result to the valid fan states. The rounding adds
i8k_pwm_mult / 2 to val first, which overflows for values near
LONG_MAX and wraps to a large negative number. That is then clamped to
0, so writing a huge value turns the fan off instead of running it at
the highest speed. With the default fan_max of 2, writing any value
from LONG_MAX - 63 up to LONG_MAX selects fan state 0.

Clamp val to the pwm range of 0 to 255 first.

Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843faa..e8b4e8a29e8b 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1030,6 +1030,7 @@ static int dell_smm_write(struct device *dev, enum hwmon_sensor_types type, u32
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
+			val = clamp_val(val, 0, 255);
 			pwm = clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0,
 					data->i8k_fan_max);
 
-- 
2.56.0

