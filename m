Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458218;
	b=EUwiGB9sbN5YLwNc6BoDUlISVbBUyCH7SaqwEeYZcrOJOguqnpCxVzq2L6emvWS2poUu
	 CLmgTIHQ6H0xkRs7KAnHjkJZqN87rXQEthvE7LGvnSYWvh7YIFAGjrnb2loV7eZoDdLFW
	 S4XNx9jXtkcUGdqg3sKIZLnTWIeFMAQzLGECZL1nFv3alRrCnC1crKyN+0HQHlBudycyY
	 nA3el/FHPUhFskMheKq8hSvN0uwSFW87x8y0axTmEJq305jsfeOOO1iBXlt7JiENv6bWy
	 adj7AkcM21Sj+hNbMSr8dgFt8nehkPIZKCMhjOXSdq1aXZ0sEgROSKY90zESCVf1lZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
	b=5LJ43rlp8dBfBeLsT+6anZ8uZkUpVeqMDAPWRJMC3ZnjIyt7PBy2sX4MnVCrMzpGKHAB
	 FGedQHGQvmd/nWdKbpjUJ0TfPGcF2b7cmcKw9pn/OZ8MSxTvPq2FuZXY7JQkeFpIDxMYV
	 EiwXfXQHpRC981OvcQXTLImgN42vA0SZDCeB4i1QusPqcgnYJJYMs4Z5JvCagGNHAYW99
	 wyDVK+ZWIYIm9GpliZNCCyPcdRImm473hAzdZ/4OYlvCVg2qYj+GHiG0zznKUEmbrPFah
	 u41969quHe2WLHb/HVkbk7MVX878FpUDG9caMkLoMNxzSdi6awBQHMZ0punY/15sFeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMYCQSTr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiWABSND;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D40606F8A0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D40606F8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMYCQSTr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AiWABSND
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aWRB1475415
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=; b=RMYCQSTrRz9EAJvD
	2aQWz++tt+b8+61hrx4SvHOEi0IxiSjG+e+X6LFEm/wlRZ1MF5+CePsSu1alJzPV
	WMSWbz91ggISuWM63UZItN8a+MOjUvs7ww15qEpEGa8ClUYSLaf6BLSbwwz3/p37
	hoW2xOVrfv8XbafRgl8Rhn0nalW+XwIn8MtX3SlIq0nUQV52FOhI/NiDyeWPKguy
	5zeV/+nJWDcyQs8BGyQMAISzkurhNlrTBFvFfwx230uyVUwXvwdkLhY7gx8zRJCp
	ouj3GZa/BKWDWyebbFkOfKFk9kQT83BaSdI8X474QiZQDRCbx/Kk5XIjJiYVfro9
	X5cy3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtmuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so984050eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458217; x=1795063017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
        b=AiWABSNDRYru1Ygziv7m0yKoDGPs5ZZ4uUJnROFmUEie0QM7VemPrTY3moEPglusCS
         Xw1VqJvZZtc4BZhCx/TFIhlR1psccvXgotle4i+vGeNYNi0/YMf/Eauuh7673cs2capP
         svfw5ZLMS1MAB9eODfetz8BryajUtyQHvHqsQipSXMqrVh3b+lK7MQVMxYdITmw0mIiz
         pE6lv9I2TfCDHJlXmKcJzzN5Vbl/qtDRq9jUf4+gDo479dHCY+Ag2JjFpISsm1DKZU7Q
         0LDdag+zLmwFMN67Ipyia0tbv5H3bwsWSc1ApxYqXGRVZZTRMrFXZ+U1tOSSs5eweBA+
         Mezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458217; x=1795063017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdPTSI1F/iSJVwr/1+LHG0Mawz+wkpy3MXahzotT/ig=;
        b=vA75pxTehXR12Biha0Efo3/6qgeOtFodPCdWaKYLvIFSd+AY46zW+Ko39PfG3elUtv
         46cQaX14WuCOvuRq8BngijF2WkjDi1avbkMG1Ig6h1bhPOOMQ9+v9dx9DCFPuJRd1i0n
         dxDFdhmr9bwoFRVjwtf9msJJ0Yhcl48G82tfhCqtwR0z3hEXEIKJmAsbrG35Nqu56EMH
         4ZR/YByrIMv+pZPG1WvIfm0B6Avp4uws5gINqDrjQ5lZrZdILG60XH+5SWFjQyWqy2tg
         b21Zkbet/ealfQuS2RhhpGzuQN9A/eyW9S13TSfk3OQ6H5XJvseJKspNZkfJRJqsyWi4
         qfpQ==
