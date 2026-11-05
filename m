Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860725;
	b=XAzbUgdS+fN6RC5SF7+quXoUP9YCvSB10693fIxdk7p3XG7eb1fV01z194sSgEDPmEyU
	 o/wVVjmXGTfsH6IY5+svZ32SmlB+D5ZEnnTx8MNst3fv7EcalitYqh/dq2gsaMbjZqotO
	 nWDXhJYfev2iYiUHm6KPNOAkOKAwJburbaak6gFnDSiwHdQplybkogIH4f8oGcKjEGoC1
	 zIR28i8ZDIi0o1qukCtld8SOUgD/g8MSvrpPdPDDuw/5MEuUu3imoDkSvVSMlQqwy3TSc
	 0W3i1cm1oyPdPK8wlnDV7UE7iHKr5fUq1zOt9qUFDKeI3LRDIDFgaQzTpqROV9VvqIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=L5dubiE1iWMYoNsbYmd6mG0ptehWJeLitxAHfWNlAHY=;
	b=Ilskc3P2Rw1GoMHH2WN93FGnvE/DZFfjEwnn0iZoORnLlYtdj2m09N93E5eQUbvLCLuv
	 eX79sb15ttGJv638Wzk+kxpaYy7OBjLuOfqCuvgdUYqjjg849x6OpxEYzLwx5i/bYKrbf
	 iKSZ/i/m93aI6yk7wTbk2TSnQSsDFPaEYMz6tuLGiU7xBq0o4ea7eeotHpN+nZVS4BP9O
	 th3QMoY0XVAraH6j/ZIUiBbygP9/ebvWd8dWmGpwDs6ZDWCtNL50f1sVudpb1aCYbpJVe
	 c3PZAG875JTgClVy4VpLDyAch4KYuFzOllcL2OMB9OWT1CNU5QXRRrE0Fje+Za2r54Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmy2ttyu;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F2606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dmy2ttyu
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a1947498bso4221508eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860724; x=1794465524; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L5dubiE1iWMYoNsbYmd6mG0ptehWJeLitxAHfWNlAHY=;
        b=dmy2ttyud2RdZpUcJr4Drxij5+uLFzQIHSItErh+GocLVUSYIJu4xfuXE53V1clj7l
         5P/CpBt8+Nm/ePEwoPtEGJOH/wHXrX1gffxgqEY96wIt+yBOUJUc5BusK11VwDH6Q9SH
         To05ceoiKqJEIeh9r5y4ef0sDu/NyGfnjOLZT9nE6fZkfLaAOjeDkbZoWORtWGpk6/CB
         d57L4oeJVUTJ8ODy2F1OcpnNy4gTpvBokxTS+viveiI8vuhU2iKaN7g+5RI6MU6EBx83
         MZvNrrUFLxdajDJGx3kisnNZzg1wfd7qoVfbsXwz8mLkqY2rMqKie1y2/AqtDzUFw47o
         2LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860724; x=1794465524;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L5dubiE1iWMYoNsbYmd6mG0ptehWJeLitxAHfWNlAHY=;
        b=JbKrLxQQU/GMEur+RGeKEbyrTAJmAx3B8b0rxsvRYO7kApIzb/Rrr5rZgQL83vIB93
         y6LjGR63Lyk98Y5u3r7NFDJ+X+SPE7jzjqWmmFYlnY338nz1Kv6vckcjRxvktbXgKsFV
         Ar7J8xn14rgT/eMlO1C3G/xrLDhT4NNC4Fw/N20q1gIYkSDa8TkZnv0oG4VJOeEDktSb
         /dlz6rKb4UN8fc75Uxi91nn6s32h1rb/mbPU6WyUywXW3uPrMR1yHgdrVIVi6Dg25Sdr
         UxpJeveOTs9dJgP0LQmIp+/Wi8Yze3duJd9uXk3I69v+85wmfPFSshdoNZ6kuyXYrT3I
         u2SA==
X-Forwarded-Encrypted: i=1; AKwUvBywcD7km5dtV4QOvOacvjMztZJM3tKFYC3A1TTCn3l4Se5JKN80RobFoXqu3v7YF0pEhaMS2vdz6GIOhbA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dM/NmK1VtFqa28H7aElrAh0cDxfvZOLIFxrkVrseXDbvplUs2
	Y9vnhhEwcrdVZiXQ4Yr+MMzZ5s/T64p7nB2adC5rTM752ILmg56Fa+cK
