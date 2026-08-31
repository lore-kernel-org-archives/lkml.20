Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69C3DC857
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164334; cv=none; b=cQhLAq3N5u3JkhHVaRFm/bGD3MnT1m7DTvMaTUU0ZPwyDEf3KzoZghCErclbgxtYCMQr0fIzBpK/zlI29/plTNxfs911CCvtcl/avq14cagIRG+UDYiCT2vcW0m8hTGs8IZ5q3dC7ztNX4RWuAhKbS+TD0L2WWPKEA0ywwLpDdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164334; c=relaxed/simple;
	bh=7cHxGtm7UpjoOZpjMI3XoVt0sm/4kBJOnJglm7/m82U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTXbiK+zc8L/kDyVsiEukywd5j5r9afjQQzt/mPNMXv2ziEpfqyfiOhB4fRKJVrAVJh3fSSaD3+l/BE4UUZ2JkBMyKodJfDLAIjK2vEdtQ1nmO9c6bV3Ud0seWgX2nmvK+/GaoyodjpFPXPCYIwVR6GosnvhU7POg8YN7oR+E0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZFMoDSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeMoHf/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZFMoDSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeMoHf/2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xFq02332428
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtHvW97i03ymOEo484vp1OVXCSWAzJDybaxPrTlBrk0=; b=UZFMoDSl9+ekXDl5
	9ko/19Yi4kYsfhvA4UlWQjbjx37HMoIxoBm7142ogWnd+fCSulECHaOYqfrpktn+
	KnaU1buC6NeRz6vII9A1j1uuNceu80MY5p+tds34deUgFnGqtFCetLxSZfjjt+wW
	a1adTiQKEKk33neFYuQYNiyPx/UdF10LBXzmxYksugFsB5p3nEI6JP2VcjBkPPv7
	l+strtGSb6ph3v7i/vkfo+LrViEKZHRkRWRJz/LSZQ/9qCKATjKPG7mbhL9h5Cib
	hodrTH6IDXkPEXJOxhM7LjZlCZ9gP65gyzVOx73cET5aYyouLGbdbnxp2CzGdWML
	Z6Yfbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq856x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so43128501cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164331; x=1788769131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtHvW97i03ymOEo484vp1OVXCSWAzJDybaxPrTlBrk0=;
        b=DeMoHf/2KkACJxXB+NMmWjcXminMyw45AQr3f3OyH+l/Rsn0Nnfa3MGLkN8ZYobvZz
         MGp4Eerr49nO51ADTf9MDvWPEO4QkXonqTFTpaF1ToR0PQ2yTONpPwbJ7hsf5TQkHBoh
         Ua6YRdJuLbLtpVIfZs9QkgZN1RZuvKEN9BO2llK+tvZuhdzzVT8LlSqytEooA0SAv4Nx
         +ADkAkAk98NJLiITTvCKa40fzq4MUWE+g+Bm+MGOEikYsam16Mcbq/cjuM2DdAMI4isv
         GzV0WYc/Jt52CPyLVjr0eBAOReZV3N7yMGHacGBF/fkjODQMePnfhDXVN8Tc1jKfL47V
         irpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164331; x=1788769131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtHvW97i03ymOEo484vp1OVXCSWAzJDybaxPrTlBrk0=;
        b=N8cMZQBOcOtl1GyFjyr9BtkJNlAxU2UQ9AqdvuLWaAj8zOSjhLd2tWrnGBNXxFDMeN
         5I3AVay7a01q1UuSzUzKqudvy16Ejz0KHr841rdKmglrPG6dIEa6MUvjlSD88/69kVbp
         tgEPDKgus2PKav1QfO+pT7TbOwvyx+HnoWt4FS9f52T865kIHJ00LxNz9YZN4VEpZLKe
         wCkd2ePXkLNva2iSgx8hNtEPkrwPDUw2x6PwJ0OYMvcRtT1SvLRk7cbPsH73687icbQh
         /4I6nyo9u5nkQfjCtxGBO7/uT/l/Vkar5F/MMqHc2uRN2LmuDQ031iKMTwHyXL+B+oL3
         9uPA==
X-Forwarded-Encrypted: i=1; AHgh+Rra2dD7bWzUtEcOOiwfKwPpEw6QbyZx+0rTrXsej7nD9Wzbw8eUBM98DNjKRN3PIfZ81hFxxJp6hYKDw0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kpBRp5qXKeVcJMX0IEhNoN5C2sPh7K5ct8X7BBP2z7Ch1iJk/m
	Gn+D6ZFKqAbJQmze2YqA1nVurAzZVcz90dG5hab/HRT9OTPrZOF2CyatYeC5rSuMCxLrvYz0XKK
	ithgyQHtjsr/mT1gF3F2Qy67ZAY+IiY6nANhhBCK+a80Uk97wF82mP2n05CHYiBzPIDM=
