Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA31A6816
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121889; cv=none; b=hLYvD+/nqJ6Dd98uDR2t5R3kA0lvCq/fEzoQ5hDyhcZuw2oaIce/ayQDB5MkjvMJFoP74mnTLCaTNetfuNFscSlL1Ta8c+nkckOcJBxiXYaCxQJEHO1bEVZwrNB8mZXBTsWK9G2emfneFmlp547FuN0B+aXfOkyzd/CE7HeD7Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121889; c=relaxed/simple;
	bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKRswZ/AUd8anz1vWkwl7dH1EE+Ckyz++sgW4NGjCSqBJffKvgnDIjYKbfLmyEWQkTrYV78a7CTjFjwkJHj9aTrH6DOlbpwgD15DbREFxR/2Pkf1QAhypDL0ixJMleBhpXS733CAqOQVYYhsxh4/BSZpq+WJ5qoS0E83CTbDiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhMkegOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADFfYSPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhMkegOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADFfYSPD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Cno368055
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=; b=UhMkegOzOI5bhW5R
	1yYQdYMcv8rUEtfh+Am80pt/4D5PqifybEkyffSzZc3zfx+QZRtIFASzYa4m+0jn
	gBFiIpIlD/GBs5i08+NR4a3zv16iRywD7ondKFMkL5M15F0tBvDSiz8cD/Icv2Mc
	yWAST4vsetuIjEetnk1Bhm5c9fhM1KEJ/OkxfgU/Cm/L0kIUdNSvpE35gqAz88dK
	POxC2OXtPyaPVGgjnZJ4IYkmuGDM5c22aUFNuAj6mA65Yt+q8WyM5d1LIeZkM9mi
	z+EnXcZ08bVGFn23835lT20xKR00/GO8Dbqtdo+wfDqkwIHRBHCp35+H5Xm45U/Y
	9KBhWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntbhs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:04:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-334f782d1abso924130eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790121883; x=1790726683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=ADFfYSPDfHmJYgE9KZ0Vz13qDBMSWIuvBBRBWA4DXdYQ23VR9VkX8MsP9kLIqOV1My
         OyWG6bH5xh96gfI2TYTqaNZP8MkNjSm11VkNG0or9+57CguiTqu/wnNFKWlyTkQOisLU
         zrW9DczGACltSy6mLRcqsz2i/Ng0ptfGSIktcGYI4ySVrRDyG/CikqYImqs1D+UhL51+
         JyQNbIbJkU/hhSPChKlk7An2FqNvMCrdXyUAU7DwjutDH97ZMC0Ez7FNDH6FCtxfL2Nv
         EvPBds2T4WmJFYBpnlISnxz54UPJ5jpAVz80S3malkgMW2jbkRE5h+Wft657oH0/Dj/R
         lzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121883; x=1790726683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAYr3b3w44P7O8c36VI5MejWSyRbtezegraxb/F7orc=;
        b=g5dw14PLL4tQTr3pdpXSvgO9EH+HTQZYPIjurkgJrcXnAR6dWHjl9lg/seb3zpyG+4
         N2HeZtS4B0/l9705ACXP6IkWmaPWzYU0kit94EWMJYGMsoqZYAf4OZywqOldzKy+MxDf
         f7/vxktkx3YpmRgEvzmEnrNt9qoA41ELfUbXpwl7xpx5T2QTpfoercl7sfcUgdyDxMQ1
         Yc/ob3Yf70xy3LM6xUeDdiMYVmKOzSPgFrsOUrSz7DhGFOFVURMy7Ttxg1F1uVzcQvln
         U25CzYANmpjm1LvKXS4wE/tymbFv/pcanDntx4pPT9CMVN+YKmlEjsuPMTZgA1M0JjsS
         fn0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8Y660RSoaZNmyW3UZt43RnX4NT6TRLQliAYIl0sRoHxIQl4hIclyHoMeAP0RFOdfLLjw2RE+BugytgD4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ/NgnpI0gqoi0dVErWSbVv53aY2dI40DIIDZuJzcuYG1jSuQ7
	gyeGJyXtyeTTADs1AK+tgB793TlpmzFLF6McFE11jxSI15PIZhtnH7ZgmAlf9IOAj9cKwocN4w7
	Li0OggdH6d2LudK2URqOfhj7uzcPTjWSsrdUsket/c+ReMWOTMKOM4ZdqeLYDqe8mFhQ=
