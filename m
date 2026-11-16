Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809631;
	b=LgMLP941sq6ioecvq2wgJo1h8PrFho2F/mhHmY9rHFlGPVNpalb1GSm5nrFrKZaubSGt
	 4+Synl5WL2AHs11GX5FELO71HY3G/WKEbq1GwtHdIx9snqZYBAwRjD0KYtR1aoV9A+Gxf
	 u/3nefuC3soI4zdGKw6CxV1j9DkePyGoSDOggKrO4ORQBI1OcjOu8JoL3azY5K2HBhH6L
	 73GS7ntiN2DnPxSsFqwH4WTAevpkg11VzPyDIexq+ALjNKREgUD1Ka9ofG/p5RjIlwmFp
	 OFv3dtKNBRl2+6lke1KNV5IMmIqvG/LP5zt4BX8C5Of9RxIK3QXlpz3PagFHlymc+MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=xu5S1g118lHwUgwTkacsD2NfRcsUnkAX4dfp8D75sIbYPKkvJ6+TFGY7ZmTo8R0vkb9v
	 5y26JxVRHWRm7gv7jrJycP99Qw49FYmIOsr8nFThvNW35TW+pQuuFRyJOBjBpfE6M2u4L
	 xaIrQvejogtUDseJKE4S5s9+sN6tTYP5zW9cYhxSFHrEVB/tjuAaBK7qReqLKi/IpA4ZS
	 Zbmum+m+gsuQL35OqscA9Urm5Z6148HerAg9S+3gFHfI63Ue3ffw+xZE/EmvnlK1XUccO
	 b8WwuKBCobduFA30iPUvxgAamyOFscAg4VmHWyJ3gePLKHbpyFknYeR/jPRIhVhqylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562AE606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gzqCNZY+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VksRaQZk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LoWV323069
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=gzqCNZY+70YgH5UL
	APxg9Ni92XafCbPxwKXlw02fsH+5579YKYJH+Yy+l+NbD6943WlA5xYwMqHA0nOa
	J88yWLSY21PgSMU+CmIuVGr075SBh6HIe1S9hEGVCh2nDgNFOMYKNq3Lcq8Q8Xee
	DyliXAGqdYo0qrtN0GTr1wg+TnIowlcM1pXo5FDrsnUrxVMhw41sZnXwOZ71r6pq
	pE659skkP6mceH7TLfuHZLEoRFbxMQ+o/M7Eo0FLUArPURrdFWQuAZfpM0XTTr1S
	c4i6aMops/CHwF5eJkuciNhyNb2aOwUOE1XAMv2lqzl0Rhp16PNT/NSk9P0Wedru
	9BgiMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx55tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:13:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so2772791a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809629; x=1795414429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=VksRaQZk1+mySifCG4lI3FCReUs8kjDT4mnO9WDyyx4q6kQpvLEJX3iiGZIArkeK41
         QIKxgb9w78IOX3e0Vdql7teJRNBVqGbtoX+7naSkIYSn+45StJD9e3ZUuBDhhTrN1TrE
         BrdDI1K4NjpqqqbeRU03W5xNanijizFskQqfBW8H3yZbWzwEzDmfa9LaJ5FsfAJTheo6
         Q8+oqMuQNdtGgdBFh5ge2zU1EUvF6dojZ9zDHXzezx6iv3vogPj115Wd9IihyMOEyWqh
         +ArAnxyer6n7uk75HZV0jgY5wKgqtkmYMBlqJYNlSBOPrvuE+clb0RBK5aNxw/tfrl6d
         bsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809629; x=1795414429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=dEqQau7hOMZpZDdVvTYdBaaYnGmBcDKzU/IcDYh3a2n1KKijpq1HkxXSrtahXnMchp
         4gbeoru35bBurkCr2gxCd4QvhE8rfkmzKojuiLYplK/35Fr300y2oxAhmyQveB9n6A1k
         /cKPsMPe1Et1R1V79H+Rw++/E7JCy49kqg870Z82Cn100zlnjdBfNeDiArDeVyqbf87w
         Pa8+OLz2qOocFExIBl1ygEI2Usk935m0836rCV4T57SxV/ozWLV8VOwPBwFwBLgWKWcF
         FOsb9o85QI7wjBMbmU9D/v9AOknoBY9bJCawnSK+YyyZTPeVtSohY+FvsEYn1p/c7S7k
         oB7Q==
