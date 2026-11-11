Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382300;
	b=PMgN8TjD8vi4jBDv8w0zNCV9PrdyiZKaIFfheJ7/xK1gGjWYVtkPccv1eBXGT9kBwIsO
	 zIMrpbTV6jNO4wqSiRBaXBFryFvLtHPrtTEzZKVC3sLBzyLe1qaVdHdK2q3vxy2k4rtWe
	 JO7gUH80gXtSJ6edbk4TTQtrydJWZb8Wxr/l3n44Rgf2BrEPODeotyFRGlGuCWNcyNU4Q
	 w7DLXHpW/+B8f6t2RYY+5UM1YCzr57Y8M0PwrzoMQ2oRlAa2m6buhAUm/FfvwIlUU1xdu
	 KCx5UQlBM2Z0uRt5aUC39pezP1cqVputVFDZmfJzr6SoRYdyWPjxdxUzrmFkrgzSg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
	b=X1PMYynuQyVpikiQxDjU+Fpzi00dMmJpPWVGdFp3BCBw3NCj2NAZ/ZkFxpDkiNbfxmc4
	 xa4H/MKtDBA+KjET7qmtaJkYrLoVLe0yqBRx/ifUjCBm1Z3BP2K5pT/FRVv5X+dtKMyY6
	 9FO24tOkavzQIM85S1aFFawLLruqEFBMVqJd8KxQXlZlNJ34A6nWkCPshhdYK7ya1mnik
	 eo12d3cjgsL1diA0fGk7vtBfnucdA0t1hwiinWlIRzoQqcTxpts4Y4HWiWv2CKlmwtVyc
	 /8NdSNhbtdQQCQSEv21KlnLzwK/U9rHvMj7ALawzo74coSzoyjoIUXQRy/PRjigR8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29153606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29153606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYSKvgng;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EnU47ikZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KQKC3959051
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjx
	fhMEAhr4=; b=EYSKvgngdMKdJd6Ysn7F0avpu8CVtHT7k8KBfQB+Qn+VEass0/9
	Ye/IpFQy4CGxje4LcMDTon+SKVPxI+b0BeD89gPTpHsQWdYN7HKGGD+1AKT5k128
	CwHzxousBsvWwlsZ0yBIDiMJ+hQAumoLD7ZzbpHvMVRWcIiCrxDfhp/+ZJdtlqiP
	ycIg+OwMxAS2o8OUf4TTvnr4kjSMrgDf88SK8gID81k7PvmXpiGDw4jYqqJx0BM5
	eT780Sy7QzJIkVyFJDaJG8WUW5sv+/W3t6+qccnB+Uu0Z/Zq1egv3HtstTGhHUF8
	nJ0AIl2/vdXuZ8wv5wAFUpessgSCvFoJtLA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32ea2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:38 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae327c55so435748c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382297; x=1794987097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=EnU47ikZuZuSPfoSehJPxFK0Ur1Z9BU1qi3ff0zotlRBKBJmzVlZAPlqy2EB+rjqjE
         XgHna6n0JkYf4dBCc7SRXACTse1C4fN7zr5pV3libkBc9qAbtGZgRXzKfYvx/D1oxz3z
         K+y+xP7ge1YPXEeeaTG9knK3b0v//arHlMnczBrm5dBbEoQV+wpwcIK/Q7JoXobIMFxC
         6dddiB0LsYQlNMdqDK4oD70Y7sL0w8c7/zsm/5a2ex1ZHRI6yslFogc07js58KIhURIn
         brcmmx7NmyzYkIvpR9qm/OubPK1bn0xhONZsl+lDIk3uaDjNPuetCuB5YQLj3vNrnDNI
         33LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382297; x=1794987097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c10oHnQAIM6STK2DLQHw9EMW30HYexGjjxfhMEAhr4=;
        b=ublqGFpyYCFPWw1HWBfyqHE98Hiu8IKmdl+r31yEgmVax1YHwizez9PRkpswWv7jhR
         k4qRnw5LCC06hyqzg0ISXafL2vyFOVnx+KlF28fKz2VtSpS+/eQVRwO1+ue731XQjCEo
         B23cV58L7D9C7lrJV8slYuHfN/a2+XU/VMxrgY8jT8bRcYMFvM+yyJdQOpDrb4ABd+Il
         L74aHQ5IFKiM1FOO7vMuqwe0CSTTIsiwzwexNYhLfG0d+8oLewiOhf7h2xRR04Ibo01H
         CbQFaopO2TqkSbPiyABZoj8NlU4CGQUIhhhNHDBclgHEbCTU6SRxMxLjSxgJoPCgJpE2
         OoNw==
X-Forwarded-Encrypted: i=1; AL+hErFg8krwNeyQ6KcsjH3N38vLAQdqo6qtXtJDaojkbDM9If/EYgcPfyoXBLjESQvkO1y7Ea8rjZM4NmiUypw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UhSww7Kqhg+xfC72/PVa1JfMJ/xGOmzX2LW/LHkY0NsweIprT
	5sAbFwLUs3l3aJymamm4cj3OZTcdEpVT8PArWWHxjJeB5YQ0MDHMbJ4CjW2tkctwR/Us1SmYZZh
	QFRvN20xcxdqE138SQfLP8qJdc3m/ft81xjPp7s2Y9JtH9GmNnh/EB7KAt6AeTzK49Dg=
