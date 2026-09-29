Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881853E9C1A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656117; cv=none; b=kmzNKiVlgP3bFtii7JxTPm474utzATI0oR8VjuI6ExFSkS7QIg4mgEMMmFjOIM0oDuPLm2LwrVnH+6VKa0IwDnN46lSWWm2hb+0RRhZJZg5pET/NhuecbnH8c4AgjnwSQZ9hvIR0843MYZZsPR5FqvXxC0EQbGouvvwfUzShtjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656117; c=relaxed/simple;
	bh=QDRjR0asQ+YszALPwhIKnWinzSmuIA+ky2juuKuHgt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRP7+OY4g3ZudULxNqRe683TpC6bT710HNilDodBO3jMerKYKco31vRm3f9zaazsGL3TaiYkSrI4g+zG43HxaYads/ZUo5VWPeN0luxGxGe5ddpqeRloL6aU+MEbM2m3gsFLQI71/vvws+OIJrsmAgf/hczjssyE30iK/hryZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu4yzoOI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ds4wWULK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu4yzoOI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ds4wWULK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47K2C3241634
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=; b=Pu4yzoOIH3/Ae7rt
	YaO7pkWAeS2mRSTUkhjGLRtrRjPSa6EsuRzj45nkv3BeIxp+ZQxj3C8tHX/KoxfW
	6upNeE1TDCEqkT88r6Wh1cphTT0EqTZhbzTlhO4H5IOTZvoEThueAejd1lIspe+5
	UjnxpjRp/gLwKah3aDzUqSA46Vz1g3ui9ntSCN+jo7GNXd4AdPJvG/8SZg9Diqks
	xTqLF9fu38xbj3qB+4PMDAgPbO/KjoaFYrFuh/Hy8YeB0ahji5W2FmOMapibxQ0G
	WZUzadqR+XJCtfDerQDhFRjmvbW0H06TUk9IrNgeXbVf4Mv1JLuLJBv0y0DVSE2e
	worTyw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144s1p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91431adf55eso69553986d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656115; x=1791260915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=;
        b=ds4wWULKRkH39DOT6v2elud4/PTpc0Aw2DR16LEUpSreuVyg/Xsm/uAExxQBmNF9rf
         eRb/DtLaWgITZvu7//JftrVNdFmiLALEH8vdE8TDDXM4HSKivK6P2su3RhqpqRwYUBsw
         tI8QxfkeYpBE/8U02fP1R0lpGiYNJBc3BwumWFH9O46aSeRBNwdU+/sQx8cRTDrx7Za3
         kOwWb6UvU7LwyzH9YvsQBbaNVVKwwuSeNDUzHrax2fclbZW4Rz14dMsPjtj1MdBRrP9O
         eYzBOnFXIQ0h0anWhoN8x86YCnZ4UMoDsAqjAxfIDmInJTpkOtzd9pCEm+00PJvcICqd
         /f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656115; x=1791260915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dzBLWpivrUI4Nat3yuVRNItbUI8yEZDWAO6tGswt/E=;
        b=BOdfNpw+DZsy280ZULyrXD2nzR5AXNTJbhiyJ3qgKIT2hNCZNZwcisQUubT5Fx9Jjo
         LCL9QAoQEhnA6AawvR7xTdnZhIy/t7URHhxLs+85zoZThyTpsf45VeBZH10K1JqFk6vs
         xdvuwBAGAm+D7+Xc0svUWGdJL5YxavZV4A/uXV99b5YtUMlCdbiqF3SJNVeiITNc7nKy
         vupPYf00ThSsmVwLNPWIa/iPnDOCfn2zjDw2Tnpejhq70+I97PhjaDjqhxWWbqgrm0BQ
         PeebN75cQd7UGUEIQp/0aFZf1Qj8EpJkMiPANbqvhnFpb75u5hitAYFHRK5L1SXXVeym
         8WGA==
X-Forwarded-Encrypted: i=1; AKwUvByrjjqIsxwF01BF5ZrMHfxhaj8LC9UXt+aKD9FNZfFP7qee/sm3NYUTdMYatdDBlRTZQWmiOc1pnfarDf8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwQX11hhP5sk7f2dI284TY43AcTAfkGKk4fZBp+RUGuha+Wn6X
	GiFk1wP78yecEj8PgZjnj9Ds1SWr9mZ67+atov7+Mu2qOrZORO8jKpH5cOSGuO/hvvCoGpM1glD
	ELG/h1tGmP5caOeZ32F2EMmWthS5YF17P18SNkUZbfUETf8nidjwaljAx6TH+mbsiqtM=
