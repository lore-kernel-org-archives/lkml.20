Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776883;
	b=ePnXdQdSRoqV30wJ+hbIfpA/67muTHyNT6n1RlMQkNrHAGWuGiP68H64mMgtMEIVyUa+
	 z4x0R/SnkDX3dqTErSqLgVbs98ZtrMFQOzdGABZrXC82AwnwHMMx0NIbP+2i+1AJbtpXS
	 2TjnAf9TOUYnIHJwXVaAgL0Mbf0+yu997g3cvYWs9UA1yqqEa6ScWtJ2Kuve9YY7M0qQV
	 n8L2pVe3HCdbfD9az/L4XLsRaDGDkxB6qdaixshoQH8ropDLna7uCgFUHDWFUee3yLHGL
	 0LE2ws9/mFl3Ps0FGoVVH0UEj0MquoBuTOQJTPOHHrbtBf/+OTmw4jAlceIxScYTOYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
	b=Ya33DKoSU96/6m8leTQEa7wd7aaZbZq/suy/d9enp/V8mYBwcGf46oH5XTbZwQrbGpiW
	 6li+rwoJZzgThIJv8QBiYArxGEOU8SBdOSnTl9xOFnWiOpUTTAKTApQNSeyrxhwWUsfgW
	 lLeq6yb5peZ08rRsb92Bnwut+gEoY3GigD/yKIjw1XZrBJdqWFlfjQ/+VuRXo/Kc8IroA
	 /92GQcWl8DGKpfsogTVQzzORgAHjPjxoNW3Wf8x+iiTCcPgDSkJrYqSYjb2jWxdKjdvxU
	 a3PzMhVyx98xjN85QNlXaK9e698eonD9NKkca95hKLmQjLGAWWjAo2yrU9zveHT5tDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s04muIap;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AEB606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AEB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s04muIap
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so3823595ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776883; x=1794381683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=s04muIapcZ9Piy2/cGVdXuDKZlGwmNqHIPw+ja53Na+IyW+ZcXoh8Ae75YcX4BgZgj
         YaEGSPcLeAruFsHyeaV4PUYw/pKZ4iKUuL7iyUHI3N8fi2HfAy63ylDz9BBkOcGDTdgd
         5y7JagsYeyCU4x+ifhC0TgesXSH9fXZ7H4CY0Se79aF+aiwKFKRQpXdjVHzZ03+5+rDP
         KEyIVv6+V3tcjXU1qdJynCrq8uQh00T7nEo1qrStmt0xMufkkb2lVwsLzmyrQt0rSlu5
         h+myLa/Bt+Rkv/ZsmGjKEJWG96NnkJ4Y8e3ZkfXcy59ve+04qJZO6eIXj2LApM1wG7vD
         KlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776883; x=1794381683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=gEwHR+rLAbcggmz53BO0WfOiXHrlWl0XBG44GSkCcVt7DklSujWAsqv19WDZBj+ro7
         cMvGxFIPGIiOgj0yPpNqEpHM1DW3qgNcTKHIXzJPvRDWfXe/bxcODnLRHfYlZPy931k8
         hSrgSCusvPsIYgzFtWEn/qJEU2eLy92hIqbGiGipLI8IjAXFYeE/sBIks6f3Pmlm+1Kh
         v/OiUub2A1kaU0LOW7/H57p2NJFGWDkQ9i/81wnp5epwLQoufQ6cG8S7IZcGygGod6Zg
         kI3hlCMe6vwg98TTHJNEq4GBeERDKDrf1uEvr9PPaJbQ7Dy48NBV2xnNvUU4ckpBy9pi
         GbFw==
X-Forwarded-Encrypted: i=1; AKwUvBxr1gm+5qbzGpSadfjo4rvbT7XrcRMjPHRbbURUAT/SGxgKJSVPE1DM1i7o/5zCJ5ZrGMOFe4gUAi/j+HI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d0qEByKJkJ4Dm3KhAmx6j4Cfd2PMyIjL+7rNQSm67luztiNpi
	qPo8rgubsos0NqCEnHSxyCpqGL+xC22TMicLo5ZWYHRzS8rdYSHZwro=
