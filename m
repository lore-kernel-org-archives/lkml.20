Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86B466B09
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363660; cv=none; b=trWpzTkQ1TSIFTLfmrkR7zJUvJonRAUtDD6DVK+Rsiew2D3zxzWdoUcGKebIh+dbj46mwd4+6ih/tB16aQJ0kZG/D7UuYKpF4YhBHHkHwMqxYCG21TQ06ZwROGEmYgZ1ODTqfyua9WkJ2ZzSnhx7IFBHpGMqYyBW7VIIp8N3Fsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363660; c=relaxed/simple;
	bh=TfE1HXDmuMQX5LOFZmUlH2YF3CEUyGNIm/P5CWo2OHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l/720hXbTl5+qTTpU/Fvmc6RWbsV9khFN5njsfsqsIA9ftidpKQrRzPZXsjeWaB5dR6xwKauri9yQf6XW5LCpx1BNsCsNIPg/ZITF87wy5pZ5/11oLlTM+ulyVORxj+MfQk4cS2Y2JtjZd/C2tK/i3rh1MVdWFP5o05/W+csm28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nssRJQLd reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nssRJQLd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jUJI1873371
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4NhWmEecye
	fJPvH2GfE/phtWfDyt95THJZwcognhfg=; b=nssRJQLd6T9/ev1KeguEz0/9p9j
	NshJw9FaeDC1vtKNwt+ztf/kIbgENyEabMP5q5dCwM/hIxSpl29NuRr5JWjP2JCJ
	4FeuG7yuJvKyXXzYHSXCFiBzx8qFMCHokO6cLVkOYK+6zWrcp1nJfrjiu3TowzG9
	MX+NDJw1CAiZDL3Vqa2WCbNiMcOJamMzcujAQ4/y9LIZFCWJEFnyPDParPetj88b
	+F7ElRtPcwgTZpSX0jweAo76TmH1A9wz0l0Wi9YQXA5vp9ArCnDVhWogI/KbaNYD
	/KELTE90T51lhPvd0j1wQyTE1sHJA/t9qzlWt8svx+q/sVgVK00TqvBxJKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rnbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:00:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc5f70c8dso422869185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363656; x=1791968456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4NhWmEecyefJPvH2GfE/phtWfDyt95THJZwcognhfg=;
        b=v+ydDsXX09f+iN89yNlic9MKOC7G8jYQchlyIDXai8U2Q0XbrESDfqp+O3ORwvawUK
         +ZheAkhEkZxgLSRceTzuVzr9d/yDI5S7EoLaMgsHfIL75vztJtBrs2N9LTNq+RYlUQRT
         gxzcioRwNnculqP8aQ5t14mLEpEF0IJ/turV9z91grjp64XJFqlGsjP87Kd+XUxRkjNR
         gFcYFK0qmIYI0+5E+ocACnU8Iu3t0kdlJ1zeK7+sIIa7qUgEo0Dvfs97jtcASMe/yBQA
         xSHJnxWatbZS+Rx99v7CNc8HfoVanPFRNuedPOh6RWRVmKDV+P67lnpMbWwNpdR32ld9
         cYvw==
X-Forwarded-Encrypted: i=1; AKwUvBy+1SmmtSbz6/KNkYAaAx5SC1325dsdIW2WlaHZOpumysKvZqxs5iMSl3foINSWetpEhhJ1d2CxHmnzB98=@vger.kernel.org
X-Gm-Message-State: AFuF++knz4pgLmhbU8d7w6dM9t9YXuDMFZhaNeh0pwoTV35DpSsWtCVK
	oBK/txvfLfa5e+CUcz0l0LgKN0gKZ/4tuilkKtnycfvpP7H6iGPWIFX2AaX00F6rJO+Aknecs5G
	Mk7zyOtOtnOh35LxjdXaM2OWLFTHdtWrZd9kBRR5OvlTRbtP7e7032FIUUTjCsPS8FZw=
X-Gm-Gg: AYBFou2AnScyxSXU6VjqVgkooR3OnTzIOOqTO80hcaUzu48VnU9Qw1UJQQxuZvKlUtS
	ukM6T0HaO5l1urSroSCAxDE30lUbOB1XGebnZ5QfumAajvqkMY6IdG+X4qyG1mEZZZKpN/lxCqb
	RAwVBEN/CdAbjmWCOmckLTEXfkF2pcZCNY4J3WhRzUeM/nJDg2EIbPIKwGymtImsePE73cp6mRU
	OPk/RLG0PXClttZ2pwgSp+zveU0fAfZ8KyBR8N2BtF85TYAF+3vbnsnkt2zvbX2YpNdG/u64JCa
	Lt/g5xayHEjei6tY9N1wLIDxyzRGUds51q1ZUDxdS7UgHGp9okpAoz5i1V4=
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302577385a.48.1791363655952;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
X-Received: by 2002:a05:620a:6845:b0:93e:7540:7a24 with SMTP id af79cd13be357-93e9b7c5622mr302570085a.48.1791363655311;
        Wed, 07 Oct 2026 02:00:55 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:54 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 02/45] dt-bindings: media: qcom,sm8250-camss: add pixel path variant
Date: Wed,  7 Oct 2026 11:59:58 +0300
Message-Id: <20261007090041.3732717-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/iuvu4wYMg1A
 aJ+xywB+0A+No8asXXgew+arw0+LF5IB6fL71uqzuZfLtEhpUExBzbCG8O1ll1Ki38UaBAXz1Rd
 6NQupjKffA5o546Jo2lHQ03SkSIEXqQ=
X-Proofpoint-ORIG-GUID: AZI6156ZMDDdny-CZEtOU9gtgZI1dJV9
X-Proofpoint-GUID: AZI6156ZMDDdny-CZEtOU9gtgZI1dJV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+yJ7V8mlcn+s
 UyanwhL8lq+HY0vpYFfZgrLJkvcRd3+oy+v1LAk/qIwZjrJ8GSIa8j36DrsVNIr4dIXNqBmEY/p
 TZziNTAGV1x3VYwBdNqrsvWRJFNEdkPtPyxiR3Du9xvHJmMLbsvVs0U9SDr6k5SHk0yj3itYLqT
 U4uz1xF8tZtGJoEMZLJIXQgIqYF8bu1XLWLeYPn8GSqZCSULKX1gL43/rheVt60hLfy7jqKvMCS
 dWEMCbzUpImj1wLLUwA2Z2lj+E0xwvApK9pTr/Z86SHdMkzwLXbtjrwjNry7pW4rDj+ZIJXBtG1
 E3CXj0U4h9IWsDAgzyHLAaGjR2fhDZG3iRJlk3iH2/p9kRldxk3oWp4jmb+rtDbl3M5gdtWI+cO
 B2sMBAYxZm3QpOGDrPQIhPf5P9yth54WX2X/7MSWKxemR56WIFN1Nnw4vU7OaEQGuXeibGV8KTV
 IkUBIsBzFJHvKib1ITg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a49 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Wj6AohW_YgefuVwW1yUA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document the qcom,sm8250pix-camss compatible for CAMSS configurations
that use the IFE pixel path. It uses the existing CAMSS property
layout without additional properties.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..d561179be48c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-camss
+    enum:
+      - qcom,sm8250-camss
+      - qcom,sm8250pix-camss
 
   clocks:
     minItems: 37
-- 
2.34.1

