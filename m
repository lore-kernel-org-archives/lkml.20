Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655935;
	b=5pz3ZR3yab3xWoZtMAk3BzqpO/VzZIKu2qq19Y1eWyTR5tV6rkWvQ4GvdR7sdaKgRml6
	 aF/XiysX8sUF84WTvUdvggDGscOLPxPaZ2bXWh7WHMp5uXJalOR3Uhq6JLqhVg9KvU1ye
	 Lmr+yfBjAQkNgiKMpKU9W6eWWFfetKMvW9he2jTWezfhIdA630XKKw7lTdxfQ7ia5rH8X
	 okVQkTUYeNyTD4JPlNxaCvRkVh2Dga7h7ZEaeIdik+i04d0tWaVmw300hB79QR5zHCXCF
	 sL7Z4knxbp4c5Qxx3bKnlaxb5agaKu/lV4hSRZxSuYhzTY0nv9ok62nQ1mTSlk0vwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
	b=KrPg5rvvfT9M7ThSwW8xnxM/xykTjf/XEHfkWFzvUZpTFOeZ7ynuuqtZS79wxEs5RMyi
	 KBrgUpeWreN5l7qX0OTIxBT3Br6p3ABorsHWCriZL1F3HrjYj0BALevLW7q7yXd8LJONc
	 rheGo7dJci74giX5GljF96AIV6Tt7h3hzD9regjFDO0dD3fcZBmnEro2pDJxkYiJwsA4T
	 VSPq4nf2deODUL9x6xSS8W4Z4wh+E+1J1dwBLpf9t6BDNRzorgz90FbPJhisNSIr9R1wS
	 mKyw+8oROT7bcaqJbSjIlANpDcUH/ZcSFtOK1UioayOZtK+73VxiMU18uFM/BHfCLyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTfsJAMg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34136606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34136606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rb30fIlB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTfsJAMg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wRsA3276455
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=; b=Rb30fIlBgs+mcJCD
	QUBI9NvC+h1X+6x5RkDiB4jvORgBbB5+6PMB0EpONoFZPCx4kdp1j6XNqARdEx6Z
	ypy5qVylklR1HjsMl9Nvg9WEJC8qte5JxFxcuDHArHi2XFE6ErX1aSGA93H2XiJ1
	orCDrKqx2X4DdXwgytW8Ws9UQM2cSRQkG4NPboww7Z9qLUJvnhl6V8pv5Al+FT1O
	XLNAMNEytXRpU4/bWp5qMOdz4YHoOgjFoJ4uec+58tsCj+f/plJeFsVmhjin9rCJ
	FWZ8H6Zi56R5xrbHD3/dHGD4aj0/s+bln2V1mAAtDom3QvNtFzskD0Kk8K1anH1I
	DHME0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgrk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:32:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c644cea0bso10778631cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655934; x=1795260734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=hTfsJAMg5weVnvJL8nApskiRtImi1Y96OGjdv1igQL718HFY1XXSvTcPG3KLDlMbDW
         L6+2RDNb5xAOCtVLF7YSOBkVPhb+w9UyDiMT4WN1kgtCUnA4nuYLKkwyI1iq2IU9peLC
         bxLODXD/x0GCODg0g8buic5dX/JJ9m10mjckUjTmWvq9icLFfD4C7WtwqaWKbcDgTT/V
         TpCJLPqug4NWAktqaz8JVBQjZ2SxRkxPvdD4u/VwzlnqtOzpzOKB6qAOSQ5O7PcNnR+n
         xkUP9l5ObAWzAgI4zQ3OyMrI/mi7sj47KGaUbfP30OGuroorM8SUkltUvdcp+IkTAbGH
         aVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655934; x=1795260734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FwRq3VlxuZOz2/oWpMJYB20jd+VwiCoJHfeMLbEL5A=;
        b=qDd4M02hECJ9Bi4UgaHLvqPdfiR4BRXggS2jVu5Sb9daNTRj1S4qOyV61CQJxU+cO7
         rMHfllVjw8qxXdeoPczvu1PRcUTXLU/0UA8GRPAnYsoDjVNzwGWa5yi0otM3q94Wbe6o
         PVFoRQAZLsZwbIyWxOKEm26lZs41NGvGDkBhtOZlLLp2aMuHiarGULRiO7ZxbBCcJtty
         dzrYECb2BLBiersBWe54Sr6Q6R21wWXBJa6f2UlUvrAqSOjYbsXGcPjnSwq9FZeOI80a
         U89dRT/EdF3lHGhFWSAutoMdYS6I1f5vODd8oINlsyL8aqi8ieD+RkRd0WIdCtwStVui
         3K6A==
