Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021129;
	b=Jk64IMu3/4VxZBL8Bre3vmjo9ILkAkgrO1BrvfYiwkaq2zY7tpGvjVY+ZQkEdOcdWEdD
	 kmV0bnRz46T1peO2VYFcFrZFc4XFOkQAkr3SpSuTsb9x5LBh2o/gmKsSkHS475uz+IzTw
	 ymjCe6tCx5br46kiOxrtWhyzcIhqavsQ2JdrCskSFGJukQIuHZWKC6EVy7Plr/eH6B1yt
	 HSiy0hEDI9UpS/GmmE/nYd/JVygPFCz8Z/ficSjz2lJEwEdcxWOg0jYfZaoYPsqyjjr/f
	 DgHR1CYGz80BHXTJVpPe6yAguhLttt9XYUYy9fkyUV8+as+MJ9bw19FouNSP8h9zylA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9LCy8Kbyxygh7Z9zyIlYZ0wlHWNeQPFIBCRXZNp5puo=;
	b=O48TVb/t9S29p7+K/zSEXzfHxiIKRKtxREP+lTLDZAowTS91t9TFNEeXE2dqXJr7xEjm
	 pmOHahsbaKh5JjShmLSxR0ozbfsoIUU3HlnsS4TOArLpmDVghLD1H00ia/5DWCaExiA8x
	 Bd2ql8wLmbsPVIziqRnwAiJPUTup1eKcA2Eto1jBK87NNVC0iEkfRNXbEnWlbNwPvQRNl
	 vN31HgP2PLnkN1YU2WZsC8/kNomQOKqGkGAV6G5L/U1lr6fZvvJ9wFajJCa+8fMegCOlT
	 oME2JkKgY0mbBOI9bIe94lpWDROA/y8KSdRwhxTZpliux7DGQEx6J6XW/Gq/Iph1LJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="NUTFz4P/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78411606A31A;
	Mon, 26 Oct 2026 13:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78411606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NUTFz4P/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMqK2541998;
	Mon, 26 Oct 2026 13:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9LCy8Kbyxygh7Z9zyIlYZ0wlHWNeQPFIBCR
	XZNp5puo=; b=NUTFz4P/SYGBnrCtTH1A5bhjEzOFTvsfxVG1sqBs4Vp10eGRG+Q
	99iXia6GR78BEZsx01ulHu54TNAQ/7ALuYUra4LIPmhzmwwhuCMSvpWLrzMiFbw0
	goAMLu3G/NZ7ojwVRlje72D7MIFNeyQEFdVq7pSTCAd32cxySZmUP10QIHZKH5sN
	K++PY9gd/RkTXglSuyfpWqWgQPMKXEykpgZ4BTWP/3/g4XaMv2jwBkWqCB/7uSaO
	5IS3Mvtc+GF1FLXuWg+aMFwMwEC+j1QfoabjpWyvYC+3wMUSAXav4+4fqrkhTZ6Y
	pUgVCD8+c19mcIfgfQkC34Jj3x7FT+pOgsg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdam84-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QDPKaM1853279;
	Mon, 26 Oct 2026 13:25:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69QDPKKa1853269
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:20 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 57A28679; Mon, 26 Oct 2026 18:55:19 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: qcs6490-rb3gen2: Add HDMI and DP audio support
Date: Mon, 26 Oct 2026 18:55:14 +0530
Message-Id: <20261026132517.1133138-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RuXqEa1hQAvWAwSP9BLRmkXwhDqLodqB
X-Proofpoint-GUID: RuXqEa1hQAvWAwSP9BLRmkXwhDqLodqB
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf54c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xet2HuNJtjWVCd9SPpEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX469lfL5qzhNH
 Tg4nkw4VHydypg9+teXWV9ein66u6yFTk7Ws0aMKFfnEyOM6gT9jOVOxR4jCA3cxbjEl8kPxrIF
 PNIrM26skIxpNgOzdPl9aDjPAcAsQCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX89H0nb6QWAS8
 Jrq7HeqDb4V86j8wRS3EHQuQ4OoEw6RGCtCM/GwjFsYUuq5g9RdKQXyfFLudwi1fZ6NeuK1MWDG
 zBRl1xbpdwjV1314ePbeZda0zPcPEWwHNEM7ftcn2I4L+W0mWJHu1u+eWzk0vaWZWA7Chmw2VG4
 lxKEjBOYypbbA0CjUsvD/n/t5TSWpIUFjjITDNzZ4ouASqsnXSzpyYyZ2RhVh7qpZg+zJ0Z/XCN
 p8hpTsYCB+kv9U9jQVi+/XuNQpZ8H7ZI3gwrMtv8VvGpPk38qCe78lEC7Kgmr9+lX3iEkfiOf3+
 BbBmgNugslgVE5WWeTxKyzmm4+AQQ6PD87asiROYHJ/EsvxVIS8454NxzsDh7zQXrxKKGwMZLdf
 yuN+kvgWUPH+4xVivbBQ8zW8wwK/B7KGf+sR8cPoMOBWZ7lz17tEzWLrZ08OZOqMqzkV2aq/cb8
 uVRtt3s+y1KQQCcdmsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053

This series adds audio support for the QCS6490 RB3Gen2 (kodiak) board.

The board features an LT9611UXC HDMI bridge connected over secondary
MI2S and a USB-C DisplayPort output. This series enables audio output
over both paths:

Changes included in this series:
- Patch 1/3: Enable secondary MI2S pinctrl and add the MI2S dai-link
  for HDMI audio output via the LT9611UXC bridge, and sort wsa-dai-link
  to maintain alphabetical order
- Patch 2/3: Add #sound-dai-cells to the LT9611UXC node to allow it
  to be referenced as a sound DAI provider
- Patch 3/3: Add a DisplayPort dai-link to enable audio over USB-C DP

---
Changes since v1:
    - Separate patch for #sound-dai-cells addition to lt9611.
    - mi2s1-playback-dai-link kept sorted before va-dai-link.
    - Subject line updated to mention kodiak.
    - Patch 3 enables audio for USB-C DP only.
    - Dropped patches: ASoC: qcom: q6dsp: Update bit format support for
      secondary i2s and ASoC: qcom: sc8280xp: don't force S16_LE in
      hw_params fixup.

Link: https://lore.kernel.org/all/20260413091937.134469-1-kumar.singh@oss.qualcomm.com/ [v1]
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
Kumar Anurag (3):
  arm64: dts: qcom: qcs6490-rb3gen2: kodiak: Enable secondary mi2s
  arm64: dts: qcom: qcs6490-rb3gen2: Add sound-dai-cells to lt9611
  arm64: dts: qcom: qcs6490-rb3gen2: kodiak: Enable DP audio

 arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 69 ++++++++++++++++++--
 2 files changed, 69 insertions(+), 5 deletions(-)

-- 
2.34.1

