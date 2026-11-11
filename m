Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387904;
	b=37Tz+lexrcOs9eZAA0S8zzFHRTeb28vi63pK1CxFwhSPYf021uTpYJVGvoglAsZPVusi
	 61I6+Fb3EGwC/dgYhK9/jVFlV8anG/vod5cb74KLdAtrAOAkhKR76hvThnJQM82PxMwpx
	 qGukCxV4FEIHaYX8XQ6dJ6aUrbDOoVMED0GZa/NkQneZE9+/daR9l0QMqBajf/1z8/l7r
	 dzxuhljsHJFPSHmXCia1u5tJFFhMH/6+xeSeRZJKRAVBY8aWCTwCi32hP2SAxQF4JD66R
	 QL8VMkgJE0JxIBMGQBqsqPjIddraP5GYcUwb/RRcJhqkhv4kOn/dgrQAQOcqRx8Cq7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3wUPlidK9OQwWjaFF0OKefrG1yB3BLGbC+qmnGD8u5E=;
	b=StkJEbyIwbdQ4D8pt2kVrsP80U7IZOVwwJ+mMiV+MjH7dykQ6RzIUjKmjotlATrx+SWG
	 SPLfxor8HC4MnMbXLXoW0AOiNfiHRJG5a498wHh2eNDD4QQkGfRTyslzaEEuooO3YTe99
	 2G9nsceethXxnTTpGbK10dho5B8M/plE/ET5aHCyEoK6POw0F24A0q11UXzQJuCTLBUlU
	 //WqGx3oq3ek+xRgSYjuL7XQPmRQusHUKbePkregJGNTCSse0J6oL0nvzzXWEx561L6kl
	 Y6yVScXRWGKION6RqQn9Fz18cGTScPOx3qMhJmyUnPdGNV9ZoJ5+mF4fkd3thJMVjIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmB01jeZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jmvbrgk+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4A60A2607
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF4A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmB01jeZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jmvbrgk+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6Z8YQ580831
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3wUPlidK9OQwWjaFF0OKefrG1yB3BLGbC+q
	mnGD8u5E=; b=XmB01jeZl2Qt9t28AGgk9KkKiDHUK5p/H7zOxwni7GgnmxW03T0
	OtEaJCiilbFMr4iE5lQVmVbNiTp6LxnkWuJv66k6djjD2SUJa2TmkS8v6ca3xuLG
	4XZNVBmpKdXHFsqwr4QZxD/EdRD9cP10TZ8XxsK7bSQZl5z82YcfzXHesp8wZ9GH
	a+Lu5YRmcxWUpFzASUa6ZsNVLCrc/LUxukADtVevKlF+o4QFkHpeOAtZRbMXvhvA
	gW7cQuq4dR6sf08592Aw8w5lV5spkE6ND1INcrdwyUYs+K22bkSpxmNB12mXyj26
	HhW5BIllbt5oNC6fQ7QXtB9Pbb2ifoLcssg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7prhry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:05:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso2532222137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794387902; x=1794992702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wUPlidK9OQwWjaFF0OKefrG1yB3BLGbC+qmnGD8u5E=;
        b=Jmvbrgk+zj1rh8Km8aYauiqYZbnSl0zZZDdDaT36pmQxi/3vgu3CuCN1C6ZJer688R
         kJkfSCHOYSMwN6V7oJwwvpxcZJeItY36R90a+HkCwFN8arp8npWZkAxpJqlUEXklCzkk
         7HVrHnn4atoUtBOlk0eEfBuEoaeJIwu6DrsKn/vzSsCHBj1Yf97kKAT911xDkiqbT12A
         f0M7WdgkyFwwPWqAiCLwWKB7zIgb54hm2lJd4BMQQivWncy/sQhWd1RgNc2ksCE9D5Qr
         Bx/2QDxfeoRde6ef0z1sZl3rz65hjxj9E76stUdUN60By60wZOb66tYnYKYh0Ler2pY3
         2SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387902; x=1794992702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wUPlidK9OQwWjaFF0OKefrG1yB3BLGbC+qmnGD8u5E=;
        b=sSVHYRgV3TknBFZPU7O2qzKsCnH9G3e1JRfV/Ykw/klCGamPQsRqYyDWnlmDcQUz6C
         2t78MWhKMUQpfcLox8c03+FM3MCeh+jRdT8B3jYOutFiZr2tBH3ebUe1ubq1Nf2D4j/t
         q7cnCVvvgumaCqaOTQ2BJCbVg5twygXi7oTP81h9XfGGg23Ya4wOXSjXjlEjLtkXK3Tl
         i7E5MmjOxIVOZtQlLFHIYn/4E9m+K3YK2IBMbaEiyM3TydjCzAICOrnpY9g8QCMSvy7E
         /3B2c0yS3PFvVtSS7u+BBpC5sW9TJ6sJJYd1pX6kTVX6opgf211VGFgXpSQnaTf9bipU
         hm1g==
