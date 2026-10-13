Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1E4BB5DE;
	Tue, 13 Oct 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888224; cv=none; b=REUAlPyfmfCYRdJCbmVw44Lmdd2Qmgm3ckQyvIJhwP4JFdURnqty6xNIYy0uXS/duq37A9vfV6o0YNlllD7U+4kKIqy/fkKx6arhugYAHZfNRQxsvy3km40365pPs0b2n21jPommWcjX7D6v1iNxL4+WlwCUxkcHnPy3PvGizjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888224; c=relaxed/simple;
	bh=EuVyf57fGMcVzKgAQWn1agsjo+XGjiWvgAxubL3wlWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIgIDf3n3+Z6SFuX8Bc5/F/B9UX9gHMoxghAkntwlmnxVAE8vWoTpFtWuEqLo8quqygSds/gV6fxrBbDw3MG3jQvnaAemW3PsAG9sqM59J7G6yMmpdDMBdOyaBtvN537x9SHb4hEmJO3lT7bPUuEFyyp6MB6lGbQiUjFmEM2FKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phzdRqsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phzdRqsb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRuB949361;
	Tue, 13 Oct 2026 10:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDNoe1SHhae2JQwQbhN5yxbOdDteCaB9eo5F5TjqbEo=; b=phzdRqsb/1a30fcV
	QxZYor08/Y7qjWiIF6Ldr7kEy740TmmQdYtgzyI759b51y8E2i2Exa/McGKcfa/D
	csONGBlVsnmco9ne0+N5YaoT6pCrpaBPVe991e+M1W5Z9e6MhEqEwueeEttdLG69
	hKjFPR9RLBVqjzJ1OiLSITj8h/WIo7vlw6CVkD81+IT/8ZXzwbK70tg30eWkW9uu
	qIeUOe+RmahUmlSuwrfutcrxZW21GqfIIoSg8pUuoJntQUmOre2Rt4seWsQPzPCy
	8Ujl0t3t1SqMKl4MJeddsNeiSMxMKVw6hEAwkyozfOqEOOSma3qJtYCzO75s300j
	NfTwqg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6294ka-34
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 10:43:31 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69D5ppqU651631;
	Tue, 13 Oct 2026 05:51:51 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 69D5plAa651483;
	Tue, 13 Oct 2026 05:51:51 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:21:33 +0530
Subject: [PATCH v9 10/10] MAINTAINERS: Add Qualcomm QAIF driver entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-qaif-shikra-audio-v9-10-f3022e28f2fd@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0b53 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PFusfAj7JESbPCsvM_wA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX275LTJ03tJ+l
 8C9lZjIAHqW+tigBYDNAT7rCvg4/LaYmDOrWj1QM5qXwLc7k8LKlGBHtinAc45Duy77+4ht54In
 79RhooIsBN1P1pxJNxfOwJ20uFEKdJc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX30Q5PnHZct5+
 lOINbnFwRbppOvltL1s4DJnKTtegricLDiVKF7Bm/HpXQ2tiOGd+dbUUcpZWqOtTAd5OWU0pT05
 2YHoqLxvYOO7vMd89jUTPbUhVsDfkLaet807Rf0WlkgQVjJPOjxO9GgaPEQtxMRxK10To/71ps3
 lH4xP2vTnCNdiwdy/AejbwsaDuMoz9lvpFdY/hHbJrLfrlyPzPEJuZSCAOcGROkSOeKVaK1ainv
 zKYO9B7ngWhNTvYMHOT7o39dSI7/47x4+9RiGeNgEgEu/z4RxFygrqIhupQEq9V9jEuhrLrs18r
 9veLJ12+1xmPYP3lnSozgxrLWK73wijFsTJyavm6jObC0liSKayxEZ25TCULhwMMjcZhVhy8vSV
 uqAzEtD+HcSvdogEkW3nJgoUTkBAv/hDPg3pI4grejM6j/aDeeoG2YvFEwwrcgsvglH95qU7mEN
 awkOopLsMOLPpkby+HQ==
X-Proofpoint-GUID: _glnj8Q4TRpfpXzU6MluSlQmHL0iyXmd
X-Proofpoint-ORIG-GUID: _glnj8Q4TRpfpXzU6MluSlQmHL0iyXmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

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

