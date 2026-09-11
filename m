Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3D48AE20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141193; cv=none; b=ofEfkuyex78CS9qKLpCI89vi/8VMtmaPhaG0FgR/TH+DbhhUA++HXHPbQ3U5/gFuH3zNB4+g1cdbfSj2qLoI6Wb4VE45GrBsPjOoRQ6nhEZ2iTc8YvJnQ0ovdiQsqb7klIIHnoQ27YdPOQRgOK8X9lEFN0I//ZMArg7K/fYLJwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141193; c=relaxed/simple;
	bh=UsJdTMb6bZsLoTsBJveCZxQ70+zk9Let5j5dNFvop30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EzT6/GDa/kXNQ5Fm+fs6UNigfldmukPhhbT5I6aFsa/KdYHFQVLcegNfT4w1Fz9cNGo8syOlnyVULfudoZoIeJnbhyf1xqfsAwlIOq70kUd4lAc24f5PiG4yxl1M5Uvdu7VfPHxT/nJScdiUlGoIMbEzyePVBtLozGRKfBBsDqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNMAPedB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkfZ/x7B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNMAPedB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkfZ/x7B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmEUe3780627
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=; b=ZNMAPedBNqVlA8Lr
	Ou5gpYxhDiC0HqQy/EQsPO5o7gYUn1tvFkbWOfd/bZW+3xBPvvgZ4RXiQcww/fwy
	53JFIOwzJVj5gQGBq0LDLohxDgBCtAxDjAgUcbP/QQiIhBiVRM2uuQ+cRsYAR8sk
	WApxk0L/HnTDo4V3tNrJrwSxk/MTZ7j2/G51kYCW//ada1Pp+JnI01kNNc1TpJmF
	eh4uEF/+ZndBgGrWJ8tj3n9Vb752K+2bKmSOIgCoejO69X28Wd0eDZCys5fPs0dT
	KxzDSPljjvkfFOD5t+/gck4yh9qSuzL3MEkxWbXeX+m6DtIPAS8osu5NDkNjVo1/
	COLgnA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj80h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:46 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455cf15f8b5so1717364fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141185; x=1789745985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=IkfZ/x7B9IZ0pE1pke3HyctCxheqgzWiz0EcLimNs5S2CNvSOtyAmkr66c0si8Jfm5
         Cs15CTHCAyK921mfrcT1QWIWVEDtbwnrjqz8xJZnh9JACAEnkK1jGGlCmh2iGhZ5hQyw
         MRtblhNe4HqyyU+oICDgzN8EMCwoVabDEhQp2NBiOwCak2Vt4XPVkWx9TJNFyoD7d8QL
         LgwEq7meJp1qQah0xs+AHt4/y+e6aaIWYQZpiObHClDGaQzahNHzjrVUzk9HtyUc39cc
         UF1zxzANKQRUOIrbDn+9p78l3qOjy8B25CKccR1fXXZdET3ZGgVO9wvgRlnFKcHzC2lK
         xdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141185; x=1789745985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CTqihogoF3yIPuPhTFZAPSTFdh7eb9dOeBLIBMoSAA=;
        b=oXFbkR8GCmMUeBn8d47xl5BU1Ir9LGxukjSaw6CjZRMRNefiMjpBbaJwUo/YXCiLZk
         alXCsfwTRJga/od7/M1tzO3FYoPxFRBfQavAIDgvJ0HWSZ6XiwO9llIPFnwD7XuWmwLf
         VnUDLAFuMPPg4KQufHPuXgYrVyV2YZZp1kLm6+e8UHaMsOkuMuk4Tlwl/60tGgS/FgFC
         SqUpocHccFsPfdlpcN54WoKYLveGm9oa84npIUqxw04+hLiAhIrMJ+0xmR2DgQJ549tr
         5emeOkDU2IbZglk8oHz65RJmkxj631NdXLzNSvp3RttnqcAxURpwrZSDHiK2Dx6M4rFY
         9iQg==
X-Forwarded-Encrypted: i=1; AKwUvBxRmCxncE5ykP+i2WNOL6Hc8ZdGzQoW6P6rWDnITJX5LQIOOdCf/ASGJL2uEEcD2lvjLQWpU4QO9Eia14U=@vger.kernel.org
X-Gm-Message-State: AFuF++n2hDWMe3/dMirX/uw+PgxqMllvvpaOg31bft/YioWQeJq6AhMS
	eFdk+cFhfIniKJ4fPI/mG4m9DBBo1MRI2OEWblBzs+Y4bclxqaa/BmvNw7B15+QIRfPhZ/29mAx
	ZY+TVC336pTYW8fyqd0DhrhQEUhhEEdtySXWWku4DxIIjSrjv7ORmSayV/TL0GLTUDTw=
