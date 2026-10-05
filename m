Received: from smtp-outgoing-1801.laposte.net (smtp-outgoing-1801.laposte.net [160.92.124.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4334C151F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213321; cv=none; b=HD7PKQmmV5qSrltj3zsczWhPdrUwtTRks4EpuIUamqAJz9nloLyKbRGOIwQ1VDWP8+zcN9n5SwTOysMPi5P7kIrxbA3ctP0C0ez9+YybwlUgsz9n7SpdKo2Qe1pfLHAkrHnTKHBPb4vJNTaQN2CbWk5kJOPiTl55CbvbrL+t8KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213321; c=relaxed/simple;
	bh=vQgNfaifqJBfWvhAJLZYmdCmSToBEbMrsQb5xsLkevc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyxiVPMMAj+Di+bCtPSaitKOUkYDW3F9wKUx6H9ZBB7Ezg3wtmVaHv95vtTk5XUBNcVJHpj2Ft4I6x/KcRMHNtH0qx6gqb6kPs3TNeI0HM8ZK3sIIcCaxJ250lsagNglJUcZ96yN+kkiCZOZnNJtQ9Yk4AZwgjI6C+0spGO0OTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=SbdTtjcu; arc=none smtp.client-ip=160.92.124.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="SbdTtjcu"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gv1kZfz10MQR","contextId":
 "775944a0-e23f-4087-bb77-5e4c87d0348a"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4hz0Gv1kZfz10MQR;
	Mon,  5 Oct 2026 15:14:47 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gt4y5Cz10MQN","contextId":
 "407ccb37-f746-4378-8a4c-0d794e65b55c"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4hz0Gt4y5Cz10MQN;
	Mon,  5 Oct 2026 15:14:46 +0200 (CEST)
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
Subject: [PATCH 2/3] drm/msm/dp: don't log an expected link-training fallback as errors
Date: Mon,  5 Oct 2026 15:14:31 +0200
Message-ID: <20261005131432.22840-3-jean-francois.bobier@laposte.net>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791213317; bh=vQgNfaifqJBfWvhAJLZYmdCmSToBEbMrsQb5xsLkevc=; h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=SbdTtjcubLJ6/+991h9VB0fnZCw7/+ziaWH6IbvEldSkChDxKPvdxJNAPsLdr7O/8hOCahks6PuB2kquwIzr+9qse9aGrlZuAfKfni+BDauOJdvUSqELP3fCKjgqCdX1OBYBUbXcuTTVFEPCLQyINKsEz5rYsD/3JJ8NyqtzSdyZ7Pg8w28HUWPMHe4An3vPOcUjkpHfsgEVeecLj1Z5v5FGsg/AkkqDMc9TZOJOVAwPb6yNFw/TjgYFFAlIDVkJGUOkR2VX1ME4aIgoJIqVQr2zQX8gsmQFRtpYjOCXIPW4L1PMI331XStS3e1WziX7qDlTQyDgi/WZPCEe3fCrIw==;

msm_dp_ctrl_on_link() implements DP link fallback: it retries
msm_dp_ctrl_setup_main_link() up to five times, stepping the link rate
down HBR3 -> HBR2 -> HBR -> RBR and then reducing the lane count, and
breaks as soon as training succeeds. Every step of that search is
therefore expected to fail before the one that works.

Each failed attempt currently logs at error level, from four places:

  max v_level reached
  link training #1 on phy %d failed. ret=3D%d
  link training #2 on phy %d failed. ret=3D%d
  link training on sink failed. ret=3D%d

A monitor that settles on two lanes after three attempts prints nine
error lines on a completely successful attach -- which is how a cable
that merely has two bad lanes looks identical in the log to a sink that
never trains at all.

Nothing is lost by demoting them. When the retry loop really does
exhaust itself, msm_dp_ctrl_on_link() returns the error and
msm_dp_display_process_hpd_high() already reports it once, at error
level, as "Failed link training (rc=3D%d)" -- which is the correct place,
because it is the only one that knows the search is over.

Demote the per-attempt messages to drm_dbg_dp() so they remain available
with drm.debug, and keep the final verdict where it is.

Also demote the unsolicited AUX interrupt message. msm_dp_aux_isr()
returns IRQ_NONE when no AUX transaction is outstanding, which is the
whole of the correct response for an interrupt that is not ours -- the
AUX block shares its interrupt and sinks raise AUX status asynchronously
around hotplug, so this fires twice on a normal DisplayPort attach.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
 drivers/gpu/drm/msm/dp/dp_aux.c  |  9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 ++++++++++-----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
index 3825a2fb4..2c0bc719a 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -458,7 +458,14 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp=
_aux, u32 isr)
 	aux =3D container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux)=
;
=20
 	if (!aux->cmd_busy) {
-		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
+		/*
+		 * Not ours: the AUX block shares its interrupt, and sinks
+		 * raise AUX status asynchronously around hotplug. Returning
+		 * IRQ_NONE is the whole of the correct response, so this is
+		 * a trace point and not a fault.
+		 */
+		drm_dbg_dp(msm_dp_aux->drm_dev,
+			   "Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return IRQ_NONE;
 	}
=20
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
index d6219d87d..ccc6cf63d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1534,7 +1534,8 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_c=
trl_private *ctrl,
=20
 		if (ctrl->link->phy_params.v_level >=3D
 			DP_TRAIN_LEVEL_MAX) {
-			DRM_ERROR_RATELIMITED("max v_level reached\n");
+			drm_dbg_dp(ctrl->drm_dev,
+				   "max v_level reached, retrying at a lower rate or lane count\n");
 			return -EAGAIN;
 		}
=20
@@ -1681,14 +1682,16 @@ static int msm_dp_ctrl_link_train_1_2(struct msm_=
dp_ctrl_private *ctrl,
=20
 	ret =3D msm_dp_ctrl_link_train_1(ctrl, panel, training_step, dp_phy);
 	if (ret) {
-		DRM_ERROR("link training #1 on phy %d failed. ret=3D%d\n", dp_phy, ret=
);
+		drm_dbg_dp(ctrl->drm_dev,
+			   "link training #1 on phy %d failed. ret=3D%d\n", dp_phy, ret);
 		return ret;
 	}
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp=
_phy);
=20
 	ret =3D msm_dp_ctrl_link_train_2(ctrl, panel, training_step, dp_phy);
 	if (ret) {
-		DRM_ERROR("link training #2 on phy %d failed. ret=3D%d\n", dp_phy, ret=
);
+		drm_dbg_dp(ctrl->drm_dev,
+			   "link training #2 on phy %d failed. ret=3D%d\n", dp_phy, ret);
 		return ret;
 	}
 	drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d successful\n", dp=
_phy);
@@ -1739,13 +1742,15 @@ static int msm_dp_ctrl_link_train(struct msm_dp_c=
trl_private *ctrl,
 	}
=20
 	if (ret) {
-		DRM_ERROR("link training of LTTPR(s) failed. ret=3D%d\n", ret);
+		drm_dbg_dp(ctrl->drm_dev,
+			   "link training of LTTPR(s) failed. ret=3D%d\n", ret);
 		goto end;
 	}
=20
 	ret =3D msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, DP_PHY_D=
PRX);
 	if (ret) {
-		DRM_ERROR("link training on sink failed. ret=3D%d\n", ret);
+		drm_dbg_dp(ctrl->drm_dev,
+			   "link training on sink failed. ret=3D%d\n", ret);
 		goto end;
 	}
=20
--=20
2.55.0

