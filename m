Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286560;
	b=l8BFmuTnqIOngAqYkAMT+WgxU8ohVsPZVkluR1ZApzl2URgfHoKyGHH5LHNLIug2xybj
	 1DUJ6bYo5CrwwPqnJJU5Q7GRoWjeB4FjXk7+XN7f5puOy6S1FaAPEJItqs8Leq6YmUclA
	 AtUTV3+nt0JmoN/YmpEkVtiDQjVA/rLFPQgnHAiiqUDZvZH6wcMKqDGMvQt0SLK3qdumb
	 wwSq4zD3nz2X8kY/l9+0G92nXVVAkMgmRy2V14nKhcSewrONRAn81X1PD2/1r+4CVJcHu
	 X1r3gFBsWdsqDObnzmTXrdXUA7PcsQkj7rkgPjys0Phl4sdIPHKax+ye/1VQC4Re4Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=E4eD0/RHfo/rw+9Lh/7ny7H1OxtFjiEm8WMnxviyM20=;
	b=vGOxMudAhSo25rczWvFqoVpc68WPC3nYBn3nrVeEAwa+xFlpZ4FcaL1bIETuJub33Xud
	 ufGocrNdyx6kwNn+neazAhKnWpNHfZKLLGi0gyFNX/fKg0Y0rXP0OkPM8qDvl8/8oovoS
	 DxWdMH+5JHt2vTP+T63NN59REE6UFSfyYiOA7CLl1N9ZXZgJg0vwEOCbeyqSyhPx+xJln
	 XEw4dE9Ztb/U6Vd+JPjDXpH+7UnBHGCDtlSL4rjqI9F6OLTJJaYcl6AwYZwkCKysrKjCx
	 F/EdnsaZSzdwfIiH9sqKmTHZP/wJtoBzUvSXWX7RgdYsGRCv1b2eMajeG0sH5h/j+Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyCJDxgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PC3nDdgF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFE460A261D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFE460A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UyCJDxgI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PC3nDdgF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ABrA1957780
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4eD0/RHfo/rw+9Lh/7ny7H1OxtFjiEm8WMnxviyM20=; b=UyCJDxgIG/aD+4rY
	lhRSoiGceOXUPQkGonRPSNOz8Bt+ZjspMJoDQ/GCmxZ00+6fhzZZlFXt90bkaEJr
	hdLvXa2PbmxDN3cMSSav51i70R8t/B/drk26ICdvFGOCZ2F9EQ73y5CL9FBjxkAc
	V7YEl5trlRQ5vTOsPCFKs1Wpoo6+lSXShHu8HzJAp7WC8RVZMni+wq3+LQwEJCTq
	f69MPtg8ZYfRyskxbAcgDO+wOdwXssUsR//1n8rZGQr+CJqtpeecNRZb25NbBS8/
	N7+XW9VLNMlNsb4Ufsajoi3aj72EbljAj02yjWAl59GGlgbECqbGfgBSZ4uqwE6d
	RQ6YGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydknjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94776ee7bf0so268948185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286558; x=1794891358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4eD0/RHfo/rw+9Lh/7ny7H1OxtFjiEm8WMnxviyM20=;
        b=PC3nDdgFjcTGMfYScgAi4wqV6G5shlpYqFzlQIwbOBTltcBd6GOVhOKSNKpyOX9auQ
         wiL9gtg5tWa561gu8PLDl1Vmbx6D3mRndV+C7bRXXIOox7q9Ff/l1UmtrU8iBVku3xX8
         oOgfW+TZiqa9kDAt0GemqX5p+xYJase9UJDWENj0pkT/4FopC/ItLlA6aLnatAKQXlK6
         uUTMY4zKqINJ8C9ma2KhV60l+mnKEdFSGmsPIHz7KIdl1AYYicecFQCyMOKSp0D7bqWV
         SkBRtxp3juv4IY/w2IBr2JQPeJg8lioyEd/6jUY8Jz0vd4M3LoRegY7bIbbpZ9XPfFYj
         TmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286558; x=1794891358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4eD0/RHfo/rw+9Lh/7ny7H1OxtFjiEm8WMnxviyM20=;
        b=UDGgoHSO1L65Un3lLgqGMSfSLDko6ZVxnbOuwvpwW6HxEQZVVUdV/Q3rPMi9rezJmm
         kIVD62X6Vpe0E+GXM4yu+MRUL2ZcpCw5n7IdTvMfVG7zrD6R28Z63yw6VSVuQwBe/8un
         4Wd0C9tR4WW/p2fayltV/jtCiEay3tURtTdB2/Tap0sR2fd5SfuwlQnXSSU4yuWnUEMz
         8vmPz3OBWGpwNkxkWtJcJxHss8f9g5kXlbiP5QRKYXMcR609Vv62w7mrdCKwRzoEbQFQ
         dK93qLF66TJnFAdnQP9iTKN4Cm42RU5WJawi+2gOac4qWGfElIVK0Usahn0Rak+6TtW3
         +CZw==
