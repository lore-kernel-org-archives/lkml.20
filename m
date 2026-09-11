Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81E3E63B0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121987; cv=none; b=tPj6bf/w8FjR1JqbfM6JghH28xnF3xavTNedKKB9p4Ah2MCAGdYPKRpfQVETV4BOSl9v+EzmGZuz0+B4hAZI/M7WXtsU8VfFcy+oJaxIlLg5tNIqdEx8oQPF8Ly7A9viu1TH5LlUlNjFWE7R6saf6hOxAthB7cJa0najSqTJVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121987; c=relaxed/simple;
	bh=eusrwaG+SvByYvYohBSnaY9dQNEAbeKkEOhPwmxNvmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtKxGYr1YgkPneD7bR8TEs2DGjokrXs8mMPwHF29KLChmDJgf4OhyfoGMQRUOiz5sgNTLyjHe+nFXPB3X8c4hyrZF6+CiecWBL8v1W2Ynr6c8VQGn3BHjXzrorPzcuH9aXcYXbyY5f/+Bwgl+ITMkbtNT4kMhIAxOZbTbyQns2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IY75OocC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeMtYIDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY75OocC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeMtYIDZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kY162801699
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=; b=IY75OocCXIBB1kJV
	MTcUPbF7pstoB4zPbIamuM30JzvzlrwJ+uhxgLBD0WzqMNdrAYK/b3U+rvF1WA+2
	dkE7EChVdcoipptdPVjc15pr6u1WckRnX8+j74CwxgnOWmSIu7EL+aTLf+ZmwH6g
	Cq0AYyVnxaYmMWyYKeWf4n8dzlDn37B8CFqX2XcPVXoy9ELEMZmWGlhGDOD7Rvap
	z8IP8SMOTyvmsVUbbFbsaqjtq0Vkb0tTlfBSuSHnTJ4gVBZRJvpOHaEVytWeGza5
	g8RD6UoxVj1mEySjoB1NaWGsRL+nBIRWvp0HApPzvqHo/4G2YGd29onGXIFBYjL1
	3qhkzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729j375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:19:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso121209985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121982; x=1789726782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=;
        b=YeMtYIDZQqUc2kUxq7/WqYJcnHTrH7Wgo51vwrc86uqLOqfDL+kIwjjxyk4yk6i644
         iDO6oH+FvYjlQdD9j+6t/b53R9O1Ivzlz3AJW8sZS1nI4sFZwkXdX/CcpxA73DfnSpcT
         +uPNcvJwt7/gZGJYYQYS+ZBGnVYDlwHGoaV9+V9O7R9x43rSx0LIfBokGY+SEtwfXFVF
         lrup7T5BpXm9LuKYCBRkjJTqN9UMXXCyJRCAZxVzE5R5RQEDY5QVX+WbNiF7T0jzjKRY
         37FNGsQ9ksV/W+8j2WLbiMYeF8H4nCyUWN1+MjUXhizwUAZ5y3G/ww6ITBrO0qb4xJ30
         K2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121982; x=1789726782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxYyNH7t0YjYIXb2eXg5KjHiSWUHb9NZkxXeI7htHp4=;
        b=N3K/Z/J1+qZDFNc+Qlddd7SVSIwA3Igr/EcosNX1BpitUPAcIDtiH2x0OwHWoE2YlK
         sGCuInzw+qG8mNdIpyhZZh5IaXnskBSxp1EVD7U0PlypfEkzsCn+cfyPA2Xbjoa25ule
         R1B6QU+sP61jqUQ2VKB0+skVVa8QJS4VnorV9riOgJlaldi6G+MonN2aN/s5BM0fKNuY
         O6U51uKhAhv2e1ic0P2sLUth/eZTJSYNAvbcFOPyvjCome/0JUA21raZipyNhYw43/BV
         s/GPFbROUfKNN79QLeyV+W/VPqUf8v740FJtGP3u0g1JLAIUMqgJdFNE0qobpOb/9gcN
         kbEA==
X-Forwarded-Encrypted: i=1; AKwUvBzDHSDxNW4AUAeFVxH5FMbjEfGSDnXui32XVzj5ulVXDfxn29GqgGczYk2yiB33MCINVHJX6zhbEggI8nc=@vger.kernel.org
X-Gm-Message-State: AFuF++l7IdE7BgyrSqYlOImtKU+rXSSwmjrHbXbjHXGTrWyFM9TT6/p+
	N2IzHykC9p4erTLXcYZw7DYL/CNf/iftWu6clHVvx2X+dBQNn33KdaEYEoMen1mkz6w4rYFhNJV
	5pfaB+U5dGwN/O4CrxJJVFCT9GyrP2ZPX/U1m+aE1T0GoXlg6cxsgvCmmoLjTTerWXFk=
