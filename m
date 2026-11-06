Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968441;
	b=2CO71MCQsMaa3t7JDMZPLi58W+DxKOBHw01xhlLVYlymeD5gA7Aa9mdiBc8lGbzl9Tg1
	 ZS2+ydsQOjxTv5nQdv9iy8i8rk3GTDBaTRAJFcrd3N30SO1H+DxqhoqXPBHGm369me1uC
	 ItsZamPDzkZlTPAU0vyUBl4dpppCReFOshDd8IPnYtTMkFbyeyKyf3nYWQBG2ylP1fDzJ
	 WlKOycPuxW9RalWKpBzT3hj5ErSYvlbw2qyrZ1vFKoU4ZQ5bHKdDr215/E0XKQZ4MrQDT
	 xKYCxigYOS2tpOqirTEgobfugsG2D37RkqFtoGkUWNnnJB8fmMSVEve+yXsbixOwqTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
	b=dm4z5fOfQWKl09nlv1i0t/kcU20bnHADyinfSl6puO4T3w8A79E5tu43ftitRYd30vnQ
	 4NRM7wCWJrqcmB1Oc0Z3AZz3s37cBX0GMwb4rkYO1uYbhVR8eviLZisQwVC6tFlsWtZ/S
	 dGhoqwg9Pfh9ko402U6DAGbZBAWuhZWSqfN5OAM8wTJm6t07QbwGDfO/a2GTIgzk1T+xL
	 dEZAxUVGNQPjWxEn9R3TII2XW4HZdYpzkvG9mfS4EYALnpvY/m5uQsPDa/mjR0sKN8QCG
	 HwOwjR5LsWJKfgL4MYHYt+pZnE8VvZb18q0gCvaMsVHQFZ45IWjned8liiQY8+/gZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="F/uvNSlt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVbOubl2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63870606D818
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63870606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F/uvNSlt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVbOubl2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APSTF114862
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=; b=F/uvNSlt9/dBOr5A
	3cz/TzfsVFE8e2RbHUMXru73ge8Db6XPDAqxN1c3YxCuLibiYgc5rec+6DkovUIM
	01/rTsUtgUKyKUmZadeHu/FSOluRWceCRg6wIilE2iae5yywyuvba8MaD0Ec9MC+
	Li9ry5zRvpObgWQQMUK0AVMIun+rnRkxKLsz4iNweE7XOV+NZbqHda2CLvFMK8qz
	RSgrgR/C9tThidEmARYCeIuxdb/mlAW50XNtTvilsD4MpyW/xqG67W/Fzh5x5Paw
	1qBb4qmQlwUE2l37MxvqixvIZ2QxucwLdbUicaNifZfj14JT+at1TOFK3VZRxkSK
	qA3+5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3patrpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:33:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso194360eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968438; x=1794573238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
        b=YVbOubl2uNQ3V78fdFWJ5ITg+itriRGCDvX75ldpu3crY0A1qMiwXCd/i8/Cfgq5ZO
         aGu0Nstj1V7ZfmPkuJ7nwhhvRCefy7heewN3D2GnRZPWj/9GVbhKbAUizuY8KHRW2XxT
         gvWNx86SkDctqEmL4ahYzZXpHWGPtnUUvghGHaYuM8USd9gCeI229mxePpnJpEv7aBzm
         7OSjbFgkKl+jLC/kja5ZNY6cK2wLqwjOWpyHOPIqXegjlAjv5yw+pL+3QLJT/U4/2uC8
         Nuz3eA67rm4cC1YW84YHkJWoEMzpBKK/rghJ7lQbMD7XJWgFW7qQy2ED3bRLWaTnoFIO
         niEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968438; x=1794573238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8/wG016jJ9Eq1RFqzyQ0HwZKYr7zVebHv/8DUlyzm4=;
        b=FfL0A25TqAu6Rx4opMDgLJJQsna69fLg5x0zrinttVJo6uULpDABUceoivS0K9bkMI
         GjQkvktNRAvep3JjFmhZWA/EVWJFj42hQca/h/kM9eh4FiyYruUKdDnX7hSRtOWV471M
         D9zBlTqZHk/bHYeSnntdaiN8H7q4D2SQBy1N0ocAeS5A7ZnnhjTofaewKLgq+Fth+cmz
         xphkL5LBPMGvQy1ujKGb+ZI5IQZ4WQuRsvR945/N9z3fYICMNd+6eM6JlG6pxZ2sSbz5
         r9v5baieKKvYNcc8v/6CpvQ+elLbypaIrLO6CfQNpI2baHdJuUvxewqNDq0rBBbLGpyp
         m+JA==