X-Forwarded-Encrypted: i=1; AL+hErHXtXGOPmMqRooTZMCBMVW1qQQlP+5p2MUWX3vmxTV9OI7yR2T9+9Te/8j03NisjgIdWW/JTtHLdV+cLXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BKR+/hNgTbxBwDgQnUY1rzd/K4Rui1NfHA9BAOCZx2g7hRF/d
	Tl+0YoAd/xqOO4x34D6z6/976UzcUTdILo69cX/JG5mltqyjwZ6jOoxr+duASs6mLrbEF3sM//E
	VXia20Po8c9rzsFkNe7pZBFTgWfeomwkkXVlMNlJKycLFlGtdZrsGRaO3wtWqFfil+9Y=
X-Gm-Gg: AZFdTZdfnt6lbZc6pELpeP/ICy6jZbHG8S0uFOtwKKz34+WIruNtc5jIT9/yTLeTQ47
	p4WJ/3/j/9+Xb3myQ1pS8y2HmoNUwMkZrP4BCQZ2PEK7oV4f0n5PgwL+VqCFZPSL4fw6b9mfHAS
	6n+xWA9j5bdqajkxpMm3hI8GHztW+irIck34AaesKgxGF/sqdi0oGv4dkavrJokExFLA3O1vcEb
	a5h3lIWbTe658TuZnfGTNEub6X0gMpxNvc7xvCnHzAQ3Br4W8tYoWyx7s+H8ZKMq6lFB5AL9Fry
	W5ZDGWX6hg3bsSvzdpU9BlstNdVPpRrFJAH3WmwZDZQrG7wjP9LyBEuxDir2/TkQCEAJnmAVq/4
	mjKQqp2QxPHTTgq0DdjjRyFMpibzUdhKOPKE+zHa6XaJwgF1HsIhdKgvn+w8jxyFE0xYw
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899443a91.65.1794809629053;
        Sun, 15 Nov 2026 22:13:49 -0800 (PST)
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr7899415a91.65.1794809628569;
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:13:48 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:19 +0530
Subject: [PATCH v5 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=7xM5Y8xIR4/FK1WeNmeNY9E1yBIcjZe0Km8gqzVoExW414OwNCCbM3w/seI2PWz4BGHC/D2vW
 D/VN9SqmI87Bu6db953jrVnPy8unrYsdxuZuQmB2YKNoPH80l6DHfaE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXw74H8rmjZfon
 CPlES2pBIMcXCRFs57xh6/Kc7KTJvAvTNN82d3E2g6s/cG7t1lbrTgBxcj3VSHGiplRahlz7RhE
 IFAmdGj2QUCHMeDWtPzayFxFhdp6fTtN6DyDjRd+pwHkbOtSUNNAIG31VjzXF23EaCyp7Xglgpp
 Y0wcdqjNFqHXSi+MBvFwtcdDUI99/mZTl6fRRPXReU0QErj+mR05McEJJ4XVpxFKyss5heHPcel
 Uby3NNG+R7oCMMGkL+vCq6K4tFKxGn1dTyGTJBLDwAFtKwWP+wH/b/zVnQKk9UGI3YrveLJH82e
 XxgTwRfKeinjvH7150Ej7Dgn1f1vFJwB0s2B4SXlSE7sngRjyrljjCl3L4kZW3kz/l+xIYpoSuF
 T5VCtSBaDmhju9i5dl0+qMQBtzgAaYOpFDLY04I2f+iGVSvZDGgmvAdFhhrFDsX48sK46vQZbv1
 FjD97mfKLUXJAtuc5qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX6kqpAkxO7jgk
 b4A6RDrmdX1W6UtYjmzNUCR+1YcZakbSqwVHOuvM7vZjCzkZ/ilxBgddHVlKnxKAXhQuHmPj0+R
 uhhNBv9pCdLfEOFmYRrrIOkgB8dWOr0=
X-Proofpoint-ORIG-GUID: sGK-MINZn_J8LeGI03aMrKxzRKGOMCgL
X-Proofpoint-GUID: sGK-MINZn_J8LeGI03aMrKxzRKGOMCgL
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa9f1e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

