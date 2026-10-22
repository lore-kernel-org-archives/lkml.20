Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657482;
	b=uKNDDPVolnXteZORtJ6kzYObsmUvTO41ix2WIHhqHX//eVoYLupweund16p77QR4mE5N
	 dcH5cppIOi7qvV61PuHAcSTOiFBOkdk2m5LqU39Zz+itVGRMaFJ6kDAsNKS75Uq6sVgoc
	 3QbhbCyAv6sUKPPkNG/Z8+qABsRzg7ZIisp1G8Fk+nbpsV9qekz9ASes8GCmCCk7klf6Z
	 R9S3AbIUeZ1Vc4SIEak/AOEP60E2XsAEDq0+Ggv7RZPcKM4Fh50iIdlGxL8aJ+uc5fsWa
	 WtilyG4gqh4ZGD97UfEYji7thVxUcbZFN3OrmaawZ00UIiM/zigo0yZWrv6pxnZ1KEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhIVSFg/vNvPlHwlrqiJOQjBXFYFpUwfX5osWlW3GMY=;
	b=q/hNUbFVAUmpteKk8drUfBpIA15gfkf6xQI0LwUe2PiaUbSqbqhMJsXfAoyT/qCzthYk
	 DSPf1M8TPXxCkKebT1aUFl2q1OC8uZaqPaFT7zebmOTmKeBz/2cKAbdtsn078FnH7MC8T
	 7NsDVCJyUHihEW9LnQejwx9oF+h/376c8FQ/0Poly+t9KWIFp2XXBiNg2oQ877lssnDiQ
	 mZxKhuL1yKd8a/FGlr12M3xprGSlPYFAeg5wU1iKmmLO2tLqMone2roKZ/NZHm9OFRD8s
	 yJ+7dBPi/V6XGKrYHy8tmPvPOJ6UmBfr+d+oK5nhdFYVnDsQOp/DcHeBMKKMp6J6hYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AtKIKqIh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D26606A327;
	Thu, 22 Oct 2026 08:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D26606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AtKIKqIh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8Lnpo3194744;
	Thu, 22 Oct 2026 08:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fhIVSFg/vNv
	PlHwlrqiJOQjBXFYFpUwfX5osWlW3GMY=; b=AtKIKqIhHxskz2jS5TFoa5RTtzE
	k1E1VU0ANO7ZL+n2e1EQBdXfu+KIvkoP1+u2z0LyIMebFrUv/iWF6CIchYcX9S0S
	EkrelE8PCqPe1p0IwvtQTFGmgrgQRDoxh7X1DjDt9skN76azEMI5IrhZVWS/R+e5
	6Xg5aXehzGSLasAmFttt8RXbQrJwD9NgiI0g9QQJ++7uC+1WMN+SiHdZFRL63wwG
	nFi344BIEwJQuYX1e2qfH01/dPyCJXZsA2Q1UKP4yGatTtKNYLiSopw9rzR8jqYW
	y4gjDU/gWkCjoveQlFpA2eQSrrJQ2F2zSTJ5bsh34djFvesXui164cqPhZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq00c5-77
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 08:24:30 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7gPZL1894752;
	Thu, 22 Oct 2026 07:42:25 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M7gP1w1894743
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 07:42:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 9B75566C; Thu, 22 Oct 2026 13:12:24 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add shikra-iqs-lt9611uxd-evk sound card
Date: Thu, 22 Oct 2026 13:12:16 +0530
Message-Id: <20261022074220.989787-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
References: <20261022074220.989787-1-karthik.s@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: gz9n-pqq9BRrD9GnUgXJ9uFkd-F_MdYT
X-Proofpoint-ORIG-GUID: gz9n-pqq9BRrD9GnUgXJ9uFkd-F_MdYT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX6THLOxUSVfgT
 1hBADjNaHxn8d7/eMnZLFao7cT8Cf5WCgUQT5vcep504FTbhBFzPJPB5F1KyI1aAf7dZXqPfQyF
 9EJyaIMv6QFoVgDHLbpQXR3hKWe37UQ=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9c83f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=p1RO9Tmeah0oeRdPf1sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX75/rdIOokkmO
 6cOJpvi7Cu0N55TBvx3ZN8nt/iYR9U0r+acMBteFEbQkpGVfH8Yb+oICcuNEVJyAZRDE5Kakme/
 0hclbm//Cz9Z3XLhvx45e/b3HxArQFr5EtYVlO9ErIG4/6DmEnQvQhH/CSs9lIQ0hV/V6oY1Wmb
 lV/iH7ATx5oe0Ir6DZm46xA6zk3Z9ZF4gmJHxBlnuYWwcak12Zi1Ao1ivLWrnzsR5taQJuWkdMW
 s5fs7jbgI52bifjykmbMYqq0sdYsSXZlqZ2daRpFEjkSeu7Zk5A70N6sJjm372/ivwmHN+fiHXh
 rq/5P7SV8Z8jvIxI+dWz5tmdv1g+PnBE1AYbfSyutL8r8Estz3LQm6hi4RQqCrNsTrXfPvRmIYq
 Y/NoULtJ/cVEPjN8kaiTLCRDMEX7Nj0RebKAGrvFG00IiHspY56T/2n/3oYGKE5LLxhFlHclEqm
 UKV3oYw1ScVgNJ3s+9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

Add the shikra-iqs-lt9611uxd-evk sound card compatible so DT can
describe board-specific audio topology. This Shikra EVK variant does
not use the MAX98091 codec as the base shikra-iqs does; instead it uses
the LT9611UXD HDMI bridge as an I2S audio codec. Describing these
variants explicitly in DT allows the machine driver to select the
correct DAPM routes, controls, and clocking behavior for each board.

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..d1f948a14c62 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
           - qcom,sdm660-sndcard
+          - qcom,shikra-iqs-lt9611uxd-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
@@ -247,3 +248,45 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    sound {
+        compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
+        model = "shikra-iqs-lt9611uxd-evk";
+        audio-routing = "VA DMIC0", "vdd-micb",
+                    "VA DMIC1", "vdd-micb",
+                    "VA DMIC2", "vdd-micb",
+                    "VA DMIC3", "vdd-micb";
+
+        pri-i2s-playback-dai-link {
+            link-name = "Analog Playback";
+            cpu {
+                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+            };
+            platform {
+                sound-dai = <&q6apm>;
+            };
+            codec {
+                sound-dai = <&lt9611uxd 0>;
+            };
+        };
+
+        pri-i2s-capture-dai-link {
+            link-name = "Analog Capture";
+            status = "disabled";
+        };
+
+        va-dmic-dai-link {
+            link-name = "VA DMIC Capture";
+            cpu {
+                sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+            };
+            platform {
+                sound-dai = <&q6apm>;
+            };
+            codec {
+                sound-dai = <&vamacro 0>;
+            };
+        };
+    };
-- 
2.34.1

