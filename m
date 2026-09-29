Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076B3D47DA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697222; cv=none; b=bVADrBdIKhnUV97EepCNy5rxx/SRZ6nQJ73xHdQHc3az/ZjYREXbHbXjw/H1SpS7sPzrGK06XSh3BSPdwYH9Wa5T4vsnzOIjMS+MQZJh2ty+621reYDsAm4eUc6zF9sb5OHP8uYXSbGSLyQfMlRe+nNb9Q0xfCzoclL03ktnWYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697222; c=relaxed/simple;
	bh=YA/Ye1iLd0aysmqI+nxzdN9guijYJHSSRik8bUWwy6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Biv7vJth9gE5Jb2BCGFcjDr7nfSk+OVcnFyfJZtL+psVWTPaqqytV4a7a3pL7WtaA2WVMd7wAKjoPeE/9boZAVIeiJAdQtN/ytOaWCU3E17zR1z13mOz1GtRjcyFx5Dhdvpp6KUGiSKttFdHnkLtrMf7YTteNXWygHYyVpevSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kckhm+6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROT7+G2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kckhm+6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROT7+G2z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCvsxX3300547
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnoss
	kdwG5XLY=; b=kckhm+6nqDNSq7tFRzWlTBTIApuMNr5rVKIDIJzFCviKuSkzGjt
	WUcfHTamc/sM2de5IGX0A9OnytZe0sKA2Zf3V/5KKs+CjzoW16ZCi7hVzZMgG4dn
	NfLMPtkZ+hBAjCylYdChRemoiYwfOK+xBYSj/C+rNBlGQ2EQv7x31vY50GQCemo2
	2jBdLp9xryvKlg699upiraO5bskI4uiuXYFEDHkn7CG2aFxdqIuvddsstpzJq+1g
	MHHVLqyUD+oJge8tfs9kPMOeYI2CVG2szugzf/QAVvq7FJz12nH0RbtS/7r/cJkI
	K4UMdKrH7ZgK6WcfYPDRw/+J88p/r8e4g5Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0uce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so3734781c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697219; x=1791302019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnosskdwG5XLY=;
        b=ROT7+G2zXLym+MsBUvQ/1tt3XNII70ZnjXuz5v5ODXm8k1JyDIYj4yq1Uac3eqFk6g
         0IBt//4vWjPGatzARMMKjwHTZ1zaGSdjwj2rL0T+nQLM4mqOL2S8QdqmHNlWVP8YqRA7
         GLTn6TlbnNf2ONZ5C64L+2K4305Yo0FoEMzOaAEwzVFPeI+POQVwa3u/20znz75ffBtE
         IlO1InTQ3Yyio4gckWINwAFqeiXiORdYSEirL1kbXl2o31P/nt3bFqjVbKiK/qa3cemf
         PzIWUdY1Z0tZ6wwGMdaw0cAUsT9ls1EvQ/1j0I6gL7z0fu6CqsvsfdxtG7My9XVeoO4+
         1R4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697219; x=1791302019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJSbFH5x1NFxwPEs4kTgdG+BRI6BjMAnosskdwG5XLY=;
        b=FN7A3k7TvVVvsehA7kpgYXv4+yo8i2ns6YtBxgLMueLLrV0ElZKkHYJwugfx28SPhW
         qI75ppRFQ8Ylm0+YTQLKA1Pf+R7GgkBqGWem8ELpNhxmMVaakUL4HDIQErbWUc2u//6F
         Ze+TX9AT+oHMfeo1Ip1eouIosi/IJUt8hsFKGzh3oNbg+ycw88JEzpnOUSsJ457RTK2B
         bCtNF1C0v2NtJwNudbg2gBMHB9rcizpmBW1XwPeNJRElLWXdR7cAurISk3QyIgu1B2fN
         1xijJvpRTbMxuFXvOYiQucKViauBhrd0XQVYSPEpSAbysCK3uittYty5AJckaaeGXLs2
         Rzgg==
X-Forwarded-Encrypted: i=1; AKwUvBxoan2r38wxqYUD1aRXGY0NWdDFNjheowtIxwejIQQ0lM1kDNvh9dAag6yXjpnV/OwsstdQ7t85zIhfS/0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/V/oEgeHmTnksW57sNhGyAFOcdW34duP86YI4ApFipw3A9dAC
	ZkvGC1Apfhw6Oa23NO2Yy+7BvisE+HtAA/kU242u5jpdss3+v9CCNByVMco6HevuuV5Rr36HUox
	q5bJkFs0926RZau4RmZFzsq8snspB0HGtQwuRLSSWlhjJ/WKO1gJ+rFSewx2/y6jb2qI=