X-Gm-Gg: AYBFou0Vw6tHBOus7hCAyoGI2lbP8Iwbkzir/+iZr23FmkF/WMcBbnpZdjORhu+uILE
	BSNWAbbfvdUroPV455802U/J+3uXci5PVeQSTZsmDx9RSfZH6bAB8lbaiGaUPl9jHHKLy57KX6x
	FygLDN56uqG/LE92RewIQIq6uIFQuVwIG8nyQFm4Zd+2Bp4+Ywj+g2vHsiGbDm2lQ7ntWOYBtt9
	8qdH3MncY6OESsnZaJEBTjH2im9QzaeO27aV6jur9PunNqWbQ1AHWekfC+L4nLRDiSBYxjJncA6
	MqOqwOkKiEI2rWZhW09Uc9Phh5D+z4IjACeOUXOsoli7VsjqPb/mvBtq0IXuBVBmvjAvtfSLEZF
	5aDZRr0eDseelmYdq1p7RAGM=
X-Received: by 2002:a05:620a:90cf:10b0:939:ac74:1bbf with SMTP id af79cd13be357-939ea049212mr309634185a.4.1789121982113;
        Fri, 11 Sep 2026 03:19:42 -0700 (PDT)
X-Received: by 2002:a05:620a:90cf:10b0:939:ac74:1bbf with SMTP id af79cd13be357-939ea049212mr309631985a.4.1789121981614;
        Fri, 11 Sep 2026 03:19:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm41989585e9.2.2026.09.11.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:19:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:12 +0200
Subject: [PATCH 04/10] arm64: dts: exynos: gs101: Re-order nodes to match
 coding style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-4-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5170;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eusrwaG+SvByYvYohBSnaY9dQNEAbeKkEOhPwmxNvmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9Wqy3dyMhwgraWKPZX0S6JasxEXd1DO5Ezjx
 Wtl9hVDPpqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPVqgAKCRDBN2bmhouD
 19WeD/9zaapOLgZRi+jN0Oz1v+6bcdL+vOAQc1QptNHWygXG8aPM5R6Nw1CbMf2tm2nO4WnlBsz
 MkCOoVQ8Q1wCKKTtkNvnaFBpntAc6CJAz2WWMrFxfjJI9h4YNgX4lv846xqJn6cb0UrXdEuG6Xc
 32WHVHCr/tfzXkbJPOjgCiZ/tT3RxBfUJVJqp9Al6PXvGj8lzbehOue/46aeEGSfEh3eFjOCZ+q
 punXzhNdLQ1ucDc+gdIQVDJV30xTn2phDsTEm6zZRWnoelGjWsITPDgTcxPjUsjY0Sy7w7enjFz
 P+JRpnvIQXTm4dzRfJE3XmilLjVZ1criJvvL//m3jCShaJLOccQT/DkKU0s7rvBu6EGcuIJTuti
 eZht7oyLRlWY9VcxyEIen+CvSiFwyavCh8p+xqNZusnqI7kByOo1WiglhaLIMvw/oTu9fSbVybc
 On7NiaqNyohMXFq/ZNJGZldXWiG88UonwKIr7wzs87nHWf6BgjjTs28AkdfmEtUEpxEshfRZQ+o
 w0T1DzJC3H7hLirScWrATi25AAA/oWPWuSbmC5InWknrBj+ll30gUM2JnUT7Sl88FKSaqgTThbg
 LjkqbSReFXDPkM8SUbn22U9MXU9fSVTcOYt0xOytICA42gBKWjVRPOdImruT/aCqZrme0H1umBO
 69zpEl8NaQAMzmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXzj20tMtoNxmq
 MkgJwaEoCgmxd6dy+H7zLVN/ratBdWtRzmyHpCCMitEprUTArc9ug6R3QW6BRR3P172PlgoiXG6
 E7th6PaclysuycbRr3eUYwssMTVLFAY=
