Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364784;
	b=pg87/d3UNuA0cFypnSWvtgw473Hqe7rxOOqLOzXX7gDwpo7fRVdbQF1F8oqwXsoQrw3P
	 DWqRPSX9PeqrEydKR+vDydqzxXU6th+f+uDlOESy/AxG2Pw943X8FZNxKZ4L0dUvQ63/E
	 wIXz8bOaTrfYYIBI36PIsNPc/1LOhUMaWielcZJETwGyRUPvsInFsK3pNr1vpRv9TDTFL
	 J/EppCxSB+Orp4p0LomrytsdL9KQQKngNYTqpFvybtReDu8v9SQVHlWWGoVUtl8GSWeje
	 dhpQawZBUFqm1YkNOoN/OeZJ3zg4CU+KEKwlbVUi0JmETcgsIZQ0Bqabdm+tvy4Jk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
	b=fMo6Z35x3FsMKjhN7d4eHTqboIfi2uSWoX04N+ULTlI+oLyo3hHuEXXQgsDpykqhbT6z
	 H8AV4SqDoeMr6NpjJ19kTt46Pvro2VKYB/5WdulPiEPgHq5GgstwaIUJ+I36RBV4jHHQI
	 WqAhtHGmy8C5mL/f9eodj0q1igVlvb6XeZ4zn8JRKj9N5T6VCfVo+2m0l+LQ7c6wU26Iw
	 6fR7KqlpHXk3MIwsm6Bh8PUPKvZGYGXMjGm+aRcr5r3KKgMcFB7WsWv6MmrA5wd5Pj22w
	 D1adQFmuhdama2noEhXPVhumCZhPhsEtOThnd6/JNWvcVH9rWXiOv3jtoUqITOlClng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Hqcs/u2r";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9387606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9387606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hqcs/u2r
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so2034604b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364783; x=1794969583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
        b=Hqcs/u2ra8lREdfSNyYvzfvusNIjK8yDCTNavHbuglAZMtxeAqPdHp41OpaHKumytM
         M0KodzULDGxmfa9IGX2fa/FIa5AE11/kxw5WARdSM3UARuoV6IWAUMY0bb/MI8V9nufJ
         mc0yt9tm8Vk8RUcJemGFiA9ucqcdIjvVSwvjn4dmP4YB14kJyIi9FUK3V700VI5lcN17
         2p226IILmpoUFnJl9jYOs75bXKgVA3ODQFQwF96zDGyjyJfbo8QjZ3An9Fw2hDgnIEip
         lCQByrwBrW45791C6Ts/4MEMtXOKLtZRovWFyvfMkT5vTe8A2sl401QZXJ7leMneeEFJ
         bQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364783; x=1794969583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWgatv2qYfrMiUj+V1Eg5nb2TyQSEHAlAGM5NfT6vts=;
        b=KUoyTs2x6M0RTwBpn0xwR/0fDe3BU9GMWdPr8/VU9rwI5jvwRfAhIK2MvtWXYqqziU
         o5VEQ5XVCZw/5sUxLCrDSFY1AkNsqXZ01C8qyHb3gRbqAAb42F4HW01yS/69icpUT5Sx
         TuIQG5dHNhL5WMAiB9vW9bHLkNozHVz/s3MQumhmdmrISiQ9VmxesehjV38ju9CcooOh
         FziA81f7mKXz2OUkplxLCLvGEnlPAxE+YLVW65eKuwNkQH2piyPb9IDPVFBPczmcXpyB
         3tStqpbIOcDD9hSaYoWMtiLuFlExxrpjR2E7D0noBX4XYAUXnom/SgGnjS+7KyyqyMRa
         jNaw==
X-Forwarded-Encrypted: i=1; AL+hErE6+SCVMgTvckmbobK+p01aCpgNl2zi2XvUGj+loZuHwug7P8/G4auzIbaJWo/MpJrNAUw1bxd8AflnY1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gIDGLmmA3+LGvadsPzGdRz1OETn4zwXvvwSwQoJ+Zj6/7vxX/
	H1TtKyT7OCiV6Rx7mGZERE/t82mgTYVe1r91isqeiCgEZpTUJSTuE2I5
