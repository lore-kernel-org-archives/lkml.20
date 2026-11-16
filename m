Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828901;
	b=CgTajpeTnJhRY2YF9i6Z44wXtfaH/CDI7CGHZKpxKbylyrLBm4M5rjD2CTyXlk9f/1QG
	 za/lJCJjBSVg0Rhc6qlYvHhiKXjRwsAKVHc6M9LufpeO/5NJEhaCh/9y/GmejNP7CHaaJ
	 rN0dq5Ww1KCf4/OPa8XRtDEkGY0nZMXpMK08d1IRTUD6iUti0YyhN3yb30TZ4IRY1zqTP
	 OXr6KKSZQorre4O/Hz8VwOZZz/mWETLmquCwfUjqBe8pLeua4csmwiLEfzP4uDSePnVsN
	 rWTLCkzBICAAM2TEfvfy58UMjf3wsnllCsZuW6vA2f/JMUS9Ad9ZbSqZynA3kYWpMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=McYXQoZTRR4jelBpYJQLXbTjC1H0/Dkidy5fvWiEook=;
	b=yF99RLbvbOy7fJNDxFMTHJOF5T9OrM2JVfgyHQAJtKwaYj9GFjAWjGRUfU4TrqS/sTlQ
	 L9ftin4FIL1jUTjvXCnCWIbWoseJYeOIWg7pdRJ1xHymEsTZngZuXZicCf+7X2Yza3+lU
	 Vh1wd9Wote8zl6H9SpfLAmEtZ+hp/b6Q9MmzR9EvlM8cKfif3gwMb3c6SJFUBCJ66xlAi
	 kpifW39KaNeD587GutWxLQzgAoUK5kuLOupaScgOh2A5dvxWHh3RTNHeinxH0pvOrfpKo
	 YGZump+OS0UY/YpsWN/KSEnp43ml6sCpTjWddZpc9AbJljkMuI5EH7/rKeGdP+X05rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IN5V/NE0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmNmigA4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B855D606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B855D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IN5V/NE0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmNmigA4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLRZ22127820
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McYXQoZTRR4jelBpYJQLXbTjC1H0/Dkidy5fvWiEook=; b=IN5V/NE0Wj3QuPDj
	2wklJ9MTqjKUKIQfxAPHx+aZ8hdGJPnCjQDj76XqLmYl3CRcdPczHp8BkZRJ9znA
	PpfZKM2TiaPd2oV72D/leOkjhLT7to2LdutFNVU9GOaCgP4E9Tluj01dClvLz8MK
	RKDgEpU2Sj+wCwJWM0m3AkkAdVKiwWdnYXb/IrP/ltDCD5bpdEtMwcWLof/8qmBS
	lkgN3SGG35nitvS2hKgSZzyATH/oooTLgWv9E/4C+tm4tQ4uGPlI9esKX8GtSmgu
	KtmAW4mxlPv81oxea0D+AaX+lILG3JJeCKxqODhZOAKHHUa2r7egQBxAZVPb/54R
	u7BRkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg38f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:34:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3067629a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828898; x=1795433698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McYXQoZTRR4jelBpYJQLXbTjC1H0/Dkidy5fvWiEook=;
        b=fmNmigA4fX88Il3/L3r+qBn+ohdMmGho+4dRrn8yy96wDbiimp35wFdcZGVynBDGGc
         FwknQaec1IlymUyZAksPe0mYFtE06Rz4toB9XzXseIBpUo7JC9UDBDvBNzyGAA0qWzIV
         dItoPdqUhJvC/leKZ+KtIEFQK5R11IHSPykw0Xkj5Db+VZwcOkjuScAG+QmWc73SapER
         yggx9wUOxFNzYT8XL7xLyEKMPYm4JZOXXGbXD6wDleQUfnKFgjcNWU5pq5gucOIVlk/a
         BBEvCYJuWKtrBgXaFDMCjCoEdLcWDA/TNWPppcKqvKjZO6e/sLMr0wuTDGAN7tMZ5FGS
         YanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828898; x=1795433698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McYXQoZTRR4jelBpYJQLXbTjC1H0/Dkidy5fvWiEook=;
        b=RabznRojbc1TIrmLp+0+eKzgENtbARSC86fqdxghIyH5nH7t+CGku/UhqTbGeGRNoX
         yD1o0amCeuiD7aWo8RQHDHvrILrbKNl9JjblMpJ1usOeZy0i3nKY9l66aYT9Tn2jacEU
         WSmFWuDf3QddTYV2IwMtYi2N7gFul/p83D0dKv1RC+2iTEs8sM9ZDa+5w8r8H49SGaMg
         5EPX/6WWy533ObmEFHgpiWo5qbqMZfxcDoWrfoXVtsSTmCxdlaRYBYoQrM3ga4R9OBaM
         TuEGG0myCnlSS4/v5SYd1dbNTcIGNJi/iYMiusI5NOloZ/XTUo1rRBUtulR7ehZeNWww
         HCnw==
