Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364218;
	b=C4fy+VHs6x05JDNng3msmRTMR0wGiWeQzT6108x0ekx5+MkVUi0DaohwaR6mGUPmXKXv
	 2456pCFN8MnO59O9glu/Y3r6Zy/fDBtpJuWn6uo7Za1Bcf8QtgGD6qbZqEKffeRpcy3Ja
	 sYlQOyxIqerR3ClQyc9Ewh8oX6rq6ib1OLNUbt8NxvWMu77vwDbKdYBQ6u10rlSZ1JatJ
	 1ApflyP8qNxBoTmiLcCE22ipsFWd3mRTLRNsPLUL9A4Iz8IIehmR/orR7Du2xa33TzZ2J
	 QrhqW4MH+TugNCeJHlcm/NAMzaY1FWfPdIY/lL5BZO0ilNQ+Qm2Rm0H31qhf3xPUdfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
	b=R22O/hdoY2CM21HUAy50bGf6WtprsTv+FFwhg6NsWzEWErbs8xZ/QRtg4/XgwDUdIdYj
	 lo1+L/PXVTDUo0zqhFbwaCJHT4WWPnqUlRGm38bdHZ26B2WjWx/jF+ZF6Sal67E1EPoli
	 FXeqsdtEOboEb2IhxJv82GLlQOXvGKUk6m9hEHaGz7yBoMZC+HxZ93yfXCwgNLG0wnLI8
	 DWQXcdcMdW1FmX71C9rPGBf9Tczh2onfPfDUqdrSCMe22wGxxD1sZpdcaJz7fMANKLqn9
	 dFyrZyC1QXz3N2PGqYU40eLFsTFqjkfpuool6eBy1qfo7g/HbqVXo5s6NbY7TtItwmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36103606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36103606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aA9iACs4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MT6f40vE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGDlR4144837
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=; b=aA9iACs4OIHPhKAx
	z3tAtDDkGHfnj0GwoaR/slfHPfGvqOuHHRebmCPc0vKZEmRLfCL/kkd2mYx7yypf
	mesFwnqXeolYDZbXWyw/2WJjzZkxDcivijWVA++Mw8Kc5Okcsd27AgNxMT3BV2gY
	foM4Gw5Y4Pm/oOzO+AaEpUt6VN3nUyG/s2+1PpwxmsmWbTRPH9ouxdMYB8gQ+P4C
	y43RHRj3CDalDugNjW3SGsw3hANONVoRAf4evoN5NA+pddkVW5N+yacfjWiLVdKZ
	RjC5uy6qBeyo7JPIvNfKdebTPOl7dQz/pGAaA1PSeMWoQq04xPyi3HRiVUXdGvIf
	yX3C9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7531jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:43:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so7799085ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364217; x=1793969017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=MT6f40vE9No5RHTEIrzbyLe18caae6v1PI5eYbcp0c13AIhzo2HAn0prZ7dIn7nUYi
         KugvKwv8OLcGnsRTTcbZitX5K0+rnG98YONIsOGEOPg3pUAzNhjPNlMN7XYncgoQhvEF
         6bA3WC7l8TLPLYWWP6/LQpiG4o4TNIBagzq1u1tQQ38nBLt4UPsu4kHYRbNsmvCQc7LB
         gU/1kC8KWMguEAXnmnFUBc56m+OsqIml4+G85NkCsxtqwpa7zT4U+qXVbwKVkzJXZSb8
         Op7O4vfwCunprQ6aIOXIcFZ9RMseMQta/8QnilIf8ZQ+iBLmb+qCxGhQqEGhqwxCrSmb
         q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364217; x=1793969017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQZcWnzFgAmmFYA/sHLwHEakiYPJA+ODTFEZ0NO5CyE=;
        b=cTGFT2GdLPgWd6T3Kv/Bvh+/E1MZCMVb5F4A8W+KGmiZ55v32woIi4XXZIJMU8Zr/U
         Z4LAI6TboP2BBHXDAeti0kR9UwnD8JNxKZ4USsqk+F/EmthI17hKjQ/WaRFtjRsEfe0m
         ad+7ODUULpBWS1/o5aKspEgGQsIfEEAAV9zmtJtin3Pr6IQzulqWmEQIEoXrUESYT80U
         fkTo29PW+kh9Q3jdcDeBJHtIrPFg8kzqkB5IqeMlcpxSKeA/+vabt5CGLW6cdoTMWzjD
         b7JI2oUh0t6kgUYBDEgTVliiRGlGx7DuEKG5V6fxLZHbD6LKRSMs7IRIkSUdyvOv//jY
         Jfzw==
