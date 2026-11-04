Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802229;
	b=BWAsTpbZsku9pY5a9pdEqSH1TvMbX44OWae1Tp3uGzHXfhFnE16Vts5Mc0Uh9pruEAj0
	 mXfm5NIoj5gtoNBswaG8rD++JQt/VkutHsRmcrwFHiQBoltpkQcbMU9SQeuPvrw1OSq6x
	 08X0dhR/KXKFSB5xjjbW0Gl7mjoug5FlXCYHhftPTb4AQ8pvVgkT+zMh8RPniYIEtCTBh
	 DV0TXsGrSAY8+0/CiM9bhtEy4S2QylkWhVSrefc8HEAzKR/o3tSNWv/KPMwuMx2Tqt0dt
	 iTqA72fED3EAxCz/esk5Omg5ojig2RCM9Ihv6dvEeJ/7FfzvK7V4UZzIZerXktvZ75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eZCZkcTPfUksS6RSu967x7RWRN9mqW+uEGFex0sWbaw=;
	b=go/Uvgt32EjrxQBQQ/9HrU3vZ4EyGHRyE/LYgds4xLAfxBfB0qwcHDJrxlRrXFYgxhy/
	 WeryBOh869zwsfPr4+OVtqj7heGYBsRu1VwsHbdAfvZTyiUMRsMqhLVlDqgScfXSGPclC
	 vvF8otTtvEHa8JFPXGKUoyx1HV6xLzMl/m6DE4My7BR+0txAaAH7IIiBnF3PZZOjOVmNu
	 oruR+KynTuwQnHpgLvtF7VTsTYQhFVAhp0W5RszNCe6K7EE9YMU0LU+fT+JvvozxIyW+S
	 MU7Uxv89PpVpdeHRDRCWpQRxbmMzECpl2U2Lh4UBXLLN+hmMmu4Yzt0+D0BtUFJaLgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqjT58Gk;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64332606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64332606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqjT58Gk
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso363998a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802229; x=1794407029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZCZkcTPfUksS6RSu967x7RWRN9mqW+uEGFex0sWbaw=;
        b=fqjT58Gkm3M5UGsqH1HwuL1JJdEjOuKUCFsSN1r5FmBZ0UmR7A4yGSHnmPsV2quEd4
         e0M1hyWbVpJq4H7j48FjZaiSy0VjhgB2wjk/PqctQH2dRmXiebqjwN0WJJkxNyq5lnDN
         NlvSyRZNM6+YX/OPnJm1vjIgNT0ejG3e8HqqOwWe+sIhhLt57cpR1hqjLJkfFixw2j9L
         G3uIeX6Kg8d/bSEbO/3GO6XX5IrBgOuy/uhf7oo/DsblBoTxSwZ4TiVbKgbxQVtjcrW3
         j9vcHVxJ64eNeDXjSVGMtgzYtfKItGvvvpIEKl5tnPz8fZEiBuKidaEjaTQWcYu5S+Ar
         NUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802229; x=1794407029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZCZkcTPfUksS6RSu967x7RWRN9mqW+uEGFex0sWbaw=;
        b=jJ3QKZIsfm01axtq7dz6IlL0UY7liW4dMrlJvRFM4i0De4i6fhyyYcQhcAUJRFlWGc
         Ac+RHw6WXezjqPiNpTeHXd8Agg+G8rB17cQWO9zezJ9284pmv1hL2wYs7QfeMKjg6YpO
         ittylSce57EGIXjaSoR8VXQMD+NteBRSY8iW8DHRYKIqKbgy3GH/b7N2xnOtPQlcGR7K
         oKVFlhwUP6If7O2MrSwJljpkH33yNhLmKT9RrXRIxXN2vD0mZvU4NeEYFeQpMSIM9h3D
         yCDIobRa0ZCuemG3NdEfJ4YVnk1pVDDgVD1jWiyaL2Q9fyCdXUqVJBe4j2uRTBis3CGM
         9/lw==
X-Forwarded-Encrypted: i=1; AKwUvBybFhIbAUJ5etLYpUSgDdHvbIE5dx4EetKP3ip/37N5MXfrjjqJsx8HARJFMlIIanfMAmvhSEzrN5aJxHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ldMo2dXLajC+tTkHlxh1NNMHPKbgvi8Nsdj0bWLhr3/mAvPD
	vEPMeabdhYn3rdoHG1ShdtTFs8BuOAYZhNvIiXEsp8vZQTBRr8hW3PLb
