Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887784A3869
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859052; cv=none; b=igjE22NsWzgarUyulUWmBeNWI5TG8XW4K4QhmTmJpnYJf6HcFXzEzPhNLOkV3LXfB7EbREElve8ob+ZBftMFZlRVGRobGwmXx8YBk7bdY3H2cJQDvP00609jHDyMcJQTc58EBOclc72OnlttXHoeJ4ittZFpvC2Z661RjK3XNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859052; c=relaxed/simple;
	bh=xr5AL90jcRiCAwoTeDjbBsfNXiWjXy45swFFRvVcBxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHsedwiVppihHVUFYM9XLpO5dLDrPAQx1yVbrJdZa/QBPWfvHyRgk+vVHnjZ4O2R3ejw3voNGC7Cq7UalH5RQNlpZEc33nJ2Jj23bIj3Ev34mAw4jbWDU79wufNyVSP7Qp3/RR4A9qAfjddfcBHBHE6pwmgDUPt0n2O3icaDGjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed5JWG5d; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed5JWG5d"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66c7e3a2332so2982711d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859049; x=1789463849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04BJLFntpwJWlUY4qt1TWhif2X5sPaJQXijGBxMTbU4=;
        b=ed5JWG5dSAEfC24gySzCAVqqxSoSvaWipvts5wogF2pWyIJ5KBLliC2CcaSPX/KLII
         qPAbvD0aLw0BXBy8eW6o00F7ak7O5x0PZhciRB0C4PQ8yuECVYgTllOzOQMUklF2SNSs
         ZnTJ9CxVmblUHIGghM6cg3Xt9mOHJfGro1/XBPqqJUp1L/DUQaJZVwZz0i9mPXi+1KDu
         uckPmk6ZhONNQtRpyMuZ35DUzER0QFK8EBgdJVEY7n17hjsc6jR5XXhMqUzdWBEQNMm7
         tLGh052m4cwmv4Ui2BkiC6ztQJ2H2v6mT8UJqVCIq2x3QSBaXKORZ1eG4X/4SQ2OFTUd
         /cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859049; x=1789463849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04BJLFntpwJWlUY4qt1TWhif2X5sPaJQXijGBxMTbU4=;
        b=Hms/TkaMJIe4Rwypo7oyi4lIhOAKaO7pN9A9dkF381rdc7A7zX9ocidnVaa3vaqXip
         PmZ+WlNwOm7X18kwuvP3dsS5BinVUNfz0bFV8jwWjdO3jZP9k59260dLIMZFKNFFq6UX
         GQPBqMq499U0CAG+WydSDH6n4Ej+FzL9PnZJlzxJBq/aZSfWHXmTgVY5e/IP5YqTp+4v
         8YUmilguN4JMX4i2eeCT6UwR0BAqYAdUNh8C2mO0+eo7zGOEAMmPB5PeTASNLu/adau8
         yQdZNUCt2VLaJ5cKYcfgnEOvzqXXn5bq3FfzzlcUoDGCgK0C3YVXpvaZaGIiy8NJuN6c
         xsuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxohwQIGpKboktW18rY/SfBNGjlJqr1S2uudx/kGDZBZVkrICuwf5cN1zcE+3m3AoWpoHAB3MaNVJznQ8o=@vger.kernel.org
X-Gm-Message-State: AFuF++loGKTla5oRtEevvBfktfzL/UtCqOOFuf2KDw64OglMYLUCVaHN
	+YBatukXdlFlMZzy0MXPkLacVw29waiiowlSg8osua9RlnfRVYFl+8f2snoRWH3j0Wc=
