Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975368;
	b=wsQp9TwbhDYYNoRaB/xdIp7/GYYSetA0hSJR5KzDs0u9AXMCGhGac9L6lIldvAzodOaM
	 UpfBtwT2MCX00hZEgjofuAljEW5kk+zWAfDEUp+ENBMV+1aKWAUTlGr1HsEFaHYk9oRoE
	 ojfFlq0y9uRyb05QJ7NBxu2b8VdRTaGZIfPGGsYztxD0IsXX/DJEGRf4pi4iWU3bwAapv
	 l0JDswwcyiwd2Ol4DqKVpSPZeJJJ90F+JHOiTvHYu3inO31sGT2Ewywvz5EtQIKGEsyrO
	 LNiUKu6vE26TzUj8wxSMSXJ3/c00BUU3oC6TD2J22KNgO7hr02JlOu3Khq8NAH4MZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsMzQ846CRJJ0Ny+9gksXrEKXXeF09/phSigTZ8EuGs=;
	b=O6PBto1VMGqaC6Vk8VXoss6gxiyg454Zox6FhYoP0xMflzTIghB30OpIqWz/1T+np1yj
	 UucWi8vu4zPOpviwKR0oLz145drtvK4zipX1xcR0gVSAw2yzPXlsVX7RzHlHiPg0B0MNo
	 VgyfwkFnpj31Y06O57eOndGpnCus6K95YTLgysxfAizJf1nwAuj7wSsbdq7PQw3n0g7fH
	 PDQAv+SIINYMdy/86OwdM5tctFnyRj3SSB3nzFR5jx6ibeyGXvoaJR7HWyaMxG2F5+5wb
	 Csd4PAlpN1cg8fnM4YXqOCRSc2q0KqpjCmdHHZPhQw1xK2ZkWBDPX080fUISUn63iZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mft52U3p;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mft52U3p
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5520355e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975366; x=1793580166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsMzQ846CRJJ0Ny+9gksXrEKXXeF09/phSigTZ8EuGs=;
        b=Mft52U3phN8GwSTtaJyZ0/hGb5wywUJhBmL45POc50kfiR4meO9XvkgUX6mSl1skRw
         eyGZTrSN9zz4VVnmigFzIzKxFOY5GZlVRL1IPc+DZE5nD3ziKjaYZP17TAAKHW4GVB0j
         qZQ/jePk3ij1XJ+omfmmETwDR8yjZRsMkROgcCFGdTDyElM4wVVkHqjv4k0aBGzCmCM5
         mqv6sPGMyRR08jRg+HymR3l1QHtKSy5+n7FKWLlbbLxakkAvlBsPT/25SWDQ2thBygXO
         jwpMOhnhkxV9A6uDHkRO/nU5JO00V7idSsT2tWns8gRzyUiJmkjDR5EjrKdmshLwYFyw
         RWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975366; x=1793580166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsMzQ846CRJJ0Ny+9gksXrEKXXeF09/phSigTZ8EuGs=;
        b=t3VHDlDEUMnj9iDejP9Jr0meDQRKpaJTeE5MSTpskrnZcmYZNL+P4MJM+Hz5LbNkoG
         +sg+yFn1I+L0WEA4qPFYT2dRhCS6q/FBGnv6uOGzCpKUn3rbnfuV7D8aHB+XHmgOTIEn
         D3r3Bs4oX/vaXPSa26H9qMzvGwOa7DkdNhcb1WHv6ssx6YqSEVC+V38zHdFFKHsJRyq6
         7oeAmow3OrC6DumPFnpNevuKDYFAYphu8psJUmhaL9pW3wHJiDjyD//EI9Dz/PlfcHJb
         djNhcFP5K6qXYsY5PFUwlzPb8IYN1sB/j+OOw1JTKK5yadDbbKxL10AAwDLIl8ZSRmCg
         5QRA==
X-Forwarded-Encrypted: i=1; AKwUvBxGZ3klOshTG0bOgzPLw41RvGjKUYp2fE6HxWX3ugmsxBji6LT/xiCRK2Wq8+QqDYvJPDt3nfvlS3S+bUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwjdej1mfVCBRMDuiAWdCbV7z2Gxh/S7pKOucb+keIGw2KYeym
	DwJnlbjmp2wZvhzGZIW9yhxLgTTeGkI3H7MNfNe+C8zprYWMmZdo6CMy
