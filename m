Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA173E9C33
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656003; cv=none; b=WhfZxwaVUggFLV7+maED4dCayOkZWYO1mUs/LTcy2dNZ4ZvsupIYOCFKJckLBXts23iAL/L1aWn5LyTB2sDFPytSRcFBDVw21iDjb6+0d9zcXXW4NPbkYikZvZLXDV7PAh2SLmT1WUnHNrO7+rFW9MzSe7hRjfBgUWE3chx4ZEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656003; c=relaxed/simple;
	bh=rv+xhdZurP91oD31/maRc5wjQBgxGuj7o6Ogyz9jhxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CrTK/mJIsVVC2Vo9pIMFT14WpjypnXD1zUgSwWPAStVzkinVJisFdDv3g1FRQmEchkI7p1Xro7MEr810yTeiNhH+u7j1PIczVX3Wh8U6cnQu3Qvr5VNCQrcR8vLulnTQyx2r6WN2jBF46zVtdIRxxYHRaVPS9LD0TO6is90UvyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flnI5f3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKhZJ76o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flnI5f3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKhZJ76o"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47BZ23643064
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DMXacsp6xKcjLkbRHbNvBCwqajwM5OGMeDu1MzChQgI=; b=flnI5f3I1S5fXJai
	YqVYwBeHV825KKo6HWjD+sdbpWXMj6GPEjVplPdEruNvmU1nhvGAChzS24c/Lx8o
	Cixbo6isCfir4V0wpqOI2TZMINISc7TLejvTYaW3c0f+0RTuutxv29RBkzxMkyhV
	BfC798/3rIeKvFSWizLSX0KYG+zd6f4vrl5n5SDSQGMwQ/bC/RNu9QdzxuJNghTK
	u5n1OpDrtkI4M7E1sF7t/+wPh+F9nvlKmDqg8Lx137jMIn+AQRLsjTTNl1ZlHlfo
	3ixysGkAbBJrEADKk96lJtaslzrI/K6oXiFlqiw9NQsxwmtuQkQgE6a3ceQRHZja
	dls24g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4s484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:26:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9104eedb5b0so81519886d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656000; x=1791260800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMXacsp6xKcjLkbRHbNvBCwqajwM5OGMeDu1MzChQgI=;
        b=PKhZJ76oLSN4bTWAfAHYC+3kvkjkPdbRbe9Ib4f/M+tjFG4uRiRrdduSrZ1vjxAbA7
         3cfme+YsZ3D9uXgaFBA3FEgsRlcymGL4CcJpjw179cDu00fhPOGmyRYJqpQFraV8RNbI
         GHVsw8yUoHQJvQs7GWMWrUeX/jeLelS/KvW4qYy66qfZ3efYui3hlMp+DeYxceiJMz0o
         UIvVfUi7GJfKrwZIigunL6SHyTkdegtQR5AbbVC1fF0eHFUKzm8psmKQKBAgJGXFQ7Ll
         UMdPEY25FbIQRiGkUjVpHWamGKAan7m2AY2m2zVryGvXyzDNLUd0AHPCenVe9DxD+Py7
         mvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656000; x=1791260800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMXacsp6xKcjLkbRHbNvBCwqajwM5OGMeDu1MzChQgI=;
        b=EKHBI7hTiFrWJ8lvA0xjqez1zSee/Lcpo+EZH2C8eJ8wFZeq3qmQY+1lNFr5Axp6wo
         lXvP/O7Vh10sJvbNzojMxTT/AukxC0r8nv8uYpwXt40/dZ1csUG4CKBbb3CBJ/Aa6+fZ
         wUYjOF7tMnFO+yK53dqfoT/E6ut27u4PtEOIZRexB4Ya8p/nIXXXPz5jK9xySMovC+ub
         JzornW/XRcOmWHajvjJF06nkw2W0TzV6wwKvWBgQFADrwb0ESdxX4aqwxp97tp3blQ4B
         bXai7qVE9XJJxwq+8LV6AAXWARan5a2Cbt45rnIPuV1lrlgwfESyEzje/c9RB8BYoxfE
         7kHg==
X-Forwarded-Encrypted: i=1; AKwUvBx60zUS4/zFpctLb7Ky2jraiK9Iss0NQqufZ9D+ktWzaeUwRp2O1ePbQryfZnU5vJ78tPpXaL+QUWgyaDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4G52XTTiObjyjJkYhU4LJw1JhCQkXcwkAo7yvgBJ3QCO8bVFB
	9HqzjWzfoEBiRxZGvSsI20GMAa/dXIQ8vEsZHgV1OEGKxJ4MZQ16HBW3yCSSmKPcAmQnN+UO7+s
	PfFYSiAfACwRFT/nWptYBheVtVwqz/l/MLZcFmTEFVxf3nQ3iNfuwmBEkYbuot+PqtcM=
