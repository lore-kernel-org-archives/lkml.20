Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284926;
	b=j8QI4XbX2VhRDI8nP+M6NrZx3sYgFQmqDWIA+e1sksWsQHzG704zd5mQHacFR/Tr2UlL
	 ObkaVC29wEwWpsHtQpjHeZeZgDbajc0ig61J/d7lvCXvLCegTqOLvlLNGquBfODD1Rogg
	 fXt3d50Dlkf74tJtMYy4J6wBppFySbjxzXrNEWdSJxCDeWwWeNFFTJjWR0gcDGalnPbpf
	 aUrVoKDB6+Q58sUJkX57FWF3f9K4au2KZn/H6mLoPjgTynzTKeWqcAgNMXg0rxP70S9uf
	 qrvWABx3CbHx2c0LJf4SP5sXbO8AknCEh2liIJuQQZw2QlB5me7+JbPM1lZxWBTolRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
	b=r/kug5bjWOioUmhxgw5R5OK4HdtJcHBdU9Fd1aQw4jPpxrK9APwt9Ocuu+5q3/gqgtGW
	 52VgOvkDFq8z59FFzT1dFc3qjlysLdJmqz/M0S4cttSoTvzbYYih0LHjvq7kn9VWMsSDo
	 SU4IeNZhsR1NG63jUUDnp6VRv6qpmRrsEKnO9Nb6qfFjeSirriuh+S+ZRio97qdp/0wtj
	 7OzioFm+q7G8ePkCUu91XVV4kanJiKGGhEkG8fhZY4gAXeVDboJidUgXHPaJ64EqTnGEM
	 vmMe5AWxgFyJdyVhXEBK7aEOd0mj/0BXn5nSYjdjyL4J6HfKo8eGipUvZ4ZcDQJwqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ne6kKYZk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CO+mK/Yh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A59606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ne6kKYZk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+mK/Yh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDarSK791695
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e8t5Xq9tCKUo9Qzu4LPifk
	PJjmKDzJOtBLM/fPK1Urg=; b=ne6kKYZkf6lbtSRyfU2iZImCOOIK3M/HA7Nf6d
	fx/zGjGG5Dc04Ph+A52K9kIIrFi99nJH6MASEGwgoMsIu9PKL5L47NlakJS4wwM5
	Z2Je8KFDZ8elH9kDuZIHdO26BfIXuD6592EgffarG0/DXclnlgPYquy2FiiDW4Et
	+RsmWyi7FQu1PkZdtJlmU7SphT8ErjOzKrLeGS/0wWXgjIn6kgLuCAzYHcwSuE+e
	tBf6a/FmLHWKl3aSYaarEPOd8Pm/Ib1scvut8686yaQ6YnQWPTySgz8anmbM+RPu
	ZnO9tq0AVuABuqhTjyuwGf20u5dIs+WneAjJt3K5+3jx1Nxw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76cg95x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:42:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso2817088a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793284923; x=1793889723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
        b=CO+mK/Yh8z/jRm3PeFsqk3VvQ/xwUlFt7oVYjySgohwiytFmOaXSL59pwY3nr4z+LM
         zn9vLoAGmlGB+Br4o+72/R33OHHUxFoyj/ay7OAs/1HMr+2usPq4UqvZQ89no2F3hDy0
         bJmc4w2HYd7WIMPdsCbBaTROjZq4yNptS+gbddbJVYzOSNc4hEY2tzGNmScHbocpprLl
         k7bGiFvyq2TSvfa0TE38JWvZdXvAFw/9W6aNTgQZCPgDoHHGKnTiWKeCbK0JggDetWbY
         +B0ysxV5u/lZw8WsSRusFt5/Ptk0gyumjUuLGMGqg9l06Q/bnf0ArSo/AEQtqB5BDXIH
         Msnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284923; x=1793889723;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e8t5Xq9tCKUo9Qzu4LPifkPJjmKDzJOtBLM/fPK1Urg=;
        b=MSE8fYUIlJquZn6FAohbs0VrXbmJaVcqmt5bJMRfczvuqkZ2hgd68fUD9mXKKMTo1M
         ZidD1drSFjGFlKvN76Wt1m9a1DRxtszaUhc3RGWBdM3HR1ivjXwylgjLt4YSlZWtuPQU
         oDQ8w6pYH07gVpeRFitH9NlXQN64ZXqGZhUlaFo/Fu/X+EhUPZU5xWt0VoXq95WUmc5j
         xSHY9Tqb5oqCd6kWU/oID1jLnakhOeSwp2xH2xvxiLTTc+WZDi3uCT4Y8z0j8Gd2oJmt
         JyldekH8h/s5n1dcDFGgkGbiYNq1XvMtngiF1qaUCpCF2oCmoVUBvIXU3631hCZNQ8gZ
         JSXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHqB+T3Wifpv1Tvi+fVXND1gE2vd6VLFA6z47mPuR4jDQhGTeFQEUvHhJIPeYUfg2bMUdtMfbw6wFDI44=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQKdlLWlgzx7UcsfqmjAfYNJC8jBKME8cWjycDWdzaetjrVx5N
	jf/+GArHqoc4WTIrYm6A4rO3cUIlHVkqYA/GwzgobaPt1t2jDh00wAnjEx7g3cNzaikv6nnoHbX
	OUPsAh/FzgJpyoSy43Z/0wwW0mNcZnhCRRnJ/AjEOTK94bS3FHeryUugHFbjc9PBxSsE=
