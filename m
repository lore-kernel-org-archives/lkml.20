Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D352BE3C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867498; cv=none; b=tLMNWzb8jqy642DcbIH+SBtaJcysPN3uC/Tqy60KyIdyd3+3pBhiDNRzVEEzHiinn38lj2ZRPmF19oefWHVXRxUJmJ5YXeF46jMlaNJnaY+eOtgltXTJPBAH76e6XBM0D814j2aq4tSNmIWu1UwPF5Xht+qcL61MIirgqKpUgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867498; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkxDJN3TbY+M/EdlTLNDukYAbUs6cmLYL6OMiZniCYiFeTXAYJA7nEEAmAzQYXqUEG++WUYteODCjnHO1k84IFnnIysqUreOlFOBQd8aycHGfpaGPJjNmiOAp0kYRIM/do8EmvXR9GqMo2WldygUeJ+tEGQs1tUoan5djXWdfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAyFMGBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqcaYxUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAyFMGBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqcaYxUA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dk57b1856934
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=EAyFMGBaFIfiPCu+
	ujTO6LWltDPtlanMGPe38X8U0ZuKO/40DlMXYgL3TgFEd9KxEvEA/HTwAG7EuL6s
	+7g09kIzr3yVvoKfhXWTfXWHAao1hqc79o2dOOLX98Mxewnfd6PwcDhJROkDwOVo
	SA/OGoFT2M8RJb6NId8AjaPxKqJFCXrt2InvcbabF0gxYx1n0PHzONBhScFcWXX+
	Ug9aiJUpX7gu+5MuysOt0L6zd22r6UJrdAlduqF66wKI5qkxWmUy0KFLxdjwv+mL
	oCUvLWlqqqw66Qva0xn5m2cA5Jlb0jKhL9b3WhRDH8Rsj5ct4LpyC8hTLwuz6wDJ
	r35M5Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcvw9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-143826c4a13so6004906c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867495; x=1791472295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=QqcaYxUAWNITrdTn5d1ntePS9VVQFL+UpgfETWRL9heatJ7AO0eOUeyD92WVvzgD3d
         bxADYXp42J7XiTpXVPbe8kgcCbLWEL/nLZWglX+UUSNgEFK5bLb7MVt7jn5/YcqERh5g
         2ooa4n0/W+zGt/yKLIH2kpOZLPvEHC/8b+bWKvI4QlTjE16ORhqtZsoDxc7lOJQEkEDe
         brrzgwIT/Ux4UrZxgvK0z9WW88xZadk0ruJ2LedoWBcTJOhpqgVixe/hUVO1m7N+ApTd
         0Q3Gja+WciK/6oh1zxi8mDqBSc1OHHE4DcyMp7alAWABCNcreJkKOxdSJHCB6xU9u1O4
         N//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867495; x=1791472295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=S6FZsXuWMinw18v/tSdc7Sr9D49gcZjLRlc5I/k83v8SVDL+GOEtlr4walqHfPeeNN
         /37PDRdPVc86Xo0bBhDFwXaaFbNjWDbF/x4IJHHJRzg+IJCC7j5w9QUgBI7vCTLw7k0I
         lHrDiCRek5Z3YlM+lxDaGc/qYI+wmjfa/bwfOjLnyFG1L71K5RdRFcelQkprSjOgJBQl
         OPZffsL4bK6dOeYJTewg2QwrhqgA8XvfX8Q4CGy1voiwHTnfwvmkVAIAtpuQMwSf4kbP
         P6/hG/757AGdB1etgsDjkTxper5gR23MDpC20iN47L1DnIWyJyN6tvy6ASCqRKPGB5Vr
         olIg==
X-Forwarded-Encrypted: i=1; AKwUvByADCKdNFvhhXDGDH5C0xhaVLwT3SK24MLJ8qmkAkiH06go8jfOSR2+wtLMV0EbqOAOyAcGvYSxgk9LumE=@vger.kernel.org
X-Gm-Message-State: AFuF++lXsMgiOURkHBDPoeu9ytQAE9dM/s3OyM04P9l7HLKAGWAzLpSv
	ijxgiROUBlXaklkjr3qkrdrX3RsRJa+pfUO8OLqRS63NyU/c0gSplHKtzqyihoSj+fmEUD+AVrd
	DYwEQmyphIy8cdBtTBnANFL73cQOJ7Ty1of/Dhu8z/froc67S4CHlCiFlsdMV7H1FknY=
X-Gm-Gg: AYBFou0xCYzC0LsWdv0NzK7DcqPca3lXGYR2KxJJJiR/dk92u+UJXFYFIGZKrHmkH60
	7LyZxldoC1G+Vre/J9SXrjVOkUrDaiNAaV3Ngv7wyBJNbTh6TZmgjKZEWH+5DII6VgDtsHUgriV
	w/K606RqtrMPNB5hUCPxic3GlR36z+cKKKcQshSXJ5QZKNDqh/5ey6ofntJvhKerZ3vzxUyZ8T9
	btO/V8I8cmdK3eRC5Dk+TMfAXPx2MJ4tfkvf3/JF/pyUxZcOoPYliKKin+9M7JKvqrkiVwhmgbq
	2SHtmZRiaTzKlReaj1FEUdpqaHBTSxWr7cwXorXPvvmgAHn9MuE9Q6Bj+LoLu9auDJv5ndAluxK
	IVXwpIP2m8kESjA4XyOPgOooD/aIQRu7QwJ/ynSqrdluWujIBHojg8bUEASGUdMkznUyZsia+WV
	Yv1ReuywVMSqL5RLNb2CyE/qp+YJzJ2EUy7EZpo621hdED
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970645c88.35.1790867495242;
        Thu, 01 Oct 2026 08:11:35 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970602c88.35.1790867494617;
        Thu, 01 Oct 2026 08:11:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:12 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-2-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXx0tnx1XSqOaK
 qYyfb5pjhwwCowaN27VlARTmnbNzv2mbi8kQ9x4dOVnZzvRpscHw4B/8xabqSxqOnFVkeoq7GE6
 1L2ut3tA2yIARxXXz/z8waO0T75/wzGRGUG2yGIkO486kLggHNiLIduW5LaupaCPGxUlmzQS2h0
 EGoerT4mHhOzLV6SJMVbXe0T1Lf0UjvRh8b7dXRTKUtnzHx+mbOCJCp9tcRUj/4oOWd4JcRSrxy
 Q4NN9kkxStbyHbXVzPrTRTiwzqXdIPPEGbVqye/tMI3NGym5rRNiwkwTKeR3uJ4l04QcLZ5x863
 Z3Ov8giLV317G4zCL5V5EDt7Gkn9pY7BvYYadaRkfk+jsoZN2/w5JEPF+Ftft1htnx+avbCE6i4
 mMqbCAXsrE38JM9iArpJhy8CGpFItRTtnFwQHuhXD9rQhovFM5emJhGeceCJoqRFv9LPnE2qHix
 C2pZogW2yvWXCJbQQqg==
X-Proofpoint-GUID: EQnIrMrN5-Q3Hx7c5pEB6R8WqUbDn-9F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX47J26l85UHen
 OJjYHSk87NvDGsfb28UjFItW3Sl2UFutDY6lJiDORW5mGvGo11HaLaMbSEsVaJxeM/Xuj6a5PWf
 OCEajPb1K/AosD0AjIie3kO0fzv2mbI=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe7828 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: EQnIrMrN5-Q3Hx7c5pEB6R8WqUbDn-9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