X-Gm-Gg: AYBFou0JHccY+bvi5e2l49b+T2fz1wEvE61vEi727a2hq4PF/s6cwV7bmW7wd4/QGPy
	mCKNtRSLY+HQRGelzeyPuJGL+zIhNlpyrjPZxUYb2pNbvnPQSgNNMG2aSubIrDH6yt45zi3FLQZ
	p7m2CnrGMt4VfZSFhXzQCpLqmz4kj8ib7mw+6F/JW1nkvQgrD/KUucZaTur3wYAMXO5tDWrila4
	lbgiRwp0if13BKiMEnqFdxViMiToCOdvMpIDqTkaDmpiHDTtVOSdCT1aWc8h4vmAdWpNMbOd3i8
	8Z05Vfh1iPVlMMgOVyr4VQMRKJWrOkHXavTtQGc8/fL6L0Cr9uFmR4NUBnLv84U9jSq7NHYoYQs
	zOfCctRmxRLxPBN45/Gg/PjSBmGaW
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796331eec.40.1790121883229;
        Tue, 22 Sep 2026 17:04:43 -0700 (PDT)
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id 5a478bee46e88-33e8e88ea29mr796303eec.40.1790121882596;
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fd955sm1688347eec.1.2026.09.22.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:04:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 05:34:17 +0530
Subject: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
In-Reply-To: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790121872; l=945;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=hZ1gaZaGTIxUscu8Ntbw8Y8njqN5nK3w6Yrkl7huu4Y=;
 b=FX2Kn+jl+X5pwVuFZCTvtskk5LbsNnyDitlqPOfmvcKw071Q8Ya70PFZqvP7PD453SxPhliuR
 1lDB+jVAN+mBWEmdH6JsQF3+wHs1/nyugj7yYV/oThE2eaL69ep/Gh0
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: 28oR0vKRPtLPsMbfSERLM4oa1Fjm-tBj
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab3179b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=w8Vq9JXYIO6u7lRZDJsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX89IStk5Qlph4
 0825blZu4KtYxW+abkO8Ao5FhJLrc4VjX8hDkH6EYI68pbOq1XrIACiyC+16jIHTHhsKI6V2GU+
 CD/f4apt2RyAvUcM/8lyoNqoXBoL0nX3tz9/3cvKJP5LaWWeqmLzIjFToYGjxljp7goagzrCGlN
 NhSV9xQz89mbB6dwv8pjoEuQwzcT+SSzNzw8+4SRSy5O1HwAY+Hbz9N9zhFe15gMuV4pXVrecuv
 YGM5iP6K9lB4EcNyUZ+sZyRUl4cviX2+WCqQ5UL38aVH1U5IwKBnhMJtbUcdfelBnIgVYdd496n
 qH9O7giba6zrWqfB1/Yw8o5y5UvD/3IziHnOwttAiJZhYJm6kJNU8dgxZXPJLEqtrsyu50uWe18
 o+l5fbYl8KIOvKh7XgP5mMugLV4k+yKIh8/J/bTW02mT56q3EzPFi3Ub2XBm/Aj7JQU23e24+M2
 bLwUHNaegw9pm7A0LGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwMCBTYWx0ZWRfX6gvpcYdBsMHD
 GfaOgYSzsTumqDC0RtluLuySVxYY2qjtIoAGBtjjCp1/JJYdq74Xz4e6b0cdAu2ut7xGPN6yRNQ
 4q4mqjXZPvmbusJ7mutO/p/+IQwSjYQ=
X-Proofpoint-GUID: 28oR0vKRPtLPsMbfSERLM4oa1Fjm-tBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230000

Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
SGMII PHY binding.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e1e23b832cdaea3c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,qcs8300-dwmac-sgmii-phy
           - const: qcom,sa8775p-dwmac-sgmii-phy
       - const: qcom,sa8775p-dwmac-sgmii-phy
+      - const: qcom,nord-dwmac-sgmii-phy
 
   reg:
     items:

-- 
2.34.1