X-Forwarded-Encrypted: i=1; AL+hErFjVlcLNxPsF6k4bKjme/mh0i40vEupgdLo5IvSH1gDO3iY7BbX0BOFT3/pehFHkK1sgOs8ea4f0HpBZ7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ykXNqOJDgtVpaNayG15aZprqt3sTgl9eimm7NcsXwIwHTrDMc
	P+glpm0PzgJvgRGrAp50LFXtUayfprovjJE+iJBHttjeEYVaLxJtno+EE4mhAJAaisLmSu//uSy
	ozzapjDuUjinhgHVwQFMq8HX+HJX06XMkOwlGyYPJdTSr8xI3JYh58hsnpbxVd8hGWco=
X-Gm-Gg: AYBFou0uOf+sDk5OzlYBU76X/xy2sjR/lQlEWRJCOC0yPzy2F/mwBhRlAcKzok4hexy
	JdjzqBCDFWwr0+FBaaCRbWOi2bvFbZI7O+XVxEBFWKGmNKUWxq1uLzS2DLlua3i/1E+LnyoNcJU
	8GvnFXxqxAnOvH+aJHpszqjjRSL6UGSNvSu8sQot+/ywe3CmiumSU4ttJbRxUjC/co8MNgSD5cv
	7dSe9vasXwacerX3mC2uYEMxU97taX6n115vGx62mL4Fe8SldtB59RNjJULed/cfSlZ/zfA5CrM
	/fI+AnJ+0j8/VH4JC/eMcKftGa6Hi1dJBMYDpIj3sllYboMJ5yclOQT4e5l582zzh/SuOCurrSs
	MBsIvjPzbBLzROwspdkARQyExh2TSCgoezsHD71tadcnLlbzV0uomB3xlA8Ebv8hSwsx4KPz6OI
	F6+kCxUsBmakg9PlP9M3Y28TXadvDMAhx89f2aHnOd
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78978201cf.18.1794655933495;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
X-Received: by 2002:a05:622a:620b:b0:536:5ed9:26e1 with SMTP id d75a77b69052e-55ac667fb1emr78977961cf.18.1794655933007;
        Sat, 14 Nov 2026 03:32:13 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:32:12 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:33 +0800
Subject: [PATCH v7 16/23] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-16-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=2166;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZjpIL59WVpDn2zuhTRFHiQbumlAhh6tSXd8R3gIf0As=;
 b=hqMmOgnhfauqkwhUk2lv+qrc/2o12LH4x6v3Jcd5C6MQx+NF/ugLG+9jQALC6LqjrjvqK4+NB
 SxlmJRyJgwdClYSPI9vbmm5M7ig+CXxAVrRS03QARqIcN2Qv5oNmuc1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af846be cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZY3ACuDlzNLtHqm84dYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX0/gSZAhIVTzf
 u7iBNbvxdQKfo1rXpWKVpzfCo5Xuv5n1qWM/Dc+/hkma3lrKzEMFBwT6rgRlQh+y/cTHsRi8EL2
 g5LoLbqK/ZdEBprixG7jAlwls8hikmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXxoNin6fVDRGn
 BV8toqqGEEnSxPLWIr5vHTba13isJe+uu4bUZJbTHkg9g+PEoe6s9Hg0ZnOBXVK5ucaf6ShVMeP
 C5ka4jUNFZ2BlAw0vL/dIFuKOD+3T9wqkqhtUicwxaRRMwgekqYWj3pzWnDaEWIfdiRxLFW/zZo
 0jyhgT7qPRl3OZoHkwYULToSrEbAfawQOV035aYRG+r+ALw+klKl3pCTrb9e2ThC5etuRo4WdeC
 ZwOhiz9MCQaFXrvwiEnrPrQ6fhzilA5NqqcoCsZ0i0hPqohvaMGlPLKlk6EQDXAUnF652diHGFj
 FJWpd1k9CauUxfJ32Se0ns/jEdfIZoV7z9wC51lTYsLgnoyL4TRjBxNBqLGDgWaAngiHdCvgzIO
 3YQ7WyjSym5kO1mWcg09IORyJMM4aGrAXf+8tfw2WAsP5HbmpVSbzKEQL8D1TnmerrQpXxKfVqI
 4XrLlooTk6MKu6Kmezw==
X-Proofpoint-GUID: Oi6L-FL90yAPQy5FNqOotAxghc49VscC
X-Proofpoint-ORIG-GUID: Oi6L-FL90yAPQy5FNqOotAxghc49VscC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Define pinctrl definitions to enable camera master clocks on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index b1fe1c2f5ae9c5b6107729fbdf31c2577ee3ebd3..522d2c0c374cba48de1420be5357db65864bd3cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4386,6 +4386,62 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio91";
+				function = "cam_aon_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio93";
+				function = "cam_aon_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk6_default: cam-mclk6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk7_default: cam-mclk7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio113";

-- 
2.34.1

