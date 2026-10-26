Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003688;
	b=wjZq40/Dnt6NIvsRLTCzREAtbyWT5kcogeDYJhnJWgX8BYdn767YiSBe1CB/sVbpvEII
	 0/izV/iRm9ekJtZZrT3j49qQkTOOlhPszak8kefrp4B6FvJFqMU6s7qyvP6on/2XnwvKF
	 PMUccZhUwWy6EG459f0ukPK4MSY4DNd5qOz+x+RJZkwFyUFehYY/EGkSYeoD/NTwi6hGz
	 y0Zj65Dn04Vc/9TMgHIhcC9G2+IsDc4xzAHaa0Aesq2dLqLwCLvCTgq3KaGs/TsNaU+Ji
	 7za/wMVXfV/cr5K53SRv4Co41PS90r2OL6rB8jouyCL55ZX0xDF4ftol0Jd7XRSxKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
	b=vjFkJ9hmEvXCl+Fe3uIIRnoVyS3vVnOQsjpr0A8Q/8/eHTz4ghVOlY2VMs0LYA62M2jq
	 YynEQ/evmKhUXYj+s0YnNYc+9Fuamnoi4kAf0KRtQ1CatpjQdZJjyACiv1ubyDP9UoGqR
	 ha2tdVn98d5Vx8XLtAWAuuBWBNUDOEdQiwRHSfbI4zZvPtlAsjE2PZvn8Z1sjcNwPZiB5
	 tjHPZ97xKYJzovhYjSLTzD6+vFAAuAk/c/oPXCqLRExS1SCJAxNHS9N6kYs3aVFaSFpV0
	 PQLyvZmvbcnmjzzIq+IH/sOVSBNSe24ahxP9GfBWIWfsYLd8JtqiYu15tM0eUyKyhCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AhtaalZK;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A945606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A945606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=AhtaalZK
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso17507885e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003681; x=1793608481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
        b=AhtaalZK6vN7H0we5eZfJaEtME0g9vXRsj/0PMehl3von5Nk0qkJY7j6OkShNE0q12
         odEpqW2KkQsSoLU2MXSeU4fjNORSCAlOj/4zcFAomJTW4qeF2b0QTYGZ9hVJpCgtcWEB
         VGoGGA/04A4vmKbq7JDMx4sZYK4Bk7L4j0lkjtXfJkQ7CTkTws3TX29cIixciL0LTnog
         buxKQv0j2NkRB4uUKEWYN7jpAYVnOcWhjkiJTqOOMO4u1thG4RbTKQtTec4qnenlGl88
         z/8LwfTVBuO7BhkBtB+f/s4TMchGQcsiMX3SF/dYc411q7RLtY5n4wc5pdFewf0zsG8F
         UGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003681; x=1793608481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7dQENZy5hO1NBbTQGYEZ7DmBs04uprzORGYnKqQV5I=;
        b=mBh+PvkwBD7dfp4GrNblqyWrjUpjD1Ifd8EXCdNonUFtjAVsLUmsfLnrPEp/BZnZb7
         0JlXfo8xLekCXoyC4zV0AvlMCdN6m8lkbpcFctLVC4sVVyIfjrD7WIalw0AAy+8G3nLf
         rSwJ/VqqvtmwQ+b/vkMcDFw3N9dSrXka99+3Xr4w5irgqrXgEEfXOh3CmGRdb6yqaZU9
         WcD6p/IU6Xk9xw6lBZ3+r5X8mE3fJH8mfOjvOPv8tLlytCIAIKmlDoLG21mHoXMKy3vH
         y9ijPBwKagCAS6WxoOnHy+7TIiBu8aDA6WSgv2XQWbV3DCqdOTkizDu8ojhPwo+2QE+Y
         DFzA==
