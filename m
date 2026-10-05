Received: from smtp-outgoing-1902.laposte.net (smtp-outgoing-1902.laposte.net [160.92.124.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7B4D2EC3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220550; cv=none; b=CKvcxxy/uuycolXMQVpU1PIIoLFQAGuqvcaxUiuImwOupiFc2HYvQD68DtZYZab5JTFNo9F083spVNHMR6EE5Xn0ol7Po3WwvkHvtkRkzllx0YcZvf1l0Pg4rpVMUOSJULrm2nTX//7wT935Mv1kmsQX9MGutxJi2hBW02OOd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220550; c=relaxed/simple;
	bh=hxdoK/QE60X045d9V3Aagp/V0lSogdtRHJj5+cb5NH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmSJuupYEewy8TkX+oE4pZ4X9DxqWUpP6QqyNsRnJQiTqDp4Aj0rWN+h6XjTQTiOVoh/Cd8hMKpY3HEVqi4mRjqVulrHtoJ9vpWaBh5UHq+v7yBHKbZCXAeO+ctLgUgfU1Oe5S30nQxx69kFubMiQbzOO/NI4vBDWIdzX+nsGcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=ohF5Y+dp; arc=none smtp.client-ip=160.92.124.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="ohF5Y+dp"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gs5yTCz10MQR","contextId":
 "27044b9d-1598-4d46-a58a-ba86be668f3a"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4hz0Gs5yTCz10MQR;
	Mon,  5 Oct 2026 15:14:45 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0Gs2Jckz10MQ4","contextId":
 "26652990-d7c9-4d0e-87f3-0447723efaab"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4hz0Gs2Jckz10MQ4;
	Mon,  5 Oct 2026 15:14:45 +0200 (CEST)
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
Subject: [PATCH 1/3] drm/msm/dp: don't gate link-training fallback on the controller's HPD block
Date: Mon,  5 Oct 2026 15:14:30 +0200
Message-ID: <20261005131432.22840-2-jean-francois.bobier@laposte.net>
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791220545; bh=hxdoK/QE60X045d9V3Aagp/V0lSogdtRHJj5+cb5NH8=; h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=ohF5Y+dpGFy9v28WPDpdA8WILhcztcnI0LB6bP4JtAiSdYvjGdKIZBoD03Y7ZJrcncdSKYamQdWcdiMHOrXjcUMN0LtZt8YIShicpIPjxjIUgMYJpPT9CgVUYGRX8qZ87hfsGhj50l1M15CrFfnHZi9eBVY/uLu+vJvq7zdy0VkhP5J42VY813levXDJ5W4Y0qvoNFmqnVjEjDvhdHicf6V4Tzqi2Rgb8R8/XNsGNCUR0Th1BF85bqBPU7zIWkmkrCiVn4YB8ObLsbxW/hbeITRO5mp1BVMHuYmEIfO8Myii3p98isKD8OROVYPY3d83UMew6FHyi+YjFN9ifiHjjQ==;

msm_dp_ctrl_setup_main_link()'s retry loop is what implements DP link
fallback: on a training failure it shifts the link rate down HBR3 -> HBR2
-> HBR -> RBR and then, if clock recovery succeeded on at least half the
lanes, reduces the lane count. Both failure branches guard that with

	if (!msm_dp_aux_is_link_connected(ctrl->aux))
		break;

which reads REG_DP_DP_HPD_INT_STATUS, i.e. the DP controller's own HPD
block. That is only meaningful when the block is wired to a real HPD
signal.

On a USB-C port it is not. HPD arrives out of band: the Type-C port
driver owns it and hands it over through a drm_dp_hpd_bridge, and the
controller's HPD register reads DISCONNECTED for the entire time a sink
is attached. msm_dp_bridge_hpd_notify() already shows this, logging the
register beside the bridge's own verdict -- on sm8250 (OnePlus 8T) every
attach reports

	msm_dp_bridge_hpd_notify: type=3D10 link hpd_link_status=3D0x0, status=3D=
1

So the guard is always true, the loop always breaks on the first failed
attempt, and the rate/lane fallback is dead on every Type-C DP board.
msm_dp_ctrl_setup_main_link() then returns -ECONNRESET and the mode set
fails outright.

The cost is real. With a 4K sink attached directly (4 DP lanes, no USB3),
a board that can only carry two DP lanes to the connector trains lanes 0
and 1 and never lanes 2 and 3:

	v_level 3: DPCD 0x202 =3D 0x11 (lanes 0,1 CR_DONE)
	           DPCD 0x203 =3D 0x00 (lanes 2,3 nothing)
	link training #1 on phy 0 failed. ret=3D-11
	Failed link training (rc=3D-104)

A fallback to two lanes would have trained -- clock recovery was already
good on exactly the lanes that remain, so
msm_dp_ctrl_clock_recovery_any_ok() would have passed -- but it is never
reached. The same sink works through a dock, because the Type-C alternate
mode negotiates two DP lanes up front and the first attempt succeeds.

Use the DPCD read the loop already performs as the liveness test instead.
It expresses the intent directly -- a sink that has gone away cannot
answer AUX -- and it carries no assumption about where HPD comes from.
drm_dp_dpcd_read_link_status() returns 0 on success and a negative errno
on failure.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp=
_ctrl.c
index e1614bc49..d6219d87d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2426,12 +2426,22 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_d=
p_ctrl,
 			/* training completed successfully */
 			break;
 		} else if (training_step =3D=3D DP_TRAINING_1) {
-			/* link train_1 failed */
-			if (!msm_dp_aux_is_link_connected(ctrl->aux))
+			/*
+			 * link train_1 failed
+			 *
+			 * Use the DPCD read itself to decide whether the sink
+			 * is still there. msm_dp_aux_is_link_connected() reads
+			 * the DP controller's own HPD block, which is only
+			 * meaningful when that block sees a real HPD signal --
+			 * on a Type-C port HPD arrives out of band through a
+			 * drm_dp_hpd_bridge and the register reads
+			 * DISCONNECTED the whole time the sink is attached.
+			 * Gating the retry on it therefore skipped the entire
+			 * rate/lane fallback on those boards.
+			 */
+			if (drm_dp_dpcd_read_link_status(ctrl->aux, link_status) < 0)
 				break;
=20
-			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
-
 			rc =3D msm_dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR =3D 1.6G */
 				if (msm_dp_ctrl_clock_recovery_any_ok(link_status,
@@ -2451,12 +2461,10 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_d=
p_ctrl,
 				}
 			}
 		} else if (training_step =3D=3D DP_TRAINING_2) {
-			/* link train_2 failed */
-			if (!msm_dp_aux_is_link_connected(ctrl->aux))
+			/* link train_2 failed; same reasoning as above */
+			if (drm_dp_dpcd_read_link_status(ctrl->aux, link_status) < 0)
 				break;
=20
-			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
-
 			if (!drm_dp_clock_recovery_ok(link_status,
 					ctrl->link->link_params.num_lanes))
 				rc =3D msm_dp_ctrl_link_rate_down_shift(ctrl);
--=20
2.55.0