X-Forwarded-Encrypted: i=1; AL+hErHBCEN/H/kMLxudz26tbO+Dbig7VsS75AqK9irA4bkkrB9fSg8i1WJOp/Ml5O+6kQNotnjq9wVSnGqkjBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PjHpT28VzOPrTm/02RgzGgnP8JKcPBbDDXHQva5UncowhlSXq
	5/z8nlh2w7LBES1XIUBd52gaOh5B8uNLPGTd20eLe0x3W/doBc1djaoQfMlwxSrDG7Ap4ym6l/y
	J5UApMnNB67YJ4XlH646xC+iUM13oMuFrZjlg68zJLGMyM4L36L+mjJgtmLeXuB8yo+k=
X-Gm-Gg: AYBFou3Fycz3lBIw7Yq9DwOh/v8aldEr93YSCY/Jd27bdj+pOwj31E4JyhHOjG9cjRL
	jeFiHaJvsNRiEtQZ5cA5G3FFemVo+hhUyqOuXfOCI6PHpgI1sVLnZlcprCwMGIRggWBv8I6svrQ
	aRc1LrlpBFlYHQjvGMgIwKDMz2NIxht07qZYsK6yopJNTPWh0ytX90wim6kBcLwEOlRP7ME1y4Z
	rD9D+RKzrIFofJ3qMfRGyCcPb+gnAPGtgk2rseK4o8bVFqOc8zLd3i4sQidQME+d1AnEewhc2ID
	HzMZJR3WOo6wiGLyfVJkWYfUeSCEogigaPeNaZdNntrZST4VY7W7eeBJ0d6nXuYdbpHCSdN0/wM
	6YOec6MT9ViJZT28A0rRcUpj2WHBqV4gW1VLCnLJMnvD+kBshJi7ZaM5/u44HRKktmMkrP1YJBc
	J2UqMKRL+xqMghmbAfj0xBmFPXFXvfofxVAZSt
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246532085a.75.1794286558105;
        Mon, 09 Nov 2026 20:55:58 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93f:568d:ebbf with SMTP id af79cd13be357-9479f33ba8amr246529385a.75.1794286557600;
        Mon, 09 Nov 2026 20:55:57 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:57 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:38 +0800
Subject: [PATCH v8 17/29] drm/msm/dp: move link capabilities to dp_link
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
Message-Id: <20261110-msm-dp-mst-v8-17-d040fb33db5f@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=8895;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=nQ276YHxiJ55gpd2kNpKfcAOCJtgPa60hu1maqbymPI=;
 b=WsZvFy53GT+zxYT4pbbv/+tncyyOwkeoHnaEz3XCpKFPWmyQESZRQI1eax+gK85A9vHscLfiZ
 k+U5Zs6XM3kBz8Ncqw/ZLDEwGTdkLSd3SjR9ByGBWfdraqOl582SxKE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX6099muM6e9ZC
 dadVFxABxvQx7QWzwDS3Eknh4UVDOcOJ3znQJVTgfDxr8PnjWo0i6gIDnnKk2Dv7McaMfkGgZ+T
 b7fg/rmskSb3EOlCJwRv3o/BXhtJTso=
X-Proofpoint-GUID: 3yJepFn_Y3d5X5HYp5AvEwiXcQSOXotc
X-Proofpoint-ORIG-GUID: 3yJepFn_Y3d5X5HYp5AvEwiXcQSOXotc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX4lFdhhqxAZja
 iuanav/BSyJKzwi33FLFp8NVp9PNhX+aXSnbVc64IGM2fvPt1B6GnMTrTOZprHKniYap2GTED3z
 XEAXw9RXMHjaUkAqLuLKkoFHvFfIHV3K85Xpj7LFE4DI7uxuoueBkNr9F54f9uxwKe+/DLjHjQz
 BY27eYilPucVhjr+NjOo8OseYKhPj543Hm5CTq22LrF5NO9D8zgIEPkogZdLqxjoTqPDiHDgAOz
 Sbh27EIKYZASjxHgmMVqK5Bw2CEVEQgIk+zRMWMmyGyOlYRvmHGvbhnxZTcynoMbPuJXY7OImRz
 CdihDOw0HdrvHu+TLqSlorhUahXM0dubqrbzrCwM1v+CETHDiiIEcY/WngmqDoXyVfLidMnJbBA
 4/kLe/fUKXLzGGoZXeJvJOAGjhTREunav/XiNLc6iqT95LAiDJJupbF68iC3yhyiPIJUPNnhIcj
 k49l4hPW1w3sKt5liaA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2a3de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_PXc0LwuVPefzUNtRYsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

Link rate, lane count and VSC SDP support describe capabilities of
the physical DP link rather than an individual panel.

While SST has only one panel per link, MST creates multiple stream
panels sharing the same upstream link. Keeping link capabilities in
struct msm_dp_panel would require each stream panel to maintain a copy
of the same link state, mixing shared link capabilities with per-panel
state.

