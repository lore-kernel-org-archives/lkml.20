Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600046;
	b=Pg4yJsdhOD8mrAcct9JfD9eALMYSakeZdjnz2a1ZgPyRRpK17P22/vvuA5WoiiGHC1fj
	 UiSpZYaj/fkOb4DelR/dw7F/rwTw2mbXGJpFOLGa1fNRPwDS5s2jtmxXBNFzbPkI8NdL+
	 +CK+YWM53aEqoBuFpVB2n1hg5m+VmbKgHb+6fMOTbaYd6wkKCKcrEwu6XoWIx1LjamEn+
	 gxzLMFGjY2FcWWrm24M/25v+6xxOHObxfOa9l1yfhKEdFmbfR7Y83+cP+BrxzbvS05Ql9
	 yV63kC3ulD9hU6dCZmmo6FH/IdRtkho7/4KBSghDsG1R3E1YCACLnmUjjdjM2juZ3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
	b=szmD6JoENEQJSTJYVd9Cs2aYDJYIBDaGJDK+WMUmvJ6/gj5FxQjBBj5zsS0MUHbZ+eb6
	 JiH2PQgksEr117txKGR3effcf/asGmM4bgaKmZS8EzC/N4uelcJAQVclCaVCR0Rj+UrGZ
	 +lT8M/LyPY+eNbznESBiwweN5QBBG3cmSzLxwyTCnqv+Ab0cH0aDSbMj9EvRoIJGVDFXo
	 NpdtAmtFW0KU175afnq+Gluopd5xZYbzYZXfedUqWzmtVn/90/6mpjbNYnrGUbrYjr55D
	 HIF8o4bPrPIMCJdmC8C31dTX+7xycS2n1JkChK0p9Thp/pF8spX3x/9+wssceN4Kofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBrcpyBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YTr9/kNh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA15606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA15606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBrcpyBj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YTr9/kNh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ0VCS1102391
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7ejFrWAYoc6NkM/mKIjIDo
	Kcqitp0rzGdrJbpvWUuvc=; b=dBrcpyBjwPI+nGMgipVVTixGkyHT3Ddw4WsHn3
	BX8GGfrs0Q8cYrPZ9VJWsxj0U2JBPKqXBpaZt7DPobtZDi6uhzckcsZuFvWhQ1n/
	9R5gAkocZRPJnWIlfOJ3xBfv/KGRa4+r4Srt+kfKHtN0Eyqyg2d3/ept6u650u5f
	tCs1G+ZYPP7HtvvL7IcPKIF6sReoT+SkN41Tw1QMBcmzQrVxmPq8/qKhb7Tm6un+
	UhqsgSEFgts9rvmZHFduCUt7B/2oy2pMtw10ZZrgSsoAvih6tbttHQtuwY6VuU1x
	Q2sU8H2mOS7lAyhohbFAATi715kaNO4BIJTGlXCRBmd1/3Og==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcn38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:00:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0f6696384so226836a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794600042; x=1795204842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
        b=YTr9/kNhA74NGME/YHX/oX24ZbgOgT9Tzln9QlS7F6EkNeryOY8/eI67pzP9bsaILI
         7zOzzr16mmTUPOhEppusTj68XuPjpGXufWupJpSWNqJ0BFB91xkXhX8XRereS23fDy9F
         64HwUlUMWWhB8oTsTdKcyiHVYH2NNoCMsDbkTQydbcFx8zJQ1UmIEX4CEL+Z8aAJNP5i
         XSauUZ9yENCr9aBXuUIk9EIy5LSWOrU2b6uwPJKtJ4e+bsJQ+mxH7oH4HPWY1j7LEifI
         EAqVcWRBuU5oMeUyAFR/p8nX39MfWx9OWzCL1Ggo22mZaLB4BM610iiWOoIBPswU6+aN
         4srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600042; x=1795204842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ejFrWAYoc6NkM/mKIjIDoKcqitp0rzGdrJbpvWUuvc=;
        b=K/HNz8LWzw3NzyiXKcg5BA2nQZnYHjo5pYyNoMaqOMUhAwSdolgxGiNm8MzvydhDXJ
         qTQFImwN2+qqKkmvMyrXCREvBXFTZNsnyRNDuzUKRHKPvCmTM93/ZWCiy0XK3T584Wst
         4xrTiR0FVvEzigOXvy3jUYwdDGotBYuow8Giz3jSPoDtzuk089Z4zwurVO6voGsUHXaS
         YBWq/WQj7Kw3XTqW7Q0YT6jawv2Aj0COyYQHNdK81tjR++j5o+Kq4aILh+lhwlzRWvjq
         exfPiGLrVf9r0xzLSFBczWnyOBjXaG/F9lkxIOs4zrJ5V6yJbDpkch4hnWRK3Eqn92Lf
         wobA==