X-Gm-Gg: AYBFou2NP8gFpXK3SwQEeZKNod6ci2GmLTTctfe+MaI2iHTqI4KLJz4EeD1ctDOToDe
	Y9wBTIHqzWZ9yo0ylSi6mhnlpEGp/vh3f59ak3jb0tgz75pPkKDQd1Q+FEtJLlwLkFjOV1Zo/wY
	KXsuDK9r3qwf6nXQ9t3JxC32j3bdxGyFvDRe0L+3gPXKMyqp1nwu3Jn0dKweB+tGpFq0OZ0GA6L
	xQAmj3XBi+iZnMnSB8fIj6fmrRxm3PhiH+VCY8VCFKOyB1wislwIc7AKrOhpBHm77kqPs5ldVQH
	MYLYfICC5lmmFdYWx6XZZZ1AHbjcbzhJWZksaQFsMwzkyxV+S03djIrCxRy0SuDdFwJm6NXIsyh
	4GRYBrX/PDoeo150XlahZhSp5+2imyCkLRHoMBp2QyfHf9a+jjN9/yDeHfhslzKVSuFfTJovrJX
	Y0b4GcJjFK2m7/j0ImQBw+D3Foycn19sShQbM3P1yulF4/9+CP9AYZMgkypVaL6jMOwhRGtt6kL
	SAN+yw7ZemAbovlhTKdyv8wonLz7jsDv7snEoLWP03EPw8TJnWEw/Y=
X-Received: by 2002:a05:690e:4845:b0:66f:dd72:8fd7 with SMTP id 956f58d0204a3-66fdd729038mr1907789d50.90.1788859049437;
        Tue, 08 Sep 2026 02:17:29 -0700 (PDT)
Received: from flyingfox.tail3d542a.ts.net ([2402:a00:163:2ce9:6c87:7904:21fa:8675])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-670f4f6d3cdsm1803318d50.6.2026.09.08.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:17:28 -0700 (PDT)
From: Vivek Kumar <vk092kumar@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Vivek Kumar <vk092kumar@gmail.com>
Subject: [PATCH v2] drm/msm/dp: don't gate eDP on DP_SINK_COUNT
Date: Tue,  8 Sep 2026 14:47:08 +0530
Message-ID: <20260908091708.3123735-1-vk092kumar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_dp_display_prepare_link(), msm_dp_display_disable(), and
msm_dp_hpd_unplug_handle() all treat dp->link->sink_count == 0 as
"nothing is connected", and in msm_dp_display_prepare_link() this
causes probe/enable to fail outright with -ENOTCONN.

This is correct for external DisplayPort, where a compliant sink is
required to report a valid DP_SINK_COUNT over the AUX channel. It is
not correct for eDP: some eDP sinks -- particularly fixed-format
eDP-to-HDMI bridge chips with no downstream AUX-capable panel
behind them -- never populate DP_SINK_COUNT with a nonzero value,
even while otherwise participating normally in DPCD capability
exchange and link training.

drm_dp_read_sink_count_cap() already accounts for this by excluding
eDP connectors from the sink-count requirement for other DPCD-derived
checks (msm_dp_bridge_detect() takes care). Apply the same exemption
to the raw sink_count reads in this file via a small shared
helper, so eDP outputs with a non-AUX-capable downstream sink are
not treated as permanently disconnected.

Tested on a Qualcomm QCS6490-based board driving a fixed-format
eDP-to-HDMI bridge IC (chrontel,ch7218a) with no negotiable
DPCD-capable panel behind it; without this fix,
msm_dp_display_prepare_link() unconditionally returns -ENOTCONN
and the display never comes up.

Fixes: ca16db3d18cf ("drm/msm/dp: break up dp_display_enable into two parts")

Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..9254f080f0ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -400,6 +400,12 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	return 0;
 }
 
+static inline bool msm_dp_link_no_sink(struct msm_dp_display_private *dp)
+{
+	/* eDP sinks are not required to report a valid sink count */
+	return !dp->msm_dp_display.is_edp && dp->link->sink_count == 0;
+}
+
 static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 {
 	int ret;
@@ -467,7 +473,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		msm_dp_display_host_phy_exit(dp);
 
 	/*
@@ -634,7 +640,7 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		return -ENOTCONN;
 
 	if (!msm_dp_display->power_on) {
@@ -723,12 +729,12 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
 
-	if (dp->link->sink_count == 0)
+	if (msm_dp_link_no_sink(dp))
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	else
-- 
2.55.0

