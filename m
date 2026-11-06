Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793978061;
	b=q1WefHx7Wd1vQ1iL3oLE/qUHmdPUUpiDLccAxWRkCGCvuiGjwbR2S5tpSkGukD3gNMx9
	 fAxIhDa6+lVE+pdzzrutbXoG2XUaoyhXDpYyVpQGL9sx3wVnK17Y03iTZrZYjUAYAuZYl
	 tlSTWS33cMJbMACjwVO52kAnsUuoZxJv7C1VssbdJSPBIw98DWRrtNNkzq4dGRSvs3ytD
	 E4Uy9UrE5cxZY4dlo4Usm+ulGi5f/Kc+0Vih8V0pFJo/pO6yUE+XfMiwaDc8ZV7gdJ5Rj
	 ANeuO2zt6nwaxFXJR2YXJeeai81J0yyAusToQQiNt2Nh/WC1cZwH98SGmwhUbJQMyjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978061;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MU0JYvA8sDMKbF0w0Cq+TsjQM/d64LFUg6StyJeSlQk=;
	b=cq+YfY2/LcayG8HBCc2NLtUhEa8HZJY8gfpYFdy3mUE6FQr29Jyo49MT01xEFWCPxELS
	 Qgqw9RHiq22wLpis/rKEBzsoiuxcO+Tmax6RkhLWoEqvNHlI/KlH/Ld7mNdAtSz3NwIi5
	 WMEK+svUB22iwLvE8DyA/3MNaXT7QGkGiOyrFHXGAC2bOuGuOgOSJLuqmad5BIyuatpmP
	 AtAsWwfqedi1Fy6tiJzASJAyN6jmB9MO7lt0003yg5jyI006ZprXRs009F1KATm82s7fI
	 pIH2oLz+kr0LKGjtVO4qyrZN08w+gvFfC1mH4sQXZ1H1h+3OkM2GtXwLbf/LRBTmwSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPlko7MB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E25606A336;
	Fri,  6 Nov 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPlko7MB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793978060;
	b=Ruwx+1jK9LKsf3sWVrZoX+KtdWnXxty0cTx1iZ51hJReeVGouJkiGnCy3hH0c+lDreeC
	 HjHvPcsFcOrAdbHWfSfY4RHPGH/sML+q86494g9tSQCMSOH7wPdiqUuivEWcQM8MsMWRi
	 s0zpjuR9UYmKwhyZL8A6OCymOx6cjnBENHIYMRqi231uzWG4NxKd1ezmK9rh3EbbVw1vq
	 dwNflBI5M63zs8sffW20vR4QZ2q0RTtmun2GpFeL3Hx42ajKvqbP+4EuQz/SsNv+Gg4G+
	 2uK7Ims/T6l4vYtpdzUx45o9ptXUaY14DUTnunVg6DNkXr75i01x2hingHs/rWh3Y5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793978060;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MU0JYvA8sDMKbF0w0Cq+TsjQM/d64LFUg6StyJeSlQk=;
	b=W/ffZoiMlTh5dTBmPMNl5QMLrGSDu4mbIkmO0+/ir8/lGts1ctP7XOCBkqBxl1cqdsyd
	 WhIDSrQ0RVjDcr8XvIypTRSWi3zjSiFIdqqhhqOziMnhMgOJgmdTSnQisw+8uBfy6bEgB
	 yW1MKYiGZxhqoQFc8d/fq1iZX6AIuU/vsvzMALrsAVTYUazSD7NJoc7HKQViO8tu7S/e0
	 5FZwv/enR34DVNNqqRLZVaMhI2wC0XPgOnmjiGe6kvj8zU2+BYuUQtNGuOzgGSo/l1eqR
	 gHSR6sQYqr12euJtLjmirs/QqcUWi9asYBXo8HhWREhZSlrblsMnbltn+44hZe5Vhyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A36B21F0089F;
	Fri,  6 Nov 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978060;
	bh=MU0JYvA8sDMKbF0w0Cq+TsjQM/d64LFUg6StyJeSlQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gPlko7MBP8sT2nXLddtUhfD+M49Najqg/wphmuhcCRaPeXyT0fo31L14Qev2IFXtd
	 6xC++t4Tax3N1CqLOxhfzfucX62AJIODKVUhs+zBGF2+1+EpjSDQQcqHmN7j/rxJ+2
	 Cruv0F0pzLEanJ+2sJOwGCzzKPkeaJIhYI102mCB8GJ+C0P5XSmFxgJl5+R9zhUoO8
	 VWY5oEE4lJe/YP8PgHSCXgwgt0REpY244uJKgDfpjo1ImyIUVF3df+5dWZXsL5qLn9
	 eD0Gx540yCoISQr2vrcl0k6DhrVZkKol5I5I6i8pfd8e+K6RMNyuxeHYxSgSKYehro
	 92mD2WDQuXsCw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2640045DB2;
	Fri,  6 Nov 2026 15:14:19 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Fri, 06 Nov 2026 15:13:06 +0000
