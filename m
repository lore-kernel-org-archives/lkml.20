Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965073B6C09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461652; cv=none; b=G8C/dyExgXNm6WfNuWHXIYIEUuSbNfGm2dZR3i1sVRm8OgmIlUIAygciZnm0iJUyceHT0gwlZZguwOMgJzZzy4lcO3qXDOBY9EYRYof1LfMzrMZ05GcfJf46UxPRNItNArn5lLHbqagoe/2eFFowh8jnW+lxUw2/bHKEvebMtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461652; c=relaxed/simple;
	bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPd5DHr8Uu6cPtUZT0kCOqym+rKWwyOcfXrC6zBGpo6f97ik1O6mdZbP2VrVtkDGxWnENNZUYUk/WUUQgRscQrEUCsG4b0up2MEyE9G2ABhI0iOx2KjLyJ7JJGw+lpiER2blPSlfJcTXzkjpSicKvYepi4TgWUKSU9ftYvR40IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqyiFDsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IM8krRj2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqyiFDsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IM8krRj2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3d6V820134
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=; b=WqyiFDsb1eWDZKId
	NODY7STdeeFa9Dzz5GOt/I6NOzR88CxjuimoDCw/cOwtphA7NyMRmQ0d+YoNAHU/
	aoH4rspWjkNmuxUgaXiiTnW+2KxHI519tqNvxIK02z+5dwzVTTcVKr40kT/gzGbY
	2XwCq9QNWHj7VHJaSb7BT2kM1QaDgAaCecy4yUPUWmd1xk49R+tAl8p2kU7o0mEC
	Ug7xOhHWVb2kmknb0mHNYlEC2RlpCRCaRdJgFgjwQLM4Y/OQL6+RigIcStGqyJx7
	V8nSt/NJ9qNkYx3+C2Fkwj41W3epOf6FgC6qZ6j+P27MTA3CTkivsRCRKSiu04eE
	7uCIUg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka32x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so160653a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461644; x=1789066444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=IM8krRj2ST59du7pn6Qgg7K9wsxwSqjOPEKpkxIoFxa7o6y39Pfl27toQSEfeAXeeB
         UcTeM/sWR68vARKrQZ6fhrAO9zPKVvsxxoB81ETgZ7sVSciLRkdHpEeFKQDjd9rC1p93
         D94EAIJDB6cIJeQu5VKEwRAl+1LYxdpCxpPcR0VpzgmoYihSGsNapUom2dJ+4F58KB7m
         Um5f0hmJ+EKiliOU2q0T9OP7BBYYAzMtvjEKOXCYH3vAgFD7RAAgqDDnSyduvHWjU16r
         OFHj6dwCoOYApO5TFuLqbyEcUMhK8KkonvYZ7V1oV4yIkRrTDKraS1kFYbRQ8LvslAYT
         TTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461644; x=1789066444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=Ssm6kIDWaREPmjrNr0LvxWZH3y3Af/c7f/KgZ8MteOtPVnzLdPkugD0ANT/dB6jZmI
         p0W4K8xABhFoZs7UrWGXkVevo+TLhSH4NRp+CJXNsiez4tvcqReN6DSxX9s9tjtL/sOD
         XozFlhGVmTscDH4ji/2pc7wmY2CMgGmQEkmx8eX4LCQk01XfKUBUDE2ji/cTbXbUnaBJ
         Ty4roF7Y2+qSnQw/1VgleIx2kL2ffyewHKPTWWQfw8/Kpki0NkI0v3jYFTWbft2h2vW3
         uLeiZjKgN5WVxGCQcElpbydL6CLVp6hhMBTcUH1+dIJW9H2c7+VjdXGQbGMLRnTU7Ue6
         /vlA==
