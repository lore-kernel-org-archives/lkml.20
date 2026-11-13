Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574455;
	b=xkyAf3Lppe0LZIElDrmiEp2azAvyRU8PPo6LrHH+Ei5mLIo4lk9RPeGPyCIe6OUOywck
	 rC+oYQPEljF+zzIlHVoS7FGBSjPVDx5Jn5u2DZU1pB8Wn+qtOmXvOc4t3akP/+XB1YidH
	 v/UKLXGcMhVL8H/yynv5GfDXUzR2PjayD1xtG6QH4Ux946DO2qo5yYTVQI1/nj8a4iAKt
	 x8qFeb2NAruLnhrvHNe5Bk7ujFAB4E2zOoPivKhzKuX0iAcamYl2eiJhSrmSHHzqGazbM
	 fTOlhM0wmMKxD6HJyPHu12XF1EiZF7tIrrUTASMbhnYEe+FIKwsxknxxY/1a+LSprtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
	b=siEcz7riEKl/A2cqFwTZJSOGsCHRTT+zpeHcDoGqXN0god8pQgX21+pNfIjq+fVUYYec
	 ewOHSkShDQkDfoQ0bXZwS7hBGQfJLZLDi5K7S+sMu5kid/TUK5qGXZmE8F5/18aJKpMEF
	 4iOvte4+Zt5vk5PZgRs7P+oAG9LzhGBwgoL6v9pabq1ml+GezmYSoBO4fk5IkV/x2t3dU
	 jGgmxBY2Lbbb+Iofk9gR2q6zsw5OrQGGrhJe7B4XZDR62UDh3MCdTI71Tk4EmDg4epA0s
	 O5v5NJ+GoKZfKW0Id22Bz9OqHDUEFtBwuUB7hd1gTaDuj+3rNyS+Uo6S1imqQS6sLTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DH2gxZsK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhnvS6UZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B4606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 621B4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DH2gxZsK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LhnvS6UZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKPqf3126260
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fl9/gcNoJhNDn4lgp/c0zo
	afZrHmOW6xOcNOdliPVJA=; b=DH2gxZsK1TaI+9zK0CbNBNhPdIXMtgHQ3iXZlj
	Zc03kiMYXQjKyeHNSXpD1x4W741Dm/8JK8B0nbYifcAnsZVnJRcOyuPHKCdPhdB3
	3nr5rXlnrSOcAuIMPKZsfJMZJCl2JrJ8qhXr/EtQZppgiLwg2WgZdWJrvszKg9nR
	tD9TDpSB5xSPng+lyOzF8jrio+V8s2FyZGvzf6rFPzgjFx0brfrmSyV3jEAHKdQU
	2ahZuGdZ0eWlEAORz8fIeliwOG6ctwlyKYz6bk7/n6jZsp3wHUIkJtkmxhJvqifD
	0TK4szEUIx4nZAi1SMKdWrJeK8Wh8ik8OfsIFG3vpfR539OQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bc3d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:54:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so927306a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794574453; x=1795179253; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
        b=LhnvS6UZVu7sIVuetq9r7QyU6QY/Nm4/n4RGjtcxQGF4DiG+V501SOxcU48H1LBJVy
         Mwde/ioaLc+npOCehqALxNchKKRVmkJVeRu4ylb5XcwGKy0BEcqzrwnXFkCnrWnSiCPO
         sbr9RdstNRW03ZpAZCBmgnH8n2B2ijr1BhrWIiaSEc8NUZ42U33aV3+BVsL5S/eNl0TC
         LUwq819gzFKlZ+dTbx8PJfo9Yq5dVIOiHkuzE9ErkUTDy8LbmrBXqMfIpYc7GV/wQ5cO
         +uR/mY3pPTeG+Cv6NhIMk7qa5yrwXmZsFFtwT+jBSqSfE17tcbPe7j2hQBnNKf0mJMWT
         yT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574453; x=1795179253;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fl9/gcNoJhNDn4lgp/c0zoafZrHmOW6xOcNOdliPVJA=;
        b=KcvuD6KY0FSflYGvK125u6TlaWnGn6cph/fLIQ5ts0fljnpKyoe134EgWLO7klwBvO
         5s5ETXGMSOvscSHsN2eUpp1qjDhj0dJUsFyO+oUzrucri7NfcGpzHbgKIiuZp/tWCNHa
         7OuLW1YxuzsTD+mkBGshQUmBo0ceWuNN/lSo8MRCuFSChtKM81Iy6r4fw/jyrM+BbUK0
         jko+HHieY5vaIVI/IWG1znlUTGVkD2oD10dPsiu9LPx+z1mv1EhGxeKPrOmwIWETVlJz
         DbSEKCo76PYXzqrtFCvf8GspHn/UNSfsgWLY1rodo2Zc01b9op3SzrTEbr15HyNGybbY
         DFuw==
