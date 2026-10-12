Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC848F009
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815956; cv=none; b=BGzPQDoXoVP7KTupnEnzWCmwRc3B/WGqACtWr0xavEw2dqqqyizA7yQ2bqtJEpy0ukDsSuBcgue6o9bxxbkBlmK7L1PzcJJmcVd5hZeg2bjfOYAOsevGBstxEW8wCOMSOli39DsSZKecHsV0OgVYIWQZfXMCZWDkaJZydgX+Prw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815956; c=relaxed/simple;
	bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5toY+VGrFeNMcfGuTrsqabH4QEgGv5I1t1kY99rUCAa/nUteuPpYDKNuVv5xsVER8e4rdpyXzShh3stE5fWqqY6VjHpOod3sGNuMfnk0OhvRaqs9NQtloT8zmtR9668XXomuQ3aNaqroxIsTd1MvczOuNF10Vbp8HWFJz43tYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTMFQQIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O21fYKAw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTMFQQIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O21fYKAw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0WFY2252742
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=; b=KTMFQQIHhAIRKTgM
	zHGqAkVR7+fYCAN09QSjwt8sTHYairdarHarxDfyn7hlR8IAPh0aAWMGt3Yn9ZiW
	N0umhdRYz2uDsl96aRcS/oxpxaOSoXIVDlk5WWUdRWTSEg2EP4u2ii4YgQLPjzmS
	FmhoZayMXuPTJrlN9dLWeiE2etKg0UqS1EfsAGnfRwhjqISmiWH1PcVo0XwW0jxS
	L3YXDCqdHnK0Ain8A/ANbhP6CtI+IFC+/F6KEOOCaHVmrAy6RJLa5ZUFN9excQMf
	IlrFKoYRWd/Nu9z8fgWChJBhS1M6ELBz2yyRt7Fy52dSUGqJxIFm9O7h1QIu1AE0
	gLR/KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j713fvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:39:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so179080485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815953; x=1792420753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=O21fYKAwz9Mr926o8u2ForxWn+DuApz/dT11oxR79zQw1g4av9ma/mGynPkH161GTu
         YEYESjcS4Ssjh5SYsUTzdSebRtKnUHlUInrgopnyo60J3bxnUbRoVtcwhh/J2gqVyVan
         0CI/qqW8kLWmCT6M6aJ4BFmImy4Tw795MW67igz05KhjBHTQsYXaGw5APGPeoGIAJVGa
         NDl13W/VxSL74GtcLvap7QjpF2Fer6qfVoLsKHk8SgeCUbquOHR6yX3X6rnzUuLdPMmO
         F2ajaV51vWmJt6SUrXx8pogODTHxce5r5a8QXMOf/6P6ECf+/b8R4f/+tt2EJy5NHkUZ
         KLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815953; x=1792420753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09tpL+HjcGwRM7VD4pAZC//kVGzZU/yrGCFWtxNu6yY=;
        b=Oih3YiwaHFpDTNKkmYwohV7mgacr95mcGDh81Ilddn+aRA4uO60+L6Xm4PEUbLHfXn
         4cAPvKBgwEuS3DLsAiZLOIi0fDMPWDGacxaJrbuCGDRssH5mQbkjeEkdmV223PpHVz2B
         Sh0jD6FI91brw1zJPuTJtv0BaFeSWEAIT8zAPbbQsrGfFdNqKMF1CjuCXtbCIVt9kHr+
         6RBC5XYO7dNrdylj9YNb2GZQmEz+JcSKicJGMB92cuyNl4iaOa1ZslzI+kCU2O1gSFU2
         wtqspbTaN0BQmL3a9fW9yo2vmDKC70eFLRvIw/KGoBgw3EE13XhqKATdUD2HdNV+mlhm
         R5hQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/dOJ6pGXiaEHhnYXJPDvcT7bW6UPCuncNilmF7hfrsJCGNC4UZQ0lO1kA9J18okaqAhES38uzidX+1Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNLj9OE52qySj7jeU5v7xeirKM9vK31hqDPeKtkqNwRt/sqDAx
	+/IlCTih8G/8Wbq0ZXchLJmsYdEHLungBP3Sp9g35sO9orVqYC9cLnEl/WARNN3WpIVdDxiPYsU
	dK+txiJ7xZxQ6V05AoPhFYkKWR8hMMUnGmiZKBxy3s6RBYz4XNCesa2fZkuQuYXg2+kkpMmfZyI
	w=
X-Gm-Gg: AYBFou3U2dRqrUWHvkigVysGpMkaHPsrsv1MK00CwMbtEjYMyYYfXTN7Wfrv426iIaX
	nu9sslOzWnGzziXkiOqAuPAiBuc/Rx0sEpYptLxKV5rWmV0Cz67mi1lFaQpSFluZGtR9dkQkiDr
	Y2SRXsvjlYf7OJVs0fQAW1w1zk/0mHbQou6eokKZ9bXFSe7nKUHiD4Nq7hA/CLFDvjTdRhT4CT6
	jaTRLegCEicVKiy86+c2dn3VoztGVG8quy9PMt2x9yneVXIBC+8TsX2O8lZlXRq2lXIMO8dWS8B
	Yayo3IqXghG6BDTjyzcD6mx4r7LTBKWVbR0Y7gfkf0yo7o6cSGsbdb8AcF7rqVxXSqzE3+MW1Ms
	ZeaHdoIiMBLCifARrvFM6ucXP3QSw
