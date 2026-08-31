Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314EC3D0BE4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164296; cv=none; b=V9XrOn9MDDHsgMLvLlI6MNtRIa4BU3OT+P8chzC9+Du4NBUEn/5JRb+ONdCpYTnt/zLHUF0n1nPQF7G6afbl/WXaaA3EjQIcT6kXbtWCUKQZSprcOyXQJk635r95l+qorYNN0VuCXaG5G7AU1gXos/RuVyT7B7HzPaTo8PrxJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164296; c=relaxed/simple;
	bh=9VpXdKX5WvjhOg7NrJO4/hZ1EJd5dXWP7ykt8AQMJ1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yi7G8A4saFrf14k6h6BbNv/nkWeM1OAwIZ4jboQOxzcrOzLj43AMW/gYxNtds8zBjWPNWYxn0s3VZWu8s8khLxB9fNOnPuRrB7ABo/tg/ipmu3kmk51hqz79u/Ji/tmX+Tsakj1G/FgSf61rAWPAfR05W5uXxVram3cqTUi8zww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6jMyODY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhNj58+y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6jMyODY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhNj58+y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xKYm2460296
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhBuptnYFpKMiy1xDLqY7AcfcTYcK7dB1Xlp1F9dyy8=; b=L6jMyODYMnE71ej2
	i+qbIMA49OESJawrWi9HeN9op4pBUEogR6W4MZ1AE4T5jp+ySsTL8dKuMGdV8E5h
	yRaFRExJOufBUc9fv9DQ7yirnqpCiUhbCJbO/1vG1f75DR/KzXGta6p4bftD5Hkt
	bGexQoOl1Z2POOsk62ZkpmAo3BbDJMBtYIgC3/Ak1pLUjfS2gzvVvtrwQupAtx2T
	M06+qVAN/+Vhe1fwpCFpAk/Neq5p1/KgDLITuPBsxAhWLEeNs4rCP4uCT6K/fRtB
	vPXZMwfxo1s66Xje9jtjj5OA8xFv3B8JHaumsyk/VoqhWcsnRb94G/Eig3h+Xkz2
	3fFcog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r70d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so36386846d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164291; x=1788769091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhBuptnYFpKMiy1xDLqY7AcfcTYcK7dB1Xlp1F9dyy8=;
        b=YhNj58+ypplLaofX0LKLundQPJU73g4L9HR9yn0078gyqHycfeZGl5QcY3ARZlVgPE
         XNIMUizG+bY7QN1W+nWBGk0s5uq9tGhB0hdZRX2CT6Pf5mwfMDmK8GEosxAgkpHI9uZ1
         ADdjBDYEqXm28K6USCep1a8llkj80o+NdKLYvloOCsbqTBxhSxE+9BpgHHWPx8Lz85Oo
         LaLIg2nYHyNyN0J32tO7l4LiWAT9uR3JBfPEQ0CtdjOrC4cZ9w3SMDC56gyMjk3CSPAp
         2v6uxnVLawSL8v50M6x6COSmcH73xoZR7b835tW5pFMUZ70xrCG0iR192X7hcb9d6vI7
         qORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164291; x=1788769091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhBuptnYFpKMiy1xDLqY7AcfcTYcK7dB1Xlp1F9dyy8=;
        b=TVXZGrcCoEh9cbJM8lIDbYH/WILR/4Cwzv7svAv6iqec5vIbbdaPB3/BKQKTykmxQr
         8mlyRGMxMN26iyGbKWCZyb1WmlKyX+LTUBPBjNR914mOxoxW68Ad3utmRReQw4F7zl6g
         5AG4SPx79LhtcQrgXzmkVcIiWIFNJNjVQ3M1DA78zYtosJKo9sYcjMMCT6gKsaUFnPfc
         B4CnElBziZSlo5tLCeKqlXyiQMnPr3p5zeo2NxikucKFtIilmcSQNgnZ5tu58RaBJuM/
         2Qq3I/ydAEkl7Iur9oF9qajmt8BiA6MCzS5tSoFf8886ptIAhxDpXnhBphstkwbd/4yr
         wE5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKpB/EXJA9Si+cVpD2udeMOdtZljIfOfyQnRCfCAYJMIza3QaM/CDMTZ0B3oOq/g4vg2om66/C2BPX4zE=@vger.kernel.org
X-Gm-Message-State: AFuF++mPpeqbnYCiv2wPsz8pklX12Ux4wYt6zmGeQBNt9HWiTA6Ib/l8
	6g59YDH0ox46xVU0YrXjLj8fTTAFjDzq559jkxbyLFKp8atsl9NVQaPzsBpAEnaJ4VqxN/nHeP+
	TEbu1uDihxr8/Qrtq8zHe4io6Z0WpukPyR3GhRWuauYeu2EvAf8dKPuoq9W+p1kg3iv8=
