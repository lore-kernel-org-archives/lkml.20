Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399337B400
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812051; cv=none; b=ug4ZoifHLWP0i6+eTv5JLGPj7xE/6ovN+nqRzcJEWFHp6QhnQzJuzp65/j100vsvgu2ol8weM4ptI0NQn1nZ39ImlhHntIcj6LyRoHnStv9LvvSI0Xd8Ke29wGUTZIFDgOH49TRC2JWuAT5/L2vx1m58+fdcgMs01kv48KIUulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812051; c=relaxed/simple;
	bh=tUWEXflLN+ATUhVW0Id+WFZvdmhhS/QLBeWs5TkVPLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJQ659mvXfQxtcsCimTnmhd94OetrSkJmGT5XycW6k/MiUZw/q07UGSeH7if7lzNVNuQtvhZwyDOhlZiBwdyL20MRWgXtZ08bXq3DBYbPwQcrcR0RuhFfqGyIhDX2+1EB0KlFIY3TLzgRloDMBk66URFblKKHB/Vvh9p9yULQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzfOvXsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdKVDyi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzfOvXsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdKVDyi8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC054q2786873
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkP4VyeZ4HxhVk0X5L5pCXJ+WXct+DbRHeEY+gkzrRM=; b=hzfOvXsggYekKdfy
	5s9ZhSh38Vjh5zrdi9Fc03qEysCe1UyK8ItjCaCmefOFD6xXieCxZ87u/CwUYYJd
	UwhaD2FWlmzDIAQMA6hqYiXZLdBZbjL1agRuxJd6xLClvpOi7UYe3tUbGXjiUzX+
	FOJBPYY1hNgyYjBYUOMgas2Zb0cwdNd/P01lX75/X4fQgzE3ee4GmC1b0chD5xH7
	b+ipb3zwA7yRV/Ohc8R+zfOy5MSRacMr0DKPHBhnQK8ZfDeT+02Ev1GY+wKsmjaO
	rDFSFJBU72YKWxK1aGkv/isnv1s14D6EyUkh4NyvWg3U/xCL+2UBffJ7chJd6LwH
	R/Lwgg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgwdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:34:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so1128166eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812048; x=1792416848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkP4VyeZ4HxhVk0X5L5pCXJ+WXct+DbRHeEY+gkzrRM=;
        b=PdKVDyi8004BNaputEXu5dirxl0xe5OHcaIId0ER6Fk2h0iz0yvtU4AH1iIY8O9Hy9
         Y7v1dgNlHhiQzfbiDsbzSRJB5JCXdm8Dk5b+++g07+CqbOnXYAcIPWMpxRvEFUySmY4r
         zX6YPC8tAwVTtQipP0pqBL+UuXw5Q4fpbYdOUJvM2QqEGzpQrMEHVDDG4w6TpZ3uw1IY
         YNA/a7pQXtElSPoOwxsxKVUS/ZelileISqxxeuplYtbzY6xBpbxEsQrbnetr0S4E9WRw
         Y7Xy1UNHCYmGojn5NXwaYjNKYEkGevWmQffE302g+BBoFf1NDi65teVqNx7dfihmU2P6
         /0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812048; x=1792416848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkP4VyeZ4HxhVk0X5L5pCXJ+WXct+DbRHeEY+gkzrRM=;
        b=b7f+w0pzd51k8H0KSVfRZwDkvQ7sC2lvsB3BDt7wuNjlj7vwXX/l1Cs4dAV8VP2fYV
         wkdWI5VVr1GRZnyOoUBp7mOKxUO4/D74hov7jHMg889Fv7K/hewWl+z1mRhxwHBQjU+r
         4PZZ+0Fvc53iZ/q7/XQoi6o9w3i//oaAYk/16ZCVT8Dm2uS6UN818cfrBzMAw8bGR5+s
         nFDW9zf/jfxVafazAz9rVxUeIUxjS3ZceWSOj522QIZkmgemRK+odwEeiZkRZgC6oFbR
         XKQbc/DUqdvgNKuZkr5jp9EmsAQeMSKJhyKwSnFmtAk0brzaMZFg2nP8d9ukdbJvkqd+
         FOZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQxSPbNxdO9JeE8io00GAAzDjhwXT0n5cmO0cqKzrVnbpcaJiCJWZDaL93frYK1au6rpa0XcXhIIhkk9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw1DknAwI7jtVUfMXTL0b0FOJFgUWFT1iP/UFbs3AfI1mqM6Un
	GulH1hDfxsrZEvY2xkkpMkFXj1Dm+BJfAW2wcCeSdKXJiqiQnCspjRv3YvMVzdsyawVch5xNZOk
	awjSGUexvxD2anTNEzXfAueOnyCfWP3Ojp6pdAQfL9TQKii/tO4qwqpI0G6TafV8Eia4=
