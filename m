Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647640;
	b=YLZqJOrYNQekpLmun19cLbJaSXjsTJirl4XpSzTUcwBTm7kGf3ZPcqJSnL8yLl2Dc4XP
	 A8GkpTFK4fp/8SsVAypdV1B2droA8cYPjA+HOIZ9SDMY7YiCGUykhFuUadRiFJ5IXTPvU
	 pCjiQ0LCvpolPgz4eamKpZm9iVlVepVMbxbO2ECjcY1jBlOXt+70JL6TaJjS5Wr5+EgLT
	 PMu/boKx6hyPweBvLJGaamiB0kmrwghYumWY7XQneSbEZq6XBk8FX0u0cFSUZVfVR9QKG
	 sgzTMECrnKWwM6OUaeKT3BlR/0krsMp7CxJ7x/DIrtkcz7QEdag8n6SXlvxHn9knAcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FDjd6kNy8BPAtKaYQue5wUbMJxvKBSMhIzKw515g+us=;
	b=IC53gyN3qPPp5tG4QHgAs8xZ2p9qabsbO879UwHDBr9Fpxgge72/X2KPhkhqVFPIalBb
	 oM9pwnyYwTJUBL+xLgEvqENOiqUPt6sQ0kP7IAhjgVTSzlbUG5qNHB88JKyPxQj9PZG55
	 pVIUtg7sOFYeECkhN8FMEu4cfLP9z1ZFc0UNw6vwrkrMFBRzzqoXysv4Lso/qjbOatVGU
	 W2HFFnMfpX3wIbVwwD6qLe/tcPFsIIdN25qUr6BMYfEXFpVud9whKwpHg3UbYBK40Q0Fe
	 beR3MjXWKLbGiyNTwPY+B2XVMh7rL/p3HZAjayOvWNlzsBF0tc0VI7NVWaqRtxusViQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB0UcP7+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5W1lyi1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B176D606A336
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B176D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aB0UcP7+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5W1lyi1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60j2j3161593
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FDjd6kNy8BPAtKaYQue5wU
	bMJxvKBSMhIzKw515g+us=; b=aB0UcP7+SpEcx0uJZDMYKjyseEzkOtTics1TR1
	ckuDEvdS5Hogtg8sbSxB0jkl0PJhOa2SNhTEmaiOqJSrbMN2DWpgJq/9m5/5uF9D
	ysYXNSq7ItyatmqF1a+4blWg+8OGC+l/FPBRk31f3BuDl6vP+9vyB5YGciTk6xnH
	xWcOhQi8BHR0Vd/+4t2BYumMQ7+vOGMFSyE31qch/dvvQ363MmUrzrGDuCpCFosb
	RqoBFuSJ7t7Kl7ij+7pIbpYcuyYhjsHSeXQL/0FgIhH5VYEOfh8+S8lvtoA2sYcG
	CO3IDQvhdE7wbH9oNL9HKjXlfjKyd8hCdlA174NqzllcGPGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrdrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:13:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3705e64aabfso189215eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794647638; x=1795252438; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDjd6kNy8BPAtKaYQue5wUbMJxvKBSMhIzKw515g+us=;
        b=C5W1lyi1foVWOpHzVadgu0QL3ddnWpiZXg9HcwuTJTcqaTWg5UH3A5bJLfr45zz0zj
         bvPPL0EcOyzv+F5nLc70t+hotnqpuJ7OYJAXjGk7unKpNrG+/Mmzm8tNgwGQY94e9eFH
         HUplW1CLTJ76GMQPaw6mk2W9HeIW8PHWboJwwOGgAGXUaclWivXwq6j8/esL08XgjHSl
         QgCvgCjWfqr/nLS9xS6Rh9LkC+zt1bQs1CTG85DLbo4wm8JTMhCVZKSpMT9PtPriWEVE
         Axbesi2F3ssDqRBk2/SkkPVoisRIuP8WJJd5NsGOevhPRHNysIkp4YVcjgkAzBSWPszU
         OSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647638; x=1795252438;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FDjd6kNy8BPAtKaYQue5wUbMJxvKBSMhIzKw515g+us=;
        b=HJo5tEyH5Gcen7j8sPhT6BZU6iobzXpIMHdQSgT8KHtKckNlkILrwAvl+Hy92BzuLV
         e17UX7+bek1SmY8ybp8QFNbb/cU2X4LzAnfrV1PeaVf7jRB2AtURFiBAlnuk9chJ3Jck
         36jgvuh4PKy7io6A9JRvj3UWamAkbqokS3XOq3hXakszJCQvW/sqC6Gx79j7He0fLYZp
         Sp2PCQOCiHyEIYn0xylqxmAZ2ufy/QfEB7Ws0RMTw5Py6cqqyK0jORj8l9Z47L/npu2a
         5tEz9G9gUp6/Q0Rh19urmgfMcWFYWXFz1S8Xv16A8IPpBn3hWHWDnfvv961lbYBivXlE
         os+A==
