Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CCA4398FD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344136; cv=none; b=iFuG5sZ0qx77QK2Qx3W8k9Jt4FWSLcHGXoJxy1WNrMn7Og7uvnh5MrSjBhlJaqNLClOKdCENcmNt2n0naQMJvGYlNeGhYEMKXnEGS1T3dVFrk5H1Dx2t84FKzp6or3BREP8o9RBzgLsXNB6/GRxZNOTj2rKQ3JF+1iyrVWHrl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344136; c=relaxed/simple;
	bh=CQGqaHstw50mvsxoLWvDW59yPPK1sfLS3F7EUEGmbcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUd7Ip65AEQAJPxPSOu4UQdSkh7p5g7v/bQohPp7fXNBFopL5DBodVIvz7Cz6xSNraWod9WxCzcAt99qnP9N8SbYfT8P2RwBB+eELtMVz71pJpkcew912AJrY8Dye3xRxdNsKOxHmolVNU+yHWpx4v34pgmlmk59ESfUGBVj8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YlAK+Kzh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YlAK+Kzh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8687630fso6545765e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344132; x=1788948932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA/vjABT1jnzam7kJz2zSU4WQLgLEnlH7iz/BFpMd5E=;
        b=YlAK+Kzho1JrBx69SQlHxmCGwOZ1adz9pDR8f61580ZG4iJ5eyrXFmeL7BvIMC9mpj
         68AIrVfacE1dSJU/DZ0jZ1L7Tpk15HcrG0yZ8N/sEPvVipTheM/w1q42HcAwa6k/j87q
         2jSCNbPsgb+Ckr+zTFxSmAgIglTY+OP6msDuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344132; x=1788948932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA/vjABT1jnzam7kJz2zSU4WQLgLEnlH7iz/BFpMd5E=;
        b=PTY5xoVNwpbQ6Yd2y1D/duClZLTbDXwNvVOf1zD1mwfor6LHEwp+ivzmh0LMSS8fQ/
         ofZWPH95tgXXbsOVDoVEwf/eFTUJfh1MVZ+1600lEoIncK4DDLrvWqUy9muQJ4IbA+qJ
         OanEXnxX+gsnuSwIop9lNNHZ1Lcyj+Ab9ZYYU98oTRMV7Nj6K/1sIB9sIYtSsg/+QSvs
         VNXSVnVe8YuUbl9siFlXDcmjy+Z0PAsKxt5O73GqKf4EIgXuUHPPInjdq20iBRl7GjiK
         l/u6B1/RPzJ/2BA4gNBPd5LwyqWbU9Dg3LHAeiRKU7w6PTcUSxr0hm1oyF58t9F/i2QU
         R8Mg==
X-Gm-Message-State: AFuF++kqbjTAgqXxpHIV35a+aBhSZDy6BXdbXESkwq4J7aI/TOUhmZSr
	y0o5LARzv4VM8hQYjrECOaHk0q+VKbykf0OYlp6eQ4QnRKkjgNIYS22kHiL2wjKeaPR7yRuFGOT
	dkgfsCxM=
X-Gm-Gg: AR+sD101j9rSyzv8ER6Cq/VFy6j4njZNA8sIWFJ9wgYArs34E5bhvNtBXVF3lVei96E
	IFIAVXqvoxsqUuHAtcO6oTaVotXre1vqOjX2Oik7UIMW6wQu1TODNZDrwCIJbCivczsHonnrdve
	d2vUbFICDM2S0Cnuxtfbdy6vQ0y7LpztHq/1+W/YJs81faIhszqEPQFFAMQVw+IcqB0ZNlBYIie
	W4Rqj+hGg5t9/CCFwEcM7uorUMj7fkNuyMJ00g8H9cyjdDJIB680MoAifzH8DLX3sLd9eRAEXWl
	Mc6D0Yt2KU07lgOUrniBhWHAVviIi/vrv36EnTzu0xZSEyG8j/j/iZIbvKNV5v0tmsOLfn92chk
	KC0LyZ8evrGYq2RnSSF/tqSoWVF+HC4nWZbWNBFPDVXCeSuv3h0zMcx3XKhyXRNW7fWUO6ydu+g
	mImYRxNHtGceV/Q0d1e0ikz+6ZxLV1BfPmByk5oU+FoEbzPsC6s9x9GE58pLjBzcwgi5FuGqyjI
	ybt0XHK2W+iVK+A+6SpTQth5TdkyY6VPAU2VCtmBzQC33MnFvAbGOWNFWZ/CZEuw+7/dn326wr2
	8LaBW4omiejHHl3u7DtqeJvH8sBE++QjSYXNUboNraRLdkzIGxUBQwuJh79jVA==
X-Received: by 2002:a05:600c:310e:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49ce55906cfmr48006695e9.0.1788344132449;
        Wed, 02 Sep 2026 03:15:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 1/3] clk: scmi: fix SSC permyriad conversion
Date: Wed,  2 Sep 2026 12:07:33 +0200
Message-ID: <20260902101515.167819-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
References: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding. The i.MX SCMI
OEM extension expects an integer percentage in extConfigValue[7:0].

The conversion divides spread_bp by 10000 instead of 100, so any valid
configuration is truncated to 0 (or to 1 for a 100% spread) and the
hardware is silently programmed with no spread at all.

Divide by 100 to correctly convert permyriad to percent.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk-scmi-oem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..3e56e91ae68c 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -44,7 +44,7 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 100);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

