Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F062D8796
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082215; cv=none; b=Zkpv8is47W3ZppNmK71rW8mU/nK0TkA37b05nxbtX3chfonmQNVCCozxuwX99vTD8D5cpTCTrIWns1FKSUDT43oQHY54y46PWZfQAyvm52Zw5zaQ7AahIp5GF3f5LE84M4Hji/T5yHJQI/gW1BhL2U2X2KplBYxc6a2JmckcE1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082215; c=relaxed/simple;
	bh=Dr5Iuf4k9Fo9Xzhbyx3m5ImmN753LgrcpI5ZozfKH/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Gpktpd6PYNdgW4QOUoF7g3CzqOcx4SASOz7r48m414qJ16c0gnZKBU5DB1xHRHgrxdh93iAl+V8JLlLmPaeu/MQ4yqTrLfGQNsXHWbef1NldnilbJohBRXjpG7hEQ4DP5WtiCojTysBP6wbDO/FEb/VCoZQOoOGEXd53iHm+IhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGKEIBR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2JkSXu6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGKEIBR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2JkSXu6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALTwSG2173719
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r5/hiIdFrPwvj9F46iRT7f
	RMfEtM0BwXeE3UhxkGKSE=; b=aGKEIBR52Tf4hgOPq1rPZdk9yfpnlrozXV9IsN
	nU+6+mLf5QCl23ozEOkiUBWURnSNXfDH95DD6d035K/QouoO+aYqVJO5+OqD8IZi
	p5LkRkxyb0ftvewOkN9O97fQr/XkcKQ/qleFZgE81+PRSAhx19NIxI7/zY2Jtioy
	2xQ6ldmDc51sutTVwdSuPFl9j+L9EHoudnqSDAsP8E/8BF8k1v92xtswGu7W7nee
	nq9ZnWcMLIHqRftjp9q+6yxQz2h0Iiac9LZh+L3MSnvERNU17fpXrDwcwFrQsaUK
	pC3rAz5lxWSpoZpbqmDwuVN6RzHOwuYWAokrqkmtKkiQS3WQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts2c76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:16:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso292709a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082212; x=1789687012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5/hiIdFrPwvj9F46iRT7fRMfEtM0BwXeE3UhxkGKSE=;
        b=j2JkSXu69CznhF012Wo3xFNZAvyU8k0caMhoesj2aD8cbim/KgWil18q0binz5ecy6
         Xi++wd/WWqkZna1Jc9QKc7zsg+vwUZvAuyRs/gcruqshKuQyDUFDyl0P7vvRF/1AwlbQ
         JTo7zMMwUTa1aQf8Gvd5hZg7byDIZg606kMtLe9jQdHIifeY7n+7in1pxbG0RPl8xCdQ
         sEYN/oeOmeyiApigsKPN+xMuxyJv2nH2xQM7VslcBJZ/oupzumx/kycBY2PaBy3Y8bgy
         QiDS/a6H0tIHuH4jVa9KiTeHygoBwaYS0mjXpkgzqyjrEy5ReMruYbOf9rGUjU8LiH4s
         NrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082212; x=1789687012;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5/hiIdFrPwvj9F46iRT7fRMfEtM0BwXeE3UhxkGKSE=;
        b=Yp3v1HCJgqSTHdzATkELysTsVPbZvd8DmDXAHTKZftByFi43ZxjS8V2w5hPelVis/N
         Jx9adM78McDmWB/gVMWJuE3Ks+6sYhFK9F3YZfUsPGgdWb9/Gu337BCgnaAUCaZZ3VQd
         FtYfu4zS87HlJh0cTX+iWH9+BVOdIEh9MW8fBKVC1RlIrthSZ9z09yuvBiPHyhpp1pgN
         u5nEBVrgE83JMcMRLYRVh7GEw/GOF81h4e4KZ4IPmaTdMVmDKTpLPt+a71Y15E1MG/47
         9CNxpHtuquyKUAyze4r96vQ06fvhrpAlIU7Cx3GJ4IZoMkmCDcXwQHys0gPEdT/wRRck
         QXqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUbV3iJSFujm+Jjw1nGNqX1cvcQjrhPe2iM53GJJZCv+WgpmCvd+Yh/IJVvG/0XPubFtoETKNfM5yWXpI=@vger.kernel.org
X-Gm-Message-State: AFuF++mp4q9jIKpMGL1SzDbUww+54ktXJSNZgjcnwoSJLFLUtcR4SgFR
	i0nD2T+44MRKmt7xesScw05XwWh7sB4KRQiX6Uxzj0oVkhDGLopMEY6890xV8ek6WoRwrA/Kezm
	o5MRUXXZLX3BoFH29Drv9FLC7gL+EuU05mGBesUgsUd2tv3nXJJOK/wq59gVHSIFzKD0=
