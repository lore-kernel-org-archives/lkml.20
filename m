Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100728;
	b=IMuju/2dB9RPbn06jgOJAjoo8Ez6jEFoweDnlMgYEBiGlprLIF2yFUEsdtJLvm0Gw6Ml
	 xZY7sB0RoFMBdSf9ekR7D+Q0lq2I+Xj79dtO3Mos20sQQxEaAnV9ieBA7ebtTu2PHfPyx
	 7/mjWHYoGtVBvE60GkvWi69zNb9fPyTujCrYLPUcEuGtGSsw3M04F76Sb0hlV6nxTrXAw
	 ltWojY/Nga1dFbrYGnuQtHt1wBOO9DkJZtwHKWputrcFr8tfMcY4aNrgUobk2Aetzpdoa
	 UyrGocL5bRAnO8e33dri4qTSnXN6y7mzY6BbPvW382L5KbGvsSD5QFyWOvPCAUNV2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
	b=DXszqRzW/71FPVtXnFgbYfoOAWNeK76ne+yLWAW2fWcP1vjkt631gyINLmFQ69qr7fkG
	 +B6sP4yV2s8GANzrHaNM8HlBmCVe1sVacNn51YjN/+KUBul3GWG1MnmwvYqL2x/QtevJJ
	 paXdDAKbE8s6rTzO6P8G6jwC8ho4aolPOxYXaAdPTS47li9WSwl2BDCLyNQsPK+JcQd3M
	 TtRmzmKlPg6bPAGsbyHB2AXt2b8urCuhnPZVLudHZo6wSA8wMNi302XW7M9/b/GjJKdno
	 hWdjTQW3TxKIecFpeNWROa6JeL9B2G3pMtiZ2RNsxCkc8FOCmH4d/rau4YddeVWKM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F9606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00F9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5FpOuWz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxQgofhv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKSR1427437
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=; b=g5FpOuWz8vdXEU2N
	Qke6N/ayibqk4AI0fe7XVe81oPxsapqh5vYX2UhEMJVKdQlQPU7N/XxWB8OtwdFs
	flr/zgERQE7KvsRkwx7y/+pEyqKhxbelckvwr8orGpaboLpMfcE0fRIOQYw51xN0
	uXCrDqdE3DtjbxiFUistNQ6SWa+q3uu3FvYoRYzgnf5en7F0oBMfGSw8Uq32kwtW
	RF4/zgwh59QnMONL4mQVAsCcXp43jXtf6GzJRRJIOgzy5d9S0txsLkhe7MQgZ5lO
	WSSdIW5qk8ddnrMb7S/R+TSOQwzX7tle4IjbCqyVXGqy9mnJo1aiuidLVl3On/8V
	0k7p7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbbjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so2889774b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100726; x=1793705526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=KxQgofhvm6LAGEhG0C9tFbw3MPtoAYV1GesAzMDkWmJuSHVOR548THKqGyPRrGDU0V
         BONkzDa4A4b9mUxjeC3XZ90DKjw7NeFdV2rDfEVa8ietdk/xMhIPu+cOgq5Psac0IdUE
         al8EHS5piPEOW8NtN8aj0sxgVruN2ZxOsdYAZTESuyUjPvd/RMtEvM6Fc5mYc0M5Dkhn
         AO5Eath7kYAE3yUpwnGdoIaBBc++4zl1X/iPSg52GFfklTUTdYmpQ7keFBg41bzslybc
         Wqb1I8OTmbv+6wDJ5pgzH323XwDIEd8H1F/XAc40cTmzOP+/lwrHXfg4HspEsZX0rm45
         IsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100726; x=1793705526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeN8FG3BpOeYsxF/bjnET7QOWyn7UaLsIlHvGU5eL90=;
        b=bDVumhP7qTlZJmudeNcFy4W0gbrgSuLlvDeU5NnuZThTofQQ7Igj4OK5UrTpTlmhrp
         zcK6pYK8riozUmzlrmvKX7qnn23IYEJAJNVb7Bv7ZUfa1at7VNLinc3qxMJkbWSD4hx4
         fS7CMsHW9CJ8qip2IkAcQ2t3xTydDAYvWfxRiLI586K5mqd5VsFfu4negdWVueXhU0qh
         7FcAIcQugzeMtaONY5543Vd7VnACQjAXIz5zIAwOBKokhlOkbH99mjOSqFSHlV90Ayd5
         XFfiWmgn4tjetnlePGb8CTaoVolIGiYX1TRmjbRuoZIXecLc6x+1RNuFir0cOIyi9dny
         Il4Q==
