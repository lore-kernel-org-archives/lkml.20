Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973359;
	b=idUWcMdz9gUyuM0i/jhMv7jT2G0mh8qN8P+380LxR5doNsyGyUGW3OGSnOkFVpDtjXtX
	 +1AC1N95dam1Mqc3e8TtUeTr9Nr4jGkRXNM7ph5bLaydwPhup0+SCLegLfFQrqzidWo97
	 DqUg+6eUYYEBqA4FxfLT5eh1XI5HkhgKxnV5phJmWPlV/UkxnfYnOrYPYELo1vhGZbhdL
	 XafD4TYy+ApxhAg2w/a7NCrFrJhKdpWSlh008uWcg2k8QoXfIC1xly7WS105YgkEp/M81
	 S3cvUkXHiP1MbaKFs0cgM1PjJn6uUcdEBvU/0V/l8MeVbrlhhV7rQgf8XRH/adufQEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=ZZHAgjFyVFwpbO57TUvmL3NSCCjt/J4ELztW0c4Im+Q6NNnzgXZFDC4trZt/Jib5ImjO
	 5HqaTxo6vxpEK2UrGDntqJCNk0K19O7HvxBHe1fKuB4pI8qhfqQOyRgGVD1/u/4J9CkJq
	 1cqz4Mo1egieANeZJt+8WGGQqZYF6xyyug+Vl97KPtAXJdSEsg6/gSnfiDl3IyCTisLSM
	 kO8mVKtqFEQ0a+5Mf9YZ0PF5c7eSb4BE6dzBRtl00uTC8lMuDLwvmKtd/UJVnjfV3uXOl
	 CDn1hdm9IPo5btJ/ugbS+2PeDJzjC6IeMlSitG0JaGENfltd+caZkLn888mpXpA7z9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7571606EEA3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7571606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoKMQ3776174
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=US2nmvah1yJQhPOR
	tKx9LUKcM/vHdZzQt0Phcfi/T3pbV+zRYzwXi0q5dvCA6MAKy3DETyd/S9viuPZk
	idcXvg2enG5VSWdwNK22WeaSi28jLTvsDVjQZRt2v+A6MCAswGiBOkHqP6UH42Tk
	+3eFXZxFY6mKE9lPUd9sn2e9h5kymEf2vpIq/H0H51rU1sStrMoWxaOHYVYDa+1D
	PvmniTx2gfwR2m/ueGBBxGrs+kKWxSk37d6Z7rq7xkWcOrJLFZ4YjNJ7mceLaum0
	qvoYnQaEETRqARToLchkLRUUtFrvQxRNQxkqQ/e2oSYK2pFbJUF813x0hcHRANpI
	RqShGg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa31dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:55:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so102968137.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973357; x=1794578157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=L8KV8Xf6To1qNWXhKLDVWSBrHCkj02pnREegQV/Z3bNQAT3/bmWN2E5HtwogiE+2PK
         cwNueCDlPrb+eFWTJiG0u9REle69greJajGEL0uTlg9sdEH05NnwRvMuXOK4WHc8iZC8
         cpEHl/9da8Iq2miRu5XxmiilR6iviYKmtTokJOtk6OZ9JwOXBzKlOjn9KCOrV7oI41ae
         tAU43Folq/FrhNbXlE/OGgnGIa6iuyS+CvDeJS4vMJD81L6lPVaFyYkRn1ILrJbgWkX0
         svzBykZxOdDDKfC1Vm1OHmuZ5oN/z4zZPJhgK6qOaQHoNU3m5Ij6cIUvDWuIBWn3kq/N
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973357; x=1794578157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=c2Q3v+8LWgsG+8BCO+4B20CNLE8R+IXUluxtTrOzNqu2dd3ymYlFOOe5Gs53EgV5A7
         tgmddhH1g7JiVo/WUHSuQ/kweuORheYqBEOjhB89w5pGxHMRVlNocdiEigVf8zgLjxJO
         4aTBAmrweS0MHmA0uA5LGqNhcFq3axf3Fhk7so5PwL+n6nq37XpYp03HYW9ZbFDO+0bp
         5rlP19GL47ZMv/rcV1rWnKb3ilkzgAZ2D84sxU2kwHfXKR0k8JpQXuWvbulHueN2/bBT
         gMx9cKVfY+18oA1CUh8PT/jdEvROZIsSjWMqcHTu5hKDiVT7ZpmUK1Ei0ZG/84QgKZkp
         SoUA==
