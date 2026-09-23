Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96483C1F57;
	Wed, 23 Sep 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153218; cv=none; b=hqoucDYkvs1Vmk3HnXwMf1HUm9/jz4Vm1Wkq+VULKhKnfK4If8Yvx4xnSmmCfQyM3fc6LZkaVE0O35xq5yot49y+xOsaFohRbohI9LwtXke7toSVkAQSjOOPIV8/J58p3wq84LJW/wo6whZhy+Cn6nah3iPlMk+YX33qigmENhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153218; c=relaxed/simple;
	bh=jYyAe6ZC087H1DMBTcPSPDVgaI614whUcZ1sshwJ/Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=djWmOx/gsP0N6aFwkfXBnoW42I6cv5y7v7XKKuTQkuHpB5Nv+EhYCwCE1YjYVizv/9qsCrrQ2lzcXrRAMIWrTuUlQ/ZzpFpeIkRYTBo160Ub4TqCEYZf64/qNWNZMFIHGzmuanPZL8eiuw4Jgkie9OwMHNEecYtuQWUyjIR0X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRJTljs5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRJTljs5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8Jmti2028553;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WxwhqqBBuud31fShncICL1hHr3Cgb7Emp0J
	+P0Hc59A=; b=gRJTljs5fgw71U0WwMLRaZecTpoDP9m8n6dXWPw32gNILE5CRaA
	CBZhmTEPmLCFgNG8kkTheEwBfIJMslVguzCONNaAXjvBobH0JF+BPeS2ezBuHbkh
	5F3v2DW97lbLlycEKC0dmSvAQfM1aQ5ouo0sGpR+4xBF3hZ0lPE6yAb1UrUymRfW
	CckxhobMIDtsjmIy4/mHuBrLuA3wIeUCpwhzXK+mw8bzu12JrbMe1JFelFQPuOnH
	poK85ZZD0kys+dDcHDB8wKE+7w3R9nA/wRcZ1dZ72QhvNhalgeuQC2v5O1cx6xoJ
	+2dKMakrffcg9B+TW2xjgye31SkPzmr+pTA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c33rt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8kaFU1728443;
	Wed, 23 Sep 2026 08:46:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kZtn1728415
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 1FEFF63E; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
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
Subject: [PATCH v1 0/8] ASoC: qcom: Add audio support for Hawi and Maili platforms
Date: Wed, 23 Sep 2026 14:16:19 +0530
Message-Id: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7jIiqxpXMc04KTlyttF28j2iDd3XhLeC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4186y8LnAmpV
 lPSXIXfJChZTvDXaKMgY/LUa8Gp85BeTqrP3Wycv7Nd7bVnWsaZVDGflQi9qeZ5vY71ai52V0EJ
 HloZbjJtc24YMdgxqjfJ054nhYm2Pi8=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab391f0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=C_fhB_lATHRzvZu-AwEA:9
X-Proofpoint-ORIG-GUID: 7jIiqxpXMc04KTlyttF28j2iDd3XhLeC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX0SS36Fje67ob
 dJvDw7vzLZQBxfEltmDnx0u0tOGTNxbC2lFjNfAF3ZJ08eMRMnXPm5XWz5wm6lS3p4fHJcCewp2
 VSIrn/yXadY95S8p9ax5O9GNSWsJzJp60Gz1i+j0CUZFhwIDYihzXd7p/IUWDfLMDUJ2qDRuc3R
 lYK2neZyN0R09a1YfwOpf66yvn5SouZyWeKyI0YPUL2K28tu+iHGdTRv8DsOe7xL83fqV1X3DlF
 Jf3qYaFSdqVq6VHtiqQyZMzFeStWgpA6JJXvlQKt5VHU2ERXuRJjK8vV6rjN1z+cpeMWb92CE2C
 u8bUZVebDkjChG1drZJ0wczqM8toY9LUHJESJn8U/B2EcsIWtX9meYcR0gk1E6ryeP0KKsXTdWZ
 XgBrsh6EVz7ZqhlI+GYhxGZaffA6zSp3AhMKi/8iJNQFbRqGAt8LjBFoKlsnBjysH6sqZMs2VKg
 q516YvNPwqrUJsFCnPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

