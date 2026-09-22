Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6F54936A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081896; cv=none; b=OnHhlg/Ejpe1wGLBOO9n/I7Xo0zbryTFp3llLksc8Mdms2Y0poihH7I/5YgLawkkbQn2LjqZSbsqfrCLhDnYgCRSH6rxEzbdNIhbVCd9LVGvsohw4QGtdiwg9GAXf7t2YeIWS/dEu439lc1Hz/mjtMsfIofaVl7OPlYIUKnRZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081896; c=relaxed/simple;
	bh=fY87isequqGi2vPc14TLa0uhOXluPBKFeKDCz57mcWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d84VY0j4n9ZSJ1Rudcw8CqY1/G9ckeVbc+sZf9KWeVmJCx9Hf0sPzKVOt8NgZQJR9EG+YKKY5fQqsWuX43Bc2E83Z/Nbfj6FVPI/MfNcXXZma2W1OjjyNBnU98EYWPuLU/EbLSJQXEjsyGA4EnETe4F/VnO07kqt7iUVOeicUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jnu3QQB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJXrNkDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jnu3QQB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJXrNkDJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPT5q3516030
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=; b=Jnu3QQB8IPRGxFfM
	tJ6Av1ELS5xfKXzgEbIwMvlCSIb3Bq4dNkpx6iqYSP/A873wCvHRBezKTF94026H
	JfMpeak+lgmxYru92EmceSA4IR1Ooa1BA02TqTmEo4m+M1D6xAb7W5vH2VpOMMf4
	Ir608TsKahqUo7Y8FRc9mLey1UFdYgjKcMEz8gpIECkT+o/qDqz4/rGyNEdx5d4C
	XKf4rDiYca9KlMZeaG2AALrvHGeqgMxg3X9M7M40BMrfYqM40u2ESN1reL35el8u
	h9Odhe4BhtIiz+T00LS0MMfwBN+i/73HKnzWhU1a74RvzmVdWOpu0R/cJLDE3Js7
	+Q1eSw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqagwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c964739454so5054438e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081890; x=1790686690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=bJXrNkDJzSbOWrG/WCBV5+Oa1RB8ZU92RfUrwYknG2jCfv1J7upyfC8X9ULqS/nhNQ
         5MUlW6oSy5a7LwrKaiUpznyeoqnfqWdOchjfQ3QA+zX48wedB3uHx4dKhFOfZW313pnv
         cPNBdwRffGOhEYEbp41TzWjc6TChOCOdtvJporFE1iwTgcrougZ1mA7Ghb/7PXIr6Zfg
         NQbWcqofzJdkiBO4Q1HbOko6wzYoSefUrP2qykEJFQvQLY39Kq+UpJ/nBrLWhRk3Fr/R
         lBxYBEUTn99NA+/DSZioCYWjxR824Tpd8GBqEh77CiIGDfRtk6hj/AOxksUN9fFd/2p1
         JykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081890; x=1790686690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71x7x3a3jvjtRysKXeUju2pROKPOWXEvD0O9ovjM29c=;
        b=P60200utiG5QHQ/h4QtyTiSNauTrYNxz1ls6aDsIndnliK7sum8+qOrx39zAF7pGi0
         rzoOj3qRpe2xzySonV1UOoC6ZmgIs4ubDDIjaBz1jM7Q/GHQGu91Xh4SSRWA5CQj4BG3
         9avvlGWS/PKvmgOxNTS2opCmUbQHmjipO8GhMTORcqWqg5QPuyFXHjb+YMvYhwnNSDMM
         gjO+2KErcTa6ssrWcSVUbm0PtibMYqhyx55VMkGfD4/xyEumP16K+5PxSTFaUnHYEMJl
         m536fdwNtEr3cuQLO3MqGNIMmftSsEE3Sr12iRJMUn1S2MRWQhxAYXrXEGlfz+29Im7U
         31rQ==
