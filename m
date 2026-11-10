Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328766;
	b=nVTbLxlUyvGiEu+o6bHxKLGySukdHGQ2fq5Stgf2q3rFkEP9x5TSbWoRcDolMpq8ncJ9
	 f9aycM0v8vnAPjzSBZj9Vp74QgFJZqNAukNqf13JaIH4+0nJDr+1hB9ZZyAFSNd0Mqij8
	 /2zL68GJi+aPBGEY7spzr5FQO/TfOBgkGVoGcag90gpwZS5qpgrI/JD3fl6SJTEH2MD8D
	 DICsflWJVehR7z34+NUt0N1UlFTWujGRL4oKwjZh8PRkwzaN7cnXzzN+2rgmVCbHC5Dr4
	 TAmDZXb9YjzPHFkMM0k7Yqm4f07q02D1uMbPpjTZ6SgbvVDT2txnwA73zh4HyXcQ5bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
	b=ewO/M7J0QD9xrswkYNj01xAG57FKdOfqWF+v2tJZI79NCKrwrZ7EtLI8YhTe0dSSh11U
	 i4cNRdBduDn5VcNZxCGZfdIkHgQVks1xZO/CMqMrzPa76fGxJxqmWVfGh0AwIrCn39Dev
	 Ss64mi6qjJQb+oyz0OMuFALqUH9an2rjAwFotwjmN2Q/8BY8EWYsjjVO6A5hRqmzf5RQm
	 c3Qi5OYS4YJuylyl3LJlsDXrnU+oG6tzB6V/6oySnNDnz0N2GJJQMxlSTnlCMjBXqtmZt
	 bGltDh2WCuE9zn8E6xhBOuqdMFBBj5fEF+sy0XhXUK2gx7wDSZR4eVL8G5ERfRgmvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/6/vY0y";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62078606BAF3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62078606BAF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nIt4vP0Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/6/vY0y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF1afr2097842
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IK4ypl3sK+d
	cDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=; b=nIt4vP0YqljacaMICeODODdk6UP
	peemM+FXOoDVWJbFORb2bK5O/ALOWl1hlk4IFSdBDDvz15nGWTV5132hySqCeSJL
	QUvRBsC9B1owfFVzqvz1YzVbnDeTbg1vtVcxptY8OcmmssE77N7G1HZu86aAG7dY
	dmGiUQXyyg27JrStCMZ3Rf+TJydE2yF7Q1uEPf6lPBLQq2Kcmg1Cx1a6RIBWzy/2
	vM/dpJkIQEG5cw9V3jqbiUK9n/ddbRutTTm/+Rq6+kOlKgMIf2ZNjj0b5QfDZXGR
	m0DbgtRpdDB4h1EUpykM9dFO7rIttOHJufP4+4Krb8opYxoxlRNgiOF+CGw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv4b1kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99089f9591aso482410241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328765; x=1794933565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=R/6/vY0ywwhlG2NwJWLQEhvRwkFjBDUdtHKflCVqcEvPpo2L/nP5apGCZEIfW3zSfe
         TqwPKbg5l5LSET3EIS1o4mfBpMHmqOAYiFDANXCqMq/u1rXsWHxwk2xNcIynzBbTSKQX
         COgtd4t9cr70E6HDb/vZ8GDenTdPjkXbsIeVTADuTnKSsRWXT1k3cbf8gX6K5wx59KHQ
         V5HG34UTZTz5mwsJc3cnbahgpz56A4Y+RY78pKPrKzRiCBH5UxjZAY7X6pBReZwuZWTb
         osJJ4ecb96IBNiltbWQ/ubIZjvyS3hGG1ZseSDoLx1t2e7J+qD6keII1Hw5f5MT3cKsS
         B4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328765; x=1794933565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK4ypl3sK+dcDjebsl+QYQOGbd37vVTs0ONXYO+4p2U=;
        b=A/Xu+6q3r30BwYGEVJanCAbtuCchiBUpRVnisu8waUiudyiIahexrQvuRH/iUDUENK
         jsq8A8VpkTqHmCALcu8TXD3a1UTtYESroeLeC3HbQOZ/MBnLUqaC073iYm0r3CmKSRW5
         nqLPCDVgPL/YLtVgtdg4TIqTLaZUNQNfDJ5mTq5kQBitdn2WuAmEKorM46qjU50tGDBa
         lBxiLvX8pCoA7oHqJln3bs6Nv+FxMdGrorFdUOfqRnbbUwkxm0S+vZr9pWFj70vpKmU3
         0uR/k3ELJrLuujfrs4PP8mdHCRA3tZm7wBOZRsrpKckt7KrWezC9nKtopHl6n76AlDRM
         3cxg==
