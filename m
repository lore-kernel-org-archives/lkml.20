Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383551;
	b=QRmBI9uAHCoHpQvGG63i6C27vAa4CXvKqVlLKT16uRbmDkcnCJbKKcMAgbPhPkznLOJW
	 Ar9TMAXw4LZehyvtQLNvyqBB70ffS6LZEPXXO0s6rbSiSQHD/GkoYp7aeBfnzoxbOcBP/
	 C4DdsdF/1szKteB6/v4mtHKfgVv/VPCjBwYybyb8p06MiTcDMbhN8naMrZy3381U2i54t
	 Clo6HqC42jiQrlwt7lHfSO/s/7w3UJ1J9Sna+FmJYlU1u5Cp4/a2wFg9T2l07LBu6tnyP
	 4pOv3TWoO/XQRwz8DGuRsijE3yRGs0BsQ1G/JEIVlk99kZDCvry2uL8EolUUFPql5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
	b=q2H+ZDfrTMDYqn2qMT6MscALoYRb0alB7XNo+SoOrjDP/PdOe8w4+VAf9a24frZSeaEj
	 69lwy81BDO0WBgCKHjhQaJlN6EZ5XflnishMGgcKSBpNWQ/K89HLgrqAkMzSjkEMS7Eyt
	 288/DUeZbEj5UExW+c854SsPomx4ZCE9kc4Ghr2G87bb7OMHe6K40iKIzo25bGvRKzVXN
	 NeBlxBTA0Y76XbMSTztW3kxWz56AXnC/DHVY+aokmDG7t7m8dN40eu/8Qe7o31wjbPcF3
	 DnMC4evLchN383UoWWC/ENBozPK+ZocPsP9hz/rbGhuwAps5sYhz20TnHTVb7Ni+3Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3197660A262D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3197660A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxDw1JwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gV4BTd2z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5LB5I1052930
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H1FTmvvuzLS
	B0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=; b=MxDw1JwYm675bIC7xzYAztv9GJi
	g7nkdsaRe0y/7w5AW5CoKQCvV9vUH9LOWO8hjuwgeq9FiTIKox/uckH8Q9SRyaw0
	3azXe9LuExqooW6lH4h2rmL9F9IEUwXaLoOh0R4KuNYLWl/EZRsfqa755DNTncJ9
	jhojylvx+2lIJeNspc5vKbBEcWyUkqZMtT32OD8AqVDoDntuIWs8957jf0XWV9Dy
	DlHS2L2cy5esbNsCjuhUqWmurLzHRKTnuCzGbJMwxUww5pY/fU9/rzhWPIjv4QOM
	nf4oGB6e9DIHeddqYPkYUOwmSnL7CENRbZayqdNBhi2JLpGigXm4mI1rf2w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh1fhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6354376eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383549; x=1794988349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=gV4BTd2zUV3gALOVSBe0GseCRCGwIxcvQpWb+F28bMZTaBJE1JEYTBftDuXldXYofj
         nPzPgpdqJ50F9w1x4JatPqPybTGTSGMSLiaFGt7k+DuXAtwvHeB3XEtwQp4N6nEqIA4C
         dqTGMLZENgvxyTkX7QTcrFyagVNTHkn7U707dcy0UPAOs3pyTWE5TO87XTatp/Z9lCoj
         B03p9EfBN7oHphzyWBGQKpkzz90eliEM7+srKAGhkbrUoe/f5Rx+wdGD7GTAOZreL0PN
         2YQVwkyP1J6CkzG3K5Qwx+JtzRfS9yI17i269CDipLzwWXcQMhxOs96HV6B12QnUQT67
         AqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383549; x=1794988349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1FTmvvuzLSB0xhxVui9xLIa/5Rt4Meo03vMKHS6kVE=;
        b=zWY5bbLgL47CjQzYmK+bA5Qe4X2YmbkPoTGQ6kfRJpDyMv5bMiGvqlcEIPnOOmPPlw
         7PgMkWY/eAkKF99pxwM6MtULQdXUZ6yK4Plk9sR41zDfVxZB30mqDBGsfvmdN0X4DI2v
         FqBtRZxct89Li02NpcyDmDwNdugwsLTO1PpF1H/1tLJx4R7yV8Pt/vrVl4ACnQpkRwtr
         ZSTp2id1ynnWQQ7+Mb8UYusYqwpjbjaZTp9EsP0u8Bs/aNetauXXerE/1EK3pize4/+k
         VQLVy+XiWn2d8NohIInN3Vbci7t3qGj7NW4jETmFO95LLpMHUg9GRXDICAcL/v3Rqgo1
         +2NQ==
