Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D34AB1DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107304; cv=none; b=aSP9yLmR7vqfPfTyKF95gYpNgGQC7RvfczBxfgHd/aRpWZkBqa7UTL4PkT3vNufoMxXIRRCWiYBQp6luIyVZg79ZFkodMp1k49NjToEKWgDl2ZMGkLbbb7mNEqL6iZ0vRo1RmAR6hBjcLAM+U9vYB+5jGc8wBd4OdT37XL7yJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107304; c=relaxed/simple;
	bh=vk8LmAxyJ00+4IDE6RcqAurCzZl3P6rOxNHz4USYmeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3nTh8iii7bkOyIbzUROLLRidimjB7MZ9azJjGDxBXEgy3FFwPmTbiGvSiO3XUp9k0A/NrAfAZ2pWqd3j8LDYKoADoR7rjcQ7kHbFCp6YOEoT7wh0XALZ4WaTF8a+wHMMeweCsl5UMaNmuHBwqxMpf5xbE5ieomUl32AgoMaUE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=SE8754cT; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="SE8754cT"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so269184c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790107291; x=1790712091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7z70TQXn4poqOPaKrCAHTGIhbFu9qXKNqmozdXBkBPA=;
        b=SE8754cTS7jnjdvBdzNZ0gSsNw44ZQlh+cBp2dYK9hbXW/fafKPxkugRD7iVJv896G
         +UZtR+CgBLvdOG530+G+uIna3Yl5E2O8dPeDxK2RIpmioZyzszdUPG10Skbgh1wGPORD
         z9Gk1HZkJ6cNXruQfK/JAPtUSpK6QjHw6ldqk1qonCPemMGjz/Xt6A2uNMTr5g1u/8zz
         sEpwj1DeqkCAZ1alVBl9l+VGUAxriJi4agpQGJN22TslGl11+O6Cs7QYzf8HEQSzMpFH
         jyAqWpJ419DSgMt8rkOuDFtezAKJ6rioaMxbu/cnNNI/ocCszB9xaxVQ20GyeDDt+0FT
         Cs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107291; x=1790712091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z70TQXn4poqOPaKrCAHTGIhbFu9qXKNqmozdXBkBPA=;
        b=UEJQufBRFpLCf35fpKzQTpHAcHqcEUoVB1KErn2HM64COg9AxSFuQUj9Hlzi35crm1
         1X4A5PHycQF9RzE35W+iSWBXTMr+YF61oDD8TmUepXeT9AEpaiBxxjpYNQBjMnoxM2v7
         QYfIsHH/FIAK4dfWdIjiiMxhUCGpBGJgAQy9SUQF0sM2KoylM6UCldm1OEMrbSUcZaj/
         GG2eX7FsjxUlSPFCm2r1M6fXq4nxaE5SCj/PSZqwJT5iFDOz+8xgOrDKGAv5m0MxmTUn
         IU0tM2ASfrJZRX0xOq6vcQeggrkunAMV6tn+PrAV0MA2Qpa/ZnQ20U7Vx7sSLhW9SsFQ
         OTnw==
X-Forwarded-Encrypted: i=1; AKwUvBx7byoF+jr/3MoFB1+EcsOo9dkbTOX1Gzl9HDZwTr+Xx0Rr7xOEDq2jDr6JY/T18g9wdUzwK/qRQYdo27s=@vger.kernel.org
X-Gm-Message-State: AFuF++lQZutxOozUX+gqV71zDMcDvF/t5QVakIbCcNSVCs8AXahhYWC4
	JwBLqzmY0/DZN4M5uAhKZMqTfQlISTFyFrZfOdbhDA0jINo2sXH0yABSH6pdjH/6MzQ=
