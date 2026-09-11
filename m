Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D004D420475
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141044; cv=none; b=nDQnlug9pPYmwbh3KljM9JUz+N3F9YsAiR8rP/okrXdpBdY3aLFnPTqsEAR6HsREkRcZzmagZ2vNhrNXuQmFCnPPb6SpeLljdNlEUzfWfD+TAkjPN5SjdfT4+nBPwStZsAbiwWehidOab98BXCbF9eZMMieUBEiPOBslGpnSFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141044; c=relaxed/simple;
	bh=0wud/Id7znQPDRq8SUlHw0MjHwM7ELZ7Tx5EFiPOzTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVY7Wo8iXI8LWWjKkK/lzAKqELqW1gNVm0jEV4/zag+nPR30D4qgky1a/MOfeGyxKI/dCTk6QdrxKMp1q/jtEclHptx3m8i+4gOb+ayKji6e5QbpTDYJr+7CFPyyzF4UYBSiYbbdVHxtn1mbRO0vLMUdOUv0dVQWlE7HQgjz4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZibVUb4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEPs4myJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZibVUb4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEPs4myJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm1F2269336
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=; b=ZibVUb4hLzrmkptS
	yEVl8/W0rQMrssXkNynIdHAE4bkAZEQVm839IwZoYIOD07J01SKW8l44GERW7vIt
	ojVC5+6m9Qd9sA5qUzzaHjMEGtDpME8c8iX43+fMwqhJzMaPCXUpXbYoxduAU6ON
	OD16TN1B4t0hXdAwXNO/XtTP3ZdhLi6h3uP1DkPHKW/YrrApOo8gaHniBt2AMiRm
	5yN/X5qWf6zSn79/hk+9TcNGRghr5WjClVzZDm7BWHvVKgnlGjS6LYT1zt+ygnL0
	+K7POVwh4IiEJuNAMHW465IKJbuOFx6WVlzE2rquvJyn+c+iOcqZzb2tjNV8zAz2
	IvO1uw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52hs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49d4cb3ca23so1415244b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141041; x=1789745841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=;
        b=AEPs4myJWIJThbCbJKevxahsqaWCHd65q6L2znVxRRwCNVbu4gKYNdi2m60zYfiigH
         gTA8d2QGAWZR20FixsU/Kr9Z3DTnGlvU593pka/o8fXHoOHRnOfNXVIHrrEEijiXZLc+
         YGwZLAlMycS5pxpQLIRz4vkUg5b5lf6ceSTuQrAM4U30akcM+03vRGule0Kg8ViaXeOY
         gPZD1hu9AIrlDTYC9gw/eyPhfYcLksg58evFdgyd8vvCVTLVu7Z1OHnDP3vnV57BGCbN
         tZIGWzvd8Cbo+A4azylLGclJp8vWEnRz3ftQUr53bhuYGTHcF88pPVje3nDCyekNo4B/
         x7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141041; x=1789745841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+NzFK+jhrEXQEV8A8yfqvHMoGUTclgm+A97KLRt7cM=;
        b=kn6uzVwMq/fUr/aflhetuHIzHhFqkxiPptcXdUByvnRRR1+VLay7qEZTxmMNJxMh9o
         ItYF7rYf7bs6lQTEIgJj7koGkHA/KD/mYgRS+xjvk+W1amsvtGGhXAc78SWNJkRpO5OK
         7vQkTHTvZaH5PvroPBY3QMik/BuZ1ZXW7gJCQ24E2awnMztqGNksk87G9o2pu8bfXHwH
         hoCVwRHpFVPBBfynyVz+eaakkvGH+HlXNSOYImJoqRkskhHRI9Gu1LEHnZIuhBMg3tHx
         //EkxZBxvXYOc8yTfQIT22PISirrgpA/6fo2UofeCpvcZqfXatXqoDSfv9hlGoY6wdoP
         REOg==
X-Forwarded-Encrypted: i=1; AKwUvBzPCgkJBjP6DcFO1GjD8rDEmrd065//1XM77JlOtIR00DnVbGxvpE34crAV6ay6YTTFEPUI4N2xKrFtXx0=@vger.kernel.org
X-Gm-Message-State: AFuF++ltxEpnnrBPGUmUEAhqJmJb6JsjmS/IM01IaYYE0GpFqJS7ER+k
	kdMUfm4vhu+y9xdyjtnAsryvG7LzCRq9Xtx/JOKjOXEEf37tNkVYnkQwp04hk2VBdAeQ3UZAMsv
	6audrqbgSYXxRd7fmkG2po+V85N+GmjIH+KAiVSdDHcUMj4seiTEteiZ2J9RctFVRlsw=
