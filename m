Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116D3E49C4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450908; cv=none; b=qUGAsS9fu0yLbA6KJIPYH+RXsGSVkZZQfd246sp8zzt3j1R4u+fyKE9/JedIYokOiM6QxUqsTRzSBKnOahwXtGa/c34+pEgWcYjouY/aliAYmvdxoqP1C+tULdYGpgxaQmHiOTRQ4ffT7eloJuTRzOeM/1YPkORUS0zEfybhXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450908; c=relaxed/simple;
	bh=WHL5zca585tZmg3vsyLGxdRvHfLLpaf5RO66L/4fym4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N56kFTzef64B93WU1xgJ4/8UlQFZg2GsjPO5oyGSBHucxjecSkq8dOJ5niLZ8Q4MYsiQItbjZZzd3/NQTEr8F5skOnfRKXcY0ZwRDaoyJlVcvoXNR+LdeX5Q7kECxDKbiBlpqj+6mzSxK6wFRdaQxmoladJkLtdAS7by7rwm6B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W96p41od; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWtbRK07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W96p41od";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWtbRK07"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KISc3307399
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=; b=W96p41odhP/5ZhtQ
	JyUnrZO2VABmpwKnKlw50jGP5iwX2O3EvmMW0onz/YWU5hYw+fG5509uFh3ADxPU
	UDcOZIb6F6qJAVlo542udPjgGxSvP1bgk225M3BpG47eWVQRR21lcQVjazuvuQvP
	EExaDTP3xY0QosFNgjkxzMOYgdB3pFfS2xKzccE9+coKlq6Yw8bIE0K4VMxyKgIP
	pgufa8oyatyu1qtAV0JHKEqBN3qyd9agb3MFacY+t4zSHkGQKLBqaLxdLPGGv+gQ
	cjSf8fqRwjVJiXy4+Nv6UAnubCQVO8y7KHeeqqTS1ovjSIKi33c7x1PRsZh0U3kP
	20mx7w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9pa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:15:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665bab585aso5861c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450901; x=1792055701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=;
        b=bWtbRK07/jBQln5MdrPU/6UbWC2Sm20bQ0T1TLR7ZrxNUUQ4FPOYxIT0PUHUJ9pHD2
         GTvKs0pbCSYOtGrVXm2KNCoTvjB8e/O+3U4xrl+nbgYqYeRGIP2HXYbck0Z6Ue6oivae
         AyrlP41QGulSywmU0xShs57fMrTwjxj6xxo/sNAcMknUzH8FOS/0+cr/A2hTdzrXfolI
         QA8wfrtJP3sEO+VFI4UJ7o6lVQsreAgFxgZo1KsTcAITxuCxD+jWMakAUa3xG8aNak4f
         s3XF74ZWiphO+kc9SnOyDy8Mawu5FQmXyEW79KBAnFSLXhYIdFDAg4b2MjwMJ6yzyEix
         txMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450901; x=1792055701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLphlPMOZKP/sCfp6Rnm3MmMrTEYIhOh68863B2thWs=;
        b=rq0RY+VykqGzdA1+t7T+v4FRLAPXu8Lkhmo4FfjQYOuEY3N4p53c/0CONDRse2VVNq
         5zyCCPybQ2v21u5fhvrbhHTbl9dbbb/EgqgWT7noFYgSNbqsstFEFL3DjfCZ1LaD7lTL
         ss9Mr+nrMlCdSrIBskMYMR+RLZZCXQty5gyzJxCgYBoQDWmNXJk7Rh2uAf9g1LAR3E3z
         sgbk7QnIvGLQ1/wW4wgN/zEij7jdz/78Bnjhx27zbbIHzupKlNI2u9/BHsD8/ANFCxFk
         LugiID0uu2RCZNomZ6tqEovnRNv/RDq/obn6NDPChdx+NyVllh6LfVb6abpEwBjM3Erw
         YYhA==
