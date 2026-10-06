Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1338731E823
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285276; cv=none; b=V40BQEkszDLKocuPPGZU/K8m/YPeY3+QONIDC+YSQ6RSUe6kU2WMN9GRXuNKnHcrVChW5eh9dS0uOyGKBq9evP2PPAi9Vz6bYcxCe7Br8AXhFUajh2Hb74f+4K+yaWQVngR8nuOJkK0S5rzKKH94sStcYp5Oc7t+SxuM4jcvZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285276; c=relaxed/simple;
	bh=LeILGxNNuCl3rvco85tFddCKh+xq0b8htprcmhQk6dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOexAS5J9w2Bdrb478ogOw6mhUz+SEY7UyCg/PzoxeyCdWc+nMC60VP2QNsOelWeEFasRSpQQa/fxORmdVgseLKk/Oo2KNsXE7ZeI/jYOQXc3qn8wblDe5AXum8S1PotqSXI42zc7LB95vDy6OKTKEtZ/F8edAfB8Seec1ahqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncV56PEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bULSy98H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncV56PEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bULSy98H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARK1u208977
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=; b=ncV56PEX6kTClBYV
	uN3pXCl5Dwl/yovMwAygsy0jZdiudx6QM57MzAwFL1DfbScAczMjOy3HjTtxEitq
	GxCEtzTt+B3JIJvNSjFP4vgDfBRMXAYTBTaGKhqcBWAg6BSSDe+BzSRjclf3lop4
	2gxy1TJwTREQjcLQGbcBlYYhhRQVRM3KibI9XXAlGMGxamt4mXeW4nHwUKsxlNPc
	2oDZLfq9Zbdecfk4iAtZQW93u3+Bqao8seJvtHzv12Sv1q3VqJaQXFpw201pM2jZ
	ZXQ2zu3mxzK+2tN46ptclrVxUh1XouxLfci96z8qIe43sTd3OzgYK0aCh3ydM7vt
	Sav65A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdu8b96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:14:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so2177636a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285273; x=1791890073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=;
        b=bULSy98HeTeSYqUp5EXz6UcKAsxBLJuXJpwBtSM4U8H3g1GH5DtAMH3RirB3u2IGr8
         V+7Mi115J42NJe7NO3qPwM8wNRLglS4Cu6dGtXbSHKZE5VTn/xhdhpCH5pvHQY5A6437
         EAqMMtMwV/4NDOyZcxHxrFnNMdDCXMasq2tSvL1dxnCxr+wVSRsik5c4byTHBMqDYDYd
         IVi3KzY9OA7Afw2zxNA59Nve8K0U56kGzLSbYyuhSkv7ts6INfPO5m8zujjh+jv0gktx
         wj3kvc865Or/ti1ElHVHGkx8o2JeFAUWPYu0+L8r73cdDCnmMfEuEN5fJf6QvmFNY/S6
         4Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285273; x=1791890073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz/E96rURgpnPo6SCBCEY366VCla2pYAF++Upmd9DCU=;
        b=TwimJX/9nbovYoASRfXNv86NZHLtWBwyHXk3g7f/7k9/tIINWE6K5O4sJe/ANJg+GT
         lUBzV8Hri4qD9NCAeEgD/oMKsuI22n3SC8J/0i+iLoS/n49lALJq6fw+2vdWUYqCYt1v
         Z70zidEOLJYPmmc/2GOPp5MLgkOiLJPVDDE2IvWehuLxdJrjkIzX1j+CL5Fe0WI8g4Fq
         rsuprU5yFPBL1m9+Z1QzN4juJYtSwbB17Xhv/JE/3hgYn1DPWv0w9EjhC+A76tSWUzPR
         6LS8Wu7OrzrgEJMNXzdjPYVBWlmjBASiv8HX8KI7bxp1XxuITEt/lbYgpAn5XKqh8mLB
         nAZg==
