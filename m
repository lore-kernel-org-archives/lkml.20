Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60A3B8124;
	Tue,  6 Oct 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271662; cv=none; b=RVnNcv7W0U9Ti/E2vlsKqjvxYyjfzmI8/PbnyxRHbjOkrsyxPTnNeb88JzkbFwJb6pg1NcYav5vLRQU8uOH5Vwye+DhnWjj9UYu8mzgC7G0+TQ334IVIQgo0tD4zDmM4LxyLWTkcGIaGZnIOX0gTrHhyf9ve2HcaoqLbKzrMgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271662; c=relaxed/simple;
	bh=UbW0TLT+aIfBvgyoD03MEQlgZ5nD/s/iT4k3ibYV+BE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oaVwgWKxBE28pR8QH7OD0cLMLQKJvkWk1Xir5P0BvBy+OQyeL3+22WlOkYShfjORrn0vkGWvPq3FXmxv0TNw4FFRrfoin4h4tbOfRInn4BpOzy9pTp2tuimL2wdetw4aZHGwinZV5YGVSdMYkxw1KxD9lh94awXiIMx0Ye+QCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBM03txD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBM03txD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gVL01045425;
	Tue, 6 Oct 2026 07:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/7aiDAPbByLoLP0332rYyB/MtWtdfwJq24l
	GFWdZW+Q=; b=VBM03txDvW9tV0ftkPG+ofpbZG44ZZn6c167feGNbnHcnnP1jjL
	2Y0GIKhvu5o9z4RhUp2GF48h7G7jzTrWr1WblRrSol5iQwdt6uMKrsNqs6cRw8pI
	dRHTwsGfQjQKCuiw1P/8nejufVij4RD3H1Sc5IJZbEpym1zBQI5ldS3yVUErBuVT
	9X6Dl/4znVJfYwGpSJ6gJBKIC9+/BDsp0Jd4DcFgZnqraScTn9t00gbnAHAJnSKR
	qYBSJD4jWoa8lNj7aGY0RQf5Q/TE3wURXW6+tqxgOArh+itLaaR8nPON8YE5C5jZ
	fTCyKe/H/4decBYylmanzbQuegNeoaIIOqQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g528-8
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 07:27:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6965bLZa411420;
	Tue, 6 Oct 2026 05:37:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6965bLRZ411390
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 05:37:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id D707C63E; Tue,  6 Oct 2026 11:07:19 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 0/3] ASoC: qcom: split out self-contained Hawi/Maili audio changes
Date: Tue,  6 Oct 2026 11:07:14 +0530
Message-Id: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfX5J1RO/vbuuE1
 c9jsNS7wKIIDENNWmInBwC+bVUWLd2iHCilsKTLidDa3TlOqLruKgld176hh3a4pDaBuAsbC3zW
 rraO/E5nB46XYOZnOx3l3U5zaHie0KIpioqXOtcPe+hAXP0sYBeB93CKcwqoVk8Ou25IxAhar8E
 wI7/ADD/oWJqC22oTY75wcP5BLmNSvxGgc3/0IgXegJ0jVo1/cHqoj2NJ7h0FUM0DNX4ZSPwYaL
 f+X+yUCaY12ofUKGL2ldoDe7NnXt9hoEiYocqIa799/mCj6MazSni3HfEOtVI6fqOsGuo5o4Tdm
 HLxcSgA12E+MdNOTB6YcxGIVwsVYUBxD4t9i/zhiVlnIt7fCL05bFsY5uzDRKtPM1ykD2XWU1oL
 oIQ/4Wa2Z0eilYvjHEgAdd/Tja1tX1WJThYFYQlfnmuWpmnBj4zQPk6ykxaRLCRTfDuVrAXdbFK
 6MigltAvjZyY6nYimRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyOSBTYWx0ZWRfXyy2q/jBL0QsT
 5Eeo4/u3H+tE4hiF2cg2xjsXUNiOcIgNwHn5y32pEWMR2oleijlzt/A1hNhCDk0PAVt3lzlT15U
 H7glN/plgCB72I23dWM/wokbMD6Xcxc=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4a2df cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=h_NbABPgfFNvhafvmrkA:9
X-Proofpoint-ORIG-GUID: 5HVRG4QUL8iw24HyQzBCN3XHDz7E1Kt_
X-Proofpoint-GUID: 5HVRG4QUL8iw24HyQzBCN3XHDz7E1Kt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060029

Hi,

This series extracts a small set of self-contained patches from the earlier
Hawi/Maili LPASS audio submission to simplify review and reduce dependencies.

Link:
https://lore.kernel.org/all/20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com/

The original submission included changes that depend on LPASS macro codec and
platform updates still progressing through their respective trees. This series
contains only patches that are independent of those changes and apply cleanly
on current linux-next.

  patch-1:
    Reset I2S/TDM, clock-source and bandgap override registers during
    hw_free() to ensure reliable amplifier bring-up across consecutive streams.

  patch-2:
    Add maili_priv_data with driver_name set to "maili" so the correct
    topology is loaded from the maili firmware directory.

  patch-3:
    Enable the Hawi LPASS LPI pinctrl driver in arm64 defconfig. Both Hawi
    and Maili rely on this driver for LPASS LPI GPIO control.

The remaining patches from the earlier submission will be reposted separately
once their dependencies are available in the appropriate maintainer trees.

Prasad Kumpatla (3):
  ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
  ASoC: qcom: sc8280xp: add Maili sound card configuration
  arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver

 arch/arm64/configs/defconfig |  1 +
 sound/soc/codecs/wsa885x.c   | 11 ++++++++++-
 sound/soc/qcom/sc8280xp.c    | 11 ++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.34.1