X-Gm-Gg: AYBFou1m9GutIL70HD/lKzd2J1U29SXYT5+Q7STaNnXv41y/RFGdEfmsjzoNfyOgFTn
	NpoaElpFCzBPufpZmcH8zqTFy2L+ls8h22b6jQsEvLBuSHdnYzhunD0+20FoPZu+bEABjcVKgtl
	wdiVTAMIo33BhXydORF+pMGwiwfYOstv1YOKJ2lfeEHcS9MLP+lROycq7fxwzIrjRL+4bim/09v
	d3rsnWZT6chU9MBL/QE3rzMyrD8Vbh3cxU62N0oB2imVN9dkP0Dc4+HMXDvTkocya+540ud6Len
	xXL8YJ8mY7KL1FMC2n6liZeG1NiS+6wq/iLHY1GZmm9xLk4VOoS0IBc6ediCLmXnEFLBQFwJg/P
	E/xAcwjV9jWxmLdtLEvB7NUhOfCeOoWWNC8GnTkj+GZPemqxUcLP/rcJct52H38GDA34R9f91+r
	bfILN/k5M=
X-Received: by 2002:a17:90b:5404:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae57f629eemr4725559a91.16.1793284923020;
        Thu, 29 Oct 2026 07:42:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5404:b0:3ad:6090:a183 with SMTP id 98e67ed59e1d1-3ae57f629eemr4725539a91.16.1793284922659;
        Thu, 29 Oct 2026 07:42:02 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccde306sm5444510a12.30.2026.10.29.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:42:01 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 20:11:45 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Fix iommu stream ID masks for
 CDSP compute CBs
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
Message-Id: <20261029-sm8750-fix-sid-masks-v1-1-5ed50a1a0342@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAChb42oC/x2MSQqAMAwAvyI5G6h1ifoV8VA1ahAXGhBB+neLx
 4GZeUHZCyu0yQueb1E5jwhZmsC4umNhlCkyWGOrzNgGda+pNDjLgyoT7k43xdkSFTRUuRsIYnp
 5jsK/7foQPiAYNIlmAAAA
X-Change-ID: 20261029-sm8750-fix-sid-masks-f27747b63ab7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793284916; l=1494;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=h07EQK/xjhAXyzeFzx54Qn5dbimvAn0bx8lbX7X9MlU=;
 b=9m1at5bw4yfQfYCvWAgQQvecRPHuKtU/OdE1RDwj4J1gR+uHAd5f7du/+bEmobNS36WKi1bfK
 AdvIlK5154fD4aGI16+zrs57MbjXIy+Ysa8PhGTuDIhKUAlGl5MKPQj
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-ORIG-GUID: kQJvDzCqRNEJBvTKEnKw01YNLynlglz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1NyBTYWx0ZWRfXy1kMtfhCVvLY
 rMYLV1AHVG+9bfEot7pwGRi4SPuj3oiPR5Kfm1NKOhyQt68sm1NzrwiBu2kZyom+3ig/Mc3a780
 D6Lwq517IkeB8k4f5B0j/OYPW1XnXEJ5McHqpFM4G5gI55NaOrrMgoQo6OYv1seJm7Rc/FoB0yY
 fLlXg2U23Lg+gbdi5kjUElB0bGFgP/UITAmC74QvBR6AxwF/fZWNNYnNZuTPkPakW8njOJ35Jw/
 CYHvYQAuggwkpBrvFVd+/NxLmcw772Ls/I8sFLiFMMcVT5eyzNFQqoE4Hn2wP20dhU6nmcgAdX8
 +3EIknuoWRhlnCc1FPte4gOglhYxQ+TdUZil0/lmIGK1hCTFHxb7JprARH9+HlEGh13DnP/Ca49
 Zy3yCBUMJlc37Lu1F4st2x+YSNfGaGnpkTd1FMFbeZwtPaBE1ToQ9kQj51FBQUd62bKXM0AYFGt
 PA7D1NER/0ufo5auFjg==
X-Proofpoint-GUID: kQJvDzCqRNEJBvTKEnKw01YNLynlglz0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1NyBTYWx0ZWRfX9tTI692vhIKl
 QJNiubSJdKuwz8n1oN5MuERrLMNPT458wD6fMsbQgp2jVUnm1RSOvNuKfwFApfHvUm1z1lZOtPu
 aEc5neJdArw1dF5+vAIDejjxV7v2u2M=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae35b3c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t4KJ5oeoZsrh8uawLdoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290057

The stream ID masks of compute-cb@12 and compute-cb@14 are wrong, so
these two context banks fail to probe.

Fix the masks:
 - compute-cb@12: SID 0x0c2c, mask 0x20 -> 0x0
 - compute-cb@14: SID 0x0c0e, mask 0x20 -> 0x40

Fixes: 58471055ae76 ("arm64: dts: qcom: sm8750: Add CDSP")
Cc: stable@vger.kernel.org
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..de9d9bf3ca4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6497,7 +6497,7 @@ compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <12>;
 						iommus = <&apps_smmu 0x196c 0x0>,
-							 <&apps_smmu 0x0c2c 0x20>,
+							 <&apps_smmu 0x0c2c 0x0>,
 							 <&apps_smmu 0x0c0c 0x40>,
 							 <&apps_smmu 0x19cc 0x0>;
 						dma-coherent;
@@ -6518,7 +6518,7 @@ compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <14>;
 						iommus = <&apps_smmu 0x196e 0x0>,
-							 <&apps_smmu 0x0c0e 0x20>,
+							 <&apps_smmu 0x0c0e 0x40>,
 							 <&apps_smmu 0x19ce 0x0>;
 						dma-coherent;
 					};

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261029-sm8750-fix-sid-masks-f27747b63ab7

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

