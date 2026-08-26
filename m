Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734413E2AB0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751968; cv=none; b=AqF8q01lYTOtHyBr5ofPiOALceWK+I1owifsHe1Eg7HhxvGtKgIvWQyrySM6+I2tLu4LwoLzDRjpmDfPztbRhTz9OJxb9h+4ilNlNzFYZpwEvC+eOi6mjkXXeR3gmpJ56rIO9lCyls+WrY3kZYJUAPykKQfwzDZHG0+PxZQTmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751968; c=relaxed/simple;
	bh=BbU3aeT8kDtvkKAMi736qK8ufQxuuJe55yKLxu9JT1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2r0uKUUuMslBNMubcPixF32VIP5SVinry5ZQqE9lARkKwY6w9W+DxO/zxgaMUZ2x/zaxmBDfSTx1dlJZ4Df2vZnXY0JyVvlyp2WqoNGGHHWJH4K9guy2wT+5GxWYE/Ufkf2/gKYFn94x6XXkuay3KP9FZgzKXvTy8y2EuRsraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3apjqhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQzXptJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3apjqhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQzXptJx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC4xH3983635
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=; b=W3apjqhxoZO5HRyy
	gYqHC/KoERrxR0zO1CGszuN0uYLt0405e149ZOqXkcWvTtGdzzmiaZwIS+YaFARj
	Jo/NvKN0vWymEcEx6bdEGFT90ce0j62/W1BZKbF09GHEiGmxl+rVAGg1EDyE3Jxs
	6IkYaDM7r3z4di9O/jsqnbOyK07Kv36TKY3fBzYXrRoJZYQ2qK2SpqUqzCBXhpTi
	OdRR4rti3NYIipCrnRb0X6jgYHjhwo6nPEJ25mg9B7hcGqrnB8wQEMxBmb3hSvtC
	KFQoA7/8FiPxCuXx42JMAGQgoVcIrnfliKhKMriP3u3mL38pvCyun/+ugE2NyHE1
	7EXW+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqry33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:46:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so1382153a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751964; x=1788356764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=;
        b=PQzXptJxr1XlEkLice4BvI/2lJQqnnjht8IfTEv18XgXjnLpyCvzYVfKxS8txsBop+
         IsmJQ6CoLjWmJaFrdup7uTBwIY9zF+NHir5XmcXBvR3EzBujMtfHV0rjug6M2KiRNOlB
         RL9gwQE9ehH8K+qAzRp8aVV9jKm3eUFvpVmasz6SLdVuqbTlVPUyTwAXU0M48fRGOAS0
         EV2iqrhNqhwy0iYYrKUnDvABM6kA0cdUL83ulpuRLrBpyKrLqCoQ1dfVWxAmokmbZQO+
         heuvwA6HEkccpK0GSmNfmN+M/Edfdlod6sc12NBT2Iiq2MqsNqrWZ+CNCXZzrD4n3A6S
         lDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751964; x=1788356764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=;
        b=MPfBssRhcsgvzvrK15FJbGxrjHXTKG/t+u+Ihf15sShwh+bdqimObFnDK/og567BXz
         Tms13RTenw3cyQ4OCeJJSaBxBKv6nnbQwab7ZISyp+aDWvT5u4q+Gd0zilsIx0fyJCc4
         6zOahx+au00SInldKl/20TJ58JEt9iQTWKlL8P0a/+0H6NJ7LvbS+u0IvVQRU1EVwYW+
         NVDtzoBIES36FCJ/Tr1SDEjd82vD6/p70/uQ/NTEdLtX7novx1LhfEtFOosGL90jGSCJ
         B1wyLAm3QHzE7oV0+zxcv8iGsOobX75l+2PfE6rksiwT/ndU4i2bbY3dAqA37fwHRLBD
         hq4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrcn9SyOuaf11osatBsIvXxVu8SijpqIUn8ng9wyEGjhcG5toTPpqFpmeZD8+NjJPaoNnE1ZpRzvr/7QgY=@vger.kernel.org
X-Gm-Message-State: AFuF++nCZmUGNb6h6txcnKxIopfBXt2XaNhAZLXrH/2w0o9+bc4laIil
	2BuaN5RpY70Aqa6lUGz/N8971fbjjfd8jY3Uiu39zWw4kLpjKO/DwYOFdBHvPH3KhbfL/sNc1MZ
	7jeDnRDc7SuFq8t67u1nPHJHcApy4eEZF1lCpCzZeC6N17fbzs62I0Xc6ZkSFcmM89Us=
