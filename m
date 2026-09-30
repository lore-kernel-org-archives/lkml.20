Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A514D7D58;
	Wed, 30 Sep 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772192; cv=none; b=F92Jo/teKN3ZBzptt3jAVTbLR99AdQEuiKSpKQEtpGR5SQDb9VQQwtJF7qhWmkYNvEPBXRyiSyDQP3IlEoO4cRUjRolM7iMPSw2UccaoDe1vRQvIjzRXdErScJw1a1T6lOmblTxhGXBHsVueYzCmR7kABpZgOoO3qcqf9OP9HFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772192; c=relaxed/simple;
	bh=Wje5gSJMkJqxEQa1UMgFNz/fNFlHVhtDPwct6R5CQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkWFQJELOdTlhhkH3GQxGmMWPfq/FOrotTyr2mkT1DfnnAu8wi8cfEtiEthDsNpGO1JBT6Ag5rNc7AAfiV9kPzJfyfhXr6PgKsV8oKiaVEA5LYchjMbxTvT7ZzcJvwK1LnvFE53wYe1coj5sVlt30E2NvGGiqNg8Era/hqpz7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772146t3028f515
X-QQ-Originating-IP: +t6WDbloPr6BLJsQObF6CdVYlFc0tmvmyuck/Q0CAfU=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4284689002146285677
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:47 +0800
Subject: [PATCH 03/13] drm/msm/dp: Track PHY power ownership
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-3-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Wje5gSJMkJqxEQa1UMgFNz/fNFlHVhtDPwct6R5CQq0=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZeWSVh/SvCusY2TvPSp85ysuEbUBpc5Jxt3flBwm
 yG1USi6o5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwETupzD84WSwf3CswtMi7O8p
 H6nwFzvO/1X6z2Zb+cj2tbHVwqL4lwy/mFtX7p8/ZeX25OfVD9rzlztX3+fwOjjBPOXt6SVN0cf
 KGAE=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N6F6qKp5aHDYsudr3UPeFHoOetQuTkJXtK3qV6lMANdDwj0AkZtJzsCW
	ZzMYKcIupVb5qrJWI2pBmn97n00pPvbb6UEkFveJZs/YbQUQylfWwbfQKTPPKv6+o7JfTTT
	ZLiOZ37+Xaxi9HT8HeGu2VHRgi4MeLd8JzKdhY8yUUTeKWSny3GHdzmFfcGqzIlHxcSwwBW
	5NPF3dIYskSrW/+atrftQFhLy7DvuZsOIcCEC+NG3u1hnXXviFhbXQkPt8zf5G/t+AzLDUD
	lLwmsZIHD2/IIIXj5Jvez2VxywUXeor6QqBunMovpOHLa/7YIhcUjV7aW44UU5p72RioX7I
	JXrdcQlT54vQExm6QgkMjMO7j+bijUAPGX541T9yNResjgPGPt115GqfaTnIS9qtxQjJePA
	3fttZrXDaxgMaRf61V7/CD+Tez9IKK9oIianT34Xc3dWF4Ur/+T/mqJyjXebD4wK175/BaW
	QyDJik/A1dEnBx389W4w+XvVtijJPqSdFwhPIAFfxg/NXr0SXm1bGPKuHcjECCuMYYwXGEG
	ffTYiePLs6MBsNp05I9k/J/K7VsNj+aoMDhnGYq2nZFDW8bfYNK65ttmCFbcJsCgf8xyIcm
	oQwa9ZnBhTI+Wrh7uZXyLo+f4DmurJmW5YTQk+r8bCVA+oZzyB3xJPzHVgzz/M/bhnX1Pkv
	l1AGV8gabKJRWtDJLTi2JbkUQvT4n0fXq2GKkwQE/bji2F8BIhftU2ps31BctSuRP6Kj401
	WudWV+gHjkw3dCp/Zh+y2O2KQR4WCj9FcEBWSY22tF2p2G86ClNGhl90NpFXonK3iP9WHaS
	8tpmzubV/nzZ0pDfYvprbf9WfYZSpHErJ4hDWiGdz+Z8+uPTZWnJYw5Y5bdhvBENhx92/33
	943v5ok79sozBI5l2XubRizuDs9qkBl7MkMO2r9CAdvqREtfWj1oX7qsW8WXL2VZdsRK+/d
	47Y108REP+tpa/9HG2mpi18+B8pCDHbQjQF+vXppqUFaDdZiF8oE10zHiIFYF3aZlWAAJH8
	5TxL8n34vWMZ9+AGMcw7VFTwLxm+kC18pGWXuxw3sTHbl05ZxygFv/C5M8cmArpU9yVjHMY
	lBseiNluevH
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Mainlink restart and PHY test paths can power down the PHY before a later
cleanup attempts to release it again. The PHY core counts each power-off
call, so cleanup without an owned reference can underflow that count and
prevent a subsequent enable from calling the hardware power-on operation.

Record successful PHY power acquisition in the controller and route all
power-off paths through an ownership check. Keep the reference recorded
when power-off fails and avoid acquiring a second reference while it is
still held. Also skip releasing link clocks that are already disabled.

This establishes resource ownership for repeated cleanup. Error
propagation is left to the subsequent stream enable rollback change.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 59070f399e2d..f005421630c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -136,6 +136,7 @@ struct msm_dp_ctrl_private {
 
 	u32 hw_revision;
 
+	bool phy_powered;
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on;
@@ -1813,6 +1814,9 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	if (!ctrl->link_clks_on)
+		return;
+
 	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
 
 	ctrl->link_clks_on = false;
@@ -1824,6 +1828,23 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 		   str_on_off(ctrl->core_clks_on));
 }
 
+static int msm_dp_ctrl_phy_power_off(struct msm_dp_ctrl_private *ctrl)
+{
+	int ret;
+
+	if (!ctrl->phy_powered)
+		return 0;
+
+	ret = phy_power_off(ctrl->phy);
+	if (ret) {
+		DRM_ERROR("Failed to power off PHY: %d\n", ret);
+		return ret;
+	}
+
+	ctrl->phy_powered = false;
+	return 0;
+}
+
 static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
 					      struct msm_dp_panel *panel)
 {
@@ -1836,7 +1857,11 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
 	ctrl->phy_opts.dp.ssc = drm_dp_max_downspread(dpcd);
 
 	phy_configure(phy, &ctrl->phy_opts);
-	phy_power_on(phy);
+	if (!ctrl->phy_powered) {
+		ret = phy_power_on(phy);
+		if (!ret)
+			ctrl->phy_powered = true;
+	}
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
 	ret = msm_dp_ctrl_link_clk_enable(&ctrl->msm_dp_ctrl);
@@ -1996,7 +2021,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
 	 */
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -2022,7 +2047,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
 
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
@@ -2643,10 +2668,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
 
 	msm_dp_panel_disable_vsc_sdp(panel);
 
@@ -2656,7 +2679,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 }
 
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,

-- 
2.55.0