X-Forwarded-Encrypted: i=1; AKwUvByAhHH8QjNiNpzF8c42fsat0QCt3BNIUKvxPOOyv+qIpNE6hR2b/eTp8yCPJ+UtoQ4h66N49VxWCPXimjQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCrqCxAveW9zVTr46JD454z5TEWEub6t7ZISWvHFFQ5OXWtZHc
	VzMgBZDygPINc11wLdE++gv/bSJl67JOrzq85ii9ILu1Db4zfNMOmI1inPLBkanrJz0=
X-Gm-Gg: AYBFou2wFkymlX24LkBYsBaHmNZbMuuLuBO+Rh2Za7mkDWR1ArX0UHhQBOq92gVSPPn
	lsyg0hJEgAKjRy76vGd42sXxg6aSJ5U/6MBbnxuv/K+4PL3KK85Sb5WFrTNknriSlOySUn7kzYQ
	VV++2t/1fR3T6w1vHsDeS2lFeZ292x2ldbNaCdr3TIxUa6g1gz1TKeiCHrRdDOo8WDwfaSYpDiA
	b+HwfRaVOMnf6uxvoqyPxSugPAmXsBfgkutkfX+pK/qIqBCkDuobyJUPI28h1wkaa9CAa7bdJAO
	2yPKd5ck9K1pL5PeSyQOs8ub6fN8dOHB/TAXwRAdhqr15IQDKb6T2924O0iVEwppMg6hU41CYyI
	WNa+zNPe2U9uU2VZacZS5EcSCgPNrdiR0O/kg8mE0lFyYsyw9HpMDPAobHeWf0wG0x1h3uBsDTa
	va/ONmM1qreMdx4xbFRWJoJylmfEhS8eb2kASxcFddtsCHL5dip7q6K8MukKcmmTd7C4qZ23RLV
	Q1v00EyNMfvvzJqg29fdQ9llEWCzAPXAGSfjon0/vxEDX+uB1sfPGHp8nA/MXAePpIy+AqoOO1c
	IkvTgYhYw+lq4w==
X-Received: by 2002:a05:600c:3115:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4a35ac9f6a7mr113540625e9.21.1793003680191;
        Mon, 26 Oct 2026 01:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm143259045e9.4.2026.10.26.01.34.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:34:39 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matt Fleming <matt@console-pimps.org>,
	linux-mmc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH] mmc: jz4740: Remove the host before resetting the controller
Date: Mon, 26 Oct 2026 09:33:23 +0100
Message-ID: <20261026083323.12301-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

jz4740_mmc_remove() masks every interrupt and resets the controller
before mmc_remove_host(), which removes the card and lets the card's
driver send its last commands. Those commands then run on a controller
that was just reset, and can wait out the driver's 5 s request timeout.

With an SDIO card that cost 5 s on every unbind: on a HiBy R1 (Ingenic
X1600, a BCM43430A1 driven by brcmfmac), the CMD52 that
sdio_release_irq() sends from brcmfmac's remove waited 5.1 s. The
command had finished (END_CMD_RES set in MSC_STAT), but MSC_IMASK read
0xffffffff although the request had unmasked END_CMD_RES. MSC_STAT can
still show IS_RESETTING after jz4740_mmc_reset() returns, so the reset
most likely completed after that write and undid it.

Remove the host first, then quiesce the controller, as other host
drivers do. On the R1, unbinding the Wi-Fi's MSC now takes 0.65 s.

Fixes: 61bfbdb85687 ("MMC: Add support for the controller on JZ4740 SoCs.")
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/mmc/host/jz4740_mmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6a3c26b7c82d..923cf1450de5 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1151,12 +1151,13 @@ static void jz4740_mmc_remove(struct platform_device *pdev)
 {
 	struct jz4740_mmc_host *host = platform_get_drvdata(pdev);
 
+	/* The card's driver may still send commands as it goes */
+	mmc_remove_host(host->mmc);
+
 	timer_delete_sync(&host->timeout_timer);
 	jz4740_mmc_set_irq_enabled(host, 0xff, false);
 	jz4740_mmc_reset(host);
 
-	mmc_remove_host(host->mmc);
-
 	free_irq(host->irq, host);
 
 	if (host->use_dma)

base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
-- 
2.39.5

