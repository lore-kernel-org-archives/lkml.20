Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BDA501F3B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896601; cv=none; b=rByUndQc1hqMPDo4tUM8eWU7zVoa+CDyysnuwgusOeDj6MtGayBxouw9HpnOXnik11+vGeXKBCGhCDJyzFzQ1tsgpM+cs8pzY/l+9P/QVPpdc0biexvAmKqlUTodB+VSK+YoWRl/JCa8/1A3yq5Kqm0+IRiDo6oz0LEKXH/ikjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896601; c=relaxed/simple;
	bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuRRCjVxb2ODDJIqqnkS5w/Ly8aU5Ta3Ca+wikqUaDPeTjQ4yBbrzYLpqpe1GhQw9S/4P+Swof1VpPaYHu3vl+h95tyPWZ238XUmH3r2wtQ1OtswLlHZRQ7OcqGoeOCTlInW0IqcBdjzmZS241Gkb39nahVLg9ABOZutjz3hmyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTvRudQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO/w7wYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTvRudQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WO/w7wYF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D902ZF791427
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=; b=cTvRudQVA/7zBf+x
	JcKZOFZ5NhvK+4CXBa/R8FLCeKdBQJehi+TJBZbL75T+xF6XBYfXGsnvjKlryIoX
	mj9bCBhzjHGOVmJ3IETCFXUi876ikY6UoQDDZDzyMbnmC8ceMLreLOJbuT7XQoiU
	OndES7i9+IaC1xsCNG+CfhZ060+NUtQTfD/z1rc6VB/CrMxngGvehVTHe88kNXql
	BykX5vcEWwXsrb5Pp9Xd4krPLKt2e3oNz7AUJ/A3xvDzqtdx+sJI6UUEU9RlJVch
	nou9K8FRViLOd5w/gu985D9fN52XrXfjYRSpKai+WDbr/CyB4WYF960c0FjlCSu3
	Twjatg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjryau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e24d542d40so3644738e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896597; x=1792501397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=WO/w7wYFmp4WW6zsZqKk/THcLAubCDeuxht/KOmullGWwtD0j9Wa4DRIMT5oIZRpWN
         Th9Y40NVcIV/o5t8BEwDLvRVVNjZ+yS+aJ5bO+pK2U007xzSC48pXI3NmrrfjReuOXnj
         CdVN/4SGvcAVxLgRUascRai7pr4Dww3V1frKd6qTQDzEmJ/PmmaxXScgPv4N9Xfm9093
         Cd47pIg+oekZdmrAB7gqIqEcgac84JPgVvt1iwT6ZjSS6MavaRpHHZMhqof6QMneAkQY
         44GqA0/9p0Q+nwGg0dhgcpNKv57FuTevuBg8BuydNQXh0KkKa5zwOXIPZe3ECbXYwTpb
         28oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896597; x=1792501397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gpLVL06T2YTDxPC4mdvxK87Ifsdtuv3HVr5hoiqdTY=;
        b=FOtsApAuaykdng6QAhYleN/BPSDgQF3qOD9Z0NWsi+dbPX0kcZrojxkIPA9+fyi0or
         HNEmDJeaFuclrX8xk2CH66JKCF6AESz7DhuiqwDUgake3gvNGtw+isyOOYURJS4ReBxo
         yeN/Be3AsCJ+JhscHvSXmdOlFfe8KoosfUJJvDxTf7/dCXMPgQGHid6ew59BZ+xuFWfU
         Z7xEfh+K4oD6uO2qYxgFM/5tybE/0ggTyBfbLzJZ9n/0yDWYH8JJlrsvjyGd5eELEQYx
         uS9BnheXEp5wmP/p+iy6Nzzve6Y/uSXNuDuIHUx79y24BDSD2shEv3jP3qbtlQIt5svl
         eZtA==
X-Forwarded-Encrypted: i=1; AKwUvBxK2mNkEvyp7KOdZ+sA02h4xDpuXcW0MBK8+8eG9WXjE7q9WSVkHHo+/EsCYPXdniIIdVKKr9leBIFbHpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJFE4K7A5nY/RNcvfCsdSxbUeaEwLZPTn1HHdQjkUzjVBg8qI7
	vILUjeQWHhpAOAxpTo5IQlownakCvxBDlO9tdAzcIcOei8bjSuKcsQfuvC5SJWX7GIpswCZ6quz
	MEJN58jq3/XfJJJfG37bKnZT1ellDyH6csg0U7zM+C6ryu1r0RKKudLwpRPmD2eqbfkCughv0gI
	s=
