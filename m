Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260452;
	b=o+0E4A07IrOV90IiwJLSlMHSzhjSDkIDGzBWE45wUCazJerdRZ0s+g48KqDRwN4Y3tfp
	 izrnWo2DtXje1Y9f2ni5ae4apSna3OZgnSj1UJrcf0xbMEybHcIVPKDGik3DvScwSde8t
	 R0DU+ZtscLEkpQAgDN6XV5yinjPl0yp0UD1vyyl0Ys8Eh95EozYH8+AU7jFObCuDQ2p5g
	 sNASUkK+tY6FEBgrVOjTMwsArssBSBSflTAQQGyiEbwPv31YCo8ARsBMP+aQTELfKVrn/
	 uRGIX5xwmbD4ZlprYkG77OSyJl/vqbXNGiUvQgZ2zIqHZWVgnN3ElZTRbUgV4T5VklA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260452;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=VUf6pirEjVKWXSV6eoMTFfCl6PhIrH3dDf7BDcvNx58=;
	b=irywYuaS2MqXb9tp3jsAPQVahRaUDpC0BQHp21AVTVKbNWlMoxAv7rILg3n8LHAbnQ7m
	 8VxKRf4g9A34DyXOUPdtuPXL/dHUEwPo3+dIjqZ46jVgLF36Q9wkTjq9cg4ddRA47TQIz
	 jZueNs2PdRPStuyQMCWZaLkm678cmId1/I9feWCwvrk9BcNdZTzm78HvlBw589A4VBv3y
	 Cdd8GwqNmlvRTmi+mPKn1SPHBlUqwQTf1NOYr7R6gzJSkvlqAo2380CJzzsfXnRUB5Mvr
	 EvNGwni5IHh94PCyCwwXMMj2OqqeDeHxtDqQuMteUbtdJaMnxEoXvUWvHwG0B4stTlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N032BJUo;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070C60A2625;
	Thu, 29 Oct 2026 07:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9070C60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=N032BJUo
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261029075409euoutp02b855b80a46c4b4b18ea7eaf50aa85c9c~i8ODPhdar1681416814euoutp02W;
	Thu, 29 Oct 2026 07:54:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261029075409euoutp02b855b80a46c4b4b18ea7eaf50aa85c9c~i8ODPhdar1681416814euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793260450;
	bh=VUf6pirEjVKWXSV6eoMTFfCl6PhIrH3dDf7BDcvNx58=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=N032BJUog9s85pByQOuKoWg3zwqVJkp/mb+oifJ3Z1T6pQko+CPwWX8HWWP6ABn3z
	 JtKA51A6gTqmb9pd9IwDkMbw38lXvgqE4099EQ4uIJgB5xB8BX0DPCN1TgEc7IOgsP
	 fgwTcClkH8fdvOsZUcGwuv/9rDTSantPN7AKn0bQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075409eucas1p1f82d0e8137d96be1cb3d4ed4d9fd72f8~i8OC_98aX0265202652eucas1p1u;
	Thu, 29 Oct 2026 07:54:09 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261029075407eusmtip1eb88655d3a79d270d1d9bfb4f27d31c3~i8OBTSl2n1410414104eusmtip10;
	Thu, 29 Oct 2026 07:54:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 29 Oct 2026 08:53:44 +0100
Subject: [PATCH v6 10/18] drm/bridge: inno-hdmi: Add .disable platform
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
Message-Id: <20261029-jh7110-clean-send-v6-10-759594e43acf@samsung.com>
In-Reply-To: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
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
	<u.kleine-koenig@baylibre.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=YBj9u503PE/+OydVIiQRst98NY7tcT/C1tb4fydwQkQ=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9+t1zM+y02dGDl1+4tvOk2iRbLP4xZ4IJo3t59JZrF
	7r01JVrO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEHCYy/FOXu9v5OeBR2aqY
	o/djFs2SvvfoduwZq8XFebf9v3RMnPWJ4a9s1brPbw5kiXySUjyTNyX85re3os/8H+xVe11lPTV
	Q5w0fAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261029075409eucas1p1f82d0e8137d96be1cb3d4ed4d9fd72f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261029075409eucas1p1f82d0e8137d96be1cb3d4ed4d9fd72f8
X-EPHeader: CA
X-CMS-RootMailID: 20261029075409eucas1p1f82d0e8137d96be1cb3d4ed4d9fd72f8
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075409eucas1p1f82d0e8137d96be1cb3d4ed4d9fd72f8@eucas1p1.samsung.com>

The Innosilicon HDMI driver supports platform-specific behavior through
the `inno_hdmi_plat_ops`. While it provides an `.enable` hook for
platform-specific power up sequences (like enabling PHYs), it lacks a
corresponding hook for power down.

This patch adds a new `.disable` op to the `inno_hdmi_plat_ops` struct
and calls it at the beginning of `inno_hdmi_bridge_atomic_disable()`.

This allows platform specific drivers, such as the StarFive JH7110,
to implement their own power down sequence (e.g., calling
phy_power_off() and clk_disable_unprepare()).

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 ++++
 include/drm/bridge/inno_hdmi.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index a8905bf627a224d7e3918514195f1810164dc26f..708d4c03f8880429f99680abd0c92e150312237b 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -886,6 +886,10 @@ static void inno_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					    struct drm_atomic_commit *state)
 {
 	struct inno_hdmi *hdmi = bridge_to_inno_hdmi(bridge);
+	const struct inno_hdmi_plat_ops *plat_ops = hdmi->plat_data->ops;
+
+	if (plat_ops && plat_ops->disable)
+		plat_ops->disable(hdmi->dev);
 
 	inno_hdmi_standby(hdmi);
 }
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 507d5e999183ca02e7dcbe4ce7568acc21426a89..0864f0d8862a4325821a84db6d04f14011d9aa78 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -16,6 +16,7 @@ struct platform_device;
 
 struct inno_hdmi_plat_ops {
 	void (*enable)(struct device *pdev, struct drm_display_mode *mode);
+	void (*disable)(struct device *pdev);
 };
 
 struct inno_hdmi_phy_config {

-- 
2.34.1

