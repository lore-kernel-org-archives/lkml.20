Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520338;
	b=GMeIQ99qJF28JFGqDRjhczLbiQpjRr/8c2Ig5A3wQ+wX/MQIyadyFyGxLRfkEn2SdQyV
	 jn+xw2bSHTwUXZAwPE9HRhfjjI6mmjLQ8e+HoKBaNa9Gkm+QDGZtjXudZdNcUa4XPqspG
	 7ZTA9RlaoIehLHuJEDb0Fs6UgV35AfRcs6cM3GUeIhDqgAfMnBWO4fN155u3iBp+ClioW
	 64G0TWj+7pE3g1tcZ5cu8Eek5pQaS/IzoJnCmRCDATAGORlwNlEP5MDG4JRMvzy5E7PPQ
	 fYFWRJ/GBtzKJCaFCcmqjNo3BIkkKsi8Zyfo5BG8lZ8J9OC5R9f4rXDEcnlhhz22ubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
	b=3Co4pP2meRzc1tAQZpXwOmjfexYkKwmePWO38nNstyZExgkBd/epzu3ncQAr5VKXDrU2
	 hHvDQ+9p5dR2T1s/iyygApwyPha9+deF96igiBkp8FUXzEp9AGEI96BoscleqWhblXbv2
	 bQ4DU7OC6MpiPQR00Opqx53cOvk4CLmnnI7PQ/Iqe3oxRqAJ6HgGh4V9hlEPAl7L8FMAa
	 cZ8lL/btl6G40wICEl8OdTHktpnULfkX0V9puphySP3AzlVmNbOZhAcwbjGYbHu2b/2DU
	 hJZ3eEHyFW44zo+sSyLIS1s9k4RUgHUsHGKFSvygCB7isIAZGrO2RH9BSQoxt8vFmHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8417606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8417606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pnDOAO2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2SetOW5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15L3jf3831277
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 08:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xz3k8nUkuCL
	1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=; b=pnDOAO2kXTl37RH6ahQbhjshAM2
	J7/6suSCthRNIhkM5dEWNMq2XNZQ21gmkr3AyJBdnmuaPcb/wMGE+XEjqrKDdYl8
	/23b65O4ndOjKtWHdpXL+nSQDLknB+HNwZWwDhYP39r6cMb+IGrxNGJHseHUmqFT
	I/UbiFUK1ee8CXi06SvVMOWBE2PPkLUEuX8N5FzhFQjE9Jc01MwH4Ru1UF8s4E3k
	1zUoA4DQgyDsoh/pzUP9a77t2FeRQLLP1gCCdQmgHRy7dDgwAWCN/Y9siJiCANDl
	eAvqiadKJezPF5EoxscMBh9pYb3zYOVdTVlH5R25Ttp3uVkmltNToHE6GOQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfu2qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:05:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so2835123eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520301; x=1794125101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=Z2SetOW5+S9IhAsCcLX8iXytIdnt9LFePB5/eSKYBrc2CLup++RqLUs8kKHJKS5mem
         IxCwyU87Gb5AdyFQeMDzvdYfdFCFKceIaybSExQgpn7dw6YfvYqqaSXwchYzdfbgxjb0
         anwWE/5N9q9mx3wUS6tm3Cvyzn+RpSZtW30Ph1XidGrUyXhtf9SdYKAMfx/h27Ih8VTC
         zFAq7dgGPsFfYC7JF9WHgBWWk6yrGmODERb4s6+jyae9m3APjTe5GXZngR1zBJd0casu
         KFaS8q1bE22DzKA0/DSsx543n7ak59iyAQ/J6exPybhjtox+LLLZOW44H6iEGgvWGAlR
         BIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520301; x=1794125101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz3k8nUkuCL1vaN306jsyyCr9ZkPRCcwyn30pa+56JI=;
        b=RsAg71cUIwmFy+btFnQ0a6bm/xmI1FmZ74RoFPpLBiqImIYXmi0lsL5kb/l3dlMxWI
         vjf8/eEVLyMErCQnH9r86mzq3TvFmJVaNxMg8f6KYJDdTTgO0dKIdw4uNZU8YO4p7aU6
         w6gqjF8i816+w3kas+95MCVvxOOE8gXZzG26EB+SXEFj/TUrvUMfHbxgI2v6T3C4DMR0
         FyY8QKTgHJ2Z/0mIG+I/2IryO1yB9BH7T5OLjS1toIXgdGqSG48oOOtMK5L9sliljYy9
         L8hbWtEfoZBJHKyPHG1Rm5gW0y7ymqMCskgkKPnkLhOJMrJiwpZT4D+7ZiuPWB/1v920
         watw==
