Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5606D4EF145
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974003; cv=none; b=rlL1t71VijzB8ciKB+XrTGc7rlSPtClSaXG+qQ6A2/Ch4Vr6ky3KPHUDZlK2ghTXNpusvm55HmFsj3Rro9x/PiwRFeNTM10rqrGQ7wJQP0qkupiZ/iyF+rUJi9Gh8n/rMQKSp9f62P6swQdgMCc6CGYBOZnfue/79ZREws5usUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974003; c=relaxed/simple;
	bh=E1utwtM+9xfu0wAoL5Jq4kOxv3d1O4mZd1NbXefGSFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnCEUhcrbqDQ/nLQcKClEnYor53mP0TcrLPV6r3MytWY/t1LSOCZR82dfoweVclVJFiRHnZRcz3jsOQCxy7999U8OT3ebABmGeq2lcVo0y/a+SmxzodKzXMi4c6H2VyNLJ2KwG5UtkXfHdDl+35wxiIxE8Dlo6cpdosELWQH3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkaYTqjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaH7fnTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkaYTqjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaH7fnTW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAC2P6806986
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=; b=SkaYTqjIl6Om7vOQ
	NLzCNbn41+EewaNfS5dhpQpG+3TFm7+Ta7BdZyQwOpZBAomnBAOPphEL8qDZqd/n
	/ws3qVBBtQA6Eer+DTZ8TKAQrCkl7vF349bXv92hBb1vXmvr9ta/1gEyx9mJenq6
	Y6/6xXZWV9rG9IYYRDclgUGPa97rHKrRAl9DSKAohrnqjCDVI4/aEBOpL610bLt5
	OfE7QCC2n4AJS0MHL55IwyN+XHGxMAhoI3hcx5Th7ulZf4luCGy9s1yUoPoxb/HK
	ZDgF/n6GAWchhB/jiOrXsjlGomAKd0q/6Uq1SYWBeZATnTCJCnlFPAsmvYAJAc2n
	mTgYtA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6b074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:33:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1484691a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974000; x=1792578800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=;
        b=PaH7fnTWLNNzRMY9v7YwlTzaTfhxY9dBy4kM5AvG4iQClztMDFmY9u9xBc3Rlsli+L
         HU14YrlGrjepnEFpoGePwFOqlX950W79+BH/leZ2KL5L/5Cc/e5ekVx7qb4qhwwU+lq8
         9VZS90m4hjETlQrHpkX+OcI2AwDYpQvFcAvjeKMSfapt80UjjS9KOVRwoCrJltfvCRHs
         IaNki1LxW7nQW2Tde4hQ+RmqwqxMuye44mdNdVCTCy89sP/94ZL2cBykCGjBy0f9ZUiM
         p/1a1wf/6c/IL5Vv5ceiV8bBYBgRT5EY23HaFtqF9hTpnrvqDEohirWEzYiYLK3R6q7/
         ArzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974000; x=1792578800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtr2Vz505wIMdoHQaprWux0Mkt+8M6LC83n2xZdQ1mY=;
        b=PsIwr6Md2nLxex+zvWsGlDuTYi56+HaLvBfvnfe9+GjyKncjss00H+uTDiWqmDEV61
         UrUjCV4miWVJG10802/X1uW5yh+WCjZOVx/92+9B7CFRYkeSwxuFJufnJWWaNgCtgchn
         ZwuHG5xf6Y/N4nT6iI43qUabadIcVN2FGvX3oBdgIyjHa98VQVZykWpSnYz/RXYD9P3y
         grUoBDqeWj3ry6UV1xGznhzzluWPOM00oHb4doQqbQKaPB4SzRQcyHWvqmG5fEl8eBW6
         333tdIcoX6aVe+wUKgdAXtWShgQOOFLDrCyEaDWvTyMhgcd8cFGqz6I14V9xVpnwjWHK
         vKSA==
