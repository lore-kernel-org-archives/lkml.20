Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794199367;
	b=seEGT78tZ97HhEmi3sY5nU48Yblz9ffpsfa72xRB7obIwNDj9FMpx6XSsqV6mgcI/yHc
	 0z6Q7w+lW8Ak4qLvbRnwk92j5OQWSFMyXU9hX9eOxphMJudfeV/Y51qk4oseE/Ne+Om6K
	 o0AWXqcO8ghNFK8ktbMsBKeTVYPrLuPFt0bOcbDfE+PEP3aP/ZUqIAqeyrBPf6qOOTIm6
	 9OukenWN0yrI2ixI7Iryo3D6S/fE21/fspo3SHG0m9mCxt5+SLluyMc0T2cQhBznx1hnm
	 6Hdg0LguiqXO4tUOgYPkGizOgkqUmen95W66CzEstoq4CRms084U1x3TQdgkp9oBRng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=;
	b=awp46IUPetacNbLw2SgNwNcTCJVMTfwGnOfvLkX5Tp0B80Oa+GFya0FsfTHxfYG9vmiq
	 W5tbK5rS5jU7u8rIBAbDs8GvEftVCWtcXw0VdaapWwI751Jj0njAWOcWufoJHzUZi6ujH
	 ASQ/LbJhti2CyO9hDeXzEqW9fiSLul7yMUrxCWw4s8XRZep75y7+ex9h0Tw88MoNUwmDP
	 yECY5ElcPU3e4JTFMVfL17yNYrYZNDg5ofUhyEHlwDPATMyLOuSAwAG0DfR9I3S9tbkRO
	 u0Qs0joB/HZ/coMe9BAIjODCeoXETb7GWCXU6ekjZYdVY9OtnZCbh4KaZziaXr3kF/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aFn5/jAp";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CA5606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CA5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFn5/jAp
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso701957eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199366; x=1794804166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=;
        b=aFn5/jAp5/goiBRVghRUHFdJZk1JQT8b9Cf95Pg++7PNnY69wXy3Q1A9iJcXCs8u6L
         qAGQ+TuTq7SmGvbz18K6y0tH3SGtviISG8F9JB7+Ty713HKQU9468NQlKUkI5m7VPbV0
         ziVWxVwpunNz1y8joLB0gHSgFGoJ7ALKA0vzYn3fFg7X8KglQNDV63kdby5pEUc0kdBF
         y3GiDwYIvUrsZgxICqeAs4xj87CCfCyA0av8vGdo6DGfQeAYdSRq0vgt0pjDDv238C4F
         pO5zgDAsntuYNM82nLMGPWanRHIdn+j5rrBYt4CqWV/NOj/w2u5BLY8XSMhYQNaIvz+Z
         2cNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199366; x=1794804166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=shxUqKnWZYz/K/hcqwVzW+1VupY1njR3r4UW+YRvWGE=;
        b=Gn7KwuwNpSl9NmNp+SVVftcd9M2DCRcfjuwFAP3fyyLB8W/aAkWGvjBzuV4fptut/w
         YtsWG2p4obAy7R2x9MayZ9SJnJR1TbTgx3gCf/guG83th222gI6+43Heji2qZ/hea/xs
         kvwapQyjUhbEO+powc6ivAQTpbJXnXjDsTyDPEM/tBVUncpPw0lmVedNf6A/3Y+gKIwm
         sJ8re9/7imM/r+rhaFoC7tEAKyNmqXCR5sylfDNHEXCiE6m0oEZ9BF7F6IO4PjSD/s/u
         Yn83VTtJEhZouvUl6giA9btIt92LTIK0w1Cxg8BZ9CsWIKdosYztWf3yn/uDjQmjDLFQ
         uK0Q==