X-Gm-Gg: AYBFou2KaG7u0e/WaFJ6uQPP6oA/ivLjcqWh8UUM3vVYK/jp/14VhhZ2lS3vu0Bnxfg
	RNn8eA2VzT+ITLBVMBmy1ct6xIBk2rNhOl+MCAwH07j/nNJxr3j9qknjz25sINvbGK8kGvAq942
	Ff3VOTeQQlgyALG3GY4WDQQvFPWHkMIvs8kg44SeFXM0jeeRxrHThFV0xrsDzWidnV7x6NNlg3x
	F8TBS/YWiIex6TM4ezIgpcRFXUL3krEFuRiWnT+GX8Irv3cRW8cgu0TWYEcCTQUQDdHxp/2dl0+
	jqy7h9ZKjLdi+tyFHrNr3USr/eg7X0luppIAUyOHkrmLomzUuKYPyBXrQTp1JfL8BH7/ZrL4sqY
	FcxaqJhQyDL6hkkcyX0w/NGtzmk/Z
X-Received: by 2002:a05:6122:3128:b0:5e3:315:b62e with SMTP id 71dfb90a1353d-5e91f492667mr4026733e0c.15.1791896596930;
        Tue, 13 Oct 2026 06:03:16 -0700 (PDT)
X-Received: by 2002:a05:6122:3128:b0:5e3:315:b62e with SMTP id 71dfb90a1353d-5e91f492667mr4026685e0c.15.1791896596025;
        Tue, 13 Oct 2026 06:03:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:01 +0200
Subject: [PATCH v3 2/4] gpio: kunit: factor out common code for waiting for
 device probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-2-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7417;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UVkNK/zxDQjE6j7JSjCbFOz9XUxp7R0Ya/CjNimBc0s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwM8iJM39kOP58sQNwCC5Oxh45+/0HREP0vz
 h9pT1rqY2yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sDAAKCRAFnS7L/zaE
 w5OJD/9YsAxzIjK1Gk6/d+fjC6cP1uSve5Mu6o6895VAks2RPkAD134DiXufxfNG/87VqDeSKtO
 XyCLQToiVa8jnScyv0+fR3oj3jHZHG7twC08ePkI5jtOxL0CWN8cMxu6qkS6kmLaEL5+H1+psGH
 Xv5mXIHU8ASnuCX/L7tiIeQm2kVExM5hpMqPZ/LwYYMEXApp4DONXRbejQriTFNY1j2TPy4edee
 V40JVPbqpKfxkGoaimKkdBFQHzzdW7FoaCqPyAOWDF0QULuweEZuATxR5wM4AgEALlKSHw8Dch3
 iDBc3ADJBj6P1Z9vH8mpid9McJj1JtOHYbq0UBKEt8DuSsle3+y4Ai+V0T6qbwxoQVDmfHcssK6
 KCblYb3n7v6z5Uyis+uVuy5sXTfow9ev1Trd3I+4oSf/n215pT6DpS0392oOSapgVtkcCx3XrYn
 KpLDI8dh6BAUPaNfb70xSX1tNzLV3pQkToGIXXQXYGGSfdQPzVl7ST7Uiwl8C9Zxex7oXz0SpyR
 LnRltSAjC3FbeVHlvALqBHPQbJ3sl1l2AgE3cPscj08o7xraLazUcU42pKRLa1aKYKbcLpz/CRa
 swkxvZjpNYvAetImo5ixb+n8qv6jtLT9aF0HBqtgw3ZgkzQQwE4V/nltREn0YCGohL4DqUMC5S0
 zzaE1VfTCJTjXAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX6CilojH54K+w
 CxuwQNlupmGwrjdbtcbf303D4wO8NhmI9Fj6AN33pTeDMsaHieT8jXfBQS9yyWIT9rRFt3hSN6P
 TlPjyYqeVp/nZnqBPx4qvggXYmGAZTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX6zwv9p+G0Yay
 +BgGt0oUahgQUSC40TKKptYxnoxHD06v/W9IFMdYPd9POmiYt348FRzo9E1S5SW+ykupjGiOKIu
 haJja8dfnCcXu70+VgX9tAwK+YN2eOVIcNQHCWanjJG6RIAwVQNNS00F5JkCVk4MFz/2ooOeMkd
 1wPhoTGi5BbfrcSGWA5O96Z6jM64EHZproVfes0RXIaIKmdV62Vr/eVDcWjm2vMyIqZDgnY9cwC
 EQSwNBZn5tJRJJwP2cF1v2aCGu8gXlWaZZjxSlKRTyVMrK+I4emPrgVuHXUNAuSUOIGYwz3K6Cg
 R76JVij7D9D+V6KtkDw04hsRbn4HCCIrZu+D85wdGUL3MPvB7zOpoGZ3BLHwvVdaecCSujsbo4Y
 r2C4gh35vU7gVq8VjDEKMT8t4XCuURbJJ2Ry56KHrW/0sUX/7SaGfvIE+KAwKPrL225P1foqhWj
 o+JSvZmOmgxoVvTBpKQ==
