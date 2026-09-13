Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87667348C4B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302782; cv=none; b=ojS9HU4DCztc7I1WD2A7YbV2haK05Nom6DElKPaW0RosoOx70j2EbN60bV75ZgbeI9RtkG4ekE3v7YerMxZr44s6ShE+cGIZykj0J57hVP9nvkJJp1jdKaZy7XhRynjFtksbLWDbQgbVWfVVHQLyPbsM3PctSaY4cS8PBSUlLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302782; c=relaxed/simple;
	bh=wwlTQcPzs2frrHknWoo6bb9wxA0MjIK1jG08afo8UU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZmrniR64/X8XuJJxSBJ9Vhs8RcaYA+uDnst06XAe2HG7slrAz8wfBZK8cynaqOxjISWYnQOi8s7ZYW3YuVvkfkgXK/IUs0blJ7Y/6/vEeuTktXU5fTBXKgE04PiJnoNAQdRqziKNFGumY2UQrFkhuZY65SvKVrwrH1KGm7wBL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptoIEYc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CpzwtOtJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptoIEYc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CpzwtOtJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAURao1005564
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5
	vCQ4NOu0=; b=ptoIEYc8lKy8y2QRKhUWP35dclY9m9UbCFlai3AzPjicmpj+7r0
	y0ktnyGz6g9aENFJemMsEUz7VhucT7WyPkfeC7K2pKXazaOUf/k+DWKNMMw7YySp
	2WvllfqJmSqb8d+qLyAab5J17sKaQZGXu2cX2fZPg8NCm+3EXV08/qYyQUHQbno4
	snHs+PhFlOV5isOl0/2hfqwdmEOtzhDyODvDGItfrrjF9SQGvxyEzy3uLOdbiAnO
	QSYTwCIrj5shipz3kOORPu8C4r9LUQGmAiTAYuAIHBZ41GlgyaNWTIslYZLlRQ8e
	A/+qrYifzy32ipNJt3N+K8EtUF10CGx1xKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd38n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:32:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso256591685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302779; x=1789907579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5vCQ4NOu0=;
        b=CpzwtOtJn/b0fwrrCd4HWEKwmWtvouc5RC8nWScKDtdMhufZqFHT9ZZTiJS3d0sI4b
         6XYanVovHR3RDgzpEDvz/srezFbJS+ANAky7rmpALa/otDPzpJT6+4Mffe4Txy5uWppP
         sfiMHh0b33yNjwvqFgXsEiuxU1ZfDozwp6bSuJfAv3LRpBGVL5miFMzcV2OAxV3Z45Xb
         r256mbvhLF8EuLi+IMLS+FgvH+7garujYlSpA6pO3UKN6GUTAkmvUvquMP7ya9WjhUw/
         7jF5IAZPP1bB1rT+vtxtGIBzLnCDZZeP5Z5/6uyANUi7JBi/moGEyjEfU3ZRZcUHgtbp
         EyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302779; x=1789907579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FVSrZSbeNyVRI9EfrOQ8L+0C/xAEcmVpw5vCQ4NOu0=;
        b=lfXrc3zGi3L0Q8Tef7kt/EVK0rynxvctrSD8GGRh449VD/ylk0mYx/MA5jzNrjGqaQ
         bIjhgIZrQ2mDsUPfB9fgj6LiQMRfgTKdDdSy0NhbNAvdWB4tETQ5PFtnQ9rJKuK1rAFh
         PLsomQtpaHmFz7+fTfB4+6/2NeGwOqCudqnE1HOaBtRG1TLfC43dTaiqQQjbBp2l6K3q
         Je0n/SrtMqiDnFqDlX0ofDZ/7lTmSRxO3KTqsGBFlH2/WCAPARYd2fcDL2LMUNzGs0tf
         92INm/6xbTnJz72pySOUV+DEEYMkaKRF4AG1QTDKQ/VYiBmRuUstw1k74efVHiyn6feO
         zP7g==