X-Forwarded-Encrypted: i=1; AL+hErFu4uLX+AX0gU9Y9x+DbI8fYbvhslLLQwtHJoEp5nQFf64nwbZGdzIfJLNJd3vGIQ555ikOsbZtaqxInGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SAWM8AiP/ujR3CXvm2zsw45dPykbqaLwey4/StYahpj+t/VhO
	Ah73HbyZ8DLj7A/eaa8lzJ2Vk8lvlkP8Yim+ftuIDsfm6X+k5hHMMg3NNSRYcHwsaiIKvZqo1UC
	m27LcaPBjm6O7P0d4jXzj5zud0KBYMHiw2mKBeuljoxnee7VXI+/VdVu7PxOA+WhZQTw=
X-Gm-Gg: AZFdTZfQOJXW4Zq5FLOyy/jZZP7XurUXj3v+aU/an8T6Imhc+0K2tTuMZrxDNsxQYR0
	Nah1Ysu+m1HzVIcNpkxYRd0xhIlSqTd0Qccz9AH0BpaqP+DBL46z7BhGWpTDng+/UT0MaUN+tTT
	vYWEpFfdbDlu2QSF4KkFhomeHwYsEKwLkvvtqQIUsVF5t0PAZnhkGG9a1rdqIqlsfzfkFauVfnW
	/LtYoYAMYzklRBp9R+ghLf2kzxen2ys+IGxSaFlEguYaLurycCxE0eefZaKwOgwJTJUXNRCgEA5
	1BInt8FRym8SAOVXnw9CqqoypPAjaw1d/MAmxxPYHwhlh/kwcgHfrLUEByjsF41bCf8IeQR+IUy
	YGcxOyi0TL16nz0bTaUOUDrK+5NEudsUwuYJ7NqG0wy5FH36+3OyC4JqZT6fgf7eGeUAHygXm+c
	WO
X-Received: by 2002:a17:90b:3985:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b1b0b53626mr9701293a91.46.1794828897307;
        Mon, 16 Nov 2026 03:34:57 -0800 (PST)
X-Received: by 2002:a17:90b:3985:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b1b0b53626mr9701256a91.46.1794828896692;
        Mon, 16 Nov 2026 03:34:56 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:56 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:05 +0530
