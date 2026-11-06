Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973553;
	b=xobaeMpES+53Qvv288uwAs8u/D7V/R4WAg9yLhrF4YjRIr2rRn96CN1qiejGEijwDIkW
	 GfcuGLv6wm0ZZZgYobD5aKMuv2h0DR8bZULgheu/xx4wM7TAEINmekAeFwFFrJUUpbSKm
	 1c0eSKoilWPFiQ2HQXwDBzuVca3meJMMiy9Mxe//5MqKOydcLVVMUlO4YYsEBYh3EHlYw
	 k3ojk7iefjka3t35f/Jg0X3RoZxDHBZXNjhnoO4LZ5Cenfp/VScDOJ7ySdHgFvEE8s8yb
	 wcu6z8HQXYy2trLDtr5R64yN24sg53yWY9QCXryLAq0yzKpKr2APELxjAu+6DTepKiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973553;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=HBvqDllL1DgtfKmO6o9tLbopmL91RdeXHJOggSxgOag=;
	b=qqGwWOXCTfnivlbqCK25vgJnM9B/cUpI/V4WfzShngqKvDW4Y1jQnnmAsWzQKrHQJhvf
	 b482wAJUoOjnqmS1cbkne9LQnwgyt6LCx8PLuaJ4BBnM858L5/djJH3egxXpbmCFH+Oyb
	 BmK7f0urlVoCtaDM2tcyi/BmyexR4ViivY6Tmk5aM1cIdpli1X984aVVzEWEFNFzGydc1
	 EliKUhXS9RCi7bxhjus1Th+wNE3asl37VSya+reM3YjDJc6eviysUSos3k8MBnz1rsJwq
	 SfyjTOiby1RMLiGujqqhVpZfqC7r+v6GUiUnirBc1eu2Bd9VtHF9W0ahqtLfLokDkxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uOB4Oemg;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC7606EE9D;
	Fri,  6 Nov 2026 13:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AC7606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uOB4Oemg
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135911euoutp0298c83207c654b213b1f8db795618342a~leXCk1QAE2476424764euoutp02d;
	Fri,  6 Nov 2026 13:59:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135911euoutp0298c83207c654b213b1f8db795618342a~leXCk1QAE2476424764euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973551;
	bh=HBvqDllL1DgtfKmO6o9tLbopmL91RdeXHJOggSxgOag=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=uOB4OemgZEUv2m3+KhUBGeioLtBqB8WudZmuQpd8hN5YdcTKyZ+MI9RDLFvaPLmM1
	 dMgogziH1BTjjHkXK1+beqM+lMmYJpCWarjxlltO5sAsMvl1TvgDOPveQFRh6fP63l
	 zMrAY+ViXnapAgC48ZflMotBHPQSNjSk3yfFBfl0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135910eucas1p2a31e2ed16ef7943a93a53077b539b1c5~leXB9gOsC1707717077eucas1p2D;
	Fri,  6 Nov 2026 13:59:10 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135908eusmtip1edeed899da1d4abebba9d6db59fb9bba~leXAJORec0570305703eusmtip1z;
	Fri,  6 Nov 2026 13:59:08 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:45 +0100
Subject: [PATCH v7 11/19] drm/bridge: inno-hdmi: Add .mode_valid platform
 operation
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-jh7110-clean-send-v7-11-68f7ea9913db@samsung.com>
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=dFv0+hsZngN3oy+e8lKnjcxriAk2ZNWat+e8VIwF7Rs=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSve/G/NvgkXXjtnrhfvfbdM4IXkMt8wztfrb73bt
	f9IZ0Tq145SFgYxDgZZMUWWsxujjST/MTwtP/74F8wcViaQIQxcnAIwEe49DP/D2yJmzzod6rZy
	VcOz59+ezBRdzvmq+sJLjlkTls1KrapkYPjvfUfxwO/jP7cztpt6/BSbqnU8Lpx7adcyi3gV+0p
	P41Y+AA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135910eucas1p2a31e2ed16ef7943a93a53077b539b1c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135910eucas1p2a31e2ed16ef7943a93a53077b539b1c5
X-EPHeader: CA
X-CMS-RootMailID: 20261106135910eucas1p2a31e2ed16ef7943a93a53077b539b1c5
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135910eucas1p2a31e2ed16ef7943a93a53077b539b1c5@eucas1p2.samsung.com>

inno_hdmi_bridge_mode_valid() validates the pixel clock against
hdmi->refclk, but that clock is optional and is only present on
platforms that describe a "ref" clock. Platforms where the pixel clock
is produced by a separate device - such as the StarFive JH7110, whose
PHY is both the clock and the PHY provider - have no "ref" clock, so
the check is skipped entirely and every mode is reported as valid.

A mode the platform cannot generate is then advertised to userspace.
The subsequent modeset appears to succeed, since the atomic enable path
cannot fail, and the display silently stays blank.

Add a .mode_valid platform operation so platforms can reject modes they
are unable to drive. Platforms that do not implement it are unaffected.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 9 +++++++++
 include/drm/bridge/inno_hdmi.h     | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 6d2756c36ea22e704b3350e716bcd2f55b79b912..3219558d6ef4198c5f81dbe51b242a2b0eb0f37e 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -819,6 +819,7 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 							const struct drm_display_mode *mode)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
 	unsigned long mpixelclk, max_tolerance;
 	long rounded_refclk;
 
@@ -834,6 +835,14 @@ static enum drm_mode_status inno_hdmi_bridge_mode_valid(struct drm_bridge *bridg
 	if (inno_hdmi_find_phy_config(hdmi, mpixelclk) < 0)
 		return MODE_CLOCK_HIGH;
 
+	if (plat_ops && plat_ops->mode_valid) {
+		enum drm_mode_status status;
+
+		status = plat_ops->mode_valid(hdmi->dev, mode);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	if (hdmi->refclk) {
 		rounded_refclk = clk_round_rate(hdmi->refclk, mpixelclk);
 		if (rounded_refclk < 0)
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 0864f0d8862a4325821a84db6d04f14011d9aa78..790633fcea97a6b9840da7b19a0c0b0d7271fb83 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -8,15 +8,18 @@
 
 #include <linux/types.h>
 
+#include <drm/drm_modes.h>
+
 struct device;
 struct drm_encoder;
-struct drm_display_mode;
 struct inno_hdmi;
 struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
 	void (*disable)(struct device *pdev);
+	enum drm_mode_status (*mode_valid)(struct device *pdev,
+					   const struct drm_display_mode *mode);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1

