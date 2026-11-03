Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720539;
	b=BKRlsr13Tpb5K7fSrykohjBTUVjrJ/p+QLvUIcPtO2dOU6emtqR6K2UVTIPKg3UraH7s
	 0eRkuXhaY0KEEevRqoUo2MctEDaHQGLXzdVUVfBOiVdkgyMf8Js4XCowZ5Sg1mAmDQ6aR
	 stIFRDQwS1644/iZcKg1YHPKzQFgc6vxkk6uL5P7c1LWQNSn8o/sx4Z1s+Ymc6ARs3rtm
	 BSLt40+10LbhiPH7/JEvSue50KIP8uSZ9eYGT/Et5cKtUXStGOcrabLGfyuBdfyTutev6
	 Quiw5JF9mywafxvhgmQpHBtL2Dm2+WSb6+6dJj8RtM5JM/CrLlSGOB1mOz1WMEtQR2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
	b=V+y+gR1nUChYPUNntMW3o1+4Utg6jn54SyDf9GSf2i7FeJhQHQs3ZfQrxlG0YYN5IHoS
	 u/TpPgtxn9UmFPxPo7GF1s73dXZF/GN0YciMVctrlAmVqoeq7Q4GPVh65nrwFPU2+GPMQ
	 IoWoEZ12xhQSNSuilj/xfT0F7zPYezQKB8XwCEuIkVtC/JHPnbbhFhvNaF5dA1HeeOKoG
	 zUdDwt/e5UYZoccdE1Kzi6rXyHhfCDBxmNOykSAuPmEY5Zm+D5ftRI9orLin8s2tjFgHJ
	 poQYvAV8wfsBju/Pe+3JnayDVEICsulP6Q1KuLG/1xP8CCN8Z2uf4QCJJyzpuImoGRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQHgak1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LK3ntneG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788D606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A788D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQHgak1E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LK3ntneG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA9VM3081304
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=; b=QQHgak1EHfV7hcKV
	rEK+KzG2rFJGtw8lgrMTvV93pGq5bVdOvFJuN0b2NObHskaD2YfIiPX/sFaxJRa3
	f26G5EFRqD4yrEnaUW+2HbyuYl6ZYfW4rbzXy/LVBb3xr6u1pA5z3K30Wqn8aIxB
	lmtgLyVLrk8fj8Dvx0vanz4wrHkcz2Kt4hpYCTErD698GLYZ0kbxFAyughfmyfF3
	rB8E3hRInOFqgN/wDauqdHm5ZaPOqng5ZmPYDoOIQe8eCuzRrA42C6B39zpiXVW0
	fP6B+iHgngC+tpo1/OhJkCPgKGlab2KBCqZopbZdBOFQc/P7SNvoiP/NVqSB+Rz0
	tZEq4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2ackwa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:42:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so7055547eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720536; x=1794325336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
        b=LK3ntneGJ0s7dLO0ekIsGVaKQ1xOvy488Uo4ZzKGljjz8NhS+odRKgobXhwM6qgj3S
         t/yT23BpL6K4TPO+aWyE0riBxRQzYC6HvU0KCNCY3Iq7e3U0Uw7iwYfw09vTm+EUzCQ4
         lG5sppeu9kvNbdARVZgx2hVpATVjfZ6mrwU1on9qkBWuGh/ANEmLSIGGbaCAYVSW3cpL
         91BApsGCLLB1JNi5mcMYcCD50/rwV6uAw9Qd02nJe186BBg3YQukJNPf2pPd8rwWyvt8
         Im9bSU8UUpVPbFfj4OGmvcbGpjRdrZ3gm+PskrAfofC0QQQkDusNNpBABkqJgZVroOck
         VZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720536; x=1794325336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
        b=0gUiXJ5MKufBncEPNW1lCPfvCz+wkW7p6xYmaR4M+wPAC509I8uDHhSkzwoKG0IUQU
         NmjzJK6HE/1xS2aHQP+SXTCu3gP3RJKKvFVwZqB9NauyQ4V9JbLtbp606Zr8QxNlYIo6
         EWO8cxN/RIe31yYe8MmjiyrqFBH+p8GZ55dW0FJk1OwXSB/sxqE91IVTgsdZwVUIk0Tj
         DjXoA2xKvISSeoRxMXMXvoC7CTVs3V0qDYQ4XMfrVBcIgr+qfqz1EgEGxzMI2InohuoE
         WSuagdys7dVR8EXp08xAnrkhIj2eKshwGTuhdimtCJjHCBecfFP9EczowyS/qNptTwQ5
         JCBA==