X-Forwarded-Encrypted: i=1; AKwUvBy7Ie9TdjpJlHtvUuPeY7Igi58f67NxcOPbr8eHn1aGj3W34988m4dOyzKQrhu4zW+qOcaSf6FUYQ6lXTg=@vger.kernel.org
X-Gm-Message-State: AFuF++nVAC4Nwx3g85ou43p4HmlQmSH12iij0ZkI13ksHFxu+iQp7jLr
	8v8gaA8y/EJiKl80U+0Ixm0joTtl76+rC25FttLn3btuPjSa2mFbsNAjNwVia5lpZZ3p92x33sS
	udR+VjLcGBT4XxK5pFmOBz5SY8GH6f514KJj0WhDtBhusKCcyOt4hCCwKYANz2sH3kiQ=
X-Gm-Gg: AYBFou0UAn2JvNE4c0CA2LogFcxcB6QX7DnON1k2bma8O2Bpspti1ysDYVvmKVTUnB3
	s/VqzNl8zjs/HcoCVQxRf/F4E7AMjFqog9xX+k8aggvDuDoyx17tM2GtorwAfR/1wSiq1x3Lu+1
	5Pqo15ihyc9HHAsnCWImjDrYyToG1a9Psc/oIzsSYC9VHeP64NK8Hz7LDUEyWAifA8Plqm+jKDt
	vvr6j9cG5qiqWjxoNluzSySQXjbLUMCk/bpVF/WL+Mj66n/lZTHdfuwBppus9voNoLB2QpwgmmC
	yXL2dx1CR3mp2GEEvz5ExsplR+T3sjt16Bq8ztcWJJd8zums2mOeJOkOkKWyDu6eCxyu8DrMQdP
	+BWkGO+C8//rIyoo=
X-Received: by 2002:a05:620a:2951:b0:939:d6f3:1268 with SMTP id af79cd13be357-939ea135b79mr1915534085a.16.1789302778710;
        Sun, 13 Sep 2026 05:32:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:d6f3:1268 with SMTP id af79cd13be357-939ea135b79mr1915530085a.16.1789302778211;
        Sun, 13 Sep 2026 05:32:58 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm296862815e9.2.2026.09.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Devarsh Thakkar <devarsht@ti.com>, "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:53 +0200
Message-ID: <20260913123252.100085-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22575; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wwlTQcPzs2frrHknWoo6bb9wxA0MjIK1jG08afo8UU4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppf00l4dZQfHIMWsXISWOhadvBqqfHIX3/94s
 yvEr8XlTG6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX9AAKCRDBN2bmhouD
 13rWD/0U4ljiJDteSBU0H8yyud2cskG7YAzrc5o7ws/lDF3KLeMk5iRdtltV/EQJLWv3bWjgPAE
 z7emnFYoelUvGVc5qnasCReJ3oCrTlKIHg/pZvZodsq/FuU1P5ebg72dIFRf1Wy+R9PcznxQYBn
 thraY5MqwVTBscgCVXPpaC45I6xcVwqgMZQuMh1bYfGbLwtmvKVlqWZbk7Y2UdxZ9q9tNJlBo7D
 u6DqcPFDskmRxyUqT/qHF71mMYG1tblvnEUTFK4xUtmjHMT3qgnUyOiTdEVd0kZHwcrsELA9sqX
 dq5K1GMf339JBNURkiq/JLgHKMnoOA8cMxICY3yi7yi3yWC5bkaeedWMyOmy4Dn5w+p9H6synlX
 bWqhfeCwjdmuqC1qHfTTbL1fHQ0D570coYdEIct5fCWlUVG4aoQsG9IVPtRCFJ525LB29TMA/Gd
 2sEie5SD3az3FUi5W0Aso/DBCOk5EvDJm1DszrcdNLzj0JdJAZz/iOmSdG04oJAtBMs+0wASlgB
 HW/uqZR5MDz6HYas6Q8FXmkL25Bg030ncnTLTGWQXD7LeuA6blE6k0yXnmM4Ciug3JL0jFQupKA
 FF+Tn+YbnlMBmdsx8ZUMQ8PPT3bqwanWYvXpfEBbNQ8s3ama0bJgVqe5w0K2xNS3eZXefWoitwU kbLDZaEX4R6AKNQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa697fb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=C4CHKQPVujXnZafBmVMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX84FzqhQlLgo6
 fWip4+DBgIMpQ7AsqgEPXfchkAxsPlqUwN5fyoUzeI4M7VniSOkO2x6JiO1MPebg4tBzKZAEtYq
 RAL3BGIh9CSRRTBP3adIZrDv2D5tLoS2vQh2ek4HbXSvrmXQl1M5Y+TfqVgmmQluyYlobUpoQDP
 8RF6pz2r6SSh8pw25tTc4WnJKhfLZO8AuyOGbWLOnSDoaxdmWEgU16qDwrLp2s2oPd7wVjZM7Lz
 jldKIBSWuwVBsukidVQifQtSPpt9iS6+poP2Ds5Pn6kU8MyuxAj38Z4/vMoFViGM6VRTyS2xaXu
 xPMNuospGy0ZYwAJPTCYir/BQXdenrFAHDOB0WqSbwLY4LfhSaXyYccbIPScte9i5STBuSv0DtZ
 csxzvzzD3Y51Upfa/IYZ6/psELVR/aKW8KOy2/DJ1nYjZvC/cZZX5A+Yqpvm/Xt9IjAmCjka7mn
 GdZ87q3+CUpY0L9Ezlw==