Subject: [PATCH v2 2/4] drm/bridge: Add a driver for the Parade PS195
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
Message-Id: <20261116-mahua-hdmi-v2-2-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=8574;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=u3JvQjryjspDemBxOKTLJflG54nVSgowfdSpO4RkoPI=;
 b=zJnv6dFaTzzCbDSBBuuxaPG86dZSn7btDV4cHf8Ks9tuuV51Ws3cNSur5+E8/+4E5dWepXDcE
 3FUpOXAtryIB+RL9U9isfn8TkGobkFjTzPxEucJLf9XRxexTKdxirrE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afaea62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=_PMkZo2J1_9kd9osg98A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX07Ou2i9GB0L3
 +fiT6+SJ1oM9oMxBD4uwApzcGbPO9id+AA2vMprf3HPya1s6J+M7vtGgmzZPgGk8Tib5TvgpckZ
 osLG0mVir+JtYIBfX+3t8vHvP4S2wvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX68JHWojlO6jM
 g1cVExDTXG20+9YuwrCQGY5Ze1FftHmdOITqxvFByHy5ti8chBGDFT8x7o7h+IlEttPnlVpnYUW
 0YuCQxl9ybuvA4pk0KNqouo15TSCPFQSne+KXPnNMs8xm5pka+JlHJA+vi8oMbkU1JrZmGPpNdu
 PC04ePjwc3qorjag4CGEegX2lVRrDSJ4vLlfEDeDfXIGZvxoD3mWp66wqNxUpO2H0Kk/nDzprcR
 xFWTnc2nk6/6fSIbLC6ZGSFD3hjq7uo0pvjqZqWCmwxexPYij85GyrWQu2gXEIL2XXTRZ6JhTPh
 62dO7kJy9cxVBogA/XQJJLF3poaMzNet5AZluV/O8aztgh/HtTksflkaM4U16MLROzvehC7aKas
 rnNsaNjb7oJ2o7c+jR7JX8GzOgMAcBlZS7D0JC6eyXnCCfanyZed/ECSavji1TA2Nc8ckXYOkBH
 5P0ssBkda4V11YNaZeg==
X-Proofpoint-ORIG-GUID: nLFdDfDNv95Sp5npCsb8qHjwwcwdtxlL
X-Proofpoint-GUID: nLFdDfDNv95Sp5npCsb8qHjwwcwdtxlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

The Parade PS195 is a DisplayPort to HDMI converter that runs firmware
from external SPI flash. Add an I2C bridge driver to sequence its power
supplies and optional reset GPIO.

Keep the bridge powered for AUX and HPD handling between modesets. Use
late suspend and early resume to order power transitions around the
display controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/bridge/Kconfig        |  10 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c | 204 ++++++++++++++++++++++++++++++++++
 4 files changed, 216 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1db88ec1c9..cd83b47d9f85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8586,6 +8586,7 @@ M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+F:	drivers/gpu/drm/bridge/parade-ps195.c
 
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6..a14128d611d7 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -273,6 +273,16 @@ config DRM_OF_DISPLAY_MODE_BRIDGE
 	  It exists for compatibility with legacy display mode parsing, in order
 	  to conform to the panel-bridge framework.
 
