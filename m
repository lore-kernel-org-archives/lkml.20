Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456711;
	b=dyXl5sJEKDa70298vnrTFQzLUGKS9xeYoJDuJymE9L0u77BSZdj3ckwUfcicRXMtq/e5
	 sJ+TjUM1KXfW23H8s81cOCQj338SNh7DGCwsnjhLXEI6B337pij5vc6PueUPxCx/0YSSE
	 ctjfvNHzgfcNZDlLwZvyVbLf+tcC9KgOFGgzwkETwoG5blLy1IvUxHe5XC/YRdaFn1HEa
	 g5kk7epVrtSNtkG8En5TmwzAbenVmnDRVq/6r06ZJ0/sgJRlw9E8YYkcoID6JBbis5YNj
	 E4ldjTtRZ6bywTrSKFPwDxlJCHbTpaxAhbwsn9LZDMahzw1uOUoTwRsIk4OxiCl+oyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=vp04bSSCkhCeKdB+6ercEFm2zZh4MyZ04mvVLbWMYBWHnS+ibkSDqPlRnc2zVMuKNUh/
	 21Y/BSSqWXK0zuNME3WbBoFoFXl1arQGCK9YJlz5ySIw+EjJSbrinWm5dif5zoPvjYtQt
	 pKsf4DBm3AUE37KORvELaacyshmNwMt6diTaWGmL+Cp5GeAlUMz+fo3GCr3uzBzf32mjm
	 7e27cSvdN4OL9/Azv9Zmc4NeggsA2aET3BXQisc5r/dheIbQNazgCqYxkUT/k0rilvQG5
	 y9WtKyzQBhhCNTWlNytclGIYzclW4nzdmxrEDS6C3eFqp/J6vKFcBKaocpxbw3hWbxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14287606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14287606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODwIZ6ph;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fnwBjjS5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD03wA590574
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=ODwIZ6phT6LtfDVX1vhVpeiKO21
	eNHpum0+d4r+xzmEd+9OwwLifAXXWudMWQgUTOv5BwztCvHOwC4HIuZn+x9yYa5c
	NZ5yIdHo9YygzjMLi6tCBk4llPBOsGtHPZh4d0RS34psRR13Gmx+UtVgXsIPKeY6
	doGDNs2/2yUYEbmhifYl3NM1ipjdgOgfzOjIsDgzp63SM/9QtMvnBVUC/QSXFExb
	09ePabfmxNK31FvkjnoUdxPLPKnmrzUNrMNjmo7Oajv/8N+SMax0fGwbvxpmxbxt
	qJAnTZKgzLjxF+7ggSSYj2XKP+ulzMeezhTSyJTnvK62uu0MDf8FYhErJgQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk13wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so6960313eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456710; x=1794061510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=fnwBjjS5s0vxwo/QeLgAI8K1c3CM0hANI1zsbkC0Khei9h/nVmI3Y3HSmarjuOQScs
         RSFu8zj39D8CpqMQvyHqTz0Q/mumDjVfgEFlAHb+w/lUkJq9KXumr3+UVNrYkasUL50T
         Qm+cXli+qL+N7Ea1aVMWJlfxSqQvIQpOrMFHVyrYOvWx5zHOLj1Az0s336XOLax0p2Rm
         Vg2YoLdb3s9lSBR2ZXjtDdFkGBNWg2ZwgWuZc2kieDyiO81VRr7+DBU/pChSsldhMfV0
         AzqiG50Z+ob6G4Oqzj/ZnxVZ6estLOYiCe8PzJ/l5QVG7oEAezHOfZz9z1ymmsWY0J3v
         Xsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456710; x=1794061510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=tDA/mKVZfyEO46nNMdfFIrjhmfTfRqO6Mdc22L6I2ULG2zVN7EGedHatEG0eaG7sUN
         BecMpIU+545j72CzAJMqA6vcv/6wj4TVhxgGRru7nKbOmEIdfyStzuB5VS4ufgFJfWdl
         C0TRs5MT23Mu/7Am/ZoMyG/h4tdL8hvzAwaKIQdMsVNXwvRA7wW0jmvtopqiyr1rmIcY
         if4i7oDq9EBXTZRzzJPS+mi3+b3KwjQSE8+BOiIh0rRF48R4fP7+5bdzEbWRbsU9CgJo
         PcXi5ks8pMw4tCDcx3/LtMa6KBXLDlnwv7l9XuQ+CL0FDAEcAiVxniLFKoVKx8b7dMb6
         /mAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNxmJr7ewHwcmp2MvrUi96Y+LJ/hPBaZ++Lmuirp4ufM+7DPZx21ZAfehzhw99RP6zF1vEDbYj6LKqLI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYICcLS9eV2IRghPY1+sk/luam6kJOQ0oABBhiJ/o22JhEs6cm46
	vhko/B4wvA/EKz8XPQgHnaaCFmtk55C5bGojSo/4IsCOJlKJHNQvM0zwaF34UGTe8xYw2NUKUIC
	tsFWJmytCRjlT4X54V5IALAjZSfyo35KfEPN0MoAe94MnDfL5HOs+FgyYzaStLl+L7og=
