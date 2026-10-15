Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ACD3DDB18
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031899; cv=none; b=OHszXq4XwsmeHA14sVv0jtIiin4nL6ZCOJoqHwEch5JLR1ibqIvEZm+/nyw3KKcNclQrIwd/LIZ1M+wB8YQO7PutaqvO6CdAU9y/kKSG8QGl8EmGDjXfgJEss+I/4t4zCzJZRl4gnROubj0+NW0Z+JWgCcMTFP3WKuY/idLPhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031899; c=relaxed/simple;
	bh=lKYzb7YYdmJaKslKIzocK1cc57OjHmqCM5YXFY6yF/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GEtZbAvlI49QWJ2B0wopx8NtZKUJ3Rl8Djj+fylgzML0ZtXqTR4TMurHn3NyMvx6tynDJlqRkOIf/gR/KI1WOqafO1PA3RYXdFIDr0Bn1B/w0TaDKDy+X4avrLDGd+8rhYvzzu/uUw5PSP4Sr9acA+xlRBzzHYDlAJ1F3xRP7nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E39yf8UH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcSzohUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E39yf8UH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcSzohUq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2DmBY844398
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i48kfPQPbtV
	IbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=; b=E39yf8UHe/JtQ6fLxHa1LxT8502
	ab28QhLHoRCoezctIp1Ii4Rmq9IzO683T3aEWubLW6XWkM8yfordwfBBeaZZmFik
	BnmURSgujuN3C8/HMhIDtamnRyZ5hz3qo9hiYhQ2KItThRLq2t7uNTWYuV5mebso
	liqVqH6YVQHXKSxytq74hdQm7vARC7Y9cfr1dLbXXt2n0MRRtxA2Sge0KdfCANto
	sVIy1oWxYtDg03RqeyNIdf3+LvsCRDJ8U2tFZ68/ZL7P0JIdUC9MzmxQTTlRFk7P
	6Ssa40LYxeqOp8zCXosXhFv++lzuEbJaTD91OcEYC/u0J3eSQRMdERllH7Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wsqgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-152d1363a29so17354551c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031892; x=1792636692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=BcSzohUq1YP8dcp8+gKsKOb3PoEaaSdT7+pJdJ+uW2VMb9VxsqkUaE1+sl182Lbqy4
         X5dxWWuSdrYjN7geW8yUeA3g4PDNQ98ORnT+HMAWHl4S1D3qkYsb1TyROCzQpyTZfNnf
         F4tgcklbnzepMsMZW3+AOzOrgkQuxvTGHEN5Xs8AzAwxyiUqCyjmdSAUjgtkIymDDEJa
         5gRJNihkUGI+vcOp8nXXqIrjPMnwlxiELizFbuxWpfkjuGUvTRma5aYD3xeWucm+uDGY
         rRXUkXfSCZVqVx1Mt/dOwg2H8hjgNR6WffzMPv07j8jn2qBYaprdUXpP7X2biEV9cQTQ
         HkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031892; x=1792636692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i48kfPQPbtVIbL4fpRm0x8FXEQSrQZurIlrOJEcsoRM=;
        b=dWGYyXfYyHlErOXZQYw9RHiD2wjh8qbFcka25FaDMxXCFi1DAWNww97mnbyOyCzSnz
         cmhR0NKHckhM1suDsotfeC6JD7BuZjJE15jWhlcpsI4MriMOVANfk6X5pEI7gWKDTFLr
         ag3ucAgm3sx9gyvF3yf2AQ0bZopVsWCPsu/np3qc13y6fu3mMQMdIQFDMW16A1LD+BM0
         GD+oUDUGW1xg/5bEAJ6wkCt7by/HwjdN0jpykNHXKz02dq24geeEZ/dzwlVP6SHKyh6H
         7IegJPYNUoxPhRGgRIJwy0u08+ytI7CQz3eVUsab+tDjEG4Zll0LZsCR0pLM8dd94ztx
         irFA==
