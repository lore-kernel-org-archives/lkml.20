Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AB42BC5E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109423; cv=none; b=uQOStFKxh+j809UmzpADwIr6DPA4kAMC8vQkZ1Sgrf135p8trZ5DmwCqObsRmlmdJu7XCNgjeo/QFFQT4YFrkwys7h5AiGAqEj6Cc2sep6JkfdYSLM/vVePKsZ8fKceUkIut2FQioHM8kDB4YalJv8zfo84RnwZZMshMYId4LUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109423; c=relaxed/simple;
	bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+8IYXN++u6vyOy3dv4OWeQV6ZexTWjkoMUE8U886UXguxXsEzikT295CbRMy+/CulOPubSMxaHU6UxGyRD8vcKEVzBrek8AMmMNqG7Y1OHpFOWfEfz6uESNjThEpk4C20bOOwDL/yyZgu5i/Hf2AAhPPu77A1zaqlqQDECQhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBCoHoQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6KIcWuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBCoHoQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6KIcWuc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kK6B3229890
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=; b=hBCoHoQXZsdmquwU
	MnyG3RvMoGRC6xJ8C2QIOEMsfWTrIsq7s0zgy4yRtWro8YKXfBrJtK7LkazUm/PJ
	4pLdaoEYtrKZWgOfHT+UjHeLIZoMVF2Q8GAze8RAKUXzUqp9BZj+vD38SHv/57vH
	iHC/6//G6ySZLxBpE62KjmWmUm6V1k17ClHf5d689r5KT0x/5zyqIGuK7v01FGle
	smq9BEMXRSrkhTLfmRy2M4ZlaSnJUFuHFPool0g0uHiDTrH8NL3uNN171TmK/QH7
	uDdj1J1t//qzSMaMVrHUN9tKKqPgknu15t618n30dggXZK7JGlp+eoHUzG9QZE6U
	Q6cNaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2afhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:50:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so824576a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109414; x=1789714214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=R6KIcWucZYOeLyKIf2NMm3IJcUZ23VRrYiRgZiCw6dmgrfrmp562HYJhTU3zXZSNPx
         soSwTnmvFMHJPLuY/Sm3OOSgML0IP1tlK32RfcMtn1GBU/xfi3pJFycIY+c7yytmJCfh
         juCRBDqZ/KtTl6zW8LHkKg9BdrXeSAbuCC/Z2nGnEhwZaFiLSAVRw3kVJic+Cgc8jYO4
         Tp/seC9codH1ScCTQRM37ZLRtL9rHkezoaI30I14vq38X/kqqnJKh7972bwfAIFzz035
         1v4EpT6GTAvqVGDRiClu9S3ITqgvJLEOuY90FvJW1YaXMSek8Wfza1g/7ecjtEFtqNUa
         j+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109414; x=1789714214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=UPlwfs6IRajp5qT45rleO4KCdbWH8wDknt3v3oS4R2JwDVg6nzHT1PvwoYLZfDifgD
         QlQ7pH2O6J3O3elsczeeIRrYXtIxAx9/symjmLvHR6hk/dR2lSg9lFIcBu7W73Eiyo21
         5CJkRv2DD4i4inWSG+opHKiNPObJ/3HzTzr7e4pcV0tXI9qqMOy9gSlQi/6FObTgg1rf
         CU8UInixCe4SDXXUrEnISk3jiNzeO/LvfG5Wcj8c8g3yHnH7KcG5uigUEL6f8lMo54ZQ
         0Fzpwc414UoLbAK9DIJLa3ObQgCpLeOTKC/r9lUGcnjH3mCxrWW+tMA+m5Chkz9gOomo
         pQKA==
