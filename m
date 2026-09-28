Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23953B7B6E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577447; cv=none; b=ILxK9JXvQuUYi9M1tDPUPd/CnpfXUP1lcU5wGBCuYsr9kXCryr2JVPEvJh4nxEHdjqh8WaywxV5cTBNV3R7G6NZhuIr3uYtLyQZ9+999zjb+rUIO0wstmBMw1zjg9omLAQQ2Ln5EqcUkPRDu6JVDwU+OsYtdCnNH5ZqU0t7tj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577447; c=relaxed/simple;
	bh=QI+ToQia8MP6u/kd83sS0akMU5phWxNIb71stmnOyYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2Xf6ArPEFgcxa35pU5Demye+kZrL9vzB4+TBEVuxHs+zRhwNPMfJwd+DrdCTrZQ7jO8rCT6+U8eB26XbtHIZzfI7WFVMVr69Cm7DIh0YUAspQx5GCZ76MQkWHOrCKSehE5OUlPMR/t5nJ7thuPNIaV+2L7eVMWBiFHYh73trAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxS4oH1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOG1YkZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxS4oH1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOG1YkZ/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLJ7TP3220433
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=; b=FxS4oH1G977jPv0I
	Gx/Xxdq7QqkeW3e/wcZL5xGQP3fJnCxImL2k86e3lDb43M4LrP78zqk3IqGFIQN3
	FUbF7UHGXT2yz+ox6mq86E/EQGRORMXxR9mes/PXtc72svUXui/H1NguIP4nrMXE
	73DI1+pmbw9BrpThDSQ0Ihs1P1o8I+Nu6bmF/47bJnbIKVzXpLBjhKXU7dNh/k0B
	tcXNnRgM8tY7kFueZLwayG9o/l13qRTHRHE9y/emSEN8LlYFcM0m9Npdc9ocCllE
	ixgBmb2rQqn22zmT6GDTd9MU3zw+41y1yjbUshLWGx/S2Ug8/M21gPy8qrW5GQKx
	lscCOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav494hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1709125a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577444; x=1791182244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=;
        b=AOG1YkZ/HoF9jkif7OAhTx4LlnBmuqs4t3P6Deg+caBK1iQsbzUe36g/JBlG9tFR+z
         k0nXH0+C1R4NmP2z8aGdWSK/1CsTjcJs1rxC7P8Xwi2xSL9W98eYIZsuOqQkQMaIBJqP
         VgPTvby9OJ74cTK4rQ7nvPg2yBhbYlSEapi51osQzpIGnNo3lJ8NEIjfRv0/6NZbQqsW
         7EVqx7gkg8NZiNsmMv3eIYWfP6qOCMMXmSjxHzs/eTQZo6nSMcfky+VqpEg8d2jOOvIk
         +veYBJVzF3slgIcp+Iz/BFcebyBLrtGZa0mL3MeRvA1nE0P+Kdn5HPAhq6GTuzdJuHIY
         lakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577444; x=1791182244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsSb261InHJwYCIPG3xNrH6mPBScw42FNvSA8U9479w=;
        b=oKCjdR5XCERk+GtPzmC3RKTeI9JatSUp8bXbA+z5SHqtyAlQjROU0RVLveBDNDHXA6
         dOekaqogF7Lu1qJql0LvFJK5Wd3uE/iyAVwpcGMmkx+FVFGwdZxbPWIjCZZG0rlyQe0T
         YmQuQ70UoE1RNuGapeImV4tjaEQisjC9/sdXqN6sQnv7PKBn+h+B3SXwrYTJFUOZ7NdB
         DEk5GApKR3SOOw48cJ1AkIdJ+VGK9tIWmdkT0KE/rDYl3RXq82SQF+ZuD601jaX8TU2e
         H8S3J6agw7eN7W85pwGIBevQ4qjrZbL8eIfRUozm0cj0B5tt1GxMiCGD4e3htv7bDB6s
         spZg==
X-Forwarded-Encrypted: i=1; AKwUvBxfrCGdVs90zxd6SeNyd6OhIuiWvvCA5amCwPxlNmFrU861OpTLFXbkpqP9axhH30Ct4EawebCL+HF1h/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNTjOgbWdVV24kSYf8D16ZdaBE99VFIpq0zbqriwcj20x7NZrK
	qASMQF+EWDci/Lo36honLYL2f7FhXvbLj1SQR0ZHqlsPibGgA6pqgNe5GIuqvwgLQ4HV0GKV3yX
	AYvrfbV79e0p0iZJESYDy3HWqGzjFmCGdjt386fUPbW9eGZt5JlOxGsavw/hVjzkVE/8=
