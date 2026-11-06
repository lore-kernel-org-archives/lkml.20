Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973558;
	b=0T/MUiw/qeXrjsLOJJCcAS7QK1lkmxYmIn0zxInkh5tqmvQ/srCk0n2FwDykNWy6TQXg
	 KSYVNIXIR3cRuX9r1mRfaMWfFdcGA5lJUotTEEeFs5v6F3bwTnIbEPn3NaKqdIv2j6UUb
	 iGWAB+7E4/4TH3rycf/WKwJIppjxIGXtQx4KPmIcatjnVH2d1cS9nyG0dTbxJZjDzBhhz
	 xhJX1lMVT6xB8rvarSVOW6ymMhjpFewVim+H/WXE77uzomtnhDrsBNW4XoCZFSeuIE5cO
	 2lKX/c1gIpGP33AckM9ngWZwOq8fluUpHcgPdg1ydUtQ+w6nT59qTmQTCpFZfPVuuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973558;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=G7NEdkxRN3KpQHJ/gpj/uZSKEgPg9bL3K+UXBDVUEls=;
	b=JrH84hFdGciEtwTIiC+U8/Y18Ni8UCIs41l5kCLkrg/Hm4LwUmPWqWWz3ILo9WbX+z4P
	 YhtWCh+aIs/ak7xGuz9TWTAYWDE7JS8ImwDVxPfLrauHgUt4ZoLD6BiFYxUPTMY7C5790
	 sG2Z4HdO5JvnZ/t37YvBeuWaGpZ84iJmBbzNAmHBv4CDjjwGvdcnWl68Omton4o8hUMtm
	 IGq27vikSHMV/V4ktfRqMkM8Nt+mF4fuUv6OKyxZJRfDKS1VZXvviC4Gcsq9y6/cWiQak
	 T+3NXmKl7Id5exuSOvLly2mqindAzzdiQJl0BUUGe1WKk8hf8utQEhionXoTpmbsSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="AFl/ihZj";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5986082BD2;
	Fri,  6 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5986082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AFl/ihZj
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135915euoutp02b65f7b9002df6d3964edaea318db1dbf~leXG85Ccq2692626926euoutp02C;
	Fri,  6 Nov 2026 13:59:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135915euoutp02b65f7b9002df6d3964edaea318db1dbf~leXG85Ccq2692626926euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973556;
	bh=G7NEdkxRN3KpQHJ/gpj/uZSKEgPg9bL3K+UXBDVUEls=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=AFl/ihZj54pbEZdCQSDExemzX46g29voAo4VLUl8Ec1rpGCDMogiEpdYOYhDfR20X
	 8JmJO7ZurNL07pVIuM+LpfIRGlVXLt/ZLNYBTObLBADqlcTUFTVQQ3SkG90QHCQ+9v
	 5yTTGm5OoJ/64hk2g5snFkMfQOqKuaTQUAT5XLKs=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135915eucas1p23a8fabb523d860d913831836c240837e~leXGp7LW61708617086eucas1p2I;
	Fri,  6 Nov 2026 13:59:15 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135912eusmtip169b15b2b9ac489813a1f707dc3ca7b50~leXD3Gwt00573605736eusmtip1t;
	Fri,  6 Nov 2026 13:59:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:47 +0100
Subject: [PATCH v7 13/19] drm/bridge: inno-hdmi: Make the register clock
 source selectable
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
Message-Id: <20261106-jh7110-clean-send-v7-13-68f7ea9913db@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=d/i2gyls77m8F8lA4VJlxVhW0HvVLBDxUyRUpbBLHbE=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSsutPT19E8BMTcS+jXEw7a+tuZiKF1zwFHf6kp+Y
	+DDLuXajlIWBjEOBlkxRZazG6ONJP8xPC0//vgXzBxWJpAhDFycAjCRXZyMDNv/bNHV23My13TT
	o/ua0ad0Q+9c6zB9uFc46sf2OfNrf7cx/E+ct8Mm7n2i0psZy8QfP5EwMWWRdqt8rPE6uenizor
	aVG4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135915eucas1p23a8fabb523d860d913831836c240837e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135915eucas1p23a8fabb523d860d913831836c240837e
X-EPHeader: CA
X-CMS-RootMailID: 20261106135915eucas1p23a8fabb523d860d913831836c240837e
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135915eucas1p23a8fabb523d860d913831836c240837e@eucas1p2.samsung.com>

inno_hdmi_init_hw() drives the register interface from the system clock
on every platform, by setting v_REG_CLK_SOURCE_SYS unconditionally in
HDMI_SYS_CTRL.

That is not right everywhere. On the JH7110 a Framework 13 (fml13v01)
panel flickers continuously with the system clock selected and behaves
once the TMDS clock drives the register interface instead. Maud Spierings
found this by diffing HDMI_SYS_CTRL against the StarFive vendor kernel,
which leaves the bit clear.

Add a plat_data flag for it rather than changing the bit for everyone.
The Rockchip integrations keep the system clock, so this is a no-op for
them; only a platform that asks for it gets the TMDS clock.

Reported-by: Maud Spierings <maud_spierings@murena.io>
Closes: https://lore.kernel.org/all/e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io/
Tested-by: Maud Spierings <maud_spierings@murena.io>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 4 +++-
 include/drm/bridge/inno_hdmi.h     | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 84d00ee52b732a9a06e55d8b21127df4c60f7143..9aa005ff65a23bf55672f97aa1ea6688cf1b7ba3 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -576,7 +576,9 @@ static void inno_hdmi_init_hw(struct inno_hdmi *hdmi)
 	usleep_range(100, 150);
 
 	msk = m_REG_CLK_INV | m_REG_CLK_SOURCE | m_POWER | m_INT_POL;
-	val = v_REG_CLK_INV | v_REG_CLK_SOURCE_SYS | v_PWR_ON | v_INT_POL_HIGH;
+	val = v_REG_CLK_INV | v_PWR_ON | v_INT_POL_HIGH;
+	val |= hdmi->plat_data->reg_clk_source_tmds ? v_REG_CLK_SOURCE_TMDS :
+						      v_REG_CLK_SOURCE_SYS;
 	hdmi_modb(hdmi, HDMI_SYS_CTRL, msk, val);
 
 	inno_hdmi_standby(hdmi);
diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
index 790633fcea97a6b9840da7b19a0c0b0d7271fb83..cc5099d05f641eef5de91ed5becde7337c04b013 100644
--- a/include/drm/bridge/inno_hdmi.h
+++ b/include/drm/bridge/inno_hdmi.h
@@ -32,6 +32,8 @@ struct inno_hdmi_plat_data {
 	const struct inno_hdmi_plat_ops *ops;
 	struct inno_hdmi_phy_config *phy_configs;
 	struct inno_hdmi_phy_config *default_phy_config;
+	/* Clock the register interface from the TMDS clock, not the system clock. */
+	bool reg_clk_source_tmds;
 };
 
 struct inno_hdmi *inno_hdmi_bind(struct platform_device *pdev,

-- 
2.34.1

