Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02A436355
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751988; cv=none; b=HVYTGYNECkIHG6/GGXfOje2BrBx6EDG30k0o5WKzSf0ed7gJu6lWrMC1zAx9SxQmc2oCnEL/ne739MUX81X+9LfYVVPIDagnNtZzvoUXrTn1z89xvehdVGFH6Qky3CYQJ1eU56UN9znqrjhnTHyFho9kRihjJUeeZXcC7eWRFTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751988; c=relaxed/simple;
	bh=r5KraKAc2ErxccoXBkNJW54tEPfhhL2AjLw2qF4SJdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgPeykH1b0lBiol45aQfd0hX57lUKmyu6/2K0pghBubfefZHx+TIOpOnP/hvjvqHHZDhnOzNMCNJZQLwOPubM26e+OjkDLj7ikg00gRWDEAxsU966qklmdPsCtY2nCqp7HqkLEzXR2xY29vxPTSHV7y+aey9ikpwOcmTJOfLq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRR0uv4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrV1ezNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRR0uv4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrV1ezNC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBw0x356585
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXYsL0fAbC3F/0wJOXGtV7JM/BPaOMrDrDEXkiSmrko=; b=BRR0uv4LBgy0pCAW
	R14PWeeU6Sy/kqxuxReQsSe63wi6xFGTiSZhjXg2qiY6gmJerHEG473icK+2Lud9
	9gMA7Ca2/c+PhZgcHy4tNobwtO7rwYV7WT8Rrsj0n5bHXlOVwrGmvi+E+Exzw1hK
	BED28XtVG1vcWKPM1LYz6adQYdaINn2nFsx0MvTpDQ4F74YWPNDMXLXWuhIeZ2YO
	NzdRissYVYrZX1k1JS07KkcsNgAZyF5JSavkv5tTarD4VaVzNgJcvqvi1GRsuaED
	XH8b6Y072+FNwDhXlaeNDe4oiQ9auVs1d5XNjrO1fNxt/PwvmJIR6pnOTishuKyR
	5XQbgQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9ga3dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1419917a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751980; x=1788356780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXYsL0fAbC3F/0wJOXGtV7JM/BPaOMrDrDEXkiSmrko=;
        b=KrV1ezNC/v/yUESO8z7Wm9xEDIZvGDd0OkqSUI7FuQO3kdknfN9+36zcNU8n8v+0CB
         liGWa2+A4UefHhOGvK+/DC0pEMVuBwd5L1zxF2HsCyCFCEAyVt+Te1VetOHTaY9+O/ZU
         EteS1jMMUKHIaFU6afNC+V0cMpZ/H4aYBLR+A3wtUmHSzKMzcnRpIxa4MYbPjSHipqR9
         Lf0h7LKug9OB7lJaJ54KqXX6VwI/BImYPI3WepEh8N0cYdvF6p17gzYCCBVFbv/n4tQm
         zU6FFBd7TkEtuFx1o4EcD3+5UvSXVIhqoK4EnXMFYy+WvTfdqYkloYFnWabDwzOWOBjI
         /M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751980; x=1788356780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXYsL0fAbC3F/0wJOXGtV7JM/BPaOMrDrDEXkiSmrko=;
        b=rUnyjmASYgz+6q+W5f87XMTfln2Azl8muJ9U+qup79TmoSHnOrhCrdRwukukDAmH5E
         rKH/PQtUd5QfhqcPHhcFXMTEaDc9JmRMydfv4R+6IoXWVWg9wuprZaL/S1R0NTmwfDXA
         FB8rYxKdRZn0Yys5ogilX7r99m5CN81bjrLmPHvgg2vJgwf92Vn+XVj1HyUCQwwip3CA
         DIASwIRDmizuZJnEBIOUolWCSDgw7kehgK47ie5KOi0WNuI0GsvKDMwApbfMIWDPHuSS
         +mWf+iCxsaYG5XP5IGKYkFSl4jTASoWEPvHrk4DWV4smbL7qdarsqp4Owgm7Ao/nD4SO
         iToQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDlYbVqXkk6l/9W3hg4v6BDOlCp6RusI80X5uHEZUq6/w6ZEnNcOYuQfEXEqrwfqTMaDd+W3gH5idqzHU=@vger.kernel.org
X-Gm-Message-State: AFuF++kNtzTvlxbySy4dZAYQqAp1XT1oIjDsMUMBGhg3Fi08AqnGyGSw
	CEBe4xvIK60A2cHHI5RRMhpoxYfyBEVXcc7IM8PIOxEu5uwD9UiXQUa6vB7+1cm0iboSskI7J80
	/Uxklb48jyhiWtAAqHx5zmJHFjw8GyxVUJ0ii5VYIJDabf7dHe++j0lsKi+N2n/UH68o=
