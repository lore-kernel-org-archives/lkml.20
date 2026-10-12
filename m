Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE59376A09
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812014; cv=none; b=rx/qW9qyh+e8sP3UNqyVUmt+JQLuHI6deFvmS5CcB/KK9Fp0L5GWCmrWBmWgkz2OYcVjLCy3D9vZnxwE86Dp7cLOkmMqjnDN4Ur8mFhypd86CWTuYb1/8wwG0achmLET4hb2YMaC5Q3j1Eicd7Rg9n9ny4mLRgHqYGFOuegd1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812014; c=relaxed/simple;
	bh=abtvE9SA+OSC44J14adMJZemnzeHPDaOOWMA7+pZgL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jSQSIR3NexsrBWGP0TOgKE1ZimcH6712e2YUe2dvytP9guhm1ZIOi99d0jIVfOLvycLPEiCmDrzlniKHZpgRo63RKBhmeQGarqebb7PFYtjYaRX989gMaQYneEKHPnr35/7smt/S7Et9hWcYkkNAb3B38vaXldWC0Ihit6BEzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1g/JLZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxMZpuu2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1g/JLZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxMZpuu2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0apH2679899
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=; b=B1g/JLZmBYih41fz
	Fo5K7Q2TMnwJFApQt6m5QvfjJVScozrcilJYbcHVCkhIisfwOi4w+di2folhzcYh
	Ov7FMiXD6g28n5tRQ4+wtlbA2e72nP83oYW0fL3r/vAx0LjspyeuIT1Uk7OkNoJd
	JoGpGZW3/BX0oVzJSFJDHBLMDiDHpZdyeaHHHjpL38JVGBOsEx7nSjuvymgqE1/2
	E6qVBbYaHYOrcqR7MB1h1Zq5yIlXt2uqcQQO1ZQKkbA3sqIs5QX1TXj0063E3sr2
	2/P/qNTUnxp83fxpyFPel/Uk523pBuI63rE2BZg7ZRr6BZ8OAKhye3CrG52pIBLH
	YE6irg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1t5bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5649765eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812012; x=1792416812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=MxMZpuu2C/21Mc4gRPe3aJN+N5pbVm0y3AjU3DAwJENsp2chsGy4KxiTkLgwfcpiM5
         InSC0DxLE5AhGYu1H4y38wPrdj0VI4SqFlAhmaIuVqw4J2tFoEwbQUPC5z0dLTxYsJLx
         J5iOW21IQTXBILUNb+3ytu8CRAs1zZUBSC30X6wz7DS6tRt9IBHpaLQX+gVAqD1ZxRJ7
         tAV1mZphGXyKUCXCJ3+wnf7zupXbUYJUNYT5tFzROLu0T54/CjaFMZ6mz4Oj3LV+Lj3f
         nFJzxZ9aELNOmtq/rvxaSIEi3p6Ggfb2XdAfBo2JkxpoWNrQZpBv4F5CYsFmVIVha0g1
         Ie8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812012; x=1792416812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BgydbxL5gnFgTs/5vZY3z8HM12JSjWAliFP2DRtg+4=;
        b=1XNR4zOrG3Rvm6LQiBj1crLaJLXIG2tEJN5OE0nsyxnt1b0uk+LB1fb7rtM/0nyqsc
         eVHkCi1fWAs731+ch0fV2Gxj67yd40ElIxGiowSIPlAPt26W/6kXbwefKd9BbW36OakE
         xytsMCuRlN3moaADP37uFK4jrr2vYoI1bQSH6TwKTYlLS4auJyLn059E5BS4JJ49wm7I
         /VSgLAXcFQNRegWO8F23rp6A4Rn38KBJfAdSSWy3wb32SvVSHVXVsqATgshncL7OuHGF
         ugForCzRVuw15DAjsY9gp7vClNY+4WoLi9MZa+MW/um+f5H3RXJC5t9DvgUxTdC0IoHc
         0zZA==