X-Gm-Gg: AYBFou3qjFa9iZ4/1Zoy1ReGqHh0wP79pbAQfHRUnhs4XDzb7SaT8zvDGuy2+H0ne+F
	YSMlykWBPTT8SFXf8X6kzadj2c1aWgQ/35MjPghJJslGmCmw3/+iL5lD1lIQNMKykVA3ir2OspA
	LBYIOuCH8oRfzcJ1v0ITMY+Zr2hIs9Uj1MPGIPunyjB9ihPfln0Y9myNOpJwYAEfIKAgjpxnfQI
	HAPbHTD5euDTbCOeUmZLIIHi19S5zvhUHgHlGGx4uqzve2hcFUjXzwJZl4R+cFxwNOKcequI9J3
	u1lUp7tZIaZHeyLsJCsXWN1912r4HMY9AFR5pAMql3PDNSTJtU6B3TzhdcoCg70YnjiBO63AvcY
	slV4R01r3YqGtUGQ3ySeLVqiGbQiGSjUH4QhsBScdDiq+Snnn/wD4aoR9liMrx2QSE9USHpqANJ
	BKX1QVCu4bCEoLKL42yD3u2uYqnvLLI8Dr/M+mkuqJMyt9j+K+80rcoy1fa+pNCtZi+8gUw5cOS
	TmBQFAzgosmWhtGFZ2X12iyYGUU6+J/0Rn3pbxxuQ2h7PGrz00NSYYXnZ4OFf6b+9OBmORgf7EL
	culZuCWu61SHfdXqLLUlymxCT6c9mc9qk1+CVRXS4DXhkJMpt9Ut5XZOHVjKABQ4o64SKx/wKzx
	mXlO79Pcp3xH6UcAexF0uiiYqgldlVOX5tp2wD7t0djnAN7wsedMpbAqSQFjnmQ7LWQqtteh4OD
	f+ftFNEyc4z2FZugitOeYA2Vs=
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8bc1d3324ecmr1077159b3a.45.1794364783094;
        Tue, 10 Nov 2026 18:39:43 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3a55sm1488097b3a.3.2026.11.10.18.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:39:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-ide@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv3] ata: ahci_tegra: use devm_kzalloc_flex()
Date: Tue, 10 Nov 2026 18:39:39 -0800
Message-ID: <20261111023939.75386-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Combine allocations into one by using a flexible array member.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use devm_kzalloc_flex()
 v2: Rebase
 drivers/ata/ahci_tegra.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
index 2b9b98643128..c6ec344c2e6c 100644
--- a/drivers/ata/ahci_tegra.c
+++ b/drivers/ata/ahci_tegra.c
@@ -176,8 +176,9 @@ struct tegra_ahci_priv {
 	/* Needs special handling, cannot use ahci_platform */
 	struct clk		   *sata_clk;
 	struct tegra_pmc	   *pmc;
-	struct regulator_bulk_data *supplies;
 	const struct tegra_ahci_soc *soc;
+	/* this must be the last member */
+	struct regulator_bulk_data supplies[];
 };
 
 static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
@@ -514,6 +515,7 @@ static const struct scsi_host_template ahci_platform_sht = {
 
 static int tegra_ahci_probe(struct platform_device *pdev)
 {
+	const struct tegra_ahci_soc *soc;
 	struct ahci_host_priv *hpriv;
 	struct tegra_ahci_priv *tegra;
 	struct resource *res;
@@ -523,14 +525,15 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 	if (IS_ERR(hpriv))
 		return PTR_ERR(hpriv);
 
-	tegra = devm_kzalloc_obj(&pdev->dev, *tegra);
+	soc = of_device_get_match_data(&pdev->dev);
+	tegra = devm_kzalloc_flex(&pdev->dev, *tegra, supplies, soc->num_supplies);
 	if (!tegra)
 		return -ENOMEM;
 
 	hpriv->plat_data = tegra;
 
 	tegra->pdev = pdev;
-	tegra->soc = of_device_get_match_data(&pdev->dev);
+	tegra->soc = soc;
 
 	tegra->sata_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(tegra->sata_regs))
@@ -578,11 +581,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
 				     "failed to get PMC\n");
 
-	tegra->supplies = devm_kzalloc_objs(&pdev->dev, *tegra->supplies,
-					    tegra->soc->num_supplies);
-	if (!tegra->supplies)
-		return -ENOMEM;
-
 	regulator_bulk_set_supply_names(tegra->supplies,
 					tegra->soc->supply_names,
 					tegra->soc->num_supplies);
-- 
2.56.0

