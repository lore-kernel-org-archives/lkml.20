Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAA83AFCF0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916502; cv=none; b=u3nuZMGH3rT8BFiZJrjQ5j5lpqxIodFUd2kMgAvqgf15T4Y78g4uN7bZZdpZvpSJMxR9HpR31tPo0XqPaW86VRE+dSgz4cT/EqmJIgh69M8Smkxq7RJGaV6ohs01QqSNEHus03jWZuhLqVGy7CA+AhteAp3+m8tM/UU/sJ8YhK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916502; c=relaxed/simple;
	bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KB9xpgCpViuFtgEh6oAialeGVo1thqyKTDtvU3LIBqTkJnL9+8GZkc9EW7RxcDkriApccRR64tsQ0I1w+rugTFObu8En580Q2+w6NYX+G/GOcQAdlVRrMWozEwPeGJSX0R6j5hpBFuAfcJEiyGYvWZ3E0oFtvANw+5m05ZaoLX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gWyQcel5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Csv4lm7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gWyQcel5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Csv4lm7r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo5R13271649
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=; b=gWyQcel5PQlGIvaF
	89v0J16W2kHow0eXcQk1Ikpk1UPb6+b0NyHDf73otBPE+HUejqvOV+/3rwcR+rSH
	U5tTdN0hyaMHO/toVhiJrQEwBx+XVWbhEdSdMFnrj2S7rZvfUiV3K34pTvOPkrVG
	5nBkaHu1g/PB7Psd/W5cXRb4uyvhcGZpEga5gmyBYNx5Sed3VcBk6L8s++B6t5Cd
	85Slr/CIGVr8XBZFhia0Aloy0DIF4rnnb+VN/6v70Ew/vV8ZvvP0ac/wL9F3pxTp
	Erf/PklqnDeZRWMiIPbxMQklb19aIVIxaiYql6XDrTCx4B6axyeKlqse+lhaYhR9
	DJO26g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbc6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:01:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5328dae1305so72605541cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916498; x=1790521298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=Csv4lm7rqvhw3ubxRT7bNPeqHClUbXZ4AwoaZ67EJ/4alnpkerdDsyENL5BHqGw+cV
         NMiVxvyRiz8o0u6jy2/PREL+e9UXSaBSQa7ptscGmtnc7UYrouDuzVmmPmPM+GYGY2oa
         Fkqmm1g6hjYQlYRUuFSiR8s+AUB7U3E1K3If0EYD8vXw0QVWZGAOVo/08+FE+Ft71WwA
         5G7a8c1rg/QblwZ0C4HNwRZHYUjTo0olwbqHYZEY8C9Jl9hM4FuU2YBBwxINot3OH5Zh
         64uhtTzKwwhm6A9KlSkR14FTzaTlYH73Boh5vASuTRFqkNrdcF42n21/U05R0ifQKNEE
         aPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916498; x=1790521298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R/VCzt/+en45nD4RiQsh8P89hnWT5xVva5XvHvRUZ+c=;
        b=zJsi3ZQccMoFT/+i8KMVt/GeiOWcR9b1r7z3SjP1zVdTOl2DzqtarSmf/s9Pb5Gu0a
         PpkBRqBLRg+TkoXLBIRpox+kh0mcCHF/RIL9aFWqk/LFk0nRH5U+nLrZFMZM8SzdIeCj
         fUGK/w2TKonSSMZ3OUGfrPMV6EMJSaxLj3rdQfcehWTNwitrVR5nvCqYbngfu5abbuu5
         o9ahxtkdGrkw6ZBvNZtM1vNk0mJY+XT0bwgs9z6cNch7AFbj9hpNwL5QtEtDyfXRo7Hg
         yo/zk/m+/CIIfHOCCiysXB967JxRNsMr0KIGiDzr+9eKdvTdeAGpJ8oNBrAUEDQbLH2i
         HoYg==
X-Forwarded-Encrypted: i=1; AKwUvBwn/Q9mb02VW9fWdHttafqwof+g2/cL+xDTOjGTv9i9qQGj8GyfPSxX/ToFiXRqmjS79bIQKfIwg5bN5Qo=@vger.kernel.org
X-Gm-Message-State: AFuF++n6GNQz8HdSfc+1IdYt2EPgsXO7u4ifKrvEcV6gNLszV1w9Swqe
	6fXyZGSJ+y3cvhkZGEjWvgchQawQYUQFMo0A1ZLB0JeH3D2iQ716n2QhIN+u8nIrF+y2hD/03Yn
	tZKaskYeik3Xu9/Wp9EV0GBODtPg9I6sINSPNVb9s9KjR5gEhbygPJVGvVUp8EITJFJk=
