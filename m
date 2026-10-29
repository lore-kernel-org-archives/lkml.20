Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264547;
	b=ezL4sLGlN2ShwPj62MK63uL/ZYXyemWfe1M1gVpdvbIMDb7r+o3F1NbtdWGoilYzO9uf
	 MsbDVzwfApiwccjlIKZlfOgQpQINixY0hblqEBOiLgC72pCpR3kcj8DA4xWvvgwGB6pzU
	 WFOR/TSHxSQtH/QcMKHyG/I2gUI42bOD14hz7uJ2GMSv7rHxU4N0Ni4QPHK5YgKTJolwa
	 jjCxKqnvSfaMa2nTWsc0OyCaHugcHAazXn5I+DX10aszale94zdXop7MtFBqhr0u990Qv
	 4YD7jtGYEAfYpkgsCOAdLY3wWsio+VUK+DWTQHrg+BCMBF6oMjoIIK94gNXg62qY1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
	b=jaO07IBCpXFGDu5Jgga3/sD1inburZjmKs+BzCTTQ14rPaP/zavRqfzaAapYEv7v+Xnv
	 MaJPbFjQIEZMmlC50nxkmg7qR/K0lGe8CTms0RzBdCXKUXcLdGQsSDSAlfIIIo2cf1+6b
	 7+PFCvuCpr42wraxsJKCRhz3N4aq6K/QvMg1nyWOprtiOG/JtU0kQnDBk5LvnWXHFg4t5
	 aI2fNJvKnzP1VteUXF0OaELuUjcqUk2UoCRtGqnhmqUDCma7kBANnmsoBuRwuSc1LhLBM
	 AgjzfoelOZRVX3KVkaOfidf+7UByMsF8SYsPjFpzTqLF36M/He3tU0p5GdG2uAdT9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C26XEd2C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGaftdv2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C860A2631
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140C860A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C26XEd2C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGaftdv2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSv22273523
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=; b=C26XEd2CcgRn4dkf
	3jQTT571CluA7sV2xEQK1/gtOdQEam4dkB41lT12hh33q1U3qncelaTHCd3WVUyO
	qPDjyOemwsMNbxO9U25lPqA74Ssgyg2BX6mkpIzWsLjj97Fc+PUGkFso6uhof+p+
	XnqOWgf2yYrnJbiGUedWjExUuntQP8XGdixAdf9eaDYt6r+VtlvJLP61glqTloq9
	uYKU3Sq0dO3wovB0LYQiyVFfmjwXktGpC6eGAB4F2VDCQk4psbSnibpHnPJ8aund
	n6iZP0saS3vAO4pz/naU157nua9o3V0Z3X/rw/w98R2WS4pqUUHFfI+ElbrYxjy9
	+SIRTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b01ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:02:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1708829a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264546; x=1793869346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=gGaftdv2Wf9RwbhsKxc9U5IBHqEcCRQvNh2YeYmkyB9HGEWXv5lXr6IpYTJbzI4iyQ
         9xn/soXibhIGApJMQqiCDzAS1pVgQEfUoXkPgzH+at1AH0eTOShMUD5QW+caL4x9owei
         CcA15pgzc+sFJZrPbsZLA0B/JiQsyAugZ96rI1e8XelYS/uXPo+RXkfdDQukFp0XxeT8
         5C/JIFm2r+gDJgqao8JD8PWLGth6UsP8Uf5XLH24muYCx8vFcnIVeaPsV+XOtzlWQHQi
         DTI5X5VduPNiXB7ZCKQxvENwGY8Wm1zua5M/mrpfilblZIvsELZ2lr2OuNS/0PoR94U6
         40lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264546; x=1793869346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ra0wkK0VOhs8mZ313296c7ydEzyM1zL9ytp50t1dNQM=;
        b=1F4SmLCljWcOS/SSUscU9D8UW5LIUHi48wR8SFgtTITTTRBPCBz00wr1vwnN2wfZvW
         tKyXparFE7vUU/KIRJHC7XzQadY+iwsllY1/FHRTKg2QBHzy3pWyunJ2EtUBo3swdj5i
         NdfXNJTiMobwnZ+A0USzuFV29pM6iRdPvVZBbOv4ekXG7AICHtkzacjBqCkSVkBQmaDI
         VJPp3Z1qTfbKXeW+A92kMb8SjjtHIV9QsDnDZX+kCAy0/nDx3DyKFFf+EDC5kUJMrZSO
         eiBbqjKlF0rxxe+f5XAyro8rcC90xMYTqJFYtcvQje1gdMVuqGGuDxRC4VzJpgzW3TiV
         JTJg==
