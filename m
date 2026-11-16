Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835039;
	b=jcMv7mCOre3ZkZU1/IJuxqlDLYiMzPbF+1a7m82dYgjZ9qvWAFtWNw2F8F+mUAZhX065
	 jyjC0KxU28JFxOCp8X19jWw6Mc+bHZLxEwMpvtSZ6jPnlVhXsPo91AVtFHiqsUOQPd54S
	 vInfElMe64seJ5J7Qu2XFsCewQDwrsED4stVh0IGhfu9kzCQCrptejYrM0oaqCqc6xtfB
	 h9yHk6xN/agcH2V12YIEz2eJ2vO6+fnXKciLiAZufwL3xoO34kjwpzGLrXIHO+KBXdYhs
	 HFzknArS+UCs3dYhpGvbWbP73QdLYdxcTgLQtG9XiwYwkeNC1Cu9BidZfL97ELokxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
	b=Ts0GDG+x/qDorUFIJRXg2i2P/hb7eVIYVXRz/JE3ExFAj4LUR+z0FdPWYB5QgCuC8PNq
	 zvmMITVEynxbknjakv90b1REqldingU7eROEk4k7HkFmGUYYWRk69EvESgkvSKqslYoHf
	 ifQD7J7ilCZigTOzMHWV4Zrv31LH5L88wpeml9wUdVCGYEPLfn6uNd49zf4+ycBoX7Wmn
	 4hp6YpLGkrfUbfmTvIM6SCToddG16RGZ0oefdI362WY34trKUHi+ZDRQ7us+6qxwklpvM
	 9SehHINtUq/nhbUafcfVbcCZ8W8vwkXzVe6Txlvxn3jJGJoWCABQWEGQ6BU6p3pII4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE3606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7CE3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SEBaEYpH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RYNnN985
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC19Rc536601
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=; b=SEBaEYpHc8jEl+Tz
	VTfNtRbaEmPc2jrwl93W0jgyzhiVnqxEyy96KKDGqfOIzzOoHdfTo/FNCousA585
	/BZk5zDyNUvjk5C+02CzTQPKyiP+khk5F6dMJqDC2Kequ5/sj2vLzxy8og8KPiRB
	xBzT+cMUhTZleyuOIsvg4lxeVgKA3sgdYefq3el6EKI9Sot5Mx7o6TUqcxyXmr5x
	g4b7gpwffP4tJmzx7FuPNZkqcxJwBqKpvrNp36qMEbS/QaAFD9/aXAmCEPr34R6o
	YwiAj8P4FvJlbrH+SrnDVseHGi06M8XW+rylW90SxbLciHpljZILQ1YmFebMGCbm
	pO05uA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqggp0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:17:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920f6bb141dso1996286d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835037; x=1795439837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=RYNnN985P1rf0m6y1kwIFq6QYhfQVl2DB643gped1WQtSKIGEP0AXQQWc8bhZkE4XK
         3Q3LkWc1q14FDP5mDKXSXi60nBWKv9Z92hBCp1ZDnLRWKPZxYEbx7QRaSlY1L5dLYPf8
         LVTLfMcXLVGWgfe6XQevMYE99Hac+dIdRutaixIh/rATYy8AxhMwGCf1pbiK0SM/W6Q3
         WsGs35AH0Mv5wFOQPHLdV3J1CLfI7obUQR2N+M4Mdr6qQafgzV5bHALewcWlBYogjCmf
         ExVGPXWmBkvmEW4DXWPqlP+3zTQR6h1GI//q3wNhfCYs/Wp+lKbF+OLpOqLz0sX/o7Y5
         bhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835037; x=1795439837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1w0FWR5wWQFDU0ye3GVQmTCZT/x5MR8HdbR0B68w3LY=;
        b=KeNy/KtLw9KPtah4ELsWMoUSnA52eld9yNjHi36+G3n9aFQ2RPb7xRfui4xOYlpnhz
         YvOuvwx3Ft+E6SEXy03VO/ug5u3Q+EsBWjEdlmqcjApthXmmgXJbI3KjTcVBkjFCJgYY
         QbYOQEZoGRnsG6RqPy8TQGePF7XkccE8lvwmXc0+Yw576dVfdsoennbocj8/wQ66ggbi
         HJPBwnbbYBKS/oVZD9SDfQwkVV8tz0AnuQwsZWkD+lEZJT0SvQSGXs07hOmfCMd4GVoD
         7SdH7ef6Q50fQYW+SwAS8/ldboJUHxjrZf9BS6UpIw2kWFumSz7VWPMBe202JrQfmNEg
         VGSw==
