Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EB48663D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398055; cv=none; b=u5Xt2Jb0khruVf1SYub4/CDnFTKwmHhAxGN679NsPBGWdcYJyNiZeGBOIXTsEr+ENwOW9TTX/c3961A3+aCThjkMWUmVpfqG5b2rJGa5FBZCoUDd6xkKmuItJCiIYe0aioy3LORUQ5R/92lrFkg2zwhV453GJpxZSVOs3yZExxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398055; c=relaxed/simple;
	bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYTCQClNfE3O5qI0PXl24DRvtdQBlyS2iDfVOcu7pff/lrHAeQloNQ+1LqnyOx1l2UcFC86NNWkJFly7QBeW6hVmIMVbRi6ScPXhsqSly3TRPfQ8X0TpQkTpGH1R5PHu7mUVFqMB3YHhb+b+bnZyWzYJTBhawzKhze1B4+CZCEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/cew2hH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FE+LpdhN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/cew2hH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FE+LpdhN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0XAB674511
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=; b=P/cew2hHZQT7dWMP
	dOgrhAfwUUqvNmkCA61QHC65RV6hkeEWLtXjiK10IczKYcqiVrxE1fQ/eN8P5k5b
	XCuTKUUb+qdOBOjbq5Rq9FckjgM8HQ4fapdpZW5haLnLuhOVFVCHD3pUfwztoax+
	OFSSn0tuK5dnngeoCKoj/oK06I/TdacobsbGxubKDSarCSDv1jGJcSizQWZu84bO
	auQT7FsR9NAhILViOX7aAvsHF1Q30+jUjTASqp3jwQUSTPWrt3Kv3gvkX3ppMS3i
	lqiAUoiHK9p7CPRd3weaNxFQGD1a9ATE+BWezwvVJu7RrU2Mq3NphWA76GXh5ePf
	Amv9aQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs99v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6df0a1e18so66920245ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398051; x=1790002851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=FE+LpdhNLxSk55h5s4VuNjgFdJrV9qPNzRHASegypnzRfv5oQfMMc6O4k88hT8qwEM
         dgEbugT+4moo/riPVPZQmVwsYmo1iy/Tw1nuoIja7m/LDx4ptIRNww+iT5V6uc/YC0Jx
         RGnKxnjyNWOUNZaNgY/y6mpaIPrzuhxisXTdoz+ZXRyADQdYfhb6nzljlAHS69Hl74i3
         zxatiiuaZ+Krm3/SW46d+2D01FSVK9S1IgExpEu4+dAi7OztiR/0jf8KZjGb9KNN8Lq8
         bcRJefw8M0UZ23kIXqlbBuiDWSCuuWiby22thxbfkjJjY98lxEdLlMZX918lVogbJFan
         3CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398051; x=1790002851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfT8oPSA0cGLEFSCxt0NN45mGUPgAF14lIogeHiakWY=;
        b=SYPUoPndBzfagCIuK8zioKyqOV6ra3wPiUt1QI8EjXI+5xdDaDpiB9HtyR80gamzW7
         xCLrbMGYEzmCwQXu1VUiafxIsNu8k8pi5G1Duq6v8xg+Sw3CRkyYJ+ESHv4+xuUDZv6n
         aM/Zj0UEZYqlyUIkVfYr/+A2zIo7xlcwyXqRXB+40U8KmGJkmCTnnl30ZTiLmDqDUAIC
         pxbKevkizdQjlQ/c94e+9NHUklwaGFKcu9pKI+AMaRzmsnaYrIoFws+f+V30aJ7jmjD+
         XUOhb4ayNVyA1YJXd56czl/E18b0yyN0O0Lw5PW8T6gH6u28YF4a42xGaTj/vsdXvm99
         UFbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBal+XAKOF7NI6H0uPX2/695fazgf/LhVEpX4kHX8qKfaymoxzXYcv6AD+My9CY5NagUAYdmMQKgq5eTk=@vger.kernel.org