X-Forwarded-Encrypted: i=1; AKwUvByVUQh2QJQ9+VrqSXnz+/Jz6OvtxaqroAp8p5nJ0xWscBVIG7nHUz1okDrtdwomKY8C+c5NXvXH6v630wE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd9tNzrVap/zN3eqf/KbEUY/DgG184k5iCDwsA5SQLo+TcbkbR
	Q45Hp6owkebPOcWC6hGrtUDF5zH9DGngPans51GFBGWoOPpn1j9+vXWIHjVAWO2/dCa5gONzH5i
	kxc2/maIWEvSIsvK9eRyaL9ju6xU3bf64hRJNPaIvwl5AjXBcVF0r7oz0y7W0FpFui5k=
X-Gm-Gg: AYBFou3lD7vcoSGYNAup1B3FmVd7dRMPh0eV513j5cG53qMV9STh9u3eS34mc80gmaR
	5Fr8YxYKV1tkikQ6ylBg5GqD7e6BrMlteCQSaGIBaMT/xQN+sDM50CCGA+TZhlWQltrBVW3pGvT
	Vfh8+5q+v0NT/2ShvXb6RgVSxFMK70UQ3LpU25K9kVLv+ERe+Zt7f9jt51MarcQfh0ibxg4QFdQ
	r+bqWfwyunCEISvNCq6gCjJ7FDUM9kbPlHsLmX0BeyCRRtluMxMsgAxegZEDBbB3SAkmw2a/Udr
	tlrnYPFah/jWHXfpcgdcDBByEj/0nVQOA1xqMIxGVhYvqfZiMde+VuDnBQiUb5X3HezXA6gLeY0
	cTNcKQJc9kgDYSNvbb4mybHROuYN1+IbzCceTT2kK7k+snO6MpoGoiWUGt84XdOi3lXbQpPGXC1
	Hy7FOhXxkd
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3665014a91.47.1793264545633;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:274c:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3ae580df4edmr3664973a91.47.1793264545125;
        Thu, 29 Oct 2026 02:02:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:31:01 +0530
Subject: [PATCH v27 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
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
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-7-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=2150;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=mPj+QLGPnZnwXZyxbErfY3pN7hCQJuFpiu9YM0YUfhE=;
 b=Cqq6XXf1kv0NCylp7UGDtgQOM3peyD1cGQ4s9I1D7xhKF1GuKsTELxbtOUUYyagw5Rm4ch3ET
 Q6YJVJBmFmwDzewQbD9obZSG2A/e9W0Kn6Mp68NJkE+vEHkybMmG+5H
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXzLJDjTUROZiC
 XtRkZHAKbmPU4vaTLrnYJNBhKfxiVDpnDLigOkLDFGrhNaSprE9Z4FpZ66d7DrSA6m/W7AfqeuC
 bFs1GqOQzSIE9suzsvWCBLtdjjtswgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxSBTfQIr08Wr
 fgoCDQKRSGDqhxMEZ5zgRKnt491VTM3KjNyvOvy9CK4/xlB0iI/n+NAaoCbl0UVmX4qdl89wOvN
 +PV8RBDiyERIQKWotOPaDx/F/FWqmmVmk2oSwQCYKdejiMQrwlZbEmyMV486xKoGLX51GSODFNB
 rdO+RD/YvIanKoUMqojG3AfLamdFaSlfE1IyR5LNtKjb4YVRHiWtJS6t4K9PenxNoyE3NNPZs7E
 Z3llnaftfL8+nwCvkf6rvLu5IvOeqghMzr8aFkM40GtwagkJikVA30LgjCWmKdAQtBW6rnvS6Q7
 P0YaXTYItPRTMtyyrGwRu3J5S2fSkh96ITF4tg2jSY+WQH2UcgdxjYkHb1TSO1tIex9nor4JHbA
 IVanHP8qY/Zv3gsqcILtM23WXn9RA5Uq1IfE++zLqef3BQGdamvFw2UusOlOWX7LzNmOXLvxCfX
 iAOUXhlO9QDBd817onQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae30ba2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: uEFba6RfUlAO1sk4KpuDKXLptfjp-Ckc
X-Proofpoint-ORIG-GUID: uEFba6RfUlAO1sk4KpuDKXLptfjp-Ckc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..d1b5eb9e86dd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index af7821e02fdb..3001ec050a5e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -792,6 +792,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..82788a1516d5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1107,6 +1107,13 @@ &qup_spi3_data_clk {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1

