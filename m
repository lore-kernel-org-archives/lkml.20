Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452250;
	b=VezpCRft2Zyo6kCZo099R2eK3Tbv/POSc/WDjP0vxthV2GffjQjZV311PyGxv6z8xQ6N
	 c3hySxweQYS10ezvPMKt1L7IvoHNSlUUsbeJSzcjOjqA6XZbkF4r8sMHHairqhj8vKn4B
	 B1HHh0FMYpSOWmIK/W1+WLZrQWXjmPKmP3pFrfgPNxhC7lr3OwN/+EMasqkkhZ1xMCQQG
	 p4LKbKlsbqZpzMdbxniqiSvx7M79YVS9tU88H340bhmxs0fWv981g7kD9AnATH4OUV3JK
	 N8vG1uIfihcFpG8MpIH2MARFOvCwqgftgrpxVxr/kLR2rU6BXg2wr2OgYYenJYn8Vew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
	b=4iKJvLnXiRu2kj4qjKZoCocPw0pnEgoQGmEdCI60e2jGMa4KRsixvmZCyTkyNC4Jo93j
	 bA6w9B+KEAki7ZgeOXPCne0S8cwijwIUFIEXyb9U8CEP77eL3qxeK92k1oc7ADu0dNr55
	 4M2VajyKZZ8rzxAdN9iTgcRvjZGLHQWx9fiJeGqe5IFK3IEtyKyvBVBgbmFB3SdGQ62Uu
	 luWl96ghYN3w82/AhiTN4IlY+vTmRFS7oJylTp2W+fyvh88JFaGy1xixIzhHnOq0cl7tp
	 CXzpxtjVuZloP1YS7frw9dix/04iGUJ14+A2CL4kRiOw7Y0V/9hGC/fhkmYy7f27njw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C6606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 791C6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XewZK1f0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyovGDIn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD00Rp589439
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBG
	jFfjz854=; b=XewZK1f03Y09b3WxwuvrLwzAXwW8z1ZKEn8qZJkkjL5lcKGlf0c
	CEgNXVXug0B+qB8VKhVfOuzQbVWOJ0NhL+ImEx2IeWLfKbb8YLL0pJC02WRBR4mO
	9xHhrH7dSztg+6fl3ghIUlhyN1uwqXbzzB6tpIOrtx021HYrNd7or2I8gZTPLc/f
	uJ8zlf5NcI6D1wUUpESwmWnAjuoIAM1rMfDc6EgddUdXyZvK/lx69mRgJY2DJI5W
	U8cul8D9xbwZepVcEc+yGj0RpMGq2aJCcIkalAEDfd/8+yvmPQ7pY++dAkH8LCGe
	74N1fAG8E/t+MQoTVdTKkbJSr+vN0V/zMVQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0ygs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:10:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2485593c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452249; x=1794057049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=jyovGDInC80ZC2XJpvG/J7eLev5aYPDBg96cKm2HH2ZSY7jm1rtQg7ab6h+DA1QRX1
         F06OrWyg0NgpioRsR7BJVURh6tamuRVWEzTQGpCs98qe/qPmi7GedQ6rCmWOomTeb0AY
         Bx6EhwHTz7GiUJUtV8yhU3/er+QNUFudGfZDQVdBwyab3IRm9glYIgZruzqhYAUZu2bO
         RuCE5VkWeqB8lqbgF4Gvoil8T35OPp3CplMu2WVTVq6lVwOtiOkG9Uvapulj6ctariae
         DwkVcv9BjGSGXgAFErG0nO7bmj1m9DRsbFbDqm89VkRHF21YYKBT2+ow6b57SjlxyN7J
         OB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452249; x=1794057049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duVsG64Sl0l3TykskMHzQEgoMi89wQI8nBGjFfjz854=;
        b=k/MZ11m8SpoZRCR++F8yWk2ltFE2Y/9R6yAvMwjFFmhPMSVVYap8viojqCAaZ0P2hA
         /tiizMwfL8RVHIjYAdM0uYp6+6/I5vjPcAnkSY+uGH7+j0GYmkWSaYOM/jtEXFMw2USD
         0DBgvo0gJjQrrsB+cqF3aqj7/JD9pMDnjiQmjYFzhlRR3BdY/a94ctVyvtEOw9N/Rx/2
         u4M/Cb4sUPMU16vixHa3VPps73m0G9+Lu6HWQh+9QeIOqIQNTtksUzdJLQxaPNAwzvYt
         8dS0pizXPBcO5Pmuii+DkeVO+6bL86orhBa06CxXXxNfGHMtNTN7x9R5SzTImSyvFlCi
         ZPNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy32L10Q0BYPdg0CmcTts6umYGuHvV8clwYxNog2BjfYO6Dc2I3idQe1ZdIkNfH1X8bNXUKS3oP2S99qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7eWRI5Bi08jvu//9kAMgqqQ2yM0jJ5AT+4U9MvDBnLHotC4jk
	SBf6mtQjhD1MfL+TKHqYA5LHnTWYLgh+1zIcjz6q6u9yWfbl1a4ME8O04+yQJhMbyEUsszabdNE
	+9Lf0aXOCc5LpEkO6ja7gL4cAsJgMphW/kQPfN0Jvwxn0abeNnu9/sAyvAv2cGY2oRoE=