X-Gm-Gg: AYBFou3emUeimEHbM/G+tDiuxe/Lwcrk2sXBHYW0/4QSDCec5MbA6GYAQ7GfsmCTUZn
	JmvH0qmoxHLO0a4ND4htBiZ7KXz2rf2V5d5VAKJ+ngQSOw/7wjwZZ74vW9Hv8PelWODk4xSPIJO
	vxVVKYxSOZWWbQdExJvo/jCpaEoK768fNXGEu/y8XLQPYcXJzdAfbPhliaA0oF+FMHU3sAzCIWZ
	6XPxrs0GV8+9/y09vC2DMGOVUjuTbpR2AD55dn+wQr2XV/xxjQFv4JZVSkzvE8gAS8HzOv0dn4q
	GPAGoH2eF9UZnm/iuqHVPTvm+nYHDFmO651qiHKSTFeySIBdN/IsRNo2KB0JVrRXMoV0SC1wlLH
	BTn43PEL+h30shgc01sXs7vaQY2I=
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131543fac.10.1789141184389;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
X-Received: by 2002:a05:6870:21d4:b0:44d:2da0:fa1f with SMTP id 586e51a60fabf-47dd35f90e3mr3131501fac.10.1789141184024;
        Fri, 11 Sep 2026 08:39:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:43 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:48 +0530
Subject: [PATCH 17/17] phy: qcom: edp: Register qcom,nord-dp-phy OF
 compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-17-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1090;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=u2YdZt6zLxkF9NeeDFO6cI3YUG8ouytJ0A/YUYMzpN4=;
 b=1rlx3/KAdoDBmbu9KB7g/WFds2V+Ax4LJFhoRI9zajHaHZ6SisVfgNvqXrfK2Fw5H02r/Jwvq
 3GllpLpxEV+AQB0eIz4Oai2ZEMjP/Cdnf2RNtpRBg3QwvV1uRsFOCCA
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX3Ol+rsyeSMMr
 Sl/DGlx38075IecpgMJOW+NFIvOcg8sgDxDJzNLBkldeubBcDMp4y+XuimzxpjMChVTOvcLHHho
 83ytPkI9qsCew5iZ1Pd5bSAuxEjgioBidcRWolTcc0HicevU6wgl/m9wFOWlfHmOrzXKJy5EiEy
 940z3JhbjVbZFTp359i34nucbixePelQ1z6y3XjeRMo64prY+yWmJX48l6lts960tQtoDAJfBrW
 ihHrPqDPGSo5Ysv+IoHkQKYFkZcnu+j2Dfjf6DB36PbbLYblLyU3C93ldX7lTYPescFhzYwq8r4
 M0DjSS9nC/xguaquD+j79yJ+nmhP47ygdkCJl2LqK3gk8CGwSx1XxOqhS9K2MWEisQ6GeZhgr4w
 E5DyheGwO7azrUDa5lqop+bzpRRozLhzvphzlIg1UNCtiisxLVS+UAcWLicn6ZR1/ftLoOhRYW8
 7kHOntB3ulOjAia8HYw==
X-Proofpoint-GUID: wMIlDFRO4adfknwHx5HbAajtq2TQsV93
X-Proofpoint-ORIG-GUID: wMIlDFRO4adfknwHx5HbAajtq2TQsV93
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXyO9tZgwjple+
 an6HgnPEjSWp27DqiWDEd0RGoc2l80puyFwBmAjkyn4nfpAW4GYwvg16piBaxJlpPg54xK28zAH
 XtULdqIjHSOId9H+4KgdSiw1aFLT31M=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa420c2 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o_H2acsbjChyEWv8a_8A:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add "qcom,nord-dp-phy" to the OF match table bound to nord_edp_phy_cfg
so the driver attaches to Nord DP PHY nodes described in device-tree.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 338f28cb404f..f9a85ae8be62 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1872,6 +1872,7 @@ static const struct qcom_edp_phy_cfg nord_edp_phy_cfg = {
 
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
+	{ .compatible = "qcom,nord-dp-phy", .data = &nord_edp_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
 	{ .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
 	{ .compatible = "qcom,sc8180x-edp-phy", .data = &sc8180x_dp_phy_cfg, },

-- 
2.34.1

