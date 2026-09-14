Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829342901F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379690; cv=none; b=sHKFk4lx1g01iOe8vdMj6orV2Bv0MC4qNkLlp2QVjfY4K4lJ4WVGZxOF+qNSWE4zvt/nRepEA+xV66dPEzJn0UcW7yfMHy/2UcoUm4cli3SI+YtSRd3gF7ui6WrSz6/n55lqxAIvWMPmJjGwAmUlIEbrclVHTF+frzXt6Xz0LQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379690; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SswGOt25FUeQ7GtMFO4Xl5Ebun4N8XyfmnI07kqwoNTD4AhCSwddTu+6aJmz6gHDZ3l4ECt79wiHgJtbVnvYg/xVsPw3cb4kY/11JyO/Tiey84XKgZsMJ/ZRsNJmTbmTVmBlcDwl9dEwUDeZZnlL9rz6rIJnu9M2MHFespXzFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKqz4b8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/6mHAFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKqz4b8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/6mHAFe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nXUW3663569
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=jKqz4b8iqm5r0e6n
	zBnF7q6nGdQO3zVI8h6lCJkAHEuOb/sa5WnRZy+S4qnYY+rYn1o1ofdnZNCUDvPS
	XLHTiYCazyUcoqtcNby0oxu8EQ7zfEI4GlJ+HHvsYx/keqFkv6IGCdt7IRc7I0oN
	PG7QnGRK3FjyJ2W/wO3FXWVHhC3QpOd+ubSM5FPUzG4rpmM2etRaxvT/bO+dvOoO
	ygMVKpGlA5PMQGz8BPkYRteNz1NNoWjqAqdZNmjuwDC3nXNHaq+kggaZQ9LxJPx0
	eifS5UvLw5UisaPuhiez9grtwa45xnfBhRRo9e63QNkNHsODyKQKdu7FNBzwdyWa
	gOTGeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg0g70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396901263b6so6449483a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379687; x=1789984487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=H/6mHAFeA8NSKnWKSFHRNYy62QNbYhUexPTPc6jX57ekYuLj4CVv/shkjEbcZFAKFq
         w3taZnJ/3lpfZlGqPI/eSdJzyTr1bF392xNNu8xO7IpsRjGJ/kVWPXioPhxPjsLq2S4r
         j5QJD1OdNDS76nED/7Xl9zjxE2WoqoHRAqSYY3BfGmAONXgJADpNqX0l/v9/4aCL19kE
         /TPxkSFVepQ69tQCDQXwI4udNZMCC+KJzsYgJgloyJ5l0M7FW8LHwQmcXJErdgdffhqJ
         QCLE51O61c+JpyHfWvB+Px6OmoeKfi9rEB/Vmle/dNDPU3UX6mYjPtmS66+Qm6K4At8d
         eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379687; x=1789984487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=dEfidsCIe58NWjB7GgEb2XOSWMXVy9usQ+C6NO6IBBXjgBOxu1OuwTG3xZZxQU22AA
         za/FZeRsLk52X8mJpLtMsYu0n5/ybysiy2c8GknGn8pNoKHOE6wcOFfdxwBZ5VCBHI+k
         J1FSDtveHuuCLHr9sIdT+hoxarIzg+F/Cv7b4v66CVtgKL+DyyxFhypK7sUV29m+f6Mt
         olKfjOIYB8c2+GbbXNrUmufBG4R6EHWXc4U4zp33F+1beHF7f/63mgTMYwfwlTh/aqlC
         0BTVy6mFFqLZUVUwhmlhuJUSF4KSIQMsSQiHX2X0Rqg/erAvQ5qh0oeJwFD6gmW2NaN1
         Bdcw==