X-Proofpoint-ORIG-GUID: bzfZNLHlaeYwnKYHvS9ORUU0IpweTqku
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace2c15 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MJvs68b5CPX-SHL3dikA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: bzfZNLHlaeYwnKYHvS9ORUU0IpweTqku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

We repeat the same sequence of function calls when waiting synchronously
for a device to probe. Put them into a dedicated helper function and
shrink the test-case code in the process.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 80 ++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 66095c7a3d4277c6cf6c5a39ba292b67ecc990e3..f5f1e3627bf0084dc87f4a4dad8ac7e003c3945c 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
@@ -27,6 +28,21 @@
 
 #define GPIO_TEST_PROVIDER_NGPIO	4
 
+static void gpio_test_device_check_bound(struct kunit *test,
+					 struct device *dev, bool expected)
+{
+	bool bound = false;
+
+	wait_for_device_probe();
+	scoped_guard(device, dev)
+		bound = device_is_bound(dev);
+
+	if (expected)
+		KUNIT_ASSERT_TRUE(test, bound);
+	else
+		KUNIT_ASSERT_FALSE(test, bound);
+}
+
 /*
  * The test provider tracks per-line direction and value so that lines can be
  * driven as both inputs and outputs - this is needed to exercise input as well
@@ -177,7 +193,6 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
-	bool bound = false;
 
 	pdevinfo = (struct platform_device_info){
 		.name = GPIO_TEST_PROVIDER,
@@ -204,11 +219,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, true);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
@@ -221,7 +232,6 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
 	struct platform_device *pdev;
-	bool bound = false;
 
 	/*
 	 * Can't live on the stack as it will still get referenced in cleanup
@@ -258,11 +268,7 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, true);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
@@ -332,7 +338,6 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	struct gpio_probe_order_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -363,11 +368,7 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	cons = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, false);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
@@ -382,15 +383,8 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	prvd = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
 
-	wait_for_device_probe();
-
-	scoped_guard(device, &prvd->dev)
-		bound = device_is_bound(&prvd->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
-
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &prvd->dev, true);
+	gpio_test_device_check_bound(test, &cons->dev, true);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
@@ -452,7 +446,6 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
 	struct fwnode_handle *fwnode;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -476,11 +469,7 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	cons = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, false);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
@@ -498,15 +487,8 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	prvd = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
 
-	wait_for_device_probe();
-
-	scoped_guard(device, &prvd->dev)
-		bound = device_is_bound(&prvd->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
-
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, true);
+	gpio_test_device_check_bound(test, &prvd->dev, true);
 
 	pdata = dev_get_platdata(&cons->dev);
 	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
@@ -603,7 +585,6 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -644,11 +625,7 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	ret = kunit_platform_device_add(test, cons);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, true);
 
 	kunit_platform_device_unregister(test, prvd);
 
@@ -760,7 +737,6 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	struct platform_device *pdev;
 	struct fwnode_handle *fwnode;
 	struct gpio_desc *desc;
-	bool bound = true;
 	int ret;
 
 	fwnode = software_node_fwnode(&gpio_test_provider_swnode);
@@ -805,11 +781,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	pdev = kunit_platform_device_register_full(test, &pdevinfo);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
 
-	wait_for_device_probe();
-	scoped_guard(device, &pdev->dev)
-		bound = device_is_bound(&pdev->dev);
-
-	KUNIT_ASSERT_FALSE(test, bound);
+	gpio_test_device_check_bound(test, &pdev->dev, false);
 
 	pdata = dev_get_platdata(&pdev->dev);
 	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);

-- 
2.47.3