X-Forwarded-Encrypted: i=1; AL+hErEqnuHXghhiI0dHwIPjuTlTDFJZKEIb5wbaK3B57Wm4Uq5zEXQaeI+VeAvtBggMQaxgrsVqzrOwRwnnExA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HPJcy9mU+7EVkMptmLx3GdtkMpiZe2UmuXG40rbn3BDQq5leJ
	VfDa7E4nCq1XFQ6tzhLaStnHxJymBQydrAyfGpJjxfDDjCbuCkBCis18aaUarQxyW9uMaxBjW6n
	SRLA6EvCmTw89D5X979FBzr5kRJl1hizq+BYSt1k0iAzoRTOMqW3DiVPstjRsYrMn464=
X-Gm-Gg: AYBFou0oH7gNcKViqb6qRzHPMF36DP3kJmLRLkwomJQCwUC8oJcEaZl7cQnv7XbUED/
	0shAa3DpzmOh4IzOJbtLvrMDXrAOfh2MgkuzMgCo5qSiGMSQizaMi/1zpPM6AM963bMu1XVI7KN
	LtiprPXu4zUoY/qnQ8GltGnr+EQjmA2SJJEJ/+JFISD8MZym1imH02GTjqp+R1+lWqjlkbXTKu6
	vylERgdSFCPBb/OkaQoPiNPjDbFgFX2VjSGy4ENSnLKacRRB4tNDmtteUhIIae+02CYDJuZfh6e
	WeJ9VtBeD2lfo/yrs/KrjAavYs4QosJwUarNbbKl0zw0LRX8iOe42ql0tH1WFOc2Dw9Y2TG17cr
	sywKaTpik6CCWzUQws6Fs91xNTrGkDffPHFLOnF4Di9BQ5RQh/QlMaQFqDvb36XkouAV5lQbQYP
	LQqV8VPXmU
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr3094626eec.14.1793968438198;
        Fri, 06 Nov 2026 04:33:58 -0800 (PST)
X-Received: by 2002:a05:7301:1529:b0:36c:991e:c9b with SMTP id 5a478bee46e88-36f76620085mr3094598eec.14.1793968437646;
        Fri, 06 Nov 2026 04:33:57 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:56 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:06 +0530
Subject: [PATCH v6 v6 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
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
Message-Id: <20261106-add_shikra_support-v6-7-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2791;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=TD15J7JJZLQwUWZTq6RSvrSNe3KUE+qF0nOlV5cHnaY=;
 b=feowpxtIAXKy/zE+o9PcPOWw/L6Bhqv0TIEDc+7RQd3eLtYNiUfqVkKMouIsoPt2D6H5ntvkH
 TdVt3p3VVp2AU4FDyfbNiJ8gq0Hg0F9IJgrfh7jZaWk0VztxriC/LdZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX+rQlq123RECn
 Sx8buE6Iq/nGIL3nZfrND9N/48XysbetaRwPjj4yWOC74uBRQIYN57Te/Uu8DmCnxBgIMFgsWSW
 xsVAX1+9El6LZmHm9yCte5QqVr2q3yK14oYuKjxjtoqK9SNpcr1rSKLPrtUarvOuygDYFp1cfDz
 gq7cuP2ufF1bSS7N34t0scLexS1sOByDpBaOEPjFyicbp4KgHFUHEuEj/emHMEUllR8EZAsE+a8
 I+g8EgSinpPmmgfa87MWlRp1f/J8+7m6K06Ky6cmQD4ptQ0Y/f8YIEUJvezylSoHc+TkDapNRiO
 iAC/eFbfdcBzM0UpeQNoiM2RMH9d0BF6IUegaDCFJmRMiZ89KTFIHcRh+25futP/IMsT2YRSz7j
 9k0O6e9OwNletErFNallu1/fqJIuw85gZHupg8KQoG7gkPf2ei5q4chM3D/A63Pk6dYVCXdSOqk
 SD7sndHEBTQnw9TUjwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXzSvMHqEfTtIa
 VlRA3gMDWfJrHeBufXLUSbyM79TRWNrEBegpUMTeR1wFrZ7U8L/4bpgQZAP4rNnlfGCj0GQKAcj
 fu0fdCh8dCMFNltnLdY5rLXM8vX6adQ=
X-Proofpoint-GUID: 2cov3oOnbov4bO6RwNcqlKjJEYxEREP0
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aedc937 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 2cov3oOnbov4bO6RwNcqlKjJEYxEREP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060049

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 20fe0dcb65d5..decaaaad3986 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
           - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-rx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d36f..a6e9b3cdefa2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,6 +20,10 @@ properties:
           - qcom,sm8450-lpass-tx-macro
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
       - items:
           - enum:
               - qcom,eliza-lpass-tx-macro
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36056..7a840b08f8fb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -21,6 +21,10 @@ properties:
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
       - items:
           - enum:
               - qcom,eliza-lpass-va-macro

-- 
2.34.1