X-Gm-Gg: AYBFou1E8u7yOdGdCnbHsGv3SZ5JDLk8+2Sq5z8WoeldNh3DRXP0TCkR+6nL9zvpzkU
	2fQHAPC4F9QVK02zK8oPc0qrwk/ycvJlPUuskGApsmCAoZvCCpY3STyFhCg0dQu70I5bUSZj0ax
	G8fmV3qfZD/4b9tj4wsThpeT2eaYAPjeFhJImylyPxb1VkPwBTXJfz8YK9pFBVVFTxabl8pNhNI
	lygsupw7RyJ9GKBhpMsHBNCnP+5Ewf2ur21YhpdChRysAj/bZ7mcXS959JShFJmHGmGwFZnUO9B
	wdY0M2dRqwZuETDz/FTML1OzCjRIgXTY8bwEHYYFVY4qC9XnDXwhCya1k8s+xXU0woxehAbNW3n
	oZR589mWwqNhWnxSMjdC3T2NcEztwF9r7c2M8UU8YlsUhRE2w9UQMfhC3asdWQd90p1XteRjmfY
	BdVoq4L47cTHFcZ+qF5EBmRMCXjUT2NOzb
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919202c88.14.1793452248701;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
X-Received: by 2002:a05:7022:285:20b0:1ab:f77:2977 with SMTP id a92af1059eb24-1ac5b027fa5mr6919174c88.14.1793452248139;
        Sat, 31 Oct 2026 06:10:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:47 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: dts: qcom: Introduce SA8255P as Lemans family SoC
Date: Sat, 31 Oct 2026 21:10:36 +0800
Message-ID: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: t5yVSPlUokbJmmOhYjZximuulV2jTWOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX4hGJeaUSJ/LZ
 VrVJmonvTmiQMulhUXhWAmophcetrIY0dXu4F1ypIpf+B82Tc5WUMNxZNCa7Ln2yCpAb74ZhLfF
 wPtMPLNVqHmzvJ3xHmC9NjpJDQXoSH7xQ6o0nFHaNhHx9kDJZT6FyXRTEFZ1YjLfcXYPeAfXrSX
 Wr3cGsDjNRb7R/bXoPS7APng7EVvsCSceiMAYdej4nlkRF2kNHIZ+GDGUVQRkpcUP0OizGmGD7M
 +7a4jjhFcJftnnmcij2iZhkq60kZ2tdylaX/1XuS3w8h5Ko0spmJ+4XRPs7oc9OaDhSItKABZUS
 fxhi6uRvF8DrG71z/AW+PuuAkk1ECsJuUdLn4/7AHkPzx5MG+Q5EMqeS46Sf8euHn+HoJ3+osky
 r2KNt4mUT+ig7MSFECNtglN8Ge/L2iXzD3jDsobuJwLjWhJvU58GoHiJ6HFFgbNL2MwiN0rDdH1
 XLg/ViOTiRb95EyFGzg==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5e8d9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QWYla_iuZz5IAfy8WBgA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfXyQ3W94FKC9EX
 pnM3tdO364zefeRFAsMmmP2dRCrt2zmgRGDZvIp95VJnDhm6jjAINs6JuJjnZyO1+3gYG+QuOPU
 BFLNbLPmrLjRbT9WQ3f4ws6kMvmNiU8=