X-Forwarded-Encrypted: i=1; AL+hErFrtV4HKiosWZzEFGsUCXOCsHf81Gnn+WCy8LIqGEz8dnxr2NGBPtTHBw/5z/sVU3cMZsOM3gMyfywbQiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80QTyNyeYSttJe7JlCm6gpWZg9XUnM5eKEKM9P9qDl1Q+m+0p3
	gd9q6fVoi9Q9Fcpuw2dG7ULqmOcnS/ezjGIfoPm9pZWiwOehQi7rmsT/e+mjiU2cHgNYHSTgtNd
	RmzJvQAiUtCrlwvt/LVIoi/nFhnkFbG0KeawHRBtmB1TKXIGEsWqUKb03BZjCY1XaPRLvAVKVYN
	w=
X-Gm-Gg: AYBFou3LFOSgXRKI+DTPSNA/YEkxOcAb5/TPoW7NA7KifFV69ehjUxiZoiuGcWtZlj4
	vEBbSp82ieprJAU2RkiaxxhbYyIr6e2SO4Ysl96QrnFQUL1Zrz7Np50GXe/gY/Ci6KG1PbJQE6N
	jbv6e3uCUko+92e9wD8tt4pNtEI3AfZRYg3O1I9DhCZxXdEtI3LfFzQKyekwTXwY99SHJc45/DT
	1idDo5V3bpXwGfRY5NOWMCj5Jo0Bc/JigPQd8SwezypoF0nX8D1ERi9MakzgRYnSE9R00zWHa7k
	yYjcyUJiEcPuXPZYJtivFj2sRp6q8kJXcqLwBp60xUtYUf1Hqt2VqPXrxIWS1MI+H2nHEOQLJup
	9JVGuWwK9FzDrB0lIzh0pnVX8oBVpwaUkNC3WTm7N1xCE5k7TkCr8nThujzW8vfX5dtc9yyXd0I
	Qr1eq3qfdtbiywS/+Qkn/A1Vou0SfVTBfkSQapyGOtClPzT+lcFVRAupg2oE2Fi067w+5nux+9k
	F442fi+CWzy28Qb5Q6IEoCrK4/e
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr5457011a91.1.1794600041482;
        Fri, 13 Nov 2026 12:00:41 -0800 (PST)
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr5456920a91.1.1794600039985;
        Fri, 13 Nov 2026 12:00:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm5848240a91.2.2026.11.13.12.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:00:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 01:30:32 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF9s92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3dz8vKrE+PLEstTijMSi1PiUkuJ8Xcs0S0tjkzTzxERzcyWg1oK
 i1LTMCrCx0bG1tQBDjajNZgAAAA==