X-Forwarded-Encrypted: i=1; AKwUvBz3u0BjxdDiZ/NC0FtMgePmDYiXOJdbqNqCHiZqojCDBMZzxpMsquoEb+RVVl4ISrLW2RH6YZT0uh7vc6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z89FPppmWJWuCW3+hV4CFZ/kN9zOgwNnpl40oHjyosTkVWHxXuU
	m7+6bfxcuOl+sy77fQR5d+CCACy9Xazzz813Si46C/P7jsTKCDrYQMnNbhXxhVV7MSy9RFqsqgG
	OxehyUgNVoSHUH6fyRRkbIXcJ7dhwcFdhUclODqqNEx1BK6YciG/y/edApOkSdZOMgUI6JdJmo3
	WjQw==
X-Gm-Gg: AYBFou3OTzh+5HyXDCgSqmtbgpNMYsKkv7+xNqktu/sKIneWwaR6WpZPukPTzumz/zI
	XoD6oEbTdh1pQWquNMxa3tlN4wzlrmYoqs36pBstMxA6QcmtSaWogCwMP88D2pb1e1Gf8aD0i5L
	RMIBvc3/utwKg73I2XID80RPOA6C0EeYanBDbMKSi0QARaOTGeo/yaR+l6mlmoR3M2m/goWv5q9
	UWVTPqxMTJBJ8Dk/3Yf95U3r/nQxnzCG2Nc9yUyOnQYbUPB45CKUCikRjfy2URjDJWYmloyYqiK
	tB0tHZFOtADDHy72+f4lgar0fu3SEkRZpkDbBGseD0/G6NRTb8mBXo5BWudLn0PWEA0Y8laRFWX
	cSUuL8MMwYTcNsuY8xnjeKb+lJuznwaVvIJzgxUcOcCF/FyyvVKfhurv4M/5fg5J49lgffeRXXW
	5Q76XDPNUa+fheHK6Mn+c69P4msGCAhX8l
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108991eec.38.1793520300697;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr12108966eec.38.1793520300163;
        Sun, 01 Nov 2026 01:05:00 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 2/3] arm64: dts: qcom: nord-ride-embedded: Enable Ethernet
Date: Sun,  1 Nov 2026 16:04:12 +0800
Message-ID: <20261101080413.1428016-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXxBJiT9I7bXKu
 ScSu0BmiZRpxXKjqOG9V1N6WJ3geo37kT37xr5gqpVea2RbI/4qbsr/0d5Tv0HdzIANvZY5YB51
 w6J9u4gOyYKuV0tUOnrOOV1Wn7YCw6k=
X-Proofpoint-GUID: _HJdWAQabIXcume0pcfzpP5qScS_6zE-
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae6f2ae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7rWIkOKoExSrKlJ8jWUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: _HJdWAQabIXcume0pcfzpP5qScS_6zE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXzue4HC7HRBip
 i+v72XJfbbiuMFF+zenWITIKLoTg5qCv3oRmLZ6DWtNu0F4TLBe1FAbISxiaCJMWAo11ZjkvhVK
 kCRzeFJjz0vstJzrI+N+40NRygEY4c535dGvPVB7+cRZhOU4iAfYUi7IKP0Ya/9sbKt+zAyGBsc
 a9yikAs9uEKBr1C9hfDlnY9Ww4xg9L1arltDjcUKwwOg+alnPczBzA9HXi2I+IZ9YBZNXT7/vtJ
 Etz0v2Ogl5fVnLwBH3NCwjcsZj7MLC184kZCxTe1fbmdKcfh2GivZZe1FECMCoeJY7z79Ryi7XL
 Yt1xgEHxEv1tykvDiFgGk9FsitWRwMN0h5AcfHhZ22HVWBIHDdktek/0t/53nTrIuCOjqAA2fHA
 xOgjumx0IsYYcQgIgE/kCF4+iK/7tuIL70R8rgdALdDwly0RZ1MkYpH7ooFO67qDTcHkXV7cZHN
 YgxthpJNE5zemhB623Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Enable both Ethernet ports on Nord Ride in fixed-link USXGMII 10-Gbps
mode for connection to the onboard firmware driven Ethernet switch.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..50bf4c32641d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,28 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&ethernet0 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
+&ethernet1 {
+	phy-mode = "usxgmii";
+
+	status = "okay";
+
+	fixed-link {
+		speed = <10000>;
+		full-duplex;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -419,6 +441,20 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
 &uart15 {
 	status = "okay";
 };
@@ -440,3 +476,11 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&xpcs0 {
+	status = "okay";
+};
+
+&xpcs1 {
+	status = "okay";
+};
-- 
2.43.0

