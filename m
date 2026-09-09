Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDDC56E060
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963493; cv=none; b=IIbkCc0lpqFp+m3JkbNHiq1Dq8UzIm/I4QoISc47stD8ojbJ/0RwxkC1g4x0kBlkUnzrSMSoghBr52g9Q5BttOpS2HYLWHp8UjvAE0zTzB0+yWv/1CsTJJxgLZjxzlMe9K30giO8RScX9SzMbJTK+9I6+8s60GpA4vzZA8nn2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963493; c=relaxed/simple;
	bh=krmELxqcbgXM6Rh62+xctNQkB1QdY6zAahtn4he4JiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7qqH4lKl537lowYlvgmajpjM/f8ony6w6pytn+uDCXGX23Tio7i5nMaVXNnaOXHiAj/R1x0LmGzB5K8AIzKL2X6+gHKJHu13m208s2qQguoHEU3lNmv3M0WitoSrgPFmSG7DC1bUXpV7hR1AtUUOKFHqzY8V0JxLsITntt6Ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTMUhvzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqTsVFNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTMUhvzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqTsVFNa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7Uo599840
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=; b=HTMUhvzMXZ0j3YmC
	bPGSLVP1p1nVZ3cvPkaQVDLucKy/thmkXWUbQ9WpbWzEu/AtPObtC4GPsJccaqDq
	3zscu4A1wHPvPD4dyVzU5qcWEnzvH6+zbHc8lTg7+nI06RehQAR2XRSZVYc1yag3
	kKdyrPSVHGi7xfYowG5hq4wtx4j3nXEKFWZlJpv8EHw36eae/CQ8Y3HuwJzFRalx
	NQFc2aYw0OOz+RXfgMDhnNUWV3Mz5k9PdtKdv+5NLy/VyGlRtFxNZqivCJcaP7QN
	ODIbjKQN+ZJS6QkcYPdBpf28yAXshq0R8yWJ5uhB6ZOwq3SXJ8n785VkXdj19SvG
	dJAl4Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2g6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:18:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7847917c402so4077971137.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963490; x=1789568290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=dqTsVFNarblN3HrboaW+y5Y2onJ8QbtxK3pqj9s0kbKs/MWASRCnn8flBmGP1Sgfm/
         V6rShplg/Z/N4C68+WUygozYM/zvugh8c2yPj7I4UzZI0EHERfEyuuraplDfNy1RbGtK
         bLTOJsalNtsjUUk3qSkS+0LPuvmp5IoiJ2vo8Gt/MJFKQ5tJ5MPxUGHZKWtiEVxP8hGo
         zSg5ou7yzmcZ2mYemfM/Gz2Xei37MBiNmmxT+zvVYXeoDVsiy3fKs1Thc6w65VfEyTRE
         KnhjczqJfQhViEYXBcrvb/WH3dPLLhlR9p/zUwCBCWKj7+2kpgp21AmYssbrUD1/Rotr
         4aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963490; x=1789568290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTatEHafDXueY1XxxlZYx0FPFC45Kke80A/W8Kc8sw=;
        b=nMjQQzu6xus9e4edftgTFF8p16cge3RV8oNjbikInGcIRSB1WvJcYH/dQp4MvgoZTW
         yMZZ8qyNeBOwC6RQVaVMA4DIUSgWPV0AmYO2aaKuAExMq93+49muJc3twyguMs8H2LJZ
         7eY0AJkWybMIA6cGFhs0RfqUH04uHzblCFOQnz4MVWFnGG0nuq8GkddR7ZIeMKELuLnh
         MWVdjxfHe4LWPlOvYJ6WyAb0v+c31A/C3jYnYp6OO0QYzkicAEhUZB3P/f7x7z6ipvhV
         NmSuY75Leh+K0NjFQFpTUmpkvFkx/pAUdlyMZM67J06qFSFOM8796JN5CuNfKh+erv6s
         4lzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJH8BoKvxcxBIEhxKEp2pS4rq0zwRXFhnmRwyvD3pucqgxtqCMFYJJ5aM5ORiAGjT7b++KmTL8iudOKoA=@vger.kernel.org
X-Gm-Message-State: AFuF++nUQCmBvotDvLwQFMOV4vks7zdDD+ucAUx3gO8J9IVDtWAdFUdK
	T0/Umr4OE8q2wfxx6OunaZa5DoiW2bCQYliYQ8CbYnKAmMYg5iDLhB00qBccLy6PujQRCSR/ACh
	YqDNYyIqFpWhCCvN7QFghHe32MwOdMHP4XoF4a4e2GMdiDCjQoCfDOx/vovcSioFyp1U=
X-Gm-Gg: AYBFou1+AFjAAjqawwrdC3zg7ri5aaBzHuofNzDvaqgmSvQ44ju50OPlb9iCjYE5pZ8
	hbuSDpzC3dzpOM5NHL4v+J/qxGj8XBqC6HwCbAGH+GkqMTX/FSUnuBngPfU+y1WLFWVUlSeETQ1
	w3RrwnLyKyTFF/rIuVPiU92bsL+rsm4/VE3Iqm2YNyu7Q8JI1hzNEGzmp6MjXhKhvgcFlCRRszT
	6u2NDv1uFtPjIJ+YiSalZkyA+bbz/5HCAoqV/neoUpTNE2LHoOiWlhgSZ39c6aQYdwY88k6BXFc
	KQPIjogP8uo30WWJoteOzHhNeKL4s1gcu4FaW5pMsN4pxhJ/dcbafrzMNfW0Qikr112uakE3bYW
	QQyS8PCzW+kc4OW1iNJJUezo=
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051698137.8.1788963490363;
        Wed, 09 Sep 2026 07:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:1481:b0:784:b9ec:9144 with SMTP id ada2fe7eead31-78a4a9c3a45mr18051663137.8.1788963489968;
        Wed, 09 Sep 2026 07:18:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:54 +0200
