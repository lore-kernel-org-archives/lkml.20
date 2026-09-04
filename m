Received: from mx.prosyst.ru (m2.prosoftsystems.ru [46.48.77.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60C47F2C8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.48.77.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521770; cv=none; b=JwC/Z5cV46anBaTp+wBjfbpVLVp8xRa5o+YTFgf4ZOe3ES726vkO6Ic2j631eN9Ov62ZxKWoHLUxcaeLcoZ2sVsbjRLVhBrrRPAakacf1rT2dJ3aHyg6HwQrgtMfYHViBQQlkt+dZ7d3Hwp6XrBM9F51H2K+uh/M10O4CZLzGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521770; c=relaxed/simple;
	bh=7GJurgLlXroPNlf2BwKPUB9UKfWkQB2VvaN2B2FM0nQ=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=rQYP68xMbISbAdLYAeKYlidyGEk0Db8jsATap9qIfMMeD9uXEyuuwW08rC9k9UnqKjx4BbOFAXBbeI7Jl1LrPK2yr1OQ7plv0odNjOeIAtHKn1P2lougRgi798FUclBHu4nZIiPjINkFst+MlSmSGWojRmAEcWguWjcg34vmdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru; spf=pass smtp.mailfrom=prosoftsystems.ru; dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b=QmZ206QZ; arc=none smtp.client-ip=46.48.77.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosoftsystems.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=prosoftsystems.ru header.i=@prosoftsystems.ru header.b="QmZ206QZ"
Content-Language: ru-RU
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=prosoftsystems.ru; s=ps;
	c=relaxed/relaxed; t=1788521759; h=from:to:date:message-id:subject;
	bh=jKzuAY9vyP5ElQvtdykRhvd+EAhEUdrSLRmtiRVHKGo=;
	b=QmZ206QZPmaQM3MpqbnaQVRcIbiskhYnYNJSanBGwcx2NoY/ScaDecomc/5z3yUjQ6c0ciETG9H
	K0b4dW0vfyKYBX+kB/HhK1+PkARkOwL4DHBbVJS1nOskhEcrBrKZAYhl3orPKDCtRnLo+fOEoeuBE
	IAJykQkMOwS+wK/Z45bio6XtV+/Wf18tMGwUSKnwZHmN9Eb7MYCiukmloSYcTmqJV5gMTzaVsf60t
	EDreBPNEejoFNr0OKIvKZ0pS3KzA7woWU1W/nWnJHwZ6jKLl/VK/guJVKzwflx+KgZPN+B9CMVhJG
	QIJ+p9JkvHVDlKalSpjUAzqSM7PetVa1ikcw==
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by mx.prosoftsystems.ru
 (172.21.240.33) with Microsoft SMTP Server (TLS) id 15.1.396.30; Fri, 4 Sep
 2026 16:35:59 +0500
Received: from echo-2.prosoft.ural.ru (172.21.245.22) by
 echo-2.prosoft.ural.ru (172.21.245.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 4 Sep 2026 16:35:59 +0500
Received: from echo-2.prosoft.ural.ru ([fe80::8f12:4f85:56d8:13ed]) by
 echo-2.prosoft.ural.ru ([fe80::8f12:4f85:56d8:13ed%17]) with mapi id
 15.02.1748.039; Fri, 4 Sep 2026 16:35:59 +0500
From: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>
CC: =?koi8-r?B?9sHNwsHLycXXIPLBxMnKIPLJy8HSxMnOz9fJ3g==?=
	<r.zhambakiev@prosoftsystems.ru>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: [PATCH v3] drm/bridge: tc358767: check regmap_write() return values
Thread-Topic: [PATCH v3] drm/bridge: tc358767: check regmap_write() return
 values
Thread-Index: AQHdPGGOW/mPqY/IrkKvVwbWzLH3TA==
Date: Fri, 4 Sep 2026 11:35:59 +0000
Message-ID: <20260904113519.190340-1-r.zhambakiev@prosoftsystems.ru>
Accept-Language: ru-RU, en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

The switch to direct regmap_write() calls replaced the tc_write()
macro, which bailed out on failure. At three sites the error check
was not carried over, so the return value is overwritten before it
is ever examined:

The DP0_VIDSYNCDELAY write in tc_set_edp_video_mode(), and
both DP_PHY_CTRL writes in the main link PHY reset sequence in
tc_main_link_enable(), whose error is clobbered by the following
PHY_RDY poll

As a result, failed I2C transactions to the bridge are silently
ignored. A failed DP0_VIDSYNCDELAY write can leave the stream running
with stale THRESH_DLY and VID_SYNC_DLY values, causing display
corruption without any error being reported. A failed PHY reset
sequence can leave the main link PHY in reset; the PHY_RDY poll may
still succeed because the bit was set during the initial AUX link
setup, so link training proceeds on a bad PHY, or the real I2C error
is masked by a misleading "timeout waiting for phy become ready".

Propagate the errors instead. A failure from tc_set_edp_video_mode()
reaches tc_edp_bridge_atomic_enable(), which already tears the main
link down with tc_main_link_disable(). A failure from
tc_main_link_enable() needs no such cleanup: the fixed writes are part
of the main-link PHY reset sequence and run before the DP link is
brought up (DP_EN is only set later, during link training) and before
any video stream starts, so there is nothing to disable. The PHY is
re-initialised from scratch on the next enable and reset by the regular
disable path, so the error is simply propagated.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6d0c38315915 ("drm/bridge: tc358767: Drop custom tc_write()/tc_read(=
) accessors")
Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
---
Changes since v2:
- Reworded the error-handling note to be per-function.
  (addressing Sashiko AI review)

 drivers/gpu/drm/bridge/tc358767.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc3=
58767.c
index 7188935fdb82..d6b62546fed0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1014,6 +1014,8 @@ static int tc_set_edp_video_mode(struct tc_data *tc,
 	ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
 		 FIELD_PREP(THRESH_DLY, max_tu_symbol) |
 		 FIELD_PREP(VID_SYNC_DLY, vid_sync_dly));
+	if (ret)
+		return ret;
=20
 	ret =3D regmap_write(tc->regmap, DP0_TOTALVAL,
 			   FIELD_PREP(H_TOTAL, mode->htotal) |
@@ -1144,9 +1146,14 @@ static int tc_main_link_enable(struct tc_data *tc)
 	/* Reset/Enable Main Links */
 	dp_phy_ctrl |=3D DP_PHY_RST | PHY_M1_RST | PHY_M0_RST;
 	ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
+	if (ret)
+		return ret;
+
 	usleep_range(100, 200);
 	dp_phy_ctrl &=3D ~(DP_PHY_RST | PHY_M1_RST | PHY_M0_RST);
 	ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
+	if (ret)
+		return ret;
=20
 	ret =3D tc_poll_timeout(tc, DP_PHY_CTRL, PHY_RDY, PHY_RDY, 500, 100000);
 	if (ret) {
--=20
2.55.0
