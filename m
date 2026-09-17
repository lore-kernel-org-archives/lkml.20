Received: from mail-oa2-f21.google.com (mail-oa2-f21.google.com [74.125.231.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9050B41A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789667728; cv=none; b=u/Dm2AJevDNF2/gPpS+iQ2U9oeRhdxRzd+SWsxkYxa+l0++NYoA2zJQJCC+uAVs1hAFkGxqTsp7SqsBnvOy5QHX95I/PF9OzjKLTGqRTI9JdAJ7nHgJxn8OQTePyK5bDkXV55BgjXqBR91h7oKFXd1lo7XkVYkw5+oUmy2nT/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789667728; c=relaxed/simple;
	bh=TBZYNnslEgmqiIFbP9mDmQG8f/Ol4S/uoq75IjbY8ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8RTeu5BQXwLBYe59QZiNpNJPyn4oC9fNKmwW6KmED1Y1zMGQirGyb55LfazZNjrCELi38dKN5ku4T/pD6TGV270miJrqn2hpV1wtEX8Tim8rrrPXLuJDkRrmA5mCkL6lnPjudgDS+PHyTTIzprLz0WIetMvcHKwzUyaPvks38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT5I6qAc; arc=none smtp.client-ip=74.125.231.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT5I6qAc"
Received: by mail-oa2-f21.google.com with SMTP id 586e51a60fabf-466ccbd4773so446391fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789667725; x=1790272525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=nT5I6qAcfjrnW1Cn9I2u45erGUmT77vai/y0vAYBGJDagsAp9veTcsk/Azx87LFug0
         cl4MRzR9NoGJSTOBHii0lK/OovNpQI/wJvdA+GYjmuqASYZeXnAasrO5hqnOrag+drSY
         6TYVr8GTYNaLHQsnpdfuh5LRCdpw9vx6vIRMH3rd2TIGMEmx900nHc7yX4DTb6wRyQcY
         H2LHVaqXJ4y8ERUN79RJRld5BRu4lC8/qOgioBBjI0WpmfugC6vaFuZu5bdGKpNYUtgH
         NzVOCmcXiYGoIKzYYGke2P5Bv+ZtHz63XLQ2V1aMIvGCneCqxQHDEcbYrQ7qzs1diZcG
         V49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789667725; x=1790272525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phbcC86CmmKUH9rw46P9WlcsDl/Y5d267n36zdxy5Pw=;
        b=jBFrs6T5u6KKPCMbHqrNlKAauLqWVfwclc0ZOmEy9E7D8SsMVTSTaFWbh2W9J7cC2p
         cdyV3oSPXzl9r51HGigMbpUBWhnxpDMqGbf+HmFJjHezp9+n3XyGxjsL/EvBDhvUvOtq
         y5lszROT/TroWZ//jLU6TP9ZNRjkbnQKcUs2phlPrwORm15B0rJRTypDmARzcI+GqghN
         EoBWmZWp2sJx/TFSK8EmMw/6YxBq3EwXcBvQeCNavNGf8/A8wxLdWo2N+vOfKbgKhHp1
         AEjJA998RKRqsG0zP8TRuCpTiB4ydMECEn85VATmJhy50bzaoZuPzHZl4xEa+YMW6WS4
         ooVQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0Ztlehr8luHR2e0KdAYz0UM9DO3JUotRysTMxLJpsJLQbRQHxTnxK4IZbYOyi9RZpEQG634ky/VsOXuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n6tNr5UV2jE77AALQL4nNFb80ppgtbMPKDcxqPnurPCalfG0Jp
	eBuK/wV9BT52TWZnbvVvU4ocb6AndnYFyQGN+JL/eeFb2MgfN17g2oFe
X-Gm-Gg: AYBFou2EiEZCkh60HZJtHlpeqpTzBMGaVMZOm/cThkVDVfapjEryDf+06wLp4PRvuhL
	u7vXy5KWf8EHFqa0S/NbMlEQ1fhuMvajQFHauXs+pc8f1md+Rc2D668Pgtp9KV6VBaLN2xFqI3L
	5WU57B2f3Em6UAk9zV8FwJZcn/8M1gIdW871xODfyV+RfpHym2de95LU6Yp93dTNp6btG6JDmu4
	VdpZInJCStzzK3RDKx+Yi51QZPKNGUU7rdwiTOq8uIRY4sHAjhqFABAs/GjGeeDOYCmmmm4XS5H
	8siVisoTTCvx+h6kzyoMan1sa3LRoOzp1nqOpRMr+qhpZrLzrlCfYwo5YIf1GkyjsMSv7ohCjKh
	xWefe8mdy2eg9kTJPy8swWuggWPDIKBnz94q1r9zp1TPe4gNpMlSxTE/YI405aMGM1vVba8t+2e
	0KBg5qYP4YQO5BVT+y8rZyRfvEtvev/Ms7hZWfp7h4GvrY8MvjjwkbwfQ0SC2+LD7SyhOUfh6c8
	8gzhNvj46J1sY2ANsfrvBJngyHZpESdlLOkgXZjXW9mGR5EClYASqR5VClN6mvevqQjFGiSpGuM
	0Ef3UFAsqhSG5XDCUUSj4N+HNHBKvuBLiR0dpHdJ+exQaHG98Pry1Y3/qOs9FVFiOohm7NRJf1U
	HpQC0QSM49txMnfc8el5S
X-Received: by 2002:a05:6870:1696:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-484752f7f6fmr6824911fac.6.1789667724804;
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-486ab6c1f31sm578446fac.10.2026.09.17.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:55:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 17 Sep 2026 11:55:14 -0600
Subject: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4523a14f5e0c..1020168f1c3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

