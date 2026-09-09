Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0356C650
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963491; cv=none; b=XwZam6Iq1qO91Ppi5Nxw4/S1Xc4jNRBrH0Cc55l0immnmQahwTQj8UZfN0Gg5QncYMhvBkdhDvUF+t2td4Qgvqg+iNojugMlw1jvcbFAn8lanX0+phcTtV+9LfBS8twVfUsSe+NIJHizIJ01dGYpU2nlLXnD+kF7U4EPiHAA0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963491; c=relaxed/simple;
	bh=7UW5GwmU0Z8p/behDTBZPr/HmZL2ZVIKFtCLBQ5P1oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szQvtJLwGlmRArzjZ5tQlr7PNJ9eyy+z4Mhizko0/kYpBE2pbY2u9ybqCIj+mcI0b0PYXL2frVogurtfiPmuqITaREGBJdvec54cZULdrHZKm8jXEw5zz35i3v3rXsZ3gV3cVm4Gn8AFsU5+U/Ij0QC3+t3id6D3zRGm4JEkfn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/GhkWED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doW3p3Gy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/GhkWED";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doW3p3Gy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoVpO2698512
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=; b=b/GhkWEDbPpNPr3Y
	CGUAzu5FTmHKpYQzkojlS/Y8cVa89Sa2/T7L2ck5IkuZwvSJhfERj3e87/l8LWQp
	l9WyRh6ZXjyR+C6Fqk4GFA6iF6UZrfkypulG/fVrHZD0nS2RHjsJkAOX+VkRn1Az
	cNRFQaH6DbfrjOlDIhoDQYQ1Aoq1MePILvxkBWBVtt6mHK2H8AmG9DH1Au1IRimx
	4k5fvcqSLSEVXTgcRuH7zr2vWTaQWx3HxSF3QCCkw1q1ZkpqIHXTMDk2n1wypyUZ
	EI2TCx2EMJ+KlhdbKDgNvvYEZIu/iB6Grc0M009rPMReuvRhxeiw9vxKTBHYlKOF
	oWklGQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0mr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:18:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso817901137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963488; x=1789568288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=doW3p3GyirM+h+zciQ9+rwR/vZ5frQNzB/K/DXHwKjdhyWtXsN4kRPrqJ08k71mids
         XJIR8OXy4vqGZJSXymwNu+i01BbMHqVdnH9YIq0aivLhx4jzVOdNkRh+WOVGiVWV2tae
         OV/J5Qqmk2Sk8pqt9m7Bo0JnUA2Fkucq5tMrStI/mrNJ5CvVWKOQIshH8jmkLV2Bew/U
         IQbqDYugdhvfmns6P3Iv9ZBhEIQQQHJu9o1BNClXijcLbLKJywIT7G1/w+YHs7BpCYN2
         J7Lhckr5fD+ntmnjT52YjUis8z2SEKDcH0yJrdeAw6GgEyI8954smeMB+rwNH5VFht7a
         tw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963488; x=1789568288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWNogSGoXxmYooMnlaMWgLpI5HziOy0OYIK41DKtJ6o=;
        b=eH07mY8ygRHwchNNq/PSH+eoePVY1Bfwzb4kT61/y4XR5ID0+XDBZbkFa4vAc50cKh
         upOQ9+JgVji1++4vOrpllkR+KhHKB9Be9X9LaIMm+gu1rOz23Sre8WgGsAEhEWZaKAjW
         80C2dHPNqlhS400SXXiuGAtweyhPkGZEJMfju45Kk0VALZum9NCNAw5q35el+Uki9Sc+
         cmFW+SyMX2gnbivXwDNul+ghgjzuq+o7vdgyh/A4KZ4mEcDxfdyDW+YRhh5n1LZcebzL
         zH/RIUOCE/l7OuXVwBtoi8Sdm67Enk88sVzACNf398WGsaJ2ky2vi/ru1Ea5CMEVWThT
         I7bQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5OSdcS4Xx5yvcv2cvYB18kTiqMXYnbXx+XhnSkOgnqKKta5l9AChbUtR1ISNlwS7cwNE+1aOGe6nNAsM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8O+caKCjax/U9ib8qLJHuKPQPOsxOahzWXU4LWYLnOb5i8TQN
	5ehnx6s3VFxpOFRHd/wIwLQrAbnXJns7J2UoCuSfPevuCnV9rZGNwTx+qjjBfcSgX2gmQLg6qAl
	lBgLQCBsFMjqrvNle1TnY7KyOaOti2RK+UPzRawqFez+FuM1QRaepVoSoGpszXn+HYUM=
X-Gm-Gg: AYBFou3T1nqpHhzzyGFYY4+5/S3kabvqjBkDBJF/9TMLFjWSBWM5+6vYZ1Tk9IdQlo6
	MKiti7hxOn/HmNN6+UzmVvC9he8bJtgz9Vblfq8WUvI0ZtIl8WGnzDvYKpm/24cRvyVrGfJ8kLi
	gQTmo2xFAoUS7c71bSOEwxQJGZB8gV5r+TDTJtW3EwZog4GuQsVnN68RERWedbKfp4SZrBEsA1L
	WG6VXZHXzNMascV4TxJ+oXK9GN23+HVsgCY6xpQisoekRiuh9DueQutb7XUCEnUoFyeTr7DNHZ0
	B2t9AjavQn8/qwGJQg9u/1osAxvv/8ZE1wrqEVLZqLmSPzJgJHxN1YmFoCqjJvEyLFQ021GfuHF
	OTq7vpoU0KA7VfBMo0JuxAIM=
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927894137.3.1788963487859;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
X-Received: by 2002:a05:6102:801c:b0:785:35cb:e64a with SMTP id ada2fe7eead31-79075874ac1mr927865137.3.1788963487469;
        Wed, 09 Sep 2026 07:18:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:53 +0200
