Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957D3D332A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164316; cv=none; b=jEIBaLNh4ZTPjtY3RpLTJmIh+g4ki3vrAe5IhOBWaWrEO/zxTF5S2zY8qw26pnbkwt2+MllPKmhZHiC2MjvZHDEjjq74HB/QQyeAs74J/HSRpbSt22fCQaNhtej7wtbWr/nH45njX3smGiEfkmLt7ig+ETnPYPk8LZzeunPkW8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164316; c=relaxed/simple;
	bh=a3Bsk44vAuGWtuVevmFYIZgGPtZYUaHC56fmEPytYS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sIv4xVw7DlMdiIc6+OfptchMD8SPNpo24yTxLvBxHDSXEKmd9k63bUzVGPkGBPoj8GIU7TecAaayDFsGBpvpESTeuwMRVoeS/HV8TvN+H3ihCckgYW3Lfuk3hzY+DLOYSEo5ht/ngYU25iD9NTfhtwF/l/hnJ8EAQLRlz23ORqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fBZ7MiyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5FnS7IH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fBZ7MiyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5FnS7IH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xIhH2460282
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=; b=fBZ7MiyA/wcyQEAH
	cLroINa44aiJ/v5s8hKlUPt8sp+WYUhB9dSe9KajSFDP/1WhPPGE3FoJCVXnqj6Z
	F2B/8O3Cnh1FzUC8tm0b3ysN76gaRbG8Z/JGnoK5Nd50wr1Dkh7ZbuF1BZhnZQ++
	QSR3jkPuDdPIq6QjCLCVVKdSEXxYq2IH8EixUEN8R0QjjPyEq60KQ3QzZfcsUviX
	O2Jle/Iap8q+EO/sMmEUbEy2kggSWoLMbVaM22GsTOMf5ZRsSBZr7UKM/kcHJlE2
	Dmvon3iOWiMjEkQlpa/WRoOg+ECBuADMmhlM5ZqlidTzLap3PsAUojDqLvkYCz9x
	6gmSIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r72h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c8da50f8dso84471196d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164313; x=1788769113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=b5FnS7IHLKlW0hSl13RKHJxdJVapcWygDKgWQYdRR/zpscyFL36I9EsAXyLoEaLw1v
         vSB13D2fTQj7ZQit2ldArH/9abdCmCFReUp0wQ1EwAxSiPOs6D+/hMOUQ9ZUngFEqZZB
         USCSuuudGjdoZbNNas/83WEED4YccFtUN/zhDhMGej2JxxoArMMiJBJTAi+SMa4eOgSW
         2xk+u/mnLrmw5EQIFobBYjGGKfVlp2+/Bh7JVCMTJGdSTNMbXwGmu4lUaxLzbznGjPM+
         qnpPJ7oRjNxNJh/4lexcgSwP12nnTCOx35e0R4IAC8T9JnM4pn1T4D3OeqZNmWqShzYc
         FviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164313; x=1788769113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MG7hWOfh4QGMHVtzXUSFpYHK8rElTo1Z2L8fJrvwBMs=;
        b=GpSAknvV1Vrv4k12HXUGDg4LWyBl6zwB2ERLKr9Y0Rg5kdfu+StdpvRCQ9zwk3383j
         PNPWQ+ZCvcAh456nLsL0VSdPkqbCg7EJMGP8Wnl+zOA1/HbHVKpr9k1AtFdJyKBhF0fx
         1HkuYspHIfGAanfabEXwTL5tbRd3kiQyeu042EIzcGQkgZd9PgWvszO4eNFVDDpBxH0S
         M00pLMe1ouDPswtqJZ88N3ChzpCjXEH/9xwGWz7IasE5LRs7sSyI/Eu2qUstzxHBCTeq
         WHDeimjl8InbqqubI0BqsuqJ5WucMgJsJ/nHd2U5++9iz6XR2YMY5bs8DCIyh2wFaxyf
         zsPg==
X-Forwarded-Encrypted: i=1; AHgh+RqXDyCMzXUXCIt0XCRLdOwrf1fTPzticiJ0DVvylI9y9aaMI09sVywrqfUYgw3AH0bkFTir+Z8cYUXRBls=@vger.kernel.org
X-Gm-Message-State: AFuF++kxvl5wZ/VjjLvDS5iMcZmbKOhhCpe75F/69SmixYLvx6ZjLjVd
	mMZGgl5GWaKAF2s8btL6lY1C2tcjgEGUvm42+qKrhHjGnTXUUWAPQHu0O11q9F7Se+sAzrv2/Zi
	IzC8GYEJRqe+tcbvhFUCQAPWsC8WxTUmt1UF7IloGyNZGrUq5hGni8FB1dt+SDzBMKpU=