This series enables the LPASS audio subsystem on the Qualcomm Hawi and
Maili platforms, wiring up playback and capture on their respective MTP
reference boards.

It adds the Maili sound card configuration and Maili LPASS macro codec
bindings, a WSA885x speaker-amplifier fix for back-to-back playback, the
device tree audio nodes for both SoCs and their MTP boards, and the
defconfig change to build the Hawi LPASS LPI pinctrl driver.

  ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
    Reset the I2S/TDM, clock-source and bandgap override registers in
    hw_free() so the amplifier comes up reliably on back-to-back streams.

  ASoC: qcom: sc8280xp: add Maili sound card configuration
    Add maili_priv_data with driver_name "maili" so the topology is
    loaded from the maili/ firmware directory.

  ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
    Document the LPASS macro codec compatibles for Maili.

  arm64: dts: qcom: hawi{,-mtp}: add the LPASS/codec device nodes for
    Hawi and enable the audio playback and capture paths on the Hawi MTP.

  arm64: dts: qcom: maili{,-mtp}: add the LPASS/codec device nodes for
    Maili and enable the audio playback and capture paths on the Maili MTP.

  arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver
    Build CONFIG_PINCTRL_HAWI_LPASS_LPI as a module, required by both
    Hawi and Maili to control the LPI GPIOs.

This series depends on the following patches:

  [1] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support (Reviewed-by)
      https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/

  [2] Add LPASS VA CSR HeartBeat pulse clock support (Reviewed-by)
      https://lore.kernel.org/all/20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com/

  [3] ASoC: qcom: Add shikra and Hawi LPASS macro support (under review)
      https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/

  [4] arm64: dts: qcom: Introduce the Device Tree for the Hawi SoC (under review)
      https://lore.kernel.org/all/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

  [5] arm64: dts: qcom: Introduce the Device Tree for the Maili SoC (under review)
      https://lore.kernel.org/all/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Prasad Kumpatla (8):
  ASoC: codecs: wsa885x: Reset registers on teardown for B2B playback
  ASoC: qcom: sc8280xp: add Maili sound card configuration
  ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
  arm64: dts: qcom: hawi: add LPASS audio subsystem nodes
  arm64: dts: qcom: hawi-mtp: enable audio playback and capture
  arm64: dts: qcom: maili: add LPASS audio subsystem nodes
  arm64: dts: qcom: maili-mtp: enable audio playback and capture
  arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   3 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |   3 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |   3 +
 arch/arm64/boot/dts/qcom/hawi-mtp.dts         | 206 +++++++++++++
 arch/arm64/boot/dts/qcom/hawi.dtsi            | 291 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/maili-mtp.dts        | 206 +++++++++++++
 arch/arm64/boot/dts/qcom/maili.dtsi           | 291 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 sound/soc/codecs/wsa885x.c                    |  11 +-
 sound/soc/qcom/sc8280xp.c                     |  11 +-
 10 files changed, 1024 insertions(+), 2 deletions(-)


base-commit: 6c58e38b255a3e0c11e513e3b8de85eb26fb02b5
prerequisite-patch-id: e6735f29343dd80d0e7ad48b6874eab4a5d7efc6
prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
prerequisite-patch-id: 21e9dfd02f282ea4239f12d91ac8a2be76aaad29
prerequisite-patch-id: 52f17e16e09853e366ecc3da2676654df79daf06
prerequisite-patch-id: f0b1cd1f1f8daf0e1814a338446d493d64c9469f
prerequisite-patch-id: 29a1620a2ea61c0b7b052220e5ea522b1fbf2ad8
prerequisite-patch-id: 0872295385e6712bf342d84f095ec3710abde8d8
prerequisite-patch-id: 69807d41bbbd6177da4374639ae280501f3f60df
prerequisite-patch-id: d9f8613cac873926d6d2fd77e45002d34954b434
prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
-- 
2.34.1