X-Gm-Gg: AYBFou17cEXz5dsW59CxmQlc1wpWzshiAVJeD3E+xePloOZ+BXf6+ezcKRz7eznb9ce
	hu1vu9cVRYc8+4oEnV301PoXxMeAjzvHVFaLFhXskmf34ZvBgHFG9+DPiKHvqWDfHuYEKh4ZxoY
	KDFVsWW2PDzkocRjpXMfefJVcQ6FsyMQJTK5ZuwKsw4zIrid82P/lWD4tgrHxKS36imQhNWlbyu
	Ep3fucpmxywh9MyMZjYQvbNfGYByaH3utuEdXXP+iPCkrb5UwNr2ddEXgH/oAKxLIbA6k16MODs
	qaewk1kjMbo/IYRC7SVlsWnfML+J2Vs8dsd+jJcoKGpT6KhfDgx6OP5iDpj68S9A/21ws3GiTHB
	Kq3jpbZ79WFO8xEpji15vqUDhb3DsZEijpbeJgVOuN09xaSV0Hg2jU0qtgqq9MJe4+LlIF7Tspr
	cVDEnVESb5JvTd
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544761cf.15.1789916497772;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:530:d1d6:792d with SMTP id d75a77b69052e-532b71fbcbamr62544181cf.15.1789916497205;
        Sun, 20 Sep 2026 08:01:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:27 +0300
Subject: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5324;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=97+qg8LHxoBgWChDxeF1jYc+0/ONjYDkNYGaAee/3lk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHQAEbomyPgJF1i4+z0xHxN/ABd0NoA/dTW
 k3gDKnMyFWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1fO3CACx3dvdjG5tUF5UKYmmZ3WVKr4NAbrSZvIxkHvDE9/UakP/s3iNZdimLdvdIJmyErbvKAc
 S1zzrVX1hO69AUkpbXVIMN3d/sEEz5VB2QrnashFbT+beRo23VpkXG5VqybBKszC8RLy3gqDW6I
 CEvj5tEOZoICbtxS2dkMl3QqN1BcQbFmflrOwuxr8iygJH+izfFEgK6YmP/X4ZwfCAP3ElB8brx
 l8DTFq8cR0O0ZoQ6f7ZvfJpWTvHQmyh3DPIBjN2QBDGJRLKebNuT0Tu5qO2D75RK9Xtr2aYHXV4
 zQ/+vgcDu31BgxRbPGWxvuc4+l+OUlusdfRuL7TSjKIyn1Qs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cquEm11piGyYIEaNleLMliyJj4PiCUqH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX/1cz6l5ENiSu
 6UzSRrkbSWCkEMw9WlqAp33UsO2aVRem5iE8Ee+D/EQp0Y8+atRC8YGU+0L9pJTnWrKgPuO1pjo
 kF8x3eSDSsHTdBIoQ7HHwv7JSw5SCSF6NvpRZzaD7+U5mGrL9D3lB1LTwnyhbrGX9ntjbE2gZjo
 AiqhwsxsruojF3SS/OA9rZ06OSDl59kZO0BNvwAV0mnQzDn182/bE48WTjXHS7K392Dj/Hacszm
 s7gIPCU88D8Wiq1LGDziP/zaZnRTQOLDoKD12IumXIG9O168sqNYpcS4Ihtuy4GRlMo1H6T2MQK
 x22UcLip4BRmlEFK8Jzyx/9jUYUd9GjWt6BBjecojZ1WlUZzEXHR/xx6kAwD94m6O37cfe4N7wa
 T/2jjK2kKoyN6rgBcCwQLybsd1Y5YeSrCJ32Ih8NFpee9u2DThpdA6PUtPZ7JNALDY1Rc1y6FPH
 B8mqgqMB8Bb4S3oPs9g==
X-Proofpoint-ORIG-GUID: cquEm11piGyYIEaNleLMliyJj4PiCUqH
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaff553 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Uld_eVi5zExU9UbbJsYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX8D25n+FwGsp+
 agJkST8sbuUH/ry+MP6ejUQ97PHVPkfAWKEnacGCtr3aADnbolSzG9jIL1DQqIVTJvNW9JCthLk
 cKdxI6oUqVxS57XWs4RJcRXYQ/Qt9OQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 00feb73e63d7..a51567d19550 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -163,7 +165,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -171,16 +173,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -223,7 +226,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5d4945ea1e95..f0facccb7859 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3698,7 +3698,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 50ed615cf0f6..a2acff240b45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6800,7 +6800,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 906aaefca7e1..c3374cd2598e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1884,7 +1884,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

