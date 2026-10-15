Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576754A7E7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083301; cv=none; b=mZ5oIInJZyg+Kmbyhb0xdDAyaLWZ/Zu/EsScxF9hMCc2833a/Wk1UtA8SVUKtFJdU7OphXKRQjz5n5q34QaJdxoEVRgkT5aBM0ej5IQ5hIMlTsPDzSDsYi99T7Ab3CjRVDAu42G9DA3rfYIVftDpNuqY6nlUQDMZbEq7acD0hTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083301; c=relaxed/simple;
	bh=tZS+V0XYmQR/33FT7lz4yE301PBro4nxTrz0wKP0eVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj7odCrt3L8PTwF8ConW34rkMmY0p8nBpfa4VE4p85EqBdmJnfwJ8KgOpD3/OyzAA+unq/WD1Hvv78Se8X26ae5chc0odGAqXSnpmk3Q8rhypZyaQmd6mFY+EOySQVD8RzxpfJ7z6v5OJa1u0MQkiAvQDeF7uRVVSNKKwW8kBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FE8bMlew; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FE8bMlew"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c5358fc28so559170f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083285; x=1792688085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8Z6aSQnXT/0lTDli5ZKb3QSabz0js/0lenkmcruU08=;
        b=FE8bMlewXmlKmKjs1iQVQzu/U35xnYtzfD+H/4z78UUWXI9AiGgFZIkWMuQ+CgbLPt
         cnzI0M8mdngdg/EI0VFsDHVlCVolPGGC52CpXRp7mLkEkMX1/G7SkE6m6Y4IAj7VDfef
         IkXedeabUma3bkHXSa3Eaiidqqgl/oNhKXRVNHFcc8cH5laRtMuwfJ7HD2CwELa1adPA
         d2hnKED561tH+nMYNDZizJLd3MJ+kuQoz74h9mexj0RwxoFvZUStehscdSeqyW9hUKt4
         mFjqxD4ZQVAw0/OAEGX8tHx/1C9bpU4NHkuDKxSEXlpiCaMck9g389GzKgRqQ/4bntfx
         5FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083285; x=1792688085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8Z6aSQnXT/0lTDli5ZKb3QSabz0js/0lenkmcruU08=;
        b=SkOG7W30zAbI9H5Ge4jreKF7m3fLkA2t2QqhUKt4UGq6AvQkwwyy0pkJTVjlTpMrKS
         DXqYWnCw5unJJllH7kVsECL2aGYNNpZdRQDydtAKFXQC6fW533/3QplZD5ob9YGxU2bR
         8esuHWxvTvNm6dhwdGRTm4hQabHMkbKhjk2FOpFjQHBTEm2JcObVWiWuaeXUIOMSu5uA
         Tj8QDKMxLf56MNcVKWcRxeoe5HsjinF/m/vlWSHzYeFkk9yY+Ttsa8zGwgA/Me98dL7S
         Oa5poLq63U/5e5xq4AqDVZIRCxu2fh/Vxtz7nDraGWDyuMiE64Kl5DlEvkAagHGKvw9O
         29bw==
X-Forwarded-Encrypted: i=1; AKwUvBwgqVMYIYlsDxVwnp/G17opm7V+oLYB3DKQhCJWLta4mX3M9QtUrNRQFQzBWUkyuTouorpaEsGnEApLBq8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYsBXsB8QvB98i2JZ3mW3m8fNN2tfnp3sh2WXVbzH7o90KP3gz
	TFMoDzol8j4iERC0ztDV4DwJSeWYPRYD6MbCRtnrkRUXf/bZiNKNCq3I+4qdw5iEhJ8=
X-Gm-Gg: AYBFou0OQXVgP0rvmq9ZeMl8f7paxX1kVso7gaoikQWEMKZ+QEyykO3HX2QxOAux5W5
	xqQUJSdr/wIyHulizpuSEQF6fjAuyKYeHdSlKdfO0N/wHF1Ci+5fo9Ceb4Mg2o/DmVmykdCBIDJ
	UvmvtNeJAECgynjUBOln5JyJ/9m17FI+nuSPKGwqI3hL7XbVQ3MmVPQpmOHVX/srW/C8EcAXrd1
	ISkzwkrDnciyqNbJ6IpewWJ9scv/57NVaYYjaQutndn6DL3a3+xc33xYk75pnEwluT0Rcg2CVAF
	BBeAPUKawNdkopfLWHf8HaDUR5r6CDfkEAFbnP9BoMuuWrhNjtUEhIud6IxTkVwNZpstZwmTD/8
	tx/OehPoR2gBYoEx2UShyx5h4a87hA0lTMyMPstf196KlHgXANuqTpQjonmjDlAPDIJf0aa1OUP
	Zo4de9tdweeQtXcBEKTByAa7yAFGohsiC/5qfcrfsMplg6V0vpmHR8xYuhaRvNIO3Fs46pucTJm
	YOc2dS1v+vRAqd3H+G5YJlimaEfDopUvklhBy32669ORVemZkq5WaVRYDcwESlpHlbgtg==
X-Received: by 2002:a05:6000:46d6:b0:48d:c20c:cc4d with SMTP id ffacd0b85a97d-48dc20cccd2mr21863604f8f.23.1792083285166;
        Thu, 15 Oct 2026 09:54:45 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:44 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 15 Oct 2026 18:54:30 +0200
Subject: [PATCH 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-1-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=2116;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=V1lJHYLAgA/nBlfBnu6hravYqMFQUVNrtE+t8AZRuXU=;
 b=Wl37l+fJKC0jK9zAPXXOWj2SG/X4dwbai04ly9CrEmdpnrWfIfzXaNzQvDyoVeVdDFxEhCdIx
 raOlehQINIZAcIxEa5JqQf3TA0zCfLC8m3u9b76SzZaqMAJeDGcprvJ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. This change do not affect other SoCs as
the only consumer is DM816x.

Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index e54b1df3436e..ae2f6fed10f6 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
-#include "clock.h"
-
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -541,7 +539,6 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
-	const char *name;
 	int i;
 
 	fd = kzalloc_obj(*fd);
@@ -559,8 +556,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	name = ti_dt_clk_name(node);
-	init->name = name;
+	init->name = node->name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -592,7 +588,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = name;
+	fd->name = node->name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -639,7 +635,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, name, pll_clk);
+						 output_name, node->name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 

-- 
2.56.0