X-Forwarded-Encrypted: i=1; AKwUvBw9ldGsshmIUPJ8olBUYUyYA59TCvUe3Ei/vcF8lCsDW3H1yI0yTaX1aL1rHlO4JUQuH0pDgJR1/MKWjDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vXkv5YIwd+Oo/XBCqezoNVpYoK46TnYZ40jkPrRkJW8Zui3QD
	bxybCc5rabcRz78Vz5ecikCihjs22eSuTL8jVQK4notZ1fp44nbVEyEXFpoAEuwqcMfQ9VNKI7F
	K/4MJbjj8S4AJzLYArb+6c+TryqDecOeixLyv69v2ZPA/4WKATF+cIxvUTdCuTI2lkDc=
X-Gm-Gg: AYBFou1c1hj6xO9BK6Bx2cLIdxtHyvvwqhabc3GFRnJwdHIzJ+rFiIvoOqZwTqMSO37
	2nX5UB/MewHgfuOzgkug8e/xlTP2VTjtqLARzEWCamnH5oEhX18CYjaVuQCGC1qrwGUeD8A2FJS
	fB39yJlKazsMmS5Uj8jxK9UOxU2hoZSlY6ol6x507LKQ11GduYdx+oWyU+cbKx+F9YfMyD69c2/
	dGiIXaurpBDWJvPG4w8ndsk8thJt9ej27avg9b+YTKJW5fqJhLt4QaGXMm+dnFTK6mTEQHhhCXy
	OYIQElEbIerjwYJtCo362YxGFHVoZi52FtJ1n+N6OL73m91wIcfZj69oBxapkp58wodEwK8C3bb
	fpoNDAVqQzaH6P1+PUgL7Uho1nV7tV7bzJej9RhmaLo2deO9ic+5DmOqt4Q5BGJzjbM3kpBELI/
	JAXVC0Yu6x9aC3IxlrIr0Nf2BEVI6tn35uEPKSXSkH4XanquCrlne5h/u4jImHJWpa1ngfiHDJE
	L8pb54gm83Y+W6K9xM0jCHYbSvf
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297869137.9.1793973357190;
        Fri, 06 Nov 2026 05:55:57 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297841137.9.1793973356609;
        Fri, 06 Nov 2026 05:55:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:25 +0100
Subject: [PATCH v14 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261106-camss-isp-ope-v14-9-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: fGqavmKbDMD9kxpXmoUYQWms5jib1CR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX4wwvW7hblllM
 lUp7U85si54M4pmVQtf06WHqhFOW3hmFMRzvrO4fGF02WDy3x8qu0F99Ju/YNUv6uojI8LwD59r
 FBMM63kN/ojbyaGSr4kOn9PKWoVsSsCbnnOD64eCo1eOcre9LAHGeCo+gJPyYWQGSCUs33oPN0c
 sm+OLmLOZHTnv4vzF6lbYGJge6jVP4jk7aovRFDAsyFQ5qzctpVYNBzfrk+8HLTE02hdFj6vpwS
 2VhxLnIJVYk3APU+IU5sKA0+NCh3rSR1kJHI20D4HKwLzvnzlp/l+oLjMwKzr4UWrAMuHgZEiXc
 HXvZIySJYi8c3yeSTQhn7/mOMFs45OrQv+3KI0kOp2LRwL8rxlQfqT9FFPtQizq662ldiHlc5e8
 vY65WpvV7EnJb+ZfBQj5sC8yIKM/PHmk+iCuje78hYaYUwco7e5y8JFSwbpC3ylhjTgnyADc1MZ
 AJ23e1git3GLcH4PaZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX2EnNzKr9F59g
 LGEPuv6s3aU60mBc++IqjlFV7Rx5ysS/3vw/BsF7SiwEXhWlrJUnWNyJCBm64uFCR6Vi6l7ioEY
 QS7wV99+aL2a65my5ofsMQ+skzlr/+s=
X-Proofpoint-ORIG-GUID: fGqavmKbDMD9kxpXmoUYQWms5jib1CR8
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aeddc6d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