X-Gm-Gg: AYBFou39oz3QFo3COwWNrqrDLFfl0GFwICzYRjm1Wzzf2M6AYucgCsiChSKYtskmvig
	YhTqNhh54dPFDpZ6/aHYLDZtiNKmlhKhJUrNoSrdfKHL6bz2zscZT0LzPgJKOZjLo3ZLtblpIdO
	yG+wujgUic8an2+AfS38r3LLHEgtVby9SSF6+ulYkg45qmZ1JriKyaTakvm8J5to4YBtDO0pgZg
	JGAzQDnU5lBnqaifzJnZyzT3A4zmWv5zhqg3bMJtNdFoG4qoCBDC/+I1C7JCVq1sn3/37DjRJyT
	MIUAMVbLM5giQZe8dxlze+1T9jQbTGBD/VYeNMyFRYZEsJEdt+K4qdFXlOdG0A+/CwwlMSLVySs
	WAt/I8uV9puX8yqPo3zy//suFRbac/lWzjJRucKuyiqtvRXDElde6nqSqlgTQwgOS3v26IYtP/h
	2CCd0HZfX3i91v
X-Received: by 2002:a17:902:c411:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e2b62454f2mr3161805ad.17.1790577444096;
        Sun, 27 Sep 2026 23:37:24 -0700 (PDT)
X-Received: by 2002:a17:902:c411:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e2b62454f2mr3161655ad.17.1790577443626;
        Sun, 27 Sep 2026 23:37:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:22 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:39 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1735;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=QI+ToQia8MP6u/kd83sS0akMU5phWxNIb71stmnOyYg=;
 b=rSY1Bc0j5c2uzgLJKbMOCKAE9QpQLXbHxWxWf7elUCbFkfzBDWl0SO8aucNaTGaFb8IdpFztv
 x7X/HWQLc8aC+j7ArEtrGkyhZhkXrol1Zt1aG6VbtF5zzALfmQJT5OG
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: TC1_95NOHoJb6HcA0Q0omX4MlrwU5CSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX/lO7FZyIqDNN
 Qq0TjUMVbihM6tn5v5jBSu/tbeUAq1sqMfbi1b/xXbLZ/lsMRYuFlt2Wg5oLN9FbZjTEBSiG1pd
 AVT2j3WKyMaglprIa9MUMM/k6OY5WNJd228YJ5VmqaiTYJEsXW9Z3jp9AlEdfvGDaCl5YZTELa7
 HGXSu3QlkHmdYqe0pq0JGbHq+2dPuETzx3f7gtdkkLLr+BV7qLV3Lausia05/8cLaOqMP8TGxGa
 uBaoOuhsd+NXgSIsXAxRQ/ry8eiQC3qSFCkHPRG0lEG0twbKKhcfTA3nKnwIpwHta8sunFduSII
 ttI/SyDUarP2eUmxhL3qmiIDKMEza9bnKkpoI+1LQhxljpFLMwYUkl/nUg93TTHpxvkp08Owvfh
 kSgvu0U4UnE8TPHQ1cOtNm9ZCwXbKZyXRErbFy1vY2pPdH9AMJXj/JosYiEf4MSayF/nlxFcot0
 U2QOFUS3sIGrH1gW8Ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXyJAPPGlCv/7b
 bvHbKIdWS5BGR0SgCSVWOy6VGWkrI9Lp9WBTq2VDaJQmopfuwjJFJBnFeLOzCxu9hnQmEgxfQd6
 zQM6X36QI0+HCxH3poDpgGGqZTVj5Qo=
X-Proofpoint-ORIG-GUID: TC1_95NOHoJb6HcA0Q0omX4MlrwU5CSS
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba0b25 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qPkBp05oCMIUEZk5slIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

Add support for back cover, keyboard, and SoC thermal zones through
temperature sensors hosted on the EC for Glymur and Mahua CRDs.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..571c98124a40 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -594,10 +594,12 @@ &i2c9 {
 
 	status = "okay";
 
-	embedded-controller@76 {
+	ec: embedded-controller@76 {
 		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
 		reg = <0x76>;
 
+		#thermal-sensor-cells = <1>;
+
 		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
 
 		pinctrl-0 = <&ec_int_n_default>;
@@ -955,6 +957,47 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+&thermal_zones {
+	ec-back-cover {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 2>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-keyboard {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-soc {
+		polling-delay = <10000>;
+		thermal-sensors = <&ec 0>;
+
+		trips {
+			trip-point0 {
+				temperature = <90000>;
+				hysteresis = <5000>;
+				type = "hot";
+			};
+		};
+	};
+};
+
 &remoteproc_soccp {
 	firmware-name = "qcom/glymur/soccp.mbn",
 			"qcom/glymur/soccp_dtb.mbn";

-- 
2.34.1

