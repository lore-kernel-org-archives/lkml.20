Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0BB41F359
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697239; cv=none; b=BKJ00g2WScNzEwQGqcuC2EX2vnznOHYFQ3VCqOWDIpsBx3BcN5qMGu3BRH47kvoRjI1C4UWZawVUe1DD35SxfipCbWGlGk8u8WiAQ0D4kvj9C0grEMzEXD5JZApmdMBf/U5P3BzZBDP+270J1c7tv0yhBR//AyXwcseV8rPZykk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697239; c=relaxed/simple;
	bh=tVAHr9MefWSa+t58TJ0O+GDITVUSvOGFLXxq5aqVEyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulFvEEN7ym6q0Bgmq92HOU7aA9ipVaaUvRGmwLE8LlTb+Erwm1cARBNfVWD8HPOLfHWe2PBr30YmWQM+FFxKZFvWY+9Zup0apZ2jdDAQeUVJyBfKWbNLYgB8saHrKVmjGkO0h+Pgl270oMDBGHfPIXKbNXDsX9sY4KXLhmKTqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEmkaLRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9JzW9fd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEmkaLRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9JzW9fd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8qo3301599
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=839gDDq5qZP
	I0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=; b=gEmkaLRQxeO2U2C48CeiSdAEi8Y
	B0FulEucSQaDY4YLllXN9VMGGe3mcOhEktT7MzbuWnvnFqPS+Nzreteatsh0chNJ
	cTIsglivAQUfn8pBeZlW2KSVyWBRqnd/+VVww2gcRKSFLuJPKvn/xRa/7cMg0oA0
	ylIUqkp0wiWXcI2qvlg6jMy1v7TSrFmfW/+2hPUi2JoYWRSYTtXcnbOsVC3AhLyi
	JQj5CarNqwZ1vThpt9FFNhYnYUZ3kBQDcVGQ2+/KZRpfS7xVI5cYkrn2DG5++YJR
	gv7JrGBtUOpYyqxNZO59hXFvPD4xRRP7tGnnQe+IKNR1jVZSeJRE0LBn6tw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0udt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:57 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14383177746so9670661c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697237; x=1791302037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=839gDDq5qZPI0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=;
        b=N9JzW9fdMVhnRsPkg5EjFQxZAKFCxki+U9Y5VXSJj8qx1UjYnDtPw0rh5bpAKlW/Zo
         y+WKTishQoxOQo+dcqQguKRvqP4ViZ0/fJ8omnpC4BpsLUQjlW2vWqxI7Dz2jSSMt+OS
         UFwVhvC/RwcXX/aK66jThNgj4XqdfBXUfUEtvikO17xSP9JSJ866w2C8tdvs2K4pEeaQ
         v6k8KEabBg55rOz2KqWWyisq7YBEkC0HTsgzuawuWCjRdGS0s0k3UDmANCXbjzuYGrQ6
         MOYgdsbs/wdXyhTdALfn/EQTVmG+0bsTVfrYnsL4rctpkb0TLHRCpzE7VRrQo276XA/A
         JLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697237; x=1791302037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=839gDDq5qZPI0DAPMcjXrTtc1OlOlOgTU7/KGh9CdtM=;
        b=UmNk8x0wJNGy8NNYqVVgS1fp6tOP5FPoZW/Ho7IL4i/oTudTxuQ0MeevyB/250UZjF
         D+DHShLdPoK1Z1+5xwBfTVfbsYSgntYTiPbxn2txMJOdsdx4OrWqBMGv1sslXM19vsEG
         95rWRUPSLsIJG47cPOeMQIuO/vfGatVAm7T0PGq1HN+P0qBHyjR8CUCuR1iov4BzDLKF
         NedGQvcz/+0K/SIU8vX9LRx46uurv0W4r2vNDq2/E+a2MggICAvTCzRutaVmFcZ9j2PM
         uYsIQH9F028J9TFaIPFjHHHyapPr2pKJnpWCiv7fo372N5fhP/C20gK0CjraOPCvUf/J
         pj5w==