X-Forwarded-Encrypted: i=1; AKwUvBzSTpNdikZROejo70Z+t4Gg+VMvjI2bYpnqELYO5g1ht+R+FE57L4iqhFKgfD6my9SsfKofBovEo+R2FNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2YHwa7r59TvSwBrsoSbXWdSplhf/7xOcwPW1j+h/IsrXsGumY
	f0ovZqLjXWeLDMseynjEdmt2oo9tmoiK6SZRDT1XfMoM26TdF6NBsoU+qKCCtROPG/r/SGLmQ0Y
	Mu1X8Lb2cELG1KqCmVGjOshOoexC+sHPg0Uvl0S/PijhDXgZDfp9qh33EvdfL7d9bYsA=
X-Gm-Gg: AYBFou0XwRg3Evo5rO1vaBD+2FSA7OZ9zcFebgq1vlLmHY19LT2F84YOkctrSfBEjKX
	dK7Nfho8D/r4k+VoGT0NFw+evLTe14aiD9ufPU1vzwMNMdd1D4FZo81aBAMrI3XU1h2QwIiNtJE
	4oLs3FXV2/fK4o+pEfPP18GzrHFbLhQfozU3k8E1Lgk3Wbmvi66EfMyVRw29AqYO7jzmTvjZBtd
	SPktdpPH49BS86GQkVzwjxvFQBTINY9+oXcqFya7BggFgOK62arqMXsgeFsGtoWK0omJGP1fy1H
	zBJhJVvqhp5kN80B4ev7X2UMug2FGEqmrtely35apCB2jYwH7KeB1yZtXOFRQMHa3+Me8OWjzQZ
	vIKOrEHRmG1s+mbTstB5u7Z2fWVNjdOOACw==
X-Received: by 2002:a17:90b:2804:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a8719cf12dmr763515a91.0.1791285272888;
        Tue, 06 Oct 2026 04:14:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a8719cf12dmr763486a91.0.1791285272195;
        Tue, 06 Oct 2026 04:14:32 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:31 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:44:04 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-shikra_qce_fix-v1-2-8ac54d81edb4@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX1i1ObJM1AdKm
 3jCkOGi8mN4msiKMQ8HVGUfWEOqb+Q1prtujr6gJFCn/JM6eyfrJWIoi8zpsIZP56vttr3VefRF
 HhgbEsUbLaTo19tnKWkNt3aKPB2nE2s=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac4d819 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Oj_9Y9B9b6gWBUhzqToA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: meoTZuibP1JaT4O7Cyu08ijQomM5n3JP
X-Proofpoint-ORIG-GUID: meoTZuibP1JaT4O7Cyu08ijQomM5n3JP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX4yrmS/hmYnkP
 tgFfKnKizwXT/tp8qwSqvDzwsXrK+uV3TvM8YwnjehbrpuS8RWJAUBhV53usmXkPWfCQ9hT2A0L
 oxwUdTFhVxbPSowQvs3UAuxhjtTMyonSN3BYAWrww2R3EOYgyOSDe4vAb0Oi8TY/a19/SvjXXoN
 YWmiV75t5m1rVghCBSeRkiD/gFBsPalnRTqkUqOsKJij6ahOlijMFcTDU01dHUny0rFCjxjUQeD
 vzg9mroqnr8mvHAAVGyaEXC9R3bXcuOF9dMhcghwZhPwA5eOLJp3myYnGVswn6LxJCNOUfSVajQ
 TgfBHaGrziEpliabOJ4HqsoqTqZCWhRz07mDowe5HQsf/VcbzbQrr76FVPN9QSJu5HGGlQGR1SC
 KaRFkux5Zzlq6x4BfWHF755XaLm59+ZNgItT0dtaJiueA4kQVhkQ5/Twpk4dyM/b3iYIQWByyfG
 z+JQF3baWX+WwJi7WDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

Shikra is derived from Agatti and uses the same QCE integration.
Update the QCE node to match the underlying hardware implementation by
adjusting the fallback compatible and related properties, including
clocks and clock-names.

Since cryptobam is marked qcom,controlled-remotely, its clocks are
managed remotely and hence don't specify explicitly.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 205e70ce0748..b20e4ce13d08 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1266,7 +1266,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1277,9 +1277,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

