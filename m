Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558051;
	b=3C2vjVHCauA8+hZyNJv8q/ofrlzRD8e9go72la6Qrs4NV8iGMhyIfMMJgBIwu8pp0HA9
	 lzr2UjfRutc43at3JnNR+OW4AMgPt3xpPajP0Ml5tAF2RnDOD3aK7AixKPVLxpml1C336
	 5to4Q/gIOIi7F22g9aJ7emF/h0A1f0p8nBJ9uaf8rzwTFoxxKcpGTW8qGDoYKqSP2aupC
	 +3+q56hvIWo9+p5GBzWNQaSQFX1I7aX6d3wdeqJHd4JjWLw4m46uK8ZauLyYs8QliTUED
	 RL8bFVaFvu7RWWrk3z/zypsBxDru4TEaEWByqh/aI70qsEMRgMbcD9VfdJ94CVM9xbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
	b=B+pFdr7X0zGwCcPr6b2ILqTwo/EdGypvFAzaksRozQUPJ2uupaeL5ZU8UvxBB2kzrjX4
	 eezn0WCAZVY4Op3qBNxtyU7EMfQiPV48OfLnZxhiyD1D4eNGKYguRS2wzhYTHJDdqfiv6
	 oz0I38fc7QsIYeUgI28gXqtcGuijPS4HrC2SWA9bu/+aPcpYQZ9KeqRg0sNIoD6ljKZQB
	 h/xHPriOVjz99xt+oLdAd7A1rBQ4HvGUCLUR8T7wawyQNaxvO/VuRgUChNgRc5uqh/JGg
	 TWu6bJpuu6vN6SAKULYkuODCCY1xYPpQZe4tJkv9fyShGBMCBrZrzm1bNcycJQLLOBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7A606A8A1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF7A606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AKo3615962
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=; b=XOnar0iuZvP0vmra
	srGEP4McvcKdTGb5rWUtyf9UovnD38hxYKrVFDe1yhtN9e4DfqjDHP6d02zqYqI2
	VxtFjCk1o/AjS4Gujc5zUZo3Ma1pJ3X1ErGLf3uc6wjRuoo5YTWkE7wGy1soLNP8
	zNbjMlFSr8YVk0lQOM1181dOFGn0pblNRrj5TH+8GCcm545fxBq2BrKX8yWJycae
	U/pE5qhwi/Nto1tATrbt11ts4iL+GNOlSPSdti+Jd0R45WLVLHusUo3iduQ/CteG
	Un9c2TlG+j6g+HPFPrVijhUs4kqFlAKK+lNRm86dPnvTXexftWQ075TJeZ7bi+E6
	bsi1JQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ajv1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso3334310eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558049; x=1795162849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=FsSJeJWMSrCY5YLT4Y7H1Loni1WXW2Fih51KoJdqPV0+36RryA/o6jlLQqK/V+Ouof
         mztMHHzfwFOMD6wNyzMDKAeSKR0L+nX9lpADD7o1WvO8lB3c0Nr4ZQM4VabT5bEtCMlS
         6PlV54CBhZDHJngd1dfgp/lyfB5E9GTufFsLYVrWsUpph11dVrVQDZywo+wbHCs9bNnW
         +272W9TcFsgQclQ5lLWJm8Pt39IhlWclEs9bOYFpJ5ozKCJmgHvSC9+XJ9A66btPA6qe
         fN3A2E9YUlRwO1EDuZbYL+sbCPpTDfCY4rHrE8hP2uLMGTO7nbjUsNqwD34gLAywVrJa
         9Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558049; x=1795162849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=NhYxcgI44xiyCSYDf1SBoMBwAuNUPaDKavY8BWpTWNxK1aGlfvI6wFpWzySmbV6sCE
         57K19NfhPRdYnU8JrZ2wVRN4aiBDW5iHGEAqIgj1rUVqCYomMWZjQr0rijS5WMn5f62N
         pE5GRU/x5grtW0t1g6FUH6hMOUNRsGCzZ50Dnyl7s6FKjKyKAZcOP+ZILwAcGSLk4eds
         uCxWbKuikIEw/Pb0A444Ha/rJtohGE5dPt3aGfRno5gb8sIUflSZq0uskKn+Cm3iRfD9
         H7SMncCiNTL+d3I9XqN1CZWtTM0z/Ib3rNu/p7ep5ty2afFO5sNv+uR6d0tjmIlzoUjV
         q/kg==