X-Forwarded-Encrypted: i=1; AL+hErEuF2SvOmFYZBY2Ob0lYY/tVJKe3cWjrXtDubI25QNV6u3FXwy2oIALmxfi2epTmQivmPLNKOpHy0tQlII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mBjIx3IUKIulvw5/r6p6FnrVC8ti2T2P+ykiHQgqMPhjoiMkL
	xfNQ7wMAywBQQjz4ECz8lN3EOQEJlBdfMRRVyfGPaeQVL/JRNo/WOvj/khc40Is7rVQkliUIBbL
	zLF0vZaQwlCBBlyRVVcnjVlasmdOUwdC2ShKGL/26yjd80hUxagGxoqAw4UavxL58Eox4K6rCGm
	4=
X-Gm-Gg: AYBFou11bpvEEWvVEtjevc89zUX7/03GJH/4fxEcfbBLVmimaVB9C0wbk4/yBberevQ
	CEfr7ekRnoo43UYMvzT/N4IuCF8me4zBVfSu/0u9rmCd1j9d5ae6u3y3UXcoTzwA6WMUVyc9GNG
	8MPBlnoGnClymkTybYVWnDx1luKi0aG/Sdw1AXtI+SQgwsQNJ4RCOztFcfQPAHwuhZYL+e8RwgD
	SNzXLrhkEaXxTc5pvmHRrYo9ixDscHzW6J4axZmRlYMGVWB+welH5Vm+qyhnM/Ndpyi55Zlleoq
	P9whZ/5ZMogMvX+CVteR7TVcHbILBV05dPhRJA3+C39frUL4L29ecBJMuCJ1jI8+KtR7W/CNL5y
	fk7yQw9SGir0hlUhu1U0x0vm/Z+1XNcMQiFn4QVrRzI/UKkZVn6FPN/3lvRA/0g==
X-Received: by 2002:a05:6102:6b03:b0:7d2:7707:e6ce with SMTP id ada2fe7eead31-7d494e0ec64mr549958137.9.1794387901539;
        Wed, 11 Nov 2026 01:05:01 -0800 (PST)
X-Received: by 2002:a05:6102:6b03:b0:7d2:7707:e6ce with SMTP id ada2fe7eead31-7d494e0ec64mr549954137.9.1794387901051;
        Wed, 11 Nov 2026 01:05:01 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm118912975e9.3.2026.11.11.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:05:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: example-schema: Show example of dependentRequired
