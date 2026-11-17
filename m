Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912198;
	b=mcZjoRoldZrOQVF9Otq1OFNm7knXWivXr49APUnFNuu7kqDKqYfAltoIv5eZYVs5J1e4
	 8Le0B31qWPBxHZSU4HDJBJnkH9uvKoHWb/4xWiFfd1+Bjk9HWZmq0nvrofyxdmnfg221Q
	 E1GZg6aZqlRfKtZ6QXaD+HQFQFpz1ad5xCDBHTuNv8Kq5g19nq5tcRPplP2VBKoVfc0fd
	 FvowrkfxIqkdcLJpUXR8wdKj+JFwdCW2kaU12sCMfATBV4cJUUUjGSa9tm79EAd+KcLBo
	 2Xq8g/VfR/q9jX/WintLgQqRfvuFwv8y9m35rvExGQbfDVd/Kc65PsUCPOm4JdO0u+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WWvwVYKenG+kHA4rdPTTYPgchSKfSupK1RMORGGWU9c=;
	b=v3kHeo+g9ukgQaNQ4sYLjtzdth1HH1zjSXb9GoCehN0i6DG+tcOx96seSOrNsWs0G1Or
	 NMgDFmcjkF5wo7h/qJ3W0TPWKZ0toN+nlnI7KuIn2DEUrzuSbMrZ1hxtkIwTkRk6Tzn+y
	 58ziUeUkjHDTMzMq5qQ23WRX4mxXN/3rqsRevP5D1tkwu9y8u0afwbORC9dLEOOLbFEm+
	 NWGnZmVQBkw0WveCp5t8Sl4c/4Ji/7ZNwHjpz7a9eq2NxPG+ml3i3OXremyC+Lq49PI5Q
	 vD/cIF59/yOGdsgQ62Nsh0+jCNe4vZE4jt2RqG9RB7ID5NwkdAg3hsEKPSggIqDySAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oc++EVWQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905C606A331;
	Tue, 17 Nov 2026 10:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C905C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oc++EVWQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NHgs721428;
	Tue, 17 Nov 2026 10:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WWvwVYKenG+kHA4rdPTTYPgchSKfSupK1RM
	ORGGWU9c=; b=oc++EVWQVxlzTle3HzaQ8KoLU36TuiF9RtKup72oBydKe21FZAn
	WyeANJ1adMI30+57sS0+QCQoo8e+qWrXE458dZi8AVCZHBMQogo8OTrSFF0XnoLw
	RlX5zFU8UkcjYs1KyIMOCQOiXlea23ISgeuZrKtDH+xTQB6Wg1pO/+RkebkJz/pd
	Ty/seKQZzzqudhfy5jQbkmt63mEj6VS0FHuuPgNA/OocuxkEY0uoumIPguVBB5Rh
	dS0PVGe1cGkO+qzAUlzNA3D9Ebrsk4hom7qGJ6wXFR19zdGSgYSBS85jz8q7GeLk
	pq8qcesJFKdBZ7QDHkMpw8+9jZWwWQIxN5A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc8ja0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:08 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHAh6lk384735;
	Tue, 17 Nov 2026 10:43:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AHAh5ng384724
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 10:43:05 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id B1F5667A; Tue, 17 Nov 2026 16:13:04 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/3] ASoC: qcom: Add talos-lyra-evk audio support
Date: Tue, 17 Nov 2026 16:13:00 +0530
Message-Id: <20261117104303.435294-1-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX44eHrhX820tC
 8oAbgSf26qvBCaEJGC0NrAHQa9mgLlF0siIY0MEvdb65HxvYyNVUaWEp98nyUjpT66yn8OHYjEN
 Q2ocC7Ry6GPfqdY0WpAlx4y2DVUPuTo=
X-Proofpoint-ORIG-GUID: 3XM0KHsAr8vw4ubbSjHkY4DPugEl8Fqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX2RH+kc7uvYqk
 VN70X4N/Uvw9x0VzXe+eKoYuxko1nhWLGK5X7PQRksxWeisGm4F4/QwjGBKQ41JYk0nNRcLzksz
 keWxqbS5bsxxyPR6u5+JbQxUIXMZaAz0smwI0DNSn2cWbxYBvOnHnFrALeYi9O4yveGBhwbQSYk
 m3EM5gTUHHDaGd+XDbZPGvyHjaTOLoh1cbrBIW0QyIMGApzkh3KuKDr7yn9eK+1e4rkG9MT/rsm
 U8kNfkdlQvotmGiJMwMFYItaPUUGcwFz5oawYpLkCP4ZqFu8Coz83MfORwuYVJSFbbaJ6VAOJKN
 sCC4kuIXvAgj4JPBz3HLnsd/eIpEBOo3MxzajVol7LkWKzwzXrBuWPudG+5nNj0/JQrtlsVjgF/
 T3djVQ/fdxqY6UKK8Va0s85a4n2rGhFqEgN5XzcnI/u9zq1NFStjuQoRxsg8HX8z4DQayWXBWi0
 fLWBL2/eDY18JjdpUtg==
X-Proofpoint-GUID: 3XM0KHsAr8vw4ubbSjHkY4DPugEl8Fqr
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc2fbc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Fnp2pXIAsWV7alZBeiUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170042

This series adds audio support for the talos-lyra-evk platform, which
uses the MAX98091 codec over the Secondary MI2S interface for both
playback and capture.

The talos-lyra-evk is based on the QCS615 SoC and uses the LPASS audio
subsystem with APM-based routing. This series adds the necessary DT
nodes for the LPASS LPI pinctrl, I2S pin states, MAX98091 codec, and
sound card, along with the machine driver and DT binding updates.

Changes included in this series:
- Patch 1/3: Enable audio support in the talos-lyra-evk DTS, adding
  the sound card node with Secondary MI2S playback and capture DAI
  links, the max98091 codec node, lpass_tlmm pinctrl node, and LPI
  I2S pin states
- Patch 2/3: Add the talos-lyra-sndcard compatible to the sc8280xp
  machine driver with DAPM routes, widgets, kcontrols, and codec
  configuration for the MAX98091
- Patch 3/3: Add the qcom,talos-lyra-sndcard compatible string to the
  qcom,sm8250 DT binding

Dependencies:
- https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-2-658fd5a7ec99@oss.qualcomm.com/
  talos-lyra-evk board support (precon)
- https://lore.kernel.org/all/20261117075100.272535-1-karthik.s@oss.qualcomm.com/#t
  pinctrl: qcom: add QCS615 LPASS LPI pinctrl driver

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
Karthik S (3):
  arm64: dts: qcom: talos-lyra-evk: enable audio support
  ASoC: qcom: sc8280xp: enable support for talos-lyra
  dt-bindings: sound: qcom,sm8250: add talos-lyra-sndcard compatible

 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 271 +++++++++++++-----
 sound/soc/qcom/sc8280xp.c                     |  32 ++-
 4 files changed, 234 insertions(+), 71 deletions(-)

-- 
2.34.1