X-Gm-Message-State: AFuF++m9mejhyH+seSeJ0jzZB2F28kwG0Px624WAMGlxwpL1+S7e0zln
	yGI3Gr9+Gyuo9lPmwfwNOYZxScmUkVWEFqqaHRquJWRACBdzZfGKUYDKLX5Y4MMyLB3ZURqGXT1
	2kSK2/jELtRGFGdUpWIrNccEhZrvbzcXlMHzQb4BqQxRB84gCw61znN84EUqnZeU2lro=
X-Gm-Gg: AYBFou3Dh56zJjr+x6J1p/Up0vJdOqBkb7szWGAuMqe4ZLYbhjpvRcifgcMVZirwgcV
	i0dH6vhEtVzL8L99AdlvGmfh7fmCkdYxufh6W05qPtkzLlF1fNFOWfId3UorELoR6U5xRKDf7bp
	qqe5tTEshZsWAex4Y0+SXKsj9Jm5c0KcUBkulHW+0dst0gsVgFnQtfr3x1t3aGB5UIgh5Pz/1qR
	Lmf/X4SbbRb6Bl3oHuktVeLOVDZrB16Tr4//cNFMuOE74N9AYuBKtAZBMWJEy3khKb0PsxDUdmp
	2UlRvGOHPX/nyB68p9/5YiH7RxkIUdcTf+GJvwgTBhOepYFHCDtrDiz4/T/jP/xdSNckg/zEusp
	4KPoVLbBIfOB9ie4ofJ27kfl6IkEg7sIgNbB7
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62769695ad.20.1789398051329;
        Mon, 14 Sep 2026 08:00:51 -0700 (PDT)
X-Received: by 2002:a17:902:ecc9:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2dd6c75a41emr62768505ad.20.1789398050872;
        Mon, 14 Sep 2026 08:00:50 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:49 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:12 +0530
Subject: [PATCH v25 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HY9fLa8u8u31BscwdrGeQccVQPGFQUgGa2K581SXsxg=;
 b=fNw+c8n6DonkQZy6Ryg4I7jQGU3AwDIZpv1saXTAQP0uoDA44F09SQVdEZYzRHbUuA5FolYsW
 532efuuiRUfByHxOdaaphUQmNsImBGJ54C2AfORsbVFpdPXiRM8pMD9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX0p1ov7+QNnDf
 I3uoJ5ssV56ZlCMOi41S4Y4HqdA+X1qcsbgCCuRUN3XIlapoACRVL+70wq6xyxI31+OCU65pwE8
 h1L3VkFxRe/P4jCqBsplQaeHQTqZxDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8m/IkBPDF20n
 w+Rgt7VlS81Fk1cRlJPSwdGmvJLnqaGBbYkRfBWPZL95El150wB+MC2oDQMbdxt8SUnzNoQ8ii5
 1viErg3wslt24HNfFvlRROSDZxSAxA80vM/8XN50xfVM0tzKdUV7kkU+xulHHZqD4Wx4Em1QSyW
 34HisCsFP3Y7LEZLucJDi4wK897+RWVVQYB5+jQ1YsIuyNk76jfInHHNw5oJNMH3Nd38zLOIknu
 HWSk2EFYKu14rgRYWyGR66ea7QNhr/ABV/U2dzl5hIaG/vwrcUSXHLWMszDDB5b+cXoiJ2hK5CP
 BXVdvi1grCNoaKoNv8cgXE7Ti5qNaLHX0t+MF7Si1/gnGIdS/z0zV2ylfUpDiUoZ1Q8xyZN6yhv
 lwcO3z8nyC2VmQJjvwZOu09k52tzZSXlcfdWMHb14Ws/UC/UBTmbkUW61JLdy9UVsXjinxa6uex
 ApGGDoCM2pUNnChcvbQ==
X-Proofpoint-GUID: 5iAy8iSWkpcr4zeYIZQHIDpH_iGWISYW
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c23 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5iAy8iSWkpcr4zeYIZQHIDpH_iGWISYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215

Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
qcs9100-ride-r3) for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 7 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..87d01acc7b5a 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -911,6 +911,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c19_default {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..0adf9f02c8cf 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -800,6 +800,13 @@ &pmm8654au_3_gpios {
 			  "GNSS_BOOT_MODE";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..f0633b81a04d 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -550,7 +550,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