X-Received: by 2002:a05:620a:278f:b0:93e:c12c:fbcb with SMTP id af79cd13be357-93ec12d06e8mr1414971385a.71.1791815953092;
        Mon, 12 Oct 2026 07:39:13 -0700 (PDT)
X-Received: by 2002:a05:620a:278f:b0:93e:c12c:fbcb with SMTP id af79cd13be357-93ec12d06e8mr1414967585a.71.1791815952608;
        Mon, 12 Oct 2026 07:39:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm340396725e9.12.2026.10.12.07.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:39:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:38:57 +0200
Subject: [PATCH v2 1/4] gpio: kunit: fix the label of the dummy GPIO chip
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-gpio-kunit-plat-lookup-v2-1-553b0d6446b9@oss.qualcomm.com>
References: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
In-Reply-To: <20261012-gpio-kunit-plat-lookup-v2-0-553b0d6446b9@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kTDaibgKumxVGlsCbiu3TRWBakZ0+s7Crv45Xhu20cE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzPEJ7UfiBHZG/8x2ObXSdpiPMuAHzbs+eDKop
 g6XwZEZgTyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaszxCQAKCRAFnS7L/zaE
 w4niD/9iyRhGGvjXWXhkvv2glCH9GA8Ud1McPJMRNIsKJ49iaK+HZiuz/B3TgnWN5nTi8GZ5qZP
 esxI63mmR33zqfEu86WH+rUO1fswZTxJXECHD/yuAU9561DVao7rR9yQhboJWzBWgXFWf2HKq1W
 WACTrhcfODpOP1jd1zr0IWwL/IjYhkcGcT34gyct/dmNoCihClB6KjigdM/ZjjYsXfuOy3wnVci
 yDpgkEtdBzGQohd5oKyGFxQgXvxyslmUeKodORikeNESEfPO6QJCTeMTaIj0sz6ONDORQJWGoUn
 Hj38iIHDY5t+6aLYJP4AGuij1bjMCi74fZrgfd2JA3rrrmgkcPJZU9K55Sb6sU0/3kVd0Hh79nJ
 +uB6zm0yzCaI73drHOIfiqs+rMpWuA4QcuczUHvsj87JxXHt/tTZTJspV6LxE4W+7jyA7CaC6Bg
 05HkWosw3nCwK3uEqNpTit/wOOc4ENc+G+DTW+ZVWJiJ5yVtk+xF98dC9jbQlXAQnlaX7FYJyA+
 AuCeoXyhyrSsQ7r3u+yiXtYF27u4Jzt5tFBNVyVKQYhFFUy7ZfxVrz138c3pZCc3K0MwDRAMkng
 nzxWljnHu99iR+2njZbjzZrsdP1s/Km5cuk8v8AH0ppfOLfGBpnbCT5zEHR5yIYQQA0iqg7R320
 ZiQhX1wtlnSf1/w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX1oZh+BL0y9+r
 48r0RqOQ/X/phhUjGwUpnAioJriKI9w5zFf937ExV+83Pav8rjPz+BvjXjZmbvoiE7H2/fMv4Ag
 kSNAGeGXy/Iivk1iu8stgsYuricoa+w=
X-Proofpoint-GUID: ZrndbYzFpS7Rqzr4Lf95LCMucUr9Aue1
X-Proofpoint-ORIG-GUID: ZrndbYzFpS7Rqzr4Lf95LCMucUr9Aue1
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accf111 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_6NsVwKH7hiaWHCS-UAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX5VgnLNb9ObZ5
 /3886kyU0bNJttY8ySCPkhihcNsG7TsKbkGoD4Y0W7AlEJ4wRfRJrwk893uwgYnbAf4GB/XfU4q
 7T9BTbQIo0DXmHuSiXqG9QTP2wKN10BFPys8sPSvTC82izUBi9vw6PAK6CtOaWqYk9bR7PPtB5P
 Wg1L4i4UgXfLKpJjinebFiaExHJ5l0Ap4hMtJw3zJdsPYasqK6AGYqnXVbRLmsHrVJs6fcxum+Y
 t7lg1ZewsvtMUWH9yeFXOBwIQnGIGwgICcbP82BEwdu4kAaEuKieN7bL3xyYi2R7xi/dE0tgA7N
 PpAFtYqV7nPsSzOpjD8oGL1P7LEK6oWdm18S7LrrBLfN1kDRePj7ub2DeBNGs2cEU9U4jyQtruB
 26BipLHVnYvWtwBIcV+PRtHY9/WMnBk+XU0LTOuHt+Xi2B6zIFy+HohTwINAxOE9WqYraKZKeDD
 zCr2DHBKPdYvHPALO/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058

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

