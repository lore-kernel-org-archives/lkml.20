Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746209;
	b=FIXDS1xK8sdmlWU/2ScmciXC/D1jSklTpssj3J6y66x6F5xr3xmhwUUZw7fdv4rftkVZ
	 926RN2SpdA01GOUHrJpJP6WGDykASI6WDAmNET8CcnIjDJl273iWiunN7c6uJepA4DcaC
	 uXLWOgZdAnkt+3pX+1sdv3y7HmM318ZZpzFklnAktkc0wlp0fWGMCWHWIJhgIxl2TW0BI
	 zFBkkhsNaBOSmMSowQHjWyKunr4g3BoFppm1vInBLXmmdPpDDPPLbNLs5ubYUGRiDoW7q
	 xUljCCmQWkaLIm82RQRSJP+KHQDkjqhsxI97iBpsWcUkt7mG2srxdPHdeLMIXDkIBNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
	b=GnAyQ01vxqZ5pVK6ZaA84tdVKSgFitpCwaKEmOuaqP1IunBITFrpXQaeM+/dQRQvmpMm
	 H6vZjIkJcFO9/pLt91p0r1beltumpmSMTpC37dttjgNvpLHy1F3Loi7gtU7B+8/TSmoae
	 uDDn61d80G/fkGUfJ5hvkkUxsjCf9glwpUYSO7Tu5hhaL/y87LqHwqgLMfn9Eh0g2xoCi
	 icIlPsOagk8UVaSmGhRHc0uieB7eU6q8W/ZkPXbvX2m1auzXd/pxZm4gNyrWq1np70Ce5
	 fuoVMp/tnoPa7RM2OYH9QSOGfmaXM3n3E95AesucRlWoidpp2YtoaQsCs4dpb2y8DtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOklABr0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J0JY/Z+X";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D37606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D37606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOklABr0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J0JY/Z+X
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FBIf2092808
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jadIZSIrpTy
	Ei91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=; b=XOklABr0j/NFfZ+wWinWrioG811
	NY0GoQIS8QewX95BcHrRB277F9Ls2y/Afkk0Mg59eD+Fxx3+sMbVgOi6JOYOMLGy
	vlXQ1/ApH8jdEP9uqfrr0rDuVokjbuTcVYPIZR0eyEmusNMsN0hdHHbouZys9poo
	jWI9YRxMhXKbgIH+crOstxic8+JjN+uNmuTyRMVjcR+9U+zWdVhoQ4xJ+v2jeVR6
	MBa/TldiHqT5G7Bv+9zFkB/uhyWp+z2qg5Z/IP1z49sHlO/cqw3CkH/QNiCkbess
	h5NWTppYX4dJGwufgeqOpHCzhvKYbrErJctBL2fRlsf6t/ix7gKTQLvHKtw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyga2qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so760765a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746207; x=1793351007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
        b=J0JY/Z+XgpQkPURL2WMJxKAHS+E1JN7uxRrUmB2LIU2zISihcfza+P2cixI6xN0N9q
         ProtUq2w1H4UrawORYZYF80oJmKedV+iqExuKMAekW5qcpRj4il/5FkqekWhUeyE8at3
         j/HY8J480zbr+rOdTheY0B44s5+PZVKjI8XFZefFLTDi4JPrsAvL0nO1dyTxn4vCgEmw
         w9Lpv+GTcaA8XbcutddtFGlBcrwc1qBL0yDoa4aOOfeApwSmQAPbi/Kfo+d7HphbgHNI
         kXYjCYRhTk4y4V/VDTfoLjqi2JQyFrJKywt54nt6LbrFwdVOcT+h57YyBbX7zgdWr0O8
         Zbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746207; x=1793351007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jadIZSIrpTyEi91i+IYQ4URvG2pbKwAmmA1d2i8PeOI=;
        b=fQapL3w9Zylq71Ni8GC+LHihLRtEL9IbGU2RcrQKFXLSa4GOaoGVnhc3JU5mCzD7/l
         87WA5Z6D4dhKBJHIwQVBaZeTxPdi4QYZA7oBU9vv5pxQiMTJi3piVxbhAR6pwx4/PUP8
         stcIyHsoP6r+Ysjl7uYas/rbuW9BZw25MJYRdbjCn122dLCE4wihakrNRG9btGvLsMlk
         DHn0QnBxw1mMe5UQdO1yEFs127E8UeBaC+OU4hosm1NjhOIRUn+w7kQAgnIcGeuT1oHv
         N619xyuFA2nyG5fWGkp5nQMN9DVlsWUwZNX6+LMnSh502k2IP39IFyvtWMqgHhkWZIYk
         jEdQ==