X-Gm-Gg: AYBFou2hxFLqtGIE4xL4E1K7b9lXlPy2I9cN/IWBzSZtHyEHNeuixR6IwkERdukeUKG
	hxo8nYXk+wZCmOzu7Kni6yNDX9NpW6VtlyANR+4IgE4adtsl2qiVXWGWT8lwUbKyljKgKn6PSaF
	g1IiV8QV9xsDS+F0X0QQHrMerJE0FGVnEruD9xj4zK7oNwcd96iPqULRYL/LWk4lxUb1lwQN8g9
	O3VweDb5ctbH+lNvg2SAyi9sop2Fwczzgjiqx1xxhss40JhGqOwvVmmodKOK5bMTMFtzXjbIt8p
	wxwq4HRIfbTv8y3LmG+BETAkDJdxvIBxWrCW5Babn6KgXe/c3NYxymT2US1b2J5rjC6Si50xhS8
	lerQibbJkBhmItXpMxqQTq/vgs38Xi8ySaYPkt/Uw82b5e7yow+guQSRuw9E8OmDEVjxm/k5o3v
	gh6h5Rq9/YG7TfKJNma8wGEaVgJN/KRKkkisTB1NYif6HSv6S7Zx6i8uvtgetifGTGBNh9gVoDt
	TmZRUqcAYQ4/3Mgw4LBcc02zY/IitSHj8NU1Jz48Y34jfPW83J69MfBg/b+U0e53j7hJsbNdsA3
	+/jcvRD7OMC2lY5Ca9Sb+y+3XomZujkR8cFM9ZMZ5eFfoVTATAzx5WP935n5RtP5H4nf
X-Received: by 2002:a17:902:d2cd:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2eb364f8fe2mr149925825ad.51.1793776882756;
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm3950345ad.29.2026.11.03.23.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: robin.clark@oss.qualcomm.com,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Xilin Wu <sophon@radxa.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
Date: Tue,  3 Nov 2026 23:20:48 -0800
Message-ID: <20261104072048.3486286-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Commit 1bda647ce61b ("drm/msm/dp: move link-level teardown from
display_disable to display_unprepare") moved msm_dp_ctrl_off_link() and
the PHY exit into msm_dp_display_unprepare(). Unlike
msm_dp_display_disable(), that function does not check power_on.

When link training fails, msm_dp_ctrl_on_link() has already turned the
link clocks and the PHY off, and .atomic_enable() returns with power_on
still false. The next disable now runs msm_dp_ctrl_off_link() anyway,
which writes REG_DP_MAINLINK_CTRL and pulses DP_SW_RESET with the link
clocks off. On an ASUS Zenbook A16 (Glymur, eDP) the SoC then resets.

Skip the link teardown when power_on is false, as before that commit,
but still drop the runtime PM reference.

Tested on the A16 by forcing link training to fail and then blanking
the display: the SoC reset 2/2 times without this patch and 0/3 with
it.

Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Burke Cates <burke.cates@gmail.com>
---

Notes:
    Test base: v7.4-rc1 with out-of-tree Glymur platform, board and eDP
    PHY patches; drivers/gpu/drm/msm/dp as in v7.4-rc1 plus a local
    knob that fails every training attempt. The reset is silent (no
    pstore), so which of the two accesses triggers it is not known.
    
    As before 1bda647ce61b, a failure after successful training still
    leaves the link up. Xilin Wu's hdr10 v2 09/20 handles these paths
    more generally; this is the minimal fix for -rc. Happy to test his
    approach instead.
    https://lore.kernel.org/all/20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com/
    
    The bug was found and this patch drafted with an AI coding
    assistant (Claude Code, Claude Opus 5.5); I reviewed it and ran the
    tests.

 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..76784cc45228 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1528,6 +1528,14 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/*
+	 * Failed link training leaves the link clocks off. Avoid accessing
+	 * link registers after a failed enable, but still release the
+	 * runtime-PM reference below.
+	 */
+	if (!msm_dp_display->power_on)
+		goto out;
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1542,6 +1550,7 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 
 	msm_dp_display->power_on = false;
 
+out:
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

