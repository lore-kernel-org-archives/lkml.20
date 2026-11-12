Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458215;
	b=N9emvUQ+vJq5uy3Ht7woZHrE7nbWIGWnlziGI+Kc13q0wn4v/A29mQn8jOalyvYEqty3
	 zxoCvvJDgbQcgStUXmLO4i3/THI4h028aflWIl5Q18gp3qZT5D/paG3KCOTiVbep0kCIp
	 73YdOVCdPqcTmaiAt/+q9lvIezDFkIQlYkVXi8LTS2OGNPR1F0yVN3qWRTXNqDelJ0gSa
	 J0aGgRsm3eM9Lg3oXSRR+ikWEJBnpncV6Vv8gG6Q7OnItkNOLOPN8zFolCsjnFA8l54aM
	 2+W6QlzcdVyaxPQ38bgokuKeSd0h0zkr47BRvldWVlkgEjMQzyHjpSVD7f9eF9qihaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
	b=Bnsplltd/suSSakZEx63EdQD4Q2fLMTXP/aDQx55oQ+Mguy8VAifOLVTtd1HLw1SPfjW
	 gbIEiSpw8kHAX+vntb+9JtDGlUgDZbHDNlffZ2oFRkyRb+iwYGC9fHrCwFBLHpBcIroV0
	 kfLdoz0F4ktcw+kPBu0HNYeo5UfIrjPz1vj2JiOngyP9jhLAy4aWrdMObyoGkcnm9WH7p
	 IBa8f2omxF0AwjLxYSqsR1o2Q+Bjf29nky1jrS0Xy2dk4jDdHvRxeQy4RQO3dxSqc9dB4
	 LZcWvxboxj/lb9kDjTFX0KJiDKmqXwbI4pGgAx9JuDb6+U027IHzG+65Sn++uY5eiaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNUiu7f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CE606F8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE5CE606F8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVNUiu7f
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zx2R3061866
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=; b=NuXnm4r7/MZsW91P
	slXnBUybmCS1KKywYK0AWHwRQApA2pDwphTbAGaSONAojlBBprppOwjVjVo35Ctl
	4SuDQwal1gxfvyfGJVMR6IYHRSjj1kKz6WHsPQnS+uXTrmcMTQqkWMBvE9qz6fWM
	9swm3LuA5KUgpYq8VSjsmlTH7QK1pwpbViKpZjGZaLsnOLwXOC3rYeGjeYHH7KF5
	jga8vpV2YpnPsFqvi0PM0DnSRmNBqaVfQ/XeP11RzXUu0QsAO1121OxN4MY++9cx
	60O88rUqb/N7kesQt/Qe2yu3X3uW8Tax/3ftRiB7bxkje301qrLpK0SLdmZVRd8l
	bIDEJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m394u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247711eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458212; x=1795063012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=bVNUiu7fPcLCsdBPEUJF2ipb7Mw4LLUEG96RgnT/Om4pHzQ+/T+f9t4JyI1AD8zgF0
         e+f1QnKuL2x35XYHq5hxbg0enu0kji7X8aF+2kbTvtSRFTrpajV7lbQoddg8N1jmdKUU
         SLvcxdlc7Qp5g4M/8sfMXMKZeVbI3JLACkSh3nSVLJVPDEMzyrq1x3SxMO69ylxkq9uo
         C8aVCgA2iE/pF00Zv7LDdUdecMajqMYx6Bjo9gtz9eVH58638S4YvHj0Z7S6yV+y05iF
         jrIXBbYqvjnbSJruS3YU5fWnamPdZVlF/mco9vSeVUIdd4VHg3rEMD2deTA7nRzIQCkm
         TtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458212; x=1795063012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=HA/FNtxaKNTnND7PqSdf3iPGLbDg1cIp9JCVR4jKLB06EqzZ2kTbgatZDu/1nicYY2
         T+rT34VVqlxGw6epnCUJIq8yMtXIPb9bQy2Lqlj6eMRzr8A5lr9FqVfMyO1Mh59vE7Kk
         c5Q0MZq6170wTuejjCp22dcLg/nTos44q26HzOG/0wazLd7XyMRjwWeTfV2jbRCcxgkE
         7WSeMu76GFADjyiSepNCHsqnoW8beGvYnn6e9MDbeHKiQ2ww+o3KHGU31gEgKUXZ+RFa
         yr2QQK6is+tZNn3XOQ0BOXg6DStop607lyhs3YJiP7p7bteEAMLkCpYzOWgtwOxzUkOa
         s/wA==