X-Gm-Gg: AYBFou2nruNJNjYYsNTMmraJsaXEDnSwv+OFwP+DjSzF5bXwhgVPagg2qjuOQEbXoay
	1Kr6ql/C26qjxLjPbc1uvlDwV5WcCk+CtuFN1VmvTA0uN8lCfAj0BGpv/1pyfiNSExYrdgTda7N
	Fkk0EOnkki3e7D/c0wy/vso+Z6zIj8hSgFCVibWfHRhYQ9e8EGEgGwTaz1Qe0wqPEJnR7gchk/7
	ZK1WmfCbU/bBVlG5SxGBbEF0KgPWCTPjmSuGN2lxKmqgy8J1mrlhBDWm5r7DDQhmcFcrEgOBG+t
	DJr5xjYZlyJwXnMt0DPs8kcK0NgbtrFf9lTMMhbIdqn4Vz1ROqOJWyHsokNRHxT9z0M7kv8SX8y
	Qq1huVNjIU27ffiW2v+EdAZoIaAc=
X-Received: by 2002:a05:693c:820e:b0:351:6665:c611 with SMTP id 5a478bee46e88-3536c5350d3mr14448516eec.12.1791812048006;
        Mon, 12 Oct 2026 06:34:08 -0700 (PDT)
X-Received: by 2002:a05:693c:820e:b0:351:6665:c611 with SMTP id 5a478bee46e88-3536c5350d3mr14448467eec.12.1791812047353;
        Mon, 12 Oct 2026 06:34:07 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:34:06 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:20 +0530
Subject: [PATCH v2 10/13] phy: qcom: edp: Add Nord spread-spectrum clocking
 configuration callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-10-a2ab9af954d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1886;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=MfugcJJLBszUYvNk7wfVoGG/R0kRg0k6Nei3NjNfVE4=;
 b=6IvM5DvIeDOUYfuKpdSmf47CVd4xsu1yfn/Km/oSFhGKi3T0u2jXi0K08+cowDk5XLGgfKKhs
 CBa3CQrCNJAAraKsQ/7UYEnCplC34pHwgzmLbiK3tZe02XshYU+bBC0
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX4qHwSrpRJcBY
 iAYi6Y/ZqESj8rqU7c2qX+ECtGQj1Ianz1Cl1R215KK75GNKb87qfexIAg93Z0Vd5rEseUfq3+u
 TsrDMjcCqmSE7wB1JBLRgMZ9MIIz32tkPJdyw3Van47fshJmSgLDQOimgQJgc1gMmsI5Cs+VDde
 5cbV5Y4DmiHJVosNx2gJsYRrnIM/hRIH2C74OfCLQZSO/NmqE7laHv5IcgVoPG10iEnly/OLu+D
 omcAttiqQS1FNNQBt4pQmmFarsOywiqAysDFibaBe+q5T741iG2NtTZnOM1Gr2YRLa4TqQxNOQU
 l0AlPwrLYH1CaO1bOmeOlPAoeseIjlJuFbQp6zI74Y14eY4WKIykuvIoC3Ffd0s98lp7lZ89/xb
 NIGF/M1wqHjwPfF17wGXiqGjg2YkAFhh0eyeesmFM+c15RE/AVegRIsCxhY39DnFjp3zHpEjr6m
 sfhOzcLOruDTj3y4vCA==
X-Proofpoint-GUID: blt8mshG5nuankVeXebv5rGPW3h7wQtj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX51SwNO5q0i5k
 lk3SZE4BjTDMXD2Ua+J9dBlpIk6ECdk/uQPqbGTthoPgKPNIWuPKE/OL43KdZ+OSOkti0tZW9fZ
 O2M+Ow8ZwFqH1rGS9DXqJcmT+P2OM3E=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acce1d1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K-9LXfgjdCkVDacm8m8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: blt8mshG5nuankVeXebv5rGPW3h7wQtj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different SSC register values compared to existing SoCs.
Add qcom_edp_com_configure_ssc_nord() which programs SSC_PER1/2 with
fixed values and link-rate-dependent SSC_STEP_SIZE1/2 for RBR, HBR,
HBR2 and HBR3, per HPG Table 2-9.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index c63f721702b1..66c31684c48e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1601,6 +1601,42 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
 };
 
+static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 step1;
+	u32 step2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		step1 = 0x83;
+		step2 = 0x02;
+		break;
+
+	case 2700:
+	case 5400:
+		step1 = 0x18;
+		step2 = 0x02;
+		break;
+
+	case 8100:
+		step1 = 0x5b;
+		step2 = 0x02;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SSC_EN_CENTER);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_SSC_ADJ_PER1);
+	writel(0x6b, edp->pll + DP_QSERDES_V8_COM_SSC_PER1);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SSC_PER2);
+	writel(step1, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE1_MODE0);
+	writel(step2, edp->pll + DP_QSERDES_V8_COM_SSC_STEP_SIZE2_MODE0);
+
+	return 0;
+}
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },

-- 
2.34.1

