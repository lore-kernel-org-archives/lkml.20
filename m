Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662805;
	b=qR7cpSvNa1U9MoHgwtjAvp//Alosgz98Nd7Rwj+c36Tram3j1fI5TPnRfcMpbF8FES1c
	 IGQ4BkLeV8yXETNt3S2jzIXURFXC3aMe9J9L4cn7SFSnYgAQWrj1NRyP/9CYCym18oSt1
	 1lkdy/3/BPStvDRUAOnMm+K0Et42Mc8/UHH4O9Y5+Ntjl1gPbKqWj6xQP0MB8U9MHd3Wv
	 ovCkdgQiKEKpxlpL+uKjyGJvAzWdjtszKSEjs4Lk5nJEXNe9ex6tHp+4LhgtDgbu1ii4m
	 tfmsO4jEfh3EbFMJ79GKvBWHZ7oQgWHuo/7HKtGOeCO1VjN2TH1BZsUdWfSqJUg16Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fhIVSFg/vNvPlHwlrqiJOQjBXFYFpUwfX5osWlW3GMY=;
	b=fvy1Bh00aW8lreixgWLHyW/IUEIaZUPyElv1vyd2XU0+C10nXFmW6gf1IC6Ep5yZI6sg
	 /MzKB1qSajgLJVCqBk5nsUjZqq3sUYlhFczSMt/BvZalv1z8SYNP7hcSJlTUKOebCHlHe
	 z4fqzBlyotu+Mw4o6IszxfVaFEHu/NF/2R/bP/Jjp0rUAaplU29YSJEmBe/NB/qIxImse
	 GMcpw21D9TaDSzQhWXrGK40l0peJ39FcKO5BxO+stvlGZbg66mI4JJIfXl5bj/fSyL+kn
	 knb/P/1ZLmWAufAM+QY9ILlhjNEmCk6m/NpWiFuLxxBRl8IaauSR/MTPeZkwpiYiJTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwTKmQDz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19660A2601;
	Thu, 22 Oct 2026 09:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB19660A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwTKmQDz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnMj3194723;
	Thu, 22 Oct 2026 09:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fhIVSFg/vNv
	PlHwlrqiJOQjBXFYFpUwfX5osWlW3GMY=; b=SwTKmQDzOvNTflpIKg+OPjGMzvQ
	Abo6UN/PyGqMgtlWKvF7E1XkZY2K/HD/rMOgpFfqHy2RRnQT39PTQ6di/26aOZVg
	jfDgEiB8Bl1K1nEH0Gi1Th6p7wVXKRUSXSyzqpAbVeILse4zH7TTGyzC/4Wbo9r0
	SzbcOqQx8GGDFRTt+sHr04v2s2GsKnVy5mb+OO551CGZeehiVg2YBBR8eq+v43RK
	PC4GMPcfk1OQK7roNhg+LMUBbaC73qF41bmeJeSSDE4JQAzktvuE40C/2QYlL2Op
	HKBbgp3JXgDFEFLrdskfTsP6LXSbjYnJl8FT5oQQ2Zsxo/m44UNHkQT6+ZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0dnn-25
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:53:17 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9hYe72064240;
	Thu, 22 Oct 2026 09:43:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69M9hXfJ2064229
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:43:33 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id C0A06655; Thu, 22 Oct 2026 15:13:32 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add shikra-iqs-lt9611uxd-evk sound card
Date: Thu, 22 Oct 2026 15:13:09 +0530
Message-Id: <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
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
X-Proofpoint-GUID: DX3snzaTwCdLWsjKnh7zF9R2jyhxaVBY
X-Proofpoint-ORIG-GUID: DX3snzaTwCdLWsjKnh7zF9R2jyhxaVBY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX1BSzvEReeuwq
 SZGctT0g5qpqY+ZIPy1C8LEdq2+bJbpBIDkv/i9JExEFpQzXNNYSEEjtBGEW9qW4nt4pi82WjYz
 XceJO/l/vyB4xO/ICMguj7AhU8WNazs=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dd0e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=p1RO9Tmeah0oeRdPf1sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXzkzpSTruIDvI
 kVsaygjU92nXo4X47MnJdeZcqXnT7jR9xZUvNApasgwnT2JZHeYgd2xWSDgpPCmD1IruGn66oY4
 /PiGUu2gxZ6dBXSLIcooD0ZER1hnYRCaFM4JWSKLo2urBcRQIZBEGceD+dL0iWcP27lemzqwg8q
 UFWM+mj3r34l3zfNRJ/wK6hwX9bp+PLIlKNYMyV+QqK1R0tLHcRYH+1SauZbO1yKvydBK3sVzOx
 GZihYE03Y41sB5ebjOG97xz0oChxJcFLj2vDxlJU6t4JjMhLnKS8mAgcuBbhjOdBvx2S3LmEHY8
 PQVtjj20PkmQonYV+Tdaeaif4qtc1gnQzifI5imrmlNLzfVRwyymbxNSpQ0iWOC1GtK62vvtnzb
 fwQU67LJnhk/XWle40+ESKB/6xR/jCUHFxAPt2mHEaNBEjVDfKJYUTjTsuk00EAzDCzq7QF6aTw
 +Ld3/j3V9vyiRVxeDqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

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

