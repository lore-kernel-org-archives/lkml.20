Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184F5502772
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896605; cv=none; b=QuA1jhdXRU/ibxmU40Thp8H+dTtDc6mkodfCyQMHuNvs4vLFtw8PpH6kFewBYdgAKEjRkFqWoZy+ezZFfmbhYFh6/zFzWlNc86X7uXCvafwJU4dTSWlQLYv8J+++fnyIcE+mVaad4IUUnIdBSLSykonBGn0menWoj+XLqHJgUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896605; c=relaxed/simple;
	bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izSzILnIRFpIdoLqfELHbP03QEZOaJJH8hs5YmigXVc/w44MA+wQ2gqeL7rZ2m9Jb+rC40lIZEWaSWnLj97UxaAdIRsxyD5b6JNlMoc87BZxyqCIHNDdZlc26Gea+6BtRqgi5HD+8KxmWtLEiaPBPCeEdoda9drYvCdFiyp/a8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuYVNSAL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKDe1pLZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuYVNSAL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKDe1pLZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Y4iY3907372
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=; b=WuYVNSALyJGEcLCP
	E8eXr6UGubVj2TuB8KzDjoZclJ4JXjLKrj3og1n/4rSNr8dx1Lgf9z1dbGy/ygm/
	bgCxnB9dyirsU1nmgbMYyiGSgof8Q5Zn7OQF2HGVqXEhBAYKhGVCi9J0yX4VcU/J
	+K87UK7m8ZM6WHj1r1YRaVH+OO3U7JFJIXO3moh+l7HmCwJgAc92Wg5paFky0ip3
	KZS+3496aTN5TTfIlleN317F2uL5fCdPXllMJGk1uW0mfzBXIkoYTikfn5RaeEBZ
	gLB4SavokBqcv1McxUjp1P0MccRFmX/t2dLHX5QLeyjhEYoLZ2iZ2kc1B2sd0T2s
	mv5iHg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqumxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5de9d3d00acso3297097e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896602; x=1792501402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=RKDe1pLZGpzvE6fGs2N56nxHKds1Q9PPMGQQ8ZGdVETw3nCyyytacCA74Awg7O8NRG
         gYtWpys74TuenWgnvWd6OJIdS04eOkPi9Dg4xDBFoCBNIZclA2hhvlw2pFWdeFRnyI3K
         Vw8bSIin6tbpKlo3C65TqMhGMJZr7u7caRMpJsgkINitRhcIa9WKcQRijlyqzNixJyTH
         cihePBwIuMMoSjp7PvnD5G7Bu+djUlnFiL/H3oa11yM4ZTKu9AK2IXe8NDgV3US26ZCC
         VJMr7dd1n69qFPt0bCY2koatR4g+9v1hPZCN85RU1lKw2OJOmA7lQSS4Kx8e/mbFYwtW
         xWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896602; x=1792501402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=OqL5ex/BuNFj30hAR7TCiGiGgFkK+/woj41rjoTKpX8iRE4nciu907uCYxSprzThQi
         qefcKW9mt1dGqt3YJFrNrHH8pxZ055vFs5ZRldwwJKYWNL2LdXwPtkBqNyIK6QhDILNG
         RrnsXkzZdRDWtpmHqijEu0qrmxu8AYgNXwOwPFQXnqdu990FykyscRylFza1W4NN9q2Q
         XpHJWTLK1AYjSAi0fR/WM1DYnmqzXNd1Bd5fYzbs2aUAcmxvazwlMAryTD+rx88mD/kJ
         c/603EQ0L1qxyNr/9CJuBTjTWGSjLzm3FMl1b22lj4cMofQEDDiy2zgUE4HNyToWbEy/
         6yKA==
X-Forwarded-Encrypted: i=1; AKwUvByVBsBvJuFG3fJwNsuurq/qRlHTXZ86ceX7nQkssatjXARHLAiie4Pe1zcBSXAIf1hQdLuYrt6Z7ozfS8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXzsJVf/wUov+OQn3uSCTe8T0DHPFp6AQML1aa2+kDU4iJw16F
	3S306SmBUulU8eEkODXQMSUNO4brlra0mhOuh16xpNmvvjJ3GtitNYDt6kYGFVd+BFHkPQcWJ9I
	u32vfNXaGYlu/kEn/w83Qis46349F5P3IYJE2AHVBbgXyEfUDM0+6J3gQOdQvJX9gNzA=
X-Gm-Gg: AYBFou1iF+R4MI1A6SSqsIDD/RKgM1EzyEs/RwPXc8AeS4a6RLP6Tfiquxn/g6pue2E
	Zvk5o8DCAePxFgjqDgbV88ps+Vx5z4lEVg10ga9bgewL6GcOBSP9JmJTuvxfZgPFY6bXaxbmbbs
	2Kfml6zQt8hZOieO7NpL2YU+Qibfx/zDGiaC4508X8adoPi8irFJjY84x1u6ClUQvvXVvluARUO
	lCyJXHwNaxvAaqK36g3hglN5waX53GB9q3BAUp0F/NdOefMoweawVHW3yEyol6g66XkjOAGIKWI
	PM+oUkC5YtX39bDy4H8Jdd+QqpdOgXJMIh16x/yA002jzIAUsUJRmzii6yhn6N4hPjQZciAqEp3
	jUO7royLi1XjWvK8X9fxxcXGl4Wj6
