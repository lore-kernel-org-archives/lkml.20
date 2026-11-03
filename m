Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707229;
	b=uX9NbL+5AG736uoZJoycD9E609duj92P+Z0ODBT0i3uPRHzBGPjom4P31CHsvn0iawh+
	 2/JXAVsx1W/sJpU1094a5vS49OSmi6m7UBFaNMITVBACO6Javvnw+EeET9Ar+LhGerb3j
	 qyhZYukCydW1iCJTyyvldxIjFkurMvrzGv4+Xh3wTWTP7qL4oxuJA+4gjsIdXrlWhgR0b
	 0Kjk0LckE+uSLeuoZhSTXz4LWqbw42gGO1yPJNhFfnr4GYpXFMZP/jGMxI62HedoZ2qIk
	 rB0AfDvycMWxKySOBBQgW7hWzIeDJvxAPZsI68DmeucsSkQ258pG7Htq1IV3irgsS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KOSsFUtr1KSHLpBlpFa20dTmSBuxFD793ZpB+9kI2sY=;
	b=OJicCf7puVToTLMx9cNjlLjbGf7hNRNbxs0imlQ29TKXmtdTav0msH5KSWDGDIsxI9Ao
	 I38jlUhgrGsyCd6QscQVERwLqVyCqWJLXnaC/CAEMFLVqfI4F25h2m4XbvXJYZEUcHz/S
	 PV40pdtsyJMuNlSRh1H+REKsdtsOKDpJuOoIH0hgjSmeHAuauaJQ06mcPzmL4eieOwf2u
	 JU8i0suoMtWQFCN5+FuAXkPZL32OKxx3EqP9fSsx3eHYPFTobkxAkHQC/o5iT/La0a8de
	 W+gqTJF50oph0/A+SqjWV/59tfh2zUSIvse8E8nP2qpyALzpu/G5XabqZe+IHFuvAOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=au6hcklr;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC3606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BC3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=au6hcklr
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8b20a899fso27852065ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793707228; x=1794312028; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KOSsFUtr1KSHLpBlpFa20dTmSBuxFD793ZpB+9kI2sY=;
        b=au6hcklr3QBZU+LXEdJAxpiFGog14HjaTfceoc/ey56229UuFVwWarln5wh5vqxhKz
         Dm58tTdlhHSiR1pRaS4VlbzNGUY3d3lVQivHZ0DKIFi1UuWhYoUptHUG1ngxgBMrrXhe
         86NfV6tP+PLhHsX5bwdmIcyz+5mPqoBs9uTs3ans7lV107fxCsWOPR+5ShiCAzN8elM7
         xU3iesI0h47NqK4kGNCF6zZBr7BSsORbOOT9ugpXb66JlmysBFKjkn1MPFvOdmf5x7DN
         39UqYYyeemf72ggxHRKg6FLNNVG8Pr7walPMuclA/6cVsz9vV0KR0Iv1CBveplgURMPG
         FeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793707228; x=1794312028;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KOSsFUtr1KSHLpBlpFa20dTmSBuxFD793ZpB+9kI2sY=;
        b=Fy5BSW72s6nsmmqe9JDtvnN7DiBM7AqOMJNk1kLxkOFCBy8+iOUm4EklIdfqGywz0L
         uFiQcgQtJGj8b2WWxCfirMVuLffawmAMH7wLoe1ri3ruToAhzKZ/TaBB/C1CtV3QCSGj
         YUXlbW7X+rGcmy5ZqA4BzF42rlhOzUkIVneTdqp+tYfMzMpocYNyPBYzHTRL3I8L0dq2
         n43phnUamCFvKm4eLFB6uvsVMHHF+AE3xqfCD6lLB/xqn6am4zQAhOx9p59dk/5nRRC8
         jNHveAJ1gZmH4VEbDV/9xQoM2/91gILssC1ems0uPjihx7nVuXx3/5SHSX7KB9zFLYtQ
         O+wQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuDHyek/2C4y3zhaeB6MioTNsmfMvsM8349plmTcK5FtaHpAEuyX2jDUTb+eC29PEyUumxpApWSjwj/TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vi8pFQiartEDdfRVdOD4YR2juT5Prwr7G+TX+YAnBdPWIJDSC
	TqfUq+5p5Tzufj5QFmhu1hcsAzXb+XjiG99iXk0af0gFSrzvCtySuIjP