X-Forwarded-Encrypted: i=1; AL+hErGG7Ui9Ty09G/5wMbGp9C1St6bnzW6dkRgas/6tbJcWvCKlhdC1pjFdmLOqCO8pVHZjEWqVaGLSTFZTsfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QfjCb3o+tSXr2GMgnDXWkYTLHSXYgQYuncYT0soWvR61A0rX8
	NDSRnbXjoushp4hdQc4+P4qjDoor4ztBA++ruq/GFTjlROiwDkUGd2hNsYUTo1GRuI6WyXhaIq5
	U8D+UITdzxcQC9r2gdu6SXBYAvZsvvZje03VNhj55J+GYY5gFXumS70mSRL3NTDE6lb0=
X-Gm-Gg: AYBFou13i1PyIgpcbqtbmHV4DDH43sU1BiESjr54W3ko6gJRRnETFWoPi0tShYmx8Mp
	K8GKjbLP1J0E3ojFTIqQOWSMh1FZmWH/1P3A09kR+URiQRncz14Iwzlp36ZNX+M90NUInCvmR7Q
	yK4vED70GO7G56coMExG+wyEN2NeuTvTy+Nu5+P/MVKuYA/kegai3O7mnmR5xHihxjygysIfYlm
	2FpLVWhXTF/P3TEOxiAPZldSM8g7mj9Z10J0CnjD2I41aue97Gsjc2dqeypE4CAazukx77kArE9
	vMs69bVc+U0gg/2uoKmRQXglmVZ2oNxWjhpmzYJCgruJ9GMZ7KRn1gijxVIcPCuJxG7bi+ONL2X
	N1bgTrPB7B8kiU17VFKsy61vAfRQj2x4x+pnciN2+amnV19T34Anp2z3IJXJkkn9bvRyd6iTJ4u
	Laa/H3hWio6YUtn9xdGt7zDvVPCpq1jzJ+
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222271eec.30.1794383548969;
        Tue, 10 Nov 2026 23:52:28 -0800 (PST)
X-Received: by 2002:a05:693c:88c5:20b0:369:daea:812a with SMTP id 5a478bee46e88-3768694df2fmr2222243eec.30.1794383548209;
        Tue, 10 Nov 2026 23:52:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:27 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord-rrd: Add WCN7850 Bluetooth support
Date: Wed, 11 Nov 2026 15:51:41 +0800
Message-ID: <20261111075141.3710366-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX27bvU7AaBuy/
 3i79gCR7WjHQ/zCy6P33j/If/SAd9Eid7PL3lSc4UzZpUn/p+8NmfDDvDTDhPpoUv+TC6U0QbIY
 2xpuNTkTg4mPOWlBdqqSDjR8AktNEJE=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af41ebe cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=grFeI82b2oVWyHTUkKAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: EnAwBGtL61oyciioNScMhD3pkBR8s5n6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX6aTU6mW+bpRB
 vTwfhsT6pE1L/1ZUgMYrfTvJLkX64OF97tGsyze4dcoxhEFcf0mlNqhBS8qwaerLrZ9wW3OpeaM
 XHxkDtuqIpTnox4DQZQW1l0z5TLH/aBtM58Ij2srt7co9iEhdE8VxFneNYvBcmUN4tMoQQrciee
 PENvvGrOf6bzilDReXAuu2yowpxcGAlSwTp8QQ619MBuWdEwxJSBwxOS7lUyJtCkXy/sdRYllpH
 zxAPmLwPoldV8PYouE4qOU9lujFH633SQFVa292TEOFqVIGLeNyM5wvje/IJB7YKoghI1B4c90M
 uOCYWLAo0fkWjoZVC9NvC4LmgnBMC8MVHvRmg5Y/7A2PKHL5u4JDKwqwiSjo0yVziFPQG0k53f7
 pT9AQ54QeiBdKFIScoVqWeu2uYQmackVb9ih0LMtnkA1iR/1Duh8eZWVn+8wsjmuBkvlADCreH7
 koBXESzV7OZ01FloX5w==
X-Proofpoint-ORIG-GUID: EnAwBGtL61oyciioNScMhD3pkBR8s5n6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110031

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

Enable Bluetooth for the WCN7850 module on the Nord RRD: route the
BT UART (uart17) as serial1, add the bt-enable GPIO (pmau0102_e GPIO9)
to the WCN7850 PMU and describe the bluetooth node with its supplies.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index b23c1a81a376..827d3ba3a238 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -602,6 +604,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

