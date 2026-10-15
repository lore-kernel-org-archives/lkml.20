Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7D4F68A4;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102837; cv=none; b=AvUX/k8wCGpZtYMQE86bUJLPXsQoMQZ/72/7rvLnhXZ3v8JHDYgY9Ex0leeo808uEtGRdI+KU5g58STGT3EW3zj5t9qlXGUbpaMFGFo4wijnn8pltL4Akpz8i+eMLjauscI28V8Yexvh8HDi2wRL1b/fArvoHnZFkyIMGD20pLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102837; c=relaxed/simple;
	bh=uJOH69sAakDOgLkjFww6q1aB0GM/pUFm+9OqUgtS+X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkiJUNCpl1CJSnTpwLzCTsPnWzzX/ppi+6h3uILK2vwz0Cy/LdEvekllolurJTeHbog1mmvfgp/MTYY3YNfHJNNfN5wOpo+PhLCuX3IiAZJcEYzqU6+tbeLAofoZEBUtzl3R0Trv4imNVbGuzKCJrsLK0DWa+/thh5+UtIoYOjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVBlvbM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVBlvbM0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60E0AC2BCFF;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792102837;
	bh=uJOH69sAakDOgLkjFww6q1aB0GM/pUFm+9OqUgtS+X0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qVBlvbM0QCZA1hyi7SsFVlyq9jBzUcMCCdiS5YKEE6v+P8p96l1NXMyaww73CL1Dl
	 oCXkaaajeYxtKJuaSxuNjwgrDQfr3JEJyMbkfu30jbceSU1OJ1kSMCvp3lIx5FBxB/
	 RJoM+ww8nx+Df2Zf0ERBW798zW/pL500mtkb6TZhCUEzkkEb1IJQuJV6UwihCfNjAD
	 Fv/YMSt4BgAgtVVTLcWTQJOEHkht05tWSE7XhHAQf4FmLRco4O8wRA/E9cNiucyUNj
	 WFjlCMNjBw9UZcCeylo4pcuWxDRhC7oQxN2uyQSKjGlF6USG2tri/h2aWEw/OWdZtX
	 tgfFh6vzmr1gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC65CCA465;
	Thu, 15 Oct 2026 22:20:37 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 23:20:39 +0100
Subject: [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the
 PHY API
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792102835; l=2783;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=TrW9HxBrbhZsq4EBR8HwxBI6x1lIFRbaMbGLoCMihE0=;
 b=mJbdWh87bdTZxwdovvLTqT1YLJZ7GTzTkFuy7n1Fo0lK2PcHmSi6ZNJiatw1CZ1+XFqmUzbnx
 TMxuPnShS9mAAS0QDBKLz7B0ltv+BOS6zCLMUCYQUZ0NuIBW17icFpD
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

With a PHY API CSIPHY, csiphy_stream_on() always asks for D-PHY. Ask for
C-PHY when the endpoint is C-PHY, and pass the trio count and the symbol
rate, which by the V4L2 convention is twice the link frequency.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 35 ++++++++++++++----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f44f2aeb9..8e1b4335a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -329,17 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
-	struct phy_configure_opts_mipi_dphy *dphy_cfg;
-	union phy_configure_opts dphy_opts = { 0 };
+	const bool cphy = lncfg->phy_cfg == V4L2_MBUS_CSI2_CPHY;
+	union phy_configure_opts opts = { 0 };
 	struct device *dev = csiphy->camss->dev;
 	u8 num_lanes = lncfg->num_data;
 	s64 link_freq;
 	int ret;
 
-	dphy_cfg = &dphy_opts.mipi_dphy;
-
 	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes,
-					csiphy->cfg.csi2->lane_cfg.phy_cfg == V4L2_MBUS_CSI2_CPHY);
+					cphy);
 
 	if (link_freq <= 0) {
 		dev_err(dev,
@@ -347,23 +345,32 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		return -EINVAL;
 	}
 
-	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
-							 dphy_cfg);
-	if (ret < 0) {
-		dev_err(dev, "Invalid config for link frequency %lld\n",
-			link_freq);
-		return ret;
+	if (cphy) {
+		/* A C-PHY link frequency is half the symbol rate. */
+		opts.mipi_cphy.symbol_rate = link_freq * 2;
+		opts.mipi_cphy.lanes = num_lanes;
+	} else {
+		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
+								 num_lanes,
+								 &opts.mipi_dphy);
+		if (ret < 0) {
+			dev_err(dev, "Invalid config for link frequency %lld\n",
+				link_freq);
+			return ret;
+		}
 	}
 
-	ret = phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+	ret = phy_set_mode(csiphy->phy,
+			   cphy ? PHY_MODE_MIPI_CPHY : PHY_MODE_MIPI_DPHY);
 	if (ret) {
 		dev_err(dev, "Failed to set phy mode\n");
 		return ret;
 	}
 
-	ret = phy_configure(csiphy->phy, &dphy_opts);
+	ret = phy_configure(csiphy->phy, &opts);
 	if (ret) {
-		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		dev_err(dev, "failed to configure MIPI %s\n",
+			cphy ? "C-PHY" : "D-PHY");
 		goto error;
 	}
 

-- 
2.53.0