X-Proofpoint-ORIG-GUID: CUbYneHRDhvxhtuYCE6HLldWuUKeF7Gg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/nHgbo84srJC
 U4TrJhJAmZHsfaCWeHui4tptew1gf0jEzRs22ktpkslQFw88gD7oRp/0CC7TjJv2TsRicHN9EWE
 Vk8afXCAlhDBzd+LixPPBWOeYVTYZ2g=
X-Proofpoint-GUID: CUbYneHRDhvxhtuYCE6HLldWuUKeF7Gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/arm,mali-c55.yaml          |  2 +-
 .../devicetree/bindings/media/atmel,isc.yaml  | 14 ++---
 .../bindings/media/brcm,bcm2835-unicam.yaml   | 10 ++--
 .../bindings/media/cdns,csi2rx.yaml           | 58 +++++++++----------
 .../bindings/media/i2c/ovti,ov2680.yaml       | 26 ++++-----
 .../bindings/media/i2c/ovti,ov2732.yaml       |  6 +-
 .../bindings/media/img,e5010-jpeg-enc.yaml    | 22 +++----
 .../bindings/media/microchip,csi2dc.yaml      | 52 ++++++++---------
 .../bindings/media/microchip,xisc.yaml        | 14 ++---
 .../bindings/media/qcom,x1e80100-camss.yaml   | 26 ++++-----
 .../bindings/media/raspberrypi,pispbe.yaml    | 10 ++--
 .../bindings/media/samsung,fimc.yaml          | 14 ++---
 .../bindings/media/st,stm32-dcmi.yaml         | 16 ++---
 .../bindings/media/st,stm32-dcmipp.yaml       | 14 ++---
 .../devicetree/bindings/media/ti,cal.yaml     | 48 +++++++--------
 15 files changed, 166 insertions(+), 166 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