X-Forwarded-Encrypted: i=1; AKwUvBwrH9F7Fq5YcA43Qy4d+v2pn2Qh6ADe6YaG030bGjnMIJjzBFs9MSxWSkfMWPrJLQVMbYllsmj2LRt3fsc=@vger.kernel.org
X-Gm-Message-State: AFuF++n3+8bZLJ0WH+P2F6PNXclKcBnoMbeORzB/HDpIBS+yHt+UhOdv
	9eF6AJJVLi5QW/9VFWemEJqVfpCpRBF53t0PodwKcl60fEOPcjs8dV5z0VMwa+Tj0tlQ9Toqn/+
	kWs6Qn8sfe4wx23KlTinpLqXSBXyV4xkKjHSA1dXaO7O7CMF+JH+LLGVdhp3Puyv2Vvk=
X-Gm-Gg: AYBFou2mp403x6ysJ5oRDckRGSA5T75CMGpOLz6TiL8YHqfnuk0yS0GVs4/zfBme9z/
	ydgYKUSlqQB40CVVjed6w2s++dhXxoEs9rcxaDx32p0kqPuHkr2GBfnEgcAVLHrAs5ODFzXFQoV
	Q5E3l7348VjawIABAMFvz7z53RNo4CgQDKBEbmKCQJMAtrhanvtu/D895W2m/ZGDuT5/oAD+kr2
	mT6Gdcp/R1JzozOptZ7Oy8olxEEzdX2Xd8RsCpVo7u065iHnJnLam0vqmTfONzXLWifCrYxkJiY
	e0Ub41fxyE3fWOpEk4GxRF0WeXkY2Q0ycfByLYQVN1DfWQ6ovKq90G+otxynMuyMo3WNZzWImk2
	LGm2EN/lo5yAPamdZdz23R/Uv2fQhUA==
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr682060a91.11.1788461644260;
        Thu, 03 Sep 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr681984a91.11.1788461643675;
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:43 +0530
Subject: [PATCH net-next 1/9] dt-bindings: net: ti,dp83867: add supply
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1977;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
 b=9YV5GbivqWa07EmRXOblUJxRz9P53VISN5Z/yvnsGCNVx+EjFrU1+3n4+/WNFMnmaAwQEwuHW
 8v25iuStJetBoprE3T28uAmO9+1AnmsH0V42lDK1YK09J+0UkP6t/rF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: IBh5oqOgixrzi1dgsc6bH123Mzaqfnf-
X-Proofpoint-ORIG-GUID: IBh5oqOgixrzi1dgsc6bH123Mzaqfnf-
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c24d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX7NWbnSA5Tkw5
 nNTARSvgQZHI1yYetbRh0gHF63CEu6hK4hSJFSciDIhFF5Cwr3YSUP5vJ5GqXcjtve1OwlYmk1i
 HT4c9gQPyGEt+1Zll4FZlR6IU4VaXzvV1mtke+8m0kgDkn/2SZxiPw90dKbAK9jNifuzcGEFCxr
 B/fuoDY/xj0yIAKpI9fqGQSpi1bNtVr7AXW2FD6JMGC87LJ+Ye8zS1gbh9EmC3MF8AXXDjp9r3f
 0Q5P4mXl+5JnoApRVLewMeV7pI9gPM/BUqvA2E2YYljl8G75R9h/JIH4xcmZnN7OS9vvHp68fB5
 ocqX56ILa6yxlEgT6RPg8Mz0rjXk2m3+m4faO0APA0buhXsSAw8yTV+EZ/fyEYcJPJJoBQagIM3
 zc5VloKxo9JGhycDLS1vGqNevr4YJv4r0/lKVIJV4ceUVw1BmlSf4ru6IuDBx/rsm1XrFnmtDOZ
 cJMKYvhqJPg1DNU3TVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX3eOxaJEezhaF
 tXxDTeGhLNcx3I9yECTdI2wwMgMgGmao5h3cyrZrx7gR4WUqZa/ROOHCQ4a64BFMDKuJaHG2JrP
 ZpePruqMzc07Uf0EVTqhvseUp7KeRnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030165

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe51260b767b0a1b8b7eaf974a9af9..e78f08ded3d0d449ab75bf33d814fd49587f8387 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1

