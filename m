Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D19B46AA85;
	Fri, 11 Sep 2026 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118385; cv=none; b=B64Tn3E9rcT98Y4HICT1+UO8wI1ebTS0gpIxI/qhlWn4oJ7+dCsTkN2Lq+Q8u9Vw631OlOjtBn/v6wNxOWJ3gApgJdAhtf46M0OQLRZ3PxQjUROLhi3UIDTkBK7TGkXlMN6aZUVRgApfrR9mhHOUAttojsKyk2LcdflIHZFEWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118385; c=relaxed/simple;
	bh=/VLPwU7IBziP7tJTYFhfwJcKF4KpF5h6IYddLt9oIQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKz0abyaWQt6dlgJeE/fXDaDPcZ83Bn/6wUiuXEJ4YFiXO/sxtWqRlb6US8WyQIqbuJQT/iBv2ZMLOk4yirGCHOz+Xt2UFi1PHzJ1l24O4l2pzzofI5ivCs5jeLov3UPfAg1PEgoFUEKFUhtX/OjCc5iRfre180qSiJeVkdDwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+0RgFtC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+0RgFtC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kl1O4046179;
	Fri, 11 Sep 2026 09:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zrOdq1zF5td3T+JYJ2hNSlQsoDEC0oTmGx6Ybl0UTE=; b=B+0RgFtCvgnvvK/j
	6dyRPkz5vSGGMOkZZTEfnrFsfPcdEDotNJtNm3Y2cdkZflpUcMzC/QntGiILSorv
	EGqdUlnQQOnTrxHxP+r0SizoaHYySg4hYRWF8N26gR4t76gsuaPkQFICl2DHsb67
	/7DEHw1KbjF8ciYHxlLXQXKrFaeI4IAw21YYbXvw1DbyaVkV4LCvMIE9rnYLy3tB
	hlR6wRRz+Gu9OQQryI4Tzk6nVy0Luo/RPcBmaE7palDcS6YH9bWB7hOs6yjCTRUw
	+wJs6nbiF9erkcLE3imkhiQf9wPJDbFcPE3GKpHnvG3Sx4Va9mPO7LyN3PMKT3Rw
	xc0Rmw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q12rax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:19:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9JOfM2870876;
	Fri, 11 Sep 2026 09:19:26 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 68B9JL2g2870824;
	Fri, 11 Sep 2026 09:19:26 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 14:47:34 +0530
Subject: [PATCH v6 10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-qaif-shikra-audio-v6-10-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3c7a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PFusfAj7JESbPCsvM_wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX3YsII0cJd51H
 KRsdoP+UWGFBfyAxuE3VAvjC9uGPpY3SyDFLCOCej5BLGYd5m/UT6yTbDizLXsqsUE9znGiU+Ud
 V78SrLk+zhPpokQfuIBKzRoNLJGmaDfRni9TQI3ZFEd1JUCLSk3cppDp85M887Ja34WiTmjjqpk
 YCRLJUf01dR5pKDcWBnlLF+0s7mZs/UEiZH+XkkSGad84X30xv8DP4LVXwCuoJNjsvRx8Yec3q5
 qgU6SBiJNt9/0ptH6wB885FUJeTBppCEIjyjuMQTjWXtOlW7PY2sn/EiLm//yPx3XaDgRdYwFuP
 JuEP30U3QmaxAQwh1i7V/pks+1kygs/yo+b16Sp5KquesIrNWPRRJyi661RC2j1kgNNW7XyvKFF
 aNoMGEMkCdbVnBJxzsi7RTbmgH2iQuhdL/uG+hg6eWA/aICGpNU0o6YGxCx20i176bTVbp2Cp77
 F/8XyvZ9oGslEHsicWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfXy6EGqlPX9m4L
 MbbKPBhMO1YwqKgKu1LmsDBgsoOgCCT6N4zcIs2cYA/pu48Wr0EFfN/3NgJEojEso+Gm/b/mIrl
 jloo2m6HmLJpY26ttNt+7y8mMJD4HAQ=
X-Proofpoint-GUID: AGn7ER8ph8nTWF2bico8kgF_vV_xmYoA
X-Proofpoint-ORIG-GUID: AGn7ER8ph8nTWF2bico8kgF_vV_xmYoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129

Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..4296f812ad36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22133,6 +22133,15 @@ F:	sound/soc/codecs/wcd93*.*
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