index fc4fcd19922a..39af7ffc70b4 100644
--- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -79,7 +79,7 @@ examples:
 
       port {
         isp_in: endpoint {
-            remote-endpoint = <&csi2_rx_out>;
+          remote-endpoint = <&csi2_rx_out>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/media/atmel,isc.yaml b/Documentation/devicetree/bindings/media/atmel,isc.yaml
index dc8aba698d78..5c84f372e81a 100644
--- a/Documentation/devicetree/bindings/media/atmel,isc.yaml
+++ b/Documentation/devicetree/bindings/media/atmel,isc.yaml
@@ -102,12 +102,12 @@ examples:
         clock-output-names = "isc-mck";
 
         port {
-                isc_0: endpoint {
-                       remote-endpoint = <&ov7740_0>;
-                       hsync-active = <1>;
-                       vsync-active = <0>;
-                       pclk-sample = <1>;
-                       bus-width = <8>;
-                };
+            isc_0: endpoint {
+                remote-endpoint = <&ov7740_0>;
+                hsync-active = <1>;
+                vsync-active = <0>;
+                pclk-sample = <1>;
+                bus-width = <8>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
index 5fb5d60f069a..bfec4daccd0a 100644
--- a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
+++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
@@ -117,11 +117,11 @@ examples:
         power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
         brcm,num-data-lanes = <2>;
         port {
-                csi1_ep: endpoint {
-                        remote-endpoint = <&imx219_0>;
-                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
-                        data-lanes = <1 2>;
-                };
+            csi1_ep: endpoint {
+                remote-endpoint = <&imx219_0>;
+                bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                data-lanes = <1 2>;
+            };
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
index 6ed9a5621064..cbc6249e8803 100644
--- a/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
+++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.yaml
@@ -160,50 +160,50 @@ examples:
         phy-names = "dphy";
 
         ports {
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                port@0 {
-                    reg = <0>;
+            port@0 {
+                reg = <0>;
 
-                    csi2rx_in_sensor: endpoint {
-                        remote-endpoint = <&sensor_out_csi2rx>;
-                        clock-lanes = <0>;
-                        data-lanes = <1 2>;
-                    };
+                csi2rx_in_sensor: endpoint {
+                    remote-endpoint = <&sensor_out_csi2rx>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
                 };
+            };
 
-                port@1 {
-                    reg = <1>;
+            port@1 {
+                reg = <1>;
 
-                    csi2rx_out_grabber0: endpoint {
-                        remote-endpoint = <&grabber0_in_csi2rx>;
-                    };
+                csi2rx_out_grabber0: endpoint {
+                    remote-endpoint = <&grabber0_in_csi2rx>;
                 };
+            };
 
-                port@2 {
-                    reg = <2>;
+            port@2 {
+                reg = <2>;
 
-                    csi2rx_out_grabber1: endpoint {
-                        remote-endpoint = <&grabber1_in_csi2rx>;
-                    };
+                csi2rx_out_grabber1: endpoint {
+                    remote-endpoint = <&grabber1_in_csi2rx>;
                 };
+            };
 
-                port@3 {
-                    reg = <3>;
+            port@3 {
+                reg = <3>;
 
-                    csi2rx_out_grabber2: endpoint {
-                        remote-endpoint = <&grabber2_in_csi2rx>;
-                    };
+                csi2rx_out_grabber2: endpoint {
+                    remote-endpoint = <&grabber2_in_csi2rx>;
                 };
+            };
 
-                port@4 {
-                    reg = <4>;
+            port@4 {
+                reg = <4>;
 
-                    csi2rx_out_grabber3: endpoint {
-                        remote-endpoint = <&grabber3_in_csi2rx>;
-                    };
+                csi2rx_out_grabber3: endpoint {
+                    remote-endpoint = <&grabber3_in_csi2rx>;
                 };
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index 634d3b821b8c..83f84a7828bf 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -90,22 +90,22 @@ examples:
         #size-cells = <0>;
 
         ov2680: camera-sensor@36 {
-                compatible = "ovti,ov2680";
-                reg = <0x36>;
-                clocks = <&osc>;
-                clock-names = "xvclk";
-                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+            compatible = "ovti,ov2680";
+            reg = <0x36>;
+            clocks = <&osc>;
+            clock-names = "xvclk";
+            reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 
-                DOVDD-supply = <&sw2_reg>;
-                DVDD-supply = <&sw2_reg>;
-                AVDD-supply = <&reg_peri_3p15v>;
+            DOVDD-supply = <&sw2_reg>;
+            DVDD-supply = <&sw2_reg>;
+            AVDD-supply = <&reg_peri_3p15v>;
 
-                port {
-                        ov2680_to_mipi: endpoint {
-                                remote-endpoint = <&mipi_from_sensor>;
-                                link-frequencies = /bits/ 64 <330000000>;
-                        };
+            port {
+                ov2680_to_mipi: endpoint {
+                    remote-endpoint = <&mipi_from_sensor>;
+                    link-frequencies = /bits/ 64 <330000000>;
                 };
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
index 814fc568c550..b6b5145802e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -94,9 +94,9 @@ examples:
 
             port {
                 camera_out: endpoint {
-                  data-lanes = <1 2>;
-                  link-frequencies = /bits/ 64 <360000000>;
-                  remote-endpoint = <&mipi_in_camera>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&mipi_in_camera>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
index 085020cb9e61..b6f80098beb7 100644
--- a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
+++ b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
@@ -61,15 +61,15 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
-      jpeg-encoder@fd20000 {
-          compatible = "img,e5010-jpeg-enc";
-          reg = <0x00 0xfd20000 0x00 0x100>,
-                <0x00 0xfd20200 0x00 0x200>;
-          reg-names = "core", "mmu";
-          clocks = <&k3_clks 201 0>;
-          power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
-          interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-      };
+        #address-cells = <2>;
+        #size-cells = <2>;
+        jpeg-encoder@fd20000 {
+            compatible = "img,e5010-jpeg-enc";
+            reg = <0x00 0xfd20000 0x00 0x100>,
+                  <0x00 0xfd20200 0x00 0x200>;
+            reg-names = "core", "mmu";
+            clocks = <&k3_clks 201 0>;
+            power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
index b3a345fc6464..d06987680ed8 100644
--- a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
@@ -149,22 +149,22 @@ examples:
         clock-names = "pclk", "scck";
 
         ports {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               port@0 {
-                       reg = <0>; /* must be 0, first child port */
-                       csi2dc_in: endpoint { /* input from IDI interface */
-                               bus-type = <4>; /* MIPI CSI2 D-PHY */
-                               remote-endpoint = <&csi2host_out>;
-                       };
-               };
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>; /* must be 0, first child port */
+                csi2dc_in: endpoint { /* input from IDI interface */
+                    bus-type = <4>; /* MIPI CSI2 D-PHY */
+                    remote-endpoint = <&csi2host_out>;
+                };
+            };
 
-               port@1 {
-                       reg = <1>; /* must be 1, second child port */
-                       csi2dc_out: endpoint {
-                               remote-endpoint = <&xisc_in>; /* output to sensor controller */
-                       };
-               };
+            port@1 {
+                reg = <1>; /* must be 1, second child port */
+                csi2dc_out: endpoint {
+                    remote-endpoint = <&xisc_in>; /* output to sensor controller */
+                };
+            };
         };
     };
 
@@ -181,18 +181,18 @@ examples:
         dma-names = "rx";
 
         ports {
-               #address-cells = <1>;
-               #size-cells = <0>;
-               port@0 {
-                       reg = <0>; /* must be 0, first child port */
-                       csi2dc_input: endpoint { /* input from IDI interface */
-                               remote-endpoint = <&csi2host_out>;
-                       };
-               };
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>; /* must be 0, first child port */
+                csi2dc_input: endpoint { /* input from IDI interface */
+                    remote-endpoint = <&csi2host_out>;
+                };
+            };
 
-               port@1 {
-                       reg = <1>;
-               };
+            port@1 {
+                reg = <1>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
index 25f5f79d40ce..6a9e56c486c2 100644
--- a/Documentation/devicetree/bindings/media/microchip,xisc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -118,12 +118,12 @@ examples:
         clock-output-names = "isc-mck";
 
         port {
-                xisc_in: endpoint {
-                       bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
-                       remote-endpoint = <&csi2dc_out>;
-                       hsync-active = <1>;
-                       vsync-active = <1>;
-                       bus-width = <12>;
-                };
+            xisc_in: endpoint {
+                bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                remote-endpoint = <&csi2dc_out>;
+                hsync-active = <1>;
+                vsync-active = <1>;
+                bus-width = <12>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b..bdf03a944fd7 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -289,19 +289,19 @@ examples:
                           "vfe_lite_cphy_rx",
                           "vfe_lite_csid";
 
-           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 
             interrupt-names = "csid0",
                               "csid1",
diff --git a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
index 5c0f2f7b1d95..36fde927382a 100644
--- a/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
+++ b/Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
@@ -54,10 +54,10 @@ examples:
         #size-cells = <2>;
 
         isp@880000 {
-             compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
-             reg = <0x10 0x00880000 0x0 0x4000>;
-             interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-             clocks = <&firmware_clocks 7>;
-             iommus = <&iommu2>;
+            compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
+            reg = <0x10 0x00880000 0x0 0x4000>;
+            interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&firmware_clocks 7>;
+            iommus = <&iommu2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/media/samsung,fimc.yaml b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
index 1bfba84f8854..1329d4ee0705 100644
--- a/Documentation/devicetree/bindings/media/samsung,fimc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
@@ -188,13 +188,13 @@ examples:
         /* ... CSIS 1 */
 
         fimc-lite@b90000 {
-              compatible = "samsung,exynos4212-fimc-lite";
-              reg = <0xb90000 0x1000>;
-              interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
-              power-domains = <&pd_isp>;
-              clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
-              clock-names = "flite";
-              iommus = <&sysmmu_fimc_lite0>;
+            compatible = "samsung,exynos4212-fimc-lite";
+            reg = <0xb90000 0x1000>;
+            interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+            power-domains = <&pd_isp>;
+            clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
+            clock-names = "flite";
+            iommus = <&sysmmu_fimc_lite0>;
         };
 
         /* ... FIMC-LITE 1 */
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 7c2ddd27780f..cb0116176c3f 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -120,14 +120,14 @@ examples:
         dma-names = "tx";
 
         port {
-             dcmi_0: endpoint {
-                   remote-endpoint = <&ov5640_0>;
-                   bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
-                   bus-width = <8>;
-                   hsync-active = <0>;
-                   vsync-active = <0>;
-                   pclk-sample = <1>;
-             };
+            dcmi_0: endpoint {
+                remote-endpoint = <&ov5640_0>;
+                bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+                bus-width = <8>;
+                hsync-active = <0>;
+                vsync-active = <0>;
+                pclk-sample = <1>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 162a0c526d5d..0bf7c674dd97 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -120,13 +120,13 @@ examples:
         clocks = <&rcc DCMIPP_K>;
 
         port {
-             endpoint {
-                   remote-endpoint = <&mipid02_2>;
-                   bus-width = <8>;
-                   hsync-active = <0>;
-                   vsync-active = <0>;
-                   pclk-sample = <0>;
-             };
+            endpoint {
+                remote-endpoint = <&mipid02_2>;
+                bus-width = <8>;
+                hsync-active = <0>;
+                vsync-active = <0>;
+                pclk-sample = <0>;
+            };
         };
     };
 
diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index f1a940a110d2..c223b4f2d75a 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -136,17 +136,17 @@ examples:
         ti,camerrx-control = <&scm_conf 0xE94>;
 
         ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-              csi2_0: port@0 {
-                    reg = <0>;
-                    csi2_phy0: endpoint {
-                           remote-endpoint = <&csi2_cam0>;
-                           clock-lanes = <0>;
-                           data-lanes = <1 2>;
-                    };
-              };
+            csi2_0: port@0 {
+                reg = <0>;
+                csi2_phy0: endpoint {
+                    remote-endpoint = <&csi2_cam0>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
         };
     };
 
@@ -156,21 +156,21 @@ examples:
         #size-cells = <0>;
 
         camera-sensor@3c {
-               compatible = "ovti,ov5640";
-               reg = <0x3c>;
-               AVDD-supply = <&reg_2p8v>;
-               DOVDD-supply = <&reg_1p8v>;
-               DVDD-supply = <&reg_1p5v>;
-               clocks = <&clk_ov5640_fixed>;
-               clock-names = "xclk";
+            compatible = "ovti,ov5640";
+            reg = <0x3c>;
+            AVDD-supply = <&reg_2p8v>;
+            DOVDD-supply = <&reg_1p8v>;
+            DVDD-supply = <&reg_1p5v>;
+            clocks = <&clk_ov5640_fixed>;
+            clock-names = "xclk";
 
-               port {
-                    csi2_cam0: endpoint {
-                            remote-endpoint = <&csi2_phy0>;
-                            clock-lanes = <0>;
-                            data-lanes = <1 2>;
-                    };
-               };
+            port {
+                csi2_cam0: endpoint {
+                    remote-endpoint = <&csi2_phy0>;
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                };
+            };
         };
     };
 
-- 
2.53.0