X-Forwarded-Encrypted: i=1; AL+hErFxG/qVuTBOk2y+9y9qxRNshPd/5iCB4ze9Y2A5vfOFcArnaJ2Ocb3fB0NK/Ms+ZXL06YH4wZYOYmF/qPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kF2UDgsFM27uB3MJFhuZIDmFRjYkLAy1nfB4aeScsL1eHg6ys
	zZmHFQOkY/Jc9kI0ZAhIlqz//AUP8HM1hu6bfQvHfsXpFxBz5NqQD8wtF0wN5JTlVlcsExj7czU
	3vrfR8Me+yvX/3HKvWSKhYDIYez0JFQZ7eY+v9DkoXPVcMNu6iCu/XUaaBA/NrfhbhVQ=
X-Gm-Gg: AYBFou1BlXK49a94P0VMxsx75GblOKNYBAF4isF/69dMC0inH6xUsdgn1pj41GQBnlU
	ACCl0pVRTFgaGLr9UF1ClEAd+WekhG7vO8s1o5yrEZJsOt8Z4MInl+l5qjW4tlJK/Q6l50z20Dk
	XD9/zFaNjz8TuK3k7UFO7T4XNioy+VZBop/0+EJHDSkWWzwYxQ4h7L7zBwr/euV5CtEITf1ILzp
	ORvHiRpUnl9I0uWZCQgJlZxocgIHHNz7ol+KqMW7n344XPxwusxFPZsYlei+kNdDwyifoHb27Ua
	QZSvnb7xGX84HbKGXhLQ68A8gUnmkb7/FwJLTiDyndqPb+mmFR9eQQiBrMyo0eSGh3We2Ds9jbC
	OJOjgXNzDjC3/o9YglYI6EjhxTVF9EOmCbz6qKIECcDx6MQbGuez5K8TMceJrqMHBXb0b2EoDWl
	ystCVcjdmfXdVHMbygGNEVd3rVbmd3E3+ZNnvBcrFRpS+tZI3QCvZNX1pj8WQxo/sZt+xmTzb0L
	KdTFi+ev2A47TLg1N4cVDdeG4TF
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr9930648eec.1.1794647637936;
        Sat, 14 Nov 2026 01:13:57 -0800 (PST)
X-Received: by 2002:a05:7300:7481:b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-37964ff2d6emr9930608eec.1.1794647637331;
        Sat, 14 Nov 2026 01:13:57 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm25064441eec.25.2026.11.14.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:13:56 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 14:43:13 +0530
