Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5020411665;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750571; cv=none; b=koQVc5TR+AOIg7jlbP8p0OZ/RWh/FzfsKqpeC1mc8rWvvrhj+Ydj3v/wuAdtYhuj8UbK8uES5oc7kpNN4qtFYcH9NBTHz+oPQ69RBFWpD6zzWZbnFzMt3Q14BbkCJa5D63Ixo7mVL2PtrSXMh+jjHiWiF74R+vihWtqQl2/TOac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750571; c=relaxed/simple;
	bh=qhNQ+V7nHJlN/IDhI4/K5+2Wrttazhbm8OfiGO8nej0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNPzHwN0vXYQHGBtuKnvcyMCDtHwVsfvuHcQ4u1KAOy8k1psXYSh2K3QjCrTAjmaZn+Dk9txKz8P7fb6+Q2UmGhFCj+rO/XsrsH56f5fdRAHAr6tIVjIO2IX0MgZIxlxrGfx1iY/tlSX8lh3u2f1PRNFfUymQpktcuZ4cyeaRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3H4ZIrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3H4ZIrT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8639C4DDE2;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=qhNQ+V7nHJlN/IDhI4/K5+2Wrttazhbm8OfiGO8nej0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o3H4ZIrToy0xgznQOHuKsWG5pCif4AhyuePxyR1KBbI5uiNhWf8heWfTkTDMJwkng
	 krZmBK3MTGpAYKoP2fBxZN2D90nhJPjipvOP+VcISqfjXZrUJmThIWVutsKzMViAC3
	 DhNsM9XanMVK/1365DH3ZbT4lK/8jv+YS3pN398eVveCJBmYHe8k+8MPFrU0a9u0MV
	 NaO/PXQ4v13I+bNOHfVJ1OOq3wXajeE+U19nuNMLd2MRXtvHOjdcPnEPe4sm+OaPsM
	 ACs/nY0mGrCiuwlSvC/hV8R2BsSnO0li/T2Rp+ZU4LYuSygBd0kGXetC0ivdr3XfBc
	 H4hIEfN42eqlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A2AC9830E;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:32 +0800
Subject: [PATCH v2 14/21] media: i2c: it6625: fix link-frequency reporting
 for one-/two-trio C-PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-14-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=2939;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=xQ2xKK827dKyzCrWnc87JjVIDQUEQnUf40Pt3152/7A=;
 b=GGXBAFPlRsy6BwYf2A5ldDzj100sgpwZsWVQHIclMYdbmgN00zgql3cgxhdKgMog/Y9UPjZMK
 X4AyDuEQzr7A2Ow+fdoLJGui79tLMrgLgW/06BfQHV+az6DFdSs2mie
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_v4l2_init_controls() selected the 2.5 Gsym/s link-frequency
menu entry for any C-PHY configuration, but it6625_get_timings_cap()
only raises the DV-timings pixel-clock ceiling for three-trio C-PHY,
matching the actually-tested hardware capability. A one-/two-trio
C-PHY device was reporting an inflated V4L2_CID_LINK_FREQ.

Split the shared two-entry array into two single-entry arrays and
select between them with the same condition it6625_get_timings_cap()
uses (bus_type == V4L2_MBUS_CSI2_CPHY && csi_lanes == 3; C-PHY is only
ever set for IT6626, so this is equivalent to that function's chip-type
check as well). Name them for what they actually cover rather than for
a PHY type alone, since one-/two-trio C-PHY uses the low-rate array
too, not a "D-PHY" array.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 7582c12c268e1878f15c0f3c6030aacf8e78a5a4..cb201dea540a0ad0953b55bef5ea6d8e8f16d5b1 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -317,11 +317,18 @@ struct it6625 {
 };
 
 /*
- * Index 0: D-PHY (4-lane). Index 1: C-PHY (3-trio) -- the confirmed
- * hardware max C-PHY capability, tested single-port/three-trio.
+ * Reported link frequency for every topology except the reference
+ * exception below: D-PHY (any lane count) and one-/two-trio C-PHY.
  */
-static const s64 it6625_link_freq[] = {
+static const s64 it6625_link_freq_default[] = {
 	445500000,
+};
+
+/*
+ * IT6626 C-PHY, three trios: the confirmed hardware max C-PHY
+ * capability, tested single-port/three-trio.
+ */
+static const s64 it6626_cphy_3trio_link_freq[] = {
 	2500000000LL,
 };
 
@@ -1874,6 +1881,8 @@ static int it6625_v4l2_init_controls(struct v4l2_subdev *sd)
 {
 	struct it6625 *it6625 = sd_to_6625(sd);
 	struct v4l2_ctrl_handler *hdl = &it6625->hdl;
+	bool cphy_3trio = it6625->bus_type == V4L2_MBUS_CSI2_CPHY &&
+			   it6625->csi_lanes == 3;
 
 	v4l2_ctrl_handler_init(hdl, 4);
 	it6625->ctrl_5v_detect =
@@ -1887,10 +1896,9 @@ static int it6625_v4l2_init_controls(struct v4l2_subdev *sd)
 	it6625->ctrl_audio_present =
 		v4l2_ctrl_new_custom(hdl, &it6625_ctrl_audio_present, NULL);
 	it6625->ctrl_link_freq =
-		v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(it6625_link_freq) - 1,
-				       it6625->bus_type == V4L2_MBUS_CSI2_CPHY ? 1 : 0,
-				       it6625_link_freq);
+		v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ, 0, 0,
+				       cphy_3trio ? it6626_cphy_3trio_link_freq :
+						    it6625_link_freq_default);
 	if (hdl->error) {
 		v4l2_err(sd, "Failed to initialize controls");
 		v4l2_ctrl_handler_free(hdl);

-- 
2.34.1


