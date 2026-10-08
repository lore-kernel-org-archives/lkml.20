Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11348422F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450896; cv=none; b=T7X3GK8zX7XXnE9WhsEgMv4bpCPfbIE4cky15iyDfplleZ7Jv9MziI6pwy55iKQITQ6ZeUvZ4QOoxstrvHvx1dXsjnqPzcLVwG/29VInHNUjscMirNsECAuSIGWwVXMA8lKoubPje3m5qrhPq7mCw5CMLZw9VHsWGEWeZbuYG20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450896; c=relaxed/simple;
	bh=GhFRqakdXxPtxTbtrzN5urR2xQCR8Jnvt7LGgpDDpaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNTqdzvJ7tKWJKZ+QsXX4IdAl3QDJGNBP4f04DboW+/PjKLunr2vNl6adfFPKAIrgUBIwhyD0J6iX3umRwiTVvJm8YUoxKurT44sV+kYJqNPJ3NQvc/ljADdWfzwv+duEE0wQi1lbohWY03L2s8k5zhQghs9HHbuw5gpVA22www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ou93vlmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQOj4mne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ou93vlmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQOj4mne"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KX5m1170006
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=; b=Ou93vlmPSAyQ0wpi
	kuwT9fWWnsTwkxEzmwT/Ggopey4PYwVGeweLFP8v5PuZUbX8PCeoVk/pTnN/g4v2
	pzx2Vl+nKirvxLXX0G5wswzr18K4AcM+mPOalJw/4KdvhSRK0cpCogW/NCF7sdWz
	OKPfZfO3oV9MidGKxzgxGrSVxpxBUmShP1MEal/IkIOIaSGLppfpOwhqiTok9+8t
	WFqW7oHL78scZaJZ/oHur3WlHxsrESLp7hUvEXY42VDUr9uqTr0U/i/QoA/lVE8Q
	8x4M1Trh9XYD1BBiQveNO7PvHAIDZKbJVnNxZW6RVlyC9NsSlZsD6CGMFTshyX9z
	fl9ZHA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:14:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so18241669c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450889; x=1792055689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=EQOj4mneZgnIjatJ83rMaYF2nenbQ5g7keIcwLlONFiPZlMHngdWFwRf2jSmeQu2vp
         wy7E54Mg/e9JdAZyNQqsOxPcwYaShpgIdf7xb07cSS8aBCg4pFA78vz28R4oIPONiXzx
         uPPi+9gzoy7NzCawh4drawPjua0Sl1pLRPCUPhVfC56tdBYnvqELmIzKnW8rtdIFce4m
         cr4cALmX6Xg3otC5eLMs/z+5nbVmUuZuVoq303Pce01LyeLp52n6hYoXg7hscUoKBt0S
         HzMrR4RpCf1NiztvCOKBhHkBFv2wv4Y+t5H3JeyG6+Q3Rh+Sm98iFA6RQt6PImVWGROT
         s25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450889; x=1792055689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qcHgeO1xfv6UWffh/524xIdjtA4+f0IFUNruW8igoc=;
        b=p59cMGB4EGeKo+zimZ/1Sq0w8tHMZb5+pLe2BTBKO8QRqKcLu3xqYEoh25XkjqS+nN
         gI9GmM1iMYmpdkfMAa6x2ff8GYAJRNyzFr16nAztF9J6QbQRSk+bvOgrzrfX1NxBC64g
         gK2LcWvsreNg+9EYhT6z9EF2PrsIu4JU0TU4kMQYg6oYe9xOzDEgyFjfByBY1/V/Tccq
         Q+Qu/9Ae2JnFE5uZKaEk1Dea/g8VuAOS9Rkro3CdwojsWmDDxgih9X9fIzcYFfRk2IWA
         +6kU3W5lV4HfC7bbxE4wIjlQh+HyziB6sGMzaaDUXIU8T392CyyFWz84L1Cwaee7TexC
         K5eA==