X-Gm-Gg: AYBFou2+1FSYXne2uQceCUWQNFVI0kmWk6o+yoiqEDUfB8nbeVbkEKRp7IpJCw0PaVY
	OprE1mcTzY+hYfx/IImmgVoAD4p3Ud99tY9LfrP9oQlBr1mTwzMHB0F76ZCJA9qwzfkcMi+li18
	aTgU1Qk15sy9FkRW+ZTTwB+NSpckBp9uWqVQzMuNGyAos1w+/IaVTPocUcyP111xDclQ03ywLwW
	EQdVfIPZljkFEzkJMi2tkwjMjRCDDQBYlZpMRQwWwJohoRxK08bu24pZXMqAKD/an31+GqMD5qq
	s06WqFyuf+dYwGa4v8B/3MF5cDZZbh2qiWqFmdOUEjtnljf4b1r5zCuGq8VRKyK+iyDNCGlRRfJ
	/iqEE4nP3NTjQ8K+8C6cW9XGpim2i0Dbz8R7VH95RsByhN3F9hiayl8jucWPsxlZF86mCow23op
	ZKUivLtkUF+5bRUpz09LtAcT4S8WYvGPe3W8nEP/NdThSrQyj/LBlDjzYU7i39xw+MlB9MNlRXj
	fSOwTtwWbPUrTQ/cPH56vwrauqAs2Bq/BHRcRvdsSkOUoJfmrLoPwmNKvRbIgC/QLs9Tn2/2rFM
	mneMeCOJJPdPrDnKSe0p0xhx/mT4p/q1uYkm0bOTlg/oVDW25NWm
X-Received: by 2002:a17:90b:4a83:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3ae897c834emr14061251a91.11.1793802228634;
        Wed, 04 Nov 2026 06:23:48 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944d1a43sm4371609a91.13.2026.11.04.06.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:23:48 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: hisilicon: mv200: stop treating the CIU clock as the card clock
Date: Wed,  4 Nov 2026 22:22:19 +0800
Message-ID: <20261104142341.50294-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The card clock comes from the controller's own divider; the CIU only
runs at the rates its mux offers, 25/50/100/150/200 MHz. The driver
nevertheless asked the framework for the card clock on every
set_ios() and warned on every refusal. The refusals are the framework
working as designed: the 400 kHz identification clock is below the
lowest mux rate, and clock == 0 is a clock-stop, not a rate. On an
Hi3798MV200H board that warning accounts for 18 of the 24 error
lines of one boot.

Ask for the rate only when there is one, ignore refusals, and read
the settled rate back, so the divider always starts from the rate the
framework actually provides.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/mmc/host/dw_mmc-hi3798mv200.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-hi3798mv200.c b/drivers/mmc/host/dw_mmc-hi3798mv200.c
index fda417888be9..e64d5bdc068e 100644
--- a/drivers/mmc/host/dw_mmc-hi3798mv200.c
+++ b/drivers/mmc/host/dw_mmc-hi3798mv200.c
@@ -53,15 +53,19 @@ static void dw_mci_hi3798mv200_set_ios(struct dw_mci *host, struct mmc_ios *ios)
 		val &= ~SDMMC_DDR_HS400;
 	mci_writel(host, DDR_REG, val);
 
-	if (clk_set_rate(host->ciu_clk, ios->clock))
-		dev_warn(host->dev, "Failed to set rate to %u\n", ios->clock);
-	else
+	if (ios->clock) {
 		/*
-		 * CLK_MUX_ROUND_NEAREST is enabled for this clock
-		 * The actual clock rate is not what we set, but a rounded value
-		 * so we should get the rate once again
+		 * The card clock comes from the controller's divider, which
+		 * only divides down, so a fast mode needs the CIU lifted
+		 * first. Ask for the card clock and ignore the outcome: the
+		 * mux has nothing below 25 MHz, so the 400 kHz identification
+		 * clock is refused and just leaves the CIU where it was.
+		 * Whatever the framework settles on is the divider input, so
+		 * read it back; clock == 0 is a stop request, not a rate.
 		 */
+		clk_set_rate(host->ciu_clk, ios->clock);
 		host->bus_hz = clk_get_rate(host->ciu_clk);
+	}
 
 	if (phase.valid) {
 		clk_set_phase(priv->drive_clk, phase.out_deg);
-- 
2.53.0