X-Gm-Gg: AR+sD10SQuypncGbzfYRVm1OtYeZ8IsNu2Zp29jtkMq8hqZa+5TnWkJUbF9N84XsRnm
	ZKnKI+/PVQIcRE6cmm9bwDWs6llFk3q1x4RAxR90R9l0SEs1tbvHy7AmJig0RhS4pMSxaJeiP6A
	+tYQJArWOj1e/en7qwmv8XvOpO994Zi1NHnmQOgBheOzvEIamE9UZqVYJE3IGAb2LU8lWHHmoU8
	v6zBnHpQODFnRKcmfcK/mvh9m+7sKQiYA+CIkvz00ifL+3DfbyYywD5bx5HH9Syd/1913QtwjE9
	kS0IAcHx5zREyMBK0tLf6m7Qk3wnzHUCydXjWLt6EQJtQVdDnnwKP+WDuQivBOTAAr6GMIFqZLf
	QfdNFWEyXJwVlkTJDU3Tl2KPnSn0AEmbUXg==
X-Received: by 2002:a17:90b:54cb:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3966d5b7c62mr15843958a91.7.1787751964026;
        Wed, 26 Aug 2026 06:46:04 -0700 (PDT)
X-Received: by 2002:a17:90b:54cb:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3966d5b7c62mr15843827a91.7.1787751963551;
        Wed, 26 Aug 2026 06:46:03 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:02 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:43 +0530
Subject: [PATCH 1/6] dt-bindings: misc: fastrpc: Add memory-region property
 for context bank
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-1-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=1735;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=BbU3aeT8kDtvkKAMi736qK8ufQxuuJe55yKLxu9JT1o=;
 b=zF995oQ3Y0zaRNhFCXjq1tnksXYHKJozOLD4+QwP/nP+FPezLYl+3kGt9We4nGf7xCmvNvKJ/
 eUDi/vV9KwtDasgYRAh3HPzMy3qvlYEsTSuS0DS8fY88DcFZiC4U25u
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX6srNstxrVSNI
 ekngRcu0EjW/ocRBmFXrO02MFSA/15P7cksI65ayoBbABktW5yQOrfdjDptiEtr9ukqjur7yM0G
 o7C0jnKAV9mzU1hhWnr33oC1MbJLNpw=
X-Proofpoint-ORIG-GUID: 5goJsaDckzvLX-EHAFCBLNhk5wxRccRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX341TNmP8s6uO
 LNYBRvn97BhP/c3It3EEwVf81IYIeZvIcEq5oqJ8uhvs51a1QPQfTVmdjAQkyf+C1URVtks3S2b
 ElQKV1uxmHqsWsSGq1nRwHLYNL4l/zgfLe5btegANNzSF/ZvsWHpgBG7e2USPl/2B8aq8f7sm/I
 IxGq/qiIuBepcp+Jjr303jOQ1x74rC6LKVfb3Z5bqZ/rnBanU2dRnilRU4cID9ZRorvDFHFZXTv
 beLrFGS5oE34HP6AKj+fLBAsfavkaHQZasgd8lwxud5lJOTcHccYSvqnelYrddvE2jyjXdjj6JT
 6D0hZ3c/+ubSI1EF31pi7p2GKqWZ5dTLcnS9ZdMirocJWm4q6VBK9r4nxhqp2vsH658X9CTDHH+
 XZIiFcn1pGGbSI3KUpMN/YOxoRiJBn9gGB+Fb2eMunx0NyvQX1BRI6u7CIs5BYPoGGIDrNkLtQs
 qy9ogqszTMokvI3SUqQ==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8eee1c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z90vTsduAcvSOalKQMcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 5goJsaDckzvLX-EHAFCBLNhk5wxRccRl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

Add an optional memory-region property to the context bank node schema.
The driver uses its presence to identify a context bank as dedicated for
extended IOVA mapping and programs the SMMU with an iommu-addresses
range to push allocations into the wider address space.

Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
allow platforms that require 64-bit values in iommu-addresses to pass
binding validation.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index e945c8ba75e3..f9830ef37814 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -73,10 +73,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 0
+    enum: [0, 2]
 
 patternProperties:
   "(compute-)?cb@[0-9]*$":
@@ -98,6 +98,14 @@ patternProperties:
         minItems: 1
         maxItems: 10
 
+      memory-region:
+        maxItems: 1
+        description:
+          Phandle to a reserved-memory node whose iommu-addresses property
+          blocks the lower IOVA range, forcing allocations into the extended
+          address space. Its presence marks this context bank as an extended
+          mapping bank.
+
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1

-- 
2.34.1