X-Forwarded-Encrypted: i=1; AL+hErFuiCTWZTjH9Grw68R4WAv6+f53TLNGRjwZV5lJmNlUpypBF2OjNf0VcRfjdENo3wBaFrat3Aa9mPLVmLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AzrGW3Ujpr0TzJ1xEd2Qay0YFUKolghN6/mjWEI6wbuQx3t8Q
	N79fwIR5t+9gW1W2CBfbTr1S4AV0n29DcNhUND49EKQpGl8TgHgGtC4XWB3vuTlR6Apg4Nl1RG/
	stYzDUQiSqZv45J96RtpPCkCRDE/Y/6Skeh9BbH3XnbzLFuOuzlChPW/DsZywPGhjdpk=
X-Gm-Gg: AYBFou0AW6qe0DP1GuvsFPvJag64tnJl/nbnH7D2B+Fk+sNuYSwyp+Dyy4sHdpy/LBM
	clcIIovCZTvcs4XNBJXbIBar9hLzv2E5cyhTh6hVYkjWwRnJKTf/8sdtqjxbpK+jhmozi4Qx2A7
	FfgYbxFh8HORRwaJU2epdVmveHsZ+5sqqSZjywi+afPnTnO1+YFygTQhkCZ9guxzWM3oQWzMMMm
	3HN4lwVfcXjd0ZBUjII+HEH7YZlmBOjkcsxoXkQ2jToPrLuolD0sBQ7Zm1xPe/ZJ59Zs41+Yz3U
	Eh+ET+hVMBvgPbQpkcR/jEnETxd7IPLpPGskq2ZGGBBjix0HORPGMjV5RdRxg2+/8AJokLAE+EE
	FJLf1TWm6ydMKc5PhteZjJnrBApE3MrLutppYQ85EIR1B/aPHalcPKfsLQLIIRynPJorm74j2I8
	XPRjy50H5g/iJhv6Huwt/zgZwVMRu8vvnjmQLKLmry9CYXovxwf7LEhLxHj/vO6Nc35YfziJ/98
	NkBiJw=
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5060024eec.21.1794458212301;
        Wed, 11 Nov 2026 20:36:52 -0800 (PST)
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5059993eec.21.1794458211572;
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:25 +0530
Subject: [PATCH v9 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
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
Message-Id: <20261112-08-dts-v9-6-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: wfoYHwX2Y_ElcnANxKygWSumoixYOWd1
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af54265 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: wfoYHwX2Y_ElcnANxKygWSumoixYOWd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX6aIM0Zu/bWmK
 GhyrUhNw5+UT0UHwCre5/2dRWIPT5xD+k2aPBPA2M1aDcaX+KKBILZkkZLD7ue6zBc+ZiIaDjiu
 DHLtPktIK6a4hv+O7BWiVB2BtxyESoWUVSDPQPJt6arjAQfYVDmJWGQcOAV4lVJ0Ob1kgRfPbiM
 m892iZ00vlCcJg9QiuY+S0h7epdqOu2omOOKfxrGwuw6WmPRHqfayj/+icJGPCW9uETiyKEuJu5
 4VpPJ0sNkUNBxWjL+CEADnfbriPdiJY+s5i0GubEyBP3fQvnWCjD+qb0WdQrHkYi4piMo1zgNkf
 2F1hZuZKfHxNLXITh4wVYoy5H5Dg1B856yuTLT5NbSVNOOCyjcq4QkwpJFClV2+IIRBSE4uh9oC
 HtJ3NSqxPHySpem0iqf2RXWtgG4mrCvhi3RqAIkXjv2x8H73fGRpqz1zlllSLzKiPqTI5w1DGbB
 2jWMPejxc3Tzhaf7bZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX5TyAZfeFXSE1
 n1TN4LisfW8fbovwlTNNVA0Jk8avuzWvJaEkhVFSXgBd/j+DsxwSt1VdlFtrCdXTZGKWl06BCar
 sbfKGXS0gTarCFCieNLHUsQXlq447yQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 43cdb981a4ba..aa8b37d837ec 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -22,3 +22,7 @@ &sdhc {
 
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index f3d688fded80..267255d2980a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -164,6 +164,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -456,7 +464,25 @@ sdhc: mmc@7804000 {
 			clock-names = "iface",
 				      "core",
 				      "xo";
+
+			qcom,ice = <&sdhc_ice>;
+
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1