X-Forwarded-Encrypted: i=1; AKwUvBzffouc+dcbz/n1qY5xltIe12E03/tTNDTibnlAaLamCeJsP/ckt4q0WUW2bK3roMWVpRmVW/HkcS9eXR4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiFhOgNDNrvzLM9mbtcTAUaeja4/3wlywtwTduGvaxYepWHZRw
	d43GnHUboW0NAzfTaMhCIT9FGLiphQDIHuLub00yZPGZRkj0v/G+ofXmIR4FzZZeFwqweOcxoqu
	nsI1hb/b23h/IO9aNIzyYOfhLSQORtZqkcoo2QcdonLU2Zy2lJQFfiVpJBSUEzCSxOTU=
X-Gm-Gg: AYBFou0ZTzdt4vACNRr2PHSqFYUNEoh8GRYs0NP4GzZUw5FUtgsl3LZMRBH2+hElaZI
	nTKveU9KiCX1KNcVUS1tXk7vcoSXvx7omQlnCiTMX7bxzJwWPh5HE4TnjbktQBZmlX2V3uw6YmG
	/d45zKFkV8f9ENfYk0xhH48N932zz0pg7bw5kWC96F0Rm7GV5gHu/mCVz0spPdMZIT0qq6Owi7I
	wmR4qJdFCmPskymvhBp/D00rIgN5a5Pwd53/PBJFfygWeGr7aIZ6KcbNaV3QjDirg1u5cRSxluE
	cnRBuDumdmGtezwfCXZUGQaaSn1Fem2EW6RLGGJZzUNQuexO8dV5UEAn4QCrzbpc6YtTt3h1dMl
	L8SlSU26zC8iM90rq3pMVR9nypUK/pIR+k9koBheAA2HODN4d3CuFE5jYg54=
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547914c88.15.1792031891988;
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
X-Received: by 2002:a05:7022:b043:20b0:168:3243:c90c with SMTP id a92af1059eb24-17b74544aa7mr8547884c88.15.1792031891436;
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware and reserved-memory
Date: Thu, 15 Oct 2026 10:37:08 +0800
Message-ID: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX9yuP7VCV3eBe
 mouCpDeX8CQmAgN3cEg0gKLTaKRqsK8+XWjVnqYHFVaIj3RjXZg3Vo2ZtPuZbsE9nXArJny+qcD
 JPRj5woZn2Ctra5EgoRSr0d3izD8WZY=
X-Proofpoint-ORIG-GUID: tNtizyIeSXFE4Y8apCio79rRrPQrDAWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfXwDloDqkTdf/r
 QQosEPgHcay1ktWTHFa3jzvSOTw852F26WRYXGMTLdXAYhTI6+XCRh/OEu+hUSeDJJAkaXyoJNh
 vH+3wW8yB1TIg2HK4M8cNYoIJ30sMXRxfFt9kBuy1jKTD9MGID0a+ODEGHH5JpS9nn0HGYZE4I4
 eJN2gE450KzTHDA/AIW4wNuGS/Ye3c5ujVUHy2DuZQxQtbexgYVe5bgxWoGZDfEJGdZXXukW96v
 dD/HNkCRE6t4R3EUhS2qG7YtmctXy2Y2J8yYshC3Qu74tswbtAbWVTJ5yg+xpmC89GfkdiUpWYW
 0TgiT+ku1KfbaBMZM4BA5qRf3erjsShtqmNsaKyq8pzqW0my1qKlX5NRV/owTmu2YqLsLLf4ODq
 WN0+yjq+it+Lu7O39vpNknvh/zC0ecrw3Cu4Rf74tfMr/3/1gn9egXPZemQz/0QsU45/8bP1UUs
 xec0z42VUtnUjmMYxJg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad03c94 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=UXWPQYcWdAbVtZk0ZdwA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: tNtizyIeSXFE4Y8apCio79rRrPQrDAWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

Add label for firmware and reserved-memory node to make it easier for user
to override the default configuration.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 821c86409c5d..c71b1a48c383 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -276,7 +276,7 @@ eud_in: endpoint {
 		};
 	};
 
-	firmware {
+	firmware: firmware {
 		scm {
 			compatible = "qcom,scm-sa8775p", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
@@ -365,7 +365,7 @@ system_pd: power-domain-system {
 		};
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.43.0