X-Forwarded-Encrypted: i=1; AL+hErEOlLZ0aWgqi5+hcVBz/RAEzfJF8Pd6K5DEsjFB/+4Il8Z2Qee/XdooXhq+jSkewwQC3hOE8yxhSjgZVYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z83o3a0KQh7DFwAKsCCYKoDdF08J2e6HdumVWFIcaTvEkUv6Hmv
	aEu9LE7b3V3lDsvZmJKzqzn+jvsJR6qrBwHoaAvSNm5YN3IPiBWmo1g85RGVqrHA2CTqei/aU1F
	jZ8/vjWiVWkgv2aJWrboG4TPggwSqGWD/jwF6uZqtVbH1KNGlUzngmpzL/irTZlP8Au4=
X-Gm-Gg: AYBFou1mMGUwS+ebcYTr2sdSDBn+NJKGht3S/gzTHnyxhHWWWRrVBWptAHTJKg4elqX
	WdFkn8nljLzMcn32WeOnmBaIJjiuwOI/w+dpfP2rnzVZ1akPWaKlX5s9vx38K6veJxXNo5McA3V
	IrGDhoNh5Aak8c+vdUGGO7LKmD7LWWFXherkzsvO+95njNjDCcw7QBWKKgPKkLU/PbYoHtyRd4f
	H00jF5ccBXf6OzfVwoGG11aLZGCz9utAyRcFoBg/ApeuLBBNdAmrpyG9z9vqtLpPI1BCWHvgp3P
	MXTdpZYcTqy01TYvIqGF26KnJm9RjV3m4yOkvPJ40zLWOgMrAZWdISt9jmFnLsLRwL4AT9O1P9G
	2acvqu70vn++Ypi/dyTR7Ll86koVpv3FC6FtfszZEM+436Zdz7EQf5zIfsGC5eRzLFmba3ejNUy
	+A
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652193385a.73.1794835036738;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
X-Received: by 2002:a05:620a:8002:b0:945:c4b9:3de2 with SMTP id af79cd13be357-9494bcb0e9dmr1652185885a.73.1794835036121;
        Mon, 16 Nov 2026 05:17:16 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:15 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:40 +0530
Subject: [PATCH v3 01/11] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
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
Message-Id: <20261116-nord-drv-dt-v3-1-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
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
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=1366;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=htFubjaJPIibVGGK/b3gnFKqJhVT4tGAGnQz5T8JsPY=;
 b=qUoDsXThlUNNuRFU0T+sympFDVYGr9xmnyLWpJ06LdBycStF71umIvFt9uuV+rBK3WP3Y1cwM
 cbD7HwGrAdrDCzrbDAebYAipwZgM7ip3HF7Gf1tso2kcQQ8PgEacPWq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX04UmNW3FM1ds
 5A1k4DoT4NPOvViNtB5OVqtKE5Do9sZr1or6mheEGOWCIP28671GqjPxvOsUk1uvC1WOG5pagj4
 PevQscyI+Pfc093+usl1f37U6MuYQZw=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb025d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kfPMoZk3nD7OVdbVor8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -MyQSWe6_jsdbzXGkjRickohcVixyHf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX/x7vn7JCatNU
 PP4EFg8D8XQoLng/Nr5nP+bpuDCGpFUxum5gIGe6pF4gCnAx9t6lB9Aobqa7cm6LJoQ3PQ1OivW
 yqCLinvs1a0n56nrFScDUpgf6kW0z8KSH5S3hJBPRD3/TFs0BMWsRheX+6e6yhshHQXX9W+WuD1
 1Nz5dH6EfF9RP/t+dQxM2Vh9fzWpM4rDdb47JCEpbjEAhtNVbzQxBwjzqZbuMZOa4+UQ0AqAZuA
 ReTAcL/nzoPWNG9jv7Vfj/WdBVKkRmbVxHQGt5+oI+uTh9aSnWvdVonHUSJ6akFW5KaY6I9rtms
 3lfQo6DXGx4sxUchy0kOdz9OysXiGyIVg0Obedvc09nuPcxwynov05fn8s+rWI9PX51DYmgT8Wn
 2X0OwbY6x8GxtTJD+EOegCgGlb6kHBI/E8S1YsnHUux92PagsqxCtJMYHCLZebJu0HnasVf3E1V
 CwpLjTUvBJGhYHp9zTA==
X-Proofpoint-GUID: -MyQSWe6_jsdbzXGkjRickohcVixyHf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord relocates several PHY/QSERDES registers relative to existing
SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
to the compatible list. Nord also needs a dedicated ref clock besides
aux and cfg_ahb, so add it to the allOf condition that requires
three clocks (aux, cfg_ahb, ref).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..0ff07ddcb76f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -74,6 +75,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,nord-dp-phy
             - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:

-- 
2.34.1

