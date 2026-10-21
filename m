Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549873;
	b=4sz7AN3Pd/Xk4E/fPUNn3m7skGj7wlMhlzBMMNoiFT1jvsFF5N1I+KWtS3k5TOMOvm8P
	 nnjwn2iFf6Lpoi4Kr6r0d23V4Mzz5e+kgj2pxcRui2Ia4vl/yQBlNIOTJcFMMeBbJl0Lf
	 UOx96zzDirJQEcrnk2QgSc9gSeFrQr+c6bSfv3x6sDsAK5wyieJsBZEqxkSzK751IegkF
	 fueWpXrRlQi2QDZRXyeRsrlGYRHQzjfEJF7L8jNuYh1Z4gmeRjYXH5mp8M1U/OcclyGuz
	 YDziWr54cE/n9HxGWv7bgcpo9htymKyR+sweLA4wbQ5/vdf6xItwkyL1tgnqxbxeKWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
	b=CHpL1gyzVBXVbwoJ6XiFKzhRjrlFUVyn9W64q0cpKqVW1oYJfQqPV6/XqSiSOOgd+ClT
	 MFNrppsdna8nuTN4r1MBqdGeU0vily6ZJn/oeton2g8A4MA47vyi/HMjuGHj4aq0IemWr
	 wsBuOkQT42JWQ3peKjYFXBQuIoNl5S8oT97FoPfwBuofm6wtiPrkkXgD9HPKGyQM2aQQ2
	 nZtCI/MVdxJdrNuIDljbmd8STWbWP5dkNOddPc2u/K61Jo+Qz0Mb2NkfrpELD5Y6/DqNV
	 +jsolKEL6Sf9oXZ8lMDRKbYEMtyF7NQQ+jtV0AKc7IDvS1OdINwm4sEJdsp/HwZ3H/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxPIAMPC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ubz3XibC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A7606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxPIAMPC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ubz3XibC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F4H02391420
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2Qx
	wfGlqBj4=; b=DxPIAMPChMIrYrhXMLmGacWSynSyuxhj6XgEK89lPQv1PjxdWei
	mvjnoGFDicILbQd2bJUSNtE6fIMFlT0/gkYTqv/iu7Z9wLkHUKZCRYz6DfqPRXFD
	ok6rFWAJDCnkOLNLRuyqX1GRM3CWVlLlarrf/s0KSG6gX6Egn6/qIvLQ5jDxd60/
	xTf2zzI5xqtSGj7fjX+H6eOrdHq2LHb7qjT0mmg+hfP1ZZDVuEgnrX3fnNKDQ6b6
	AWclyhUMqQdCFucCfBykYOlJY29AyCkEtNhjNmySFzwroGQ9y0GPCgd9saI5nmMk
	ptY/ZHitiPXxsWTp291G4WKoMqrLq/awEkw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99b7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so399373eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549871; x=1793154671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
        b=Ubz3XibCc0xpaV0Me3NOVqiWrNnl+oqltfiOKiQnhtFf2aveEGir4Wzl3dukOx2/ja
         Ie/U8QRHhZGLqgpb6fCc/stRuPuOXbi+zhxjxJDm4Bx9Cz3BXs9Fr+g9dR7rhwf4nQea
         oRpmkA8sfrn2PQQe/FPMb9H0w8mPAhojOshyQTUi8xOco1hDVEh8g+8Brw4S/wFqzCrj
         yzQUYh9oNHWsd//bnJiJnt0nybU08/41RMD0d1CLV3bcmxlzKrl5f/B2sF2Mh7m87q/g
         0FDW1s94cmoEyeGvfQsEnV4F3naWnkvE2GwZbDy0bKhOeOUlaPbdxysMilO2sGG6mjMI
         2UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549871; x=1793154671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIYn5248m0VNRKQRQ9YHFmupNIJZTRVR2QxwfGlqBj4=;
        b=HbHCzUqCF8YsaxaFXqb+m73JLv+kLvawWcSEYnPjErE73DpRsiFwcbC2nh6zQ1wdTw
         egVtQNiu9H/Uw4+ePXQJCYhjlxO2CsHSOABWs+cBWk2ACW6XgrnTQUPIEw88B/uezbmi
         92sa1AZ7aChm4RxN7ZZbjLWqfUNGnxygtJVK5x4or7Hw33ZjxECh65LyPT31iHNnJA8U
         OGbDj9jBPiCkXc4dbUAbgjdi86dX6pkkpM7AB9xKb7/uyvatguazi9PAyHUwYAW+KOz4
         Te4GEYhB60YMgmzye03BE5Y2dbjOsBi7vMffIrrQf2FdxYCcQw+jMIX4lvNERqHCon7H
         sGGg==
