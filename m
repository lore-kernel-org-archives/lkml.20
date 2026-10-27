Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103863;
	b=zbXNV9Wzo2h4JLgnhQwlrkR7uc/4F1kcNr1luK/taFIWCKQfdfnO4PF9iBwmAFdlQLQg
	 7qUfCfL8qjYTmVRlkxUKMGiZXehdwzHGlzRSskav1FQ1RUu0QXGUGeCQ7NnWkbDS//tLI
	 DIcbbfPFgF38n9DcCNOKhbmK3Ac4mgMe11PmfGcTDdSV/kYtlTR00Bp0a7ChuoOq7lBUy
	 a94GogqZ478tdf15zVTD9kjuQgKdIGCf+l9mTTsNwsZCU+SaALDmI8CAgKm0BrKNDtAsm
	 p+CT7/s0MoufZRKpS0cCMpJH6fVNdtUJmx1KNH25SsL1Q48f4r6TpmVixoaqHz4GQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
	b=FpEXzcEAvkeroZHvxApmZkDVvqNKfw4L0F2MNY2/OHVo5spThKtAU6HuGmMyVacNLeBL
	 ZpdSLpyE7C/wqoFyf0usXznVdP/aYGg4/8v23C8wzfDWEB75ltTPhe40R8MFVQYkJF09Y
	 KIPpzMnyDSKCnNRcO3qMlLbHjk+ffM/srPY7v3x0N16g/MPXGEI6vfx4fyi4ipHHgDJBv
	 WTCSYEBjzSOmK+DM2ydWUCD112H9rPfFDIXpgluQJDBuTiJgIsrzIGb5VuH22QJxvJK7T
	 5+JfUzDKd5jww+NOcHIUm5XQAtlcdae7A3XUQYJHklkSgJjg/3JFkAJC8KS2NQ9t+qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E0606A320
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icyvtZJs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K28xqHHF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJ4N1427422
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6Wgwc
	Qf5t6lQQ=; b=icyvtZJsXjhz4DrqgWgbg18tiZ4ZjKbjJehTK127sa7yDnBhw8T
	TT2vUD+9D4R+KUfZ1buGBYySWnFAK6M5XRTXDMDbBc8Ut1Wx/OhJtWnNF1EU+ko3
	EP2az9xPWSHC3jok5bgSMy8wUsGBAXZHQBcpC8N3Z2j0TPfJl/RGEulayOhJHbeT
	+aYHFJ1vKWwQ4gyaWMqTNXOBcHtrBEG2ONpEYe8KJPHgOref4mkxl/mLjkToiuCj
	JGu/cjxDG6yzJXTYF4AGsOO1TrviSW68sZzwzqL8D8G3zcjBhLEV8lPipsKIPIK+
	J+lUQR42D3qZp+7z5OA/I7W/LLhp65eoASA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbhwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:24:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5914144eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103861; x=1793708661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=K28xqHHFRg7JuUVFsoYOm50N3s8Yo3B0Kau0JTJukErl3LxGirWHqHaPFlLpY+Edlx
         iESYyKO8ZHamHnGiU8p2GyimNy6DdmYRd1H3xTguMtmxrz0xzSC4ex/H27r2nOgukGRE
         RpXx31UXHdcmG2pctXXuMldiekGKKK8omH2nSruNbG5yfcmayQpFwoYOwazEyPco2XvS
         AU6A+Atus3zYoYwq4ZGQ7oZHsaux1v/OGgPsY8K4G4T1qSr0X0NCVVLJT6bgRFVeZino
         1CXcSK5bAW88wUw+P5NVmc8TWGJY+CudMXrwkIlvWFTLEtbwolaJogTryJkifzR0W7HW
         ev9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103861; x=1793708661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kyCU5vI0oFKj+uVJ2jgfn5MVpP1no6WgwcQf5t6lQQ=;
        b=o/8wVO1N7NHw4IkD/B+G8c0fzXm6iRkE9POa+DJOQle8xR/rCHHqPbVg3HYejbHoUd
         mica7sdXEIuVeyV9ayFpgw4bhfjLecWnSF9irWtnbIeHFlRgh444EcO++hNl750caQwS
         X5wly+lFbCDrXr8NWjoHLrCLNvKoaLa5vJV4q6//exxfrMheLml8L5mmoal9MduDyllI
         jFO4edAt26Xt8lGNL5dwWGe3vUNiK92DaftZ+qfmQ+deB/ldDzCuk33N0HxdhOSdS/+1
         4z++XVqanNomMXe5X1bkYQmDErpmlJW7EbIX/47V6+GuTcaR/VoGIzNzrhWGsNUgqmch
         AbJQ==
