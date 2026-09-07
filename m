Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B44CA78C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787603; cv=none; b=NTO40yXg/hRLQqkZ07srR84iY0odiuQraYfZoSXeg7JlQVr4V6vCRi0TvCYJfllrlQ/wnN2H2nQJS2uTt+PUIeV2FcMQwsnNjnJptZPXMj7evMmOs1lxO4KPCXmO8Tke47s9S84uHPV8Ibh1kq9lcuq6Rk6RUew8eawdg94PAJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787603; c=relaxed/simple;
	bh=bNTT1MFk41AEn9RggYQGn5+f0aqUw5g1TGoWu75TN+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmwIynC4vT8fCTNth5LGvsb/Qo2LDH1MB/v0NR4nYGSYIZOgvUodp3TvniSFY0KhJzFDMdmOrArG64lP0v51/poLOQVZlH8FLzESYAqG2q0XfXq8LI3SmKUst+G08S3Jav5IkXB8BIqxg5XGAYiuuaKwRCadQNu/ib+79kvp3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JAgKE5Y3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JAgKE5Y3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2530cabcf4so542982366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787594; x=1789392394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=;
        b=JAgKE5Y3TJ6H68yzHS2XnWNLOLt9h/pp0SU8VKgzJ5TB12ija7GQSjYnsF04TebhfG
         f8/lfbu3aNq/2A+qnl1i/pp6jlqLgbIW8sY89rD/0K84CLDiOp3vzRM9gLMhewjGwksk
         JGsxy3FyDFvvq85ZxY+pBCG5QxlrnHA4xpsXXIkW6QavpKLwH2CEufU8OMGdsc2/ukVG
         oyMH/HeZZYlA5SHnuJJtyPKFvHo86OIiWUIP/iZCztMW2qmrU0HklhjwByHL89utxUml
         JblB9xCNQIytMex2LEhWdn8Wk6Pn80LqOQIhHSjmqldHoP/Vz1B6MnenYslBgYlBN52F
         8SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787594; x=1789392394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=;
        b=KFhBkg9VNDP1xqMdNBaO0K9zA8LXPqK6c5U2xFVDruelxqh5Pna0wiipFdWEYtyK8Z
         fBTWnlxAqVFLmJEvSmWtmt78X/ZBqjP/As38x6CczlZue2p+5XQLyTLD6UzBYQv9wYOW
         8kWCJFdDTWbMEruu0D87aZGBW50UkOT0fXxOoce7EtvDcq9XKMYOWdqhUM+zCz7lL86c
         ZBA6eb/FxsVBpw2Rg3MLN8aa/ds1gHlNFo52yhM0t7BFYCch4coSN6z7ZMUW7u+Fgb4S
         ME1U8TW3+qGFMl8kyMAHXpQ241DlKBn+5y/cHCcAD7DpQ+9r8NY/s4GyzG8952poEy0J
         6oLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaHwJ0j4ZV/lHDTUchDT3NLwy85K71GMXyJhs0/O7Qj3rG2OFi/zmPRb9xYyh76n09bLGN87Zd0nbNgqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lu0fvUARzls+2LYWwqBji5echU1I3B4mcN1PTxLyWJn0KfsqX1
	59CR4LoWqXevdA2j9zCaE/fTh/YKZmcoXRq5SQQ4gCwJ8Wc9USP4/3KSdeVkET3ZWSE=
X-Gm-Gg: AYBFou3u92imJxGmbjr9CojXek4DRjruk12LLv3IQGQNUzHjGeWoAGnKkKsDLrvPHHX
	Zzt9bWmOq9usnF0mmS2XQPF2FRF71nNSBuHYceTHN28FKP3yIVNEJN/G8cuFCrsFCAtGECM+tb4
	Wqx+k0NhczwKiO/Jxh+omiNgTkWTvexv0v5uWjQg6hW4W5cu4a0JfLD5HW3Y9DtVYpaUKQXIllU
	Qk2QCtR49VRnrfqAfs1wNy6MZml6ZoZHag7vQjKg5jOtkWk+E9AXNqgOGwkf0z1ERBgLBu4+Ivz
	gi4F2eUQoE7tQtXzEd3K4wUnaYGWKMEF820zHkwSigl+ekyVCyTtnmMetazRwbL0afflGgnzF8K
	csAmP1m511KZWBihIxqmT2KibOSjTYe9uOwKfmjzjuCrjEQYPnIUizKaDbIf7H5eUdGS3hTJtEL
	TE/yk42EWloAD2Dc3BJod1i00NdrMdw69d895aaKGtzlMVh0olwiR6kDKRXV1lLfh3YoziU4AWe
	GtCeYstwb5VjlLmHFM+IbWrS5+UWCpCsPQ7hXmrtvg7mG65KACxvEKtzUZ6SbzqyJMQ+myA7peQ
	XbzzfgnAIC+0NGB8n4g40cRlyl6xvkKDhPdKqO/9Jrs5I7Lm
X-Received: by 2002:a17:907:d87:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c260cbd2d02mr1532301766b.13.1788787594351;
        Mon, 07 Sep 2026 06:26:34 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:33 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
Date: Mon,  7 Sep 2026 15:25:31 +0200
Message-ID: <20260907132617.1198548-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the same internally generated base clock layout as SAM9X60,
but its SDMMC controller stops responding when runtime PM gates its clocks.
Software resets then fail to complete and the internal SDHCI clock never
stabilises, causing subsequent I/O requests to time out.

Add LAN969x-specific SoC data using the SAM9X60 clock layout and select the
option to leave its clocks enabled across runtime suspend.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 drivers/mmc/host/sdhci-of-at91.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index b7e2a89da348..e7affca8da25 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_sam9x60 = {
 	.divider_for_baseclk = 2,
 };
 
+static const struct sdhci_at91_soc_data soc_data_lan969x = {
+	.pdata = &sdhci_sama5d2_pdata,
+	.baseclk_is_generated_internally = true,
+	.keep_clks_on = true,
+	.divider_for_baseclk = 2,
+};
+
 static const struct of_device_id sdhci_at91_dt_match[] = {
 	{ .compatible = "atmel,sama5d2-sdhci", .data = &soc_data_sama5d2 },
 	{ .compatible = "microchip,sam9x60-sdhci", .data = &soc_data_sam9x60 },
+	{ .compatible = "microchip,lan9691-sdhci", .data = &soc_data_lan969x },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
-- 
2.55.0