Subject: [PATCH 2/2] regulator: fan53555: Add support for Silergy SYM827
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
Message-Id: <20261106-fan53555-silergy-sym827-support-v1-2-4e871c7f475c@protonmail.ch>
References: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
In-Reply-To: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978058; l=1952;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=lTLxd0Alrxv01Mxu2bJsLMCCl2lEDtrVsj8UGBRpWO0=;
 b=MBJGxh6TDGaUv3+RYd1ITluz1IaLjchTD9MijA/wGGWwftyV6gJtNLZoGMTTkUzyXGjMdtAG/
 ncItC6dfD7FDzEmKGRwANtbPR96hs5yceXd12+vfYtIQwSRlIti2s1g
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch
Content-Transfer-Encoding: 7bit

From: Ben Grisdale <bengris32@protonmail.ch>

The Silergy SYM827 is a 6A synchronous step-down converter with a
similar I2C register map to the FAN53555.

SYM827 reports die ID 1. Its output starts at 600mV and increments in
12.5mV steps. No datasheet is available for this hardware, so the die ID
was read from devices, and the voltage range was taken from the
downstream driver [1].

Link: https://github.com/amazon-oss/android_kernel_amazon_mt8163/blob/7c8251b354f11a4703e6f7d5ad7b0c545bbed15d/drivers/regulator/sym827-regulator.c#L60-L62 [1]
Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 drivers/regulator/fan53555.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index 6557d8cbe98d..9ac3a4e6832e 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -118,6 +118,7 @@ enum {
 };
 
 enum {
+	SILERGY_SYM827 = 1,
 	SILERGY_SYR82X = 8,
 	SILERGY_SYR83X = 9,
 };
@@ -412,6 +413,10 @@ static int fan53555_voltages_setup_silergy(struct fan53555_device_info *di)
 {
 	/* Init voltage range and step */
 	switch (di->chip_id) {
+	case SILERGY_SYM827:
+		di->vsel_min = 600000;
+		di->vsel_step = 12500;
+		break;
 	case SILERGY_SYR82X:
 	case SILERGY_SYR83X:
 		di->vsel_min = 712500;
@@ -684,6 +689,9 @@ static const struct of_device_id __maybe_unused fan53555_dt_ids[] = {
 	}, {
 		.compatible = "rockchip,rk8602",
 		.data = (void *)RK8602_VENDOR_ROCKCHIP
+	}, {
+		.compatible = "silergy,sym827",
+		.data = (void *)FAN53555_VENDOR_SILERGY,
 	}, {
 		.compatible = "silergy,syr827",
 		.data = (void *)FAN53555_VENDOR_SILERGY,
@@ -794,6 +802,9 @@ static const struct i2c_device_id fan53555_id[] = {
 	}, {
 		.name = "rk8602",
 		.driver_data = RK8602_VENDOR_ROCKCHIP
+	}, {
+		.name = "sym827",
+		.driver_data = FAN53555_VENDOR_SILERGY
 	}, {
 		.name = "syr827",
 		.driver_data = FAN53555_VENDOR_SILERGY

-- 
2.56.0