Move the capabilities to struct msm_dp_link so that SST and MST use
the same link state. Rename link_info to link_caps to distinguish the
link capabilities from link_params used during link training.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  6 +++---
 drivers/gpu/drm/msm/dp/dp_debug.c   |  6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++----
 drivers/gpu/drm/msm/dp/dp_link.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 22 ++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 --
 6 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 06c370c5ea09d..82fb3ae750f42 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1750,7 +1750,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = panel->link_info.rate;
+	ctrl->link->link_params.rate = ctrl->link->link_caps.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -2554,7 +2554,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = panel->link_info.rate;
+	rate = ctrl->link->link_caps.rate;
 	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
@@ -2567,7 +2567,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			panel->link_info.num_lanes;
+			ctrl->link->link_caps.num_lanes;
 		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 00fb1a7ba40ed..2a9ce77843bba 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -38,11 +38,11 @@ static int msm_dp_debug_show(struct seq_file *seq, void *p)
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
-			debug->panel->link_info.rate);
+			debug->link->link_caps.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
-			debug->panel->link_info.num_lanes);
+			debug->link->link_caps.num_lanes);
 	seq_printf(seq, "\t\tcapabilities = %lu\n",
-			debug->panel->link_info.capabilities);
+			debug->link->link_caps.capabilities);
 	seq_printf(seq, "\tdp_panel_info:\n\t\tactive = %dx%d\n",
 			drm_mode->hdisplay,
 			drm_mode->vdisplay);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9449ef692189c..1d8eef466e797 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -315,7 +315,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
 	 */
-	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
+	msm_dp_link_psm_config(dp->link, &dp->link->link_caps, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
@@ -813,7 +813,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	link_info = &msm_dp_display->panel->link_info;
+	link_info = &msm_dp_display->link->link_caps;
 
 	is_yuv_420 = drm_mode_is_420_only(&dp->connector->display_info, mode);
 
@@ -821,7 +821,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 	 * YUV 420 is carried over DP by signalling the colorimetry through a
 	 * VSC SDP, so a 420-only mode cannot be driven without VSC SDP support.
 	 */
-	if (is_yuv_420 && !msm_dp_display->panel->vsc_sdp_supported)
+	if (is_yuv_420 && !msm_dp_display->link->vsc_sdp_supported)
 		return MODE_NO_420;
 
 	link_pclk_khz = is_yuv_420 ? mode_pclk_khz / 2 : mode_pclk_khz;
@@ -1653,7 +1653,7 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &dp->link->link_caps, true);
 
 	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 76125e9c07e9c..80116d5c58be1 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -75,7 +75,9 @@ struct msm_dp_link {
 	struct msm_dp_link_test_video test_video;
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
+	struct msm_dp_link_info link_caps;
 	struct msm_dp_link_info link_params;
+	bool vsc_sdp_supported;
 
 	u32 lane_map[DP_MAX_NUM_DP_LANES];
 	u32 max_dp_lanes;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bc7bad5ca3b18..dd650b3dc9172 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -193,13 +193,14 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (rc)
 		return rc;
 
-	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
-	link_info = &msm_dp_panel->link_info;
+	link = panel->link;
+	link->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
+	link_info = &link->link_caps;
+	memset(link_info, 0, sizeof(*link_info));
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link = panel->link;
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		   link->max_dp_lanes, link->max_dp_link_rate);
 
@@ -308,13 +309,15 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	const struct msm_dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
 	u32 bpp, data_rate_khz;
 
 	bpp = min(mode_edid_bpp, max_supported_bpp);
 
-	link_info = &msm_dp_panel->link_info;
+	link_info = &panel->link->link_caps;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
 	do {
@@ -346,12 +349,12 @@ int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		return rc;
 	}
 
-	bw_code = drm_dp_link_rate_to_bw_code(msm_dp_panel->link_info.rate);
+	bw_code = drm_dp_link_rate_to_bw_code(panel->link->link_caps.rate);
 	if (!is_link_rate_valid(bw_code) ||
-			!is_lane_count_valid(msm_dp_panel->link_info.num_lanes) ||
+			!is_lane_count_valid(panel->link->link_caps.num_lanes) ||
 			(bw_code > msm_dp_panel->max_bw_code)) {
-		DRM_ERROR("Illegal link rate=%d lane=%d\n", msm_dp_panel->link_info.rate,
-				msm_dp_panel->link_info.num_lanes);
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", panel->link->link_caps.rate,
+				panel->link->link_caps.num_lanes);
 		return -EINVAL;
 	}
 
@@ -770,7 +773,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
 	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
 		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
+		panel->link->vsc_sdp_supported;
 
 	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
 
@@ -837,4 +840,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	return msm_dp_panel;
 }
-
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9f34cc9010d38..7cb9eaeb34c7f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -47,12 +47,10 @@ struct msm_dp_panel {
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
-	struct msm_dp_link_info link_info;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
 	bool video_test;
-	bool vsc_sdp_supported;
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;

-- 
2.43.0