X-Forwarded-Encrypted: i=1; AKwUvByFTB26c/xkqALX7ANgGIZrgJroVSzFD0ZCJyQGMflot1qTWTfKasv2LfCnQtNOH4t60OR2RkelruJfnYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lTkOEgj79y7HedSvfamsZ7an0CIGvtSsd11o07D8d9ucONsYc6
	57HNblAo8a4zxXTGdFWGFxGr0baImRPz5NTQi5JeoW/8PrK6JySypJWsN8IqVCH8FkTkM83WZml
	qNNJDnwOePttwOR2SX6kKmldUeUTB9vZp53iffzuEujfmkG6tbrzjRfhlgdfB8fcBA14=
X-Gm-Gg: AYBFou1AbJXUOU8xz+yJq6uswl0N+fqZkR7Tqr6Py2AEeN8FjI0yStoPtW1P7tlRcFS
	83d0XoV1jtwOYYoMcgiMpD/at1g/Dw229xfAEncChG7vI4nzVoyfu8OXpsix9qjidK9K4rFHetP
	pvajipDdGtb8fqzUWy3b/ym6aeM6x555YRBJVxOSz6P7QvuyTPVjkRlWeTWneM9Oj23qWJB7gHn
	Q8rArG0+Vjl4/B9FLgyjbKdTdRVuWw71glPDR35Tcucu+HTXI5aGQESOwUx29aksncDzHqI9ING
	ksBg1ZO5rVUtGQFvfb2PtOAX4B63apZSU6bNn79mFc1Oa4Dve5bzdVNxD8M0NTX/cYmLvpqT78V
	KJWmMLxZt2mVb0jS2VnCbjhxX+sk=
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394470e0c.6.1790081890380;
        Tue, 22 Sep 2026 05:58:10 -0700 (PDT)
X-Received: by 2002:a05:6122:3486:b0:5c8:36a6:ddd0 with SMTP id 71dfb90a1353d-5c9b58e98c0mr8394408e0c.6.1790081889914;
        Tue, 22 Sep 2026 05:58:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:25 +0200
