Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458992;
	b=Lrh0bz+VyNwuRvTapBABDazgd8g0O9wjd0BlIoD4+wf8v/2wK4qEoFL1wY2L+LoKNwea
	 e+b/AKHkaemXCGgQUB1pQ3jU/BKh5MJy3kkpuf475pzDoDejfMsrniPZmDs1TU4O4eeVB
	 yTuw1QXNm9EFmUT/E8r5nnlppZiNqRe6x4LQalmuPcDPdVwjE1q2ZANMIIsrij8UrhEbl
	 J1K2F6bq7oZ1NVcPv3ayoz4gjNWuuAwCi43VNq81ZpRtZG6A9qd8FX3SIMyLphJ/RR6WB
	 6bLgjJ2rck0Mxv08oaa74ilPMjVZTYPLWBnP6cIQYIg7158uQevfZ80lbAbQcsqRdMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458992;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=i3ut5ysRe9+bUV1sCh7F8vL5fSuzL3gbg2+qiYwLdj8=;
	b=rAnmborlrdJV5KgUjNkm4O2I9e237ILJGlnY4yLm/O//CGof3UDq+V2JSspxqgR7GjIv
	 M7GxvZRROBt6Z5i1hDrTOw29uGGowj8ednyN6lhXaggNBK36UNbYCnp5s8kx2b9sgOEqc
	 qHjZCOq0++i3m8Miwre9++V9rAoi+IeVTlZ/MHWTK2XVx0b07mJiDEKz5YeqTpaFIbuDi
	 6W9FLfER7BkhBA+7OqoUef4JZ4M0T8esFxZhifvdBOsIgWbMhAFpmqHUwJLRRKMN6vbn9
	 9YFVzIEnHmhyTLWVQbLvNuRBU7wI0kiXWyCDVJrrpUcpPBvHijosoXFQEnHOUXx+E2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=h8216wVU;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D693606A31E;
	Sat, 31 Oct 2026 15:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D693606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=h8216wVU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=i3ut5ysRe9+bUV1sCh7F8vL5fSuzL3gbg2
	+qiYwLdj8=; b=h8216wVUzUwUeCuhyN2cQa+p91cw0YsKYUDyifY52BDxbrNvcs
	P1Bmuwf7FUs8WQqPDlLsYFIw8j/cz+pik6XRUbDtziqyLPo4VtqbT9G9XiSXJHoB
	NbN5rQwVVlDKQfOCPgcNHsud+5FCPU6hx3oKYChJalG574fNqhhOCLG74=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDHS0ApA+ZqqSNvAA--.5005S6;
	Sat, 31 Oct 2026 23:03:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/dsi: take bonded DSI master cfg from per-SoC config
Date: Sat, 31 Oct 2026 23:03:04 +0800
Message-ID: <20261031150305.1107572-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgDHS0ApA+ZqqSNvAA--.5005S6
X-Coremail-Antispam: 1UD129KBjvJXoW3XryrWr15XF4DJF4DCr1Dtrb_yoWxuw47pa
	yjgw45tr48ZF12vayqyF1DAw1fZF1fXayfC3yrGw1Ikwn0q3WUXFn7XFy3KFy3tFy8Cr1a
	qa1vyF4UWFyfJrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
	WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUvcdbUUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FY0gwAJsQ

Take the bonded master link id from the per-SoC config instead of
deriving it from probe order: the master is a property of the SoC's
DSI generation, not of which host happens to probe first. Behaviour
is unchanged: on sm8750 the cfg entry resolves to the same master the
hardcoded value named.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 ++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 49 ++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 667d233f7b..811895123b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -62,6 +62,7 @@ void msm_dsi_manager_tpg_enable(void);
 struct msm_dsi_host;
 struct msm_dsi_host_cfg_ops;
 const struct msm_dsi_host_cfg_ops *msm_dsi_host_get_cfg_ops(struct mipi_dsi_host *host);
+const struct msm_dsi_bonded_cfg *msm_dsi_host_get_bonded_cfg(struct mipi_dsi_host *host);
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
 					const struct mipi_dsi_msg *msg);
 void msm_dsi_host_xfer_restore(struct mipi_dsi_host *host,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5df0e775b1..df37e91170 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2357,6 +2357,17 @@ dsi_bonded_cfg(struct msm_dsi_host *msm_host)
 	return msm_host->cfg_hnd->cfg->bonded;
 }
 