X-Forwarded-Encrypted: i=1; AKwUvByiBqEYXC3BBPgKFfNzFJ7wF8T5xoYEei2YAD3hHgqXVpTlnGdPY555j5b0SBlQZDhfDQio483a7NYeIyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvEFWJYcqOr+oOyxuZ4JwJJA51pmHOaiXfilMKrWQRVemE+cCg
	UmSaOIS5SpP77s3oLV8ctFi7/2r9p4n6oI/DuuFcPsT6FWSJ8QvDs5rT+T4EKTIQMJcCXAJC6LD
	/RMwBl8JnHClRDq7YM7Zv9D1mQjyXiP6iojmwKHeH99UbkwpkwCCT42qp2dp072z31D0=
X-Gm-Gg: AYBFou3EAMXMMxAgMC7Ncjs5wfV8BGw8s6UJ20AfkObxlUHVm63fl7JrIqoXfyf4I+F
	xOX0b8f/pAZGd6iDNMvzHzia4SfKB5HrN4IJGndi+ziOMmVrKJqlqYnH/rYVGcWPIQxEeLMwpjE
	1DW2UZVnY1QZlL31yI3CSSJipCoGcs9GhjWfZ/xhdqP0zyLbev645ZmXneFFqpk/mPPuzfQH/i7
	EW4y8vwD9GT38GdegUZ8LBJVT4D/goSzl8lf7U2qcaoFNbs9cdFHgox00sxPUz9qAbSiU9WTHzx
	+wtBtdOySUq1dAJCCYpGgjRnOQY2Xg2s+EXqzK8c67IXfedp/Kxr6ozIWxPFmATuUbM67rdRmH/
	E3Qd3MFIu/U4Ndrl61fSc1nq6BU8=
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970365eec.26.1791812011462;
        Mon, 12 Oct 2026 06:33:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf8a:b0:351:1ec9:aa4a with SMTP id 5a478bee46e88-3537e063a23mr11970325eec.26.1791812010749;
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:30 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:16 +0530
Subject: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1767;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=66JtXzji1QajcVRTK89pE3DM5ER0MuHJ654ycwA6qSI=;
 b=kB21rf3weXGt0FrypFIMvBPneNYZUAMZ7x1MMLTq7YnZY9HA3x+wh0ohqJGZrdtL8m2dfzOT3
 pR3PyqDrrXrDffe2ucAKIJJQcpIRWRlC82ciCDP7B4PXBDbbPK1pL8K
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: _zIJPgZv45R4kniOA2SfhA_V-CQlZaOH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX2IEdE5kMLyHP
 tRVFeejgDqGXwTUWSDbD/at94Z7msBGgI/089FQdZ/rHlInnW2A2+rJ5dR1vLorZYkCDlBy6ZZj
 1uExO7z9NMmZvCTeIjRo5qq5noiJDuY=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acce1ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=U3LaRFsynPqcHeHyg24A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _zIJPgZv45R4kniOA2SfhA_V-CQlZaOH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0Kna1+JMg/16
 8cRxL/OEQ76cNQtZgAVFt+2KnuaFMy64h+oPF/oD82jxTgJ0BT5BZD0CTAt41lEB31TezXNSmGr
 +BQ2Xg1iQWeygXf+w7OQs1LIX3fgvHnCQB+Trp/kRNBp7qjOF0kKNBMP4qe8/M9k5TYMynQjLs+
 gOAcT7OddDWSOlpLBuSWAcpaSAikEbfsCZ49cSPV8BFSWI9mRwD0I9bJmGFeq0bOEyTmPWjlvpy
 mFsdQ4ui/yEek5ewhv3MMQR5VftsyALTycOz39IvEFgkk0fhTqrdYUtC0HebsKNeqFFxdhowE6y
 JlvjBvGFUIMtHebuQxF29Jkof2WDmvaAvmJRX2WLhzSbBz6ZIzTWo8sPm9fDEdc0l+/syMLZrH8
 AMfKOg+s3u70cHrC+SbAj1JI0oZ7xVNRFuzh1lLwWiRpM6IHjgnyDwmxNpoKZI+PBXqqRWTxEzK
 glClF+bPjZ6GUZCNrIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the Nord DP desc and compatible. Nord is supporting the
four DP cotnrollers, two per MDSS instance.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172abe..7d233da396fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -103,6 +103,14 @@ static const struct msm_dp_desc msm_dp_desc_glymur[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_nord[] = {
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x08d54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0x08d5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
 	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -161,6 +169,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,nord-dp", .data = &msm_dp_desc_nord },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

