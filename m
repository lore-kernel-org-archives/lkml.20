Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DF3EC804;
	Wed, 23 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153211; cv=none; b=mmawKB29HKR4Ge2gUKsDZL38XCwu5sahtWHzr3sPjb19muBt2SgDD6uIbIbcbpqQjESg+XrCwonTwVEPq989z4SVEkyPffjyrpZPZkPZUxUmKAwCbDTlPvjWhUR7PCO5XbC6EkOsAGMPTCwv3ANEtEMk/so9y+Xmq04YW04pX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153211; c=relaxed/simple;
	bh=oau7sDMWTdrjmIWBxhYcDHRSO1npzK7ouTufF7/5szg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y6TYuYtulH/Y64+mOu8r0rwgPBqKf65mpuuO2IJ4WPtv0fzbIk/N+8qXCNoEKXNF5eJWziJd9jtnBAwqTN5Vv4vRLz5ERt8eQoFKlm82CBVAJ83a6BdHHeOueybyKJAw7GChXnTFr0fkaNLQcEMAPlH0t+Tlp5KE7Il+QJvP/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IjlXUxHu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IjlXUxHu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JVAo2197313;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U055zw1tw2H
	led1NRvT9gyaA/wtaN41kRhX5hE9+frM=; b=IjlXUxHudMogM3sjbo1r4OgRsKg
	rXngKuwlvAjA95prkxDQV5EmKg8/CbmbHThat6NsGDLC5a/rkqgLZgo3C4PZF4BB
	dqzBhncQidDsYo6qU5nBICByJxmzENMPDEwpqkyQ9H/aCuNtNRfP5ujhFnvzqfEQ
	Ct/weDe6jnHkCep2amSbtR5MBswXYAQ1B7Ejc1FoTGd3L6tJ9D3+c2PAzsPC2vVU
	Cs+JWAXPhkwmaSpJ6ll8VU63Dky3EtHq9lPgZgqHF5RuAFR8OaMTU1MPJWTzbD4G
	vX7o4b/SMFWVMMo897OZDq76zNDeYaBNfYcFbyO+7PbFDaNtG+0DkYmGNzQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqgm80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:40 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8kaFW1728443;
	Wed, 23 Sep 2026 08:46:37 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kbND1728467
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:37 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 43CCC6DB; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 8/8] arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver
Date: Wed, 23 Sep 2026 14:16:27 +0530
Message-Id: <20260923084627.748920-9-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 1uWdpBmLcYHiThzn0Gy0leQ2MnmeVFcP
X-Proofpoint-ORIG-GUID: 1uWdpBmLcYHiThzn0Gy0leQ2MnmeVFcP
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=6dl9xK7RzcSlF3uxdvAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXxiRD0jjqT0xq
 jKQDIa/OUTRx5uwwtgw44AlKVWJyI2Do2O6PE2yQU7FIKW+4ES7Cv88Foc0atub9EnMOUYlq3iH
 sQlxDt7Ws92kdljF4770+UvQUSckg2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX0uZJFwSQHmnz
 zwUxObysNRzthz4Ib4XBrbXtrypXPnip7aXIKqEwZll6NsG1YIC8pTJbvEdD+AyzIuMF+vMXt8o
 12KN3Rur1G+/pLQb4S16nWM8fEJnrr9cA4lyOu4di3IU9zEppqn+7RDZdQPrZUs/I1/CcnJh2c3
 VJq+SID1ntg4+B0QJ1AewgFgfiGYVx+kaOZQzq9LzOHvd01ZkPrAUhAlY2SKp77ZZIGUvgLoQDr
 KNJcXzmJ3dDnMzipzhjzZEKkGxDdc5Od85CjS762HvdKGflH5/Gl+94VYE+gUJCIVZj9VdZ3iuA
 l+6RO1jW0/mODvULVJ1FzLNRHcJuhuygNDMfZVlLrBQnTZGlMQt/7sVh5NvozxR1vMHPyJlVa9k
 T3u7vH+dS39GYXHlCk/bnIrxS8vQRUDCZBGFrnKNsrjqp8plHeng/vvEhjzGFE1tKABVGN2mN1b
 tDf2ByMFs/hycL8vH9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Build the LPASS LPI pinctrl driver as module, as required by the Hawi
and Maili platforms to control all the LPI GPIOs.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5217de386edc..5e76b86d25cc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -702,6 +702,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_HAWI_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
-- 
2.34.1