X-Gm-Gg: AR+sD13i5URRvfjWTTAK0rCqk9wEinHW9UtiZ5hx8v7NxA65GuM0gz8tFKaOGbWyfGb
	DkDXDAxSFc+OSSa5FbBDFoKYhjX3TGWRn19idcVOpKwNlUUinKPZSUE7amORsgzAUR11BmNMPNH
	IMpKMx8e3S+mxrQiGVWtnmItA4ILeCX9lgJKYPN19yXI8r3tEqN1e57FRWDlqZFHDfBjz85gDU9
	eiSGIS6cIGUwGc5/2Cwl5CxI4G5aEFStOOdLKWSFKA/s1jpVH7HL5xs/6lQasSdjzogA0trXzDd
	H7CUYYH3EcE/w1JihJUJt6UAKdrvCLOPOpTpjRTctUNQG92TzwSgpP6QQBAINdxsCwutCIAEqgW
	IKuddEXQaLoefK2e9oBSZHYHU1rxjC426sNldvdI2rqttpilRZtsM9v2fYJEIu+I=
X-Received: by 2002:a05:620a:688f:b0:939:365b:37d8 with SMTP id af79cd13be357-93942b9d0c4mr132890185a.36.1788164290767;
        Mon, 31 Aug 2026 01:18:10 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:939:365b:37d8 with SMTP id af79cd13be357-93942b9d0c4mr132886885a.36.1788164290247;
        Mon, 31 Aug 2026 01:18:10 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:24 +0800
Subject: [PATCH v6 07/29] drm/msm/dp: add stream-aware link register
 accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-7-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=12701;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=9VpXdKX5WvjhOg7NrJO4/hZ1EJd5dXWP7ykt8AQMJ1Y=;
 b=PLWMmy9dTlNadABriOB9vpmhWbBOosKISG6w8NQBTQp9L9WUzQZUgeGHGJgn2zeSkOPoHnkiV
 ThE3ESo0DhsD3FzB4F5YtOJ54LacepQWBlQx1hdP8fCtluLDjL1mpnd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX50tzX8AfYQb9
 jy/PVTT43MHb312cFWegfKhfXkqT0wJcocMFvGOOJWdYRU4v739d3IylyKOH6Rv7phlfiSEZBAs
 W47QPi0jGkcWUz6/EJVVIYkZkuk2soU=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a9538c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qYFs1fq_Vji6wCC2nv8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eRi4eekabxCEpWXYJjcg891UCjuiLywv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX80sf3xsLH4ch
 yiR59euAHOppHl0hORZUxcIxyAMaMWXcQ081kwHJLboh4ZThbLS9H22UC29KUPUDjVGLHsxKF3f
 JPRfcYEkQNkN6+LD+uvKf1FaBwZ7ZYep7QUzYOzkpx5W2KWTdECHyZooTPqYwESoC4aH9Jj1UXN
 NGgaxAy/LKQ/ADZS2tWR4o1Pab6Q6aRbAJIP2QMMeHk/wZVkfrHdeZW7lbZhGwjYvRi2Jdiixg7
 SYWwJIXen3EJ3gkn9zxBx8450M0UQAyU0l5EJJHkECQ+lOIi9vQUmM3AcPkMTSfl5cwjqP+xqdt
 Gv1bo1LQRH+EuthybNY0wN9uPZJW+iM9LSVTzZp93XO1vnYwvCIlGz476T8SQurm4h9PFrCv/HM
 yNbtGquMh1+pBp00QEznOgqDxdEq8y4RLqJR5pxktplRSuR6VNA84NvtKFs77F4ZJENl87RN4Rq
 ItdvwgowacIdsWSEuTg==
X-Proofpoint-GUID: eRi4eekabxCEpWXYJjcg891UCjuiLywv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

DisplayPort MST uses multiple stream-specific register spaces. Streams
0 and 1 share the primary link register block with different register
offsets, while streams 2 and 3 use dedicated MST link register blocks.

Add stream-aware register access helpers that translate stream-specific
register offsets and route accesses to the appropriate register space
based on the stream id.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 64 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   | 37 +++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 5 files changed, 133 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c0f5226dc383..e1614bc49a7c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -117,6 +117,8 @@ struct msm_dp_ctrl_private {
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 
 	struct phy *phy;
 
@@ -172,6 +174,49 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
 	writel(data, ctrl->link_base + offset);
 }
 