X-Gm-Gg: AYBFou2/StUGvamhpbzxjMSO1ozb0bR2PH3SLJkafI6vTp6MacCE2HqVIlas3pzSzGn
	LIfxIUJi5HJv/RlxEkNbgnmTmrhrZ9GuCtZAnPaV6n8JYEYH7j/Zsem5yWHcb20qtbsIVU1vCRL
	rl9m7XjKsscjC4wTa5oLop1AWPeWy9IS+14loBt0D/jM3iazw0HPYKhABxYRB7HC+JFAHSv10LU
	Q8HPUSW/e7Lz0+puE6ugpsKdeaH1cDJO6cRfSLprI5MoFc/QAbJNvB3eYH1d8/MuGx14RvJBJYj
	JLsJV82fO7YEq527B/1BOLdXXJY7rl8fOMBUCb1qc3cTs6EC1ilc/8UCKRekMW2wgNqGhScZydP
	KZnsrl2AnfVlQ5G0noOrdRj4gn2V6kC54QSxXuvK3Y821w4GfnXRSXDTXISaOTGne96EzPB2VnH
	Nbq53kBmgDqJnP6rCeq0SztxbmqI/hbArf1ZD6coGDbD4xmFsyDB5Cu+YjFBzZn38w2w80wVzvg
	qcQCimGUK18dt7o9SHQm8eS9hzdKgd2W9uJPqAxA1QZYvKcFOOCJ60sV2o30U84+KQUChVb8EHr
	5PofzXhdVYOJ7BzMge8LE8kfqENUBXOjBgU=
X-Received: by 2002:a05:600c:4e8b:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4a35ad01256mr102142425e9.1.1792975366061;
        Sun, 25 Oct 2026 17:42:46 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:42:43 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] regulator: sy7636a: add VCOM voltage control
Date: Mon, 26 Oct 2026 00:39:14 +0000
Message-ID: <20261026003918.155321-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

VCOM is panel specific, so let boards set it in the devicetree. Switch
to the selector ops and add the write side.

Per the datasheet, VCOM bit 8 is bit 7 of register 0x02, not bit 0.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/sy7636a-regulator.c | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 015227cb113e..382bab017784 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -24,7 +24,7 @@ struct sy7636a_data {
 	struct gpio_desc *vcom_en_gpio;
 };
 
-static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
+static int sy7636a_get_vcom_voltage_sel(struct regulator_dev *rdev)
 {
 	int ret;
 	unsigned int val, val_h;
@@ -37,9 +37,20 @@ static int sy7636a_get_vcom_voltage_op(struct regulator_dev *rdev)
 	if (ret)
 		return ret;
 
-	val |= (val_h << VCOM_ADJUST_CTRL_SHIFT);
+	/* VCOM[8] is bit 7 of register 0x02 */
+	return val | (val_h & BIT(7)) << 1;
+}
 
-	return (val & VCOM_ADJUST_CTRL_MASK) * VCOM_ADJUST_CTRL_SCAL;
+static int sy7636a_set_vcom_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	int ret;
+
+	ret = regmap_write(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_L, sel & 0xff);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(rdev->regmap, SY7636A_REG_VCOM_ADJUST_CTRL_H, BIT(7),
+				  (sel & BIT(8)) >> 1);
 }
 
 static int sy7636a_get_status(struct regulator_dev *rdev)
@@ -55,19 +66,31 @@ static int sy7636a_get_status(struct regulator_dev *rdev)
 }
 
 static const struct regulator_ops sy7636a_vcom_volt_ops = {
-	.get_voltage = sy7636a_get_vcom_voltage_op,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.get_voltage_sel = sy7636a_get_vcom_voltage_sel,
+	.set_voltage_sel = sy7636a_set_vcom_voltage_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
 	.is_enabled = regulator_is_enabled_regmap,
 	.get_status = sy7636a_get_status,
 };
 
+/* 10 mV steps up to 5 V, higher codes also give 5 V */
+static const struct linear_range sy7636a_vcom_ranges[] = {
+	REGULATOR_LINEAR_RANGE(0, 0x000, 0x1f4, VCOM_ADJUST_CTRL_SCAL),
+	REGULATOR_LINEAR_RANGE(5000000, 0x1f5, 0x1ff, 0),
+};
+
 static const struct regulator_desc desc = {
 	.name = "vcom",
 	.id = 0,
 	.ops = &sy7636a_vcom_volt_ops,
 	.type = REGULATOR_VOLTAGE,
 	.owner = THIS_MODULE,
+	.n_voltages = VCOM_ADJUST_CTRL_MASK + 1,
+	.linear_ranges = sy7636a_vcom_ranges,
+	.n_linear_ranges = ARRAY_SIZE(sy7636a_vcom_ranges),
 	.enable_reg = SY7636A_REG_OPERATION_MODE_CRL,
 	.enable_mask = SY7636A_OPERATION_MODE_CRL_ONOFF,
 	.regulators_node = of_match_ptr("regulators"),
-- 
2.52.0