X-Gm-Gg: AR+sD12emq1J6hXGXugVWPCn//QNBvzSNlfrLX/+iNguea0gYkBenOPZcmwY32C+q0q
	9wXex8DB7EG1kQWfSxKi3++cCujWKdkN5LGWLvZviNBE9nFFgAbn63QXJ9YIzsmCOSvHwbmkO5/
	DMI8/roZE1izJ6MTiJulgjpfVdAGQTAzSKZxewcO1trG0ggi1LbHc1Je6L2T483aqwvf0BWETyB
	RpPxANkUf57HnSLHobm+Xgl0QwLi8GK0K35BlNMY/+1vx/S8UTfFVAokmWCcxMeWRC/5bLZr7uG
	vCXHUzZ7FFuUkgk2oRCuI0gTuFF3v9DMQNHmYaf1fv5U38MQSjXfb9/6jmdilLj+sJ1YU/RaZiW
	KqV0o/IA1k9hUlfVdOoRqNsa577vpKYIv2yfJB1hYvenx+yqX/6bdtagcvt9rGHQ=
X-Received: by 2002:a05:620a:6988:b0:939:1c6:38ef with SMTP id af79cd13be357-9391374de9fmr2727779185a.6.1788164331243;
        Mon, 31 Aug 2026 01:18:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6988:b0:939:1c6:38ef with SMTP id af79cd13be357-9391374de9fmr2727776285a.6.1788164330773;
        Mon, 31 Aug 2026 01:18:50 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:50 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:31 +0800
Subject: [PATCH v6 14/29] drm/msm/dp: replace power_on with
 active_stream_cnt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-14-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=5066;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=GJl85rX2L2niNbZCL3wSxiXdb4cNZLP4ul7aPSHeeOA=;
 b=+2hL6IQ3VElIQ/yZhfXkp9lmDPPVrFdPBO2Y5nH0HquFxi9q4TGI0Ti25+gLW/4tGHIuzugxD
 VWttT4J9ihwBfICdYCr66++KIdtbGWaZKjLSoANI8MXOSzCAJhLQ0DX
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: TKy0K3DJR3VHvmwLoTFD_t9wAyhSMsK1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX52qgdbyF/5fO
 BiVXeD6Ostrw2TYuiajFX7ai0g8G1ISasXWEfXG1D4IsSHKDF8mzi1cUurCNr1KO1+qUrZxNBEm
 KtZFXa9TZg9HwrJq6tnwQLlTL4y11AE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX3YQZksAqMbGs
 5N6yWgINKfAZLlmHMyVQIrfd+gUAgZNJ9BBzWKMullqSdyMZ7FNElg+fMxecR8U8XyjXuODEkVi
 Xkwva4k775kKCw6IV0NlMmiEu/1c4kTy7D6Z1BHDJfu7NfP6wogaJafuKquEx8J+cMUCPCfxKax
 ue5/S6nu24Pd4tUPQwP9G50N7sCLjsarlAz7SHueD4JtjcaO2o5ogK6cpdyW9QyPjMnC8l/alIQ
 7DmJlvfJ247TJdWW45cC4eleUNeNWevel8E8WtRGINDvk4OtFnBF+V/eNQJO8Fjr8SvS2CTM0P1
 42MLiV1Dprfftg06ZzqurtaRWU1vdZlikeLcDQDxydiPQWZRQ/MnUhIU0TV5OX6R4cKFJRfl82L
 wEgq08q1ZKV3AJrxuq101/t7dvrbKOnVdJLByUAuQEGJuCMqmPkwXC8FDV1jvSaGehjHvUylQQa
 ei/wk0KUNz9t12/u5lg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9538ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pA7EhmVi1NdrnwtGoTUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TKy0K3DJR3VHvmwLoTFD_t9wAyhSMsK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The power_on boolean cannot represent DP MST, where multiple streams
share a single link and its associated resources.

Replace power_on with active_stream_cnt and use it to track the lifetime
of the shared link. Link initialization is performed when enabling the
first stream, while link teardown is deferred until the last stream is
disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index df222943ae57..8118130a3220 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		goto end;
 
 	audio = msm_dp_audio_get_data(msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6f79328c8b79..9c5563dcb856 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -645,16 +645,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			// TODO: schedule drm_connector_set_link_status_property()
+			return rc;
+		}
 	}
 
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
@@ -667,14 +667,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
-	if (!rc)
-		msm_dp_display->power_on = true;
+
+	msm_dp_display->active_stream_cnt++;
 
 	return rc;
 }
@@ -723,13 +719,12 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
+	msm_dp_display->active_stream_cnt--;
+
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
@@ -851,10 +846,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * if we are reading registers we need the link clocks to be on
 	 * however till DP cable is connected this will not happen as we
 	 * do not know the resolution to power up with. Hence check the
-	 * power_on status before dumping DP registers to avoid crash due
+	 * active_stream_cnt status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1517,6 +1512,11 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1529,8 +1529,6 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	else
 		msm_dp_display_host_phy_exit(dp);
 
-	msm_dp_display->power_on = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 317c19b809ec..7bd510cecb44 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_cnt;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0