X-Forwarded-Encrypted: i=1; AKwUvByDitBmfmwLSXCzhosv9U9JqeScGcCWr51EKXINgGQ7Lcv10nwHNNl4PbMh8U87QwqMQvUJvdemHbNpaPU=@vger.kernel.org
X-Gm-Message-State: AFuF++kE05N+W+nglRQtxx2jYCeRcBN2jHSv0gNHrgBbDviqDRTkRqJy
	ZgDNfxUYNfDuL5OEQfKb/dKQbaV60kebeRtNtQwpKeYeHgu5rPNj4Xvg98IKejp0Ls05TcpWAtU
	9mRjyKV/oEWKUf90iQp6WZo4QbnI/z8Q5iOHFIS4Ich4cOYfXesEPcwTp0QR8uzDgYpo=
X-Gm-Gg: AYBFou2O2lGfeI1LZIYpsKNHX5AtQmpY3X16G5bqZxaSnmeDyCYqxA3j8FVm/GTBRIl
	8ZDy87xkiz6kdN+RjJ/pX24khjB5q/mC7S1eFyvyjsvFwVsPh/GSOSkm6tFUbVCTbmKIgtH6Exd
	1rZWqZW84vrESEU2gdr2QlJ6BVRE9iQuGzll69pcif2+JQvBnT7cFGwGBfySBIDhaFjx6T2wIdj
	LAh26po0IGij+dVEvjIJvxUkomPbwXo9TUxPJGctdHDwxlI9jUPRFzEPLeaRitIcYU5HDAoeri5
	l4m80binFQUMdmutQJ+tRg5An4ypRtj1TAiFMvyncI0dijI0H4b9+4LKZjk5P7CBbojbk9AlJMY
	P7n4URUXJ73e/M8Sn3AbmQT9F9O+B94Yrk3mZFQIlYSFYLvz0LlYfi4x1xSdWyyoaDaFWc/Ygn/
	tjAMeiaXss8sc7Hchnpq/V0yz1x39R
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728550c88.26.1791450889097;
        Thu, 08 Oct 2026 02:14:49 -0700 (PDT)
X-Received: by 2002:a05:701b:42d0:10b0:14a:51c8:e9fd with SMTP id a92af1059eb24-1620693f02fmr5728522c88.26.1791450888178;
        Thu, 08 Oct 2026 02:14:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:24 +0530
Subject: [PATCH v6 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-4-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: k-VgxE5Bs_HKYi9O-OB0TxFp7clJBb3v
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75f0a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX4roQDSCRRj4T
 CkcZ96wkWn31eUXBtflQZIkfYOcsxjMCmWKI8hbPtlGHKhaeLx23nqBcPmTLU/jK7OCOq36t5X6
 ZxyuiyLx5q3hXVHBWuk3nyGI3kB5O40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX6wu+2UiDSiZP
 Ch/VY9FjmsOe7+9lPcTnpDOGpFgIKyFHB+hSBq6HnD6svqgKhxJJD9EDzhKCpeXUlQ0QehN6H0k
 mtQLjZTCXBBfxHnYR1uBfr8tblc0robI2FtQtG++6lXQUbTc3V4B/RsKbLS/P1w3BNNV6Qu/RbK
 JkFZlWdrd9R+T2B/N7XsRHmhDyHDRIAONtyPy6rTJxDFmmL7FTo72CS9y7RqQhQlnHuAvNQ6716
 4gRarqxarZHtfHt1x7nBsrPWfQ/JTmo09VSb9HWvQPqEuihgfMOrOUpR34StQT7cPs6yUl9s5uk
 IzHZ9mdp0yZbaIEZNNV1fXKXXdHgzCLcX5InwaGk4/uOT9gsy7m4Kn5zOiUXye06FOXPLBtnI6V
 9lY4+Fw8AXmhukrGh60BVsDrE9hck4rbmeqB0MMJ/nBplEIJuDQ9H6ICyFjBeFmgbc2muMFdPFx
 JOfUieSIydXUR8WxjaQ==
X-Proofpoint-ORIG-GUID: k-VgxE5Bs_HKYi9O-OB0TxFp7clJBb3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 30c8560822b5..9f493561037c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -123,6 +137,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