+config DRM_PARADE_PS195
+	tristate "Parade PS195 DisplayPort to HDMI converter"
+	depends on OF && I2C && REGULATOR
+	select DRM_KMS_HELPER
+	help
+	  Enable support for the Parade PS195 DisplayPort to HDMI converter.
+	  Its firmware handles the display protocol; this driver controls
+	  the power supplies and reset input.
+	  When built as a module, the module is called parade-ps195.
+
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7..425722c7becb 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE) += of-display-mode-bridge.o
+obj-$(CONFIG_DRM_PARADE_PS195) += parade-ps195.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
diff --git a/drivers/gpu/drm/bridge/parade-ps195.c b/drivers/gpu/drm/bridge/parade-ps195.c
new file mode 100644
index 000000000000..6f92681497be
--- /dev/null
+++ b/drivers/gpu/drm/bridge/parade-ps195.c
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Parade PS195 DisplayPort to HDMI protocol converter
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+
+/* Enable the supplies in this order and disable them in reverse. */
+static const char * const ps195_supply_names[] = {
+	"vdd09",
+	"vdd12",
+	"vdd33",
+};
+
+struct ps195 {
+	struct drm_bridge bridge;
+	struct device *dev;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ps195_supply_names)];
+	struct gpio_desc *reset_gpio;
+	bool powered;
+};
+
+static void ps195_disable_supplies(struct ps195 *ps195, unsigned int count)
+{
+	int ret;
+
+	while (count) {
+		count--;
+		ret = regulator_disable(ps195->supplies[count].consumer);
+		if (ret)
+			dev_err(ps195->dev, "Failed to disable %s: %d\n",
+				ps195->supplies[count].supply, ret);
+
+		/* Allow discharge before disabling the next rail. */
+		if (count)
+			usleep_range(1000, 2000);
+	}
+}
+
+static void ps195_power_off(struct ps195 *ps195)
+{
+	if (!ps195->powered)
+		return;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	ps195_disable_supplies(ps195, ARRAY_SIZE(ps195->supplies));
+	ps195->powered = false;
+}
+
+static int ps195_power_on(struct ps195 *ps195)
+{
+	unsigned int i;
+	int ret;
+
+	if (ps195->powered)
+		return 0;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++) {
+		ret = regulator_enable(ps195->supplies[i].consumer);
+		if (ret) {
+			dev_err(ps195->dev, "Failed to enable %s: %d\n",
+				ps195->supplies[i].supply, ret);
+			goto err_disable;
+		}
+
+		/* Allow the rail to settle before continuing. */
+		usleep_range(2000, 3000);
+	}
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 0);
+	ps195->powered = true;
+
+	return 0;
+
+err_disable:
+	ps195_disable_supplies(ps195, i);
+	return ret;
+}
+
+static void ps195_power_off_action(void *data)
+{
+	ps195_power_off(data);
+}
+
+static int ps195_suspend(struct device *dev)
+{
+	ps195_power_off(i2c_get_clientdata(to_i2c_client(dev)));
+	return 0;
+}
+
+static int ps195_resume(struct device *dev)
+{
+	return ps195_power_on(i2c_get_clientdata(to_i2c_client(dev)));
+}
+
+static const struct dev_pm_ops ps195_pm_ops = {
+	/* Keep AUX and HPD available until the display controller suspends. */
+	LATE_SYSTEM_SLEEP_PM_OPS(ps195_suspend, ps195_resume)
+};
+
+static int ps195_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
+			       enum drm_bridge_attach_flags flags)
+{
+	return drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags);
+}
+
+static const struct drm_bridge_funcs ps195_bridge_funcs = {
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.attach = ps195_bridge_attach,
+};
+
+static int ps195_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ps195 *ps195;
+	unsigned int i;
+	int ret;
+
+	ps195 = devm_drm_bridge_alloc(dev, struct ps195, bridge,
+				      &ps195_bridge_funcs);
+	if (IS_ERR(ps195))
+		return PTR_ERR(ps195);
+
+	ps195->dev = dev;
+	i2c_set_clientdata(client, ps195);
+
+	ps195->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(ps195->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(ps195->bridge.next_bridge),
+				     "Failed to get output bridge\n");
+
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++)
+		ps195->supplies[i].supply = ps195_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps195->supplies),
+				      ps195->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ps195->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ps195->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ps195->reset_gpio),
+				     "Failed to get reset GPIO\n");
+
+	/*
+	 * Firmware drives DP HPD and services AUX, including EDID reads,
+	 * before a modeset. Keep the bridge powered while the system is
+	 * awake, including when no monitor is connected.
+	 */
+	ret = ps195_power_on(ps195);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ps195_power_off_action, ps195);
+	if (ret)
+		return ret;
+
+	ps195->bridge.of_node = dev->of_node;
+	ps195->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return devm_drm_bridge_add(dev, &ps195->bridge);
+}
+
+static const struct of_device_id ps195_of_match[] = {
+	{ .compatible = "parade,ps195" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps195_of_match);
+
+static const struct i2c_device_id ps195_i2c_ids[] = {
+	{ "ps195" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ps195_i2c_ids);
+
+static struct i2c_driver ps195_driver = {
+	.probe = ps195_probe,
+	.driver = {
+		.name = "parade-ps195",
+		.of_match_table = ps195_of_match,
+		.pm = pm_sleep_ptr(&ps195_pm_ops),
+	},
+	.id_table = ps195_i2c_ids,
+};
+module_i2c_driver(ps195_driver);
+
+MODULE_AUTHOR("Mahadevan P <mahadevan.p@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Parade PS195 DisplayPort to HDMI bridge driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

