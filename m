Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7E3D300F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164283; cv=none; b=cViLW7TaeiG6Be4+j8y7Sqyz5ovbN6Nzeymp4jPfPICIaZYUqanW+6qKdYT39fdhCxhz0ihkmJXuuGFhLXlLbkGCVGI4ouQEaUZbKsQlrR2hk7TPygVPL0483fK+bGs5wIoLH/0Ldayt5lo0754LuNHMNVxlkMBwGslH1r9qfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164283; c=relaxed/simple;
	bh=4+h2tQEa4JE6uvIfDADLmNWS/y+XGKIu5Ho6nJ9iDgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EivTOV8FyPZx7u+GasGYKGCDyx/osslChjz4m72bJH4WwV7Fkvxn5fYIoodg+CjGoafRqUuN5MbUKPKQrNf3g/33h/FUaoVLanBk0N4eLDVJp2e3wHsQv8b9a+myQyjE6XrTvue/aOaoUsi8B80YUuONnmdY4vtHqC3HP5zMubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpEV/4QM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5i9kGQ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpEV/4QM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5i9kGQ5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xjd22419575
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IsgkSopMJ9jcXYcdr9v42SSIUBz4/ARTw3JYJEdjeho=; b=EpEV/4QMN38rku31
	m3wT72Gwi6KNPG7IhCOX4X5nrPAgcyrownytnKY6HcAWid+w0gl2uDevPvESMvaq
	UMK0jlDgtBArgzLTkcRtZeWb2Izz4ggvrrIyOopHpXFa23ZIx++ZwNfXM/0DSuw7
	lwiUZm3xGPV2XS/QbYuOUIVo9zYDS3pNWbucJ3/B/WjXK5gds2Ux3D2bdXFPK7lA
	5VNdzczmUazZz1RY3QZBO1AVqO/AvDE4LNcLs3cMBC8Oaaaekvkz/4NB8XKS1Hfi
	k2omtGNCPLcWfkyhiApjat5U6HFEZqy3jelcwf58/zX5ExKMcEuwe7W9Tyz7H8sJ
	LO5rhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nbxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so534668285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164280; x=1788769080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsgkSopMJ9jcXYcdr9v42SSIUBz4/ARTw3JYJEdjeho=;
        b=c5i9kGQ5KN5d0Wa7C/NDbh27SQ7Oxr8qgmmb7sR0OcrEQpThelEv99p31JFO1wMnff
         IMecVZAMPaL2LLNes5DeE8rTjtY/lup+65w9n+fDlMQIVCRBv7LTGKDYTshzJS6Ze/X8
         z1PXPtK16vnEiG5LPk/VGVxGgCzbXRLOC08LgqdFrlxrQbaSKHK3iwkGhwS7Urk5hCcJ
         vtxhRCxEngV/LpTB0ApCPoOtAhRJHQoxt0qbI2eZIOu/XM4OMlpSoYHyLaDmnEWIlKJB
         IckmE3zFFef9G6bKbwQKmyZYqzPIr3W0x2n/iGK/M2/LW3MdhYVL0tYuXFZvOumGy+V4
         ljuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164280; x=1788769080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsgkSopMJ9jcXYcdr9v42SSIUBz4/ARTw3JYJEdjeho=;
        b=nfcGYaqgUetagFibgs/baOM+HiTOO7TS/FqQ1F2hfkKiLQVgLmkVx7RGcVkJ2NRyiR
         gX3ohMWHDDQzyvwiwZnOKk0g5w/Dcg4+4JvpWPp8sFR7e3Pql3oB9GTwfHr3fgMBNao0
         Jusr62IBe8vFz233ZEFDuTPsmerGAhXAL1XLeE9ChIIkyHnUcoaZl1bOKVOnSzdVqhrH
         effG79ZnlT9Rs/I2efPAe19iyAmurXxFbROVdqccDKOmVGic9GY9PxN7bLT3erKDN02L
         mlieiGzbt7Y8Voh5lvMxTta5WnCoHej8T1PE6pT734dsQAl2/ZBuEJvNoL7zc+fjjFzZ
         TCnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+cUdSQ4wHCF+XEAM2BL/fmAIgd0iPjnjXY7Xoz1RA5xNTfQGFBS7r5o3fyN9s8slR8HGApzNn8hCW2+I=@vger.kernel.org