X-Forwarded-Encrypted: i=1; AKwUvByitPElHl7fDAhbPT8wuqOCGahSixk9NguBWjzQsLZFHKmLTiDb6k6NJ6hA0KkUxYsgT+fLtPUv1uJrAqI=@vger.kernel.org
X-Gm-Message-State: AFuF++kHSxrL39/f7BzE5kp6/XhZCvZrgjSjv2WJX96AFqkkBNFdZA47
	qXW+LT9NLkaxVqK4k1xrq2bR8byqJiGd7aYXdm8o4l68igvzKazqJP9nsB3WkD91LgUAXJ7Ogqv
	A7JeK3upI5Scz7gpT0ptA+5uioXI3JieOIlnPzsJj9gZmOo47+o/a1jxXsOOGcwoJylo=
X-Gm-Gg: AYBFou1ujO4muxHYEmwfY9f0+RdnN0WUYURaidCKufnfW9XYJmUrgw6OrSrBM/f8faP
	IKzEA+hnjo9kb9rUmqpTgnST/xiI/xUaf9v0yThQTYhrqyKj1dyMOxm8nwNu17U5OlZZoxjR4GO
	aoTFac5iQSA+acACbwNClTqczknT7VgdAt4CVzaop8y+DHMjCPfmoyOQjZbK8/bSqTS4zgU1gWg
	YNtapjNZP0u1gs0J/qCd+T3V+eyiUSai4WTgHHI7McvZ+L2kATxBmMhwp6J3XeOgC7UibD7qjpv
	vX3dDt/1vLlq1hWIJXfPxqn6TxMmdWjVrYnfd9qVj8uUDd40g1t8mywzxVf68B72VcU7tsAy09y
	iL7BiDcmT8Rp2tIg7b31H088/sqGfrb89VnwfR9oU1ZeP+zYBa0wj7hXXuis=
X-Received: by 2002:a05:7022:222a:b0:144:f089:b189 with SMTP id a92af1059eb24-146d01af97emr19420013c88.36.1790697236758;
        Tue, 29 Sep 2026 08:53:56 -0700 (PDT)
X-Received: by 2002:a05:7022:222a:b0:144:f089:b189 with SMTP id a92af1059eb24-146d01af97emr19419954c88.36.1790697235939;
        Tue, 29 Sep 2026 08:53:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/7] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Tue, 29 Sep 2026 23:51:49 +0800
Message-ID: <20260929155152.1898666-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX2VWuahy6ZV/v
 A5sDoniOjtqkN03zCud7vE10+NDNtdu0W8t+abUXfljH0EbHHOEswU2hyD59Sjr1Ilrf63NB+xo
 tieknTp0q06BeCpQPou/gLy8FeFry2ch3lYYfLhhVufEWZFNVTd5kDcku4QfXdKLAiJ6RRP4aHk
 P8BQBBCV47MzdYOEzQPoVgCi7Fji9z0dvnUsxfgzJaCLo7Jbizc8OsfaxEjNJUrlk3G1j9xJ96S
 +7oSPA3pElduco/As0K4jSY31Ui4NoBKcyurLAXh0QyZSQSiwkOLvfOnT99+TMNwPAoSj5ZtBOL
 nA4NyvlwgjmeR61/lVZnJGIATfdSdcry0e8bESo8KpwDnVsTZNsBn1CjPSDztpjmZdEnjpH/jqi
 r6tZJpa7R5RL9HsoAssQC8M+npUk0xAZfJbI+IS9wsWXrgF0en+R3lVxCJO/UrPV3VF216w6feh
 39yMyVn5OLCtlvVfN9g==
X-Proofpoint-ORIG-GUID: UhE3XgdtkR8hcPFtzBJe1RYHE-KLFqto
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX7ne1BDYYH2/H
 rdqjCzwaQiWrIqlGvFZGj613dqFCWR6cWvqc0GBy7PhJ7wEo4OnwlPb64k9gsOT2dbWl3THL6lz
 Haqtd81pMPLmNZvUddSj1gzzDK9niXA=
X-Proofpoint-GUID: UhE3XgdtkR8hcPFtzBJe1RYHE-KLFqto
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbdf15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 32244921263a..aa52238adb98 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1871,6 +1871,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