X-Gm-Gg: AYBFou3Hc9zAJ/B0c0/DE+Tvf2YZtt/JsqlBWQJtafMuaEWoNLeCkqczA0JjVrlpVAM
	yPd/NE2w5RhwJpyjEtO7bDsbycQrufR3KPB/+rylJwPT/FBkBWqQ+bprDjRG/KDDb7Ve50UOQZy
	F/1WN4/J8BjyB5vwqm2yWZS5WXygi9unuyK2Lj8r7MbPmzd+kItoj0ydiCA3Km/OdGMBRCg+VnU
	u+BOrt9U+BICRmTg9yU+KEvlHD51a5T5EO4MgIcBQZSX3t3gz/DZgk/14f7yr4YRgUMVJd3Hi5k
	ekox+KZO8pzyxo7IG2xtiV0TKA1R6Dh7C+w4I1aQG/pyePdYUMVOxt/RZaBF04EaUf0ffM5x/q8
	4FxujzdGYwRTAVN8cBwUz8KWVdKNnVx1gGX6s
X-Received: by 2002:a05:6300:670d:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3daed64d8e7mr2613947637.27.1789082212538;
        Thu, 10 Sep 2026 16:16:52 -0700 (PDT)
X-Received: by 2002:a05:6300:670d:b0:3da:5b4d:a89f with SMTP id adf61e73a8af0-3daed64d8e7mr2613890637.27.1789082212126;
        Thu, 10 Sep 2026 16:16:52 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:16:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Fri, 11 Sep 2026 04:46:33 +0530
Message-Id: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa33a65 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=XxL5jg9vB5HpZleAeu8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: AEDCzavlJGny7m4xbhfDvv1V4Qfti1dB
X-Proofpoint-ORIG-GUID: AEDCzavlJGny7m4xbhfDvv1V4Qfti1dB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXwpkSuf6vHuSX
 TpBm6bnAO+ejlvDP9W5JOaPxrl9bWhkjzqVj/+BtbiW+II72p37f8qaBkOeI96cBSFHhYFpPSyv
 qBrrfJL4AuQvS05Elq4qRV08HBrrPqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXyxR29Go18PBe
 Tb5kBJ/SZ8P73iW//7hIu3Q1FcfSoSJ2Hy0ngmIUlvbGUYqeRVMZ5JPoVXoiLl+gf3z/EjKo01C
 UjTnK4YGzbDLWfl/6LQMLoj93dooMo8RvV88wnEogMJf30a0SfoHE/3AZcoqMe06CRxRfFrNzoU
 89yED1dRK1Rtkz/gjAf7tvaPbGJVqHqDwDbhjfdOvLSMVY27lR02Vr8nTxzRVey1HZp2eZSuTae
 VmzG0O5mTkpQL4GhQyBdU9UC0GTpETCdfkeEGzs1QkJXgHG0tBleB7FkIWpQcDAdOcqx6sxDhg1
 AMMffcxR1Dk5Z7phnZrYELPjzZjOgx+syxBHiNbFvYro9TEc/0jiiKvA+tiAt5vg3Yr1aMv4Wh8
 Sve1e4StZv0bm3Hqale1ruzpDGnWjLFblPQwTroGh22OD1Iq4r+aoYlPvLxILegiRlkGGunR3Cg
 P4fcpr7wPb3LHtMlPMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

---
Changes in v2:
 - Fixed Konrad’s review comments, addressed nitpicks, and alignment issues.
 - Added PM4125 headphone support for the CQS EVK board.
 - Documented TX/RX macro clock constraints.
 - Included MDSP carveout memory and updated APM DAI memory regions.
   (https://lore.kernel.org/all/20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com/).
 - Link to V1: https://patch.msgid.link/20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com
---
Mohammad Rafi Shaik (9):
  ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
  dt-bindings: sound: qcom,lpass-va-macro: Add clock constraints for
    shikra
  arm64: dts: qcom: shikra: Add QAIF CPU node for audio
  arm64: dts: qcom: shikra: Add gpr node
  arm64: dts: qcom: shikra: Add soundwire and macro nodes
  arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
  arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
  arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
  arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

 .../bindings/soc/qcom/qcom,apr.yaml           |   4 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  15 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   | 185 +++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   | 220 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 144 ++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 256 +++++++++++++++++-
 arch/arm64/configs/defconfig                  |   2 +
 9 files changed, 830 insertions(+), 2 deletions(-)


base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
-- 
2.34.1