X-Forwarded-Encrypted: i=1; AL+hErHJ5rVxxlGDUmdndodLg1QskC/RCDco/PGxgYllFczEgzXpws+055ktdcl6vnPHo3fdHQ9KGnuzS5p4asU=@vger.kernel.org
X-Gm-Message-State: APuU4Z94vIHVaI9T3EOVCqbwFen+K9p8V/4MIy6Ub1gB6MjZgbUDaigz
	nJG2Cl/JsZzQV0vY8AjdMLp45MJ22UN3lRwbHSBAC8iKf1xlET9xPZmyF175CA94hhz4we8yN6D
	qbkza/Q2in3HPxWc850N5qzfIvn7VWaeFSCYBHKxnNp2AIvmXMtKanwJbZf/qbjfEVO4=
X-Gm-Gg: AYBFou1tSnaSHWaPtMZ0y1+6q8C47AN2/QTgaAtOc5jI2tps4puW02MQLPhSYZwXMEb
	kbah4N4i1tF6C9W7oyjDEM4y6YC05dhbfPGCLQcFVo+TSTKXDit49JLc81cdWEMYAa/u4c3Tmx9
	+wUWcydejk3jX9pRxYi7j6DsG6DJi1oPa5qfWMlZTRISi6VGgMKDVTiP77jF8TKLK2ZJcy0ZZH6
	r8do056XNHQEQxh/qbAJH1PRNth0T9aezpAd0tW2Ki8it3pSl8aNQ+0dOkPI3jQgUToUTef96rm
	kesleX5iQtmvmtShF+Wn0403HglKDm7sqJGL6TtzUNXOaPhyQFgt0SGkGGVc+bmET79otlYtXwj
	eKhf8izMXCF8cK/Px7KH5jJeuh8fFPVRp7eG5GN0gBJzQzjxbMWmyzAK4m68Wl4DDUyZNxNl/c7
	4OP4VMWWsy
X-Received: by 2002:a17:90b:4c90:b0:3ac:9a5e:9cdc with SMTP id 98e67ed59e1d1-3b197d301b6mr4920224a91.19.1794574453247;
        Fri, 13 Nov 2026 04:54:13 -0800 (PST)
X-Received: by 2002:a17:90b:4c90:b0:3ac:9a5e:9cdc with SMTP id 98e67ed59e1d1-3b197d301b6mr4920207a91.19.1794574452766;
        Fri, 13 Nov 2026 04:54:12 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm9670195ad.46.2026.11.13.04.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:54:12 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:24:02 +0530
Subject: [PATCH] arm64: dts: qcom: nord: Add EL2 overlay for remoteproc
 SMMU mappings
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
Message-Id: <20261113-nord_soccp_el2_dt_change-v1-1-2a7aa55d97dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGkI92oC/y2MQQqAIBAAvxJ7Tmi3iOgrEVK61UJoaEQQ/j2Jj
 gMz80DkIByhLx4IfEkU7zJgWYDZJreyEpsZqKIWEWvlfLA6emMOzTtpe+rfm4k7qtHyNDeQ8yP
 wIve3HsaUXuYBdNpqAAAA