X-Forwarded-Encrypted: i=1; AKwUvBypo2PPggkAAc+UUP7gxmSfIxGka1nQjNfMFkcah8GpN1q2D/i1W++R2tm4T3kkXzzpxRnIErMVkswUPu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt7qY8SP8U7l1AisWYHpUf5+dSm9zVhsl34BhvNFFKBcNskIPV
	70PWhyKxUUsTvPjuEHitIUfkAd/2pUeITfgHfGh5U3Uya2urb+iLQ9WcBrpHbJ4unED/FrQAS3H
	I/8m5qRfETycgYQ/kWdGQEMDGDVYQtkjSouZzEwREAGyq24x1DKnjQS07tX14GSFTw04=
X-Gm-Gg: AYBFou0ko2DFzBTiUjq8YYuKeb5d75MwGFPxytVxBbQXmZPIxdn0ATp3Szop/7bNCAW
	gtmpHqAv+uMuKtCIYKji+4Lyssqx0t1ixwxVAiYyl0yh33Ad8M2CrZDeDIzgOHSzogB70AFKnjq
	esNbk7uIHmNg1zmYLgHBk8LVobEm2cUA8Ytk1l8NQcSo5lfbMpbjM80etdXWwtasXtBgX5UlKKG
	5fRzIlm2wwLzkMmGRLCWSq7G9/BYt7HDkKFoUQx8ajHMxbBgAyI34thlvHsdIF5x/05zOl15xZO
	OjgTefQD4vNOfatehvRK42//mhjrVkhw+LmtjpzMjt4Pad2Z1koeIJ6VWuoA7pKb1W40nmElyKm
	BrCKEqSCS86dmwk/9itA3Zf9aoLvr/L9yHjMe60RUtn8INRgQ74d3Hqmbt3nZUnDEQZRKxX01Ro
	Ae06Q=
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525645ad.60.1793364216753;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
X-Received: by 2002:a17:902:e5c1:b0:2e8:1929:c8e4 with SMTP id d9443c01a7336-2eb36527d99mr22525265ad.60.1793364216294;
        Fri, 30 Oct 2026 05:43:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:02 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
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
Message-Id: <20261030-hawi-maili-camss-v3-2-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1461;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=O6JOHgjWCf6k0+eXloLMxj3S4Nm7SEUIMrYIjwRLIus=;
 b=3q6SA79to3LhfP25KLgv4CM/jRHI+Eaug863piJVxiwfuCDVLNdBFSp3qPp+LcZTmyL2pUt1c
 Wpi0ylH0f72AaZBoTsPa+f9i/u7hEkQPP2ONknjq1ttyu4rISfN1TDl
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: T84DtHltDoEcS0Zvi5winkxt1QKUQi6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX7zkrnd1LAF9N
 d3YkEvU5thoQqnVJkEPOKhdTiZI3I0NgOEJYOx75lVPvNrcOI/2FztccvkFS0Ekdq+keaty8KWm
 e0WzpHAIcQwRfCNi0nXwFgnNhWT3IN/OJ5RddMLz3f+b7C4qcchj94E75ez+J2U8pkAWstfrT1D
 g3NZxZSXSsQLxwH14HRaoreeGPWT7EUIz8QQ7DlqyRtuNi3eNiJ2E+P5OhK9TOGR9tsbgxlGo2p
 vcYcSEpYhRAr9uV8cEyQJ3mZ1zQvewe3QxdE+xCVKsX97x2AjvIsNWMLGUItkAJT98AN1p7HYUl
 Z6imJj+X+NNwuSA/N/3IpxxQPm/1P9uDK1dueSGLhZ3Bfqaoc8VANjvRpjKyFeBbPdFbWW2YXeF
 AZQ+S3YXs/aO/uf0HnmepeQ/jIyEUGCcPjehRIkkrUnl31mfwrh1BDg8aupLpidgFsu2uHxQ7Dj
 AyPUVTlTs0jycCVaKig==
X-Proofpoint-ORIG-GUID: T84DtHltDoEcS0Zvi5winkxt1QKUQi6a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+j3xoc73RDx6
 913zOD1M9YHIiuxRa+LGrt/uM2sBhundDkkFmyDw2P6suUqJeyJCoSqQ9e+jfa0Bf4oKOCvxBPD
 BUliACxitQGAJ24+1xiRXlImWyHZ1iY=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae490f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

