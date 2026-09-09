Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E156B85E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963488; cv=none; b=VMFl4fKFx2tTNnwVDpRItCYOSykYIs6ajlbjDF94wtoiZq0RmFj5mbGP9wytD5r/LAEKRUiF+shK/olM+22lTVYCvMvb3MM2Gm+98nZOz2z0NClvBpkuHFE0bLmA3rWo4X1ETB5kEzWaTarIuNCeXnWB0yYHDmDl2x0y9RQzi1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963488; c=relaxed/simple;
	bh=mGJJghFSItEhhFNqrC/z616uuKMInTO+a8FIm23jRQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Auso1k9FYrIJuoK2zYXzXxXfUuABM2y7by3dqY2fAEydYpy91JR3QIyXcUB7U86SKgYC8W6qBhA+O1Dy2KiWC1D8GbyqanVlVDZAJNBso7JqI8jqSoegeqhFiDRwBDR+BJr3x10tuJ+vKmoKQnLXU7R72/EoMb3F41HzMFSSF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzpJHeJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMgFXtMn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzpJHeJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMgFXtMn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7Un599840
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=; b=UzpJHeJf8hlv3pxg
	yKv31LFTgKIFGnY7P7QAKlfHUPvZJp+vWADabvrqDzLJ0jOogQuhxWippFaoI/5b
	RQkSgzQqRn0Ewkwz2GlIkbZLJJPfslV8YLy+7aasW2+4manAh9XRt/ukayGZf0Kq
	SydQh+Ljkif4K2wIXT1Qb7wwGIntc/9SqLyN9IYwgk7vhJKLkxOXZ3G/bgYX40Eu
	DlJfLa3h5w4fGmYPYMn5tzvEhU59XNVqvugYTUC/bywpB0JBm62HaEElBQzjGHFV
	sUj6m3fL0ZThH4pW5n7EaxXIvR28+H5pd5ft6KNNFgA9pO6fZqdHerV8thBA4/nm
	ebqs1g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2g52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:18:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78bb7517525so761493137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963485; x=1789568285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=TMgFXtMn49hRkeDB4V+bEou8t168dFdOfbmP3Fo0tnBA9gR8+gjWpT/7jDEDqsHz1W
         afZu/Gs+p3+ryyMYligWQEHnkadM6jnt7C7QM/Gk7GuvPBrC9kvlprMPLwwqI/8tvNF2
         Uwvw0UPnJUxYFjjt+KSAGNV9QoN1batU+obQ6Y1QaRPqklF2jMJa0hABNzIlCd3YItjR
         6oJmEYBvL1jvF0o0eQSDVTF34E1nSrHWEU2chF7HXETKJL6ayN3BPp9zTGH76/OaOLDg
         Hc9oFVI97pwZEUXrKq1DWxloQwUrthTsGENSaAE21mx64yu/qytMJoFFY8UXr+pEumi+
         Yolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963485; x=1789568285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaUce9/yrvvWl365SbTXejci7TYcSE7Y91Xq09tmBZY=;
        b=TZpzoTJwVlBLhIil4UgyFwsoBl/k5U5Cs3kKxYWr9LmlRfWwR07pnvRZjLqD67xWja
         Ineedg4eOSF9h/zsclJqA00D+halr9XjAFmICvVZOOprqrCW33VlEk01xElNNhl7qbFe
         ZCyHmX+OwqFvOflliUHKbf4Ba+hJDyLUWksc2egVnnB/nmmE29IDpHkpmJoV3GWjn6t5
         Y+GxRxr8bY/vXHHEFDMpLq9KaQRdzfpz75W4Pc64JJe0i6DP/y378wa+m6wq41aRS24O
         wAnGfOv1utMXxwOMy70k9UM+BUmh+J0+w2HiOu1kOmxYMkTpsh38IYdFBT4iu3zob5J5
         J1TQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5us/Dbz7o+eK8pAe4H4TbZUvUjIbMZhHqfxCgv8JP8KHxAKTYKt9/cpTT7ixkNl5fcsbXATmeX/nM54g=@vger.kernel.org
X-Gm-Message-State: AFuF++m+qOqE3BkG5xmz420/42PTwQQwOoTbLjqKUmxD2K5wqZA22Y5+
	sBsOo/8BQSSLoqPzAMCaXjG8C+aOV/wG65RgG7I9GCtNC1DNs9sXKXsoX4gx/ZwRWv7U+UdwBTV
	UGd7waYdXJkw4o2Zc2Ba7ynwg33ZJL6N04z0xoeuH5JSbI7hNE/07qrwy4oRYULrhIcs=
X-Gm-Gg: AYBFou1clF5Nvv8iNz0/SOOctokx3WsjahQo5KMnCSTSfHsAfsdizUVSRxdiibkLBss
	HqhQx86olpP2vwgXiAuK7ZQ0AYoGsbCEmZAMbZU6NXs8dE57j/L2/uSmA0pwDQoekwp7aAm0w3V
	YNO3w8lWiPMC9p1O4kWGIMyaQh5XKinZUXHbRAd+r28q4sUjKE+7l1BbpyuM5O7IsvjMHWd1Pv6
	f26Nd1ERqv+E3q9epsrCggwOVLmkk0WAw65jPVSRTPrFFWbVADupf4gx7m2T4NoJLVVAsw2E4M1
	N8MiD4NKzAY2bdLd7gzsIm0mKXmoYobYqdNOLeVGwkmIi4s2TRZxJEzSf65oQDPByw+nnIULXHK
	XloZ3F17i1tlv/GmDV4ULldA=
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276769137.7.1788963484693;
        Wed, 09 Sep 2026 07:18:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id ada2fe7eead31-78a4a7186d7mr14276686137.7.1788963483961;
        Wed, 09 Sep 2026 07:18:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:52 +0200
