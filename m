Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819662;
	b=22wN7IHjEsTj6T4NNrRnazBnrKO9c8SJxPVzLHgHQdDaW0/3ISwvfMBi0ivw3zFXz8Rp
	 wP9Zd9WXyTXg8Ii1dZmhB2i8sgCZ58mSn3596qIKi2vjzsJNlUNOJLaVMJ4CI7Vgo/qKL
	 K4KYb38jSxVt4eCwl1o5KQtQ5cpUG3u2zNETcm47u56lh64A7fxaTD459Yei+sz8GDLG2
	 IM3qcKMrO534c1WbdFo7hs7yT9P+9u4Y6NZ3Uz2jGKEfjyxa09FOpJcVD153kHa8kq3i8
	 120VspXtZ4WNcUEvIarxmmq1EuxVYJX2dIUAA0fg3TpfBqOL5c2ZnYdRcavBvRwTUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
	b=wE9FyrGTMRO1TflOL5oR7efvCYXiimNiHq3g7/C9ZbTDRV1BjNOITxYXuf8awkcU3PW+
	 HtPVT9VTMebYN3vQc1w7Q7huzel3FAGdIkjEAbsJsj3K+WJF6voIjxfupt7hSUcd0w5mn
	 JmtYsOZSfOgyg2Jtzc6dLIOKytAJvsiq7LeglLDeAxP/L+7S1UAAR9hOQwgVpTiqUU+38
	 Z2qp9ld3avxetCWoiTVlD9+ux2d6u/PAV8ZZupbmvJiHeaRwzvQnOoRbL0pAB2XG4YkGd
	 Pg1LttDmFpYQx40f0ZJCvMhhQMAFrLp0UUehe/wFRxbSk7TErJFWBtV4k0qtRFmTDQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D579606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D579606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS+2W1yH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Syy5B9tl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7erfY903109
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=; b=iS+2W1yHU1a3LWo8
	j1Pzbonj3Gfof/aae8Ul9LPmYnCD4xJEJjKCwdfUNa4sMkQGKVqrmiHaN8kO81Sc
	7Xk4BIl+1B2zXj2nwaCngF1fzmiX3y32HhVH1mt1t8rxqPiGYZvl5EVBHTCHOdyW
	YfCtty0PhYPgkoTyQXpmOayOhyX7TXi9ifw9yqtkPTqOnX1D9A+zkXXHFGUqyYE2
	FcoGWwTBuiGDbAX0AWTxe0RUlh4Bd6qlBOGcPEN7BunJuz1aLRx4S4jtvl3EutrG
	Ymu59zxfyRpjhb6er82c/OshxYNRtolocF+8mdSs6k1neZYONmEq0qhmlSoc/1zO
	FoN5wg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjwqg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde080a93b6so179894a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819641; x=1795424441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=Syy5B9tllTn/0o1LAH09AYvSk2lXAu/DRCBfdZYDegWSI1V1UemfhIXxl+nIJ4sGgX
         encTz0JiHHX/q58ryBrLdG+S/boxYlXUBGmFfAzb5HJL7WoRx7bTs2zYMrjD+Oh5vEKs
         dKuQlwXMQOiC382f7DsfsJchRgJ54NORvJ4W8GcswEEK4X6Ny7OLbJr1RJdvgM+9FatP
         hg4RPmwOy3iEB3Cx8G8af6LlDBD5g9L0crRLuusIkOrDia8EBYTdRt7OvzZWXyX2oCH/
         E7u1tCDB3qYgFQ6XZyZeh632l/BgPqYUfXxA4+A3TRgpVzFd3CaClHAHcRf8fPP8kRXF
         NtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819641; x=1795424441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OULLp22aGXDMcQrmAmyZ12HUIraEW6K0uNHbN8KXWEw=;
        b=daWPorPKCqQMD6GNcurTL+0QsrRCU0uMA51NfyHBii8WE16x6wlITTJsuRyKHFYebC
         C5dkUT34i/JoMLNMyjGmdHm3qGtNOQOx/n3tRAcfb2zAQ6Zd5s9MBwzYBT2uSBY0f4Jx
         VcyJcBf/RhibX18hhYjD49aoZwOin1VeOpsuVxFsFp8+pF0BL1ki80mr9m/txK+4aQ01
         ih0PEHdXiQfINCOYyc5xXQCy5ndFyAL0D0WT2cNfO7xOv6AZSCDPf49Zk8Z19HB64FhD
         SHNOWYP8KzDLx+z4DAr2bszGuJ2OD4NLC0FW138zmd1iufuVcKO5ara1WrP+gpw9CH2b
         TRfQ==