+/*
+ * The bonded master/slave roles are a property of the SoC's DSI generation,
+ * not of the order in which the two DSI hosts happen to probe.  Expose the
+ * per-SoC table so the manager can take the master from there.
+ */
+const struct msm_dsi_bonded_cfg *
+msm_dsi_host_get_bonded_cfg(struct mipi_dsi_host *host)
+{
+	return dsi_bonded_cfg(to_msm_dsi_host(host));
+}
+
 static void dsi_cmd_error_prepare(struct msm_dsi_host *msm_host)
 {
 	const struct msm_dsi_bonded_cfg *bonded = dsi_bonded_cfg(msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 917e51a73f..ddf4d2a159 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -46,7 +46,6 @@ static DEFINE_MUTEX(dsi_bonded_cmd_lock);
 
 #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
-#define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
 static bool dsi_mgr_uses_bonded_cmd(void)
 {
@@ -74,6 +73,30 @@ static inline struct msm_dsi *dsi_mgr_get_other_dsi(int id)
 	return msm_dsim_glb.dsi[(id + 1) % DSI_MAX];
 }
 
+/*
+ * The master link comes from the per-SoC bonded config when the SoC provides
+ * one; falling back to the DT-declared value (which the probe order fills in)
+ * keeps SoCs without a bonded table working exactly as before.
+ */
+static int dsi_mgr_bonded_master_link_id(int id)
+{
+	struct msm_dsi *dsi = dsi_mgr_get_dsi(id);
+	const struct msm_dsi_bonded_cfg *bonded;
+
+	if (dsi && dsi->host) {
+		bonded = msm_dsi_host_get_bonded_cfg(dsi->host);
+		if (bonded)
+			return bonded->master_link_id;
+	}
+
+	return msm_dsim_glb.master_dsi_link_id;
+}
+
+static bool dsi_mgr_is_master_dsi_link(int id)
+{
+	return dsi_mgr_bonded_master_link_id(id) == id;
+}
+
 static int dsi_mgr_parse_of(struct device_node *np, int id)
 {
 	struct msm_dsi_manager *msm_dsim = &msm_dsim_glb;
@@ -117,9 +140,9 @@ static int dsi_mgr_setup_components(int id)
 		if (ret)
 			return ret;
 	} else if (other_dsi) {
-		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
+		struct msm_dsi *master_link_dsi = dsi_mgr_is_master_dsi_link(id) ?
 							msm_dsi : other_dsi;
-		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
+		struct msm_dsi *slave_link_dsi = dsi_mgr_is_master_dsi_link(id) ?
 							other_dsi : msm_dsi;
 
 		/*
@@ -327,7 +350,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge,
 	DBG("id=%d", id);
 
 	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+	if (is_bonded_dsi && !dsi_mgr_is_master_dsi_link(id))
 		return;
 
 	ret = dsi_mgr_bridge_power_on(bridge);
@@ -375,7 +398,7 @@ static void dsi_mgr_bridge_enable(struct drm_bridge *bridge,
 	if (!msm_dsim_glb.is_sm8750 ||
 	    !to_dsi_bridge(bridge)->powered ||
 	    msm_dsi_manager_cmd_failed() ||
-	    (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)))
+	    (IS_BONDED_DSI() && !dsi_mgr_is_master_dsi_link(id)))
 		return;
 
 	panel = of_drm_find_panel(msm_dsi->next_bridge->of_node);
@@ -404,7 +427,7 @@ static void dsi_mgr_bridge_disable(struct drm_bridge *bridge,
 	if (!msm_dsim_glb.is_sm8750 ||
 	    !to_dsi_bridge(bridge)->powered ||
 	    msm_dsi_manager_cmd_failed() ||
-	    (IS_BONDED_DSI() && !IS_MASTER_DSI_LINK(id)))
+	    (IS_BONDED_DSI() && !dsi_mgr_is_master_dsi_link(id)))
 		return;
 
 	/* Make off commands possible before panel unprepare in post-disable. */
@@ -446,7 +469,7 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge,
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
 	 * won't be diabled until both PHYs request disable.
 	 */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+	if (is_bonded_dsi && !dsi_mgr_is_master_dsi_link(id))
 		goto disable_phy;
 
 	if (msm_dsim_glb.is_sm8750)
@@ -498,7 +521,7 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 
 	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
 
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+	if (is_bonded_dsi && !dsi_mgr_is_master_dsi_link(id))
 		return;
 
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
@@ -608,13 +631,13 @@ static int dsi_mgr_bonded_cmd_xfer(const struct mipi_dsi_msg *msg)
 {
 	struct msm_dsi *master_dsi, *slave_dsi;
 	const struct msm_dsi_host_cfg_ops *ops;
+	int master_id = dsi_mgr_bonded_master_link_id(DSI_0);
 
-	if (msm_dsim_glb.master_dsi_link_id < 0 ||
-	    msm_dsim_glb.master_dsi_link_id >= DSI_MAX)
+	if (master_id < 0 || master_id >= DSI_MAX)
 		return -EINVAL;
 
-	master_dsi = dsi_mgr_get_dsi(msm_dsim_glb.master_dsi_link_id);
-	slave_dsi = dsi_mgr_get_other_dsi(msm_dsim_glb.master_dsi_link_id);
+	master_dsi = dsi_mgr_get_dsi(master_id);
+	slave_dsi = dsi_mgr_get_other_dsi(master_id);
 	if (!master_dsi || !slave_dsi || !master_dsi->host || !slave_dsi->host)
 		return -ENODEV;
 
@@ -771,7 +794,7 @@ bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
 
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
-	return IS_MASTER_DSI_LINK(msm_dsi->id);
+	return dsi_mgr_is_master_dsi_link(msm_dsi->id);
 }
 
 const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
-- 
2.53.0