X-Gm-Gg: AYBFou0mB/WLFUXSxx5Lc6zQhvG5BRnxdTM8ETXL3x7+T5moDlyLerbeXnhGjKHP26z
	8cgNtRx0KlO2joHIeacsOoSpIUWc1xQEreuLQ0oyITAFrtGCINbvr4nTbCgAKafzoNCjIdkmduZ
	wTaEEFt5632x++39YI5b7TWvQiQa9cdEdoGK/r28WLCuXNjvDqwigp3NcUTRlZ4u6ivvvezaQTu
	BOGRCVzzWaissZ3ySs4x9eSc2/bedC5W2tLp2G2qYxikAEMAfj3LG1x32IZJayOxi1FMdjHvvpW
	y9P0BLenEYybo+d8uSgJoemjb3Qgarugg6/KDLInMwkLQoeDVpe6rh4n2wMTzmdg5sMjuNhTgVa
	ctLLTa8M6ZdrmaLdHmsQ8BRjCwcV+LdrCsB866Ghq8i/SJfBZZejIb8CeuaPQfC2DOlU8AOWGDw
	7A9w66cXjgJ8N34cIQ+B4QzuQfk8DR/YGJrOQpRvVqMog1sxAV4A/fS3z9iDH1rJq/Q1+kxuzKa
	MobB21AbZAp3PbIJHgid46blHiEf1E7Xg6frFnoHGhnLHm5xSQnSrsGAKScyNvkvq8vU1Geswsl
	9o8/GL44UkhBvH5jsaZyU/Yv1Y2FNjMLijxUTcurIIJwSRW2Kbxo9Gdqbu7qFseKrz1mYBiSimO
	KQJHc8SG+pTaEmlP9tX7kX94=
X-Received: by 2002:a17:902:c405:b0:2df:8733:f229 with SMTP id d9443c01a7336-2eb3649ebc2mr124108195ad.24.1793707228351;
        Tue, 03 Nov 2026 04:00:28 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.167.147.108])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eb39298543sm39539685ad.60.2026.11.03.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:00:27 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Nov 2026 20:00:22 +0800
Subject: [PATCH] spi: xlp: reinitialize completion before each transfer
 block
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
Message-Id: <20261103-xlp-v1-1-696d0a50b84e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNj3YqcAl2T1FQLI8Nki0QLyxQloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0ALHBY72cAAAA=
X-Change-ID: 20261103-xlp-4ee821c8a89d
To: Mark Brown <broonie@kernel.org>, 
 Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793707225; l=993;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=/Zp9BYzE803PHdrBqdW++igX3lavqnQFG9kEQamNq0o=;
 b=11ZP8pDW6OoxD4sgNlI1sIETSojh/2JNk3i862D4U1h5lKemQGV862kzVvDymp3VRz0rf6AUw
 hNjJXRq/0U/CGbg41fZlHUqoh8gNHh+c6YGOpc4+Rv2igJozJPcO2Hn
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Reinitialize the completion before each transfer block to prevent
wait_for_completion_timeout() from returning immediately on a stale
completion count left by a prior transfer block.

Fixes: d8c80d49cfa0 ("spi/xlp: SPI controller driver for Netlogic XLP SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-xlp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-xlp.c b/drivers/spi/spi-xlp.c
index d014955e6d4b..fce8f50cd2a5 100644
--- a/drivers/spi/spi-xlp.c
+++ b/drivers/spi/spi-xlp.c
@@ -279,6 +279,8 @@ static int xlp_spi_xfer_block(struct  xlp_spi_priv *xs,
 	xs->rx_len = (xs->rx_buf == NULL) ? 0 : xfer_len;
 	xs->txerrors = xs->rxerrors = 0;
 
+	reinit_completion(&xs->done);
+
 	/* fill TXDATA_FIFO, then send the CMD */
 	if (xs->tx_len)
 		xlp_spi_fill_txfifo(xs);

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261103-xlp-4ee821c8a89d

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

