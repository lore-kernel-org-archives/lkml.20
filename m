Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E605473C66
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984310; cv=none; b=DHFXOK1cgoGELk+dgtZxwQlIa5u17/Sc5JrRgBItKuU3yEAlya80onPkqXtEtD3lmQ5s3VM0xjeA9XmxCUtYGQCEp+x3NpeI1FZeZf2W0G+kDwMJrL3lZhZY5OgAWctmjjq5Mma0OQNB6/KlMyapvg9gB3/6MWn+e7Wl3IIWASU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984310; c=relaxed/simple;
	bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHWJi/YdbYQC8VayagRwY/YyeiP/m9BHzsXZBRXhTJ/UsCTwzrNW2Q1z727w0bot5OJQKegwm4qOGarmENirfDhLmJjoxKo9G+LOZECMNoQOGtsx51E1siD615UfWQbfVg7g8XU2Lku/BojPWKrV7b6I0nH3B0pFcTUGKZIJEm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZFxzqNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZuAyVoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZFxzqNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZuAyVoE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79sZZ1624331
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=; b=hZFxzqNAS2OI3CBO
	4PrpV/6UiPfsP50NJXrowOB6oZjYnW0GtfwA6FRwgiPWkVgJ2U6WIWeqxAXjhlgD
	I37Tceeyx9EDLJ0Hf6OHzyJa3WN31VMNEYm3iU1rtNr9Rh8H+QwKvvG6z+W3t2F/
	3Wy4I5p1rqpVzOFQcohhpMXa48KSGPkn6MnPPaq6A/fiCx4RB/BNqfyKoBe8vrDs
	yBxrDxr1hERsIXfCj0i2Njs/Mk7GSpHVQklUr3Si0B0gHg7PxAX417Tp3A2FCRqS
	m5cZDme16eu8z4rzBc3Gu+adA3wk5DBhHVuHRRShMT2IvTX05XFbOB9EqDmBh/4k
	uJSNGg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsrf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3409534a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984308; x=1790589108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=YZuAyVoExgH+f24i1gmd+8eGn5ReIumN+thKsRkjTQG82vmHGvd5+UKJilIKmpupt+
         Y+k7/PMskc1vidTDqhP5lRe8c4y+4BJ1FyqD1FodOQK+THMZoXpY+Mey4r5HI1UDwL1k
         3oGbKVR3sUWDtmTGH/fXyF7oQSX+8GxxdL2vRLo/DbUvZ0/JiSvsUMXD06uuz8s1eg5/
         qdQxchOppk8KjP3Zg+DusfEISqS8ov8fJd+tysTD99pDeVzvXtGvBHzeWXHusMEy1SWV
         oaZ33t6oXlbTZ+I+390OqbR1K+/Pj/XASs/tR+MFY+ehnnbTOOvyGEwd7mihRNL5Eizm
         XRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984308; x=1790589108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD7N4GXTK2zYEpmtHC2Rk/NL8WMsqxYaJ1JMqgjSI24=;
        b=p0f+3P0sCrEB76YlsLs1MquKN1/gGKVG1UDB07TKPkJlS1jNeuizPoaOrC9N3YT4CE
         OsczulUYyca/CcuQ/tuHmes6AIpXFR7RWUHEWmOFcXdDEtFa/1uC89o0Yp27D/VqnbXQ
         IR/k4HbOw8KoACTXn+bPRdnLBdPblRuHoHEXqSxuqT03IHRiZPJ8qJb+iA09Czsr52Em
         NcO8fhk9K9eeFuyMq86tT1z/Ekue+vWQPTlXDMnKzbw0s20nozz+I89ZaA65C1FXp4U7
         /FLhMFeSISxcCD5UciWi4BF2RlVcD5hexy3JGDusCyzjFPdmGcdX1MpHAg82ytiQpRA5
         S/ng==
