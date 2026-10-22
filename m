Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663405;
	b=FI6GLi+beQuL9ugtWo/EOtFxXsHHHyMOqETTzHgzel5Ad5laNLWLKB50T/32aB1WSxep
	 XvIEWWOqnKlkj1jnfFrD783kRCj0y/kUweOPD4kHfCvLpWnXfzis0gkFRaPKjzNFKQ25N
	 t9UOky2GiSvY8kxFZZbQFmqXbnCYCvjd/iA1Jxuq+Ih9mHjYmlsCMmC6MxdI9nOM+/aGW
	 DXzLEBzf4lx4XrFnSZjjMqzpXWAC29y5ZPFlxkBAaUnOemiXvBtK0vXlALfBboeNXKYWm
	 VVuZxuGpRtfzfcv4gFXwpSO6RKqoHWL08eSdOjTCrbbgqQj1TCN2zY803b1ty+sZgLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AgysoQSg7tYSf+iKFqS310vE2Z+DjmF3l4hWIvnDL7Y=;
	b=kngUIWLqys0PhZjRR7hStIltgVW6aCqsO2FaCWKtljI3omfTLSd1bIUwsqSH7JdPAf5U
	 /dF9pKxiab5ISgn+TjfI8+c1aLyG9nQAf2tNxKTmKnhogwurFlX2ItGMUxXGoHjgIamHQ
	 PYU8FVlHTQY4Dq0I6io8LMKONUwPiIAOaVy0vQr9Q/7dZuIKklulVbmEg6T3yasXiGD5m
	 JPfkXEyYXxtEGK7w/A9jEmbIpOOIk3LVMvJeFEu8tFHoWxGA6vLioyV1vUm0oFRAXqINg
	 SUUs2bpKrP7QEr4gItZMan94LKtEac8zA2V/fBxu7kO9lNPCCGBRr01/dVU3W3GKdwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwhllfYh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA03606A31A;
	Thu, 22 Oct 2026 10:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDA03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwhllfYh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06dJ3427093;
	Thu, 22 Oct 2026 10:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AgysoQSg7tYSf+iKFqS310vE2Z+DjmF3l4h
	WIvnDL7Y=; b=FwhllfYhv+A3LnPEvWt6Tb6jtp9Uqduxlf4fM4H6ucfLhJrADJG
	xXEGLPFX2QxO3MHR1vCIjJoXxDntR9VoOe2x4/lEe/sIOTPj9KElPDBC4CYllxW/
	3VdTDaf709GrqzH2OrYiGSPM2BVIv9jWAgE30RVimnCQ1YDEo4DfdVRICyR86FG1
	edbT2jnv5x0F2af7ZHyU1aIj5P2xW6nuRG29JGVBbBrdgYeNosSpdTZGiVWpYqi5
	CHRz92+J0y6g1AtuZd3uX+yIV/gBkTa8fOupbXg11NW47G1mP5TMvsFeglfBBiMR
	meA4HGP/QW5dTLWWsWKjz1k56gzP9rQNDJA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0f1w-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 10:03:16 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hSno2064182;
	Thu, 22 Oct 2026 09:43:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hSWS2064175
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:28 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 8A5BD655; Thu, 22 Oct 2026 15:13:27 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/5] ASoC: qcom: Add Shikra IQS LT9611UXD EVK audio support
Date: Thu, 22 Oct 2026 15:13:08 +0530
Message-Id: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: qo-R-fAgXF4c-u-qOhnDW6s4Cu7WLkcq
X-Proofpoint-ORIG-GUID: qo-R-fAgXF4c-u-qOhnDW6s4Cu7WLkcq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX7M8RjElMROgT
 GJuB26jRQNuYS7hXU83vBW4mTjExMnfCf+dgBd1z8bGIZ+45CMGMp6mO/uMnvw+YrS27y+tk/Ld
 mfoiUvW+rS91EjCKmk5XOlV/+DfOqw8=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9df64 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=c9WM6ccRSLLKApHiMFcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX8Fe4gy9Td5Io
 YslxX2yLBacQ82zfLyLmw362dojB3xDGbW91aEj+3jqU6Il0knoOfzPr3L83hi+ydP1icRO4Tx9
 nR1WojRj+C26puehnE6R8ZCb2XmPxZS2dHp4Jjv0Pr6Men9UQRoKy97fw72IYy48ilgTIGtiaRc
 trT0yKT8a9P3wIKJmiU3W6PMzv7JqTvlTYEXA8nuiC4hqMAUVhjtWOZRF071PEq1EZgXpl5lh4B
 4WoLWeLTLCNIuUKktrqVhKbY95R8C+K3dZgnljSM+DC8gMZKnADhdDDVp4Qu4lQPXCF9mP+UWeA
 TfLY6hjFrm4WDrk5s8+WaORq406QZpeT/cyPjp55DELVRxgc5K5B69TrPElkp85z/pvBWTzkSqr
 gz6FMqs0hubjmq19uZR7ilCCtECLL03w+IEg57A1iwEXau7jfB108sRujw63a3hUqg5bwDSSp7c
 5pbQD510rWTDXaEUpWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

This series adds audio support for the Shikra IQS EVK board variant
that uses the LT9611UXD HDMI bridge as an I2S audio codec instead of
the MAX98091 codec used on the base Shikra IQS EVK.

The Shikra IQS platform uses modem-DSP based audio processing. The
base IQS variant uses a third-party MAX98091 codec. This series adds
support for a board subtype where the LT9611UXD HDMI bridge takes the
place of the MAX98091 on the primary I2S bus, allowing HDMI audio
output without the on-board codec.

Changes included in this series:
- Patch 1/5: Add the shikra-iqs-lt9611uxd-sndcard compatible to the
  DT binding
- Patch 2/5: Add the DT overlay for the LT9611UXD EVK variant, with a
  label fix to shikra-iqs-evk.dts and Makefile entry
- Patch 3/5: Extend q6apm frontend DAI to support 32-bit sample format
- Patch 4/5: Conditionally skip S16_LE fixup for MI2S and DisplayPort
  DAIs so they can negotiate format freely
- Patch 5/5: Add shikra-iqs-lt9611uxd-evk compatible to the sc8280xp
  machine driver

Dependencies:
- https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/
  Shikra IQS base machine driver support (precon)
- https://lore.kernel.org/all/20260910231642.1794948-9-mohammad.rafi.shaik@oss.qualcomm.com/
  LT9611UXD DAI/codec driver support

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
Karthik S (5):
  ASoC: dt-bindings: qcom,sm8250: Add shikra-iqs-lt9611uxd-evk sound card
  arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI audio overlay
  ASoC: qcom: q6apm-dai: Add 32-bit sample format support
  ASoC: qcom: sc8280xp: Conditionally set S16_LE format in hw_params fixup
  ASoC: qcom: sc8280xp: Add shikra-iqs-lt9611uxd-evk compatible support

 .../devicetree/bindings/sound/qcom,sm8250.yaml     | 43 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  2 +-
 .../boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  9 ++++-
 sound/soc/qcom/sc8280xp.c                          | 22 ++++++++++-
 6 files changed, 112 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso

--
2.34.1

