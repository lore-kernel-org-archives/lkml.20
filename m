Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B987B3D6CB4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164347; cv=none; b=hkRMSUQsy1WYK6/s+ALvlfXQFC9wk0Bn2VRQAa7Te+n6FIfXzwTY2awiUA51pPuFe21kAcYq1v5epD1vrHpRtDswl6Uvvcu+9rpq70X3R7r7m6ObGZf4NjNsQltyqpPnXsHsqK+CTX4FrTEISWXRk5q2r5UXbeUeF67jGrar8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164347; c=relaxed/simple;
	bh=uuB/kWSqCnC2Anxq2zqCZAxFvPhs/LbiFjZoseT/nlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbSHxX9ainOFwcZ8LeOvNNZbL0O20Uo5G6UCS/gA5mvazDl/It6wMWqFtXQ9HFM40qW6n21ImlgLFFlLenRPCkmFWmHyBro1VyYapms8g0dBh+s/JQ6hd4peE/U05j9+Krdt5ElDELZen7gz6EJPyeIeLTg85BsHUatk4PAr6Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lq9t5lQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbnKWhGZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lq9t5lQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbnKWhGZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xlwK2824588
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=; b=Lq9t5lQDFqSkLzMV
	puYPO3u+TyycIReAIIwXDV/k0U3k3b+r2Cb5+rPX4Ynl5ifeBQlmB3WCPu+Udiq0
	ARnSjJ62WiPF1wGkCzpCriUUxBzw1qwM5Pu8DtqXxYpdUaapgTsbawU+guW6KWKr
	GhIEXx4leRAhocNACrr3Tb3TbjQENLs/ZxkqULRl0fRfn9eJPWRaI/scs9jELah9
	7EHCAHbvZvAfEJQevMHOQq4V4MRXBD209T8HYRnMXI/LyhFrYoRN4vQyGsz6iQfm
	2Bt5uIg2ba8wCvhMb9gbAfafolV66tc/wVXHCt0z4jLcoMgzGocWcgjRf0ICarVz
	Es+Ijw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2ddbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso705383285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164344; x=1788769144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=;
        b=SbnKWhGZdEtYJNd8uLqR+AfX9l3aL1iWmxJhGWYT8Edil5dFRu8tXiajSMyz26w7qy
         VWKbGt4sP+r27fgTw06z65xp92hBqZzOK9pX7S/0ABiTZOpRfqMMuwhtIOz33+uEkpDP
         RPLrDM+AWRb784ThQwP4phw2cXPEKssCE61nXm9QGR8jN7inhADWx1q9Xh8MjUiQotd0
         wbtUzMdi0iy7b5RX4ffaPm4sYZwU7O6fGPgtoSIAHo75hHkYtImAZQbuLERifNzZpDJC
         6S8CaG/NamrpoASXY2zoN39xb6SIwdpv+ckEFBT6ki2ozzZ5Ihl7a+iLjzjkoUFfANM+
         m+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164344; x=1788769144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijqdpdqd4fOklmbBbFbJhuoyH/PigwN1E1PBP7ePCFw=;
        b=OCNPLXoO5rNJS9WAXygcL/A35RWFMf3HCm8WwyBTS/7EsCPJrnI39fNelyL5JBI3LN
         JPT0cg/Ic/s/QJgp07vhx/iQEt/tdC9m2ZCvWA0z0wyLaNklzmBJC+y0LLDas9iIDhrJ
         m3KcxBxWn0fjJ0OrNuIM7qoUQadyq2qfbUnRxsBR/hzlmaFatxtWki+gQrJdnTiSP3He
         XF9xRckZdD+YRl+DFgiI53Wz7CslesdwvK1X7+nQ5UjyNxl+huU8KmO2GU0GULFOgQ3D
         hGuSeBLJ3ghPRmvWD8gwRhQx/w1Agy4c1KqB9XewHfpJfmRDfR3q0UKplrCeMTTZ0XQG
         f6GQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeSNB43Q45zgCX/kKCSgoE1C48E9z0RKbdHfL8klP1hSgCnvqSs4s6l5d9bkXfMv8IkGBvmJj//EF4IpI=@vger.kernel.org