X-Forwarded-Encrypted: i=1; AKwUvBwwV4ULDeDwo7VyqvbXaytANtegs4XtXNXiCfAN2N7mKlyI9Elxuy6tCD3ivhio+1COEp3OxYLydrAxyGU=@vger.kernel.org
X-Gm-Message-State: AFuF++l3uJLjgNaO9oBMf7Qu8sowf0cCbpZjmupmp2ccJQAUEkPlzh5i
	b8r6Jkcgb96ROR7miQVgVU/XSUDOSU4/lsvWIbvlpr6XB54UFxCqHTf0beWXQa9qhvZj4097APn
	ICsWltpIwOBKKMbZ8WtPatm9O2WJBXxNkO+zbCfedJw3SFSLE8FZlER8S1kpJ5rQGgcQ=
X-Gm-Gg: AYBFou2HmPCf/ukwhhc1Yv73iHf1baqgYlcuVA8SpyiqmcNtfcUBmZpyDn91VvQ0Qap
	UIJ8cJfS5260tXQ+wW8+meRdPw3SRyHcgEUUJeXIg//UIA60DPgnvMbMcWDK3IYnoz2kTSbOhgB
	rY6ewY/8he8vGD2bcmXyfVdFpA+jg8dICNxjhGochMkaIRV8Bzer8FZbDIZqxfEY3Kxf1uwVZyX
	Vdb4/NKArSUjYAcB8DYPHQQmritx7KZw3AXjgNNLDairM2+ZQgHZPkQgFrPPPLPyD+7x2sTJMk5
	muVZzQgU8RA8+wyjzTpVO+LykPQR6C9Yebnx65DyplhuHdUTr0EvZCZwGYEIA1MRPf0qTFLBvs/
	lrivkU3a0TDdg+C9w+tm1J5zlY0DtUqDMWKU=
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863072a91.6.1789109414446;
        Thu, 10 Sep 2026 23:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4e:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39d9bd8f788mr4863009a91.6.1789109413867;
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:02 +0530
Subject: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=972;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
 b=V/QjQ73NA+Zxxi3EPxnngJjNoeGrZFJhj+/yyYr3kmfD+98g5tZEGBYgE/yxDmW1wvHKLr3ew
 FgzQB+aIWePD6GegNwwisY+IDrIkKOnaEJQK4a25K/k0bRfuBIisaI5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa3a4a7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: iuPB2k9WuS4jvSGyTbbk3iwxAH289lK-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX9HGlMsROkg3k
 F4582Z6pkGPxLyiZAmJgCYrKljpObaIiQFnh1OcrwKpZGg2stcMFhXUZ6jAATS+8Ifrw6YLOj1f
 62xLQBEaWDKA5OvlCXQiYd3okKEUViU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX/xHIivTZXSco
 GGUSibKSlaA0A+kalBJPHbpoAcTrdkfl/Qnk/imWMMRx8pp6Y6crKRZZpC1BGQbxUg1aDGqZLMM
 4+sJp9VXeUA8Dpyww+UZ3gkoXEBLgkfnrpHSCUrgpSc7hEi5g2Hp7uRIl28EU4PF2cyh1LFM88O
 sXtMAudOqekbuIom8nHqk5zGxNkjuV4nBzlaWDxTGVzuXm31miJ7EmPqr1EZvoMjOf//57HkW2B
 LUjCNZMWkPCcr6Bj8rQ4hVh8JxvqOXek3l/D01wxdwPTxiUgkm0g/uWktltpNwj9eL+sol3mf4h
 DBHio/KLjTxS9o6wFjpXgfFpj+MuPITfDHaYiCWm6BZtLRHY+3Hz+7rOAgvJEIWbfjvpoYSqidB
 S+53RqFaWmwMbt+YqXjq7ChdOnLkAeBa3pUW1TrCG2JwspY2lg+i9Pp+1iLHHkn302StMmhWJT1
 0rJ3DsfUDLu9mR1v7ug==
X-Proofpoint-ORIG-GUID: iuPB2k9WuS4jvSGyTbbk3iwxAH289lK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..54acc7d9bdea 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2439,6 +2441,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

