Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913751;
	b=El/95CclmsE3aEi7XH6Apxhp/b1fkS/+qBhKDgCBFk+jO43ZB2KQ3ZiNBPXRXYXg6KTZ
	 BhMmZuYEhBJcOB/wXhkvb2Hs4ybA0E7bkJR7uSSjtcGbxOzZ9eA3j2zsSGm3vC4EnNF2o
	 Un/eeIkXt7LJkhbqOinoImfe9OvCs6WW0L6vdQwqkRHM9vlkT3vZmvxpI1JmgatA5TGil
	 PVYXSz7ELH1PQKoelogGftLkGqZb/xP+Z7uS679A89BLnv4npV4eurFsmBiZZqokcyhmI
	 8eREWM4orbnrZ98UBRzv1NjiFvp5Jbb8nJqp/noND37dZBqgIEeMk6ITRFn5dVo7wzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913751;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WWvwVYKenG+kHA4rdPTTYPgchSKfSupK1RMORGGWU9c=;
	b=tsD/gHCd/xhxZHlfLdSrR6pLr+1WyIT8BL9/s5bSkevdNUS6+ikyctVEi9ukvkVBKeSt
	 gFHL/2kNfziYPc99VLPBvJbWmJumxpPyQve8+FqLJW7kv4h1rz/0w+Zgyt1bW1JTQN0ar
	 LwW/IlwABQeMeeEEY+6NkH5bF9DAHQuPrfdRGRnDe5D0gAoOXfZ96UtaIdo4QEewtm/gY
	 fQlI6KmCJOwI7+gyRmBoKJ1KCdPU0kafBjJp7fbzUoqPW2wXXWLIErqEVgdk4dYUdcV/6
	 qw+iM8VhIkyf6dOaXyVTj1v5qGvS1doYZU09XWze8JUZ8inoh0v6glcaEZrFv0zhPpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBwsMGgO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3B5606A32A;
	Tue, 17 Nov 2026 11:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A3B5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBwsMGgO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6f0Zs2998606;
	Tue, 17 Nov 2026 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WWvwVYKenG+kHA4rdPTTYPgchSKfSupK1RM
	ORGGWU9c=; b=pBwsMGgONKWwUHN201IzvJXOZqisqdDJyB9on5cbxiQ1ReGg0lC
	zgLar/ga6SjzeuwU+5bd3QjtEk5JmPDvTpD5o+xVQIYxy1Xu4nRi1VltoME8lq+9
	cQX4BJaYcHKzRSickYHcb7I7y8FPXIUFclCGuIIymZrIZkTqWCLFnazNzj+7Y8cx
	exSNxPkhF29D89xD5rR2ru3C1QX1AOP1Hw0XmHReIQ0CadskjZ/BcupNQOZGDvYk
	htNp2pup87Gsu4T/24Mb4MsUqmtQ370vaGYJf1qNvWrbekKQNdshYr4E3peMPaCW
	8CTYAldboQAKqQVcF9HBo3q66Sfzoc3pHSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve12w5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHB8p7X2620849;
	Tue, 17 Nov 2026 11:08:51 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AHB8pAs2620842
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 11:08:51 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 9536967A; Tue, 17 Nov 2026 16:38:50 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/3] ASoC: qcom: Add talos-lyra-evk audio support
Date: Tue, 17 Nov 2026 16:38:45 +0530
Message-Id: <20261117110848.465407-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfX1EYbmVPbZ8LM
 DTufC3xejx1HZEbdBO18IyNQp6lJNqcJOrEc2L0Wz5BNeHHzqLbA62U2LsZtWnUx6vcAjvPTU6/
 tTycfLpk06lDZqp30+j0KhIGtlvZo+A=
X-Proofpoint-GUID: GAw0rHDrewp-IYzf5zIApUY5xowuZq7j
X-Proofpoint-ORIG-GUID: GAw0rHDrewp-IYzf5zIApUY5xowuZq7j
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc35c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Fnp2pXIAsWV7alZBeiUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NCBTYWx0ZWRfXxu5WEMUHol49
 K3zxh5ydt/NG+tXk3DEiIF0zpyNGZemPjeWeBLxYl7UKpjk1Skwz/C5rGpZgxl5TCDTAlIDpi0m
 5M125pfwhCxAHlkSZDIBAlemcNehOCaHIeq4cvtTNBwQWHZ5N6wrjqlgqUEu2S287P1FjanxC8c
 q4wOL4/MHEEqZ94JvsyQAkqjFyelYOBItWuPI2TpYTY4quUZHBVZ+2M+w0ybCtAplN1GoNYEQt0
 qyq5Zw2xyJPjIT7Ue9APoijFc+LZlfENOdL4YMEKjkt8WA/v5Qc28bVDYJPYIaIatlD5ZMTIWNb
 twYDhSGmYOjjlr/CeFVFh3JuX2IjEyKFKg1KGBjemic78WImBBjRRSdXb4+u7Fd1LMl5nz98QUE
 9X/zt/SxUep05ufefp9sIB0u3R5GDZrfpx8EUt6eAEiLCtjs6yzXyyW0MklubuWFHYHTcmFn9JZ
 6xdR1HGYhRZzUBgLnaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170044

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