X-Forwarded-Encrypted: i=1; AL+hErEnFgmtDUbmYHYA4aI9rr/bK9dq94sEjsHtqMQmUJSFL/yyWE68UoviY/dOrpBoghI4OTYIDt6+CZPG92E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x981u0/xZsb+3A3qufy0ut7ZZlsYZK1bBAqxbvqr1yWjkTnff
	LYlLbNkfYwvr4YHNotfbw+FhmLuaJYjhKb7HSuuYnkUR+0p0/rvOitqG
X-Gm-Gg: AYBFou2XlWc1zz7IYAVr2iL5IPxQYvZzn9shKdNwar/NDvLQNesjctmUBFtEyPQ0Tay
	fYi5szb/TsEM0ClptVO08Dw7L2p4mUWbrYz46op2BQOQSmZNtmYB/i5bS/hXSzBT97FYv3IZ89I
	K2vBiJC5qIdRW6FzLlIl/CCKlKn4Lsz1zVSjOFeVisMMaNI63TAUJClPIVYK6d3B+ttDrtDjhHB
	GRvsZqUqiNLo98gl2Ar4WNesqvgY2XH27vvp7FPQ8TrYqRB5Cy0xZlK5dX1ePomz2C/m6jgV7ov
	MZCKUqLNeIQ4gGvm2Si6/QAtS94stz7V3AvlabuQ9mV60PiyYW3D/aTHYGBj8kuV9lFa7xK6KxW
	WY4TtK+qJewjSH5dw2+qdROtEewgy8WTFW51nmqCqDVfrjPIX7gi64KfAIli5kQay33YhTVu4u0
	K3gTDnp7BXXF+sx7JDWfAQCyb8hVMZomjkbnZeJAEB2pESEqtXqaTUyUd8Y7RAnjYOSqbN90C43
	A/Vw0w5d8l/XKljfj/w4yXvWFo+02PPFrOcCenCJmv6aDIM2FenaYsoLfjLRzkoHT4uR/Jz78Ek
	3Mp3t+KjnBvgZX8cNbAProlYYUgADqvyYv96HnDaJV0ZnWFJ/NzYQ4nRPDQYoWoOvZL05Q==
X-Received: by 2002:a05:7300:f14a:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-37256aefa73mr5940591eec.41.1794199365785;
        Sun, 08 Nov 2026 20:42:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:45 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] power: supply: axp20x_usb_power: drain vbus_detect work before unregistering the supply
Date: Mon,  9 Nov 2026 13:42:11 +0900
Message-ID: <20261109044212.1157357-3-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109044212.1157357-1-hj351016@gmail.com>
References: <20261109044212.1157357-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

axp20x_usb_power_probe() registers the vbus_detect poll work for devm
cancellation before devm_power_supply_register(). devres unwinds in
reverse, so on unbind the power supply is freed first and the work
cancelled last. The handler calls power_supply_changed(power->supply) and
re-queues itself (and is also queued from the USB power IRQ), so an
instance running in that window dereferences the freed supply.

Register the work cancellation after the power supply, matching the
"request irqs after registering" ordering already used below.

Fixes: 6d0c5de2fd84 ("power: supply: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index 7625366104bc..f6a7dcbd5a01 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -979,11 +979,6 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
-					   axp_data->axp20x_read_vbus);
-	if (ret)
-		return ret;
-
 	if (power->vbus_mon_bit) {
 		/* Enable vbus valid checking */
 		ret = regmap_field_write(power->vbus_mon_bit, 1);
@@ -1018,6 +1013,11 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(power->supply),
 				     "Failed to register power supply\n");
 
+	ret = devm_delayed_work_autocancel(dev, &power->vbus_detect,
+					   axp_data->axp20x_read_vbus);
+	if (ret)
+		return ret;
+
 	/* Request irqs after registering, as irqs may trigger immediately */
 	for (i = 0; i < axp_data->num_irq_names; i++) {
 		irq = platform_get_irq_byname(pdev, axp_data->irq_names[i]);
-- 
2.43.0