Subject: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare
 8" DSI touch overlay
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
Message-Id: <20261114-monza_waveshare_dtso-v2-1-d35703f59832@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACgm+GoC/22NzQ6CMBCEX4Xs2ZK2Eks9+R6GkBUWaSJUu1h/C
 O9uJfHmZZJvkvlmBqbgiGGfzRAoOnZ+TKA3GTQ9jmcSrk0MWuqdUkqLwY9vrB8YiXsMVLcTe2E
 7a7dFZxCNgTS9Burcc9Ueq8S948mH1/oS1bf9CYv/wqiEEsXJNKUkK0mWB8+c3+54afww5CmgW
 pblAw4IPHi/AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794647632; l=5398;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=QJnv+9j+xeKETkhxss/zxqn/Hkz39sKT6s3H5bDR/xM=;
 b=7EbU21EMugvrQ127kLN+B4I/QzKM3fzKmUjqjODe/Qn7/z04/JqPW+ndakTpX3pxowhUc86Dw
 X6ll460qcT8D4PeM29C2ycoWZdSqjTLMWPnlETM6tAe1kVRS5PrY5Te
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzNiBTYWx0ZWRfX2CGdJxvyy8zq
 B8djHIVEOgCSt5YXZvub8hjdoBvITdan5DB0Cn6vCDlQ2qkrVH6yn0rZ7Ne5sfuHnx+MXp/nrQu
 /duB7EzuUSINCak9vgZ/NZYuN7UgC4yCP3cgYRw+ACs0hVSR7SpYYW/Zv+zLIeKJ+Cg1Huyn8S9
 qg/Nb+WrwcSrUBWcdhoaAHxDg8HULlegX3xyxn6d148n9DeBbf4ZW/zvoAqrETQ/mVBMw05SLMl
 eiKtY9Jr82MIoPyRJ2kzpggprINdYPKmi9eWVfRhmDHWfH3ektZ8cEGDYTvg5dEIUU4NLU4PmUR
 Ez2M68jsVnlf5ap3qaWtRUFK9alAwpTDg7JNoluhGVydwtdjdP+jC+YPwHN2wNS7PVgxsdGkdvz
 PSDlLn3Gfrd1jG4Tqb5jMRU3jMYL4nppjA/gQWxcLqfxvfqHBbk1zu3esJDpwc89NVez0YfDlvp
 +hUy9hWgBhFt+un5kZA==
X-Proofpoint-ORIG-GUID: syf7TzboIJ2CgDGYfWJDR0LI5Buvas2u
X-Proofpoint-GUID: syf7TzboIJ2CgDGYfWJDR0LI5Buvas2u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzNiBTYWx0ZWRfX1DA2ZK8omCfM
 SdiIdne9imzEkcXFBKhAj6J15X6sxFUI9YCZUFUNjs3S2yGEFszdOz8XK9ZabPVkJxKqp243H5Z
 9SBWzpIcSQaWCRwDa2ffQUfLKpZCBzg=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af82656 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nv6N7q-ZXT1aBYzplkoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140036

The JMEDIA carrier card can be mounted on the Qualcomm Monaco Arduino
Monza platform and provides a 22-pin DSI0 connector. Add an overlay to
enable the Waveshare 8" DSI TOUCH-A kit on DSI0: the Waveshare GPIO
expander for panel supplies, resets and backlight, the Goodix GT9271
touch controller, supply regulators and the JD9365DA-based panel.

The expander and touch controller are on the CCI0 I2C bus, so enable
cci0 for them.

DSI0 is shared with the on-board HDMI path, so disable adv7535, the HDMI
connector and the hdmi-mi2s-playback-dai-link sound node, which would
otherwise wait for the disabled adv7535 codec. HDMI audio is therefore
unavailable while the overlay is applied. Add the hdmi_connector and
hdmi_mi2s_playback_dai_link labels to the base DTS for this.

Co-developed-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v2:
- Corrected removed redundent mdss_dsi supplies [Sashiko AI]
- Updated commit msg as 22-pin connector is on JMEDIA carrier mounted on main board.
- Link to v1: https://lore.kernel.org/r/20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 ...naco-arduino-monza-waveshare-8-dsi-touch-a.dtso | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  4 +-
 3 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..331ae62494e5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
 monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
+
+monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
+
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
new file mode 100644
index 000000000000..67fbff063955
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
@@ -0,0 +1,94 @@
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
+	remote-endpoint = <&panel_in>;
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