X-Forwarded-Encrypted: i=1; AKwUvByeTHJWsraEAuEH3h2/pyCocwD4GCDQL5O3BL5l5/sH8o93l5ffx3L8haom+ZV4TTpXBAB+hoo3GfNcLfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMCuhbV/fM2ya2i9vD3zEvzXR2uyP6JjmYIM5hd2BYVe+UUbGR
	uKeyWkvw+VVBY00bm1LWynwlPfn7paFasrLhhYLfy072uXm/Y21x/99iXTiwkiFIkY8pSBV1AFB
	A5hsX7b4tOmd38U9npRGa9R5hq2aAv8DpjsevdFTGOd27152vYdLyWXbqIdu4Yx21i6g=
X-Gm-Gg: AYBFou21krIfA9BXQD03eF3jxwk299S/XPzLkvtM6JE2KOfxrWEjYv3NRFOnZH+w0V4
	YxmsMtXHwNgLYo0JZxWDrDUmGhm9XxcW6YLhf825/6y5CUgwnTtDZulxq/2wA+YOb+uVmFoh3GG
	mfHMmyqyGqun7Cy3I4iCCJcO6AsEiZX6xbtcv134ZAzozu2j2de8C1HRPzbaEB0cPCuT0p5q+of
	2/Wu9vMzV2oOFJX0gHsuUWKqCrsb7GwsHWAafTJoZ5hJrQhDkPZrhXaR7rEod7UujlNuV9gvHSG
	b/lbUiIQ0OISH195QdQppIckAtd3rRWidK61o6B46s3BE108mpehJyPZkAAQ3St5tJ8atYQ0ItG
	rZPkf/m7jLbV5fq1N4DhAkNQH+mwn6HKyQvjW8CWh4vCzLpbV
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222634eec.7.1793103860898;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
X-Received: by 2002:a05:7300:fc0f:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-369e845b068mr15222589eec.7.1793103860223;
        Tue, 27 Oct 2026 05:24:20 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.66.138])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm32822215eec.18.2026.10.27.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:24:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@oss.qualcomm.com,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Move the PCIe graph nodes to the board DTs
Date: Tue, 27 Oct 2026 13:24:09 +0100
Message-ID: <20261027122410.62219-1-manivannan.sadhasivam@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfXxJ9cToy8NIEV
 624LV1L1QkLKHEhYRARsl44/lMVBPeGRfmHLqHCkJtGYgDxYB3RwURjGOu0GclEim50fqzVBvNJ
 ktg+6btk4mHlctgAkt3OMqzrRoH759A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OSBTYWx0ZWRfX7UQB7w/ODtWq
 9T7CRv4k6CjBiN+ZG7++fG9kxNxBYO0LoI0G2ThpAdsLNV2Br/HenIXlA5YnbEmNZS0iMiwAPjN
 mNY0GzOdlszE3PjxXBx7DwG6QHjP+hUQiP+vrC4UMZGUnurcrPG/s8lyfgbSIV4mTABpMlAizLR
 xQp92BoFSHVNRL2jcIYzcd6EfxjjcbNGFApuwZ3OGHhep7eIsRXEyPH6iL67q5lXz1hvE5JqTAn
 +qfEoO2wqT01cEGV95XQ9yyp+8s5kvDsYM1bzFQcfCYPDwgNSTkMNhWRWAZ6zjc4KA6MjhBVd3r
 KHmrzJWIR69rt3T7xYKl/KhcLvcbztxR9Ek4L7V0C5/O8jxWfCNRPXLZ2KMPsbRHcdw+NHV8qKb
 Zn140tjEzxXciSatpJXRpobBQQm8eXhPJz/gkj+tKicjQwe5VccnvXlc5LMxJWx8Lp2dw7pLRsP
 Z3jHWCea0q/kihHKcgg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae097f6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=+eK/VBehCgFHFEY5YUZdYA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=u5-EM3aH4ChXULmVINIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: J9iKFstuqGC1t9c-C80-_xLdasB7PhSv
X-Proofpoint-GUID: J9iKFstuqGC1t9c-C80-_xLdasB7PhSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270049

glymur.dtsi describes an empty port/endpoint pair under each of the four
PCIe Root Ports. Only the Zenbook A16 connects one of them, to the M.2
Key E wifi connector on pcie4. The remaining three are dead nodes that
no board ever wires up.

These dead nodes add more churn compared to the duplicate nodes added in
the board DTs (when other glymur boards gain connector support), especially
when they get added to other transport nodes such as UART, I2C etc...

So drop the nodes from the SoC dtsi and only describe them in Zenbook A16
DT.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts |  8 +++++---
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 20 -------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 939e1a927a79..aba1821c9375 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -825,10 +825,12 @@ &pcie4_phy {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-};
 
-&pcie4_port0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcie5 {
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..e25d4cd3885c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3000,11 +3000,6 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie4_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3272,11 +3267,6 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie5_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3488,11 +3478,6 @@ pcie6_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie6_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
@@ -3758,11 +3743,6 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-
-				port {
-					pcie3b_port0_ep: endpoint {
-					};
-				};
 			};
 		};
 
-- 
2.43.0

