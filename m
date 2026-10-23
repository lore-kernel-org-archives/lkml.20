Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775877;
	b=aUKBTTfRtNnQozfuXEah6qPOTnkNSDMoqWyAjMgf1xvxclvFUmuj0FQu3shtMgUBTeOF
	 1iQVNfOyTnalAGQpfGYjskNnrOJDVBW5wAxb9oeWX6LU4euthDMPAttY4KMqBg9qLaJs8
	 I8NhthM7whe3r7Smxl1xfLUeFI3oDunPjaJ4Q7r1UenFvYbI9QXDrjtd2BE6TP/KBgD9C
	 zUXMwwno92Laj5rK0cUeUqUs4ayYf0Q0evXBXySBcbAdaZatUbhFG54fjetZP/25S39Ub
	 6dis3mRaYcgbJdbKiNLXjvUZ+5zCM4lCNSrkKK95xaRKYKBklEkaptA/DoU17b+vayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
	b=UzSJrsxmYGjXe+qDqeP4qy868fxu9RCbwO13Lro1QZeaZWiPydRPbOLBYD+dg9QXKYiB
	 em4zzIfQa/mzm+Agekx4wSUAfSF9OOHg48+yiwBKjtgaUMCSDeXCMOIFwmqQstzdJvyMS
	 GCRs6Seretug/K2D1Rtanq/EkNFkZ00GdRjmPZX50pwyLC7pyyi9RfzLCnFK85eLYefHt
	 NX1DCg4wp60NjlD8Bk+JbHyNwHH3lh2PxAJKwD7Sl6a2sIXGzxD5MaDx5JcjO8tgaSvUX
	 CHgEjn8sjDYEL4MUNvujCIl5OxzhJWYQDMZahbYxy9D2B7KiT2fajOBqTtjDMJs7Z0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2U4hhB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA1260A2635
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA1260A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2U4hhB/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeEMfGzc
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG30CK3733926
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k44WZ0y2BjN
	G6OHV5lN8787fSShc67v39pliE/OY8Zg=; b=i2U4hhB/VXBPwwFTdMKtAeyEP4b
	db0K+zAm99lAe4dN4O+Mho+bRynV30T0EeMxPx3IqpuWrfro5rKzgWAtHJ9j68ud
	P+H42h8cazW451uiTZTxB5tLz+kcEK8bUU0mKxkbTuK+uhhpBkBT7KPRNEHGDPTM
	CwBQSjbD+ZxOxeRm0FCwU8nn+/ehsiarOEs1kcHIsUOsFD2aOcOHTpsdf+7dtC9T
	p7nI1UjHH5XBzZoIZAaVtNhU8c3BUdnmfL54bHx3avq+w06LG3HkBoXhk3n9Xl6V
	jq8Ag2oD+hg/oykT5HBbGVsF6kWp568ObpOHXds7+9qATALopz8KvvMUhOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so203694685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775875; x=1793380675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=TeEMfGzcqO98vG0GPuPD55MCkwA7vIpcSwzQ11AQjDzbp08ypEDZ/dw+B11sqHjlvV
         uyYkd8qSZ4e9AMbxfO21MG9cqkhpuoWHlYVxgplnGsq9fFQlW0PjO4xDyUmB9bOMRZJF
         tbJjcY6lhiEx/u9IbAtUCknbKOWefxqoWTMwfrTuL+KzPS/KkkezCy/Nzx7sAievPrrO
         KzRq9puwIaLZ4ckaczrFXrhYPqEwl0sG52immISiTvvGaXWTEol9DkHu1DIlzQmALYI/
         UEuNYTEoOAN3p3YSZ5Jro1OKqanXNLlKpAeIE4Awf8j+O9DmxJRcBwf6kEBKkJcdDmUu
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775875; x=1793380675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k44WZ0y2BjNG6OHV5lN8787fSShc67v39pliE/OY8Zg=;
        b=r6Myn3FgpW369YnA7DaKZLObmj9pttNXwKYGC8HtzzKl3tbu/5BFTvTZdSSnaHowy0
         TQO895o/z0/HlRJs8scNqxi2/q2BmjgOHaw2u6cQ3qEc51rL6ZT16ev5Q65+p80/Hp8K
         LZXvp2D+hzlZBmYtVk1YzByuJIjo+a0dgX+HWeTRDGmwTJaoxzobOAB5UL2hQtKgm0if
         rpw8hcEievIlHNogiW+FTW7Piilg+PqozSvgd7j8sCfUYk6ihzmX9M4oPWaAcqmMcL3j
         z4in/3drniRtsKU2m1vpFqUQX6FvVSjRKX5dZaBX1CTRARcv4ZDwdRb3VYg1pqI7MYy6
         bVzg==
