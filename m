Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567970;
	b=fEVuSuciMq3bzjYFkor0qy5ZxVJCohHcAzzCIrYzNrXNIuAPvgdf60LZT9E3RTT9FRp4
	 xuP8rtsKm6yIED8u9ppxMJAIbzyxxhzRycUmXC8YcR7ek6XgarV3Jtbg1f9BM6hjhULLN
	 63nINHcN7t1ydpcyf858koQcmbJXD/v8ONXDnma9sDqbJaz90JylBuHwNgmjkRDHIfSJT
	 I8Bm0ijYaui5Lq+MlDaAdLKPG6HTgysHXXo5Kr3ZpMFwiN56kGk5GISYNOfgeakesstBp
	 J3301yyPb3vdRwcvRB5EIGxqJ5aGr2Z9u43jYx/bgLCyHFia+0BOhhJ9vbEXBdVON7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
	b=XPI3yFqfIptHGZtbrQ2uCXixOmszsCWCR7Yol96mWBeeDSQWSNOhN3FVZ2BReGK1Ss6u
	 X5//eJu6HRy9CeYrZQN1kZij8Q5HjJo1Lv/kOYnlxoR8PaCgwGquYS7u2xxnELjKou32W
	 2MurikGOJNDpGqJmzYjKEeeiXppJPVqMlcLouRgVkWuDWYenLSw2HLV06nhQbN0atymd4
	 fePA/YLEzxrbqeEpqcXaMY0GAiUiZzGqJQi7XEsf1xOQKKEsf8SyRqutcKmdI4LQNrfdo
	 IJT+JJaowidtOU1Wl5Gh9cspcxAd+8ExO5AjYMNZjDUdEd6OcgB0O+QQ21qNFEM08Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6C60A6F6A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A6C60A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K2jjVEB1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so3121045e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567968; x=1795172768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=K2jjVEB1mLJWjhTJpRB9psU19OPXBvnrKk5tE2lHWk07SqGFTGSWLuQDjNHgFC2o4H
         MSCmk2xHHOTTNcoXvRE8ji59y0bIPLjAR4m+woKr0THxz/JPrlxNgM3IRepJ4P904xCX
         9GdQT/Abq6hm1DkZc6VlrWXJYxQ3bnm6en2Gr5lQSi9j6s0K1Wbj2/B55OMWhs6MNKoV
         ZQy2M2mn83GnUjPD0TE7iBP1wQ1mnoLWlS78X2JU1CFTWQOwu3kN5FChNzifj3g7M+DB
         /sRLN1LU80u682yDaomImL82RdSPepEHe0Jwcm5glOp8PvmdehDBYBmHOn4If9troQfZ
         oRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567968; x=1795172768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=teRGzhM28TxtybZMIK8blfwTtPC/WbwQiaC+ARqgiLw=;
        b=rp2ho9YWTXzDeDsVKh0iF2aKTCIvEU3GKd7U+EKWrMmJ0AgkCFlOQtFIhkNZfIjl80
         2cvPSqMyL6gMkqBJGnwn0Io45/fU1L4m9jsMnwqgL9cuSkOE7TVXrUenZYbAyWZy1HrV
         h3wOXnqQRo4yQAx1GQyXvcD6W3goBUed2avLGtfcmgBeB6bXOQMm3SIY7mj1cL7o+eD+
         virxyQ4jrifdRQULQFOshoZvYpYs6OXhlw1oKkA+9u1bce5cVtCTSHe7ZrXt/U8zvGtW
         4iNodz3Ty4ackRkD+pCyJB7JfS5V/dZ+ej8XGEy/WAsJ3od6Py74bQ37dDpDzq9ZOKGg
         yI9Q==
X-Forwarded-Encrypted: i=1; AL+hErHgGBLHtIM++iDJBTEuWI9YSRG5/SWlgUkaq41himvsr1zj9WRoseRfotz/WrkhcSoqx9HM3wgspfKC5g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kyl2e7K7fdgD+LtRkK/LPF8e8GWRRgaRVoN7CvKgaCUQLEJRP
	HDT4cYA0SLJAf7nDT0ZndyPs3Lm8w8rIA7zdvAVeT1XEQbefcZ6ofLBLxxOPTo/NYdQ=
X-Gm-Gg: AYBFou2PUCWBeHuisH6AFdPugLkm31FoIgvrjGffaZ9O44gTJdZYXbp1i+lEqSp06GG
	2hNdwEgAQkUrJNWC/jGZU8l2uw1lHpNiwhJVi+IAFGewBR8wPB8bJ/+2pENfdYjAwLDoJe1aSfs
	yMWiKdm2o3W9zt/4KMeUYvXkfequg0r46/vDqlftyl8MU71CiID23tqpM1/R5Re8nMXcEsgDwCa
	aIB1Cqrn5xpZ0uHc9s8e1AC9AM5UZpe3IFijOPluWfp2GMHEySYNouU1g9hPTUjmKdB4+TtgvfO
	qaQn8pWIY5KnSd2d8HlPTRogYMLQ7vcdVOQ4a6C9za6TSVvpUBHrjKV3hvgM9ovChzwPY8YnS2F
	Y78wPCyGm9X+0HvXvGalncUap2hBRIS/7b89CPX+epp/+g3vSNhrnW21UR4Q58X4zRwuwuZIkuo
	tsfB4v9me4QtiXTK7tM3WisRf1YMz1KJbieaXqchdFUTvf3GRi0cPlsCCdDijPUBHz4e7aiAdnx
	HS/yNo/u8Wv5jQVFxqHhe2Azr5iLJz/qMjBjxVma3jhS2VLBHvrr6wbda7tOTgH4J1xYkBXt/ZF
	myxr8OfrkYhO1x40EM/YrrMToztYFSeFUeaKjJsMD0OKQgK2x8Mk
X-Received: by 2002:a05:600c:8b16:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb5d382639mr6172105e9.12.1794567968130;
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56fa1062sm29897185e9.5.2026.11.13.03.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:07 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:33 +0100
Subject: [PATCH v2 07/11] pinctrl: scmi: give no groups to pin-only
 functions
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-7-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index b088a24e4ec0..af9c9575d4f0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -450,13 +451,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.1