X-Gm-Message-State: AFuF++lSv2l7r2LjVqk4XCgDesyxGE01ZC2MdULN3GJC2UNG98j8V6Jq
	LBtR6RrPXeF2TQ1bEZqmkpl3Bu/UzCcXmVcQPS3JRI2hUvhl9c4kUdM9QDNhXrC7hZkYPNknKm2
	bAs7GQOTUVAHNOdvxdtewgIF/sWgSNCibv5/sZcNMbl5XWUsKT7gvPEYs+6czXTULHkI=
X-Gm-Gg: AR+sD13chqM0AEAJGRf7VA1N8iWxml0x/iKLEbFr7n27zU+LRN7WWxXsh4P9Y+jcIha
	iq7jcRAH4RS83Eu6DjJ5SG5Zj0EV4vDhvapU1JFjWtStTv4nKKR0pKiaLIYF4s6aIHy5TbsvZJS
	Kbbam+0DtagES8DHFnKXV1J5Tz8G84VAo5X6wi78BUzhyJvUp6oRdJAK5/6D/IKM8cLL9JVEhwK
	hZRchOZUBjjgNUgYNCFj9rHqDmx7Qm4Halo0Kx570nzeyf8YlmFdxbLBitq32SAoBVPGMFtrI54
	ys/Eh96jvH5w4jmAEQt1NwbqEkZR2EUvRzxuKql+sD7IZd1v/Xt147rB9RMscsD5hKel6PyJ1+v
	m+vu51McbS09UFeFMRcj4LVCrwb5GwMw2S+Oq92aKCnO/OZYGyMmgxlGbgsdpoTA=
X-Received: by 2002:a05:620a:8ec9:b0:939:492:20ce with SMTP id af79cd13be357-939137b3b66mr1631238985a.1.1788164343911;
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:8ec9:b0:939:492:20ce with SMTP id af79cd13be357-939137b3b66mr1631236185a.1.1788164343495;
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:33 +0800
Subject: [PATCH v6 16/29] drm/msm/dp: add link_ready to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-16-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=3537;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=uuB/kWSqCnC2Anxq2zqCZAxFvPhs/LbiFjZoseT/nlk=;
 b=7Bp9XavBeVerBws9xUJYdFSv1wxDi6k5IvyNyqbT5GQqdmLhWm2kwqkxJfELrHz9CUWC5wdRD
 qMjk71yKkgGDUpfILjeooKLCrqQiNs129OUbc/9OoFMPRoVJFQU14qD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a9538f8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BYzu2gpcbUJpO-7lbgUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bUltfWYeheoNtj4pY3DpRbc_RGEpN0YC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX9vUJtZ5iExeo
 E6OueVQ81jRg9m40ybhZt19qG+LSHMZ2Tc/rsJNMxcjOugBGVFLIN/K0F04WVQ3QggBQUPCBSeI
 Fep76B3XXQuzWkkHAIxmuhejY2do/SIixjuUTdPou1eCK2J76TarYHCI9E7Sp3/tMH8H05kuvDE
 VabHaGDFKMIeA0zQXzRbl5GH1mw1acIEAzHwZXKJfXkGFPGvxQRNTioJu57X8sAXFQ57UQIG+Zn
 7pyNTtMBnxCtz1TemxFSupr03ms2S3LwzMpC3Y3vBWaUNqZENRfSpiF/msQg4/J/EIWg5bBTsvv
 zs7cwMzhJUFUmKWgApevCIlpIxCLDi5VUE/FEF7Feua0Bo/26I+1iYhQjm+hGaZuVGS/Ii3Sp2k
 nOsZnT1+ESqoMf8QpY7kKiZ2KRwfa0XdmABDhlJI8VPkZ4RGLgJccJIxLmTbYzg+j29HE/w+Mf3
 Y3q/Om/39daaDnMpVFg==
X-Proofpoint-ORIG-GUID: bUltfWYeheoNtj4pY3DpRbc_RGEpN0YC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX4PzEdb55/Xeb
 Sa7oO9U8Hrj85x4gr3SUgn4oTQFco4ElW7XCGTzuq5mFpoVGckmvIuAu5fgvoIHgSLh4KEYc1IV
 aCqPudKBLV660D4pxTY/bp4z7/t7M7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6103fa67f3ee..90e3d2c4ef47 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -638,6 +638,10 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -659,7 +663,11 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1493,14 +1501,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1543,6 +1553,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1561,6 +1576,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 9ecd5025fe4a..51eace1d1346 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_cnt;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

