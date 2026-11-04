Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779865;
	b=eyStyQGL+F/7sGjnY2QNWDoWt8JjA2nTcyFkRsw8+vWlHGYpV0oLgg+ImVaXY6iX6Vpt
	 jWuvWEBjNL0/t8bt2xhKWuSyN2OU9psByOEw6kY0YImyyzoNQdJIF7d5HDoSeFrhnXqqW
	 CRMBIeocBnultvkbo4pDvUeoKyQIwRHj7qAFRujpX8hgXQO9x0UevrZZOwkQ0FpKupfjn
	 0qpHA4AM0PiM1C9WRmBx0+5l39+jsfU2ud+LM2Uniu7jjYVVGxn6UgAcj8KepCq1qWlIh
	 gbPvSp4bqcpFhQPBZ0rxeQbdsRKfo9SJBbY/cNAyJDMMpmBvbydGwtsO2tYE6en1TNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
	b=YCd7ijSq+2diDnaoNsCH2Njm9VZ+3HRzt7rmmvpmmIqe72wFbcsFhSrHYizyUt7Dpioh
	 tebajeFHG0G4LqsLIb1RMnlBqsPWAy6FumZBNTNwXBaCEtxTJX8xOVlpE3oup4ZnmOw2F
	 idVJWhSR4ZqejEOQW2OYMmJzSieJFRPghNkoQTr78aMTh1tO/Co7meCfmEr1nikma8oTm
	 NPQjVCOrG7ybopZInbH5CGhzzQjPj4f9ArCu61U2yhL935V2IHPAYTxAjLMYcSEeeIboA
	 SBmA55lGcgdkn1bx7uk1I5np8p4+She62ytlvtMxlykSS7/xbtUE8LFozdf0OyQtxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhFvWHcZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1OYHK9c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhFvWHcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d1OYHK9c
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47GHC4809361
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=NhFvWHcZj6SlwuKd
	JvfrIHkJvs/z6RjfeDlllrPeTIs//bsd0MsKf8wOX3Hlk1iNWZOOR5bxMgPf9z7B
	TcrJVHeyrxt2fgdBcQGV95LtV0DKRYNu+RRF3MEuTiZcFXzCQYFwVws/kJE1jBRf
	Rd5SJ//knkFuC3DTF91/a4oJSOmCphZcYXcThugYmjx0avQSOpeM/Uxq5KxSBH5/
	vVEvXgvEE08W/qvlSq9EeK1gJudeAMw9RS3qICuZ3+0NRwsp3XIgDQXJ7IA8fI2u
	yAE6u2Z5zpoNiQ9QWkw61jnFAzIbQkwuG36a1gB0cPcHBLFuLywZKqQ6I2HLYcgt
	ZEJFJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbcrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:11:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso453130a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779863; x=1794384663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=d1OYHK9c0qQovHNmao+SZRDANZipeyjgk55muT+2wT0Viqm9f0L0q2spVerit4wg7n
         BXPOhHrQtRCzzOW/E35dFxZ/Y8OC0B18yj10DaOChFoZsUfSwtBaiCsecZbKYoU7a0SL
         9+ALk5Rj4bBpuDQfmcYNm2aWB3GhCCA2OWjpkyxL5pPGlMNDg6PwDR8ivXr6glw9DljS
         tcHr9U7xRTxEWL3ercX8GCY4ieZVe/VGHw5W7j3U1yE3CbK6F0q0u4PyFF/GJ+WM7TzO
         OKWSLdbE2iDOQKoJ0wiGjA2FzFmj5ef+y5wcVcY5l/mM2Qy/nliby3e9qU3pxlxqPKVh
         Dx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779863; x=1794384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=G84R807xBtX0q+a49aAFDPi0BjJIDS/SXjJ1oyzRncjJZVZjf1iQmWFb3SMnfKlka5
         rEvF+Rpur70Qd0Bvw91RxqlCCS5gps4zupCRp58AoQVkbkViJvjCPCk5mkJ6rD3bm+nt
         Cn6wGx/6bIdDJzpJXqTkCwVS9Q11za3P3gBdkJ6FpNkbTdPCQdzYCmjIaBNX56oXplvI
         tXDbfn7XT0Aj37bmn4Yo44la+JEOXxm7GuTwp++e2VwoRrZngmOS+NoSzqztDkGDMtxD
         qf8YFIOjQKNl6kxSn1Qqr97GDu81sahpE9owWk+SCFFL2vLKbWSMI1WBGhrdflVBDN3e
         cvgg==