X-Forwarded-Encrypted: i=1; AKwUvBxqnTwQh6FYud9z63fPMWc7FPtbZTOPo943z0lum9Bf83nsItnJjvPOOdvru/EKLxA0B9yEmSuO1dCNHbY=@vger.kernel.org
X-Gm-Message-State: AFuF++lCRlDNGqKy9l/6gXoOjUqhAN1RFsAvK/tgbvCHv11tp9M2nqCq
	LQvktFWT5Ih25u1CCqvu5+lul7iAxudhzjlyCKatoUApK7a6SISCF7fpGW2vKl4WmCmRJDgJziL
	xwMsr919m+iYLabQZJ6/lTk8K9vFiGc01cdDrGKE2ty8zP71QjMVYCwOfoKkvdC2RUqs=
X-Gm-Gg: AYBFou3dE5Wf4bvUQzkA2iWW9PXrZRLrtzpRkpSlndIewQ2hFXkx+zQqR1+cOnlCoJM
	wQTdN83wYuPH8st/ZVHZJWb4oAGrWVlauj5k1RepLEhcDTnsWZ0kWv7AhuVhmOUBrlyEo6+CtHV
	eQS1GBoaiQyTJPKN4l1lQPM2gyl3juwJqkOnHHb1VIO6gF57JIdCmH3RrqX0x8Ao1hV0zReHNOG
	1W5AuG2yUKCYBjkWBVpl3W3+G9i+rC7FYIDKDeZVFcySWWVfz/zO6XpoA3xk3/AEWbJSLYOlf8t
	yacN9n2rnGBjHQ1L5pNrGWL5mhAu32x8IiP5o3U5Fbesu5yDG0jkAc9DT32zWiB9yjKzSvzCbHt
	vN/8Q7GqBQXh+wajhdreyJwW5jBfhfns+zl+qYUkBsiRvrqbfcdiU4kmx53iFh4Udzd3hEgr5NQ
	==
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284235ad.37.1789984307771;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr70284105ad.37.1789984307347;
        Mon, 21 Sep 2026 02:51:47 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:46 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:34 +0800
Subject: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-1-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=6W43BvwHA+IpXlwv8kwXjiUIJU+UUkDiV1MxQJgJM0k=;
 b=03mrSIYjGb74v0043xZdV5dHfE5NpPSOhNciwxYPzpcJQhYawtO7DPqcZ9zptKDmbSTfHMUfv
 loUzOPYeZK9AQwFwaD0aPvJ/fdsh5yBlo3IP6KhNuAKpRy5veofYOoQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXwdHO0ZJX4wo3
 dcKcibFLWKEYQNHFWhfCgkC6aYfOzVfXw5pWKscOsHhV3QDxNPsmIVrqVaMWlh8aMARrVqMkXWr
 3/hoB2xCGgGsPauf6R2D4INNM7npke9Xl6eDurQSvkFROmiHjPUKeFLjPehdxImuwNYII/PCKII
 BJS3epDNpdHkpBI1FVO2+POLAwEQSPUMUrUU6j+oUNbWQLgcqPHK7TgpZfvQz8cqJhNWeWMaZ7G
 hLD2ne7oSDCHdPhTLIsiVpwZsBx2aFSqw1yO7FzpNQwbwaeu0x4n26nu1SCwc7YddkduL57WUSQ
 rrluyMnuN+t8W3OSo/rJE9ocfsqr/jKzVt4Ohy7lYfGcv2AqCL/tCd+zGjjZMLAJP5x+jNh1xnn
 dDgDcbMDbM1HsJPJktLXmqQ98siMBEgDoVWac7afbWccsreHPDv23U22TGLJO5r6df/dvkOU7Ah
 +EZGXlA07onluM1bpPA==
X-Proofpoint-ORIG-GUID: bkCCG_7RatP-UtEEmIEElGkfpzVQ7wcx
X-Proofpoint-GUID: bkCCG_7RatP-UtEEmIEElGkfpzVQ7wcx
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0fe34 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX0VESHciJOh+j
 NXWC3VN5YzOxRGiMgPv8towBaiQcYPW51z2yiCvSiFv9xlxKth4Umt1p26z/YGZbccOEWWvCFv/
 WL6egE1v4Z6Kun1nmPah77tYtNl6Bsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 6ee9d23554cffb30c92017ef99de15c2493455ac..b97f50bf16f6634bef0e0dc598f9268a654c75d5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