X-Forwarded-Encrypted: i=1; AKwUvBySK0vquFIwoWlr9K7AqhCf5dKaRutplVQDj6cDHq9VNB4kad+d1y2BGWHsr5MMpWp9meA7HkDhopKOBXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v4nLS+PTe5OGh/p77p0ijZM8hhgs+czXJEaZNLDul4xmrTcYU
	LjcRp94pSMI3Hpnp9RecobAvdlJluaS+XoTC4NBk+zf/2qVsB6xLh6Lva5gu859+QHmIEeGeR5F
	Z8/DaLKPJMvIlkOn1qdVAr/frQxA/3UNEhKNMsbsiTtuUvFAc151OwmtSjzlmP8i+s4FUu+SHco
	4=
X-Gm-Gg: AYBFou2kUtHO3QMx+tbcc0Ih6jYY8Wve5wrPPlWB8LWcx6oBvxrqM4/YRlMkPs2MXs4
	T5Cv22/EJhOmsdA4WFs7y2cDUhCBwIXL69JtfkKq4SnOFM4Pltt0CttPq0CsC15fBwt2WUcgrSo
	xkYyMiZVk9zazzSzeJ8lbpwTeLkF/HGdTX+T6UYJk9IJJ9mYsCXTCFdssTeQ4sokEZ0djOGjkBd
	e3f7Mr5tocQ0viqc5YvZO26/+plKAc1vWYBSNEOWrzCadD9pqHvJoDcMJiswkyTMv2zWqhDblvv
	nJPHSf+I74g2d6VDfUy03STqJ5UoWIsonrvor75JNmxsBPXcQtpv+nZMboBqeIJ+r02rS827e6Y
	0jyRQWDD6WuU9dbnsZ4gd+Ju2N82z+mnMQaQACSqsmH6CjmLgboDPSLAetHQtNtiwKr0jHeHHmd
	B2dBnOs8MB
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr20553917c88.30.1793720536271;
        Tue, 03 Nov 2026 07:42:16 -0800 (PST)
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr20553880c88.30.1793720535682;
        Tue, 03 Nov 2026 07:42:15 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:41 +0530
Subject: [PATCH v6 10/12] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-10-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720463; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=EchhzG+P+vhgD9Ucf6EZSSFNL3jqT3gWIrPVlGaIjN8=;
 b=IMU82QhdRTiCD9Kl6QWCBMvIE9N7cMC+kR6/R9E5WCI507Ja897JzWgGbVzzWfgD1btV3TP7q
 GAwDSl3LO+lApMrgJzDRaJIguNa7VPvgXxfzMZlAAE3CZ88NXQk8av6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6aea00d9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX7Lirc7tZdoDC
 m1V/w5m5NB4gJFOF9MQzYBwL4VySY4y9slxejvuCQwNLJp5H/ky5xrYyKUUeUJzG4dYo6s+i7OP
 l75oazgOSxzYbK7Dvqr1UTlLGQB/+4OYmEzXBJiRkdgN15c5hqfP9OehnccrTsjkIb+S28QSry1
 cu3YPs6DbIzodn+w5paJBhT+bN65+QgXUeiVyvpU9ktYAGa9zJ9jJ7kiIUcAk+/linBprKN6EB0
 YCo2MXoW5DD3Ghjr+uIVCfNsauaPeGJ56QSrLMqxtZAreDD8xpzVqzIOI6i+6JYtJR1yLTXIZl3
 4J3Rwk1FZCGiybQiVFJ89cL9zekB4oBPA1mxGvlZqPKE3TyRCgoGgwCjn0wRuazsjFaQrKhb8K5
 DCkg18Rq++tE/qFKc3FlHotM+89Q3+kchQKrlo0oOEB7YR4GfGGyfH34FDroHpSmfVOYBXvsiJa
 MU31VeEfWrl1tFAfcJw==
X-Proofpoint-GUID: w4F1t27x9W3xZFRVUa7ZDJu7ztAOlz_W
X-Proofpoint-ORIG-GUID: w4F1t27x9W3xZFRVUa7ZDJu7ztAOlz_W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXxJgcFIdNDjxH
 agulFc0IUWH6jOfalXWXJLehFPMyFyAZDiDYHDwM31zQ7elPS7vsqgoHSDWprAPqTxidbAOR99m
 E7D0LklUIhPgGwMVTzgtccEXaBXmbqE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..5710f7bc56bacdd49d0e1f1e076514e6e5bce1f5 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5418,12 +5418,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

