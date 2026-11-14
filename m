Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632459;
	b=ZNQGYkjw4u4zB+4ylDGZPGNJkTTr/IJANVq1IiJX0TlQn2lWYNQ3Ota3PkUyfmwGjeAM
	 sj1hl3G4MSOqkJJ4X3x6DwteQp6/NELHyMuVymbD+8MxWe8meCrRgkd/9b5rBa5uZGcGP
	 D5i4Gjww6MKaXSAGQdsnaRSgLhITt2p0ax8Bpll1pm73gwCRKatOHxX95nJNFxazJP/te
	 rdE8p75Igq1AfiUPNpTvWTEmFLcJie1fGBqNzKQcBUgbPL3t5XWU+qhaj2Mg482cS2dDE
	 B6V/HXhpbPmBgQD/cKjKXCn+StbtVvVYHyVx8Rp97ne9v4PiD3yXz4AIkvDirEXDoEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632459;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LVLhWiEdWHFBJHnv0Cs5kHL4UQUBxd0+XsO4PKT1bxI=;
	b=uSU+gmsTD/J7Td4ipSwSLurB5SyEhc9SCQKlhwLLkAyu9iiVgAu7z6FmpaNLtyVnEcTD
	 HFRwhEvMbRhX3azPNtv/Jl+9/3eaeiFKFEk2qbLmKwshH2Gd0hd5OPWIyrzkB2kRGonzV
	 FwXIhfBbgeBAFxvTp0Y3sCvQG75BaRznwkWke0yr2tYTB2WVifx1nwTCZ9yk2miQF9PIF
	 9HC7gZGLzfsTy4HQhF7jCJGIchbEtK40tw7SWsDVxMEIiT09W3xP/d04U5TeEge2FCRgK
	 PdsWE3QbBHtKHM5I83iZFL31aLBHH7Ple/lpFvCrkYvBWTgzn7ceJFo+RHhz/JWsr6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b8kh5x41;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C646B606A331;
	Sat, 14 Nov 2026 05:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C646B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=b8kh5x41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=+ipPs8iD7ik+cdrCA73kGnVQQYgDC9VIvxWxUzjPh04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8kh5x41JLpSguDJy4r8QnLUG0iiSO/rvbmTrAAdPiTUZrYY+cVB/8WveSfb2c3A9
	 luG9bc/SLNBnVh+V5LBruwu9TNOkSiJElSMSYiyhJufWdc5FuLwtwd/PTYrP81Qdjp
	 5+qNoIBxeZprSeVgkMKpffjMn6EHFCByZF9k6qJYsvANrST5zS2ZKAZiByBhzHFyR2
	 uX6Kx5xOLfkZVVCf1Zyve5A0cYZIT+WF8jlixrvP7zeh5hpt3+H511FWmaWEzE+lvj
	 vo9FzmfG0WtGie4hot9d5tw1HgWKvEARpXM7/Q8ryeRAZ6L8wOe6ySg1C4GJhAOSja
	 npro4v7HOnscg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5635517E0FCC;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F562480031; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:36 +0100
Subject: [PATCH v12 03/23] drm/bridge: synopsys: dw-dp: Fix error handling
 for DP link enablement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-3-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=+ipPs8iD7ik+cdrCA73kGnVQQYgDC9VIvxWxUzjPh04=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wdd3JvJi7rqgp4TIhL8Rvs6fdfh68P70
 byH4rls6kajaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaNl4P/jX9GCiNXGi1JymflyfKjzQexCMwNr1/NXkljmhRk+Z21RIdksrqb39NQ5fD3S3/d5M
 rAhnt2EKYJhcLqD8D4mzX0xJSK4xzMEBObmM0cOupbxISPehkeLttbgxvvcM9tm64o1LVG6lZjK
 gbPCvvhA6HLbnjkxt123wfd0Lp8OtA7lO9w/Ymw84jZHICzl1cythe8DIZGHxNnqprGqAwhCHmI
 DgXmlnS+DboHrEJla8397ZfayXZ+6XvoERJ9Ry0c70Rt23Fs1AZf6Z77PN5i8MNyt22gSMOPO5s
 KSIyHNm3IdDFBGKa1b5Xfn46RT5znhjg/IpfavXdV7X4IvWYeIO7R8pFwH0FU53Gy0h2lIDNu8p
 e2TI8QycyWekacDwG7ywDNT2F7vy/ONfj0tDkWx/VKmSlqHJj80uabvY7yeUs6g2sL0g69r4qEV
 QVjtILTm3NyqzY1kwlzyjrquit3qleKdjB47SDV24yxXuAJdGWldSrbEF5xQox6GdSsvA3akvtG
 fGxJrewU0cPwtTSl7rdvlkIsU1SAg8gZZXa4CpW37HpWV96d7nQtsJWFLoGrVSTyYXD4Ufh1uKE
 w7PhnN4CRDGwQ2kNll36TVWD37FnuBLKtH1ALv2k9j6G1bxo/CJUzmIWN6Is2Q4Nh141cl/L9yB
 5ZikOVgX9/mo+vFgTyn8ykg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

dw_dp_link_disable() may be called in atomic mode disable even when
dw_dp_link_enable() (or an earlier step) failed during atomic mode
enable as there is no error tracking. This would result in broken PHY
power state.

This is fixed by introducing a new enabled state in the link structure
to ensure the link disabling only happens if it has been properly
enabled in the first place.

The patch also adds missing error handling in dw_dp_link_enable()
itself to ensure the link enablement becomes an atomic operation.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Acked-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index ac16d290d49b..93d52a76044f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -279,6 +279,7 @@ struct dw_dp_link {
 	unsigned char revision;
 	unsigned int rate;
 	unsigned int lanes;
+	bool enabled;
 	u8 sink_count;
 	u8 vsc_sdp_supported;
 	struct dw_dp_link_caps caps;
@@ -1614,6 +1615,9 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 {
 	struct dw_dp_link *link = &dp->link;
 
+	if (!link->enabled)
+		return;
+
 	if (dw_dp_hpd_detect(dp))
 		drm_dp_link_power_down(&dp->aux, dp->link.revision);
 
@@ -1623,6 +1627,7 @@ static void dw_dp_link_disable(struct dw_dp *dp)
 
 	link->train.clock_recovered = false;
 	link->train.channel_equalized = false;
+	link->enabled = false;
 }
 
 static int dw_dp_link_enable(struct dw_dp *dp)
@@ -1635,10 +1640,23 @@ static int dw_dp_link_enable(struct dw_dp *dp)
 
 	ret = drm_dp_link_power_up(&dp->aux, dp->link.revision);
 	if (ret < 0)
-		return ret;
+		goto err_phy_power_off;
 
 	ret = dw_dp_link_train(dp);
+	if (ret < 0)
+		goto err_link_power_down;
+
+	dp->link.enabled = true;
+
+	return 0;
+
+err_link_power_down:
+	if (dw_dp_hpd_detect(dp))
+		drm_dp_link_power_down(&dp->aux, dp->link.revision);
+	dw_dp_phy_xmit_enable(dp, 0);
 
+err_phy_power_off:
+	phy_power_off(dp->phy);
 	return ret;
 }
 

-- 
2.53.0