Subject: [PATCH 3/5] arm64: dts: fsd: Move idle states out of CPUs node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-3-1b755a446b22@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=krmELxqcbgXM6Rh62+xctNQkB1QdY6zAahtn4he4JiE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqUyWqqT/d0ZxoDFOe4+dUmzZ6rWpAp8gavL
 ig+4Z626SyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlAAKCRDBN2bmhouD
 17vTD/9vzZ1YWIkoCQp5SpnMM8IKibI/4N8y5ntA1s60zoALRjMppWICygInruoxeK23W9U4tWr
 uUbfPlgNDMLv2ahrHP6kmX9pm5cht4G7OnApSWJ1YbkaqA9/1OKV40mgFWivUPrmXr3I7z2iBHN
 7nj3oUyVloTfIS7//gUGPZjqoqWeP5G/uKEFDX8uPdwQ5+6e5RFh7GOSX4WX2KR9uc9yUtlikRz
 fP0Zo+GSRCuj7aHVGa37OmInjclbURiS8E/04KHdqOQnhJwl7/y0EJRRVSApgVCSHL6yDiIMIhN
 w02i4M2z1Rga7tj0DkBMOFZ8o8i8kj9k0kfhg4PPznZRPZFOMwLTNgE3q588QsAK325b/JiI05Q
 ABa9qWnV8QEgbOX0IqbrntNkdEqs7p9UZ2o6SIxVM6Uo2wPdVlEffyfrIl7VI1+v1UV7c9E2K++
 mkhN+euGsEp+7EbRwu5orNASuxLdcAnNCyvvaB6V5KaK6K4BilistdRxoD1TIm5peWYv0EQHYv/
 xgfEu7QkJ4UUemeUmTtD3JpE/Wn/NIi1B9rutra8JlAkPypt8ZSFmgvWgC1FBrfGj9q5sXcKwZP
 r9MpSVJD8p+/qx+cZ/uj5HTT+J+KoGx5eAQLS9tXtFw8kELmipHthKAvJXcVyul/Hq04KaOMLvx
 29JewS4yEWH6jMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa16aa3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VnK6_ChGKNcZOvS6CbIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX2PeQ9yqn5QJz
 Jl0rvJH99emjV29FqHuS7ZX32c7KjCr7/nR3QjPMkvJJiomNLE413Tj2ZFq30fhtXBwe2gCSiHI
 b57dsqUi80i/hoITri53d857d54BvmHzIe4WraWYboj+fI72FJyF2SAixJtcPyaT4VQ+tr0wu5L
 tfbGTG9ocdETCAp5VSQo2QNvvJCi7aMF2PF0D9JkMYs4j5oUbAJ65i/3/z0V+So9kDjFBPoKZz/
 2DNPm7MVF2q6yTmJRUZfO3vpjVNv1sA4cLbxEDCiTk6m7bPkwHCnlG6uXyotuCxWOcu3eiZEZ1J
 zjq/866AHWv0QFUqyRBypZJQWwTvNrYIe7xCAJdPnpuWpw4pdvM0z+81TwLGH6loaj+A6nqPwLl
 iWcNvRiRPSq0lwLAVOivxlkXyivKCsAcBAogw5sI7qI7HXa79g8UIIc7tKXc9wwvhSbUPVLhRoG
 aXQJMhOcAG2S5Kth8pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX5NtXDyW5NtsJ
 rXoRUfe2mRB0uD6FyZiUP5M58yuk02voO5W2qnZUyqSgHYCoWVMVkCdqgxGlALeA81JjOPtJBEe
 SXe0YdpNjSY2FWCMBYJ/e4Kk9JtAFQI=
X-Proofpoint-ORIG-GUID: PaR8SSFWvIIhkbPfIL2JhAowVnc85Eiv
X-Proofpoint-GUID: PaR8SSFWvIIhkbPfIL2JhAowVnc85Eiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Idle states are not really part of CPUs, as often they have domain idle
states, so move them level up to fix to fix dt-check-style warning:

  fsd.dtsi:300: [child-name-order] child node 'idle-states' out of name order

Also, re-order properties to silence:

  fsd.dtsi:305: [property-order] property 'compatible' out of canonical order (should sort before 'idle-state-name')
  fsd.dtsi:308: [property-order] property 'entry-latency-us' out of canonical order (should sort before 'arm,psci-suspend-param')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index d076ea634f4e..acbe93756a76 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -296,19 +296,19 @@ cpucl_l2: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <4096>;
 		};
+	};
 
-		idle-states {
-			entry-method = "psci";
+	idle-states {
+		entry-method = "psci";
 
-			cpu_sleep: cpu-sleep {
-				idle-state-name = "c2";
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x0010000>;
-				entry-latency-us = <30>;
-				exit-latency-us = <75>;
-				min-residency-us = <300>;
-			};
+		cpu_sleep: cpu-sleep {
+			compatible = "arm,idle-state";
+			idle-state-name = "c2";
+			local-timer-stop;
+			entry-latency-us = <30>;
+			exit-latency-us = <75>;
+			min-residency-us = <300>;
+			arm,psci-suspend-param = <0x0010000>;
 		};
 	};
 

-- 
2.53.0