Subject: [PATCH v9 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-10-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fY87isequqGi2vPc14TLa0uhOXluPBKFeKDCz57mcWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns/UZaT9h/s9Gz6OgARZ9rzxMS3ZQgZpCzKJ
 nnFi47SzJCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7PwAKCRAFnS7L/zaE
 w7j8EAC8IgQUzRusHQCor89biXLZV6riqEpya1oT3nHoywVTkIzWNMVa2TgdT3hX1JjSlLR4MbI
 YVQNujKDgZV2UoAkZzeQpm9dh0row0mW5SQuUZkaG5N54xR41VB969wvJaF1G2cfXAVCUa99UAc
 uhJJ1l6epPuUUAXQMylCIA30yqhBFWYre3FYHj+YURx0Gbf9x9yEnm+1tuwStNkc6piZEmLHogw
 VvnqttPj+07kyCTzTNA2+YSyOsLX5IqOxyk24BdLHXCwEBCrNDySCunebNQHRIMVs2fXe2vpZla
 Z04tjzFEyI34eopJ387OJhAMAFi5ATjiaEwSHIlX5Z+JUO7U7uQdcAtc0Eoe3ZaYPLtZUFX5CAv
 RbRcTqU1VHH05QX2XUq0ZHH1zcpGu6m5ILm2eNiK8rG7uqvPcR3M+kLdasd1mk/+dK4wKit70jx
 cFUjTh0TsuLoMmCQfL4FawROIHMxwh4DXLx3Hfvp4M/r6Xoyo+kDoT0ejcujTMk153FAg4adgKC
 lN44tH60s5gx9JoAxBM2C8Ux6IzAd5dp4WvS78w4ZaQZu2qEXnkB9bpC8ZedIHuDSZnXh6i43xZ
 0psjvcj48SOQT20dvEV3YFhSNKmeLh5/FVCMLzFoOnV7w8V7rYkKrlhGa9cTuc1gXQkXoml+HCc
 7nnehYVdqWTXyEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: we4Jn0UotBCtsKGvc1EIjXq8X-7YMHy_
X-Proofpoint-GUID: we4Jn0UotBCtsKGvc1EIjXq8X-7YMHy_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXxmD+lRwb34Nb
 6g9zyXWf8X7WshvNCab3M9LQ8hszWgQffvyHDgVkdaPo+L6nGhoI9QfaLd2u6Mt3Ic3Hljfl2iS
 Yx6thCQmeHlJ/1AZ+n8m0gkNzHT3yl8=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab27b63 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=W_IakApU47TVE70GsD8A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX8QnGWRYAzRVy
 yshxZcRGvB4HH3so+LYFV2QHvMnvCCUzTOe38ZeGu0eonzUmO1Vl1evP9KaTFs62ltOqOTgbVjq
 tq16qVPCYUiul1onrZ0woyuY8XhsRiweEmHNYTCS2DyfJP4dl8PiGU8FlRWi6y5+7azZbp+fLBU
 rUvZ6LV7D9+YHRCED72UnkTbsCk7HHKqtSlg9zVggeaW4IVmp1BpM78WZI3AVtd/gUBEGXLDPTB
 al2eyDDH24hyREOr6oLaRSJ+KzDWDYkY+mSz9R2k+tB75gTGMdKsyX0wL3Ro1WepUsevT4Muobx
 WPz8YplRDBxFw7/TjfA2DqzerV8rO+BeGybdG2IbAN0c3FHT9TXE+c7+PZtM9awKqjy8nRyrPMG
 IAbrPYFQfIST+I9HJ/tz3TTW0ymbUAolwilGFqiLLk9/Rk8zMawHW4T+7aJy/J5I0Ez8SDMPBwX
 vPtMC3nMc8xWSII6qAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

The self-tests for this driver have been fixed. The crypto algorithms
are only registered if the user explicitly requests it with the provided
module parameter defaulting to false. There's no reason to further keep
it unbuildable with the BROKEN label.

While at it: update the Kconfig description by saying this is an
"offloader" and not an "accelerator".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm64/configs/defconfig        |  1 +
 drivers/crypto/Kconfig              | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f9b8dbf9318c9d4947e56ef0159311634bf0c1ee..2d6292f8cab39596b540084fbd8b30f4c25cd4ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1323,6 +1323,7 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..e80927f87ff26fe3f51db6409f509fb99ad614a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1949,6 +1949,7 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11098ead0ea194293422a31d8fe65..adcbe15851899917fb3039efe89a77c8fe712bf1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -527,17 +527,21 @@ source "drivers/crypto/marvell/Kconfig"
 source "drivers/crypto/intel/Kconfig"
 
 config CRYPTO_DEV_QCE
-	tristate "Qualcomm crypto engine accelerator"
-	depends on (BROKEN && ARCH_QCOM) || COMPILE_TEST
+	tristate "Qualcomm crypto engine offloader"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-	  This driver supports Qualcomm crypto engine accelerator
-	  hardware. To compile this driver as a module, choose M here. The
-	  module will be called qcrypto.
-
-	  This driver does not have exclusive access to the
-	  hardware, causing races with the secure world.  It
-	  is also slower than the CPU.
+	  This driver supports Qualcomm crypto engine offloader hardware. To
+	  compile this driver as a module, choose M here. The module will be
+	  called qcrypto.
+
+	  NOTE: With qcrypto.do_register_algos module parameter set to true,
+	  this driver does not have exclusive access to the hardware, and may
+	  cause races with the secure world. It is also *slower* than the
+	  CPU for the same algorithms. By default it will not register crypto
+	  algorithms and only scale down the interconnect bandwidth and disable
+	  the relevant clocks. Use qcrypto.do_register_algos=1 at your own
+	  risk!
 
 config CRYPTO_DEV_QCE_SKCIPHER
 	bool

-- 
2.47.3