X-Forwarded-Encrypted: i=1; AKwUvBwz/tD3hDnho8Kzd95XjoRZNfNFNC7MhUFK9aJmSjhr+uMQ2pxJBKNciseprRZOwpi8XdjSelYewIXDLW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/YxtNbo8stDvr2++eatUBryb8TGQeNQxP6fSXtG0sAWyO9/a0
	xvIE8YO2OW56gNI3Jey0ZtJUnf7VfoUK+IHS2UHM4qi5ycjq66mZGb8smuF8jrBiiMDKHSnuAPF
	rouRVoXqOI4RMwN8sFbT8WlY/KlW3S5j3xD3khTWDRcZP6pMyu4Szz2+tC0HRW1oESBs=
X-Gm-Gg: AYBFou0CUALz6BxyeEP7DT95exLEwPM7o3CLhdAUurIkfH+aJ0C7fzQNNLlsumUfZ7y
	zlIIzCyGIUxurD6Hm4fKr7ip7V2IFtkcN5zU8RJxs9VoVK0/xTCBFhvUdfYUDPUjIZWASUa1Raf
	NRmteXmISwOiayRRSzkMSf9DdcJvqPKHyh93GYoXkmYzhkF+yaV8xlkCv4u0jx9daIik9lH9Mlb
	ik5XDH+uUA2TfJctlcbNT3KRsNxC2YsJn69T7ZWiAaqtAMeBUUkUTbFLubXhq+lchf0+idcSj6E
	7tmXJ4/7klXJFZAbEHMUKZsCXsL7MEFddJgb+XqOP8XDgC2gmok10RalYZwKGQAETIOIVnyDfg=
	=
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960273285a.34.1792775875164;
        Fri, 23 Oct 2026 10:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:3395:53f5 with SMTP id af79cd13be357-93f627ac9b9mr960268185a.34.1792775874548;
        Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 04/23] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Fri, 23 Oct 2026 18:14:14 +0100
Message-ID: <20261023171433.820092-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX7nzwmceoO+uU
 4EvM5CBACVzGXPtOlVOFRqIJoZiducSuEEh26rUCTIYUG25BjQ9gAnPeTI70iZD9ZWiSSYh4Lmn
 Pf1e520CThn3OT4jEa/mswCSzBxCNzs=
X-Proofpoint-GUID: 9LZkgTLQRJjXIGoBRRQYBHEu5PdlLIMk
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9LZkgTLQRJjXIGoBRRQYBHEu5PdlLIMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4LXIv7+HKJ+K
 UPGuH8W5ofVuhFmUOTIBUikek+1r51KsyIYUYQIJPcECYp3MtfzdxeYLslENp004PPnp+MY/+Gc
 zL3ck0kf663obry5Y1BklU5P5xGF0wblmA2+7owipPUpH65XuwbEnaah/8PijuA8RR5M3UXTmVj
 vTLqrgNYpX0Yjm8iarwld/Z8UDHgWjsSlMAjhZ40pAWwa0AdiP+Yfclii2jLkKnacpVqI320dpH
 YzsJ7AKLhi7IUb3JaLWNCW0KwdyANkjj9tdn4M229iekLLOL0TsNCOn8kxCtfpMuBj8eQHprQJj
 0SGzVkd599tdSfRH8jhVu+iXjT6KrQLMnMwRkn+N+S2XUjzpUQ47hnrqSaDO0ANjSjYitItvec5
 ySC4sY/fK6/dZ0QbGQBax9+L60LQKjLn1gFRp4K85M3QbW45ti01dd5OFpIwHTT/GrLq2NVyQl5
 Rxm+tGnlkI0cmf3jkLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.47.3

