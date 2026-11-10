Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286527;
	b=ulL8J045A9tvv30qCxIzZOtfkkEc6ZR2tIrPi4dU04vt4QxXIWId3CMocjWxf/mqbDik
	 qXq4qji2/+X1OESBoE0uZq3NPCEzYV0i9K7543zn/ABJZ3bhbCUMJ5nbXzc+z2jWTnQUc
	 NQ65r0azjCwJ5zvLC1Pr9znbiAtEp7OZumf9M1YFQnMZCIc+qsosMHsWNzPb3kvEfBrEA
	 jnIYCsUxcecKIHedQJAtXYiBpX2zf+2Y4283Li31ZKMM0cfGRHi1pT33GFZI4VNwvVPu9
	 YdFsOFeZc7FtqYmSgL3uzpCzKorJOBZZmP5qumhrZ5E0zLfYMcsdt3GgFvl1wsE1pAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286527;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21sbXEvtNaLwvZgAtYlqYJiHWlnEstcuCjSCkQvUWdc=;
	b=mcoi9YGBu8c2PnBreV0vawEGxawFp5ptTP7sGEcwjv2J7t0DuTXeE1NFT3/eCTtDaeLf
	 5VzX5LkiSuNfUAPX53wCmWsjft0GsZEa8ADWQMHFm1kiXdDoL5RnZWoAp9HZENUyyFWVL
	 8h0eVaQxJhO2PEPm8+kxF3tDThxlVW/wQMmoynShq/XCCcboAumgfOtJPmwfncCdeRsXW
	 U+9ZTXCRnPiiK69+rKyjSiUBtn6kp/qgnN/GXDVUl3JZmuCPFlgFBI10tvKu++LN7FGFN
	 aS831XOnYPTNbYiWaIAIO1PdNiIG0QoWyg2CtLQrmwU9WqiDlKhLMUVQs83FUnjrCHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g67J4S00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NZUEc3Fr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49886606A337
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49886606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g67J4S00;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NZUEc3Fr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2vi1767571
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21sbXEvtNaLwvZgAtYlqYJiHWlnEstcuCjSCkQvUWdc=; b=g67J4S00QJlqdhfQ
	Cu1XGNJkQJwYFz5fZpPGOHJrP5jikUWHKB0GIE1xHd8Doj7gXDtL3UPd6UfMh4no
	DoPSMM4vA/RrVP6qRWdgL08yzCDsynDKD8t8RexmrAJH4wKaSNj9G6ZGLlZug5GJ
	QgJa4tulu1qQBbvwVE26bWMtj6+CtlEZZd3WzHqcabwYiuappL2cbMNbe7qsnGIN
	WuoNJNdwXjXwZNF+HXKakL21DFeURiSGALzqDpu2NNb6Dd1a6SYU9aQ8wfE77eYn
	APlQk9e0zTVollGop/Tx6Go+U/NShMR6OMsnBDGDeJXnrT9g41Qop/vZW7J2jcKc
	vwAAkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp093m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so299715185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286525; x=1794891325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21sbXEvtNaLwvZgAtYlqYJiHWlnEstcuCjSCkQvUWdc=;
        b=NZUEc3Frllfy4QLHoi5KltebZapiCws1HeC78TXU0XkNGaD9PKe8sHrNWwecZ063G0
         85NvSyjkOnG9AfAwUO11vpcTBwLeMQTiPOGl0HjMkvkWUGsivfkeuGQD753aYBWnTzAt
         rBRJ7B1C9MzCf8lMMUtK3/wwSvWMjCC8xgM3izAbUf1QuRdjG/Ryd8Fc1uOES7UTHJfH
         5DkVzlDlKbKQ6EjoK69c53qlbwEUCfOBg2wEICKzhe691WOj4xDdVWW8hiEEDkSZapwz
         y+tsF1uzxQjnv0IOVWgRb6O+CWCRkPBjkBXn97Ov2M5y2gb0Z98V3RG5+IzjJnWbnBXW
         dazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286525; x=1794891325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21sbXEvtNaLwvZgAtYlqYJiHWlnEstcuCjSCkQvUWdc=;
        b=pB8/czfK6I9Q4AWOQfq+V57KMIHwV8D8UC9di5rOZI3lRyBBBlb8cZaDO9Aan7PCmi
         MXQRIC4f24sVBMJcuZqyn0ahWVrb2BBCP3MfQz87onD203lxSwP6R4u4rRoGdBzhP7vN
         nbITiPbS9W/C7/tNmEw2vjuzKAxVB5dGI5GNe5DWz0huHSGtft/dxSOQ/mrZTbc+Y8WP
         MmxCWGohxCbEB7L9T6wg6ug5wWJydnkhX2eoz0hM62Jsn6Z8sadNGASIY7jsUuQXtri6
         9zxD2lOtdqzBsE50/cBUUgYTS0AfNEluH4IbipM/5ft/16pEN9nNJi+BewwIxHHbUPHz
         rBlw==