To: linux-arm-msm@vger.kernel.org
Cc: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af70876 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Owh0couRmD2wKVmIMQoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mw94JiUiss2tdKi2Ky0RspzSihlPMFLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfXymXUAbtAKwVh
 AbWmTyabTkfmKFHqgo4rSfO2UpOP2xDx6YmP5LADwNr8ytyYv+GAqga+HGFVRRUuicDK3DgG9Vy
 BY2c6+xvnTrYd6ho1rpCUnRTUKUKf6GaBNVfJaX2ccdXhNVV+xFf8W1V0k5AjyasmQ2ITH29maq
 1MNUbtBTaQdVbFSqQshs7tbxUMW0mzctADpbU6XJItZQtTnlOPfF7iImSQftjZvWfVd2+ArqRi7
 uh5+JHK9B1GmyBL3TqUUyY1xPd9gfEzqAEBWwEqj86cfd9szOGU+SvQhOiA8XUkVKP8oaJZ9rsW
 sfaCvhkxuG5aVzl7+xYYepu58WKaFl+PpwaL1ZA0O0Bc9aYESi+3R/SXfWryBWRyF5K8U8Qz//c
 5As0oCL0Z5flCEnb2da2vkid8eA1aklCPeShpHS6K4OvcEsnoAFcxnl7ekTLhaNqLqilcRSDFm7
 Sy1Mev3MD5CEmQlgM0w==
X-Proofpoint-ORIG-GUID: mw94JiUiss2tdKi2Ky0RspzSihlPMFLc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfX+Y6hXzEw02gz
 QQSMCvXTbBUn/KXQQ8ap1ADq8vVY50tLcXtqPyIr7xbAdDXyw+ohJaAxabMh1Sqr/p7ARE2yg5p
 odfWpGhpBkcVpYnQLK50YnU5+WTS3Bk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130051

Nord boards currently boot Linux under a hypervisor that manages the
IOMMU streams of the remote processor firmware. When Linux boots
directly at EL2 without the hypervisor, it owns the SMMU and must
describe the remoteproc firmware streams itself.

This path adds nord-embedded-el2.dtso overlay carrying the iommus
of the ADSP, CDSPs and SoCCP, and apply it to nord-ride-embedded
and nord-rrd to build the -el2.dtb variants.

The base DTBs are unchanged, so the existing hypervisor boot flow
is unaffected.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Dependencies:

[PATCH v2 0/2] Add binding and driver for Nord SoCCP
https://lore.kernel.org/all/20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com/

[PATCH v4 0/3] arm64: dts: qcom: nord: Enable SoCCP remoteproc support
https://lore.kernel.org/all/20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com/

[PATCH RFC 0/2] Add binding and fix SoCCP carveout for booting Nord devices at EL2
https://lore.kernel.org/all/20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com/
(allows two iommus entries for the SoCCP and maps its carveout
privileged-only; both are needed for the SoCCP entries in this overlay
to work)

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |  8 +++++++
 arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso | 32 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..2e68993907ab 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -190,7 +190,15 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded.dtb
+
+nord-ride-embedded-el2-dtbs	:= nord-ride-embedded.dtb nord-embedded-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
+
+nord-rrd-el2-dtbs	:= nord-rrd.dtb nord-embedded-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso b/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso
new file mode 100644
index 000000000000..50c5057f6683
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-embedded-el2.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu_0 0x09e0 0x0>;
+};
+
+&remoteproc_cdsp0 {
+	iommus = <&apps_smmu_2 0x0360 0x0>;
+};
+
+&remoteproc_cdsp1 {
+	iommus = <&apps_smmu_2 0x0760 0x0>;
+};
+
+&remoteproc_cdsp2 {
+	iommus = <&apps_smmu_2 0x0b60 0x0>;
+};
+
+&remoteproc_cdsp3 {
+	iommus = <&apps_smmu_2 0x0f60 0x0>;
+};
+
+&remoteproc_soccp {
+	iommus = <&apps_smmu_0 0x1960 0x5>,
+		 <&apps_smmu_0 0x1966 0x0>;
+};

---
base-commit: 84470eed3bf92713b51cfb2ab38d62be932b2c09
change-id: 20261113-nord_soccp_el2_dt_change-b2e8231deab4

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

