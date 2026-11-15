Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755286;
	b=JT2AqtbZ0FfpDBb29Lqe5iHiS+hDpq6vQkzo8UZE9NXT/RjeU4GPKBSdvEVijWwaE90B
	 S1XGmfIGHoFYwJhyTRso44tXddL0KSeYm+81XAIKisGYwiS9vg5JBNS0kGupeY6U4bgcJ
	 Ywdy4feTMvpC+6MpDraVL22tF5Ek7oxy6hJ0LeDJ1QPe7BfY5C+t+m1uh3ScGWjLTDKTj
	 yowjJqpKAMIPpoHgPV93dPfpXjEwm57E1m88R2onq4oqSijOqzzuiL2PMjindXfI2qeMB
	 dmDxNvmO+iNbAzUDbZyRgqiXGYNFAqP5dKv26EmEiuwPKPORAsO47b8XniSRuHdFEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0ZQuGT0im7n8F29GUUyi1mPO5kAZaSOL4tJv1t7/jiE=;
	b=KZZESkFiinyE+BGA9UIpXJlcnO81odYS+hm82rp3oprR5gg2jLsoi8gtbA4JfTvRhwMR
	 2WI+quQ/3GmnITDMq8Q8PG5SgHIpJHitn6IGHpk0sh67JKjRmwjQ2jLQdMD9GjEmXgxZq
	 29J19W1dDi9HGqBaJCG+ARa5T4isIKLBXBwn5A4MHs7M5A8dwR8O4tJkkPV2v/UdivK0d
	 T25F4wXAPuJBLgkaBXU2waisRMZmJSRQfqFhoI9puNcnG7l47/Y/eX8AfgtX17d668XGW
	 8sX7oNl2pXCWYgrEBYcnQF8PijjmMwI18yXnoLdmPYGzaqJFS0YhK/UVHtxgU1Y/6PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxxk6JFq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxxk6JFq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2892775e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755284; x=1795360084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZQuGT0im7n8F29GUUyi1mPO5kAZaSOL4tJv1t7/jiE=;
        b=xxxk6JFqFkdW/ODdd03+LLYH0l2Y6bm0CNAeGgJaWQpAkMrRfo4r6XLB5paNeoVwa9
         IpL3a0OVGnBgdcLlVC34fCeI/srAiwXRlMEC15HTmwSvoudiZ4W2IX1czwH+sYDw3bAH
         Fmwzqk0MdlnV3kJ9eBUVsoH+ofgKOUf1BOkMvg/en8eQEbMJGPYiTG2B1IfGfVPyXrSy
         bO1bmj3912FM0jSix5iQ4v1+v0X06SP+1xk0zg9OUgvUlLyGkLPJ2KfNaLQ/UeqjvDlE
         z3b3h7BYbbZyPAuTLsWFK4FWyN4wUlF8koLN/rtDz9IgaTg6RZYeZ4sXNVyNfdC0BIL/
         rhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755284; x=1795360084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZQuGT0im7n8F29GUUyi1mPO5kAZaSOL4tJv1t7/jiE=;
        b=OHJk04IoXi4H2XIaM4FKZGxBNh+Spv10qHAFOsMLw0AdZ3qDqKDUSQqxtK6cRfJUZo
         A2VUqmyYVJ3+fGmACBRPtv4wvgIhov+XwqwJXS5pUb6fjpICubNZepSYJv1rLuWlwr9q
         /O4q6jHn/A4hFbh7REFRkd9PAnve3JBuZ7bBmkQBCYGbJUTf2czB8FajfHh+bhdOsMpm
         Rwi5ru/NRdv2gP4Qdq+4Mh0KX2KnGY8dUPnubttGnmtRzCZ5cbjpo3Kx391x+v2VCY9K
         j56Ov8XOkw+CPsnaUKeKBlu3rmmBM1/k1yQfpQjCQIyb0OrZkvpfb+eX2+oK5iT5eNzd
         4PMg==
X-Gm-Message-State: APuU4Z/qh0Q7qPv8YQYhaLVVq3UmjXPiC46dMTewrsfBVC6ZK23PlR3u
	QoYWTGv9IoIPrWsNrdyAN+A9ZnMghLHJ3uaOmUZfdA+ozXx3AGRFLr1R