Date: Wed, 11 Nov 2026 10:04:50 +0100
Message-ID: <20261111090449.53511-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ep/jD9jefhWbN4LApHOyamyrQu29jAsstIFhPhhU8C8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9C+xM5JWradoJm9BghwMKJhvlhAonn9fxQVCb
 4WjLDyVp1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavQvsQAKCRDBN2bmhouD
 195IEACF9Ow24JTuik/VRCtxLHCisGFt8qnZJNaqJ2EL6Dqt8p7IoSFxqtHQHnOy9yNhlVBYMRG
 ZHfQtmsS/8Sb7x9auJnBgqx054Q/fLQNoTWiUsMPziSuwUGBEbSnT/tszK+iHCsrGr3RKDTzrYH
 V0gnLWothj23f2xOnyJxnxS4a3EdAC15owblpmDAFq/zTuMIe1dZbOTL02bGv+GjjN0yyHc5mud
 K1K17XDoJnR5tNQcBtv6KL6BHviHdyJ2q/lfy3H9xH9SAkivzxxvEtTrkd/bl0VY2cWNPblFX/x
 LcaDT+KYuxW+g1y3tzBtzsGmRZTi8SsTTFf9VOOKfYK2Lky7wrJxbFS1B08VzLdITW2ghELEIQM
 DvwpfUPVCEueqsVUbLKUk5V8E4T4fue9W/ilxJkx4QOx/r/0STeeyWSzR0udpyAL19OvD3gzvoE
 sReKqQABkD5/6y5gQnKLQ6F1H2+RMjMWcvjTE7DiHZEMIXNnQgcGNRPrB2zgtYjez/Ny333V7xR
 8LNiuOdiSU2gOt66e9Z7tw5j4rL2eZ6QHx5yG88mvbxBtDPNK9wszy6iXvUaISmwuRZvl/A0FpU
 dB0Lfq6f0iaxaH9cF6+EBFoHYZ/XBsXfQ3p/xUDJN+7dRz/CjQ4nIUOZ6Jb1or/GDpS1I9R+2kU YmmN3iMg3dyDeSA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX+qdi/ya4tDEN
 LPVpbBEwcHD1DthUNXg7oOBayQThXLEhCaR1AjYC/2IYVsLl8sZ31+HYe2lCMWc8maJd0vBj5Hu
 YG12lUGqUS/AQR1UonGz2N6ii2hWxqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX5BNc5Y12+Ez5
 ksM8vPecpNYV04hDE7K09LoGR9XsmP577zE7S9yH8tlRsSFtgfXWyKl+4ulntxcuRYtAYg6u4xf
 0zF4y6yDnOQ3W1kPn+SIDUPOqthQ/FLBKNJ+LM9Q4LZ0DHGFRyAH6KAW1L3lSIQgTQroaZOIXvx
 cLHJfJzjrSKsiTYT/jNIYTY4jHQBXpPvgMtqihi/rVsNEG6Ja2ipi/k3vC/dgqxvdbNDGF9Qxwl
 HXnJKqVFQ1q+/ZiulZpj2qQJqeqDTvAtaC5JevGcgTHyXlTwGjnoRgwzbIeTCMdJ1iJOf6Fatwu
 nXUP4MVe6Q3IpnJh5vNgNkHNTjV9JDyjtq13ZnhqNmoB1W39fZahu5J9tnv99q98cWdREJ0dGz9
 uN49GCHyd5oO9X/U3EG9SGBQFwAA7qnkekiksR57glWgeRfI7tj1yIgDVc7UmA0I+OEe2b9z6Y8
 Iq/xyY7JcUadN+cq1qQ==
X-Proofpoint-GUID: 3g12P_9Kj8MqGdrl51qOzt8cmDbScdzH
X-Proofpoint-ORIG-GUID: 3g12P_9Kj8MqGdrl51qOzt8cmDbScdzH
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af42fbe cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ma7z1CdSWlCHNZC_glkA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

dependentRequired is shorter and preferred form of conditional property
requirement, over allOf:if:then: block, so document example usage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/example-schema.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index b04f3cc4312c..0c78eda67a2e 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -217,6 +217,14 @@ required:
   - interrupts
   - interrupt-controller
 
+# Properties might be required only if some other property is present.
+# dependentRequired is a shorter and preferred way to express this, instead of
+# if:then: block.
+dependentRequired:
+  # foo-gpios is not a required property, but if present, then foo-supply must
+  # be provided as well.
+  foo-gpios: [ foo-supply ]
+
 # if/then schema can be used to handle conditions on a property affecting
 # another property. A typical case is a specific 'compatible' value changes the
 # constraints on other properties.
-- 
2.53.0