X-Gm-Gg: AR+sD10xu61vKHDVUd0z6yRWYi+fOts4mPSupDz9xBs8A+l98IDCKWRYO9jZJl4ptnN
	ogbNhyJ/6W/0C6D/Wt3vqQH1oy9zQhXC+tR3XQk0RGmqmKkeg3WMUJ3KEbay2Ye4BIVchnkUcdk
	rCJUnwQomRU9KzCrwkGFPggd1samHbqDNyy2gzysKGZLg8n48sVbsM+arML/TFoyHL0CvLGWho7
	nzpOdwnx8KPtZ83GeXvnjQ36gxB/bOsjaTEckHV/XSyKi9ZcjWaKNqbv17eACBDI38PzlkmOx1+
	MksF4T8Ioai7CqsF2BmBMT8A4CRX0cQz2nQxtXAykcVu1gTUuvf8Nf0CnNFcgZiX1xFIS6vRkC9
	TRg4iczUZ1Jf7oUZS3vefuxSW2RueM2CrwsFOiqND2G+Pwj/bUoTDhuMAC5w5xms=
X-Received: by 2002:a05:620a:2308:20b0:932:df7e:b31d with SMTP id af79cd13be357-939137d104fmr2188033185a.12.1788164312656;
        Mon, 31 Aug 2026 01:18:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2308:20b0:932:df7e:b31d with SMTP id af79cd13be357-939137d104fmr2188029585a.12.1788164312069;
        Mon, 31 Aug 2026 01:18:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:31 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:28 +0800
Subject: [PATCH v6 11/29] drm/msm/dp: always program MST_FIFO_CONSTANT_FILL
 for MST use cases
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-11-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=2539;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=mtZ1HCvBc/lbpNSY8CTLdvHlrW0O7SuiIwZF96PT1pI=;
 b=STO9GwinFhcQSFq0MNtOu3KI0vWHHsIUt8A6GJA77uEm9psDlpyVubXkRIn8eJJRV4AXy9qsO
 N1ponTqrGlKCr5PxDrTcgo4WEZlcrnwjV0nY/Jl41/oCdspYwXbBZWF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX6cmMQMeL5hQx
 0W27qDPPlIqpdlsS1wRil023+/VBc+B31EcQvTlJRuuheidkkv5q2mxtD5TzUXvXYzRT6L2yHtC
 2QK2DyRTHdXMlDHwLCR11xOBLXSAWGA=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a9538d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_o_Q1azn2oY438DeJ5EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NaUhCDdY3W-WKB65_r-pH67yZBDAw8M4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXzgwDuxARgges
 KqWl6vPzNnbT5ZMYkMfXO8salfWDomK3z4ZAxi6yIshgV7jwtF/m/jjyri13SdhYd48LejxHRMR
 KP6kjmTjRUqN6IFAsevCHpmzpeZy6D6h3Lau78aOd24Hfbun4h2Il4A/eAQA5ar9jUOYv+b8Lyq
 KVPDyBDZ7niQCod7xWnCy8jzx64TRoKn9Vgk37QF2CphNyiIiS+9wBczLclwNXDhH/70XSwB9xs
 SGTHC1h4av71BDcRrGF8WVGDGNIkrkQrgvKHZVWOi8dWso8k+e2+vnK7C0prjS7cdIJlne9VM7u
 5S+myRD3QyEw4yp8pzIl7qjPOSoZdbjyCnS/AA1yvmOFj0zfMqn+JKXF7e49VmNadxhI8BNiTlV
 e2wvZG8d1JkoeF8iqngsxMtYJ3gyvDw6ePk20ARgg5CQQ7dl/yajgbHtV6NEK3/+HlhbneyFcA2
 7ttjlRiABYqKbHnl2SQ==
X-Proofpoint-GUID: NaUhCDdY3W-WKB65_r-pH67yZBDAw8M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. Ensure the register
is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77506e840883..9a0c9737e6d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -584,6 +584,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
 	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d3468b73fdc3..bc7bad5ca3b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -741,6 +741,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 				 const struct drm_display_mode *adjusted_mode,
 				 u32 bpp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index dc046fec24fc..04938b9d2091 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -72,6 +72,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @bw_code: link rate requested by the sink

-- 
2.43.0