X-Forwarded-Encrypted: i=1; AL+hErGWcaumZQOEfmnA2otwfAOpNR6JOY/Kn25pnRB8aEbOU0qOIpvWZjOSSUzmfUKtIy5sEjFH7lXNaLb/P5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Nu+3k5gjOrSdipwro2M/r7dFwBJYdTCCIqw247ywlh4zjMDOo
	H9DtJnJJ4eltdRvuWzlmtK2a2EMl0iTA1tX4UCxxP6vdQXU4onPHYEf2DhivuBbw6C2t80t/ZZt
	ZCPX8BR1ZMWODjr3pfSDWfsSSdj4UeR23R9sa+j5tg/BIU1o77NUIovMKZIg9nrlBv7E=
X-Gm-Gg: AYBFou032cnNkyuFtsJDVFnc0q6x3O/MbFLdp28xLtVRVLjHBtzjTEIDteNiRcB9GLG
	1qyJBEiz54lXi02Ns/bxFEEHYNrSO0ta4NExVkNnOJDH5xaxdcPMKGJ8xv/cS4yXvPsX0DPMFUx
	SO6ZASPWKlqU286l8QH58fOpqGM6qJ0dNbsDKNqh0uEl8HAfySGWsDxB9GvgbXem7YldTBjuGAi
	1dcY2p0rJgbb/a8dO8vXAeNM73ahsySlFaZF8po7g0J18W2iYkhE2tZwGFVZ83cU3c88GRLXIvH
	FSsPGis8kKlUSt8JBkjFnzpkDt8EWjOrUgZYE2e4GJLkX4Cj4BHHKvNi+vZvG2iw+HFRHrmEYF9
	REbiov9Hf86+Tt7a4MjzFEO+AxjTcgSY3d5VmWw34k2Ejkb8YdNyQn4nf3hwFJ6LaHZPzgbDaiA
	==
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006549137.7.1794328764481;
        Tue, 10 Nov 2026 08:39:24 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr1006534137.7.1794328763889;
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:23 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:06 +0200
Message-Id: <20261110163909.78085-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXw/o6JzAvDF7D
 LCAN6QQ+kXTan4LthKt3/JQrdeUeGlRzY+VzS2+UsAv/9QcNflbYnkQk7hKqpY61VwDvEDJskZk
 Y5IkFRBCYsehiIIcbuReSDHeOCZu294=
X-Proofpoint-ORIG-GUID: PDgD23fwlp8IP-ic8QnpKo8icvBFjb7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX9w0t9n8xsgFt
 mS05f9R6ljydN6svqRTPCOAG5N5KKViZokf5iIzPkK2TQCoXZha5Y80zfBVxGOn8xWVVnSUguyz
 hyE2VnglSS85WPSIwyAIGTmjzMDHw4cyryfgbeVReNAyhiJ6Q+qzXMFSL0kOBFfqXtsLwZtrBxk
 bZDuci5wJoPUQgulenZHqTHKDZ0Yij8V839Y6AROCJWAxy/3OA9ZnmmE027Wb6gzdCvgqBbV1Gk
 fwj1CnQ1h3dMTHPKNVHkz7pLOnjDqv718zmluDMDS/QsgDUqeOHDKmjrzUTviJsqm4bu6ubKx+M
 1Yyq+QagcHYIhNylLOjO2Hlk09NPR5DEdB+dXzYTDn6+pCR1UdzK/sNQDwoZfnOfAovwbYbgm6v
 OiKacmj4SLCEnHCuagzDxzb3Seu+ryKKnB+Un6OvrQeDn2mTbumUynBTfAiOz6JLRhn1qS7sZBt
 ayv06UqsSz8pGc6xksg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af348bd cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: PDgD23fwlp8IP-ic8QnpKo8icvBFjb7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..7e8447df40188 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,78 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

