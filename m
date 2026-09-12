Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526AB3803E1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253588; cv=none; b=aLE1k1orhVvRJ1aWQF4wSZ5repxXH0aAunCuNKBMXBhwZwi/D6LvagTvcWnhNHEHWVdmxXRD1I3+S0YQrvjdlTgTSoS4/7ngPOX1433zgZsr1MAAOd7C0XuIi4j5iYGaZiXPojbn4tKLiLn4fO1u0w2LEqDCaeR2kxY12rBPHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253588; c=relaxed/simple;
	bh=Wso0gz6bbwnq27ZeZscVJdsCyRDUFP7337Y0n047Hwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=S5BLluj9moUqcQ0kZedP6KsCdCcYcdI6g96CAlv9JzWvzZeOg4hyo3l7s6q/h98UHS61ZHOsywe9kmIBwdk5E2PFVPf3WDq/64fZRca+Gc7zq66tyNbR+pB0T6o9BMMqafx1/XmNM7rdkdydlVOjaaL97hO4VGlJosvDJUdYZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSObUk0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAeaBLmk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSObUk0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAeaBLmk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CMPX0S1152032
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qo/alJEy7vIo96KOTMJ7e6
	M3U3FLNM2uacOSRSZn/+Q=; b=PSObUk0TqW1tzBh+Il1+sgE39qxNWbRVcnW+nV
	98PXPfqV/3mOucWC90QaNdkMQgHuS6jMEOKubhDXX0ND3FuEX5c2UV9LdUf94nU4
	nAfibdP/HienL44bojmSfH+NaP7SZtOHE2Yq80l35T6S2l/eXQXe1gKrCMpnAlVE
	V/mEGuHtgX90bm1GBT9xYqfBWkoMOSdoo0gzt5LrLQwE76igY9cK6W0ZzuRoj4MZ
	3BOyV7xQjiIoc21OyS+SQaNdlMUwxZ0q/wLUE+709W0lSeGVU1mZwqcTfw0qvgTg
	P1oNyFsGiBuPSMtRgH8gJvKHaMNrzITLd91EDxIlYxSF1p2Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cj2qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-399311947f6so3904483a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253585; x=1789858385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qo/alJEy7vIo96KOTMJ7e6M3U3FLNM2uacOSRSZn/+Q=;
        b=WAeaBLmktbG3HIJ/HF5TP5l2EMOoZvaL4OHoGE9lpE+Tq2DaNOqOkEWjCuibPzMZH0
         p4aZGyyw7DBnobb8k7AN1Qx0MLRHxii/jXQVl0sXkdtCqbQOJKOXJPxB3fhYpqODGmxg
         L73+snq2C5Ctz79uJzBdP6bI0ETZF0McqJ1ObmIi05qhAVKYfzp35zi8i/4GtYzTkvVC
         I7HEB6IMrpinIL3FuaAwT+C2Z5ewRceEKSLCW3n22Ag2rplApE4kmvYWh57t/KIhOBum
         yx80VwQMqTnlIFX3ZvPEdVDXsrb8bpzdxAB8jahe1U69FBkdVIaWgqDMKf8nwzX8v0dy
         BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253585; x=1789858385;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qo/alJEy7vIo96KOTMJ7e6M3U3FLNM2uacOSRSZn/+Q=;
        b=f9LOUvV0gS9HdkBZ00CHuBeRR5tiv/g4zOlfcoOuRnKX+mlSACEc5+Tft46Wb4nVhJ
         IY5H3/evmFUAUGjpPHXVMLUZK3OfDrnf1LwlyINwIC9Q2cVfQtCSJf+dMu3+JuMeLSPW
         Zg6+DCdSdsddjCGXykrWQ5RBoz5yTtrH95lWA0L9oqiPDapMDbdjYI+EOIgRtmPOSDbC
         IDUMGVjEOG3p2u/KVozXI0VElqoev3uak46HknHLpBln5ddpeapkxfqlUNYivJl2ExSq
         nMgSvbL31kt8HCY3j/Am3ivteQGvsA53qiRx5e+7xETioAw28RUeFFtTbbnCUjOpQrxF
         Jyug==
X-Forwarded-Encrypted: i=1; AKwUvBzH5VDD773efXH97oSmsN2B9ux8plWjlmN52xnTp0032TMkj5R8x2Eb24rurDq42fMSrCO1greiDsrAGnE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7SwmkplTT1LikBWBLGzGmi5PMTqGu5ruzi33wSL/Pe3dxpwkb
	OIpvez2NBty9uUvj5ysndAImacKiPB/xXoOjN8YP11lDNXIXhbNHIE1QIiRigb958+8nVrnSRVD
	DMr6PipvCkRJDgaC+1HvP+K1v0iM+249yFAbqbw0omQLhdpEW39CY+4Kaqzbgrqz0+o4=