X-Gm-Message-State: AFuF++mpiVDnzVxvCtw5spUTbv2f5J6mkIl4AwBwOXQg+6EoPjvCDvL0
	DeBTEvE3dXl4i8xuQohotEqUXu3iXzBn83kc+TYpaeF80OlROFLhzL1Wj6HSL0Cog3iYMFRkj73
	I4sZlqDtqk6MCC76QzW0QlRZllTJOjhygrLOht7C4Mk2Yo13KWj0G8FpLYzJooLN0a6o=
X-Gm-Gg: AR+sD11is8Rq3bAQzeIlvCjQ9L0AVmq+DQWTw2KVZmEqAWBaPY8Wh+jMz+Ue+uoH3WL
	DGSffySql2i24MAg9bpSBSE1NcSiUh1GML7EozzSn3+hkxU6MWgBvSqb+0Zx2nCIogQW5mB2F6U
	Lp4ymK1Vof9eIk+x8XnTBNb7uQB9wtsVaHcqaMUVccki+jfGFmD7A4MSerSnniWgO1xmw3JGOch
	UnjsYL3RWkN/u9WL93jDCrwJo+HCuxbROEhtp7DR5ebjibfHGzCHSw3WjOxc2q0jmmUiPG5SBM7
	kCcWtIMNSNlIULAY/IOAYSIJRl0y61QXghAApoSZ3P0kGDLY6oHVSLuruUbME5LoxWe12c5qDg8
	3ykvu30HokPvX4XAh0+evnrK/9wgoO7r2bol8g6bOT3gL7ee7jgTquJpq31F0T1U=
X-Received: by 2002:a05:620a:839a:b0:939:1fc6:3fd6 with SMTP id af79cd13be357-93942856eadmr140168985a.18.1788164279961;
        Mon, 31 Aug 2026 01:17:59 -0700 (PDT)
X-Received: by 2002:a05:620a:839a:b0:939:1fc6:3fd6 with SMTP id af79cd13be357-93942856eadmr140165385a.18.1788164279468;
        Mon, 31 Aug 2026 01:17:59 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:17:59 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:22 +0800
Subject: [PATCH v6 05/29] drm/msm/dp: add support for programming p1/p2/p3
 register blocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-msm-dp-mst-v6-5-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=13423;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Ctv/ql1xMw13DzEY2YLR2S6NTgUsTzozX0LGI/zA7L8=;
 b=x/D5+Q6G9DloGc7gpXXEjmYDz9LjWhal7nE8cSp+Goyj8r4TLnSgjBD/dup5Wt6Wr4Aq51DyZ
 ypFo3LbkT7WCL1jGyLI/d516kOjuHv5xWCeXWxhByq4rKiScpdan3fB
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: 9JjBYKSZTkWigLsVqpKEGdvy1t-H9TiK
X-Proofpoint-GUID: 9JjBYKSZTkWigLsVqpKEGdvy1t-H9TiK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX0szVwcS4n7sm
 ScduVOR5Xzo0nlu0ArmzeNglS3yOAaLSfIUrsRwkNfm6lvnM/C5rsFr0RbqAxiK12yTsOv9AU3X
 Ddg8VCl+ZVAARV/NBue67+j3AF+terOGj+2heTQfgbvn7+xAV0dxWeHMDrCZAY3r+QV/g1bgXbV
 xAJQQZJu5yodc7ttXfX60ADK6ZAVg9N/yVytzILDw9FPHBAri1Gr97KgjhfWfsUNqOgwnE1inmc
 caYPy3w59hzVh5lo1F2OScjKc7WkoEcivoq7eNvIhH5m3ZSSwdZRCNpT+YzF8LaXENEXgOvZH6O
 orpommXSVbXBtUx2vu4MrVJGE5KZLzxTcphJARgr82+/ru8CRzXeNE0jehR9WhPqS/c/KTgq9dJ
 9xZKALof5Pb4kMXgJrQUt/Ky2r7WhlmP+mGdtoeZruT7yJdx1FyjAcvsSqxCGyXX3vrF/X+asK4
 Xu7p7Dmi0ZYBx0dMP9w==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9538b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=diwio8806UQZP21u3w0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX0+jQDxp4Cnv/
 X20Ec4oG9keIytg7ZSVn2qtSze8OU7zSbFhBffIdICCTZlgb1xY3AHdcXYeSGvAFpijZVqkI+cT
 JL3z9UidEG7DJtdk9TKuXDwvFnkU1Bo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support for additional pixel register blocks (p1, p2, p3) to enable
4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
and msm_dp_write_pn for pixel register programming. All pixel clocks
share the same register layout but use different base addresses.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 +++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +
 drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_panel.c   | 90 ++++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
 5 files changed, 87 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 67f1da46b973..c0f5226dc383 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2770,6 +2770,16 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	return 0;
 }
 
+bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				enum msm_dp_stream_id stream_id)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->stream_clks_on[stream_id];
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct drm_dp_aux *aux,
 			struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index be0d89d60914..bf593f4a4480 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -55,4 +55,6 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+bool msm_dp_ctrl_stream_clks_on(struct msm_dp_ctrl *dp_ctrl,
+				enum msm_dp_stream_id stream_id);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fb6607f65ded..3dce9334d0c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,8 +85,8 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
-	void __iomem *p0_base;
-	size_t p0_len;
+	void __iomem *pixel_base[DP_STREAM_MAX];
+	size_t pixel_len;
 };
 
 struct msm_dp_desc {
@@ -562,7 +562,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -843,8 +843,13 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
-				    msm_dp_display->p0_base, "dp_p0");
+
+	for (int i = 0; i < DP_STREAM_MAX; i++) {
+		if (!msm_dp_ctrl_stream_clks_on(msm_dp_display->ctrl, i))
+			continue;
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
+					    msm_dp_display->pixel_base[i], "dp_p%d", i);
+	}
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1124,6 +1129,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 {
 	struct platform_device *pdev = display->msm_dp_display.pdev;
+	int i;
 
 	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
 	if (IS_ERR(display->ahb_base))
@@ -1153,8 +1159,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		display->aux_len = DP_DEFAULT_AUX_SIZE;
 		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
 		display->link_len = DP_DEFAULT_LINK_SIZE;
-		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
-		display->p0_len = DP_DEFAULT_P0_SIZE;
+		display->pixel_base[0] = display->ahb_base + DP_DEFAULT_P0_OFFSET;
+		display->pixel_len = DP_DEFAULT_P0_SIZE;
 
 		return 0;
 	}
@@ -1165,10 +1171,22 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		return PTR_ERR(display->link_base);
 	}
 
-	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
-	if (IS_ERR(display->p0_base)) {
-		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
-		return PTR_ERR(display->p0_base);
+	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
+	if (IS_ERR(display->pixel_base[0]))
+		return PTR_ERR(display->pixel_base[0]);
+
+	for (i = DP_STREAM_1; i < DP_STREAM_MAX; i++) {
+		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
+		if (IS_ERR(display->pixel_base[i])) {
+			int ret = PTR_ERR(display->pixel_base[i]);
+
+			if (ret == -EINVAL) {
+				/* optional resource not present in DT */
+				display->pixel_base[i] = NULL;
+				break;
+			}
+			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 745ee6976897..7b5fc5bb16de 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -25,7 +25,7 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
-	void __iomem *p0_base;
+	void __iomem *pixel_base;
 	bool panel_on;
 };
 
@@ -44,24 +44,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	writel(data, panel->link_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
-			       u32 offset, u32 data)
+static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
+				   u32 offset, u32 data)
 {
 	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
+	 * Use writel() instead of writel_relaxed() to ensure the interface
+	 * register write reaches the hardware before subsequent operations.
 	 */
-	writel(data, panel->p0_base + offset);
+	writel(data, panel->pixel_base + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
-			       u32 offset)
+static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
+				 u32 offset)
 {
 	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
+	 * Only reads a configuration register: no DMA or memory ordering is
+	 * required, so readl_relaxed() is sufficient.
 	 */
-	return readl_relaxed(panel->p0_base + offset);
+	return readl_relaxed(panel->pixel_base + offset);
 }
 
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
@@ -367,34 +367,34 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
-				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
-				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
-				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
-				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
-				DP_TIMING_ENGINE_EN_EN);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL,
+			DP_TPG_CHECKERED_RECT_PATTERN);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_VIDEO_CONFIG,
+			DP_TPG_VIDEO_CONFIG_BPP_8BIT |
+			DP_TPG_VIDEO_CONFIG_RGB);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE,
+			DP_BIST_ENABLE_DPBIST_EN);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN,
+			DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
 
@@ -403,9 +403,9 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -439,7 +439,7 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
@@ -629,7 +629,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
 	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
@@ -637,7 +637,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -701,7 +701,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base)
+			      void __iomem *pixel_base)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
@@ -719,7 +719,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->aux = aux;
 	panel->link = link;
 	panel->link_base = link_base;
-	panel->p0_base = p0_base;
+	panel->pixel_base = pixel_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 50a721401751..218a09a2fa65 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -102,5 +102,5 @@ static inline bool is_lane_count_valid(u32 lane_count)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base);
+			      void __iomem *pixel_base);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0

