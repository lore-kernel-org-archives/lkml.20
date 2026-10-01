Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C3511E9C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858478; cv=none; b=oJMvn7JdN1g2DsfLw+tnz6QaswpXU5eKC6zMwzPcSeErRwdE/DSeMLt/3FHlIdcFUsA4a1JRMDheKIaalsLwKterqg/X93GxkdnvquNBzQR5r7On3FrEgk/0WYURhca8XKrNDXgOma0+PvYvet+0CJSE27bU6IvLq3ZP4qqR2Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858478; c=relaxed/simple;
	bh=Fa9saapbQPW2qDY/XXlbqRMh92sptojaavqx32Sbt/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSAXKbd6N/3rURKLQ+JpK/Mr43NFC5d+dX7tO4sv3/rjvis43fhZUbEI5xJRgrwW06TyJnMLPfG77RPpy4aD0HDbd8W19GHhNfZvaiQjsIw5Ir919eTnIO+pjcLzunKYm/RnZPSY++r0diWr01KlxhUAxIceY1mIrJdu5sEZE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6JvyMNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgGRmEMe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6JvyMNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgGRmEMe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xgPB2337560
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FphIiQfxf205/WAEzxFtW1WxdxBruSB9zornDf9+N4=; b=W6JvyMNvD+6UZwIZ
	fUv0BDZEOQh4TefOQDqyCCTt9Ev7VhpaEtre83fFXRFJ7+pS9BIsBgffz6+jETj2
	qWcMf0NGMhhWDPSQuxboaN/+JoTLcM81+8HghUqMBgX/1Th6D7gy2A/aJRCQhggE
	8CBZZnvCilARbUzf7Akihy7TUNWCXbzpN6dI8rEvdwZwj/RaNgEUUfpMWJxB5VdG
	Mj67NlqRYniaduliGNWrGL1S0CBJ1U7jxYZq7VXWZe9J9ZE3sYdAYkX7wVKe/Q7r
	He6Sw8M8U80pQnp0bQHToD5GYrPBFWZQUXmTs8jItJARf5+mf7hDqDPvm3DgQMim
	XxeH1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n24wcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:41:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso1296955985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858473; x=1791463273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FphIiQfxf205/WAEzxFtW1WxdxBruSB9zornDf9+N4=;
        b=EgGRmEMeL/aPYVJkM62qGXtbjZ7obOFcArfKZls9WebyG1lCKwIb9OzWcv1BaKeTZy
         JSPe4I3hBrc9/wU+AzbZ+p8IjKiel51U0JViD1rulTh0lifY48ZNd5W2pFiFnV14skS5
         Gnrf244wPZzFQgSmLrE12fb1i8//+jdcls9+MnI5kssS/sNJaznp9Yf3gW6gMV91t8wh
         i9glz48E/SsBN5SW4e3wMEZ/OBP3M8++kY0wS4y2r8s0cDbovgBllCgQF0RYdJd/GSQ5
         5LL2ovbGRddLjcWZimIykthb2QJT45cXiYVOGfHAYJaoXtZbONodP+RB61yQhCkDg+DJ
         WEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858473; x=1791463273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FphIiQfxf205/WAEzxFtW1WxdxBruSB9zornDf9+N4=;
        b=JsFutTSMwMu85x3UmoL8WtJcsNEIaYq7AwJZvFNT8HXpjzXlbAudo88Kj/EjnGMpEn
         CLDutiX+MvKwvJyedyU2L9EEIQ/aLf/nC6U+pWBsxcLU+O/AstxjGKZvbxRPta50nGv+
         bPD4p8bAsBuRF3IxWCfwCy6C03pFaVoksw39ic3/PH973MRvSzH577z7ae7n8fQoLjwL
         3DuOc37sIudlIRQuWF36WSp3omuYLRQDr80dHkHhuCgkA6at/L8DnsLofnD6U5py6yo4
         IMr3tAdY5is53IDn4c+nhQYgxV2rJGf7biLVHJ1GQAlM7F47C+KjBy8cDXTtV1ByueNo
         a5IA==
X-Forwarded-Encrypted: i=1; AKwUvBxtSO5XYu57m3YNzlRIih2whr0oOIyW9WDoMhbzXwLR+slTz9a4j4cotrGpf2GAHHVKMZ9zqRaYam9utY0=@vger.kernel.org
X-Gm-Message-State: AFuF++mDV9i4t5G1LNNFa7lr3rfL+sgMfzUDpx2pyeuSrxTtxW+UatvC
	iYvAbCtWN8UfJ2JRGHDvz+qN9Hh3L3nCfxrHf4sxsULno8kX3XgtdumCyq9zZtQwuitg3mRX1qD
	H2hhStYwhz3KImdZrV27hGdetSG61wzDInBPDVf48C0L3798CHEsN1oxYO8rOLWWeQBh+glXJ90
	0=
X-Gm-Gg: AYBFou3nbHqjgkBYWr0Z3JHKvnxyTmIY02jXYOWKd7r3RxPgeuA/kmzjK+XX3Y0qMfB
	hcLXTLv/Ak2wSMn+RQDpnLkUxXyMAkblSiaObc1cRACqjr2L6QMIbDvCnQ5uc5SZfAB+AfbdYwG
	w9+UHA+/OscurzeIYo3C19/yjVsvCP9DcfJYfWlDEWx24CSer3KkWEAi243s4MshbrNxer01fEp
	UkLrGNbPepLL+IYNmXLdOCgZ/7inluqTayCX5paADhQR5+AJQySaRBI2CJeR+EsEFMUdf7DQdeC
	Ua4xeWuba+qs3n7WPrq6VujCNVvZwd1QJT7+XtetyJgBz/4ZhE0xOGIHFOcELce8V9RlsZUgNb0
	bneVk/RbbvdHYq5bNQ5++wVS16jli
