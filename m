Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F394D530DE5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071764; cv=none; b=jc60EtluHbe9/p+0qDQAXxbHdUnN0ECGQ1ElwD0LCk1N3W8SAXzMCQ6fMgdc1sUrWoOEKvLuuqMa9wm3ZAMFJY9gaQZjJoQnbOnhYbpWsihNxRcJwfuW+xqzwAxRHogBgjkzBNlV4z9aiX/IA0OCj68VZ6etFfPR4/5hfTiUzmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071764; c=relaxed/simple;
	bh=0No+ZacBX4HIzIYIMRa6vAD2lIVsiJ4dmaOWJP4PKjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdI5o2GurxIM4xBfKF0e3DjUxN7kxENCj80tx1G5AmuyG2wQc/fB5I50p/hwFiwcLiCZfTjpymJ3eWkvsQuOMGnzh2iQwt3bp/ItOMieoIzQVn1BRLc9Qky2uUsMSaxbe1x+eyjZztr4gVa+QkRgNE+XQOakrMkSchL3f05x3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUgaFVLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T93NpcrG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUgaFVLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T93NpcrG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8egx93675281
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4LRK8MN1wRj
	sdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=; b=RUgaFVLNG3w5RImqA1Y2NqDh8OC
	XYM7kGWaGDodxbAqqzvtNHnF3pLIbE5qp+9pnRgVjLbeOlnmeKbAYzYDNKa1gw/L
	mOd/Ih8dEkk/c6X0k1CPumPPSYpUKgIOxE/Jdz4N0kERZfOfOWUp5MV21eRAWZq/
	wr/WoNU1DX7JiXyuLyjfoFFiG1/jfTM0gbdPq27L1d1e7UKuAzczkoABlHQrO+zi
	+C6rV898OQi5r+gMBlr8ZrNSSNhpFzLgI5m0EBUuwaSoQ/oQfyZCBPa5o/NBSgN4
	3y0JqZ3lOAKoh4RZ2Zr6+UxGSiM6oXy6+smflhGHhgBICMowh3YHTa8ObGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5sm9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:09:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso4627840a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071755; x=1790676555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=T93NpcrGNvaf9ZRnAwwyqoc/Q0hEk8gGA9xXSPwNgmm3kWVuQdOmCuMGSQJj681y1r
         RdT+SqcZxrqtv41V0tOcRbW1EbJruQp3lDWZvIRTQfKcOnP2eHFS4AP5Ed9mR5JT8BfA
         wxIPngl3hi6KOTa/KfWagBojKGdCtuMc5/XYZhvjdcMVaJiIQ1LsESTn8IwZ+7Tq5o5C
         qxqPpNcdBfy1ngGKPccWSxpVxLFMMsQpkyKa6qqiApZE2CWjFx/ywcanbWUhNW+VWINV
         DOeSuOqCArRRHLfkd6tv3sLGn+y4K3FET989AjIgwbI4eisTmMHSwkYmMLxEC7NglFXp
         sKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071755; x=1790676555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LRK8MN1wRjsdtZjvI5LO7JovexxcJJzxK4hpdSkz4U=;
        b=DLR034ZtuslC/mNnVdyVtb8DI0/Qmj41w1W9QW2+RWU3ay3SSnsYqKqmsAF2sWF01+
         sv4KBUKIuOofZm1dOH+VGFoHhlqsCg2x5OeDT3G0XB16apz+EGyFBcIsFaFPsSMEbVJE
         9+WhD85yMmOiyCcBzzDvTkPfpgGwh/FBX+bP9pv9IHPEvrmxr3OcQC2fkQpokCs6lz1s
         cEDpdYoP5ZS9rLRpWD9jyM18iPv+VQKdxy0FJwx93RZ8MnkuhtyBHWMUMMNrFM6rzhvN
         p5w3iu7UZCfOBXCpjPIlddcaL/4swQW2yYLhvkfg3F0R0u83sOy6sX+xJQvkQJdDT+st
         aP3Q==