X-Gm-Gg: AYBFou2xIk7t3Oc0VONdQtH6YFXmUSfGI8D+hpneda9u/hc0OOM4KBml+4o3ZAwYSZV
	i+moPjiwAbko7AeLH4WASep0RpqJPs0bQPbndyBxmyVUAnoi1cTlEWhg92+kg8AeBkEvzSeaWKO
	p54Yr8YCKuF4wvTG9GpnC/dORiauCR796E5EjSruidcNwZy94umjVhZ7sp+6c+TPUkHAjvgwned
	NCYJw84XWMSYv7La60J7ikCEY2+uBwVAk2vTNOv0gcG6YoqBIvy+UyWHzF+x39cH+UVNxUp09eb
	52OWQdhwCyffpbFeRasM48tMIcAP6mx7t3W1WH1BcSVtGwbMzVR+kSiSjDVTwgE2NoK9fdEv/AG
	7gKS/EBxVa4iegyd3okcIEwV6ZxQ+Oi2yS+XV27cCtCAa8jagGKoXYbvYd4obvIzj5fUrSMHkOE
	YV9+vX/D69GXtFU2HBt0DDZ2YOTVCdQZW4
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675974eec.3.1793456709412;
        Sat, 31 Oct 2026 07:25:09 -0700 (PDT)
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr7675939eec.3.1793456708748;
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Sat, 31 Oct 2026 22:24:29 +0800
Message-ID: <20261031142433.1212809-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: Vz89wuQpO2WuLQuEWbpfY7lGJy0sGx74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX55rKW5sCbxSr
 G9MyVwisRIScdEr/q7oMm8FxWYAykE12E1+N36iBgEgCcRBIMZMWkasEbZNKJjrShC0VCICQcuD
 cKXRldzVZcGfR+2v/1cPVOyi9VOr6NjmgY/5Ijn5i+C5ipyFDG/5fkq/na2mG+GVRPN+546TeeW
 shn6c4jZQT6vqiY+VkR2/9vb4b4b8RnR99W/HOKVUQWPKVIrwMDkSIkbn4anrGl7n/EXQdYQVno
 M7aDZxbrUySCeVhwL5l+ObA0CsF1ZW7QDIzg0/FjoM5hUo3+SKQvdudSUC1qGVKepia53ViVTaq
 zaG0OrTIbVacbdaObepuVHwd6woME1poOYZ4+TogdnWTz/x1sxRg2wWtPphdvNqhCjCyNI/X94f
 vIwJrG32P39ZafyoZFLMGLreY4JmeJSUsu1xMTJaAL7VEHIuR5WN3VOt+07LqQ7EXQB+JJ6b2DD
 oKoNxnBdFFUq30eu7EQ==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5fa46 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX/Wt169OrewW1
 KGa0Y7cssyqmN3DnEhRaboZUIrG32uORkSIiFFs61htV2LoDuZDI1alaXaGF2npU2aHVU8ZCXUf
 MwmjmZ2Hwo4TeSsVaHrmzEOdcSo6fFQ=
X-Proofpoint-ORIG-GUID: Vz89wuQpO2WuLQuEWbpfY7lGJy0sGx74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

