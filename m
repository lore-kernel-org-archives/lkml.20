Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2387E46F4A3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778294; cv=none; b=ZOYiCk320+5og7fZTnRC6UVlU++b9pt6p9J0liCZLV7KcX1qqkmEvODqf/qD5lNBRYsU9cQD4yTtbTlx0wZ6j9ChOmArl4tBEjjLZrPCgFPMHt1LeGMKVT2NQA/xLHq6InaRIMvPB2OYAukethBEWSuiqwFhbdv7XjWX2oSKLoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778294; c=relaxed/simple;
	bh=kOCFhhQ0VijDiYHFdxbLlhsq1O5lYtGN+9F/Wbv7TyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBOC9XUrbB9+CQJG6U12vNEl4OsoPECzqQrrV/rU/sSYpw2bu+bfCK5C61kVE71p89oPrYifj+JKNKUrQslD3/vrJKkexVCtYM5JJ1yfjoFHH3PPVHnlWCA9vK+myRKt0pmp7gGC/gSV5Kt8yjePXXp5NbdtH1AXdW6F4pZgPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0omYvJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iwg9wsaj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0omYvJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iwg9wsaj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmxQP478321
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=; b=p0omYvJaxSIdW0gN
	BNxAGij8whOVkqITZNP3MqRlQMPWofwSUmAb2sybnDXi+kvzLvqWBjTOz99AS99p
	8OrrldqDzZCmzN1CLwWy2j8KDBHVGuBOHJRs0BoJNswbQIddLhG8PgLfNt51llZy
	XGamVsweidCN1EdUhwvO7G5okBx9e102YGyRRrKYv5gNkHS6d+Y4CywcwMkBm3BR
	UTiGdTgCIzodOImSLNr2l9RZ+N/a+axFzYmMtbc9Bj3xq+3B//0SVxsjTAnb6+r/
	GKSEU3LfcBK9pE01qb7IpZuTKOhmmaI/BwzDyTFMzz2K2EuDMiQd4AVwOEVvvn/7
	4U7Jsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjjb6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:51:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so698783185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778288; x=1789383088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=Iwg9wsajIbDgG4IMrtL/LEuN5Qbnwxc2oOhonb/UKaGS8zOW4Lsh6VAdI3qS2KmuJT
         aUiWoVrRjNXeDdsqdFrHG26VNd+z7zL/596E+NpBL9WyGi0TtM3MoqDcZsMryE5CxLUh
         oHodhgWPps/nPjlFlI/SOvpzUuO5QW8Pi0qIfseyetI7fkAiBdzevZlDq8HCjNW6AUpV
         S6EU/sZln2VxhEl9rfr9MGQH1lZtJB+ONJ2U1t7lgSPmOCCf47anavmo0HIYD43uzk/p
         9FPjDds9e6AT46Po/QMta5FJFKHQ4tHcb1vpT/oxrtoSkJM8YoUIw5i5A4ycWuRoqZvX
         3tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778288; x=1789383088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWbxMpa5nhV1kXJg4CePUUc7pdXqjJ4vwZjQZIPaLO8=;
        b=EVhEA5SF++RxjfzVwhId/mDsUit7lE7qOSlC6GmnF6mO7CAABplW3/hSJwSNDiS1Ku
         vqnXcsYwoRX5dLbEGyKJr8qit+nPnOnXYq2Jvm0iOzzP8TKuODrFO1HItOFa/fQ0oZXz
         onygnfdquOyRMn5hTzFPTjxyf4G8ByK5/TwHiKYK5F6blHgE73DNmy49+HK+5VD1Mjbh
         HOkOriOxBIZs6TnOAkZIoFvw5RBuXBTW7W8lzZjj5jXxYA+Nb6xfgSu2reD3mAWkuzWP
         iEPpYk6ZhxIzVcBJLBrhnDjpNOB/U30B92+FLmoA3dOM1QWo3O5DQazaRUYNCWdtzcLx
         nsLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXPdfzS3rBJ9RFx1Nieo0SDtlKOeRmiwXqFwixcaq9iWPNJ+KvmB92i7rSboi8ybtuk2wTt++E3PzxVf0=@vger.kernel.org