X-Forwarded-Encrypted: i=1; AKwUvByOUdKlegLIqDN5Wa/nDosMQPiAvjT7GAk5P3faEo5CBCK/fqtrI5PuZUTCft7QjABEglFXO8mQAPC0FMs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnYXDEUtTx6h7FgGi5WBod4BauzOOsD9g1aY4qoVvrcYHdagyk
	4wfKvCGtDhH4UVr2nG3Jb6MPmj278U7hX17ByCZqFjELgkzW6PAtVjkt1C8btXX4Y/LaBVA1b8T
	gR27pY0/z7JviInM/1bmRvZz2IHXU/0Q4QsJGM/uPDkipX8o5S6z6xuoFYJnEIIegWkQ=
X-Gm-Gg: AYBFou0Xeihuo1n5Q5yfrP+WTpBkeslBOTLOvvd6j4FWxYB4H0n41XubiKstAS8jGBm
	q2oD6m6st1InHerMoeNx2GnN9ifCLqnh86aYQ83td2NiiDuh/k6iKoC0V0OzOGfoYQaMd0vioML
	kfY4QIQIdA+SGH0aZa2Uwbkn4pSebOkDTR+aP8NxrShS/c5e+n/MvPdPbcASuNltUY0oT9meIfi
	GEIIJ1cMvA0vkTkI9sNltuEXbulSFbfR6l9SHh9dKp9FCF0+4o1sHZgpY9uSUsUd3swfIIcfftU
	sO8ReYXh0eGQDu886LoYyjlWSDIY3yndb+94rOHzNhRLr0DGHNjr4BQYfI9nkU0qq3Szo8ojxBb
	FRMtV6U2AO2b31gEOdZkxem+JI6q6WE4ftY5opqsaSBcEEBZ/2DIcD7jmLz4JzQX5/238CJPlx5
	M=
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651568a91.22.1789379686835;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651497a91.22.1789379686334;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:45 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:25 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=zBLhplctgCAcoOe7FRxCtyfBa/oyBjq6g9Z0IYe5L9MtrLmJaNd9qDct74OJnaUKtQIPvIUGt
 uJ7riScJQHMD67yjPn3qcLObw/T0iQbh1O1ZlbZsl4aMUtuPM02TzF+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7c467 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: thFyYR-zpMhAfi_ODJUeIa2QieBhBHlD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX9IdOCPGG6LX6
 y4/uhLLc143OO5dMTjsXslu/U0yHy9cJIY3ls+on5CIhGOjAiHetMV59+vOhGU1WnVSE+oV4sG9
 bJBHQtIyPEekGzLVMpthwmR+Bskaqzc=
X-Proofpoint-GUID: thFyYR-zpMhAfi_ODJUeIa2QieBhBHlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX56eKn8O4hNyX
 dNcDgknYbxriv0N4KLDUag1qPNbbLG5boDkG6k6ZanPHl4Mtbv1j1BhLOuTIapl8ZFFirGXNuG1
 vy4gGOvMm8tkXZr78zC/k1d0FiRd4f385yNgyJenPshQPV7/ABdbcM+OgLF1ZeNE+bTcBvZHoQD
 s3b3zObyQMdriORFEz/VgPXwCu/f2hR5vquQdv06QBF8m5o8TD06T+sHhh1pGxsAWzj21o0PDAJ
 WCpz6oMVw3pOwhJ68bJ2AG4meTl3E6uGifLgWKdz+XUY+RBj3gkSiHUZDnjIxQqnUl+rEM4Kvjb
 IkRc7Btro/ZxGFItTZ6HcI3osngbMmB4huNtL/F5O1TKdlv1iZUC6oVa+AawO8HcORRqJBTOkUo
 upIlVuDJ2+m7l9n0afqaFPENjsZ4aqBVZ1F4QCyFOSN6Bd9F8k3zh7SnTWSXLpeKDYyutQUtbKS
 JnZMYeI58F9zz1JSArA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140141

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd075893304a9ab7bbde84eee5547491..5ebd2aa0a520a7c3e08eaff03e3220469cb64f23 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3357,6 +3357,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

