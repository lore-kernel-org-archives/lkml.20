Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609471;
	b=zNnGb2FJbuK/1QNQEL+7gaCuZJTpPzUbAPHQhzU5CgxhQZKJIoQyb0Qkm38UuEZgIKtO
	 jax4uE0jxzitzJpJ/JqhU/6uGKLt2j1WBOkg3RJgAI/ExG/OY4w7bo+6Wr9HF4ZFXIYr8
	 3ZLDmIpbK864Ty2xw2YZI8Q5inxxBNEdeExkBOvdiFQLXon+4zQkg7G+wwhVgYzfhkKMw
	 dTKTKTil68pUPejBThi1wT9ew+khjK23ZznT4tegkrSnO1cLgvTWaAkBH2aiP2LflkJWO
	 1r8TkkRdJfCN64owN22LgFLysZ398SyjbGpwr2JOkhh3ZSs5dAqrONqqChInwnAW8Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
	b=CuxF3jKm4EhYV53LMq2hgDtc39IsPUQU+hRcElog0edYwY8FqdB6qxInDKy2vZkRmY/K
	 BbD+MY7eVabJafRx+t91162mzrIXW/EdNeNqrvvxQKhfuWvVwFymCA7giPgiY1A8OfWWG
	 3QHaGiZ5OMLnFKDK/JCzgpQVMttNs/7M9adOBYRrVdi2yFoABBw8aVxjke1yorHwImXH3
	 AGOC5gdndbxPdWtVM7ltXgwmc8wIcupyeuIMofaBV3PxPw5rbEpQiRnBEWKIfWP/YkVOz
	 wnWQefVmGD8+dlgZaKigN0vxuiDGB4djLJV8dBiBevfVXvHZeQ7tvIxp0rLnnkYhDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD260A2606
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDD260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1eG3YBe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTiaX0Az
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pgga3121054
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=; b=D1eG3YBepu9GuT4B
	g/Lr126+Oh+BM/btJeMgekD28b1ipXi5ghJauTZ+/k3buKWNXdF29UbiIQ2dDSxx
	xgfEXItVUUcVdJ2RL0jTnLznQgPW9bi9Y0j/y8H0eXM0uRPpsDcqtjTJbmQNCswo
	HkQu97o4NPz3+IPkl7tB6VhZG7xcGbQ0UweNIBDbKGlXxIVaMUsyMQluB3p2DXg+
	6oHAz1KjFXGyQx2G71QpAchSfRcQrlBXumgm3YamOSCE+N1vXH98lei9tylKMBze
	T0broC7HzPpat9ODS3vsNgONgbZnDaaVTXiqtqV8Cn9eTaj7jyoZZBPa0n1Tuslw
	dVKw9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmereh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:51:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso2682053b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609469; x=1794214269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=OTiaX0AzpxUg6T6v/Q5I4zEDbAdW4ZMYJp19jzvq6qWZyOcAtcRzLrSeoh8pZ/QveI
         fCr9INo7OfcTJKvOYe6u5V8bzA+0gkzUV6Bv+3hWuwkQChOmJWpt5Y2q3vZX7RQJYd1W
         6Ca0QvJZ2XBrC4TDuTZZr5zIoYxtQeMma2rqjjPuROb7SsPOEib6/jXp6E7NcfVn5o0v
         T9wq0RIJyYNRDwSgDLjtjtv5b5FLXCmY3ki4qwt0GpF0maA5i16OHNI/zv/71pY4cSs9
         LVpKUG90nKfYXCUqaKqKUY84fvLJBChNpT4Eyz8zvi2xFl5z5hv7cVEnhUk7xw+TA3EG
         KCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609469; x=1794214269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4PS1yaxCigoXQ7XkcSedOsdav1BqUR/eLBu7I8AoWc=;
        b=S3yX4hfCqLNY9haFI2kdZYCm4uJoDEVQFyJ8vIWz28rMhCR8gjdoaFlQgDLVV/LBe2
         A7GV9xpxdS54P2nY4Ej/gWOpcZjp4ZYGKn7UyxUQ0zG4RWw64VzBDFgn4Bl58wNjUBxM
         hm4EYwEEUZPY0oWTDOLRM2EIFDCEMyLWFakulmKcOtM19vO+UrIT6lOBB6oUNdVWIA19
         8JOjD5A6xbRPtPP3euBnt9PJuT7p8+tXjWSkXnCRuSDQavr0TGjxXFi8m/2teXgF/Q41
         fjT/eAj3s8kccaL9L6JHKQdcrooP9WbrOHgXdczkK8p2kxX94HpkmU5fazb7B2N+fgvh
         yF0A==