X-Gm-Gg: AYBFou2XsMzDJ1edMhpKdpRZssNCys1/ft0wy4fNd9Jm2ncj1Yeh/duWjtGaQ3nvncB
	Fv5gjdt84UqyEKJt1NvpezQsfkVeGijK91sR15KJFJFXzTKTv+7Nn0U5/gpnpHAhxrEEzSjeuzT
	gtzDy40pcDYXQjSmvtiLfBoZ/9av4TwoYhaC0OzbNcs5ccMqsX68dPCNRy2vxCd0REpKENzu+ji
	278cObSJFso8LHCTvQWYpOjROmMeRM3KKGQNl6JNHZYveKlBKMue5TKCC0MN/Uwp91h9zBmq/lO
	jtyrVDwPdWRf+nW20qiMGjW+Vf3UjDC5AV9piObE9baIZWDJnLH0Ueo3NbZOL6JXVmPc9opZmSj
	oiDtEr35eAF07nkCszTs4rJS09U7sbxODEdGTI1UVpmAN/c+A/BZM1UbCyazr130=
X-Received: by 2002:a05:6214:320e:b0:912:428a:8bb2 with SMTP id 6a1803df08f44-9142f6d304emr237397986d6.19.1790656109716;
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
X-Received: by 2002:a05:6214:320e:b0:912:428a:8bb2 with SMTP id 6a1803df08f44-9142f6d304emr237397736d6.19.1790656109291;
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:50 +0800
Subject: [PATCH v7 26/35] drm/bridge_connector: avoid detect-based HPD
 notifications for DisplayPort
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-26-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=1983;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=QDRjR0asQ+YszALPwhIKnWinzSmuIA+ky2juuKuHgt0=;
 b=5qG1cU4igksDXTaXfGOMIAkfLQ1z4WDvVMcOfTgjJbAKEvekS5EmNUyA8aXUh5jFckSUlLJTl
 1MrVKLGbXJMA+HHiKoaJXNLPCRDJqlNjNc6RQvwZRxcIq+NYe/fxcZV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX8zeD/LCTpT2w
 OmnXWkBtFb07ecvx6XLJIsos5uPZcQzdcJv9HQ6pSj3NRiDLQoibpIYYMeydsexU+Y7uywzHiXq
 xf77S29ODYVlvs6y8EdKhip9LKKUnITl4IkfMjQybSye+8Yay3YGX8p10EsxHuJaF9LgjPkSQtr
 hjHhCrVFCPnV+ex31h0phc+6SQkr+uXbaA+WP6DNuIrPoIhvzclIThCDIiWYLHH109nSIc/z2BW
 i87X31k+7OpfF2GqlhCDEp34S2NOPWXgIGYwLHYhQcsQDgUWuPAjChdaxo1h7MXPE7dF4Qj8ffB
 PQUiNuGgUtRpYsfYjSBWkw6Xy5mk4hon5fV9Uvon+Ehcxjd2uujnC468W2xXZF9A1e3sJIqjL6q
 2WWwS2/Hv0hq7gqWFftbfSIMs5JeTjlD3AVGOdGEFSwus0eMUzTOTBEeB0q9eq45Mr2EhfEE6FY
 yyS8/TmF7SGTIo2nVFQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb3e73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=c5AeteMbgwRpADRefSEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: IouGdsxl4nwChOaNfDIrQzL-AGO0zogF
X-Proofpoint-GUID: IouGdsxl4nwChOaNfDIrQzL-AGO0zogF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0u/baKLHHPHC
 /Aym2zP1QXfGcpmnBItlPReogGgAHwmhIjTdi/yX/gXbWsHx7hWCj1FXlL0wwU27gSiXAMV7IWS
 aO3PCn1JhH7iX0YCLlg34c76vrNqPFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

When MST is active, the SST connector reports disconnected even though
the physical DP link is still connected. drm_bridge_connector_detect()
forwards this result to the bridge chain as an HPD notification.

On MSM DP, this notification invokes unplug handling and tears down the
active link and MST topology while the cable is still plugged in.

For DisplayPort connectors with an HPD source, stop notifying the bridge
chain from the detect path. Plug, unplug and IRQ_HPD notifications remain
handled through the existing HPD event path.

Preserve detect-based notifications for other connector types and for
DisplayPort connectors without an HPD source.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index d27ce59ca32b..8221a32d00f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -240,7 +240,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+		/*
+		 * A DP SST connector can report disconnected while MST is active.
+		 * Use the HPD event path to notify its bridges, rather than turning
+		 * that detect result into an unplug event. Preserve detect-based
+		 * notifications for other connector types and DP without HPD.
+		 */
+		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
+		    !bridge_connector->bridge_hpd)
+			drm_bridge_connector_hpd_notify(connector, status,
+							DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:

-- 
2.43.0

