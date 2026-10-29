Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263335;
	b=kmtgqc7E0pw4T8u13VqOPmhZ7H9Ei50TtRzY6ba9eFJUVKGDt76IuJFj98T79xm6eMwJ
	 GoferzTdfTUH6TUIUnz52CewjBhtJN36ZszruKtkuX/4iE24vhH/Y6eiDgoDbb4CjOKQD
	 BntpXmFI4sZf3h7KBAJcsQHKKySoTsdmzB34HgVjyenLzB4Vudo5BGuFVCCmZ0toTJzOl
	 HhoMMNhI+f/ISWOOaZXlBHsGpsG18qUfV53fHZzIuKs8ILVckyBMdlK0xjKKib6Qz2rUQ
	 +gU2xFBPNpEWtNrEYR6PQYhzeklgfnP9ySabZXL1u/vZ8iGFFtq68YV/w5/3U5B1cWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e+MKyeJP17yQvjU12eMf0hPES+qJ+wEjpO5VGrKIaAU=;
	b=ufMhcwslA8O1tTbbQhGTuQt+v039NDIWv9YzM8I1dXjYU0ZcMxqPxTjLwEWl/8OmKz/K
	 CH2y5ZjJQJu5bSE4oBPXiuzWfRGAa1cm6vr3gOx8JdT85UBGZMx3ZCO18VdBe2oTv383u
	 dBBAG114pAHu1FgLxidNdeiqaGrCbSueMaitGb8ySjJ68sUVsj8JCezEbzGzFXFv88Ax1
	 LSh2+uPCqCekO5nGnx1rSvbg6dyLdPWU6q5iYbkDxRznXnbYrVMi0oSODb7myV36l3xSf
	 KrTttCeua/iHZL/53me69m+Yuxdq+mYXOjbrlhmxtVxGcNooPEfMLsTUg4ylkFCwpWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKDRcw+6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42882606A327;
	Thu, 29 Oct 2026 08:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42882606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JKDRcw+6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HFMw2428256;
	Thu, 29 Oct 2026 08:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e+MKyeJP17yQvjU12eMf0hPES+qJ+wEjpO5
	VGrKIaAU=; b=JKDRcw+6YLZ9TFgueT+p+1n8KzTNmzNlVxTDI36d/Lb1A3b1A6d
	whdGHwSoZnFqxb6Pskbmy6dJG3lGyNVDZKHxgILUL6RUJ5jCBhL2uE5MF8J9YqQS
	sHP2JgjBPcZWioVIKQsaazOqQCMIwNI5En1Od2awbWWExmNIaf6mdRUvpYz1j8gz
	s5rniriuh5RwJajjoDDNaqDdQwMAs8t4xfeybRuvnNK7DWRX5/WyA2MhC4yGVAwE
	CxU3a5LizTxGdjHL01gn24GiraWY041p6hpkEzmYxaiJXFzq8NKQTIKV4u6goCnG
	NSlVuTlfVb6w1EZxeo6V8YEN+vNhrwOdnSA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b3kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 08:42:12 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8gBS1607425;
	Thu, 29 Oct 2026 08:42:11 GMT
Received: from sdciot-sh01-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69T8gA3W607417
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 08:42:11 +0000 (GMT)
Received: by sdciot-sh01-lnx.qualcomm.com (Postfix, from userid 3972706)
	id CCF6D21303; Thu, 29 Oct 2026 16:42:09 +0800 (CST)
From: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com,
        Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO polarity
Date: Thu, 29 Oct 2026 16:42:03 +0800
Message-Id: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae306e5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ojvm1N0qNNvi5I1zivIA:9
X-Proofpoint-ORIG-GUID: Ju4d9B0dGGTL7_ZTEwV2GabCmyHHrPWg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX/iTrW85P/rIB
 pL+uZwF2DPEbhqrqxnCYRspCGP3OuM7pkHl0xjENBb6sr67I3+lQiCO92Ar87kIB7nOCF2Umn9i
 XbCfe3W8CTiavUMUJSgvgyToqK03VMg=
X-Proofpoint-GUID: Ju4d9B0dGGTL7_ZTEwV2GabCmyHHrPWg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX1wlYw+bNsK+G
 5165r9VXwRkPVAF/uJEq7AmuWImc9RP1iDxfUV8Kzb98bBWZP70Dj9Km4Ezx9JoSnxZRBnjqNUo
 jk56A3VIrFkmiG/silrY70geV4C5RzGULH2p+dXhIoMUCcWNQdakEo2CTNPvsnfBze/WTOSVKdj
 veGSd4GpCGizQM7Xqp+LFtoQu/wsqYZeqllmpq7R6W650nf519japrmWDPh8zTzBfVE1mX7hgND
 m7j2uk+UZi5jYo8HcjjNYgGtgSjW4ImnPrpilEVQhgeIf4FexUHQ25CvhgxuNHoXYhWobBlt1kC
 DR7ByteZBbAfkJ4lJiGfLnhKuXsc3x0U5z3ZizLsO29QsAOzUHBeA3wjOBXlfn3h28msQm/OUdc
 X8mpKzn412qTwQX4abXAS+BdFVrBNiH+Dxq9b+JMqpp0JJSZz/ryVacJP1t0sJsb4Cty6JEjhF4
 jRpGVfdF+jiuT/cpflA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290033

The W_DISABLE2# signal of the M.2 E key connector is active-low as
defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..2e380ffee658 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -98,7 +98,7 @@ connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
 		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
+		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_LOW>;
 
 		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
 		pinctrl-names = "default";
-- 
2.34.1

