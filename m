Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792819200;
	b=NkUH1/Wrg6UbX8ckhhrTuhakkniTkpYrtbZzn7Vj1aihpJEie3yAm/ivab7ASJiRqx/R
	 HGqFnNGJUuKO0+aKzSt2cmCA7uzw/9aNxAaqn9QrFEAdngz8B4B6Jt1o5yelqB88rXmH9
	 MsxGSfen+rmr20JI06M6kRV85X29lqNd11uM19UEI1w0vgAdH5DsFMjItlMhTmXWd8dXk
	 jo9+amY/ouWicvVJOIk3WxE+gNX2Tu3VrZ/E0DEO+2MjZtIJkVLZVAed4xdmolnK7nF+L
	 uXbfeeJgeAySmOc5UD3Fzfnf9kcUuO6x/dF+ed8zwN7FUzqJW9QpsQYB9Ki5gF2KiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792819200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
	b=e46ZMmvAoF175uKMdgbcUlrfcNw3chQisOtAM5JVk+kd1XHqqG28mzglc3FlX6anzaaI
	 nDhbVu1/+UmMW//6xsZjOyZ6gIyRyOjPGZzbE4pjrP3ye055t9mTwBZGHy9nZ7dV1YEXD
	 r79zNfZgeYDOYdZiRWLN/+5L7LDsXAKbYtKbjCi2fMFir+70X3h7RzymuX0Ve0Huz5B4o
	 apZe9idJjyXg3KZRdHLIzlFtTKJAsG0nYFhOiKOuVvsKs6CCY2lFXOWA+t3MaKTLnwrcc
	 USFWnqnaaXy44iDKmmS6jMMLgjMf8eilocqSpGYP8bGkCGCD1HRr2rkhUtKFTgMYAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J69tgr+s;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A6606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J69tgr+s
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so228100a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792819199; x=1793423999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
        b=J69tgr+snbLUEdiCtVBtlylXGq6D5ivjGJZ2MKRec+C/sQP6YRMkEJB891XQOZ53sq
         F17WmLp3YSMojh5vjm8We8V0P81CZn0fKw7na7lTnWek7D6tJG/5fhS12gnKuTZybkDV
         ZxvHos3UYOso0IKSj2nGWZhJzgZ5fLaRGzyv11WzcBhA4MOIpMz7hzirxMowzvcP68iO
         J54arCBDV3b6v2nMCMGhz4MIx19qhN29L3RSVre+tRtgv3ab00rHNn69zgSnJc4u0TMK
         xbFnrMAqX9n/nlvPE6P44DnunwqgnZ1ZfvbirreRKlabYR9HBMw3Wue8X37i8Qydic1h
         At9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792819199; x=1793423999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBJqAEswmSE5diZ2tydC9GmlpfM+FyzcsAh2j2PMbx4=;
        b=fRQO9BRqHILMxHWthIAfEXsKkh69vnVWJnF+a7LC3ESRjV4CLPNBkkpTNRsKbaT7m5
         4fMWSf+XC3lZqadeq5cvxC/HBpA2dksnSLVxQO6dMFnNRRaK2V5Am11SNKHhuJ1iSOPc
         aBcSlvyrzK0vy9U5Ozydz0V6U8U7yb8EX3HJEu0JeqwbvyJcqQ/tvBEh5byIZ9Q5EQ2Z
         TGOPYD2+qjt8sLBbT/dJmwqnGJQVP3ftts8pnNxhfnhZMD/sWeI/Sf5UXp8op+5monwL
         i4PW6lveKII1bv9pWs6P6djpx5E/46XxycjpoZFP3g6Jrsi0iicAiurg2Q8yEwQGNAS+
         naBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTn0hkfMQ7A8u9SR676tc1vQHcz+ND03nmTEYHmwcpjE98YR0Loa6FUG395Hy9gBGS2ACdS6IXL8fJ1p4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNb4q5Ui77cazhTFw7fFvD0BsYD+yXAciFbNPBsUHveXSgYuo+
	V9e5R1A2Xg2EkZkMyE8O8OL3Z2RcwPyGztX6WRtda/xDLMhUi7z2jY0b
