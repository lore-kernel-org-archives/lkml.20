Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5581F2ED16D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032515; cv=none; b=uQOKEGcU8YcIZBfp8st8dArzj2alik+5uWuW+TlpmHhWOWwXMdPH4+3I5eTcCANn/XTRCvZhxrFvoi/Y3UK+mpOIyhy6bJh0w9mlV4JFX0eqw+BiE/WNfsIprgtc/6St3OLt/aN1KwzuJU4YeyWQWeSW1s6jLkDVfdmqhCnX6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032515; c=relaxed/simple;
	bh=sgLtJXmJs78/RqhOSizJSvU3iXqQ7UznIWasIAWICeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlC2ptsEKrijY/f3Yj3XuBRsBNwl9Ce16PBUD5bQwKDtpEnYX8ysQY+qRF915uY7zrw7VFLFZPDosEqrAusIxTO1SaRR9iVJktC9KkVJcx94NNKUNNy9vmfGEOb8oiOaa8W6rK9zM1irl6wMSDMjY8R+eq6epcpXAlTgLx9qmro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3EZEI+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDS+cWiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3EZEI+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDS+cWiR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx2ma1856545
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5xi+B0+Ll3m
	ZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=; b=p3EZEI+wahJLlLAViTQEiCVCq1M
	md0lpk2in8UEreKOrtZCQnBEEBUonkn4zmEdzgqm75dZzVktkSIvT8LMkstcyXLY
	isASibzCkuGavjS6bYfab9sSe65i6JSL4jI2GR5LcKjkzwioNbbS2uDcNBLOfIfm
	jk4EBsC0P90ROl0SCK7UGHottRCae5avlrlcuww3Is6GMNyZs97lHfgRsS5vcDFH
	LlRqzhYg/L99Ewyf7rFZNaXUDKokKam1Sm0qQcNprTMPBdKQusE33sVOoLfKk+vJ
	upiOR6VaExeO0GwSkujeDschrWthGI3sLvnLSJNCh5CYSr08im9dJI9F9Hg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb8f67542so29342351cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032510; x=1788637310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xi+B0+Ll3mZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=;
        b=TDS+cWiRBdPgA0SSXugFJ2/v9amkkDeXvV5/z9LXdU0ZEGXmPA8qjqeyML/KahBGJa
         XWX3y+IWLqOeCfVLfAIvnp1Q5F0B1aA/+xSjx9dpFiGue+JOySKjCBTK4FC50FHO8Tqi
         wncCHZ8SRKyEMjrlWRx4Q0/lBootDkMeKQuf2+RymNkcGaC7emURD0kNZ/8fRKRZ7tfQ
         0xHo8OyNdBPfQ4MYVrpCOUVbcfTYj5p/IeUBeOMGKSEjxJoyNCxtdYb+EcMvr+iQeRoD
         6zzGC5dJ5h+DieZsji1mYcJs6RqNgkpoxKQj8o5+8zO8hkLyQK1AcoOQD+GnmfTA1O/k
         4LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032510; x=1788637310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xi+B0+Ll3mZcfG/+eg8A4FHQwmBK5tcrEyuyH0+7VM=;
        b=HLcA4ykvLFOUg0NcAmn4zgXIsxyoxC6OFLEMCHXsyLaruQBPEwZr8zLKxinmKlUhDi
         89fiDl1iV4rKD6ihZq9Pv98iGfX+1DAqUe71U/U7Ioqup2MUwCvJOT65X0ZMK7IQkDcM
         1c16S8tqz2tDz0A8NrLjEhbirOQbLQvbVUfr4Kyt3w6EkLFeN10TkM5B2KAKPUKOtfV3
         AXuZ5bGubkUCkrOjcwcboGVNoiQC0U4rtDbaShyvqZlrtKKwqZNbkCPcO+GKsracrgQ6
         W97zQ7hvXTsb8WTLl6XmJuyuQhqfFvDNZ/Qdf+85hAxstwOicWiwOwiGaXY86f+4MpM6
         dwig==
X-Forwarded-Encrypted: i=1; AHgh+Rqqg1lVNdfZcdEb42blC8mR2JDhJ1B5Hms7CTS+dtH92Jq7N+Bcif77IzjTmkR7XXhJ+kWzHShPrX9yvkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nl23RD5nLuQbovvk72VIv+zCtssAvTOJMeZ30cACnBdD8DJIcP
	C+3yTLBC/QBTooMkTYdU8mOsj5PAuOvGUibSluVBRXlMWKZ+KWV+gXha4F+XC4B3E8fwW41/Icz
	Y0pfQgdnulCq77uYqvIhoxpjx4Q5476EcgxG0n85l4oxMt7WvQDjwr7jDcR3bY2iE+N8=
