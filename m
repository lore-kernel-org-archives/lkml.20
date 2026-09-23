Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8925B348883;
	Wed, 23 Sep 2026 06:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146192; cv=none; b=c5VrAHQ3ghN6PfHSlbZJ6bv8h52rCTbwQpSy+wlTM4ThfTS5Tjg4+rEJo+HCovggQ79XrvQZLsxqpGpGv4tgSYWIwHgAnVy3FsfW1uSPqYOwcCr+z4WHFcVznZx2AImDD3TVTVkweNseiOQlKgBuT1zAQ70yDUuoA0Kvlth5XwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146192; c=relaxed/simple;
	bh=dhNaMCBDa0pSLp0kwi/wzHVvnqveqTUGVg5afWXsxmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCOpwRKyoTIrd+CQOoRHa5nZIGKTM+hiMBbPS8549VzDPQHLD91Kj4ppEMACGSS+2rigvqKgWxVdHqbQB7sOnR15vfcdX7rfSiIyvZniNNzTVgU/LkjlCTpDC+Qre5eUZK075aHuEElNNAsvkTlDBGOuYUh7D1Y9Ejzmei9BbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inlp7mVf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inlp7mVf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iQam2571418;
	Wed, 23 Sep 2026 06:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klnxrsU1R9o27q2zc+WTE7lPUkEu2UJBckW0/E2hZGg=; b=inlp7mVfjMftMzIq
	xmnJjHZUdGBo2GC+LI9A85hDu05ZA8BNy6bQqbmjbSJLbTREt/jVud4KpIJJ0yI1
	97lUHaGAUbNWiOYl/6xDX3yo8/BbhmY9NHzFp2eut/J9CEkLmsAjCzMyYPgIkrIV
	5Hnqn/1bBVBvdcpdHf7nVtSaJPmcEfQb2vJxVMw6UkNQ69tXoQl7kyZUuQNI70ur
	ofyUAKpFn7ijRDFEgUJpYZIibfXkW3WiEKpSPvTNg4rh9m0YfzVF2l86bn5hzd0z
	5dIaqsoDFDVHFAFHpkG83JZJHbfsEYhzWQfm/UfVLHFEmwtiog4R9bI+2ZOMLCj3
	C3wtpA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux86301d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:49:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N6nTXi299779;
	Wed, 23 Sep 2026 06:49:29 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68N6nMCb299652;
	Wed, 23 Sep 2026 06:49:28 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:18:30 +0530
Subject: [PATCH v7 10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-b4-qaif-shikra-audio-v7-10-d5b6f056568e@oss.qualcomm.com>
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: yPqk9tHPyzkx-Og2iv-WHfvXGAMWX7Al
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX+UkKHHAh3k2K
 CWWmYb2O6W5l2KlO/NWTiJQoQn0MnGNEoX85jW12Q4i93UDlD9Uo9XZ92e5YJgDwC0GDIPaZ1Nc
 LBejZ1HERkx6hcC8/3QClDDlEcHyhpA=
X-Proofpoint-ORIG-GUID: yPqk9tHPyzkx-Og2iv-WHfvXGAMWX7Al
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3767b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PFusfAj7JESbPCsvM_wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNyBTYWx0ZWRfX1cSdP1EzRV0C
 xhLwJfKWLd3RqNO1vTDv7mj8IpJymMrLrfAeIS98yiOGH06IYjHCVtfVHHPi71+2ENq+lDcJpZp
 qOoYUaGRTWI0TugXC4Ua9/+ngZV8ldolVl+X8G8AIRdLsTMi65Qj64ekCBTCYjcDye+ZSrmxeP2
 9WSCjNYcGIFdle3/E4eLcRgBwDqLDUbxSmUnLgrW3XwsuBHFl47Fkv259zJ7asHEEcrcB64Lg+j
 BBoNpSCZrwTKVYgPVMhDAMGn/R4JAzZRjDA9FwGwBfrYDHC6AJDWxMXtG2u1YMUwTqk2DBptgkQ
 2t3xwuO4rvHo0KmGiD+ak6Ba1opLVL3zPscm6BvCm50nmiRnsPqlHpHNqP8Cej9bvx6/5CdLHOA
 ZQz/muZuQHZIiQvNYftMbDxNjImyZIESKWFwOIlVhZViLGR9he1grNUouzX2vnk2zPOXFuKSgbn
 AD+sG5GY77/4OZiRYFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230027

Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06760c45c582..b03ee8208ab8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22319,6 +22319,15 @@ F:	sound/soc/codecs/wcd93*.*
 F:	sound/soc/codecs/wsa88*.*
 F:	sound/soc/qcom/
 
+QCOM AUDIO INTERFACE (QAIF) DRIVER
+M:	Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+M:	Srinivas Kandagatla <srini@kernel.org>
+L:	linux-sound@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
+F:	sound/soc/qcom/qaif*
+
 QCOM EMBEDDED USB DEBUGGER (EUD)
 M:	Souradeep Chowdhury <quic_schowdhu@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.34.1