X-Received: by 2002:a05:620a:640e:b0:939:d762:e2d8 with SMTP id af79cd13be357-93cac14c1bamr802981285a.31.1790858472742;
        Thu, 01 Oct 2026 05:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:640e:b0:939:d762:e2d8 with SMTP id af79cd13be357-93cac14c1bamr802974585a.31.1790858472051;
        Thu, 01 Oct 2026 05:41:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 14:40:53 +0200
Subject: [PATCH 1/4] gpio: kunit: fix the label of the dummy GPIO chip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-1-03bfa84c5dd1@oss.qualcomm.com>
References: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fa9saapbQPW2qDY/XXlbqRMh92sptojaavqx32Sbt/c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTbS7Uc4bitcKSsRy61mfHVGCfrqwJ+vOp6u
 BzGsQN8p76JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U2wAKCRAFnS7L/zaE
 w67IEACWP5kbzp8aOtsTMpLHY1dbMqtrl6bo1c3KZ//cUvaMAIDes7ckNYhTKlP0XjXR6Qghx4T
 Y/qKWi3eS2quevx2idNxI72YP2y7iv1Gf+ATomEzEPhvCCZ+IZhScIkL/vtVLJwa8wwnrL1mrab
 MXA1OQw0FSibQpf9RxuPxtbXVAoW3WCUgW/i4Atb3xibm8Z272cYKaIIJGMu2aBplHtVawq6zpj
 hQgsCxQNyHde8cZ4ygxRHbbfkHAzSUraU8rfj12epr0UfOSzJwV4YJ77tXLDFK7VniRXAJ6shmO
 lS2v70oz5Xc3pklX0LLZNgyZh5zJPQFwfKOoVPIs3CoNPs2Zxl88sZv/hIlqS7e4gI+S1e9VD8y
 hPWoiaZj1pS4ZXIKdr3bsf9e+6VNOvcDmWQevzOeFoN4iNo7HieHUvzqxSJ+Lpbr0JHqYE8Rj6I
 6hRdNagi5542q60UNLPvFVR7TM1yfYICuoolh+uE7tuUILVkrVj6Z4nqjXPUm3X/f21vbdySmQk
 8k0DyIxqPNAyJJmgzBhAFt+t4A/9VH3aS6+rQml/k6+pAmu7D3WFjZQcgfum8gpuBhWQPF/q/p1
 FhRnN4U1twCIAjGhq5dJ7BklvJXcPcjc/aSSc09LwjCOsLqpYbdtqfXrACu1TTC07/h6F1gQvE+
 rn9PKYlmqbHG6rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe54e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_6NsVwKH7hiaWHCS-UAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX0gXQHoSIpLlp
 Zw+K93TJ692/Yf1ClaspKIM+Lvu/1xnMtVn3njAcnUVNp5qU7sMHGs+7dSgoLUZ30pYXrzfX6EH
 hmyxgd1xarKAryOWUBmAgC8yuiOkbJY=
X-Proofpoint-GUID: FOxHXzwoluSfhXEozmF-0XY8fE_S17Ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXxQ82uyNuJQRA
 qnEX2wBTVFilauwPMr9/fVVzzpYey6Pnk7PqAaIfxFni9TuwBJjai9N4ykOmWdk9wdcY2KsaRi1
 VZRdQlkJsWeCDT3WoJPXwaTIeGX2MlClHM48SkwyvLOhhjy414Pp/nHRr1fVMnmqx13gnij9vgr
 5/AjtQLe6kRhIpn3j5xCRWESC1tHWJsJd/UCtuOz0XcvrPq4bM49SMX9a9MJnw+A3cq5i0Lp63z
 AwYSUuSkbfG8eDm6zHU1lXAXHOaOh6vtGTQa7XV8vyM4FfK4Eh32VMFG3F3v/KKgcNeRntiyoh/
 aCrDWFcvWlMkgdK0BkB01UbQG7K9txKTf1rhx5H9TW5E94H7Z4co+y9vGn6wj3GRC5EeiSDqZBK
 91DxNLTAaZgMgE9LIKNh+FOwdMqFO+gqY7eapDn71wW5wGxeMbKjbB25XUYchBRw+jhmThEz6EX
 zayZlGQoABA9F0yuPSg==
X-Proofpoint-ORIG-GUID: FOxHXzwoluSfhXEozmF-0XY8fE_S17Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

The label of the test GPIO provider is currently set to the consumer
name. Use the provider name instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 90b7e77ef0b51f5115d8a3afe53060a8f33992d2..09bbbbbde61694dd8b201ad699ed1943f6bfc48d 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -101,7 +101,7 @@ static int gpio_test_provider_probe(struct platform_device *pdev)
 
 	gc->base = -1;
 	gc->ngpio = GPIO_TEST_PROVIDER_NGPIO;
-	gc->label = GPIO_CONSUMER_NAME;
+	gc->label = GPIO_TEST_PROVIDER;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
@@ -780,7 +780,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 
 	/* The hog must have configured the line with the expected direction. */
 	struct gpio_device *gdev __free(gpio_device_put) =
-		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
 
 	desc = gpio_device_get_desc(gdev, offset);

-- 
2.47.3