X-Gm-Gg: AYBFou3WDXsSDUtxt1CsVreUuGtd57tShL7JHLLUa8UJa3RfPLDibxAe9rM0pPkD4ix
	I7DdkyNkfu4FkmuW+leK2yJXVkMtvgbbwqLz2kvEuMEzLB2rZs+eDoBYDoEhGEd5l/XoXdeHoTT
	7rsZBZUK+DvqlOMDtkUhSIBIqV+p1QflbcRKXqVjNsevSe3ygXEuMoXxsf10muEgAEmaetLoQqh
	SRVKn/5iwYUUAnuIvYazTNh3H0a33MvZd4fSIU0jNiVeG+t6rSW7+LO2ftL9gMYooOK1X3wHrKT
	3e/XScDl7VkYdqKraMGpJSmYpfN++lVWwwRlnWp4re1dWEsL78uZyH/MNmsVd09IiL1uKnZ5Njb
	QcCqEm17lbMhVnb1317ERMxrSOLUvtibldY0MnkmwNyz2BpbbpnxEReu7U5sPPx+haHNyXzSwzG
	vl3qQxXgK/HhSfYnMYh1WO9hmy7GafDhEr+2rzvQ/Oh+MM2QzxXOcq4fC/EUAB2nlteE3kuj1h8
	AAp/JVwW35K/SM8GGRhQlZzJaRuUpMP23kHCp3R0Hq0ySio1Gpv571ink/CseMqT/wzDlk=
X-Received: by 2002:a05:701b:4247:20b0:143:297c:82e1 with SMTP id a92af1059eb24-144f931bbf3mr446013c88.33.1790107291150;
        Tue, 22 Sep 2026 13:01:31 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:c016:77a6:d382:7611])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f982089fsm602138c88.5.2026.09.22.13.01.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 13:01:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Johan Hovold <johan+linaro@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: [PATCH 6.1.y] drm/msm/dp: Drop aux devices together with DP controller
Date: Tue, 22 Sep 2026 16:01:26 -0400
Message-ID: <20260922200127.27433-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Andersson <quic_bjorande@quicinc.com>

[ Upstream commit a7bfb2ad2184a1fba78be35209b6019aa8cc8d4d ]

Using devres to depopulate the aux bus made sure that upon a probe
deferral the EDP panel device would be destroyed and recreated upon next
attempt.

But the struct device which the devres is tied to is the DPUs
(drm_dev->dev), which may be happen after the DP controller is torn
down.

Indications of this can be seen in the commonly seen EDID-hexdump full
of zeros in the log, or the occasional/rare KASAN fault where the
panel's attempt to read the EDID information causes a use after free on
DP resources.

It's tempting to move the devres to the DP controller's struct device,
but the resources used by the device(s) on the aux bus are explicitly
torn down in the error path. The KASAN-reported use-after-free also
remains, as the DP aux "module" explicitly frees its devres-allocated
memory in this code path.

As such, explicitly depopulate the aux bus in the error path, and in the
component unbind path, to avoid these issues.

Fixes: 2b57f726611e ("drm/msm/dp: fix aux-bus EP lifetime")
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Patchwork: https://patchwork.freedesktop.org/patch/542163/
Link: https://lore.kernel.org/r/20230612220106.1884039-1-quic_bjorande@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Backport to 6.1.y: the source change is unchanged; refresh context
  around the older DP bridge layout. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and MSM DRM maintainers,

I am continuing backporting CVEs still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53851

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 drivers/gpu/drm/msm/dp/dp_display.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5beb727f8437f9..ddd0279bc8963a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -322,6 +322,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	kthread_stop(dp->ev_tsk);
 
+	of_dp_aux_depopulate_bus(dp->aux);
+
 	dp_power_client_deinit(dp->power);
 	dp_unregister_audio_driver(dev, dp->audio);
 	dp_aux_unregister(dp->aux);
@@ -1535,11 +1537,6 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	}
 }
 
-static void of_dp_aux_depopulate_bus_void(void *data)
-{
-	of_dp_aux_depopulate_bus(data);
-}
-
 static int dp_display_get_next_bridge(struct msm_dp *dp)
 {
 	int rc;
@@ -1568,12 +1565,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 		of_node_put(aux_bus);
 		if (rc)
 			goto error;
-
-		rc = devm_add_action_or_reset(dp->drm_dev->dev,
-						of_dp_aux_depopulate_bus_void,
-						dp_priv->aux);
-		if (rc)
-			goto error;
 	} else if (dp->is_edp) {
 		DRM_ERROR("eDP aux_bus not found\n");
 		return -ENODEV;
@@ -1597,6 +1588,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 
 error:
 	if (dp->is_edp) {
+		of_dp_aux_depopulate_bus(dp_priv->aux);
 		disable_irq(dp_priv->irq);
 		dp_display_host_phy_exit(dp_priv);
 		dp_display_host_deinit(dp_priv);
-- 
2.39.5