X-Gm-Gg: AYBFou3QDW8LjZkiLlQHmOy2LN918gTBUNbic0qYM5+Ra09lPZMHwubGgCi2mmBglEM
	Y8Wr5gNHh1gha8Hosmdkhiai9aORE0PmimKb22EfOYD9UzVQDvRWxQ6NME0+mzY0RKFj7//LboW
	b+Ny77ZvzvfKCkHD8BK32Y7Wng8fVHsoxGkWDxoMAw9ggWsgEhwfVeJyxG2hTEmIln/FrKTWnSD
	MVPKQojXq4z2R1d0y5ETM6SW9e1qrqByTEjJNIBSnFwv1MQKLHGEltq4QjOS+UhCkFRva5MOIBP
	Ajjw3ve8gwq53Os94NTOEZV8goqUeyHTDaiAILXs+X7D7ExY0ZqmEQTi7+h3gToZ9cEbUgBLRvm
	GNYZt6j3Lid5JfB82Wzdfz/CopvAtgQHnbWUp+A5vTh2Mi8D1MaI6/khaFhQ=
X-Received: by 2002:a05:7022:f515:b0:141:4c37:a212 with SMTP id a92af1059eb24-146ce1a9977mr15547665c88.2.1790697218964;
        Tue, 29 Sep 2026 08:53:38 -0700 (PDT)
X-Received: by 2002:a05:7022:f515:b0:141:4c37:a212 with SMTP id a92af1059eb24-146ce1a9977mr15547617c88.2.1790697218180;
        Tue, 29 Sep 2026 08:53:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Tue, 29 Sep 2026 23:51:45 +0800
Message-ID: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2UA+dMDY7+uE
 a1F6wUxgh5St4jzPNzCUAzfWuBnRUpKYxAdChWATT5KtYrV2SiTUfbH33DjHHlyJTSYM0c3xJzv
 LzHya0z1HJNe3USrqaE64fT2/HslvzLCvej2S6S04e9DbkPp2YEz95BSWMP7YG2gsYSexeID5I7
 eBq/dXoIXYL/IkmRQ8P/0Uvgypmy2rNUe25OxnM2stU1x2MfJOD1ZplZ/aX2Nca7gd1xpi6msO8
 dSeU3Sdz9qZPMb5GcpGVYq5x9xpN2BM9sbs1LutzJgJO6I/uhASX/Cxiot3JZSOubYk9z4dELNY
 QCmUOWe0Ab0O7NwcjIFHXyD3YM4Sro4SnscyIObD79Xvw5WNyg/y+rjsFeeOZrWYXMUEkxagAl7
 EK8n6cH20QQVU9jngSzjwtxHwi0RYTamSQ5tWcN0wu8uaPEAD+2uIcDjgDqUvmUTA9vjCgkA6Jp
 VPryOrzIPkhIL7DLvuQ==
X-Proofpoint-ORIG-GUID: m5BKlozvyBXmFi47BB423Mt4sSdkBcyT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfXzcSnQaJiE2Rh
 AQP2ZIMBIF/OoXN/qSyZO1pfRxHxPDLap3R81u6TVBMwTJPOv4tNNGuZ8ieG/RfJmvA1Psrx1/B
 FAU85B9F3uonjU1AxVtn72zL3oW1TI0=
X-Proofpoint-GUID: m5BKlozvyBXmFi47BB423Mt4sSdkBcyT
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbdf03 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xxUIrTjmZCIhaGii6OoA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Tested on next-20260929.

Bjorn,

Due to that RTC maintainer is not very active this development cycle[1],
I'm including the PMM8654AU RTC change in the series to get it route
through qcom tree.

If you consider to merge the series, please pull the commit e484a765f543
("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index") from
Ulf's branch below to resolve NMXC defines.

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt

Thanks,
Shawn

Changes for v4:
- Update firmware-name for ADSP/CDSP to align with linux-firmware,
  i.e. adsp_dtbs.elf -> adsp_dtb.mbn, cdsp_dtbs.elf -> cdsp_dtb.mbn
- Use the same firmware for all 4 CDSPs to align with linux-firmware
- Drop "Embedded" from model string for nord-ride-embedded.dts
- Include PMM8654AU RTC binding change into the series
- Link to v3: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword commit log of 5/6 as suggested by Krzysztof
- Add memory-region for ADSP fastrpc node
- Link to v2: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
- Drop unneeded regulator-always-on and regulator-boot-on from RPMh
  regulators
- Drop SMPS regulators as the resources are already managed by rpmhpd
- Use pmm8654au compatible with fallback on pmk8350 for pon, pwrkey,
  resin and rtc
- Link to v1: https://lore.kernel.org/all/20260831032103.341633-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/arpTJAyDAAuAzPrv@QCOM-aGQu4IUr3Y/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (3):
  dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |   3 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 +++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 907 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 10 files changed, 2195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0