X-Gm-Message-State: AFuF++kG51X5eHFtivYBHWuKjMILZnHlVb9VPV8IIrAlGXcQ9OxCfo0D
	sNCZ4o4xyTW/Um4otZKmbMs86AY/T3wCzCFTOYBcPh+W4fbjhhE6A55MqUgsb+0vIG5XEp6asf3
	0MPi+AignPQGtw5KJGKvrJoU+H8XY1ZTpQeaF56NFTpn5Pc4S1I1gB09IZt0BaIc1O60=
X-Gm-Gg: AYBFou3few+LMeNf1SFAZ4hCAMzUiuphMJqvPYOeebSnqf1lbMvTe/2llhWSdoCUpfq
	8VAYfwbIReNGYfJwITmqi/eqX2ePW4Tg2ZuD+SB2NOdtxyq9igizyrj2j3PXc/T4VH4kavPZ8YD
	N0khlngNbGRf026Bt9FcOC0IfUMiS5iHRM9J3+3wuQd9VtEU1lYh5llnmoIdbj6Gd1K3LA0npUA
	IJ2YL1rvzDFfDHz4rR+qTYHcM+y04jFredOkvTjWCIVqFpKYB4e/K6zeFpohFnQhgJ1HLQCQtY/
	F4R6Hvm82GaoXPvi7KmwX3EN49/TVRTtP9x9t8KCBsqJj7zPKGHzx08wiKlqOYq8RmqQ1HsbWt1
	lVSrDWqNvYoWBgbmBnv2fQJAxreVzdrYuVBIMa6aHwUqe8RcbBGlWA6ZH4XMT7OO8HIGvGB4R+p
	xnM4OL5mXKddItMzxGZxfCkSsqrQJVP0rBdILCqQZIqKLyg2YXPN4=
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190094085a.10.1788778288551;
        Mon, 07 Sep 2026 03:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr2190090185a.10.1788778288072;
        Mon, 07 Sep 2026 03:51:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:17 +0200
Subject: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXxfdVKnQn8f8Z
 mNGHm2Kml16Mr84yfpusAw4FQmnBckSaP8jeHrhdEAzRL5O6UhzT7/4ESoSZ+ieyhfGHF34InmP
 lI3/vwkRIJHbdv1DU54jSSMZwWematw=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e9731 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zIm_u1imHdTDcFfrE47TJHpupVNe0CYK
X-Proofpoint-ORIG-GUID: zIm_u1imHdTDcFfrE47TJHpupVNe0CYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX6us1A9jK09yp
 sfpaS3OVip9mkPvUfhrgZJokFN6q3SWp5ZOIQWh0Wq4iQwLVajlrWNvb08szpZdXG103AQB3oT6
 LRETTs9Hbk0Ba2pEyIq76tuH3zrN9mK9uEQoLb3RFyKRIXtXK2qsVT57caKwNJ5EqO2mkfklV0o
 xo02VoO7DEPh2YMcRonzyd6snwDp18kxreCMUqaiiUtAlg6zXeXbThSi9j2b+XMzGLSCH8mZnGv
 lIZaLvf0s465xwOf60DXN98nkLiiZFw3n2ryLeFIAmriFoNpwj9s9O3YGSgzBYD+Q0Fvm/gjmRX
 NizFgltLh3p4GaOsvn9wB9W5vl64Zp1Dz6y5Q0hQ0PigFAYrwTwAo5dcQa7v1uli8itN4wsKQlh
 xsaa43BMFbAzkloG9FItW3UNv4QI4f2Ft/Rburvwe7lgFNE/iL2zt2mWxaZqGvZ5IZypcP/iDH7
 hjKyiqR+PcJLUIJhCmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..360faece59aa0173615eb4d9d06943a4fa623d21 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,85 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			status = "disabled";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

