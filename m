Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D093414A27;
	Thu,  3 Sep 2026 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420582; cv=none; b=spqaVjS0w6qXcQNWhiiPIQJ0YSslRzfY2lHY1sAO8HpSetynzh9K41HIIOLllCtNHPLzH1Ks8dF8qOkawZ2C/fDDH/0u7P7/FkhBUfXiYy4g2MYvFa6NMWk4CWa8LBvMSRnqvelgWprBqso0E/67cIK6yM76zuPFJ0LzF6dFN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420582; c=relaxed/simple;
	bh=PrFO/uHST59PXiT7fdlms6RjrUorAnA3UJPvA7hlMMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sk9RB12IOLTd9gdpQh05p3lhm+Zsawf8uYjhj/AKXrCCveCPjsQCjib4InQ4uQAxo8OKP1sRT/dCVN3X/2IoR/YYM3Jk0QZELH/V4uWoTIPdjzYBfrWnCsYZU5GV9PVIWCTKgoBNk0vZJAU0YiaIs87/nI8mgRDXsJTEARhD8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IO9NcswP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IO9NcswP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6837Lsq14124090;
	Thu, 3 Sep 2026 07:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9A8lQo6hXmO
	yc3TSB7eiVoiBfm3314FDVoporDFVY3c=; b=IO9NcswPvQJpb1ow+tx1Usm7pwo
	TRMbI3EkF2MNN3zx2prWgMvMRPsmhwzdPy33xkPU4M5Qq+rohSHsO+Bmrb70XiEv
	PLwsT16eEce7zLfu5s/lqt7ntoNN/bgGHjAjRhsBTuqjAPsp5t4cDqcJObU1uGSR
	Z89qKsGBWiRqoID5GLgT5r9puntmIx2qgnh8TeN+0Dfvp0hKfXNLWfZMQgsGDHzq
	k0qosPuZy4bTWO9AO5zWPx9wl1o9Ea82WnQiDZizMdFheqQsG7KHFVRkNePPyQMX
	xEvWnkZO6o3m0VD53j9ozi9MKq24CYOvSCiYUkwUMYzXdZjjzNCBl7yRlJg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekg122-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 07:29:21 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6837TIQw4174608;
	Thu, 3 Sep 2026 07:29:18 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 6837T4OX4174384;
	Thu, 03 Sep 2026 07:29:18 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4] MAINTAINERS: Add Qualcomm QAIF driver entry
Date: Thu,  3 Sep 2026 12:59:01 +0530
Message-Id: <20260903072902.3870009-11-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: _GJnEb8IOfO4AELZTVM81qeJ3Mdzhn1S
X-Proofpoint-GUID: _GJnEb8IOfO4AELZTVM81qeJ3Mdzhn1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfX9jM31T+kZh/F
 HWeCv8IHfbrwenaZRh0ornT1tIdffA/DkJUVIJc9P1kDHkqeAo4PYcAS5zVQPd5GFqRaMPjVowU
 KFsLORoBjNx5Axap2b2lVMJu/enaU/ULwahrzqqBdV62wfJ4CrYe+FGMGxqSPKFNC0N9l3L0bvP
 gMo4+pF8mTl3Yazmrt0Q6pFdT94ZslF9nmAOnVJbmp85+MfCStBOkjvBuMWkPTOp2qSQ34xevt5
 xypYNlpwCfoRE9+1VjwzeoQBH3A2s5CICtman7nkulJW3zW+nMrHQR/12fnEymn9l5UeDY689e2
 L94ONmMyOehd05+TjVak/tZLTexmyBoI3DNQMRD/HfJo1uLUfMEcFccuWYRI8gw/HptSWnO4po8
 HGyEat5QLE9YIGwplRmOsWrUuVjXA9G7lmG+EtaoKT1AWQ1/XNc1S1OFIFFVzyaLxGlEg40EPrW
 Ch+L+YE4xbXTEsfgmcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NSBTYWx0ZWRfXx5cQIJGheLWH
 IQCmIFPauZRJv9sUmPFrPNxv2MaJpgGBBK4TR91c9hzxYBLyQgw/63wNhOqGZMNXefgGSHoyerx
 OpNxqiXhNIkuVgGosYnictqmUE585hA=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9921d1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=PFusfAj7JESbPCsvM_wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030065


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

