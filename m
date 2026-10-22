Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657980;
	b=4IMW19Hcrc/ELG57Zle+1qgaZwR/oGz5Mdo0G6M/fHaBdrubc6DLnJiP3duioELt+2Ev
	 yPwUUCmxh8nB8QWY1i0u5/hMnRMneKVeRPkz7C1DTcXIZmWPIDYs2/mHAlaaA7rn4237I
	 vhuFqR8YJpFVosobiHIl+jIMOmBIRWwJdYzJwKTDMaqFtuoERutx4dIKzRLHUynjpBzlC
	 hqDOFXmLOWf3L6L3u6o2XZnH00c0Cs7lZaECHKKFVw25etplQTYyL9gPmJAJfMefgfYR4
	 U1rxSMdScHy15RO0GSsSEtPWddxKp1bfGIT/2yXJ5fE6/MQ+3Uas9dPotio4a5HrCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AgysoQSg7tYSf+iKFqS310vE2Z+DjmF3l4hWIvnDL7Y=;
	b=VoERQliSWAI2FYAWSqRYPm1ktvnmZragKBARNAkEODp1Ntlfp5gBeBeY/b3jGBYyqwN3
	 V6C7RrJ7beSNCXXy+40ZY4GhTnuEIKtHFQ3Cj8h+Su3GWcbVRU5v405oxFm0QBGdufWxJ
	 QJKP+NW29lzrOZmLp3ms56VTWQBKKH/Ezw4UoYEpN+gNQ2vcx0A8xF5AnJe4iIHUbB1tq
	 E/Ne48MVZLu0eJyYTzrJ6Y9Bck0rmn+w0uFSer7ncoCq7hNgGIxRyVO3XPtH58yCUaGcN
	 a8eawISoEbW2G4anO/bnNo2xqLI7EMtIxzAHar6IR75qKoOUGkADGJoHhACpUcUxbiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnVMXIZz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD7606A325;
	Thu, 22 Oct 2026 08:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DD7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UnVMXIZz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lo903194761;
	Thu, 22 Oct 2026 08:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AgysoQSg7tYSf+iKFqS310vE2Z+DjmF3l4h
	WIvnDL7Y=; b=UnVMXIZzCrD3hj4LhvXvmAJ+MUjPpn97gFS82nUE3N0uwQCp9i4
	zletjBm/erJGBcSekEEYpa7rtF0fR7yNoJVBecBYucGNwgHhJi79NeRwc9Eb58XB
	rOEJkvSXyOLcPEiU+6LiG6qqU51/WeJG7Ga1/FtuSR42WQldnuWeOdVF2WHl+k28
	gzXkK7YoHQ9kvzVr1EaT0dGNmE2Hm6tw++4KGt0ZXbfx9EXf2QRwAMf17BauYgPe
	zpFWr2VeeU1mi6Y/VkD+3Af0p5rfpkJiK/z60wHbDNFp4Y31hwNiFmhOPVZ+F1Eb
	cU7gsIUKwezcPqVIXLanXexHUV+bZ+50bCQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq01pc-204
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 08:32:52 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7gO8x1894729;
	Thu, 22 Oct 2026 07:42:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M7gOA71894717
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:42:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 05C6866C; Thu, 22 Oct 2026 13:12:22 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 0/5] ASoC: qcom: Add Shikra IQS LT9611UXD EVK audio support
Date: Thu, 22 Oct 2026 13:12:15 +0530
Message-Id: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: L5u_ae5SlG5FPqQxFZXM8_RAVQD7Xf9z
X-Proofpoint-ORIG-GUID: L5u_ae5SlG5FPqQxFZXM8_RAVQD7Xf9z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX9dGmUKgi4Hqw
 qSXz6cjbhm6lo0Jf2sIVAl7+besCRxT2FU4lCIPClywW5JJoCgkF4PvGMYYVrY8+t9yuPstZMUl
 xqpzIJSd3oa+SY0II3xjGadXbrf7gno=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9ca34 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=c9WM6ccRSLLKApHiMFcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX6O0TDOv0NG2u
 vf+f8eyQ4PXQb+eFIc0VQH4UrWFBaPu1rQMoBc3tFm68W/MsjZLsnLMjhGQDjyWBGHLPKZDEm4H
 +4ODwgwVlAl5pbeT8pTR/o1KRumPdjJfsvDJuHGznEpHLNlh2YqFL7mywxjie4m0JVKnDO6Leco
 ErGUhBGuQckA5UmIfV7V8/kjDgqxvsHNWyxOeWZC9nmiQbb242/cv8DVBbIpr+mfKEl/sv/Vt0P
 VuNMaXhpR8VffIDWBq1bY59TChDtAvSbMGARCwv+HD2Hwvt51v0AtyuopgLoIk8h4d4K9LEq0qA
 7fK8F7pSR1UtsahDp4cp49Rtd1D0co0OAwW/WrOEjQNcIUzZbfl++28Py3dIorSBXJ6JZCT8SlA
 BxE/ykOYhOyglvZSLPUKnKIyzUabcu0szkGvpvlmwio1qsNEq+FtFe7M3fw1QrI77daOQj8x1Tm
 p8hdphYT1UmmCoyYzPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

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