X-Forwarded-Encrypted: i=1; AL+hErGMlauAr9phfKMXf0ZDSOhYkrIULKQla4ILCM9wlSPVsZf5QtJMIoHMLVewmq1dcIEQFEsGxdfErEELle0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YRGdrYBsEMlzKbRfs/8aE7rTtUOJpOZuPW4u9aY4pLNAAwKsE
	Eer+YqadKtCS98ioP/Mby2bWTK4Ic4d13k3/ovhqdqlN2dNRLIP4QOtmVuzb0MUkIoQiPiBp/pO
	4/XcQMr/F0dVUrCBOHBZ2bR3hQ6hXjakKuy3W2KIqnjQSDhwuya35wSoO9j7ndLGEeUQ=
X-Gm-Gg: AYBFou1ZzUMJVZ2lhLfeKSjrBuaMgclVflwA5J/ApMcQLNmWrJUEkZCfVMXk6l4C9zF
	Nw/hVtnb+xbps85xmT6vQVxWtcUGp1k7mYZKN66nLnpBulO5wIBEXsC/3g9SRra7qf6m0y0ALDI
	c5crpbEfn5OAK89O6XifJnUP5IHc2htomlYNJq0GEhu4h4N+g+fUf80g4LNM67pVQRGOP0jVfCG
	f/SZVK+EduaTq88CB2a6kP+d3zAWnAcmMzdUqvXttW0HL/pouK+po4WSDoVRwhcg0mSNF1YYwxj
	nVYVWm10gTOy8mzNzivUR4PjNslGFM5ceaMqD26gtZux26fSId+9hIuO1HAZJGc8jSlJFUidNU9
	ft+wIMpvQid/6s3hrOwztmjOuVBCO+VVzuUwfETSbXhqqhrraNcKZFUoejp/lN7UDB7mF2l5nmf
	D54ZA5
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576635eec.29.1794558048632;
        Fri, 13 Nov 2026 00:20:48 -0800 (PST)
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576597eec.29.1794558047883;
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:22 +0530
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
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
Message-Id: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1388;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuZTlOZoHF/pMdejS9tAzCDoNgWwALKveQWqW28u/qw=;
 b=dCoQcm5zUnZnBakJObf5tk4CG8Voi6YOt44Tna9inGh6/wAOgqc4RUMwPQxcpHgbv6UiTpU0p
 04G/ojRWDWdDiCivEY3L79mZsI4Kx89yVjXuoas0P6pLpQtScEZmFSt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX59Q2z2ElqbNm
 rFr2Umx9slhXnmJO2TTV8UZ5zbNiVgFulNzrPWEDlSHzxAoNt4i3d8I4NHT1Fsai3mAMF9G/E+1
 EWt5Ue/78ojyBp/zQcGKLI4DtIRnam0=
X-Proofpoint-GUID: lrFzMWza2mJnSdobsdOfHDhXLx9kHMkH
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6c861 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cfbElirpQlrRZ6I-D6QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX0FaSXQaRt0zD
 0ef712N2cPbUKogDrm48K8uC+Pne9ZoVG/L9pO5CjFOrpdjmPk1hmRgjfBjzDAfbDzqCdA8lNCz
 8X3tpq9+H7Oku6AKw8+ru6jOXhyx7SDpSuEEVPqXDcPxVAmDwm6Q304vIDPku2CI4YAWe6sV90M
 XgoMkPLTsVhrnsTbGqCOmgMASYXpLNOtwpiRbkvMtr8h6KsHHgR8LinjTDbE97TRz0zzL4pBnbx
 hd7JuVwYW+Py7JQvhGzlBoDQm5mJedcQSi4wXhanF3iMWz8zYQ9wozJZ4hPQhq40vQaYXJk64lY
 /bd4j4TR/gYIEkVcIDHt7OqDcE7j8LJqn9QiaICX1A3c/R6RaNGRsHyVIgP0g8JDHHcucon/R0a
 YOvhtfjPTdwZVIew6NJ1UFRM8aI1WChrzEN6V183D389lAwwhRKG823geP7/4gPGmzK10tOpdZL
 b7bqFwpF3iClxxYUN8A==
X-Proofpoint-ORIG-GUID: lrFzMWza2mJnSdobsdOfHDhXLx9kHMkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