X-Received: by 2002:a05:6122:20a2:b0:5cf:a94c:ca61 with SMTP id 71dfb90a1353d-5e91f4497cemr4326182e0c.7.1791896600262;
        Tue, 13 Oct 2026 06:03:20 -0700 (PDT)
X-Received: by 2002:a05:6122:20a2:b0:5cf:a94c:ca61 with SMTP id 71dfb90a1353d-5e91f4497cemr4326021e0c.7.1791896594435;
        Tue, 13 Oct 2026 06:03:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:00 +0200
Subject: [PATCH v3 1/4] gpio: kunit: fix the label of the dummy GPIO chip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-1-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwLuEP5imBwBc9yJ+Es10PbS5UUJJ+m6vwyd
 yhveyTNh7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sCwAKCRAFnS7L/zaE
 w+MJD/4kj+e1kkIJAo4YFmYeFJKnw8thSbCUQN4xFvkdt590ikVDGZHbH9oHy0W9UT6X3TQ4C55
 GpitCAzS80xWcxURW/llZPgAK3wym6Adww6ihuyBfATZRwe4zXsyxu8QybjqG9lzRApOPLm0jCU
 mEox8zmy0ahs5iMSMX8G88YTUrMG71ij7h2YhEX5p5TXnmHTZ0oiksJ0uD0ADRY+4/xRIdBcTN1
 S8bbvQ0kDLI9gyJ6NFiEsQEKLJbyiNDfgKEsKSCCUpQLuRtauMAho1EEeh5CZ9CaxozcZImBTpp
 h7kjCT/xntCOsUxpRGIESb8ggiGhIiMubKyJbEmGNyb+pvHDizH8YOWpFzHlpy4OMSmPdfBerT8
 e0qkkx4frVraPtLE8ogW8N2qdVKqsFO6qT+NH1y/ZyLw1WJ16b6xj4zg82PNkH3j4BjSULaCY/I
 13euro1kJgH96Pz9raKPIBviE5qJLnJOy2NocDV5gY1hkg5QNZ0c8NpyP83XoBt1/Ags94Ze4JS
 0nL/7bt20/sOGWLJ4adwOEb7SQZ1COen+DnIoVOyJtb3MfhhKSuKx06jteCx0kgX3QEyrxcjWrn
 Ql2qy8DnGc1yffcDJNEjD4LoM+IR0ucSo9MOVRQzjumF3pNJ5XZ3hq1qjv3UBJMh5Uv5c9u04JK
 crzc1rToDkEx/xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX9WVy7oar8Jyz
 2RPygnLi4ZrCW8z7mRJzFZQ84s4JvhlftwFBs5AWy+Qv8KNLqG6px+oJRlcsBQ2KVVr1CTBdbqs
 WyZItz7eRaZ53bgvFGjPs10vwqCGJXYkM81mtVQhcxokfk+J4g6ZTE62Csrlz0u2SRr28ncb6gA
 Y34sofNkfa+byhj9ijd9hKo0M92eOP8UU6063alLx9KhAM3wQ43emTIvYzSQooIxT2ucwJoL9Pz
 l82+IgAQ7Jb8ipz1dHJ4vY9BOx3op7w58OlMCw31E9adxxJlg5J01d8BvqnWY1J3CjObs9ybMVl
 PATRiAAZSN6bWoI/wkJo3nCn2m3bkvTCOW6wjU6W3SOc2edxN6xW2EPSsP0jZWrvDis3HF1E/qd
 g/QCnsO/flrrdu3oMZ7MBvBRZf+fh91dUqsoeXHtvtMTBnHWSpRvFjQYWgPAaiKOlSQV22s8/TW
 AR0tkBxdPenoEG76zMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfXy2gRxmUDenCN
 agL8RdS0xXLxfPQcPAgdg4hdvOgZRljo2/ZvMqsYDOi1MVdBKaDSlr2Wy1Tn0JiinIR68ACieKm
 yyX2wOebaKYW5eb2IM8Cee8XhJbc35k=
X-Proofpoint-ORIG-GUID: _b0UKukR7s_6iZ_32iDYcz85UH2vCDVZ
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace2c1b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_6NsVwKH7hiaWHCS-UAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: _b0UKukR7s_6iZ_32iDYcz85UH2vCDVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

The label of the test GPIO provider is currently set to the consumer
name. Use the provider name instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 90b7e77ef0b51f5115d8a3afe53060a8f33992d2..66095c7a3d4277c6cf6c5a39ba292b67ecc990e3 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -24,7 +24,6 @@
 #define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
 #define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
-#define GPIO_CONSUMER_NAME		"gpio-swnode-consumer-test-device"
 
 #define GPIO_TEST_PROVIDER_NGPIO	4
 
@@ -101,7 +100,7 @@ static int gpio_test_provider_probe(struct platform_device *pdev)
 
 	gc->base = -1;
 	gc->ngpio = GPIO_TEST_PROVIDER_NGPIO;
-	gc->label = GPIO_CONSUMER_NAME;
+	gc->label = GPIO_TEST_PROVIDER;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
@@ -780,7 +779,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 
 	/* The hog must have configured the line with the expected direction. */
 	struct gpio_device *gdev __free(gpio_device_put) =
-		gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+			gpio_device_find_by_label(GPIO_TEST_PROVIDER);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
 
 	desc = gpio_device_get_desc(gdev, offset);

-- 
2.47.3