X-Gm-Gg: AYBFou33QEyS0xsQ2l16neB3wD9p0iJ4ZWnIU47IawITw3ziE59lY9Bd9IS1aet7Gyk
	uPheiaGBUtFMKPzpy3qPH+X6EpvwyDICJxGy+hS1T6/jE1nNKnYLW/R3r3TcOhMnBz1hju6ilh6
	HHZah4uplYP1LdE88a+NJaMhWcor4eBQb34yPSLtf6zNvVjPUPsrR8aaYukZwldraCloojOgi9D
	SrqwJMJZ/rDnzPH4XaYXg27Mb/QNm6/wCw3MtkreIxtJQg2K3Bw6uP8ZNCainPsHr9a1QXIqRke
	/YHM4aNKj3MzjMZczfSdFCoFjTMJiyzoKtNrLt5CbGaFxIREZZYJGynQF7vGJLcADGveeevtxj8
	7FcXHXsgQzz/k10hpNuspwBsL90aYYl7zo/tQebp1+RODeM0k7312dw==
X-Received: by 2002:a17:90b:3807:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39dbc6a018amr8215154a91.12.1789253584640;
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:39b:2c55:365 with SMTP id 98e67ed59e1d1-39dbc6a018amr8215106a91.12.1789253584121;
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:03 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/8] Improve Qualcomm EUD driver and platform support
Date: Sat, 12 Sep 2026 15:52:53 -0700
Message-Id: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX/YXt6wuhz+Tu
 gy621pvb4P23CUIKMchicqGW27r62lhPDxmGEAoQL/5L3e6WJwdug/WuTlYhZaBBYg0PiglbOZ2
 g7aMtT9qtr+gq4KhuuFSxoaQfXLbWb1Yd/j2v/l7riS1NlyL07ZMuOc9XCbPlNmwI+1BaNn5oz2
 JyEqT5Mi2812SimfPf3wjyV59UBrr9uQjoEfKeb9wv4XU2aqtUq2wkK5qCHjr/5n5MiOYBgKOcQ
 O0W41U37UHBBQRYqiqIEOzg4SQ/IWWVTLLI9iwH5pAe8hyoI7znr6pvxxWiR9dmhGbLBSy8YDQS
 jWPtYmWaTeYVnemDH5HoXUlHZIyQNR0dsTyhAmFmgEZqIPJbOIs7CqfdcQ1ss64/zVH8N3n4wZu
 sljvPluK5gJOi0yBS1eE/E7LWQkyt5t70zEcpWwCzjz9a+tBM5HLOgVjRv02/KEFH72HP4cznAX
 6YZ1BHtEHIYOA1BjePw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa5d7d1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wYpSvYA4TNd1uGNCPEsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX3kkSefVFQ4YW
 /DP74Rrj9PPCd5eCaYzbEiMw8UuoT4MjcLKyJssqekKfEmSAtC9vsx8Z5Kf4ddL1xAM3ZYO+j/h
 5L/+q7hgvTMJs0W6kKaLxpv/z1gmTdw=
X-Proofpoint-GUID: 6548M2Fnk061fgFrOtAjAkdes8Dbb8BN
X-Proofpoint-ORIG-GUID: 6548M2Fnk061fgFrOtAjAkdes8Dbb8BN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
provides debug and trace capabilities on Qualcomm platforms. The current
EUD driver, however, lacks essential hardware resources such as PHY
references and support for multi-port configurations. This series
addresses those gaps and introduces the necessary device tree updates
to enable testing and validation of the enhanced functionality.

Below is a high-level block diagram showing the EUD and its connections.


			              EUD Block
 	                   +------------------------------+  
			   |                              |
[Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
			   |                              |  
[Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
			   |                              |
			   |      +------------------+    |
			   |      |  EUD Debug Hub   |    |
			   |      +------------------+    |
			   +------------------------------+

The series has been validated on the Qualcomm Dragonwing Q6 platform
(RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
interface. For detailed usage instructions, refer to Qualcomm’s Linux
kernel debugging guide:
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd

Testing feedback:
 - Konrad Dybcio reported running a slightly modified version of this
   series on Agatti with no obvious issues:
   https://lore.kernel.org/all/8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com/

Regards,
Elson

---
Changes in v8:
 - [Patch 0001] Require '#address-cells' and '#size-cells' for eud-path
   nodes to address Sashiko bot feedback. 
 - [Patch 0004] Set path->curr_role before forwarding the role request to
   the controller, as it reflects EUD's view of the role rather than the
   controller's outcome. This also addresses Sashiko feedback regarding
   EUD hardware potentially remaining enabled when the controller fails
   to complete the role switch. 
 - [Patch 0006] Acquire the lock in different execution paths to avoid
   potential races.
 - Link to v7: https://lore.kernel.org/all/20260831030147.1500616-1-elson.serrao@oss.qualcomm.com/

Changes in v7:
 - [Patch 0001] Explicitly disallow the legacy ports representation for
   SM8350, as pointed out by sashiko bot.
 - [Patch 0004] Simplify fixed-role handling by relying on dr_mode directly
   instead of an indirect USB_ROLE_NONE check (Konrad).
 - [Patch 0008] Squash the Kodiak EUD board endpoint remap into this patch,
   as applying it separately leaves the OF graph bidirectionality broken.
 - Link to v6: https://lore.kernel.org/all/20260811213610.2956147-1-elson.serrao@oss.qualcomm.com/

Changes in v6:
 - [Patch 0001] Fix oneOf schema to properly enforce mutual exclusivity
   between 'ports' and 'eud-path@N' (sashiko-bot).
 - [Patch 0009] Extend the eud_con remote-endpoint fix to
   sm7325-motorola-dubai-common.dtsi and sm7325-xiaomi-taoyao.dts to fix
   "not bidirectional" DT graph warning.
 - Link to v5: https://lore.kernel.org/all/20260803031534.2942628-1-elson.serrao@oss.qualcomm.com/

Changes in v5:
 - [Patch 0001] Add a compatible for a SoC that supports EUD over two
   ports, restrict paths based on SoC hardware, and improve the commit
   message [Krzysztof/Dmitry]
 - [Patch 0002/0003] Document error codes in ABI doc.
 - [Patch 0004] Zero-initialize the USB role switch descriptor [Peter].
   Add a dr_mode check to handle cases where the USB controller
   operates in a fixed role without role-switch support (based on
   internal testing).
 - [Patch 0006] Drop eud_disabled_for_host flag and control EUD based on
   device role entry/exit [Peter]. Allow EUD to be powered on only in
   device role and defer enablement in other roles until the port
   switches to device role.
 - Link to v4: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/

Changes in v4:
- [Patch 0001] Restructure the flattened ports representation to a child-node
  based model.
  - Preserve the top-level 'ports' property and add per-path child nodes,
    so that each role-switch path is described using its own OF graph.
    (Dmitry).
  - Link to the discussion leading to this design decision:
    https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
- [Patch 0002] Use explicit port names when selecting the active EUD
  port (Greg)
- [Patch 0003] Use a scoped iterator when looping over child nodes and
  drop redundant EUD path validation checks (Konrad). Preserve support
  for the legacy top-level ports description.
- [Patch 0004] Register role switch per path and forward the role switch
  notifications to the USB controller.
- [Patch 0006]  Add host mode co-ordination based on the role changes as
  per the new design and drop the custom API that was used to get role
  notifications.
- [Patch 0008] Described the UTMI path as a child node with role switch
  capability.
- Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/

Changes in RFC v3:
- Replaced the per-path (eud-path@N) model with a flattened ports
  representation based on the feedback.
- Added port@2 and port@3 to support dual-port configurations.
- Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
  and role-switch information is obtained from walking the OF graph.
- Updated PHY discovery logic by fetching the PHY from the controller
  node/fwnode, and exported a new API for the controller to report role
  changes. The dwc3-qcom driver now uses this API to notify EUD on role
  transitions.
- Updated the DTS structure by moving the EUD-to-controller port mapping
  into the base SoC DTSI, enabling EUD by default, and adjusting all board
  DTS files accordingly, including adding the usb-role-switch provider
  link on connector nodes.
- Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/

Changes in v2:
- Improved commit message of patch 0001 and 0003 with historical context
  on why EUD worked without PHY references on single-path systems.
  Expanded the usb-role-switch property description in the bindings file.
- Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
---

Elson Serrao (8):
  dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
  usb: misc: qcom_eud: add sysfs attribute for port selection
  usb: misc: qcom_eud: add per-path High-Speed PHY control
  usb: misc: qcom_eud: add per-path role switch support
  usb: misc: qcom_eud: improve enable_store API
  usb: misc: qcom_eud: add role-based EUD control
  usb: misc: qcom_eud: fix virtual attach/detach event handling
  arm64: dts: qcom: kodiak: Desribe EUD UTMI routing and connector
    mapping

 Documentation/ABI/testing/sysfs-driver-eud    |  19 +
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 ++++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  37 +-
 .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
 .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
 .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts |   4 +-
 .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
 .../qcom/sm7325-motorola-dubai-common.dtsi    |   4 +-
 .../boot/dts/qcom/sm7325-motorola-dubai.dts   |   4 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |   4 +-
 drivers/usb/misc/qcom_eud.c                   | 350 ++++++++++++++++--
 14 files changed, 545 insertions(+), 75 deletions(-)

-- 
2.34.1