X-Forwarded-Encrypted: i=1; AKwUvBybHTOCKQ+Wj2irj3UN4KnOcSgyoxt6FdBx2qAfBfZmuWx2LwVs7CmIAzvKKTmucc7z8ZXzEs6ZP2hMBas=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/kv7tCkC6isjzFbRvHOqQZJRVMSQwuN9ICCa+e/v06300T+fz
	26b/y03xOw20WvlIlELJ6drgs3MNiyBIblMlZ7S8GPuuuoO7ySgWa24rRHTCpIJAfZdD+ONDpXm
	RsSgljTB9Z1osl43RYxgawKibcHeKXOlorufe8D/mkfUnXpGOZdXTo/CibCid3aZSTLWHToTr8c
	zxvQ==
X-Gm-Gg: AYBFou0EWU5YssEl0N2iWzxokqLTsjZnKaAaE8bpBNupf1JPYLFbMI+rRdOI9KA7HyW
	MUpDDB1iQnuOPVqoSGM763TjHrFuN/8LL45vwmXfWtRgKEmeskJoy5V7qGVptPKHU6Yn7/2qBjs
	78coeZMq1gifMk0M7C1TCpiP3fMbEACzQRzwt8zPS3GBoVq6z7gHZg5RYFQMuFoHqC/ORUfYRcy
	j+ZX/OJDc/bXFh8dn2vRfcq2QkOvCMsXB3z5byyTtfUezhaEc/kwg/lq0WqaHccKW9ucJY3+A1l
	Kwm7Jq+A9APlC0QucgR4daCe7V7xbKJO6VGBFDb4OfkWzaEBOf5yrRFmGg3V00nZBAy5eCkGOcK
	eKCXQX2cz+Xzt0eTpf2QBm+heY98U7hmo0TD2DwzvYRx6nGH5nVQ+9Ta+Jmk=
X-Received: by 2002:a05:701b:2096:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-190a6705ad9mr904195c88.37.1792549870687;
        Tue, 20 Oct 2026 19:31:10 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:10b0:15c:1679:1cc7 with SMTP id a92af1059eb24-190a6705ad9mr904149c88.37.1792549869700;
        Tue, 20 Oct 2026 19:31:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/5] arm64: dts: qcom: nord: Add PCIe and WLAN/BT support
Date: Wed, 21 Oct 2026 10:29:15 +0800
Message-ID: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXxHCU1QCDklPo
 YEC2K634m9gxSUWmVpX5anE/aKRM3GITnz8OX9MDld68z5pEes3dg1fMbzfnIJaCG0u5rOHI9F+
 FbRclW4nMZ4MfBlCUmaab/20femEHzU=
X-Proofpoint-GUID: CbpHaF_rWn5DupYwnywNBXPJHolWYS2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX5f8/JqdkJII/
 WhhmaC72OhKSiv9H7x9w5dXcuWrNYeBvfeTHJDb9e6W96SIqBAtLPGxHTNRA46AXzlnE9Sg8iMu
 UqiyyZ/pfSgDrd0hHdmWCBoQuNOZ9zYFI/UUAiqAGvzwM+oUW/DjbdoiJsQGWiwukF+rH0cwJTj
 Ie9VmrtpmjX7IU9+e3wREbd/QUF0o0nHqJpekB+iC0/gXIfX8Mig2IvD3xRPVm6ifrKGwE71XsS
 4olckg/SvluWJYNz78zxrc8FIifhB7Dsmec4ViHnyHAnxr/K3r/B9M0dRf0PpJi4/k73mD2iJIi
 TCRU7NXkacf2KJ2MZeqMwyO9FL1z3Hhwy38T2entW+pIwUu0hWPgLCpPlSPnxEyUATGV120Vq5W
 C46AIjl/nJCESV6pvHc+fH6IpNfDJO9Pdt3lYjziF9DFX/X0uRHx32suRNKlH8m8MdBvaWipgBn
 WXpqsIA5qvFitNjloKg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad823ef cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=STRuL8VrElODx3xkHkgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: CbpHaF_rWn5DupYwnywNBXPJHolWYS2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

This series enables PCIe on the Qualcomm Nord SoC and brings up the
WLAN/BT modules on Ride board.

Nord has four PCIe controllers fed by a single quadfurcated Gen5 QMP
multi-PHY. The link topology (x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2) is
selected by firmware through a TCSR register that the PHY driver reads at
probe time, so the DT only describes the PHY ports and hands the driver
the TCSR handle.

Dependencies:
- [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
  https://lore.kernel.org/all/20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to the unresolved dependencies
- Add PMIC E GPIO7 for enabling WCN DIG rail that feeds the WCN7850
  VDD_DIG domain
- Drop RRD WiFi patch as RRD with WiFi module is not easily available
- New patch to add Bluetooth support for Ride board
- Link to v2: https://lore.kernel.org/all/20260915015632.283642-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Add missing leading zero for pcie_smmu reg property
- Link to v1: https://lore.kernel.org/all/20260914071944.164217-1-shengchao.guo@oss.qualcomm.com/

Krishna Chaitanya Chundru (3):
  arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
  arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
  arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY

Shuai Zhang (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support

Yu Zhang(Yuriy) (1):
  arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 926 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 179 ++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  49 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 297 ++++++
 4 files changed, 1447 insertions(+), 4 deletions(-)

-- 
2.43.0

