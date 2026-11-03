Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681241;
	b=B7Cmg5r2OffGpGGeteU/lyGLhTDhKp3W7HoclvfHo/l1aKCQppC7OVEQKMBtrGzDo7at
	 FM/7i2XGodgg/9mOWFJXrZ1hrIRKE0STiJc7QC/15H2w9ZQeNY+x+lEqI6ncyN2LYj9DL
	 xq18B8z0bBX7XDWXzwLRFbi68hdxWfTEaH4QLiLsY0FnFtGlSAtQlEeEz3mKhtS5ynHtU
	 un9gRfnj7T4wHNyD10OLiVHBiccXrOPV76zX1LSkBLhm3j5jRA5W1wPkq6MqyDU6+HehL
	 quPkTqOPeE933HcWovWWOR2cjoNKL896i6smu4gjvzOuFPdQKYzaafJVRmDU4Z5VlBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
	b=AjD942FVT29H2u82+/mJy7YtWkfxXUeKETRHBSdZ1eWKrCn/yhDMQ+MrRaUZZScAiX3p
	 P3xLpgj9g19zT+Qte2Xhe3T3BenjkqWfU/cKTXf3/Yv6umn72t8meZA6qC2pCZTMyfuht
	 c27fp/4TU7RUPOzmt/ELusnIY4a2ykrRrE/wZPj00QhCq8p9t6ShiqWNswYhE5gM+y02+
	 HGPz863yQNFW2bV4uRYgK9MGQ+LhZBQ8y+wLYME50gH4QfFRveJmptcYCWsq7YusXASPS
	 nVKhl/qpd04BAUR0FhyKjpJ7DylEcCW3I27gHk/88eTUGdjtayh76abMSe0dDR3z5ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLyOL2ak;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3856606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3856606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BLyOL2ak
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4758548eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681240; x=1794286040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=BLyOL2akmOTFNSCdFt2TJihyuR8nNZwfQuESuFgWbuAgMUuvrANLqHuSpzqi28d1dw
         WBsHRVCYzUajzoUCBjlAyxJ2u8g0Nh7eH1ajCXjzrKko4QDRqabNi+YuJSsaQJ6nng0e
         ALTtcJZ38f64xTVGPvjvrAx1AzwhtxunjQgZ4Oo2rPePLSXoLW0O9DOQ/8bLqE7wFmQA
         q0kODqjGhtsAAS4zPoPz2si4UkgAq4VJbalv07Gf36GOt3Z6o+fhpTiQHwtHm4dFnKqT
         RUyoWy6TSfXA7oUCT+hL44yGAyEhxhagjr9YqEAoKH1ZPJ9a8xAhmaCg7ESvJ6oN+/YA
         DZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681240; x=1794286040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dza2NSY0k37SStuTd0HKpba9S7dkkdTFtyMIItC7+7Y=;
        b=GbzhwlRNPZ3l12ZOlf5M+Who2krmtxlPBKgsV2kZkyqjiWeLCb7CLfXCnsL0lrejsu
         aF+XDPG7LBnUCew3pIVzgYecaawh5tETL89gNUtkmMNeWQa8HLsYCLE/GrY6qLX+FyM/
         qQfiWHOMa7ZavStoZtD/4RhXuECpVEkfgkWk6nau9gC1mh4Emzmz6JIzoSzPkDUjgKMb
         9iCLmcQOOO+xiNIRYr4UE6pdoVeMXpW+NqjdiigLQ6mlIzfT/Cu/zyP6MTIVsOiFivpP
         JvcK0zkAsTiRezICe2uIUUR+DVbuxLZhtpH+IxlDBjxQ/GYDPJCVfw59bCIiQXjiqhpW
         AqgA==
X-Forwarded-Encrypted: i=1; AKwUvBxmc2LYzkL5ggbcmTFZ3s4opnsr3y50FjQwvKiJ35KHuXOrH2Kr7FiD9oBAgfInuaFoc6VkNId/EXNVyXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h8Ike64+Hy3iqEQ2NbHQbPDZ0/+boJaCOHgcX4NxV3QrVKeno
	jIovSGkVrGP9z+ZnrxLMOKh7jawPfuFeHZxvsDjeZdXA/WV+4tTA4jpI
X-Gm-Gg: AYBFou3v6Vr1Df6AvZVr2tOAXGaZv0lBrEb0O3k1SQuThUtZDr5E7kiAYJlrcSpIVxQ
	0iXbn/Gg+it1zwqDWzUcww/LMUX59CIwOD4kI51PWFR/fHNHTwQySnsFVXjxeRDHRX268OxFjr6
	NXLmWN8CtA2deFiIWq4V9DMj3nKe6+P9hpRZsZQi3aZQS/HH+8iqLgp/mH5rtZDjqUGM4P9f3yH
	MY4j9UBG+IsnJZmHi1ldQbUqICrIUmRL75yKjtTQSGrifd+VnrtqSjgIexYGDJ2DCCKxcD2+GEv
	gY12cNr/SIb+KK8pkSHK7AyyCSNz1vvtBMwOerkW9fVKfRuNBJkrTitbCJovYZTGDypYTc2jP+v
	I+4SMUL/3A3XPmXI2Jsfsu11sEcYnwFMC0jT+/LdWO1CxShRnvaRRUEMedeNI4fNMeU3Lz0f3n9
	5oRT8Ek6bWYmAPo8havgSkLl8gFteHXV5jqkIvAT7dFC+ZZG0MqOyJKCJeyxzryI7r9wVzVjGhc
	VvuxGz3HxNhuF67q/hNUBZUfQk9Zu3FTsPDB+8/1r5wxFJzAwR5g2ekyJn1nTR8gLgOw6aWEMKY
	NfShFidIAR6WP1fkg9HaE57SHjPGDeAKDMaPcxiATkGsukG7WrFrpBio6dc/Mi1IbCOkhf+963k
	T3nHLeqZnrDj+3JgDrZ3eF/KS4bgU0Hj4pNBmlA==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr19587443eec.29.1793681239614;
        Mon, 02 Nov 2026 20:47:19 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:18 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Input: apple_z2 - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:07 -0800
Message-ID: <20261103044708.2461481-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
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

apple_z2_probe() currently sets the default 100 units/mm resolution on
ABS_MT_POSITION_X and ABS_MT_POSITION_Y after calling
touchscreen_parse_properties(). This unconditionally overwrites any axis
resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
omitted, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/apple_z2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
index 271ababf0ad5..e7863f8f1d5a 100644
--- a/drivers/input/touchscreen/apple_z2.c
+++ b/drivers/input/touchscreen/apple_z2.c
@@ -397,9 +397,9 @@ static int apple_z2_probe(struct spi_device *spi)
 	/* Allocate the axes before setting from DT */
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
-	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
 	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
+	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
 	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
-- 
2.56.0.385.gac671c819a-goog