+static inline u32 msm_dp_read_stream_link(struct msm_dp_ctrl_private *ctrl,
+					   enum msm_dp_stream_id stream_id, u32 offset)
+{
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(ctrl->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(ctrl->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(ctrl->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
+}
+
+static inline void msm_dp_write_stream_link(struct msm_dp_ctrl_private *ctrl,
+					     enum msm_dp_stream_id stream_id, u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	offset = msm_dp_stream_reg(stream_id, offset);
+	switch (stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, ctrl->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, ctrl->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, ctrl->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -397,7 +442,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	 * RMW: called from atomic_enable(), serialized by the DRM atomic framework.
 	 * Clear stream-specific fields before OR-ing to avoid bit accumulation.
 	 */
-	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+	config = msm_dp_read_stream_link(ctrl, msm_dp_panel->stream_id,
+					 REG_DP_CONFIGURATION_CTRL);
 	config &= ~(DP_CONFIGURATION_CTRL_RGB_YUV_MASK |
 		    DP_CONFIGURATION_CTRL_BPC_MASK |
 		    DP_CONFIGURATION_CTRL_SEND_VSC);
@@ -415,7 +461,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_CONFIGURATION_CTRL, config);
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
@@ -472,7 +518,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -482,7 +528,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_stream_link(ctrl, msm_dp_panel->stream_id, REG_DP_MISC1_MISC0, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2528,8 +2574,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
@@ -2784,7 +2830,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
-			void __iomem *link_base)
+			void __iomem *link_base,
+			void __iomem *mst2link_base,
+			void __iomem *mst3link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
@@ -2823,6 +2871,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->phy      = phy;
 	ctrl->ahb_base = ahb_base;
 	ctrl->link_base = link_base;
+	ctrl->mst2link_base = mst2link_base;
+	ctrl->mst3link_base = mst3link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index bf593f4a4480..80d9258501b4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -35,7 +35,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
-				    void __iomem *link_base);
+				    void __iomem *link_base,
+				    void __iomem *mst2link_base,
+				    void __iomem *mst3link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
 		       struct msm_dp_panel *panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3dce9334d0c2..d0fc4ff508dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -85,6 +85,12 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
+	void __iomem *mst2link_base;
+	size_t mst2link_len;
+
+	void __iomem *mst3link_base;
+	size_t mst3link_len;
+
 	void __iomem *pixel_base[DP_STREAM_MAX];
 	size_t pixel_len;
 };
@@ -562,7 +568,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
+				     dp->mst2link_base, dp->mst3link_base, dp->pixel_base[0]);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -571,7 +578,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
-				   phy, dp->ahb_base, dp->link_base);
+			       phy, dp->ahb_base, dp->link_base,
+			       dp->mst2link_base, dp->mst3link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -843,6 +851,12 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
+	if (msm_dp_display->mst2link_base)
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
+					    msm_dp_display->mst2link_base, "dp_mst2link");
+	if (msm_dp_display->mst3link_base)
+		msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
+					    msm_dp_display->mst3link_base, "dp_mst3link");
 
 	for (int i = 0; i < DP_STREAM_MAX; i++) {
 		if (!msm_dp_ctrl_stream_clks_on(msm_dp_display->ctrl, i))
@@ -1189,6 +1203,26 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		}
 	}
 
+	display->mst2link_base = msm_dp_ioremap(pdev, 7, &display->mst2link_len);
+	if (IS_ERR(display->mst2link_base)) {
+		int ret = PTR_ERR(display->mst2link_base);
+
+		if (ret != -EINVAL)
+			return ret;
+		/* optional resource not present in DT */
+		display->mst2link_base = NULL;
+	}
+
+	display->mst3link_base = msm_dp_ioremap(pdev, 8, &display->mst3link_len);
+	if (IS_ERR(display->mst3link_base)) {
+		int ret = PTR_ERR(display->mst3link_base);
+
+		if (ret != -EINVAL)
+			return ret;
+		/* optional resource not present in DT */
+		display->mst3link_base = NULL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 504d7542d30a..d3468b73fdc3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -25,6 +25,8 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
+	void __iomem *mst2link_base;
+	void __iomem *mst3link_base;
 	void __iomem *pixel_base;
 	bool panel_on;
 };
@@ -96,7 +98,19 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
 
 static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
 {
-	return readl_relaxed(panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		return readl_relaxed(panel->link_base + offset);
+	case DP_STREAM_2:
+		return readl_relaxed(panel->mst2link_base + offset);
+	case DP_STREAM_3:
+		return readl_relaxed(panel->mst3link_base + offset);
+	default:
+		DRM_ERROR("error stream_id\n");
+		return 0;
+	}
 }
 
 static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
@@ -106,7 +120,22 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	 * To make sure link reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, panel->link_base + offset);
+	offset = msm_dp_stream_reg(panel->msm_dp_panel.stream_id, offset);
+	switch (panel->msm_dp_panel.stream_id) {
+	case DP_STREAM_0:
+	case DP_STREAM_1:
+		writel(data, panel->link_base + offset);
+		break;
+	case DP_STREAM_2:
+		writel(data, panel->mst2link_base + offset);
+		break;
+	case DP_STREAM_3:
+		writel(data, panel->mst3link_base + offset);
+		break;
+	default:
+		DRM_ERROR("error stream_id\n");
+		break;
+	}
 }
 
 static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
@@ -766,6 +795,8 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base)
 {
 	struct msm_dp_panel_private *panel;
@@ -785,6 +816,8 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->link = link;
 	panel->link_base = link_base;
 	panel->pixel_base = pixel_base;
+	panel->mst2link_base = mst2link_base;
+	panel->mst3link_base = mst3link_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 75b23c106a99..dc046fec24fc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -104,5 +104,7 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg);
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
+			      void __iomem *mst2link_base,
+			      void __iomem *mst3link_base,
 			      void __iomem *pixel_base);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0