Subject: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7UW5GwmU0Z8p/behDTBZPr/HmZL2ZVIKFtCLBQ5P1oo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqTW4C5Wq/U5QqNJNk+i4/mlCYILEsx8WMHK
 J2Arf02cvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkwAKCRDBN2bmhouD
 16cnD/4t5mlZm0J6t/3v3P6A6O9xytJLgafTGrGvR+MBKYLd8Ejv7rfoqYIr+1xXo0KHcVaGdhg
 sri77d32eeOEMPPS6O/ksKJ8Dxna/VhQT3U+0Al5pm51f+51mdCZO9dlnFAgPjM8ZTpjdGIuVPs
 zeNsZ29gkuMLfcyauXViiR2FerOEJXsPn3MLcZpLMoXQD7wCzSXkLRnJ5952U/4t5Arnasxd297
 vJsp4p3nAV1FuD7iIYKNAIdhQP1lZamO+e4y+xdln9dqcUpjKbJggh68EZYfL+3+mcdOvBr2j7L
 M2D7X4ltm+Jk6itQZM2chHuvMSGrASFzLXHCqBgIwq/3XcJ5iHOYop+yLQYOBWEmbanUbTpPuLW
 ovgLs55zxGPXtZLXWIxubIhi0UoFjpjlBxvoSWl1MhUqdAFdLBYZ9kvsSy+3EpvwlM9W06cZ8LM
 taPkgzIJNtDGkWFpVpMBCdkCu5n4JopcEzf3R5XS3APhBLdlMf+U+s9aWZjLocnlXtxOADH2Tz1
 vqhhHRWWpp4GFeZoJM4FNhRRITksXOQqcqKu4TPFiJNBetNF7HBeqnkD49QcjR0N0nHDblXj6+X
 /taV1K3ce/WCPu7yPM8gTDS0WWpRrYA1Xf6ijkENCDHNxeg9MfjW+hiS0mcsxlAXjmE6AEmF6j5
 cSCLu41KcofYUKg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXyUjlfGZL+Uny
 dUa79GISICDKM+MToBSU84M2N6F3zRdhCc8t4GlTKIPOOm1bHFMO+bQ/xEacUmjmcm21c0Q6Sqt
 7WNJ7Cu70IlUAfrpeCUpuqpT1846nN5eGcd0D357VC2Y/z9s0bbn69dJUt/d5BHuorMNYzJM5ul
 wBh/sHmRJ7JijObLtD2EsmtK2paCaITaXkfDZlQNZF/uATE4lmBVXJsxU4pc8bxc1hhhW1k3leV
 uFnzjrWemdtWOpwT+LLZltjR2ITywQ4MzoXRDCLm7vTwsACKC9Rp+5QkQsNmyM1XXLRX5VQc/Qs
 rNtY1fJy+tCIc9b/Lw8w1WWWvIvxgqC2VA1sDZLQ5rr5lkdq690iOk0Gk9aJwr39EYwCxy6lAxs
 QJMFmsuiR9nc1Oycpo8iIzEoZhT8mPIIM657obU5WL7/1puqL9mBQHpgP4lD7L2JKeE+R0h7ORi
 RyKEM9DBB+AONu7Csww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXzucjkgF3pl/c
 iQU0RhPHaKos/EjImGkdETBJ/tL2ONjjmdsqYMWEmMjgNmwtHxwXK2WkhJrNR9IMeDHs6ogDyif
 iZaL4FooLi9YCf89cUzYUT4tqzBVkzI=
X-Proofpoint-GUID: LjkTbOaf4H0qYJukFzomoq0NeWMoGsL9
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa16aa0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CUSRVOmJ_5qU7sUgHrUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: LjkTbOaf4H0qYJukFzomoq0NeWMoGsL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Order nodes by name to fix dt-check-style warning:

  fsd-evb.dts:61: [child-name-order] child node 'codec' out of name order

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 503abe52a81c..a1f3d3fbbf8b 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -50,6 +50,11 @@ simple-audio-card,dai-link@0 {
 			bitclock-master = <&tlv320aic3x>;
 			frame-master = <&tlv320aic3x>;
 
+			codec {
+				sound-dai = <&tlv320aic3x>;
+				system-clock-frequency = <33000000>;
+			};
+
 			cpu-0 {
 				sound-dai = <&i2s_0 0>;
 			};
@@ -57,11 +62,6 @@ cpu-0 {
 			cpu-1 {
 				sound-dai = <&i2s_0 1>;
 			};
-
-			codec {
-				sound-dai = <&tlv320aic3x>;
-				system-clock-frequency = <33000000>;
-			};
 		};
 	};
 };

-- 
2.53.0