X-Forwarded-Encrypted: i=1; AL+hErFsBnpnTOCse1br/w7ZykptI+dZoUojuWqcxrdEbTLF3gBr0YqaMO9dF13SvfhDdc+rIjhqYjGBqYysM/0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/71MWWiURrVSTy9XkGu+ENCclEbNzPb5ojGYrZaH1Q8BBO+Ap5
	l7/ILVmwhdrr3c4ZncX6IY+mKyUWrxwdGzD4QgXyJGy9W8CU7E6ZKW2FB3/nT/CBL5TE2RRvKIP
	SIjZ1pTbPPjob2bQlrKNiiEDCYvaq05E1pdyT/RnWGMRcjxWoEZMRdouObcCCrOzc2qQ=
X-Gm-Gg: AZFdTZdl11EpNQELkDzbEqFDI2Rp15Qma5GzsE2Fol06iMgKuvQPKRTjgyq2Nm+FEfW
	3Yz/Zqs7NLtDtBK+gaS1ads9IwZtq4fWqZTkBuLyQ3Zq6SvNPjcST/tO4+W29Wvmt64GEpAD0SX
	JWfGyqeh91k+hZpGsU8exSfkpOywY8phZxT1c29hRUA42yxOpwljP+GmVs6+V/m5DRFxvqgyVjJ
	HgbhwTHSVJUXNSY1KjUCtvVEUGSgDluElNr9sHchEwFTso11Lz/lW/4/Wo03Gk9Lic4BQ+DSZwV
	40fXDcBOHiwflDB6chxbk/3GvQl96nAOM5dvojYXbY5XVfLmSEYHfnkXubCgB/xwWB42zxWtIkS
	hEO+139t8iyoGwrO+KFTxR9SqJ0A3X6VJaxcGe5ENGBaJf0ALizz/OMAzahrVTmg5guMbay/Q0V
	Mj2b0lhXA=
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453716a91.43.1794819640753;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a17:90b:4c02:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b1b0da3e56mr6453665a91.43.1794819640060;
        Mon, 16 Nov 2026 01:00:40 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:39 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: crypto: Correct Shikra QCE compatible
 hierarchy
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
Message-Id: <20261116-shikra_qce_fix-v3-1-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX3/lUMOwpQ8Gn
 jdI6Vmmlgxuanv5wDQOSj395+1j+uL+vkcoqaY09n95t3+VOdLB7KiH62Vu1uNw2V8JZ/L24HeZ
 SDhaK1nn0BMBXYxk6k/EJTrKRogrHHwVvqEQGnmKgX1H/dqflkRFyc52JlRWAqsOEmJSv78BGsk
 lfChb19RaOeJPAqFUW1puBfPtL0RQqfd59cO4EVPe1BpzzyZ2H4lZX4XXU9iduZ6TyFUHBQapWX
 wlnOBUZiEKmDnWzWfkJeQC5mvgu31P+wPqQe+bZdMH/VqyAAGIH5NSk/NIgjkunvA5LjK9QdYuO
 1LJu+dxQWoP8u1DbACj57XKnIT43iHVYrFne1xVD1asMaWLaQuKWSsV4aRqXWBzXcSeX1Ufbh0F
 UC1Tmw3zL3nfIkGQ+pAlpjJKtuQCYsRfE962qgzyphtXpF5L6KvltNMm/7JNKrW1qStuOJ4CM9g
 3B9Znlksj04LKm1CRDg==
X-Proofpoint-ORIG-GUID: OF1v_ej8YQNIbrkkFPjfdyorrr8s3rW0
X-Proofpoint-GUID: OF1v_ej8YQNIbrkkFPjfdyorrr8s3rW0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX7T+EBj+me6jB
 hwtrDrLQN6W0HXl+EHHEsOdb70Qa+nzszAANiH0+YOfDrmZWUSRBVsfcZEuOcvvHQVoIsFs2KBl
 QeF0gG7sFSs1TsBt6w03h2hyCYKa5cc=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afac639 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BEl7XTdPtaVR2fHMDO0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035

Shikra QCE requires an explicit core clock, while the existing
"qcom,sm8150-qce" fallback allows the clock property to be omitted.

Shikra follows the same QCE clock requirements as QRB2210(agatti).
Update the Shikra fallback to "qcom,ipq4019-qce", which requires the
core clock to be specified.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