X-Forwarded-Encrypted: i=1; AL+hErFBPat66eVtbmdcoHom7OYDE6tOq7R1kFMmlTppLYiWgS/xqnhCEhuBZEEeHs9Ihz7qO0s5WrBR0nQcFXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N3M/ykjSggD3z0wyXtEPZaVaGQci7nIlNFDt17ACyqxbOv+8G
	xuFWPTUF0fcmrL8v9jgeK7vvJbMEGaPZYrEYkZOCXYBtRJE3DDfr34nWScYg/Br/yjVEe0tEqeo
	pp0EJ25DFDWCumsjeICM/EtJQ2XMSJUJwL+9pNirqjP2f6VJjUm3nLQYy1ygE/ttFr7Y=
X-Gm-Gg: AYBFou10hjpn8PpfU7fSmVZAXg0kTRfNwRfbc87qeUuugHR7Y4alXrxx9m3BMcsPmLz
	twluCjSlt7iVn7oEi9xwq0tIr/tFadS2nCh9zuU5+I4A+JA92lW8Db9mWfE4QTkeF0U8cH1VIL6
	iQnRWSsuBY5FJGWD4xQli5Sfe0rJ9PmZh29B0WVbEkfVu1N5Rca2UxzEQ/LWdW/qEHkEOS6yE2w
	l9kCMg4WWJJ2LG8vPq1E6EZBcaNcwMAuTqtIF9GhhUFkdqDprMKndLlLZJZykHAAzXxV4MYYlCj
	caOcpcmKnIiT5pSc16O2rIO2PcSIl5U3Rx6owx5yIuAC3XCokzo8Eep1co1s1TyATQY4vdx30et
	5687ivOGahZIwQAuOhnVWBCJdQZwAVn5T0Ga5PvWkVtuEAKIU5bt+hxHmdDjMvR+jjN+nF69lgc
	sLGD3wZWbgRisggzahPmX6Hb3yRuGirLmeJttIHVgt90w2lwWZTxF4LxopQLtI8ydPRRWBGBGAs
	1JEjxk=
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1158212eec.14.1794458216232;
        Wed, 11 Nov 2026 20:36:56 -0800 (PST)
X-Received: by 2002:a05:693c:2582:b0:378:314:4042 with SMTP id 5a478bee46e88-37803144bbdmr1158191eec.14.1794458215674;
        Wed, 11 Nov 2026 20:36:55 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:55 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:26 +0530
Subject: [PATCH v9 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
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
Message-Id: <20261112-08-dts-v9-7-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: OEITd59_Za7H9a9kKrVXUuspTnigmevC
X-Proofpoint-ORIG-GUID: OEITd59_Za7H9a9kKrVXUuspTnigmevC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXyk7+0L96GUeW
 t3S6/XQZnAmgrl1+eB3FpfUUHtoY9HKRE3OH2dlqfnxofX09VFAQMX+Zy9jzqk/AMDV1lvy75mI
 RcvYLLyrJCbFCryuODBW9OXaKWdpw44QOMQmoDz/MS/uzm9cADLEoCANdc55CTy5REazWpvtIMf
 2cRoBOI7jPCO8KMuooC9BwN2KmcjU0SeS5CQbiVcAVSa5P/ofRGkR0wdIxdMFDHBPJRwQbOujLQ
 EV9wuZ1RPqfGvt+KI87eip4HqcwaBCN8Yu77ql+nWpJvsjSgSksA9R3qyTSmqT9BQ4iZdtnMofB
 PXOqSfCPRacV/Lh/LZTU/jLbrxu72ps/NriKmMiZzjGiA/wkWqOtbSKmNu/QfcPGMmrNnUfS9q/
 8zBSr6coKDs1FdMgvqnr6c++TS8FNGU4BS+hrbwhdyv+lIjmrIgBP8i1yyeiWiDoAD22uQDVyAZ
 odCJI1axyPFaBcc6lgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX2r0dhTmNVhX0
 oPBOR/YDfm5DPuzReZVJyRODCQt+hBUuvDV/wvPFfySXvFXQ34iNI/xdS7qlBs4/jZTnqrKMzCj
 00sSDoUKjA2XeOp4F/YSHlEmkPQjcOk=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af54269 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 267255d2980a..aa1045f20ed2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -121,6 +121,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -425,6 +426,11 @@ tcsr_mutex: hwlock@1905000 {
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