X-Proofpoint-GUID: n9D39DSTSeK9n7c30vsnD9XS2jg6zoYi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MyBTYWx0ZWRfXwAgtMh+OQZE1
 385F6rsw1tFWJxNHyQ3IbgcBz47qbk3xBiPglcVDy8H8sFk55IkDKjAeUkaeGN/BWaj0Uwid3vm
 qlMhemYYrq0SGvA1Zc7FhmOiM92Ur6DCIhHnSEM2US5ts8uj5MoCJrB8t7m440yEJQDE3vBkpBC
 +QWwjWbk5OwT/w9j3CBew6jDU4srj7d2VCK+9Gq3k4Rf7R7yjf7fTdkwXUiff8Pkobzz2BqNFLJ
 /qRc0//+YyFa8JeaZzlTTW5ZX22fQKOKCIdu5b0Q8KJgzuttDUiybP67rdxybr48qT8hAlRccT0
 l5ypWBa+xLFoDhCuovM4jP7o4htGOBEknN2L9j46mcwZTcIQDab9qvrk7ARQpkXGI63fTGZwqbp
 kHCRtSFpi9oG1dQdNbdT6+oOwl5RCql31TixQ87YI4nw2aS5cSpXklY+MCbwmTU+l8vUoIugvIg
 Nl+pDVPdBqG0zsWiTHA==
X-Proofpoint-ORIG-GUID: n9D39DSTSeK9n7c30vsnD9XS2jg6zoYi
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3d5bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fnwEYphLvHfYI_5qUm8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110143

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 32 +++++-----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 72 +++++++++++-----------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index f14c62c8fec8..31bd42c81c38 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -42,6 +42,13 @@ gpio-keys {
 		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
 		pinctrl-names = "default";
 
+		button-power {
+			label = "KEY_POWER";
+			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+			linux,code = <KEY_POWER>;
+		};
+
 		button-vol-down {
 			label = "KEY_VOLUMEDOWN";
 			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
@@ -55,13 +62,6 @@ button-vol-up {
 			wakeup-source;
 			linux,code = <KEY_VOLUMEUP>;
 		};
-
-		button-power {
-			label = "KEY_POWER";
-			linux,code = <KEY_POWER>;
-			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
-			wakeup-source;
-		};
 	};
 
 	reboot-mode {
@@ -527,15 +527,6 @@ buck10s {
 				regulator-always-on;
 			};
 
-			buckd {
-				regulator-name = "vcc_ufs";
-				regulator-min-microvolt = <2400000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <6250>;
-				regulator-always-on;
-				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
-			};
-
 			s2mpg11_bucka: bucka {
 				/* lots, IO */
 				regulator-name = "bucka";
@@ -551,6 +542,15 @@ s2mpg11_buckboost: buckboost {
 				regulator-max-microvolt = <3600000>;
 			};
 
+			buckd {
+				regulator-name = "vcc_ufs";
+				regulator-min-microvolt = <2400000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <6250>;
+				regulator-always-on;
+				samsung,ext-control = <S2MPG11_EXTCTRL_UFS_EN>;
+			};
+
 			ldo1s {
 				regulator-name = "vdd_g3d_m";
 				regulator-min-microvolt = <450000>;
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1bf59eae9360..b218ff50d228 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -30,6 +30,18 @@ aliases {
 		pinctrl7 = &pinctrl_hsi2;
 	};
 
+	ext_24_5m: clock-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "oscclk";
+	};
+
+	ext_200m: clock-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "ext-200m";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -205,6 +217,19 @@ hera_cpu_sleep: cpu-hera-sleep {
 		};
 	};
 
+	/* ect node is required to be present by bootloader */
+	ect {
+	};
+
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	cpucl0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -472,31 +497,6 @@ opp-2802000000 {
 		};
 	};
 
-	/* ect node is required to be present by bootloader */
-	ect {
-	};
-
-	ext_24_5m: clock-1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "oscclk";
-	};
-
-	ext_200m: clock-2 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-output-names = "ext-200m";
-	};
-
-	firmware {
-		acpm_ipc: power-management {
-			compatible = "google,gs101-acpm-ipc";
-			#clock-cells = <1>;
-			mboxes = <&ap2apm_mailbox>;
-			shmem = <&apm_sram>;
-		};
-	};
-
 	pmu-0 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -1806,17 +1806,6 @@ pmu_system_controller: system-controller@17460000 {
 			reg = <0x17460000 0x10000>;
 			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
-			poweroff: syscon-poweroff {
-				compatible = "syscon-poweroff";
-				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x00000100>;
-				value = <0x0>;
-			};
-
-			reboot: syscon-reboot {
-				compatible = "google,gs101-reboot";
-			};
-
 			reboot-mode {
 				compatible = "syscon-reboot-mode";
 				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
@@ -1830,6 +1819,17 @@ reboot-mode {
 				mode-shutdown-thermal = <0x51>;
 				mode-shutdown-thermal-battery = <0x51>;
 			};
+
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
+				mask = <0x00000100>;
+				value = <0x0>;
+			};
+
+			reboot: syscon-reboot {
+				compatible = "google,gs101-reboot";
+			};
 		};
 
 		pmu_intr_gen: syscon@17470000 {

-- 
2.53.0