X-Forwarded-Encrypted: i=1; AKwUvBwZTfuCCBK3mPz9AimqlfInIh2hk4anF0+0h+YivAvnjie7tkgxXjq55gBbYwYdWTZULNKf7PmJgXDwEXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIuOOXMdxpYJ0+KGwKvNEXzJH/pXMR99K1spi3jN0xYpLhMH9i
	ZVszQliPIyegkT/Jggby5Oc9M5N6/MQosNqxpROFd7oH4+VmhiJ7V1td8uJSKlo+YhNsxYHGBeJ
	RlP7eCVN+B+Vuiunq/vKhqd2HdfLBEXBPE1W8s8MLY3Dzg5N0nvKBOydElAT+jREZmmg=
X-Gm-Gg: AYBFou2dasBzHt9fNYp+YbKhJnTHb6UmsdF3yRKfNRRhFQa6/UGDl4DU7xntqlKdbEK
	NJnOnTZsc8ZYrQAra6hhOlGf+a3WwNY6W2k/pk/FMEjVSmzD5f+qawX/4oJxh8OdN+oPb2SlJ7B
	brY1aj3px2bpq5i6cTIuM/uUQ2IS56haWa8oMVMm870ARf5u+TnV65MtbbohTJUMmA/WexLEhEf
	Jq1LZN1VJmXVV1wxHhZfQX/XtMcDu2ed6GQL2V6xdDGEbCdZeg+2BPKjDrZwYIlu+idiM4zQrH4
	rmkZ+cgvh/m65u26Cn8DOsi7UggHreAf1Z234Y0sOv2jRamDHCdkwjGf1ukTLwv8g+1Yh8OejpM
	4Jpk/TS4lk/Uuqf9FYrw=
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr15128414637.43.1791973999839;
        Wed, 14 Oct 2026 03:33:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:258a:b0:3e1:2632:ead1 with SMTP id adf61e73a8af0-3e16be9393fmr15128388637.43.1791973999368;
        Wed, 14 Oct 2026 03:33:19 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:18 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:01:58 +0530
Subject: [PATCH v2 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=1096;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=CUxmQUD/PG7wnt1bvBU26lSkBk6rZQggZHbUKFVLQ/o=;
 b=fqdRgIjmzsA9rrqONBMMoHbp1KjDDuQya/5/10u/pKDYBqm1/sZ3UpKNUEXOlN51eWuhCox16
 fEESa7MokZfD3GzocXTchjBs9wmm4OosNHk+Rx3+lmNwsNO/pHuXN0S
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: r-rnJ9U-5kNCv-b9ed-bXnQiHFuQky2X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX1/JhGQUGiDsR
 3jbMHgXQGW0vudtFBMJLdpdWND530BGTySdca4jgWxQdcnShtJazDtf8nsFDPv0hxBSzNSemZG4
 Bwl5O0ArwHgfqvdgSWI819syIM5/ZYk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXwE4w/3J70caw
 DysMy+h+6VGomnsv2+Lpt/Qx8omB9PbqkRFOW6wN4tg79EeUC5VNT8uegJyT2Ki3T6Ra9tm7JSU
 6n8GpaUP3UxhiNJXLp5ZRbLgNTIIVsGiqAv9T5Gggs1FnjUyoAxr2WUf9gcRAZ4P1YS1oOl62Pl
 Jjdby1Dj0DGSxfSZNWzmbAjm1oslgyQSCYoICwz7cKa0c+xR8T0AUXc4VjutxEfOy5dMocFm/rO
 mM9GXR9nJHSz2WnPC2XeJXGsUKezJd5Q8r9no6tfxCQf6yhmFKU5DdV63xpuHmUY8J6HKn4bolr
 drLnYoUH70uTa/sj3AIZUBrLdYtW2Ln4HyunCth/eCC3cdOr2rOj+TiaShtJhVY7H/Jr+aPAwd0
 WuFvY4d/kPyoNm5alCkPuk2RfQ/kCtTr1+5T4nm9dlNjjnsFoOtdH7G6UYfmZKjJ7qWto2x3Hlv
 7E70uSHJsLEug1vhzBw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf5a70 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fs3tcOIB28yc_fyh2y0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: r-rnJ9U-5kNCv-b9ed-bXnQiHFuQky2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