X-Forwarded-Encrypted: i=1; AKwUvByCY+JhKW99T70ZcfB5PrK+x6ZCyg0BSGxkx2ZAIR+xuexIHZC0lJ86IY45SQPaJIDn3fCdztX+5rIsERU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8UQl4vwa4JPFGKdYpfeKeIGb+++KbXj2+0pTmcEgYaADr1xXC
	O6qX7cSTS6GC0i0lTlkyjZe/UT5ingLNg/GRmHzinu1NZRcFgAbD48jnFJBoFCUNpPFHvcyKSU8
	c3DKUUgdwL6Sgg1VYbwyvEsKMttWtOpUhid4t51omqcZdQFDzVg+YmDZdq0ruo2dYUuU=
X-Gm-Gg: AYBFou00iuhmxdXNcC7ZBjKI/hR3TMmDPI+hW1BLelKBjMbjEAWy4EG0JuLEmZOvZqy
	2wEV3W/iqMZ85zuklhwBGJlK9njYOQJrEP7cdFM13oLV1ZcNZoICPu729Ixhs16k1A43Ybtz0bu
	xumZY1GzU1+ota8Rczp6uAZKTh6X5XH2sKBpKkc4Emut9F52Ae1iP7ZGmBOvUhL9NcX3ZOHUXTH
	Qull43BF428YgP416xHP4TLAw8XGoun/TAhg1CE2JAhpZZXLdlBelKL+CtxvLeDETx0PwGPDXP8
	xUmI1vtXNyDtR73PF08QRpVoIQ/QFw8Wky94PbPM3LgnUZdqgENlAo3rvcg6uLc4DNZxsoIg9LK
	BJ93ktVOfGC/mz1hMt1+ChiuyyTyd7uakFJ8lD4FKovsuyCLwoesOcILloyU=
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624673a91.39.1790071754463;
        Tue, 22 Sep 2026 03:09:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:39e:6a80:dda0 with SMTP id 98e67ed59e1d1-3a0731f957dmr624649a91.39.1790071753974;
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612c9ca7sm5121502eec.17.2026.09.22.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:09:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Tue, 22 Sep 2026 18:08:49 +0800
Message-ID: <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7s9TUARJLqag0qMKhDQuxG00Ls4EZzLS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX1Vip5akxPxgf
 pK/YYzZ8jqZ/DtRKqf+/vbH5UbSI+lazlRqumf4HosCVDUKD4ZgzLyL/8DWtvnI0uyl8mqkF7f6
 RLDZMiy5DXPt04ktaxGfLFJQ8J3Nou4=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab253cc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=co3ps9B5goeKVN-PGfEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7s9TUARJLqag0qMKhDQuxG00Ls4EZzLS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX7BBDaF/WpP3r
 WMHhf7JwKfytgaJhEk0Ywc/kLueV2vq1eo0eecBT7OMRzymrEsDlh36zI2UPoIv+xBKa5RFuYeA
 lMRXXPfEvmDkyN9mpZgRGK0pXugz58nwvr+6STeF4k/7B72jhgeCBM8tUFa4jRC3uGsBaPA2DV6
 p5D7+sAvrsk66piBUSLW+TtSTWa+I6ESjf5wp8+iBgsJo3tW5W04lif0x1afCFJWwllgZVhr7Xs
 /tYJhwsOKfiuQOA2v/J0NEE2nDCeN9u+6Ebe4ZwNsTHPCBiPqs37u1Un6q20PRsEwfID+sRFWkJ
 gn0PT556GSUDALi8ki+9Jj8syRCZJvzRZ4p+Uh+QDem9wiq9O2t63lV2lxVfG4UMa2c5WqRLIUr
 SRwXfs03pk06zqFjhasiuOjLnaxXVjGo4GBx2WyytEsAEzcOtzGIqd2dSQADMHaueNtx5GluEw0
 hSQCxnvJ8mNTZgMe0BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