X-Gm-Gg: AYBFou3x4Khq8E38d7WGMx80U4N3FNpJmMBv+jPJawYJwPZiXBIjm5squg/g0r8oh9o
	QzuycCApWJx5Hf6O0bdqOiL2RRjEwQqRDejJ5z5JtgPGmZ7wPt4e5E2K8FhA0mLgHbijDeYyyP2
	IoAPIlT3caIRW/3gCfjtXup7UuLgTSHqmPrFuuR82v+g2khM0OAjWx6gT9pwKIsY+iFPyhvBz9L
	eHFQt2IFhpoe2KzvadCBG8LuGlNI4io9GDPo5fY0nVGzbqFBGFscKt8gqijSXGV4n/IdCL8HD0n
	ePTEqvHJ+O9GiiM5fag3Vcw095zIqk5VPlR0T2cCYHGQ2JNv2lMom2cewQCf9oci8l0QykoOgqI
	hqGXDOkpMikJGAbAYq0bQ3NyKHoI=
X-Received: by 2002:a05:6820:60b:b0:6b7:318d:85d with SMTP id 006d021491bc7-6c0bcdaf0a0mr5142126eaf.25.1789141041140;
        Fri, 11 Sep 2026 08:37:21 -0700 (PDT)
X-Received: by 2002:a05:6820:60b:b0:6b7:318d:85d with SMTP id 006d021491bc7-6c0bcdaf0a0mr5142085eaf.25.1789141040730;
        Fri, 11 Sep 2026 08:37:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:33 +0530
Subject: [PATCH 02/17] dt-bindings: display/msm: dp-controller: Document
 Nord DP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-2-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=867;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=gx2h1808ankOTjgTieRYw6/x4F3FIMSxugTAd8F756U=;
 b=dAb+YZjbbu9LpS4+5dUjqKfYUwH+FxUIFOY0Mq9r8rTaAJC2hRMCTEmggfaxBaVErFbObwkrx
 XzNXvVcThRZATbMI6pwrFEiMRG1Dd3bqlRSfRGDX82mo/JcoxGZ7I1a
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: 3Poj80AuJ4OcKVgU8PD-qMH6WqMnFi31
X-Proofpoint-ORIG-GUID: 3Poj80AuJ4OcKVgU8PD-qMH6WqMnFi31
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX3MHSkYCYoYmG
 QLL3QRQ3WzgxhyBvvrcDUlylVd11/jkU8Ro7Vpe5+jAESNzBpsw8nrdrBEvnQlUeom1t57RzCCA
 B1Zsfsi/ir2WWSOUnxIN4kg5/wSgfSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX39JmZ0ubSCox
 lIQVNDi8hM0OYMiq4QA0/x64kN4m1ntA0gAkVUkRZZIfTTyr6BPhQTVyg0ERMhueFdJBVdMZ43O
 ev46IWUBXlahU06NSIL/T8nLEgXzYCL3foENJ0wfeG4/k5dluzPE+5kto0/nEHlYaONXjrFU4Xn
 OK19Nv3ruvU8e8jK5VVHxTzzpDUaoPDyd6mhH1L0GR17apROf4fxXRBtWUAm6/4QtU3BxuUmDPI
 9F0xftpMOR2VoioD/Ovbj8m4mWp1RW556O0N2GxLW1oFZCxz88tEVyjwfrwdfuaHPiPgx5l1XEF
 gEHEISNVmZ43LtcmDsZOwgnrR/38vnnVkclEFSUcbpKV3npvEBN0JcOLhuBIahIFiSTq3ll5hZC
 WY29PFk9Hkou7XzHTKB+F4G1MT91oa6ZkR0ZSpVoxZmhhbvqkT0mYFzMnxVxlZtsE7dbk8uM/1u
 yA6AYQPiiOW1SuaT9Gg==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa42032 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the compatible for the DisplayPort controller found on the
Qualcomm Nord SoC.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..8d980acb1a16 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,nord-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp

-- 
2.34.1