X-Gm-Gg: AYBFou1pTNm4Rez5jM1D/SaF/CLUjvUtiZEZNmSzjD0bNLoHJQrfDnuse374U3q2UHe
	ZQhdT9QaDdua7nA2IGNYgp8SdEDr80e/M/T2vpgbEzc6Id1p0Mdkhq4eyZIINOt6xGMQDpPIfaI
	jB9vZ1/qSHAETtK4IZxdBXssQAhFgmNyYx5+NBwkcxuxKz4yMY0uWyLGciyF+qC/WHHtADGhWkp
	InWo4lxZCHxx8pOEMkA/KwUSU9FTC4chFZSZ1o1NDy4qYQ0dt7L7NZa9/x2MSQZyw1JIcijTX4Y
	mbAYE8C+5aLp8VJIpHM5uxr7ZOgZ6G+Kmq9MLQ7DSsmBKRbmCgtv5MyuZasCAukOxBkhDx2u8ea
	AzWjhrjobjcJCqRADAbsbOpkGQZEvdMj+nhHEndr1IJq63PH1sEPqIIDG3ZeTpAi8pzgvQSr/3+
	R6/H5qjQXPc45Ary+Ktw2Qz9wsGAjYaQr1LdUmV5CBzTpq22ZP/0MF3zcPEgVAmZQKZTCG7Wt5d
	K1pJYlyc07ZDArH9KWXRoF2ikDq2REj1hQL7rcHXf9j0uylUstcasNtaMbAYpOsJ6O0J0XV13Q5
	7W1KHdSjk79fIHA4eIJXKcdin1bA3tnqXLH07/o0n6V6GKbUdKiLkTdA8UohfvpdEPyY9feEaet
	824dDTBjtxAfICpfRRtfvI7ijyWq0j60XU5+5QzBA6GvUJVOB7TKFHjKhNZqBWIk/XHF7XEamPX
	pG3d5Wwz072j514ybt7YPudo537C4JlOZgzlUMJlfTJVus/qYp05UzBKcm/PKLuRdYTECjjaFVd
	AeE2STJ85JpBg==
X-Received: by 2002:a05:600c:c167:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb6a75defamr34360765e9.8.1794755283808;
        Sun, 15 Nov 2026 07:08:03 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm14092374f8f.20.2026.11.15.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:08:02 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] regulator: axp20x: AXP313A: set ramp_delay
Date: Sun, 15 Nov 2026 16:07:58 +0100
Message-ID: <20261115150758.16650-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The AXP313A DCDC outputs need time to reach a new voltage, but the
driver reports no ramp delay. cpufreq thus raises the CPU clock before
the higher voltage is reached, which causes oopses and hangs within
minutes of DVFS activity on H616 boards like the Orange Pi Zero3.

The datasheet doesn't specify the slew rate. The vendor device trees
wait 25 us per 10 mV step, so set a ramp delay of 400 uV/us for all
three DCDCs.

Fixes: 60fd7eb89670 ("regulator: axp20x: Add support for AXP313a variant")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/regulator/axp20x-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index ec6ec071ffde..bad114c03ed4 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -744,18 +744,18 @@ static const struct linear_range axp313a_dcdc3_ranges[] = {
 };
 
 static const struct regulator_desc axp313a_regulators[] = {
-	AXP_DESC_RANGES(AXP313A, DCDC1, "dcdc1", "vin1",
+	AXP_DESC_RANGES_DELAY(AXP313A, DCDC1, "dcdc1", "vin1",
 			axp313a_dcdc1_ranges, AXP313A_DCDC1_NUM_VOLTAGES,
 			AXP313A_DCDC1_CONTROL, AXP313A_DCDC_V_OUT_MASK,
-			AXP313A_OUTPUT_CONTROL, BIT(0)),
-	AXP_DESC_RANGES(AXP313A, DCDC2, "dcdc2", "vin2",
+			AXP313A_OUTPUT_CONTROL, BIT(0), 400),
+	AXP_DESC_RANGES_DELAY(AXP313A, DCDC2, "dcdc2", "vin2",
 			axp313a_dcdc2_ranges, AXP313A_DCDC23_NUM_VOLTAGES,
 			AXP313A_DCDC2_CONTROL, AXP313A_DCDC_V_OUT_MASK,
-			AXP313A_OUTPUT_CONTROL, BIT(1)),
-	AXP_DESC_RANGES(AXP313A, DCDC3, "dcdc3", "vin3",
+			AXP313A_OUTPUT_CONTROL, BIT(1), 400),
+	AXP_DESC_RANGES_DELAY(AXP313A, DCDC3, "dcdc3", "vin3",
 			axp313a_dcdc3_ranges, AXP313A_DCDC23_NUM_VOLTAGES,
 			AXP313A_DCDC3_CONTROL, AXP313A_DCDC_V_OUT_MASK,
-			AXP313A_OUTPUT_CONTROL, BIT(2)),
+			AXP313A_OUTPUT_CONTROL, BIT(2), 400),
 	AXP_DESC(AXP313A, ALDO1, "aldo1", "vin1", 500, 3500, 100,
 		 AXP313A_ALDO1_CONTROL, AXP313A_LDO_V_OUT_MASK,
 		 AXP313A_OUTPUT_CONTROL, BIT(3)),

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