X-Forwarded-Encrypted: i=1; AL+hErGKmsxSCiqbiA3ZL/6JCYgyxkoG3c5i9BWvaLqhDr4t2dbG2J6xrQrg4SH9F4Vp1CV688nvnlxzd3EC2nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yYO99ZDoWHnqhXSqoEFMAbsfe4NAZnNjTM1AkHo4EnuPsh9D4
	p0/KbCngwIfow+gw4j93lM7nimufkasXdbrz7E5ADTosZcU2qYa7T4cSuo4NWy7PE9Gb4VXXrRt
	tOftkWJON3FgYk/k0IeJmninvb1Bh1+GHWJeDhxN5iTRtEaVqGaIfhOBtUlKzC8/laZo=
X-Gm-Gg: AYBFou0h7ji7AH19NFz/slBsL9RH2NUTY76XJV7RzjT8i4ylNGWFUMpzEd4DirqyZx5
	L+gsbA1lkZSGfupHbo5K51LN/jO6ZPIFYAm1jt4VlyKqt/AxEftQvIPSbGTnxttR27qFObVjX3c
	4CGTMHeIJsERJwW7FPpr7hu18skc4oMq5Q4981SA1mVHLd/QXr2eMgsIRqX2dHoX3zdNQV8Y09b
	pVDvzfTjn4bG5JVRdQUbklHC+up7TyJioXqUyimaM9t7eZmvkRbMRPKHwyy5C+egP12i2DYEfbU
	tgUtVRiDhRNLLHATfvgGzybkGGqQYNU44QqLOww1yf40pQIniuYu6tfoMrEq0hnS7xAYez2ThjL
	tIiHT51sNlkDDH7gWFV0j634gN0SC1AKKGmvTiX6HizUZfsDrD28rdWmudMMkGvzMsK6lzEDDDp
	OpTTwkNnKmh5+1pX35TR6+2ga4snYpVQj1miu1
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr252883985a.82.1794286525387;
        Mon, 09 Nov 2026 20:55:25 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr252882085a.82.1794286524985;
        Mon, 09 Nov 2026 20:55:24 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:24 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:31 +0800
Subject: [PATCH v8 10/29] drm/msm/dp: add link_ready to manage link-level
 operations
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-msm-dp-mst-v8-10-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=4075;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ntFGyV9B6QqY6KslrvlheiuWhIYtkbPc8mhAWBIq/aQ=;
 b=X9w307hVAVmYkzZxYYUUuZ2Nada4UXGgOHUYBTtqdC9dONvqC1Kybr7wTPE1jJj7JG/nLWY34
 GHT3osRX5ISBflTK5n6iKz44juGjCT2JM6ykTTd5IP7IAiyJMU6FJtf
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: j7BQBlVhdyqCFtd3I5Bv49AKbEu-rMTY
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2a3be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=r0U9Mmpn2XdHegFmGjAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX7WtoiL5GCUGS
 yJBLlU+NoJ+1nBl1ERtbdagvq0HsEYR/VGE+YD6OxJocmpVpLWo8DDpTY/AyL9SRuxgnSAQlVjW
 PT3f3qJqBDryOmUDcOFDt9FE8Vjqe0quPhjI+gajYJd12Wk8pGi3oCOD1e3UDyUijm4xH4Ry9jL
 PgHiBSAXOdtluWNEGbk+i8CBXa9mqAkkSqKJoirYdVG0vYv7YR6bOQjWE75ZiR0+qh1uwEM3zeQ
 gYR05WbMl4+5qSO79K33AyR4Abd9Rb/3mZteBG1X4qcxIKF2w3PwQm6rpBJR3shEjdDT+abeFLC
 KLpeEk5JyELr5czbKZRL3XUayviTcSuOdv8MEDI6p7jRD36fuGCY12k72vKyZXnWT3Ve6W37Ecm
 Tm39QWMqPWtM0SONA3DafWRRCmalqW1baN5roK44RWkpRPINcOY/p5IGQgnMpDQwdO5sHLnoWB1
 YFa6RfzYMRj4c22xtXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwMFoeAPw4LOA
 zyg4IVpKm9HnSewjeEM/m5ifgrLaC0jmoOt0SoPM2GUjzhn5J7dd5+IbmEGWqNCgDRp17zoCXrN
 etVziCNlB7KYoGlvZAHjB0r+5B7Do5w=
X-Proofpoint-GUID: j7BQBlVhdyqCFtd3I5Bv49AKbEu-rMTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 471085744c7c..6a522cc71a2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -645,15 +645,19 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
+	if (dp->link->sink_count == 0)
+		return -ENOTCONN;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
 		return rc;
 	}
 
-	if (dp->link->sink_count == 0)
-		return -ENOTCONN;
-
 	if (!msm_dp_display->active_stream_mask) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
@@ -662,11 +666,22 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		if (rc) {
 			DRM_ERROR("Failed link training (rc=%d)\n", rc);
 			// TODO: schedule drm_connector_set_link_status_property()
-			return rc;
+			goto err_pm_put;
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (rc)
+		goto err_pm_put;
+
+	msm_dp_display->link_ready = true;
+
+	return 0;
+
+err_pm_put:
+	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1504,14 +1519,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel, slots);
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
@@ -1570,6 +1587,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_mask) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1588,6 +1610,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index f6ebb3d409cf..b0b7570cb16c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_mask;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