Subject: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mGJJghFSItEhhFNqrC/z616uuKMInTO+a8FIm23jRQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqSnUhp42JJuvjT3lk3UeBlFe+BA511LjOHB
 X1afbmVYLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkgAKCRDBN2bmhouD
 161AD/9mHusuedUPugo8y7rihvDXRj5hNQMmPMf3I2kYcmb6DlNz5HFEBKiA93IpMmRcmVzNVP1
 jOt+GuRW3tth3JwhtIvFwkvfQ5xVU52RHaImHEi73G0VF27aNsNbEuhz5r7J+uMTE5cfdFkWZ6/
 mTkwuWw0vzIH4z9VB4n2mRogC5rcUY4jTicX698ADjh8XJz7i8v1JPhfDIvcMyCzFCHhfdXdjZ6
 DY70NfUwa0yjE6m8PPt62Jr1b4GQkQHd+yus1z0ZctWG06gf7xHEHOIThUP7Tb0h8L+wr+h9Sof
 TmK7/NVPUNdyKklcwBN/fWGC9OCLq1yf0uUWODKVYOZIgA86CLEIKozYiQgRQCrlQhxl9V+GCNw
 kKDWkKH8sJtYJ0TER6jKd7P8pw+zvl988ecA6puaWil7Urhffx/Z6hsUntSgB4LL9CSj0eJENhk
 7N5i1+kKJYie1VM6GkcYgVtPKmAyUtVJwHPsZ+eTOFDWi1ayRkJkxn6EVEioQsmcWVrpkA9waiz
 yBi2I2PtS5h01MDdsb2x52sefkdhniAZKPK+Si1dxmRd20nuW+jQ/sgOuJllKrn/nfuK1fXi0hP
 0W2il9WcZOM7jm9YGxaTGW1HgMRxu6EgCH9NuU9p4NzV8dNF6unLOUy+bj7TxMl8YCXJSTjSVDe
 d1/lHF8PegC4w4w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa16a9d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X3D6fG5ZlVyqGMLsjZoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX9njZNh9RIqVU
 eZzpSMVQYvvg4ib12Uy9NK/S0UJbpo8+bLzPcrigOdEl1jJFIqZ+eflXZNdLJHNQmi56sTTFVdQ
 hKMNkEJ/YGVtzdsjAA8p0u5xvGKHm78Fp5FFTpL10DsfsY3yJgvN2JhjK5vdU6gBMD1mMdsSsVF
 C8oA3gkYBt2crwPSAo/SXRv7squ/QhrdbMbwdcpMxswJpY4TGdE4fWr6rTVRTApmmmwx5N+wGEc
 64d2A+R+w6uFvUhZHLnH/e+39E1GV/y8PZWFXsXosOP4BH6j7IWs6nf8YpFu0wgHhDbPIqLrRT8
 Q0esGAW0M0mDrxoQQ4B0jDzW4ZK3vuIjqsQQQW7139PyzgvNZg1hfNhHUzfsw6l51vrb6aZooSy
 iDPiD6px8fbjf33OOyq+wEfyIKnjZQSou/shw4yfhkO0x7wTo2OcoYhyzMAeg+0UtfCNbhViLuv
 ymNM+lC+Mu3qs1XCQKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXxQA41Ry7/hc8
 exasLQtnIc6Fmx2U7W4H6fhtn/8Le/XoA5AqwBoiC+ZtmHFuUZmIvXlsgvOIlEk3ZVS6CNFjYzr
 9ACxm81dVdq7d7Us4w04cL3uPK6U9cU=
X-Proofpoint-ORIG-GUID: oE370ckBo2DuRS2Rr3Wp3g8Ul4lDqLOV
X-Proofpoint-GUID: oE370ckBo2DuRS2Rr3Wp3g8Ul4lDqLOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Drop one tab too much to fix dt-check-style warning:

  fsd.dtsi:198: [indent-consistent] indent mismatch (expected depth 3 * '\t')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 310 ++++++++++++++++++-------------------
 1 file changed, 155 insertions(+), 155 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 6766c78243a3..d076ea634f4e 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -96,196 +96,196 @@ core3 {
 
 		/* Cluster 0 */
 		cpucl0_0: cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x000>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x000>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_1: cpu@1 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x001>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x001>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_2: cpu@2 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x002>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x002>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl0_3: cpu@3 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x003>;
-				enable-method = "psci";
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x003>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 1 */
 		cpucl1_0: cpu@100 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x100>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_1: cpu@101 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x101>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_2: cpu@102 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x102>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl1_3: cpu@103 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x103>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		/* Cluster 2 */
 		cpucl2_0: cpu@200 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x200>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_1: cpu@201 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x201>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x201>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_2: cpu@202 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x202>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x202>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl2_3: cpu@203 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a72";
-				reg = <0x0 0x203>;
-				enable-method = "psci";
-				clock-frequency = <2400000000>;
-				cpu-idle-states = <&cpu_sleep>;
-				i-cache-size = <0xc000>;
-				i-cache-line-size = <64>;
-				i-cache-sets = <256>;
-				d-cache-size = <0x8000>;
-				d-cache-line-size = <64>;
-				d-cache-sets = <256>;
-				next-level-cache = <&cpucl_l2>;
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x0 0x203>;
+			enable-method = "psci";
+			clock-frequency = <2400000000>;
+			cpu-idle-states = <&cpu_sleep>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&cpucl_l2>;
 		};
 
 		cpucl_l2: l2-cache0 {

-- 
2.53.0

