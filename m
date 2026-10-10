Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF9494800
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633370; cv=none; b=FSBVpkwQLSrMjmk/OI2vlhWx3okO2BtrGILQ+D7SQPDPjSxRvXyHHDHe3zk2rcxmPX9Llrg5BIDI4VCdd3dwLDHgQ7bfy7UtsnOxWfTg8Xu+orDhkjGtCAV/IWKIyyVxbJ7llEx+X15X7OzHrGa4PjCpqbULsMK+sz6YfwtPn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633370; c=relaxed/simple;
	bh=oWOjt1/BP/ZrdTdhWqbWJnrKsyEqrYi+/tyFuMPW57g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODf/bb0rFJhkE4ipA14H8jwu1AmbQ5o8UU0Cjzwhysh6nCeIu5lzCoBhWv8CNRwN6HNbiUS5s5uHlgSnee+R6wsA6m4oFrCJ9+tKpmL0IzwB6tSTzdzIh52/WFI/9STYUejBYIzllseKcu/L4LYt+588oyMb1ae8dA5x+BmejYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnmrbSx4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnmrbSx4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1849350f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633365; x=1792238165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=UnmrbSx4gwCsF6GeA3tG7jLc9IjrJin8eP5Ex1FFWcTOsnL02w8GVhG09VYoz/vRPS
         BKfUIF5k+DD4gOUmz2TTfxUpiAbj6ib8uK9MRnEwzIPuuQedEprfE0oPq4m2aMujrkTp
         t6BVKVyjWYCHYv1FbSTH6J0wZtiO7sz2boIuZ+9LFuTKjuv7+z60mRO7DkVk62RJYRHd
         hCBn158uaBHGcYqRMwcUG1GW7cvgtayeUdetUW6P1FpNuhX03vVWfwMyl9Sw4YL7AZNa
         +odSCtIp1DTPqc54Rfad/NUiJVw6658nFgtriLX88ZcOUK3mrmk3UoVYxfS1DQ+V8Ank
         Hf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633365; x=1792238165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=pboHnWsMZ7fXtX2O9oduatLMjfVy5HkIarr6OwtIolkBJAZs30T1FFb4TcCEkvv6Zr
         f9hLGu+6Dn5md1y36EqaB2ayvRkNYDKwOBPAW4SJMPiXZYTF2lldmkFby1en5RS3Gw2N
         VO9jpDey+uau3c5eIL1v+yzHXuIarfIoqsa+YJ36kqt5gz2nAb1jLCGNMD/tsouMp+cL
         riFl41eIHKgivaoAegOIA5QA5d01Co+Q4Sf3Pefpm5+ImzlCanQ+7v1EJ0WRj2RAGAFV
         OCtotoG0TbdvTzjUhAXDzD/BKd80vGn2dGIu7rvorW1h26dL02+O/R22Y2gDFZ+EMhgy
         xvQg==
X-Forwarded-Encrypted: i=1; AKwUvBy4aUFARj14i6soW1VqKJ/SYxh3DGYjD5Ryst5Nlowvel3Sr8a8fRoXGFcVUtbKDv/byHIDsnqV9MnRer4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQOIlhjQfeIGD7oMo47c0EhFc8TYNOEv2xXcMrAhW67C5noEkk
	/bkWwolOaiAUYjvuFFkCDh5VrEMpPt9QHy1cZLHYQPW+dbH7MHt3yFJ+
X-Gm-Gg: AYBFou2y9iiJ69AkVMlqg7/NXSU4kNFfMUnt0AvifkOKzgS3vIOqG6g54wj7nbyZe0L
	xAZc/iLFvPrHumI78kpCxY6LgjLJ/S+/mRAGr7DHFXfKObhJQIcNg9X6WLT1UEH7z8FKerM0Jgq
	bJuQARF7MU2pSbs6XQ7ncSm7yIUWkFw/LluPVoT2TkKlcUDJcnzjoevRFBXjPCpsc7B4OJl23ca
	PZ6PRWlkPFil8TFWgTNU7aa1ABmtgokikgEJbzyeWYWkoD7IpFGmk0oWVI4Chx6j7dMWjSs+rQi
	Tj/FR7Owc/gs/FI7tMz9wiINclospefdBEb9ZVeK3hwBk6Tqx/ZW1i1aqx3KpdDataJxxKgWXRP
	rJxf35M9YhlE/VN2GsmTLyAAfJLte+a0mlaO/xHisCefwl1+4P4aCYdRL2KVXdccn3Mm8s4TxEY
	sMP5+l75XVBy96fJ9PFezzQ3z/IjtOoZVX9x6Z+Weu4tPktrkpEuObWsPmP2H5WhGJog==
X-Received: by 2002:adf:e00b:0:10b0:48a:fff3:f9c1 with SMTP id ffacd0b85a97d-48db9482030mr6898560f8f.20.1791633364955;
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] clk: mediatek: mt8167: Correct HDMI-related clock definitions
Date: Sat, 10 Oct 2026 13:54:04 +0200
Message-ID: <20261010115539.9237-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the mt8167 SoC, the tvdpll_ck clock is used to clock the DPI1 pixel
signal that is hardwired to the HDMI interface.
The clocks used by those two blocks must match and they have to be changed
according to the mode clock appropriate for the display resolution. Fix a
couple of issues with the current HDMI clock definitions:

- The hdmi_ref divider references the same register and offset of its
  parent tvdpll. Make sure to flag it as a read only divider as its rate
  must be set by the DPI driver only.
- Both hdmi_ref and tvdpll_ck derive their clock from the same tvdpll
  parent clock, but its rate must be set by the DPI driver only. Unset the
  CLK_SET_RATE_PARENT flag that is implicitly set by the FACTOR() macro.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8167.c            | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index 3e8611991de7..a7d38c194759 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -87,7 +87,7 @@ static const struct mtk_pll_data plls[] = {
 
 static const struct mtk_clk_divider adj_divs[] = {
 	DIV_ADJ_FLAG(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll",
-		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
+		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY),
 };
 
 static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..a14f0736cdcf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -75,7 +75,11 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_CLK26M, "clk26m_ck", "clk26m", 1, 1),
 	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "clk26m", 1, 2),
 	FACTOR(CLK_TOP_MIPI_26M, "mipi_26m", "clk26m", 1, 1),
-	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	/*
+	 * The tvdpll_ck clock should not propagate rate changes to its parent
+	 * clock so the dpi driver can have full control over PLL and divider.
+	 */
+	FACTOR_FLAGS(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1, 0),
 	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
 	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
 	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
-- 
2.43.0