X-Gm-Gg: AR+sD107bD82UwBLK2iJe9xuOC42hyHfwcE7rQjq39jVetnq0TQ7Sv6ua9B7wyut8F2
	0RdBzoIj2MTS7A3XlyBz52wyPJ3lNy/QIuIeh+2jyr73+nmCobF0yYqU5PWPHBvpaxMxmpRlyHF
	lARJZXD4oBKYYg4boNpb/nqcKT8t9IdQOOy0KBtIIgLDoLKB9QNNOWrDy5GFZ0jKeyk8ro3ad6Z
	eTrgVD1JlmrPeL7pSYr+qefv3OGET4ClroteCVYUyoSdJE7LsjYnCgVxlqXIuvgpJpGFh5O7dHt
	ATkCCgU7xTBM5vX6CvhvF8IxfSnZK/V5jzFIzs+PZlQhIAnwaffZyodrEM4QIfh2Ep4fUrMQXtA
	gBvvP+0wqgkg8crU=
X-Received: by 2002:a05:622a:1343:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52fb960c788mr178894641cf.33.1788032510505;
        Sat, 29 Aug 2026 12:41:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1343:b0:52d:f12c:59ba with SMTP id d75a77b69052e-52fb960c788mr178894411cf.33.1788032510136;
        Sat, 29 Aug 2026 12:41:50 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm288399155e9.11.2026.08.29.12.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: actions: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:42 +0200
Message-ID: <20260829194140.108124-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194140.108124-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sgLtJXmJs78/RqhOSizJSvU3iXqQ7UznIWasIAWICeQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzX1OIaEKat493ZfJZkKvah8PeFFF/7aGruui
 vp3Dgo8mq2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM19QAKCRDBN2bmhouD
 1x+VEACRq8VclU0kLvbnL1qfP+IJzxDFe+osyLXSxiADY0Q4a9co4V06j5PqZKRvC7dKYi9s1br
 q7ewYlL7DsgEmZqG8JTvuM9AugbCqYAVpTUWY/5eE7ZZ8S5BhBu973o4f4WmtJlZq3ZGxwVvDeu
 O90HPuQGbPu1emXI4CgeQal4LXy8lmIV44JN2fBwry/CGEWVN0cIB7UonPe0Mmwif+RKPO+1I9w
 HGR+wrlhPT/9bIWOdYIjMZIa+AAvm7ZgOfyiH2DFoCSK2NcVfmwTYHN5pmEipENanyOkZgxEAZF
 jUQIH5AcaHrytjhZQ5IkRlXXqNREFRbJkuJKfj9uj47qnsqsiH8pf6Kzd8xbe7tBZelqwP/b0rL
 u0kmlpF+KC1QPBdKFH033MCANf9QfwpDszJuOpxG6EmqifhV6V6CaAv402jZ8jxPo/0Q27wJatx
 VHnHTrpSnuGqnlHR4xjzxlFEq3frZGHXxOhgR0L2P4Yxv7hQHr/B9im0oReANGcufU2TvEYz29A
 M+BcNbHOMfOJRNTV1Ux670tc/lZEZfTzeDop0/OLKHgVklXyKLMm1HzO2TesuRYEn8vzg133fqM
 NKRBkHVBExufNIscgeHNUicyAkAigyYXGGkHECCnPAu78NwleJ3/RzKq8nL8zILg3Y1uO/OEZdL 2ot5O7YB4Vzmbxg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX0Xwnfjq5M9Tm
 61MRjzhmIqeD2jmOQmVbZ1Z1wENfYb8HWmfjWWGjPlN1FQ8Vqxw6xGeAN0Q0hOJx5c5caoCar3Y
 5NyUOFRjmHGxtLjZELO5XRjIcHcGUbtMiTzBkjF4P+oY6mI0rm0SJ3ovh1lEwGZnGXKWYSId8Bf
 fkRF3CXmciFA72F8Epned+tVMHrzy1+5IPyzZMGHDyasOAZRUl5GYGlliviPlPZHgvdrabGSV2f
 vvbuLfcagLKvGRH4++CWEnhGW4Iv8ybTpUzFWUNDf0tU4wrJ7MAoDCYJb3yJDfNGhX+pCf4GbDA
 J2EbBN0DPBhkg6qxhsH3XK2MsJkEHEzzVexViK5lE+kd9L2C5gHPdi1XoT36/kjctMHMikUrS27
 RfC17X4/V2B26GJzngKkf4DvteyWh5UvDukSYoVSPnCtbHAxu7bwvwF2rOEh00YHYE9i82IGOdv
 w28BNtn1vgVXFCISiSA==
X-Proofpoint-GUID: 8pi1d4Ktb8eonwQZSGo3aRtGxwPPYYPH
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9335ff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX3OgDCgCgx30q
 9RmKJa5mFgCBgblWbZa8d6vH3gslkBu8BwowFIVf35IctKOJqXqF4n4UQ1Rm5bynDCIvhVbt7Me
 8qVN0HxZWR1fHEOoHrDk5Hv/GktZ6v4=
X-Proofpoint-ORIG-GUID: 8pi1d4Ktb8eonwQZSGo3aRtGxwPPYYPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 6 +++---
 arch/arm64/boot/dts/actions/s900.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 2c78caebf515..3d114671b901 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -66,9 +66,9 @@ psci {
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index eb35cf78ab73..267ac2dd5441 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -66,9 +66,9 @@ psci {
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
-- 
2.53.0