X-Gm-Message-State: APuU4Z88dAPICHTsawd93Y5ArAhNNEjrpPr95l3RIaJaiiyFQuGoAYiL
	07vOcA2RyulrvQmTYEEws5omlL2yAscrG6uysx7Y7NwHyFC50eoaCNbx+eCNuSRqlkIc7NlvPVe
	czZp1ftHEB0fsFce5UoooEX7TZugDbLJImKGNnBjrWM10HTavNnHtBP9x/xS3/dWKPMs=
X-Gm-Gg: AYBFou3WJcTzam/TZHteAOapL1+lRpmbCXQSwco2mvRJLAWQbJRm+8mF6vPE3cRY3uC
	wuRIMXlT0fMywfxYhi4aPBOT8q8RtvpBzdfvUQw/3SDSEj2Pv4DtxkawoiF1oAz9naNJOQ4DP80
	qlfVUAvPLkf7tWNG39+10J0tEf0dp2GXFQ2v0ihzGJYM7+oQ5i1yAx1/xxnHrz/5wMaeVj0bS05
	OvXBwbNouJOZGEmVO/UzdsANrLjiFi6wNiWgOGYL/BY/D8BPPzhkE1J2h/mOhJ+wDLgU9CzRPsa
	il8HM7NEcwLdzoZb6E0qSkg7pRpU6kxovZn1QsSNU3br5t+HKTLig0+35Cct6ydHCffWFMWrzL4
	SAUghVAy14Qy4WWWcFDuw35GbP0o8R0Nm58zy3XqN/9mnJjddDAQ2utdnojaZX2J+EKoCbl7lwa
	+1UmZ2e9qs6A==
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683452a91.36.1793779862644;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683435a91.36.1793779862158;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:01 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:47 +0530
Subject: [PATCH v4 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
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
Message-Id: <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
In-Reply-To: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1446;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
 b=3GMekl2J1cqQKWD80nY5cUazbaoIRGsNILCjoSkD8xTX4crMZswNM+k2jKFr8kY6vEPA9fD+A
 2NxAWmSdpjFAaOknzezzUyWmmgnkozXO01JCWdexBNZUv4ZRcMJufqx
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX82JrF/OZ6enF
 04kaB+IcIW5iaMh6nMqoxTNu9CHwVxBZ0vn+BFdX+akUR4RBqCYShfRNCTifLLYsaWUw94O9fwR
 TkeupDGX1k23jVec8n9NZtPLq281pBJe7LJZK1RiRBsblOUyhHeyRmEph8JlCofjakurlIZTGxT
 J+f11efm15kI9PiAeS3zpxzM2xwfWqHZ2BCJIQ9T8mIvFNymnciaAnhvrD96J+wLzDD7Uh0Dp9K
 opPoUonVB6oeF+cZGr+Zgap8lrzExHKEVPzSVS7gNZ1BzQcc37JFzZkD4lccfoldYlwBvxQWL0k
 k+JQW82rZWI7aN4IjbSDdP9GmrSge+GL1oAUQcerQCXm2uDD8heKepQEIJo9jfv9CkTSBIHezXi
 PJPpsr3GbjzBItwQODCVwCTOhstk+D/0E3vmqZ99yuixHuOg7y+98/ud0DrkSHbuTUf5TWRNchX
 rpapzet9M5ZT0ny2C5w==
X-Proofpoint-GUID: lsuUx1bbDVElgybICdeMKtH6lghfUH2L
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeae897 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=P5neLcC-yKLQ9RCq2NIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6dTRpCT6zg96
 TPFXxp39E0VuqJkW/Im8M2ZA/1SGoiqRcXzdetG4fSPyAKZ2GEAk3vVIlT6vsLfG+da8P58ERP/
 VinAtu6S3iX9oNVFus1431nHatV/Vl0=
X-Proofpoint-ORIG-GUID: lsuUx1bbDVElgybICdeMKtH6lghfUH2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
panel V2 regulator binding. The panel controller MCU is powered from an
external power rail, which has to be supplied before any I2C
communication can take place.

The property is optional so that existing device trees which do not
describe the supply remain valid.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..3e2cbcad6490 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -55,6 +58,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1

