Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B209E4399F2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111276; cv=none; b=XQBMNwUr8z1QBXKNGU/r0bWkBPhTSYe+aS/Jid47hcdxoLEwdRhHkm30ZypLX9VRPcTb5SSbHeLLmxVK8gQW7nHdHgGqqhXKBegDWzrpWU5o9+qH/Ik3Ca0t0DlbPAkiEFgXIJRuxoinTS4dW4fOZX5cFf+KZsWtZuNrbTExLgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111276; c=relaxed/simple;
	bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j6luKyRpkVcH8b2zkfnjIS7K6ZX77eRwBrcQ5Stx4GMhkdWVnKiBAXspcZgW9/aiHNjbBZUkmdMpegEWz5TH/Rmja5frV4tcet2T9dDdwGo1x43xjMXs39Cu7iUtZsMQs7aGvDyDj2tlkqy1+i95OxAwN7urOuwgCuoIJTBCZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0uR6VdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3KzrYKh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0uR6VdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3KzrYKh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI73vI1153712
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=; b=j0uR6VdVGlmzfMPf
	YAvgKQrcX8Jjc8cjX2Oy/gM3acy+lkGcJomen6ybw2CmMkwnfdRUNZ7oltJe0wXo
	r/K8H5wKLSh+N7LmNolbxRjmPnaOkxKc8FQcX3fvhinMzFlEo66nhWoKG37JxVuF
	Q6l1kg3NNon5+zcXPAeJ73X7RuenqRLiinD2JC34gi1TcwgaTKU9VFjR/yMcHJ5X
	/hpoFpFTuwcnnBuqwUsAcQH49Wwgu2znxrnuflZFvh34bEY8OZr0z8JWi727OXOa
	XMbzMRfm+lY+FYTKuQqTRdzvi6L6FF/Gs99Pg4ccXMkx/yelK8/kVC+DAe4DfNT2
	jxOYTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hkhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso347670eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111264; x=1790716064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=j3KzrYKhUK50TPEoDSnNEgqIozEpGoOPjMmgIQxFNem0pzwxNpNUV/z0HacLcQ3fcq
         kaA+eskhXLmrWN8mPHkxmrZebeMMjCQg6pXQ9wxIeOtuFk7fRsQhAXQrxAD+l1jlKkGF
         xk7P62M3OdQCerS5Y2Kplnf9eEadEXmodww5P4Rf0+FoLbjtwacmaruUNbDnFx9i9O0o
         dVAugbjZ32MaIHG3J78jAOUP4n6tDxrkOM3m2Z67jyCG3AyOWUCiRieB2vmkVwXfY2QZ
         6kf/oZhscngVhkAUVqoUqaQVu/tox2lKTzhMGubu+60jOVnym5XkQUEYem6/MqCEcK2L
         kTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111264; x=1790716064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=M/LZjhDlY3pTPgQh2saRYXH4zwapC7054uLNaJs+Ix0FBQUchExK2yWyECp/BBrgkf
         m9YwmhHZoFp/6K3je1kJeALurg6D1guPycBEdyfHvIl1KzU8uZu4FrdV2isfMtMdE3aX
         vI2RXNJSvAP+5loU9MO3fSAmg82ilJ7XDOuJdiHjH/uR4x+ULZ+1RYA+f578v7BuX/pd
         5tDQ4FsxuSvJu/acB57+ksa2vFLjM8vX8A9V81YF2QZ2orejtzQ065AZW8UlZqM8BzJR
         xPVv7N3J6KqlkF6OIHwb6Wb97dReunvRLwB50A9CItzRL13vDTkZQHzBMWUu1tadKVYO
         xfRg==