X-Forwarded-Encrypted: i=1; AKwUvByojUPsam0C57EuNsGIFNREAyxLYMSaC+UqLrOvll5QpCHcsJv8ZJbeIMog2wbPQJzxAyt6vs5dmVqlYSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdrxQLFW218qLshTcka+QiovqYksL15sWw54P1SCm3Sf1hElgt
	p8WcvBTNOiBcukYvE1WAcbL+lnZTOuEuqRkYFgephLinrAj8krR9qzwoI0XvgHNPCsj7tpzTRMB
	UjfNKsV/rYzqLrBadtLCg/tvQqwIzrLfIgJg05iY2/bQEN9sOaCBU+hosEaIm9HEn/7c=
X-Gm-Gg: AYBFou26DAszUK9RNzIzNMFfn0y5iNTF4qabAYs2bWoEGfQ8QeDbVZg4cl1ttFhTRy5
	so0QVOYD5r38tcaO1kBOwKFU97QbiRmDP0TF+YNuRo1hmEqvbBgz2Rj3qktHaUwCIAw3E0OqkPE
	QkwIQgy/agU4r07xqysu2SMmeFbJyJCVeP5yuCwdtNGYG2CnlLGlw1nh04oPNqaXIUryAOLFByp
	knCXzvwGXc1QMaKp7RKiF4TTeGfzECWl5Bzhz0GGTnUKdOVg3smRu7vgdk6W/VqumLQed41Koz4
	DgF0cYQG3xBLl1EDJlupsyJqVJIqh1sz2oNuxcLR0Zd3qFxZoLZIHS10L/xoTjEq82V6kmY1cDw
	TG6F0k1YVH5w84qhBETihPUZrTxXZh68Yjw==
X-Received: by 2002:a17:90b:1343:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3adcdfce5d8mr1244115a91.15.1792746207494;
        Fri, 23 Oct 2026 02:03:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3adcdfce5d8mr1244091a91.15.1792746206987;
        Fri, 23 Oct 2026 02:03:26 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:26 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: monaco: Remove FastRPC compute CB9 entry
Date: Fri, 23 Oct 2026 14:33:04 +0530
Message-Id: <20261023090308.2898683-3-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb22e0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tob_Kch83G3grsM8gxYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX7Kr0eQ1g4xl5
 m8He6tzeNv6NOVNlh0ldv1QpsqBMMWRoQingeBuWrNz5hnBG2rScrissAW6U/Xs9xLJ64RsN4fZ
 Esh5XGphYnNjKuUy0gZzvKsOejFwuN4=
X-Proofpoint-GUID: z393lsdJWv079zi9m9YNvPEBzFLX-9ya
X-Proofpoint-ORIG-GUID: z393lsdJWv079zi9m9YNvPEBzFLX-9ya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXysvuoYP/NDaA
 ALlA4oQ+6IAcmGIXQFWOJYdB5o9cpdMXVSGSPpjLK9Wnq8XXeRXUNrZ5YlzaN8EdAueFA297hOM
 HV0uE/HqEoruBLtvf+y1jDebAhiMJagb4lgE27uTQN9Euyuw1M9DGFq0yjiEcMtFYS4yatynZAB
 AuZGHDj3PlSOYQm0MQXkmuKdWdriuer2JU9+wRIfO+R4J49J3+rQ0C0HT4WeSHc8/LI8xRLcf9O
 rcDLjOy5+iXbFZjHv8TkOjCeLiJ/t1My+SQ0mjGVCgnxAuREst+ukvQukxM5uL+TFSlKfRNlnmb
 +4uIPW29ptQuXI65FV2LQeka5vfEqluOkxxPipqwbcHWMSbPKVTXzCOWHpQ42RS1NYl7l29X3Yh
 jbVly++q5wfGYcAHY1GQouedCh7adxx1BoxKc8DIvkcu+EV+LT3ux5ZaqcyOdwPK7VqTbzbkIh1
 dLPDLD8/50Av8LRs1HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Remove the compute-cb@9 nodes from Monaco device tree to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Fixes: af0d19ea5a31 ("arm64: dts: monaco: extend fastrpc compute cb")
Cc: stable@vger.kernel.org
Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..e73a735f2f13 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7822,13 +7822,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x19c9 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <0xb>;
-- 
2.34.1