X-Gm-Gg: AYBFou1NEcvJCo7v/ti9hwzyQ4WpnXR1E6SHjC2qoxYLWQyJrRTUqwdTcDJfg9Kk/xQ
	Qg09J28fGaT04pIenk/436Ic3NIKjpeGAFBMLIQ2KWdBQWmlsSj3O6vY2nNriHw5tm5u8ntPBIg
	J0gWhV0h9hKx7xlsCkBDj35zdBk9MjOnTUyeJxDfUKJhBlWV2O4ewKZkoWWS+AuM3aygteACmFp
	eDIlEbSd93jtYkmY26Y017AIlSOu1SRu+Fc0UUpl4U119001wC6HFf40+uvQBB3a5WVlAC6g4qN
	1E+acfJLbCCzP82U0sx5qhVcI4TffF5X8C8T0zw0L7OoiyIUGVe6AiN9OEbchT8oPRMTGh5excs
	Y8nkpTQwMWVY9Oi4qnjI7OcFtbf9Wi6OkNGQD1YW1vxZWMFs4MhKj8dKLkEq7x39ybf5nW6r8qw
	24dsOrwJ8dECMMvZAcNz5nXf/kAU85gbQV
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888475c88.4.1794382297307;
        Tue, 10 Nov 2026 23:31:37 -0800 (PST)
X-Received: by 2002:a05:7022:1507:b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b3bef0d528mr2888436c88.4.1794382296484;
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:36 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Add audio support for Nord platform
Date: Wed, 11 Nov 2026 15:31:16 +0800
Message-ID: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af419da cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zx-u8faYscwgyrAVXPQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX3f2ZGO0FpGYd
 4PUCfMC8CGp7XnDHQ9e10IjA2rGBQOpEBCO8jwjIlwtueqCczHQzwR6NOd8OKCExnSOhA8ftRup
 bkj5o/eYzuSQg1IkkpargKxZa5OjkuodYaQmnAlj/pc+AkyW3oIKkhBiEDXRtvYOvnR8lXBGKv2
 +SHQgvRh/ZvUjTgLT1prZdevRLl8Qn5srj3pvGKYxQg+naSje+nVV2CQ8trrg0xN2AnAla81UVx
 oI1QD0Qvm6jh7JULegwUQHWeG2HBGupFowXT9EmPbBe1UoL29mRPB0eK7LilGwuRddcx2mlS+8H
 n6tZvGih4zVMnFeO3p62xzZpIYjzdTSU58VooSC2TgmdGtmanUzKUwZfppkvyya0e0fjxgBCLzj
 OOh/g0yc2AkACzwTYrlSyo6GpxsOhnz685QMocPJQSq2T8zngH01eFvo1IxhQbqbT9UANQdDv9X
 SG3IltR+zmU2Z8n79rg==
X-Proofpoint-GUID: PMxtsP0LBGij2sJlfSfW1u4M985itQmV
X-Proofpoint-ORIG-GUID: PMxtsP0LBGij2sJlfSfW1u4M985itQmV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX6pJXxSsCIz8S
 yxDr9IZUQkzquLGboQ/zQeJ92QiTE2oBtwHPs0hQMDCjdmfpLNOGhV1+mn1gt03qIA/74XPrUdH
 caFG7rIKkS9mXmKuMPlbmSQki7vT68M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110029

This series enables audio playback and capture on the Nord RRD and
Nord Ride (nord-ride-embedded) boards.

Changes in v3:
- Rebase on next-20261110
- Drop RFC tag as dependencies are cleared
- pd-mapper: Add adsp2 root PD (instance 124)
- pd-mapper: Add missing NULL terminator to nord_domains[]
- pd-mapper: Explain ADSP root PD and shared CDSP root PD in commit
  message (Konrad, Bjorn)
- gpr: s/nord/Nord/ in commit message (Abel)
- ride-embedded: Add missing space in vcc-supply (Konrad)
- Link to v2: https://lore.kernel.org/all/20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
- Rebase on next-20261020 and drop Assisted-by: LLM
- Tag the series with RFC due to dependencies
- New patch for pd-mapper change (not a DTS one but targeting Bjorn
  as well)
- New patch for i2c18 pad drive strength change
- Support both playback and capture in TDM mode, 4/4 channels for
  playback/capture on RRD, 6/4 channels on Ride
- Use lowercase hex for iommus property in q6apmdai
- Control DAC_ENABLE and CLICK_POP_MUTE_N via regulator-fixed
  and simple-audio-amplifier
- Recreate RRD patch from scratch (mimic the new nord-ride-embedded)
- Link to v1: https://lore.kernel.org/all/20260914024003.120931-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  soc: qcom: pd-mapper: Add support for Nord
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-ride-embedded: Add sound support

Shawn Guo (2):
  arm64: dts: qcom: nord-embedded: Raise i2c18 pad drive strength
  arm64: dts: qcom: nord-rrd: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  32 +++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 153 ++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  40 +++++
 drivers/soc/qcom/qcom_pd_mapper.c             |  22 +++
 5 files changed, 412 insertions(+), 1 deletion(-)

-- 
2.43.0