X-Forwarded-Encrypted: i=1; AKwUvBzYR+unebOFJBaSSqXDENAAZcdoACRdvQO2YPAwqyqitIHdy+TGB4ZuqmEXvCMXsU9OibYrMBUaV/313CY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdPpaK1y/ju7Cd+t0PSadybvppY8Usx/YDIdcpy2R1riI8ykFm
	rfpHLyV7A/ZVMPCNR9RUzq+8whlDm/9AXloUL2sw1DDsZcjNKZ3FwUVr7ynST6g1hATiu/Rnvz/
	/ApxssOz5R3M2e/yte2ksjPtYyQcE+smj1tj8JONJvVSVKid/t8gVK+p22c/vR/7tUpk=
X-Gm-Gg: AYBFou3TcgicJ2eyW4iypL71TwQ6urEmermZ9K6AYYo2n3/PdDtvLaJgOd6oJv1xhZE
	UwmAEnAUj70XjIL+QiarfS0BLccmLDHwE39E73CHuh92Sq6V038tzWLh3+ZjEN4LV8WIzwkv3YX
	RRUQG/uqnssJjRtrgyQqnso6c/a8Z1DvPD6uoSDViEjP7xNV+p0i4zX9Wi5bbRqPpXac+J0RURw
	QEqY1lf5YnepV1m4VyMZJERy+LJRxOZArlV5Fmeq7Z+nBJ/luYgZZoPrR7FwbYoV6vzmjbiyGT1
	ZNwgaW+0JhrNROxBjYSNq8xX5HziB/HPi2RgV5NrOj0H5ppuaN9OVV2y7o2bPLnKdDfdz2N+05i
	jL+CxNBrCgZLjaSSsAZAupUZPaw==
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680679c88.0.1790111263916;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680641c88.0.1790111263244;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:32 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=690;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
 b=lnEdRep1ZaFLQE1onPrYzba/AeJYBCvVBHvRxnO/E78JFqNTayAxcG48b4Q+1i2oQjaID1kpe
 COzTgnOYSktDAkEE+XE1A2sG5XpO+uItP7L5koJ7qCxGS1o9GXPPrWp
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX3aPQDSU8Mwn4
 zcFazCQ0FbSX2xXPOFElS11Y8tQbFfQlwPKwrcF0l6gK0TznleYjAIni85L50SPPuFvQ1h4Q9q9
 g4WDb03FYSzlmxqIdEbqqW3DdPp5aqQ=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2ee22 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yctfUzL24_LWH4g8eJ0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: yrWBJw2lVEM_ZrzA0A-XtfWZ2oMlX7Vd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX6+nWG1JIjonJ
 v6T6Ibz86FnlC14CjaexWSpPlZtx7Qe+0ux5tpLw5HD2XaLm7N97vKJSGlNl/Ez6JyqDoBoFHT7
 hyw5mwKfsmrkSrxE70c862zJc/h/Zc1IipigjDg0YsxZBY6JP8+ZR6dtB5Bh5yWeZ5+iiTiMrV2
 lcuLOClyOArGxglJj74MFpgLB6IkzwLchKbMBslrJ82u4PizBKClCdPwrmVjoPhh1cqveFgv0FW
 HdoZyi1Gt6hZJdBp2P5Fmy8LOJkN76uUXtl9tX25g2a5EIEoOiuExHrjaueAIAriFOEt37SHFgY
 yimS9YpWC+sEtCBXO6UTnkxmViUhTv2pEWgWIWPrLds9ghEdEzsiN/TdC2RO5tjzkRpidV0iobQ
 9mwSG1Y/aUhIU2ffMHi17AbOU5tC8d0BKZHL/klIunBVGi8kpKVGxrtvSYs/NMmud2jaka60GnI
 sMFvOq0FkgIIaJwI9HA==
X-Proofpoint-GUID: yrWBJw2lVEM_ZrzA0A-XtfWZ2oMlX7Vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add the ID for the Qualcomm SM8975 SoC which represents the Hawi
platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..4259f8960447 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -301,6 +301,7 @@
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_SA8797P			690
+#define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756

-- 
2.55.0

