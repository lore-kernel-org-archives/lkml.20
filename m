Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net [160.92.124.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB448383C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206101; cv=none; b=YpWPtt4+h7dFiGTHyvrxFMMqQl2JbsWPWmeZwbh3lHo7q7AST/B6p98cyS5bed/osG/VvZaUDvKSs0PpFgEKCOUBAa+D+Lv5FGywBEBKGAGrHjQEEM8cvEiGxAl+dq77BSKXIH8/J6AMN7Cn7xUqXtxhHpKgmE02srv7n7p2uwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206101; c=relaxed/simple;
	bh=Wy6Pwvx+2GcjwjAr6PbOh13jEziZTD8nOUStgJm2acI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRrCRNtf6s1lCKASzw37rY+l5DClYUr/4b5yS3JesEiQjfyBSq+HsvThgbDuXcoFHy7Y3ULOnwcXUg6x+9Oi+2lrGKF71c1DjcbmgC9fR41if51O1r0DUk25TMr1BVfKXQe1NQifIXJJjX/ZXxUmjJF9LlKCqijMI3aPhQd4nEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=Y4fKzkIs; arc=none smtp.client-ip=160.92.124.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="Y4fKzkIs"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gw3wsSz10MQN","contextId":
 "58004f09-b087-40cd-8ed9-1a0dd6434d7b"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4hz0Gw3wsSz10MQN;
	Mon,  5 Oct 2026 15:14:48 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gw00kMz10MQ4","contextId":
 "83529e5d-be3a-4842-bd6e-95de7938f786"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4hz0Gw00kMz10MQ4;
	Mon,  5 Oct 2026 15:14:47 +0200 (CEST)
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
To: linux-arm-msm@vger.kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Xilin Wu <sophon@radxa.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Saim Shujah <saimzst@gmail.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Subject: [PATCH 3/3] drm/msm/dp: validate modes against the trained link, not the sink's claim
Date: Mon,  5 Oct 2026 15:14:32 +0200
Message-ID: <20261005131432.22840-4-jean-francois.bobier@laposte.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
References: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791206097; bh=Wy6Pwvx+2GcjwjAr6PbOh13jEziZTD8nOUStgJm2acI=; h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=Y4fKzkIsJltBv+C7700BK91zAsGqJ+1fiKnEmEXNDR5jlKqDu3yQS8uY2aTwklwviI1lql+MpUM0Zm9E0yKfUf+FFA45N+QJI9F/5gFn+ubQaD57PK6JEpca3w0EyYCRiMoiky8vDP+PQQMvFIW3JZtMolTKz0g3bWO0/R8pjiFMuRn65scp6YqmatGdOXPceRnr5xAOSilmvOte3DAYdff+d8kyJgpiCftw4wb+dwFX78SjqMV/WfewG589oPCpX1qnN2Q13vKr5n3iIz1UdX+heJRfv4bdlVGpnB7l0n8pj3YsCQ3MXKnvaLuoYNfn/9UzDnCxnAfeOGYa42k/xQ==;

msm_dp_display_mode_valid() sizes every mode against
panel->link_info, which is what the sink advertises in DPCD. That is not
necessarily what the link carries. msm_dp_ctrl_on_link() walks the rate
down HBR3 -> HBR2 -> HBR -> RBR and then reduces the lane count until
training succeeds, so a cable with two unusable lanes trains at half the
bandwidth the sink claims.

The validator does not know that, so it keeps advertising modes sized for
the sink's maximum. Userspace picks one, training "succeeds" at the
reduced parameters, the mode does not fit in them, and the sink shows a
black screen -- with nothing in the log to explain it, because from the
driver's point of view everything worked.

Observed on an sm8250 phone with a 4K monitor whose cable only carries
two lanes: the connector offers 3840x2160, the link trains at 2 lanes
HBR2 (8.6 Gbps after 8b/10b against the 12.5 Gbps the mode needs at 24
bpp, more at 30), and the screen stays black until the user picks
2560x1440 by hand.

link->link_params holds the trained values and is reset to the sink's
maximum at the top of every msm_dp_ctrl_on_link(), so taking the lower of
the two is accurate after a fallback and a no-op before the first
training. The change can only ever remove modes from the list, never add
one, so it cannot cause the link to attempt anything it was not already
attempting.

This does not by itself make userspace re-probe after a fallback -- that
needs the link-status property, which cannot be set from
msm_dp_bridge_atomic_enable() because the modeset locks are held, and is
the deferred work the existing TODO there refers to. What it does ensure
is that any probe after a fallback offers only modes the link can
actually drive.

Also log the rejection at debug level; a mode silently disappearing from
the list is otherwise hard to account for.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
index bce641d7d..634d825aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -750,8 +750,10 @@ enum drm_mode_status msm_dp_display_mode_valid(struc=
t msm_dp *dp,
 {
 	const u32 num_components =3D 3, default_bpp =3D 24;
 	struct msm_dp_display_private *msm_dp_display;
+	const struct msm_dp_link_info *trained;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz =3D 0, supported_rate_khz =3D 0, mode_bpp =3D 0;
+	unsigned int num_lanes, rate;
 	int mode_pclk_khz =3D mode->clock;
 	int link_pclk_khz;
 	bool is_yuv_420;
@@ -789,10 +791,42 @@ enum drm_mode_status msm_dp_display_mode_valid(stru=
ct msm_dp *dp,
 			mode_bpp, link_pclk_khz);
=20
 	mode_rate_khz =3D link_pclk_khz * mode_bpp;
-	supported_rate_khz =3D link_info->num_lanes * link_info->rate * 8;
=20
-	if (mode_rate_khz > supported_rate_khz)
+	/*
+	 * link_info is what the sink advertises in DPCD, which is not
+	 * necessarily what we managed to train. msm_dp_ctrl_on_link() walks
+	 * the rate down HBR3 -> HBR2 -> HBR -> RBR and then halves the lane
+	 * count until training succeeds, so a cable with two unusable lanes
+	 * ends up carrying half the bandwidth the sink claims.
+	 *
+	 * Sizing modes against the sink's maximum then advertises modes the
+	 * link cannot carry: training "succeeds" at the reduced parameters,
+	 * the mode does not fit in them, and the sink shows a black screen
+	 * with nothing in the log to say why.
+	 *
+	 * link->link_params holds the trained values, and is reset to the
+	 * sink's maximum at the top of every msm_dp_ctrl_on_link(), so taking
+	 * the lower of the two is accurate after a fallback and a no-op
+	 * before the first training.
+	 */
+	num_lanes =3D link_info->num_lanes;
+	rate =3D link_info->rate;
+
+	trained =3D &msm_dp_display->link->link_params;
+	if (trained->num_lanes && trained->num_lanes < num_lanes)
+		num_lanes =3D trained->num_lanes;
+	if (trained->rate && trained->rate < rate)
+		rate =3D trained->rate;
+
+	supported_rate_khz =3D num_lanes * rate * 8;
+
+	if (mode_rate_khz > supported_rate_khz) {
+		drm_dbg_dp(dp->drm_dev,
+			   "mode %s rejected: needs %u kHz, link carries %u kHz (%u lanes @ %=
u)\n",
+			   mode->name, mode_rate_khz, supported_rate_khz,
+			   num_lanes, rate);
 		return MODE_BAD;
+	}
=20
 	return MODE_OK;
 }
--=20
2.55.0