X-Gm-Gg: AYBFou0i/WASvqdDow3e4GXeXhJtDQE0RaZft6zpuwYMFxahJCl8Qb4O83++5UdUNzQ
	QuTTVEvYuLVgvCFOfdW8FGYO4OpcOX8njJwa5q6KeC/zHhIbWtEn7AH/0E79uSkH8H5RiTyH4jZ
	xGtFJbtC14wGXLQyWg6vfjY1OyZ4VqB6O32RsBZmswhroY1M4wLuT25BIR9zfrpY7imC8qlm1Yq
	6oA30UtdE9S3cxMaDo6rC5xkmIgSzc7+TXZIBTIGwEfW442hS7MwBdK2ib2yO8KYI5o5LVRW9db
	6YixcHNR445fzxHQ+HXEP1g702tksHVKH7lzgaCMIuaDDGq85App2uT0u1n5z7xCqqKaC71msrQ
	c3Kk0VN68/0ZhYG1dDxlc4YbdH6/aIBjaouUf46Mfm3901+d044Dh0mnw5nPUIcbOgZngRuRqBE
	rvgaVlnbLxhATGSyQsbBjI1yvNWjS8CA9gunR5cFLXZCwsV7D5iQbwmXIzMZIORmUv1Vf1/3lCh
	6ZigB9Lndt8DSJWiJs0Da9clZE+aZrDLg9DjK1aCzFb3XAhiTb+QPefnv2HdAf9YEXG9js=
X-Received: by 2002:a05:6a21:1f83:b0:3e1:1faf:eb73 with SMTP id adf61e73a8af0-3e7e84e47ebmr598064637.38.1792819199414;
        Fri, 23 Oct 2026 22:19:59 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36ada2780sm241619b3a.20.2026.10.23.22.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:19:57 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	yongxing.mou@oss.qualcomm.com,
	val@packett.cool,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/msm/dp: hold one runtime PM reference per plugged state
Date: Sat, 24 Oct 2026 14:19:52 +0900
Message-ID: <20261024051952.2006-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

msm_dp_bridge_detect() takes a runtime PM reference and keeps it when
it leaves the sink plugged, so that the plugged state keeps the
controller on. If the sink was plugged already, the plugged state holds
a reference, and the new one is leaked. If the sink was plugged and
detect() finds it gone, it drops only its own reference and clears the
plugged state, so the unplug handler skips the put and the plugged
state's reference is leaked as well.

detect() runs on every probe of the connector. When HPD comes from a
later bridge, such as a USB-C connector, nothing else keeps the
controller on, and the leaked references keep it and the MDSS core GDSC
powered after the display is unplugged.

Hold the function's own reference for the duration of the call, take
the plugged state's reference when detect() sets the plugged state and
drop it when detect() clears it.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Depends on patch 6/9 of the IRQ_HPD series v8 [1], which stops the
plug handler from taking extra references; only detect() is left here.
Dmitry, feel free to fold this into that series if you prefer.

Tested on v7.3 with 6/9 of [1] and this patch on a Lenovo Y700 Gen 5
(TB323FU) with a USB-C display: booting with the display connected,
plug, unplug, quick replug and s2idle. The controller suspends after
unplug.

Changes in v3:
- Rebase on [1] and drop the plug handler part
- Hold detect()'s own reference with PM_RUNTIME_ACQUIRE_IF_ENABLED()
  and take or drop the plugged state's reference only when detect()
  changes the plugged state [Val]
- detect() now drops its last reference with pm_runtime_put() instead
  of pm_runtime_put_sync()
- Link to v2: https://lore.kernel.org/all/20261007155848.106-1-26rote@gmail.com/

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ed899fcc9189..5f9402921efa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -908,6 +908,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	struct drm_dp_desc desc;
 	bool phy_deinit;
+	bool was_plugged;
 	int ret;
 
 	dp = to_dp_bridge(bridge)->msm_dp_display;
@@ -915,12 +916,14 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	guard(mutex)(&priv->plugged_lock);
-	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(&dp->pdev->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return status;
 	}
 
+	was_plugged = priv->plugged;
 	phy_deinit = msm_dp_display_host_phy_init(priv);
 
 	msm_dp_aux_enable_xfers(priv->aux, true);
@@ -970,7 +973,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 			msm_dp_display_host_phy_exit(priv);
 		}
 
-		pm_runtime_put_sync(&dp->pdev->dev);
+		if (was_plugged)
+			pm_runtime_put_noidle(&dp->pdev->dev);
+	} else if (!was_plugged) {
+		pm_runtime_get_noresume(&dp->pdev->dev);
 	}
 
 	return status;

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
prerequisite-patch-id: f2dbe1f42c357bb1d32081f58660ed1fac8f7777
prerequisite-patch-id: 358e5f35d442041b88e52d8e39a564a053a0f990
prerequisite-patch-id: 9860b9acb12b1c2652e4e9f4860968a2ca3361f0
prerequisite-patch-id: 53486e695198f785401740f7f4372bdf335fb620
prerequisite-patch-id: c8e551a07553f7dc107063a1dbec1d415184f97b
prerequisite-patch-id: 1a6251919897ca5e8b12a63774a833fd8460c67a
prerequisite-patch-id: 846ab694795c6bec123d1dc46d7a53097bf594bf
prerequisite-patch-id: 2a058aa8309016f424b1d4ca19a9b20e92f4d8b6
prerequisite-patch-id: 76ea1ecf4e1d83ce2e5730aa36ed1a4524f15e56
-- 
2.43.0

