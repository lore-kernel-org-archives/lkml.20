Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612B3FB7E0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999271; cv=none; b=KWeJmqIJOzMsy8HXRQ4DO/OX0YFtAfDe4RAFBz4N0nUje/fGlJwsvJ+GxChfzQiF6LLtaa5daKsKTuFxgeFXVsFtltZdtzo2Er6O01tJiJXcC/h8tHzM/VkeicjKyEh2L/U8m0Ab0jvXohDcZZJDaO6ZkrpraLzx2kQM1ufYPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999271; c=relaxed/simple;
	bh=fIqA33wSyUtbRcCcYiczdNv6wVti+pGWaArnAAC/2uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNtMEF6SFxi2Zm5Vmz4IHDQDKGfBIajF7TE3SfpwA2bfXMufKc+DK+JkaqvK6Znp52kK0nXpgMfde++pORIUtmd+UE5ZqzE+MGpu74zVqEYIvl367k2ekJyW3WS83voQgf5iNOFU5wkEVca0eupU6RzG7v5NvYV/oNnvEOKhc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRgkEyzF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRgkEyzF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso676994766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999265; x=1792604065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bK91X2SdwuCyQyEfLGRdQUCBBXpE80vPU5AmtR26wN0=;
        b=nRgkEyzFJ02Z1m7gFpmVV2z7oYmCwZt3aIUHuAxF7lPS+ROaLZW+lA1JidWm2NQYgT
         796jHY5tRGyywfxrRNGEhiTy3HUxUZN+RM7Hu/zTbxWD/sXws/Lchd5zns9b6fEynGS0
         UMLN4IFrQvJS5tAQn84EEU8wsKat/MNonna9QA2L6/x99nbrlfyQpDLjd8iJxJnPxzdC
         Tcwk+hW7lu+oxipDil8RHrwzpmmGGils8nveJ6CCm9ZZhlRpyQPyFOqmKTkXcW/V47bq
         gWUQ/qOMt3s1xdI7+vRjI45NyMPTvZobi7YUCsxODYNmSKbWSkS0VMIs8RF13vMmHVKd
         C7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999265; x=1792604065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK91X2SdwuCyQyEfLGRdQUCBBXpE80vPU5AmtR26wN0=;
        b=IQNHj8uTob4G8m1VHcwgMGO8ZVADuLZm2/dFR3UEKRrnnGNAwnqIcZ/rVR3Sz9hILO
         oekHkLsJgOV2OnkzFYcF7tcFquOH2qpjAf7pcVrM1My61r4do3V5ubUzqmiVnIP8kBd3
         +tPL77gaSTswPkkDP2kOC82qQ4m2IvNoE7h3c9qScL7IUJvEuRyszTcc4YWcCrKKdMsf
         Ko4JPmzeOFCDltaSA29g+Ok7teN3zNaZfDK87fYlofNWdYqmBZ1bsLybaj0TG4iK3LFL
         ozTHW/OlFjP8FjWjIxL3xDTpQoDfzVjskZNK53scjkxIOPbSKJneJYqASyoCfJXXmObM
         AyOA==
X-Forwarded-Encrypted: i=1; AKwUvBxa4KvIvHSx1R3Qxg3o3ggXYIGW8UnHgkhMQI+Z0p3aGo8vhJe5bYK9TkRNnvIJuQ3szfPIZ/HcqoAvlrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYInB/jDT89vpvbzJfASKfZ/4GLyj8HjqdQhGm0C8EaMO1AI/Zhy
	k8mIWjQn4fbyYQb3hLodDMHqEznjK/Owku0rcfphME+YgFqhtD5KCvrX
X-Gm-Gg: AYBFou1RH8CVYbuFInfL6oeFxrPgHq5SDYr3dSTRFTUUBDNEbDjx+BjR7hTISWCPno8
	+GvE74/BJ7Ziwy1l9myn/zUNMeRulweqjFumfB5MPGuj6Syj/cpHKPWsA7y5ZRtPZIMSY3Cqw/C
	PpGmN2KzIBLnScpc61bJlia3yOoH9dF0yW2RSbAxxDnhhI1tAW30Edf6lZFDRc6qVhr4KGGgPDx
	2wFqQSkveenn1mwLaiuHO0SSuoLbZrbSPDx546Z6Fz8nZlOSqfZDFCgfKATmhxoXOsvRHI4QTxN
	2v7kUzlkp4ETci5hPY2OIF0z9E0j6ZDhzEaTO7bfs7fqm0oQZ1nAMdb86NsJe7Yp/pREB0OlKQc
	ula1cMvY3By6TSTAHoMRo/pA/GRWKXATmRGA+cpds2E66kRVEK0LcbVyEIw4kHIZaiA2cSidlJc
	6nP80GFO2PFKzlFhW2ggGh3brfksflraC18Cvjrdjg6f5BR7FvYEAZuZtxyWM1MuofPHyQ507GD
	g7b7QnLCD3lUp05a0sm7z7wMRw=
X-Received: by 2002:a17:907:9686:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c31aa017261mr1685459966b.24.1791999264715;
        Wed, 14 Oct 2026 10:34:24 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:06 +0200
Subject: [PATCH v3 07/11] hwmon: chipcap2: enable IRQ processing when
 regulator is already enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-7-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1283;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=fIqA33wSyUtbRcCcYiczdNv6wVti+pGWaArnAAC/2uc=;
 b=wGwEIFvv57yZEZRHNLCnr5pHFMdGHny3xsVW76RPyioM1t8Hqj03BSfwk9UChXIEm0Sf6Hlt8
 TJldbe/ES8UByswF2ukfIfMUIQQgn+r0EIUg0837081JqI2pn8heN00
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

cc2_enable() returns early when the regulator is already enabled.
This can happen if a previous regulator_disable() failed or if the
regulator was configured as always-on.

In this case, process_irqs remains false, causing the ready interrupt
to be ignored. Subsequent operations waiting for the ready completion
then time out.

Set process_irqs before returning when the regulator is already
enabled, so that the driver continues to process ready interrupts.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 654f6420da7a..837b1830f2e4 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -120,8 +120,10 @@ static int cc2_enable(struct cc2_data *data)
 	int ret;
 
 	/* exclusive regulator, check in case a disable failed */
-	if (regulator_is_enabled(data->regulator))
+	if (regulator_is_enabled(data->regulator)) {
+		data->process_irqs = true;
 		return 0;
+	}
 
 	/* clear any pending completion */
 	try_wait_for_completion(&data->complete);

-- 
2.43.0