X-Gm-Gg: AR+sD11GOeDdTJDk+j4LHpIzp5cUAIFqF2FVrKOadJy7NSuwyXO/mF1qfrDDvtb25bm
	QRWSFNoHqVzpz/HXcXFjq8dAkn5XnG7dsaIUGVsaMzVYUUS2sHGefP9uCissXIDN4Q0e7sljYXU
	dyWV4ZUafQ5hIzg6L6rR1A0hIni5KP+e6WSPxbU2bpY0WrFZvSMYzFn6n42m/wPvhdJVHLbV6YC
	Rd/YOX8r4F0AJ5GwJZ2g0QoR6+3ssB2cUH1lEkDVPx33lQsVZke4+uPmHhWcvzeduOVYYI4Fry6
	H1oWlwre5oyp8sAjBnYL650x+76gYpQ4CGTJ5o0+FRqu1WyMrOrAYe4VImCdPAqU9yIsoy1AfHr
	7tbfWaAJO1vDzMz7zWwoRddyPEoSRkv7ZmQ==
X-Received: by 2002:a17:90b:5828:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-3966d486840mr15749757a91.13.1787751980170;
        Wed, 26 Aug 2026 06:46:20 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-3966d486840mr15749558a91.13.1787751979472;
        Wed, 26 Aug 2026 06:46:19 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:19 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:46 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: glymur: Add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-4-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=4639;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=r5KraKAc2ErxccoXBkNJW54tEPfhhL2AjLw2qF4SJdo=;
 b=hIRA1Fih6qQhcK9u/umyKrxNNwhTZnUVgztMgs6cdS8UxFPeF+ajSoHkSp/8sU4+hm4SCF3cH
 VkWHyTr4iMHCAmdJQjNEdKTVQ+W/IE1YCqM6W2VMetUMRcVIAXtIlqL
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: aBShIr1A2QG5KsK3a0OX6qQ1DkTiwQCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX1zUGeK5b5RAn
 vMsCbEi+22qt78Inic767kp3p+uZwzc4fsa6OqcutT8zIKY3F+4rnuMhrTVf5KBjjAppi7RrOE9
 +H9+DS90Z8NBNJG51nGQtpwud9QOlt4kgUjGcyehDW1jNcztXz2Cn+ANJuNKaY+uzrvnAZPkHg8
 Pi3QDkjU3eK9FP5kacN7Jl8p9gpndlDifQPx31Ws2dCbjp78oGMasynNxXz/8s8ZSvbRdWPdlNq
 HFPJfKKYnAKEBNqJGAnlhalzobxypx3gA8F38BpXlo1s6TCfjGQijiDMvs6dOGRuZGsY0sSsF5a
 FvT7zdIzIddStfrO5fghJDM/1rrT37t7zBx3Ze3bzoJXyibnKUD1lUTEKDvcA//Wka+91JrVmgR
 d3IGG2OBQQQHT6uJDqFW30LNrGerKRdUCDKcxAh3f9KZiPL6tQbqdE9QchqJkCoEGWUZKQ4SRTo
 I+ucz5dbx5yivS2YJPQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8eee2d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fgQI4hRS6EVOI71rz58A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX5tQm2tVEBpmp
 ylcrHgLl8lskzWm01nk7ghw6jLyGW7DwzFYzBNBp4di2/Bdoj1R4DvKXbbVVTyLZGBZpYA/ySjM
 9cdggbHmFgSbffZ56vRgDmARaGCQ7Ek=
X-Proofpoint-ORIG-GUID: aBShIr1A2QG5KsK3a0OX6qQ1DkTiwQCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

Add a fastrpc_far_region reserved-memory node and link compute-cb@12 to
it via memory-region so the driver detects it as the extended mapping
bank. Bump #address-cells and #size-cells to <2> on the fastrpc ancestor
nodes and update all compute-cb reg values to the 4-cell format to
accommodate the 64-bit iommu-addresses values.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 37 ++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..2aff2a8a39ae 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		fastrpc_far_region: fastrpc_far_region {
+			iommu-addresses = <&fastrpc_far_cb 0x0 0x0 0x4 0x0>;
+		};
 	};
 
 	smp2p-adsp {
@@ -7980,6 +7984,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -7991,17 +7997,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2401 0x440>,
 							 <&apps_smmu 0x1961 0x0>,
@@ -8011,7 +8019,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2402 0x440>,
 							 <&apps_smmu 0x1962 0x0>,
@@ -8021,7 +8029,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2403 0x440>,
 							 <&apps_smmu 0x1963 0x0>,
@@ -8031,7 +8039,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2404 0x440>,
 							 <&apps_smmu 0x1964 0x0>,
@@ -8041,7 +8049,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2405 0x440>,
 							 <&apps_smmu 0x1965 0x0>,
@@ -8051,7 +8059,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2406 0x440>,
 							 <&apps_smmu 0x1966 0x0>,
@@ -8061,7 +8069,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2407 0x440>,
 							 <&apps_smmu 0x1967 0x0>,
@@ -8071,7 +8079,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2408 0x440>,
 							 <&apps_smmu 0x1968 0x0>,
@@ -8083,7 +8091,7 @@ compute-cb@8 {
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0x0 0xa 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8093,7 +8101,7 @@ compute-cb@10 {
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0x0 0xb 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8101,13 +8109,14 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					fastrpc_far_cb: compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,
 							 <&apps_smmu 0x19ce 0x0>;
+						memory-region = <&fastrpc_far_region>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