X-Gm-Gg: AYBFou01xxrtrGsw6pcCfKpEQvOuzdRyE7E2VOK2AYMosF2X1WIa07jS3Y4VUmolAbm
	477QrNXToJiXtcwiAdl2OwfQK+9WNd8xA1bFDDZgpCRt6QMHG05jwd/IitzhbERvgmSLWCA0qQ7
	hLAXzEJny72chpA0dg0QlvFOwd8YHO5sQFzeXbz+EGCbZSIgKKFtQRthF3CH3T4z2K5tw+Qsmch
	Er3IGkpovYWPjFepcNIQSx3bd64kHiFn0w1uC2va4l7yacHNhxIXxJUd+Qdk5AkAKgbIKBvoQqG
	l0bm9z63UjE12cqE5BYttaV1YdDQNFrgbN0fPD0pIx18IYNsV1n90tR5YeGw7hsJKizKqOzmuHs
	2SwDsplnuGigVKtmNYjstNBmON0h34Ws8bDRTm6NfypYaWrNpZpDKqKqM1cVA29I=
X-Received: by 2002:a05:6214:20e7:b0:914:3ef6:ec0d with SMTP id 6a1803df08f44-9143ef6fce2mr215586166d6.3.1790656000151;
        Mon, 28 Sep 2026 21:26:40 -0700 (PDT)
X-Received: by 2002:a05:6214:20e7:b0:914:3ef6:ec0d with SMTP id 6a1803df08f44-9143ef6fce2mr215584806d6.3.1790655997685;
        Mon, 28 Sep 2026 21:26:37 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:26:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:26 +0800
Subject: [PATCH v7 02/35] drm/msm/dp: Pass panel to
 msm_dp_ctrl_config_msa()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-2-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=2554;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=rv+xhdZurP91oD31/maRc5wjQBgxGuj7o6Ogyz9jhxw=;
 b=9ytQUflWuqFjIci5NMCP+NYpYMSvH/nMYIMmzuoruz7yxejS3rG8oCsVR7G31NznaOhVP/wBg
 aljMx2tdOSmDQkKYGZWyaJXe2xmW1SgiJbodbrjOjJ2+N+yf1r5YV9p
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX0p/Rllq4LmrS
 spqypPIW94DDgt2Qexl7gXLSoY0TeJFjBekJO5LP5Ag8ZmEqZSLiokquHlI5E99SxSWCO2u8eAu
 Td6vrqAPWCgqqI5EPbDWWvamrX2vq6Q=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb3e01 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9XaUHPIOYaisIUHpVsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX+KVUPML9Bsya
 1cRY60NIquvVVB6Om1loZHNHGTCS4db4zfaWwtJUflWKxYhuDLffgNDlspziG71od85/tb7KiZe
 73VsZc2hFi3borjTyYuw8vlxTkH/h2DmqjPc60vxHIhQPyxdRcOBWpXDrpcEaDetVf4X19ETfJa
 pK26+pcfYPTAlaH60jBe/YL8K4ZF1gB/yakQxlTHrtM3eeL3ZIyWuprHmnECMAFI0GdPtsoC6ct
 Ykt+/KhfGgRxIGCrODYiZzjUObjkwF2xluZTixXTg/MHTI0r9YRIVISv4b0mNSQWzbFT7PH7unJ
 AtuugaaSGVYW1TOzo3TilsCaFxEsFPyGDe5oPitMEFsx+UWFZyteSZ+mSL9K4/hDHkk1Vy79/6g
 7KndD9/CP6FJTb5neDcLoXknIiHJfm2NHAVQRasFnj0kO4PsB5x+s8YrsYd2PINAiP+sXOHe2qk
 8LHtZ2SaYWh6S15k4Tg==
X-Proofpoint-GUID: opSUzOYN6Q2lSwMX1ZuKezkjxGsv8N4-
X-Proofpoint-ORIG-GUID: opSUzOYN6Q2lSwMX1ZuKezkjxGsv8N4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

MST requires the stream ID to select the SOFTWARE_MVID/NVID registers,
but msm_dp_ctrl_config_msa() currently has no access to it.

Pass panel to the function and derive the pixel clock and pixel format
from panel->msm_dp_mode, preparing for MST register programming.

No functional change.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 59070f399e2d..1ed713b957c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2463,14 +2463,14 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
-			       u32 rate, u32 stream_rate_khz,
-			       bool is_ycbcr_420)
+				   struct msm_dp_panel *panel, u32 rate)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
+	u32 stream_rate_khz = panel->msm_dp_mode.drm_mode.clock;
 	unsigned long den, num;
 
 	switch (rate) {
@@ -2516,7 +2516,7 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid = temp;
 	}
 
-	if (is_ycbcr_420)
+	if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 		mvid /= 2;
 
 	if (link_rate_hbr2 == rate)
@@ -2573,15 +2573,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	bool mainlink_ready = false;
 	struct msm_dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
-	unsigned long pixel_rate_orig;
 
 	if (!msm_dp_ctrl)
 		return -EINVAL;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
-	pixel_rate = pixel_rate_orig;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
@@ -2604,10 +2602,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
-	msm_dp_ctrl_config_msa(ctrl,
-		ctrl->link->link_params.rate,
-		pixel_rate_orig,
-		panel->msm_dp_mode.out_fmt_is_yuv_420);
+	msm_dp_ctrl_config_msa(ctrl, panel,
+		ctrl->link->link_params.rate);
 
 	msm_dp_panel_clear_dsc_dto(panel);
 

-- 
2.43.0