X-Forwarded-Encrypted: i=1; AKwUvByczhpaVF+//ENYK6UQyg2jbeDCrDUH03t2XACLx/J051/eyf68xCOPcBBwsp12DXT/HjKgwXzXRYJYVak=@vger.kernel.org
X-Gm-Message-State: AFuF++nygyCiyH8mEROcOwvMoXn7j7ufEY6+1mrnKniJInmmxgnwWkGi
	tTY3OuPbthx4c6QFaIAogbgIZ4c8qQg/eap9KAOL1ivr5qUqsaxy4+ZkX9d9IZ1HYysAiy6zxsd
	GI7HIT/2mSFyih73paTm1jyjFrB6pXdjRm5xSJshgSzYNuby+LeTywqeikenZKhLpxo0=
X-Gm-Gg: AYBFou2xDJvS9y0mXjXpaL4dg7+86wRoC8fdeq9b6LRg8JASI8adz+yZ1P90/Rxr01Z
	8NAfKY4NRFGawNtEI0zLsGo5r7lY6VmTBBEzbLbRUpphvGwWUlq+XIGnpzsn8JZFCASSoaQ1m16
	UJh7kYpTua3NAo1Q83UQeyR+m8kmvUnYgEWiSLIRFAxjxppgAJpErmit22TtC8MCqkZhyYDfxaz
	JKUP7t44jr7cNOHYe/3+ZYsZXMByoo2dXCKT2nWBHtgq8jsG7MyT8PyUThXtfMWOEkBufVSq4iA
	iSE73L5NAjJxqh4FpD/JTTAHY9v+ib5nTMmaxpvx8xTEAjqWoCOeFXCLEB6xfoYOY8Vi52Ulmfy
	x5llmv2pDDuiF8+hHe8RCSKE65ARteDWZ1rVLfrkXnQKxyqHmSuUWaWGrJ+5vLP1soqc4O5eOYy
	ejRlwZDz/bWSl+gfngIdzxstY9UnRH
X-Received: by 2002:a05:701b:270f:b0:165:8e0c:1886 with SMTP id a92af1059eb24-1658e0c1f22mr2841434c88.25.1791450901188;
        Thu, 08 Oct 2026 02:15:01 -0700 (PDT)
X-Received: by 2002:a05:701b:270f:b0:165:8e0c:1886 with SMTP id a92af1059eb24-1658e0c1f22mr2841390c88.25.1791450900304;
        Thu, 08 Oct 2026 02:15:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:27 +0530
Subject: [PATCH v6 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-7-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Y9rrEEHT4h0CW6KNHIPZfOyh8BdZoQXy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2PNIr0IS7B8b
 VkBa0rLDWv6SaLDYfmPjNSBOXhhq2K2iQzWDUviIgtNos2Lsy2DVdP4HUU4OOD+Xlt+1pb0jzX9
 oBJ7xrNVOTw44xmf81BZtxHJUuTFiso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX12SHVXano5vs
 xbC5BBOgr0McEfGoT+pKreRnRQUSuCudh5fJg3MipGPrRWlji8FhZrc3Syomf6p3ebUiaG+NIA4
 yyWbfww+ni+Zt2B/VUpaHGPKPRWlJYvEahwaXSqI5JXIPjYZToFkp5+4UvU0b7nNGQkgh0x6hZy
 VQ7BI/wVqfPqJfWlj6XRGu9jZNv8aU9gt635ZirmlxhM4/wX1r09FcVBnIZEQTBjJ14j9BmTQcT
 7Z+65XtoJtDr3mOgxvo234fc3gnaG24tw0OWKt0C19j7pd6c0FPtLssbtYnS6IYNu/1NmHjUmxw
 aPcOYHhbSkLTERIcKabMeKSYG3NPZYiy4UvjBri/9mvBPHKKHYNR5AUc9wJ+cvrnfGzcEEF/hih
 dkwP3A5zvTbvnjNmM5NSF8xUMWfV3s4zYLGWzKli1CeszcPVmmfeeOFBIH0+2gkWNbUb1Uo/fQH
 m7wtdGD1x/VQ0LADJhg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac75f15 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Y9rrEEHT4h0CW6KNHIPZfOyh8BdZoQXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index bc9502328738..9b6ebc9f59d3 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -392,6 +393,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