X-Forwarded-Encrypted: i=1; AKwUvBza8BlEHyob3BKs3qLM1/KirDz09ftEa04//TukmU6iQUTA3DDIPbyxKPRVnHZY9RjQjq3qxuP2xODEKA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhpgTC9HATDQqnIkFbBF2iJe4MFz2lD4sMC6qBk5imuHKo5cWe
	ZfYxKWlEpQAlBhx5XLd7weqR+fI7kKKnhiav59zo1uVSZnlHVga+Dk1HeF32o++itD/zQM1BODL
	x6/gdckEB6+wyI+lBQsvx4/hgFs9hQAL8uj8b+1ZYeUBmSgUlX6T/VicksHAaSsJxEus=
X-Gm-Gg: AYBFou2gUAE1wb2kijpwbzcGtXQHyxrrhXbXSD5c4Kn0JZ+IoijLUPY48AXNB9YS/Ba
	1qR7gjGhuU8W3gpmg46nGWk2WxfZc7764QAyePKd53q9OzEkHTXjYzJs0MCnErT7ZXWkp4bq3L3
	7ArY2Tc5+Sb22pZ9e3vH9Z2OjN6dl2Gz+oufJkkwFFs6TnlR/oMLxThLxYZBcZnrKsBJY+Mtq7j
	luZFa14EhU3jeBjHTbx3iFFEr/3ZG1N+AHTZE2zawjGZoX2HWOpDsH6+x97rfsxUkrBigJXA1GU
	RNQMKVH+vFF4d1Qsayi8L3CuRJ31wdBGbPsi4aQ9DlarU0AWHTKtXevsaUnhS6S7iVzA+jRG3gq
	4cEfeUa8OrOl4gylMvWiOzQko7K+pPkr3SkSZGgNGaF2wysT9Qza8lUpS3ZIoq7IFswZdwQ==
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429143b3a.20.1793100726467;
        Tue, 27 Oct 2026 04:32:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1394:b0:886:5938:cddb with SMTP id d2e1a72fcca58-8a3665a8f56mr7429123b3a.20.1793100725965;
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:05 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:55 +0530
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+KyQxQUmyb9C
 VnNWZ5BDkCMc9ZJLtPxzKeOApAt1bVAoIwKgwWY6bKsSqtr67rADWImAdXaDCyIH739o1DLZv5P
 yjPKssR4PiK2S2ldL1KD9mWb1SaWMc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX8ncjEX6aof+A
 nXTe/i+6iLL4cGgsyATPWR9ZWm3RFNOIaFybfh9/h4XRBJVDIyRl82I1ORt0TCjVy98ZQfxwmKh
 MmOC32MJwYYg395ce8SJ9hhqCQ6F+6m3pr9M4VXOkckuUh02l0DX2mjNAuY1XM3blxKrp3W+0wT
 YEaGguyYdsmMCLvKUbLhCwnMtrM/L8Uf3Wm55iV9UrOZP8fobmn1kHFCXdyk2Y+r3rAy4OZTCtf
 KZhcti0rJ1Flg6DlGGbeuil1MGhOqVYLM12kst/BSQclME7smbNx6i6GptJxPDOygY94VlOzICI
 mgolodXPeFYwE+jdZZdH9WGCiLdhbkER6fgUOx3B++ME5nFy0ddN4MFkcZOd7nWYEbgusUo2KlR
 tTr+ZFIEZ6nmM3QK7t434egooeS4ZhJJS8O9hp7IdY4ZQ9nE68NtEvfcKpEaVR1CENaRoD6r+Fo
 3yQM4mz1N/Jd1hHgx9Q==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae08bb7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: zT5kEhs2iBREWs_Se1BaAb3Un7RQy_Ug
X-Proofpoint-GUID: zT5kEhs2iBREWs_Se1BaAb3Un7RQy_Ug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

