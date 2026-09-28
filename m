Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C93C414F;
	Mon, 28 Sep 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600000; cv=none; b=AhdgHO8ddfhiJnRmq20A1eJavfr28i3DXjML0OsTlgTW2HW9E/fn6g8NMRGXWtYfEjZBePO5mdxq6wbdTWVvBppFKbSLHW2JEb4sEynfMsP1iPMqcmz7uIY9NTGrcMyR6R7jD0KMt2+ruEhLASj2TpmIW27VLvpDsMPdI5zxQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600000; c=relaxed/simple;
	bh=EuVyf57fGMcVzKgAQWn1agsjo+XGjiWvgAxubL3wlWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SJOZhp2cROjwFvxHRI9a3QZOAID1XSYmIQZ80PrSpbSAkrlv98VDhYtl/tIH+pnx7+dvCRwXRAeRNUNC4qjsD7d2K70RfL3wciJWiiYVNf6SIpU7MTjt8ATpjK6EhfVre9nZpjM6Y+BJl7MBHAt1oa2g8bAnGPGp0cv8UGQ5nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0NP80Zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0NP80Zh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAcJI558926;
	Mon, 28 Sep 2026 12:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDNoe1SHhae2JQwQbhN5yxbOdDteCaB9eo5F5TjqbEo=; b=b0NP80ZhfZ8yFVjf
	6v0N5A7CzVdLMlNrHzqsdKCKEFtb1Sme8bC0af8+tIRnae3WrvyR3jquk1YrLwrF
	IsVLSwA8xy8bo580cc9kxyvNESMXcP8JMJiZODYzbfaH6AB0WGum19+Hw1QJTJWJ
	X1nouTUDXyOkQIpAUQqlxw4Zc4dzYmch+xlikE+9hRmmw4MB59QUiJZx5GBFMCwq
	XC678AJe9+/thuP3Ck7D/V+JsPu1cdP8Bc4Nuy2neE0txoJkLFY8OMztqPS+tUxR
	jvJvJCIabeZgGyvq5MXpNbcTHyoUznf8NYq7KJXw+i7ocVW6IkI7cr46xZ92iQDX
	ABNZ4Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq263m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:53:05 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68SCpWJG2078248;
	Mon, 28 Sep 2026 12:53:02 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 68SCqvL72080411;
	Mon, 28 Sep 2026 12:53:02 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:23:00 +0530
Subject: [PATCH v8 10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-qaif-shikra-audio-v8-10-ac618057fe85@oss.qualcomm.com>
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
In-Reply-To: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 49doDm7TIZgGo7l7Br5j7RVRAlveVUsv
X-Proofpoint-GUID: 49doDm7TIZgGo7l7Br5j7RVRAlveVUsv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX52DYkXpMVp6I
 +RvbOF3I73QOgM8jMlR2KgW5BO8HtABfkCPVQlieGLTabf/xkF5XBlgZhF90C9ETsfd6nUsATnj
 /yCAJnTKcdQZhpFNiBO5/qN5uMdWyro=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba6331 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PFusfAj7JESbPCsvM_wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfX+IpOp9zY9TUZ
 kKgIwJNcEkXWFi7upoFy8LFZb+6vY1gtrl2ueI4LbyOV32CMOTRHVzOrEwILUfpyWxSYtWNxra5
 7bZteIx6eeHL8g9w32nOjhE6qVL6I3zkbTyYnf5BFR1/I+T9TrtL7y/nNDxmwHt04sknTGC/lub
 my8PoKfrR0daYnPuKXBjwhG2so7Gt+zAP6mS0nFJolCcvJZUHvY962Cnt/Moyu1/7qnnSPMoAY0
 Rd9D9O3EqSBs5u/GnFFV9tUSs/b3V1nEA24IX9orDdIIIsZgrZ0m769ljk4plCMXaa17Obi/W/9
 4Uywa2RbIub4QQruFVsaV3LWNFO8ytayiUPmRA/GaluQO3gY+Pi+ad4QCu310Sbeaa0V4u4/Aqw
 bEL+/rkdu65SxorcZ+5/Qm9tv5s1n6DxZiCDVK8Q26/rKHoujf8/ZPc/97n3kkL2cuWqU2qdrWR
 CfONxo0FsGW3JqiVAjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280051

Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70a11f2ff61d..9ccc1d995ad0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22424,6 +22424,15 @@ F:	sound/soc/codecs/wcd93*.*
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