X-Forwarded-Encrypted: i=1; AKwUvByCON4dBX6Z3XGBI/mH11Z0KpZzmG9r8DSd0D3AcQDK+PxsBK0uuSg7WBtfCte1vSxEQB8pDm3yW89NLRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fCEAmRzvPyRd9Z/BQhl+BYF4CBtl2cud5LHuo3owR9WpA5ut2
	acN7Rw0cIPzikSr2ioOsVSRU14jJteFfpFo5nINhQMH7NYYbW8QJ7XTW0nfpcaDf8fk/rHmKPjX
	aTUpTV6hNP9Y3cLTYuh0ska7XCsf/Uwt/fsZJy6EF6o4xhl4IskkE3uINz/Lejvn/xHs=
X-Gm-Gg: AYBFou1zUjUuI6DqJB3nfW7++Y4/mItPq4cNVqHkAIU6keytWL+RRgZDuoL+OYIdoq/
	Z26oZOxzznd69no2clEIz6xShX6blgIDMLkfgKfDFfECwd/4veAL6481krV2wpqZEmU2B0mPgDP
	E1oz99um8ZhA92h8GNwtQxJp1HJoCbThqriYOfXmRd3s4r6V+EGXAyz39j09fJdtbbvM5BniGbH
	j0wGX+Bnaca0kPm7XmbbIjpJ8ooZLuXVjzzZbrawdssZwD5Z7ANEDLxeQPHqn01tnnAZT9HovAB
	Dvy4TEerxlGlSkj4osBd9j68/iQUL9uqx0QRQVOdyt8HQ8tS1hD7XJ8C/0VkbvNVAno54OPPXxA
	fAvGZlBdW4wa0HnG4lPtuyQGDPEsuAkiq57r6kuzzg+dQBMnc51TNO/P9pUfmF2jqaSVJukwWYr
	Drz/Y=
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632566b3a.3.1793609468962;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
X-Received: by 2002:a05:6a00:1f11:b0:8a6:8f27:d4d0 with SMTP id d2e1a72fcca58-8a9ba60c801mr5632541b3a.3.1793609468428;
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:08 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:20:57 +0530
Subject: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
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
Message-Id: <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
In-Reply-To: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=1468;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PVBskeWsn2aBW+z13AhEQSc8ykpvKqmkxJeX0F/rLbM=;
 b=bvyZ9DEICXEEEClHl6as+NYWVk3DjPBGziT1v5yO+W+9NMPFMFJzgMOCperfl56zVrTBKMFdA
 E2GFnYiBQInBNWBoCpPad0r50Ga4BAV/X2Pq9fZEcj5B2WcGMNqx+1j
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae84efd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3Q3I_TTnfSvQyUT7B4wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX9XJwrXmBYrGg
 R2j2oAHqC7IkJHUQbCaSfTtpPCrUtOcrgRjAn8zlgwqf0tc3s5r+OX/UjJ/umV2QVXeYK/btuoP
 59Xuuar3gH+wiDve2UKStnWzP4oTtxPXLeU46aIIoT23wLeT9Rjd99UHJH4CRJf9lbT7JvwD1mA
 KGfPMuVxbN1bC2Z3cpH9Ej250SL1eN9NujjVd5A7v+Mdx30toL4S0fTn/D5IRmeNcF5g1DQjY8e
 NNGCyVQaOIgg1r3mJosEb3PcHB7NjGj6PqkaQciXVrYlI0dFSmtTJkr8XHS+kzVLeLsnCmMuXzP
 QPmn2s+rd6EeAvBqyUpFCmT0FmIF081Ug1KgaS5gJ90rWA3D8+M1RsLdZxcmmtS4QZRTyc/7XuT
 pmeTH255w+8Ca8XhX44KQHut2SRNVbEIBkCdto3T+lBJOf8hXNLdDIKi/0eJQfr1VA85tbppTIJ
 866DGxFAdhXbEPane8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX/HsAAzCfiuWv
 vu7Zyq7PBbhx8+m1WTz8UpBELmixxdMBJ/CzBcRaOWpP5kOL9Fowe53vLwmEK1CgeLG/5KDyPUT
 x03u3cKz6YthahBHy+MfVQoofb9eZqI=
X-Proofpoint-ORIG-GUID: TzAhkQVFtmDcPYNn_W1jCcSxWvTG5QUy
X-Proofpoint-GUID: TzAhkQVFtmDcPYNn_W1jCcSxWvTG5QUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020035

Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
where entry 3 carried CSIPHY id 4.

Describe the hardware connection directly by allowing ports 0, 1 and 4,
and using port@4 for CSIPHY4.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..e23f43dfa4b51c1e44e57f31dc22b4312476365c 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[014]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@4 {
+                    reg = <4>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