X-Gm-Gg: AYBFou3EGbWUwzI0zMhu0de/Rog44tki8cBru74MZT2xNIBtyQu/ArvzFdvi6d/B7Y/
	VMLLB3sek+3w8S5jR9D5geF0fhNnMu72GYF8VFK6EVHwj1tVO6egbqrDtpKSkTAOp/SCUv/foDb
	rIOuVAs4n5J2taF4NBgVbrd5KETZKYsJXlHl7uTsY4iAVpQn705JVQCzxFI2MqRCevn1MYuIjXx
	s3reJkfbDm517aqOqBE0OtUAyj78FMBXjkn8FQvKfUbRkNCcOthVRmgHF3suV+VEtmqvp7Wq4sm
	L2qd6ZVrome4u+h1lo8jobIzkbihPIt302RpUmKH+h5iTK1rNHWD6nwJ+yeyfJmNGRPAcidPVqa
	3htKAMzmzn0ErZbTV07bT359n9wH5dDacq7IodkJd+XWD1/yMTF43JzmD3Tp/JQDy49N+K4zjLv
	93vi+oQBhHZwBrUVVHk/De9E+i4Mt9/WZR8AVNxe+tel1Y/xkptmONSda3aXQcMBVXZ438DSaES
	XePTrC/PxVPIXBBpfN5HGaB/K87Kb/SeI171kXK6QBi2hed7js+46cSjj01Pwia7EQnBfH33GCU
	9YuA2QNeb2SU30gXD8L9RGZ7MCOl5THMuXwQFMz/rcSiZjpWdsWLaeXHJYbLCt2+nCTjJ9klIDK
	TS313srP1Ec94KsgUug==
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr26600863c88.10.1793860723477;
        Wed, 04 Nov 2026 22:38:43 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm14414169c88.4.2026.11.04.22.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:38:42 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 04 Nov 2026 22:38:32 -0800
Subject: [PATCH] regulator: arizona-ldo1: Fix double gpiod_put() on enable
 GPIO
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
Message-Id: <20261104-arizona-ldo1-gpiod-fix-v1-1-5b3c02d8a4d0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGck7GoC/yXMUQqDMBCE4avIPnfBDaFor1L6EM2oW0oiSZVS8
 e5N9fEbmH+jjKTIdKs2Slg1awwFcqmon1wYweqLydTmKlJbdkm/MTh++Sg8zho9D/ph26C1A4y
 BNFTOc0KZj/D9cTov3RP9+1+jff8Bze8mKXoAAAA=
X-Change-ID: 20261104-arizona-ldo1-gpiod-fix-48e94fe22e18
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.17-dev-e56a4

When arizona-ldo1 registers the regulator, the regulator core takes
ownership of the GPIO descriptor passed in regulator_config.ena_gpiod.
The core frees this enable GPIO descriptor both on registration error
and when the regulator device is unregistered.

Because the driver also tracked the descriptor and called gpiod_put()
in its driver remove callback, unbinding the driver causes a duplicate
gpiod_put(). Remove the driver remove callback and stop storing the
enable GPIO descriptor in driver private data to avoid the double
free.

Fixes: a9191579ba10 ("regulator: arizona-ldo1: Use correct device to get enable GPIO")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/arizona-ldo1.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index 501843996faa..f719158ac360 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -35,8 +35,6 @@ struct arizona_ldo1 {
 
 	struct regulator_consumer_supply supply;
 	struct regulator_init_data init_data;
-
-	struct gpio_desc *ena_gpiod;
 };
 
 static int arizona_ldo1_hc_set_voltage_sel(struct regulator_dev *rdev,
@@ -262,8 +260,6 @@ static int arizona_ldo1_common_init(struct platform_device *pdev,
 	if (IS_ERR(config.ena_gpiod))
 		return PTR_ERR(config.ena_gpiod);
 
-	ldo1->ena_gpiod = config.ena_gpiod;
-
 	if (pdata->init_data)
 		config.init_data = pdata->init_data;
 	else
@@ -339,14 +335,6 @@ static int arizona_ldo1_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void arizona_ldo1_remove(struct platform_device *pdev)
-{
-	struct arizona_ldo1 *ldo1 = platform_get_drvdata(pdev);
-
-	if (ldo1->ena_gpiod)
-		gpiod_put(ldo1->ena_gpiod);
-}
-
 static int madera_ldo1_probe(struct platform_device *pdev)
 {
 	struct madera *madera = dev_get_drvdata(pdev->dev.parent);
@@ -375,7 +363,6 @@ static int madera_ldo1_probe(struct platform_device *pdev)
 
 static struct platform_driver arizona_ldo1_driver = {
 	.probe = arizona_ldo1_probe,
-	.remove = arizona_ldo1_remove,
 	.driver = {
 		.name = "arizona-ldo1",
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
@@ -384,7 +371,6 @@ static struct platform_driver arizona_ldo1_driver = {
 
 static struct platform_driver madera_ldo1_driver = {
 	.probe = madera_ldo1_probe,
-	.remove = arizona_ldo1_remove,
 	.driver = {
 		.name = "madera-ldo1",
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-arizona-ldo1-gpiod-fix-48e94fe22e18

Thanks.

-- 
Dmitry