X-Change-ID: 20261112-monza_waveshare_dtso-9f9934f7aa77
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794600035; l=5122;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=fWD2NzVvpEJkiApuE6cd9ftuuVf/b/Sa29Gdt8SUQCo=;
 b=qfzO9crN4CCZ13v+FOXmerULVwDvaV0P7RAkEOoNvHGm8cnB+4KbLYrakkWMOT92pRkokIeGt
 XS5/0lB6J1oA3a9fc3+klwMjO2FFpbPZ0O0mVowhIhij8zMG9RD6HaP
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af76c6a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bXpNjNPP2SDK_YsUSp0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: aE0I2Yb7LkgkiTkEjJTCvF38gJoYt0G7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3OSBTYWx0ZWRfX1QUjpr0BNyNz
 thgIBNzhlifOi+qUOjy3f7S+5Mml9M5/3cRRru+YsnARRQqf6oXAilexzJ6nTZSX8RB2YMSxJKv
 phWG8ea2rrSWBQifG9uGeDLS94hfqiwmKbpiZEPnJ6LJOcxmEdMIieZQHNndgbP/4qzUk2fFcCh
 HYxshNNZg2yzEPoSFimhqLdqO6YZrT1F7yc6AzIRmSpFbag5evQX/TWiqluPtQiJz/IX5BhuMaP
 aqhPdpwE7XUHZBsL/YTUSrlyHJAYjvrAkDwv9JYnd5RcFVx/Qcc87UZyc0z6Hmwkz0s7noxTIeN
 8r0U52UQpU4bg3VlCBo1jMGRasl5iabqQBUfPgIHHs9gkbh5dKfuwf2tixs0YZzXgoEY0Vv6JyN
 eK8xpb/Aeu2NzqQqKbuhxpS34S8+Hi1XperTgsni6UmMcro+zCdioKaQEZhLZeJMYzlZG4S2B/u
 s0DFaAX8jKjzgVuzWOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3OSBTYWx0ZWRfX1FROUBGAC0T1
 e14zcNhv2fPaeLXaW4j0gOFJ21GSZ5fBLQIPTa7NYH1CHycr1vo8e8HmVNvd9bRdFMjXetsgij2
 xeuxwEIkfg+0ZNfXuOZeLPTocrmlST0=
X-Proofpoint-GUID: aE0I2Yb7LkgkiTkEjJTCvF38gJoYt0G7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130079

Add an overlay for the Waveshare 8" DSI TOUCH-A kit on the DSI0
connector: the Waveshare GPIO expander (panel supplies, resets,
backlight), the Goodix gt9271 touch controller, the supply regulators
and the JD9365DA based panel.

The expander and touch controller sit on the CCI0 I2C bus, so enable
cci0 for them.

DSI0 is shared with the on-board HDMI path, so disable adv7535, the HDMI
connector and the hdmi-mi2s-playback-dai-link sound node, which would
otherwise wait on the disabled adv7535 codec. HDMI audio is therefore
unavailable while the overlay is applied. Add the hdmi_connector and
hdmi_mi2s_playback_dai_link labels to the base DTS for this.

Co-developed-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   5 ++
 ...naco-arduino-monza-waveshare-8-dsi-touch-a.dtso | 100 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |   4 +-
 3 files changed, 107 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..faa0e0f7b867 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
+
+monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
new file mode 100644
index 000000000000..003c5bcea497
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&adv7535 {
+	status = "disabled";
+};
+
+&cci0 {
+	pinctrl-0 = <&cci0_0_default>;
+	pinctrl-1 = <&cci0_0_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&hdmi_mi2s_playback_dai_link {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vdda-supply = <&vreg_l1c>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 9ac2a04b302d..f518db091092 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -51,7 +51,7 @@ button-home {
 		};
 	};
 
-	hdmi-connector {
+	hdmi_connector: hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
 		type = "a";
@@ -113,7 +113,7 @@ platform {
 			};
 		};
 
-		hdmi-mi2s-playback-dai-link {
+		hdmi_mi2s_playback_dai_link: hdmi-mi2s-playback-dai-link {
 			link-name = "HDMI Playback";
 
 			codec {

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-monza_waveshare_dtso-9f9934f7aa77

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