X-Proofpoint-ORIG-GUID: t5yVSPlUokbJmmOhYjZximuulV2jTWOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

While the patchset [1] supports SA8255P as a standalone SoC, this series
offers an alternative by introducing SA8255P as a Lemans family SoC.

Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
platform resources like clocks, regulators, interconnects etc. are
managed by HLOS, and GearVM variant (SA8255P) where they are managed by
a VM acting as SCMI server.  All Lemans family SoCs actually share the
same hardware configurations like memory maps, interrupts, DMAs, etc.

This patchset moves those platform resources out of lemans.dtsi and gets
them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
overrides/adds properties as needed.

Changes for v3:
- Rebase on next-20261030
- Squash patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory" into the GearVM patch (Abel, Konrad)
- Add label for scm node, so that lemans-gearvm.dtsi overrides it by
  label (Konrad)
- Override QUP I2C/SPI/UART nodes by label instead of nesting them
  under qupv3_id_N, in both lemans-embedded.dtsi and lemans-gearvm.dtsi
  (Konrad)
- Use SCMI channel 9 for QUP I2C and channel 10 for QUP SPI power/perf
  domains (Shazad)
- Add a comment that the SCMI doorbell interrupts are updated by
  bootloader (Deepti)
- Drop unnecessary linux,cma node from lemans-gearvm.dtsi (Konrad)
- Clarify in the GearVM commit log that TLMM GPIOs controlled directly
  by kernel, e.g. PCIe EP PERST#/WAKE#, are not abstracted by firmware
  (Konrad)
- Sort top-level &label overrides alphabetically in lemans-embedded.dtsi,
  lemans-gearvm.dtsi and lemans-sa8255p-ride.dts
- Link to v2: https://lore.kernel.org/all/20261015023711.721837-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20261009
- Drop patch "arm64: dts: qcom: lemans: Move PCIe devices into soc node"
  which has been applied
- Drop patch "arm64: dts: qcom: Rename lemans-auto.dtsi to
  lemans-sa8775p.dtsi", as lemans-auto.dtsi has been removed along with
  sa8775p-ride boards
- Follow Nord naming to rename lemans-iq9.dtsi to lemans-embedded.dtsi,
  lemans-sa8255p.dtsi to lemans-gearvm.dtsi and sa8255p-ride.dts to
  lemans-sa8255p-ride.dts
- Move linux,pci-domain of PCIe RC/EP into lemans-embedded.dtsi, so that
  lemans-gearvm.dtsi no longer needs /delete-property/
- New patch "arm64: dts: qcom: lemans: Add label for firmware and
  reserved-memory", so that lemans-gearvm.dtsi can override them by
  label instead of duplicating the node hierarchy
- Add SCMI power/perf domains for QUP I2C and SPI controllers in
  lemans-gearvm.dtsi
- Link to v1: https://lore.kernel.org/all/20260409091100.474358-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260304-b4-scmi-upstream-v5-0-f8fc763d8da0@oss.qualcomm.com/

Nikunj Kela (2):
  dt-bindings: arm: qcom: add SA8255p Ride board
  arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support

Shawn Guo (4):
  arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
  arm64: dts: qcom: lemans: Move pinctrl states into
    lemans-embedded.dtsi
  arm64: dts: qcom: lemans: Move platform resources into
    lemans-embedded.dtsi
  arm64: dts: qcom: Add device tree for Lemans GearVM variant

 .../devicetree/bindings/arm/qcom.yaml         |    5 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 3685 +++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       |    2 +-
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi   | 3224 ++++++++++++++
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     |  222 +
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 3371 +--------------
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |    2 +-
 9 files changed, 7147 insertions(+), 3367 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

-- 
2.43.0

