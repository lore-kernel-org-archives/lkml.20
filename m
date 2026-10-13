Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD01C2DF6E9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896603; cv=none; b=O4ncNR8+yMJZems/fp4P4HCxTEcPv1A56XLKAMioNIRwaWHmmI/3s2NJF+Sjez0NrqfUuzvjTi8nhyF2nNI2PGxMX3A305Xp5ANMCoZIOWc2bFn4/oUaOEdMQTJzmGWw5kLM0TyvSNynlZuXanOfvc9DHrJmLOkPb52s36piybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896603; c=relaxed/simple;
	bh=5gfSA0wA7QRAviQ6yV/13XwVSqZuVrIvRQcLS++2aFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dF3dfo9aUGnN0S9JL0VW31Ce8uwxy5iAJFl6bbKcysqhPtkUlsU3rBIHQtkfZOeK0car9NAsLGSjKd+kTkA6JVO60FtmS74ZK1ByNSfL39Ew3fQhx7q/rVY4hr8ubRjtJ/Ac0ZckIaMuesZibqcvaZkUvj1aZYxx19MgcwgpoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XP1eV59o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmr0jwed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XP1eV59o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmr0jwed"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Y4iX3907372
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRBbKw6gDHTQ9XxKJf4o22E8VJ8jQlCh7hemDT5P/3Y=; b=XP1eV59o2QtBiqGO
	d9zIgCnpL3ufuWuYXK4sNcpDcJStRUQAqDybdBnREpZxwmqTyZ0QmjQuP+n8yILZ
	KpMQTszcc0MaMBJojzbFHrJ7kebTN5nsOLyQMh6OMVE8/vnATg2qNaAJx6OYol4l
	hvIDcoJpt/p/kao2fJUNDV4QKyotKtT8joC+h7n/QcaovOqUcHLiw57oqMnE9Yk1
	haImftBlZ2hK2NWeJHSG0Etyl7YfwLZQVAVdEbiZRpmyo1g3yFo8wmQkGa49vtO0
	+mbcE2QZSE4viQoWNLOEh53mAclgiBqx/K1lcOSsbhyrrFQjpFufwDHh6JM45wjk
	3lMRww==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqumxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:03:20 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d777524de4so6149922e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791896600; x=1792501400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRBbKw6gDHTQ9XxKJf4o22E8VJ8jQlCh7hemDT5P/3Y=;
        b=Zmr0jwed1AYr56pzOVXJeAfTF0w8JiRsCLNuE09t47Bu0oVtOYCuM02477dQW9vXf+
         cWPl1rCd7TEC/e0H1ppoD2OGTs+nfvZTEdblq1sOKe/rFNYJTrcdMHIJfLXHC2BsWlUh
         12M8O4pc0vSW4Obp9nuvckLPYpq3ZLCnOEwtF7fjpThX+stJvMo9w+It59FtCP8PaRNo
         5qJRY5iKH4gZ2rV0ONjOQK+efI4TXUUmrchlElmIOSXBoeVBTgkJASvTK1q0yxzL/rNY
         w4EtltVT3j3ySzKPP034LmhYHik2DKuEU65gWIe5Oq1aypE8ATVv+TmHBn0iooJ6fPl+
         J0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896600; x=1792501400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRBbKw6gDHTQ9XxKJf4o22E8VJ8jQlCh7hemDT5P/3Y=;
        b=LUwjHEAlKs6lSwStrvhVEBoHw+jZOI7kgQfxnkTE9LL1ueaKeQmiyaf0ZTaFdPWdSc
         IOQ5GKNLKed9o7dh89KN8Mk4z2p2t6zKviQFXhJgEPnDzmdkMbqyrdwsmkkk9oPDAZdX
         Zp14O7ztW8gSvydDZPNajF7YltFYL4OvxUxIxTWJ0lAnjrkUYMJZuOFX1NSVyXaGOBix
         azvxBXxnMA/MGxfRILP+qyAuEoEyT05A66z5yl6uaYcSc3aBbzzb8ia85h6SGvFAh0c5
         vy6cI2lG15/5tPRkchOnGe0vxcl/cyZwv9M3gxCWxoFpl9N9t8CmpdlpMgzUAPM3XITQ
         DEKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxwBo17wa42ao2EmZ+/m8s2JkL1rM5ehW6Cs4IUxcIDlTZo7JMBqPeOIHXccy8/XIAk+h635cxaatZ0f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa0tc/43aDGhySxWjQfU+G3zZGyEhJVck1iGs3zKE+dSn9dUdY
	pMd4sBOzT5hdgEm3IIlS8cInzebhkJ9erTDy3bAjDg7963SYuUz9EVPXyQaSbqJZvPQj5KMmR5W
	ZK8OasBAJywBkr2d4AEOrLStI1xP/65gdAx5vh1Re5zsDPN21ntc+uWTT6CC5RshRnZs=
X-Gm-Gg: AYBFou0wr9SvAv9pS+DeHDOTfh7mzh3eLvVE4awHjUVGa2FUw1FcCjw+6M1Sqr2vJco
	WBkneT/DG3wX0dDDooyIAMfktr4sodBeC/Uz6P09KscGro1WwluyDAo6e2oaT5dFoTSAUm+Ivx0
	O5kXsioX6IqUy1TUmSyuecAwADoC1k8cunZxbtek+Z6sBGn2yMZqcJ2bbjGzcHsXwzThGlU5/nG
	EXo2aVVmVdM/KXRFDACHZgZ6FFRS/Cl1z9SJ7AB/09o/+N5T9V2Y9VrfV99LUq1RlRdSI7TBWZB
	K/OZcmlAfUstuD7UT2yKUPDjhpNa5c2KdRiSHCcd228c1QGIASzhkIjci1xkWOBzFqnMaa4Ic0X
	070+fjwPpVzkdzP4Ys+2EFb0hluHB
X-Received: by 2002:a05:6122:510c:10b0:5e8:ff32:982c with SMTP id 71dfb90a1353d-5e91e678545mr2016976e0c.10.1791896599741;
        Tue, 13 Oct 2026 06:03:19 -0700 (PDT)
X-Received: by 2002:a05:6122:510c:10b0:5e8:ff32:982c with SMTP id 71dfb90a1353d-5e91e678545mr2016955e0c.10.1791896599228;
        Tue, 13 Oct 2026 06:03:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm401795085e9.0.2026.10.13.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:03:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:03:03 +0200
Subject: [PATCH v3 4/4] gpio: kunit: add a test case for platform lookup
 tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-kunit-plat-lookup-v3-4-3907f913e964@oss.qualcomm.com>
References: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-kunit-plat-lookup-v3-0-3907f913e964@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3978;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5gfSA0wA7QRAviQ6yV/13XwVSqZuVrIvRQcLS++2aFM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqziwOTyTfZjAiMPasfctWGFSAykgZmb5j+DVB/
 ejhzsniCn6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4sDgAKCRAFnS7L/zaE
 w/u3D/4v6NOTaZghu4K2+smSMR/K3ye/cBQfElGxeu5drj31gY/dtV0JSg+VsRRAgbuAas7D/jh
 2lfAYbVXh45a1n4qcg723voOCIdHxeMIUsSUCY/fx7ImgZuQ79ppV+882lDjdBmGxtpdXpMe1D1
 pxuCXVy/rx7xusJLWW1F0KL+SZSTWGUQPDDPP4KQP41CKB6waCKJWalo5XzGnDz7rIf541bf6y9
 MUttbyaPttho895s110mDHeIa7jFtFfIusXuQ8/XWonBdRWQ0mCRYD+LRq7lbchDzWKIlFV6UEv
 YRo2lNj9e81txDWVvLiZn4pOo1SA8MjnPrDFqaf7Mopg7QYD/0BqGleRQ5c8HJ4WiIY2uQ4061j
 QHmoXptOVjwCt+Fvy76bK4anf9KoFMJi+CRZRHNnCcwGJNK7r9snWmawYePkSR9jZbgbti1twIh
 sWLnnnV65NL/1ra1aDGIHsUhzUReVB5t8ZAeZZThzli6Vr1+RWIXAUGzJiR4KCjNXyQ5N5X8dEw
 4eZeBthgv7kcahz+v4uedF2izEjo+x/7rwG99x81K7CYJan0hGjUopLzuBaUBmdLTUySVummeZv
 bg6HzdMnKQLk/VmQS86PDutvThHp4k+64SJCiCbvveV1nLgLuJcSsUqhC3SaArfmI9AhCiF9MkI
 cxRH4w8+JjLfiGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX2iggBsTmiANg
 GUsYcw3Iv6+bqX6r6uz4SNcTyv3FA7y9eFc1AdoaT+IqT1bYwJlX8gYWvNyElanl2qaROWsksZ3
 RE82On45A9dra82TUJAU60KLwcRqTLZUcz4ZmfMcnM91kHdGj2Rj/b+EaYAiKzPVF5RXzBf+vpi
 iZsMk6WJQ50xrndmX/y2nPVVvE0oTfwlQ11qTmgKFV2hOUKIBeJohUTkR6J2GfMJQ55aojv49TG
 yA6JOt5inToOhM539cyyqG+6+OovLEbHHnVBqDgH6lCH59WQc+6ast9hg3jpYwnq7/Xf5oZxs15
 08kXm3zoeVC8KlnbcUd01OpeHqRiJ1r+suFdn6tJvCPoXNMilhfpDj0VZc/jiT8vUEWbRN1P0lL
 0A614Z8vjB77z68f+c2UCMINAzySqZo7DwPfNE4pmLNTpolFz8HkwBst4jsh3UkDgOeOX12z6Xj
 miWxd3FVZwWJk2ZXvtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MSBTYWx0ZWRfX5J9qZstxbwKi
 XY3Obx4LKJrF9R8CE6V/xHAFewk9npToF2raa6n3hNJyQdRWVESNTGAFTtRS1UdIERK2GZKrIai
 vbUJrJjGcdwCdqDEUV8OVzWA78UgMoI=
X-Proofpoint-ORIG-GUID: TVhnoXb9BVutEkdVkpZUjwfCZN9gKCMC
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace2c18 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6Kgsdax8oSNbX6mdXg4A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: TVhnoXb9BVutEkdVkpZUjwfCZN9gKCMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130051

Add a kunit test-case for retrieving GPIOs using platform lookup tables.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 102 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index b662be88a08711380f938852d84809f36a8d62d0..c5d4637ea2c587622af8fd7c6173c88ac122e23f 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -18,6 +18,7 @@
 
 #include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
+#include <kunit/resource.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
@@ -828,11 +829,112 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.init = gpio_test_register_drivers,
 };
 
+KUNIT_DEFINE_ACTION_WRAPPER(gpiod_remove_lookup_table_wrapper,
+			    gpiod_remove_lookup_table,
+			    struct gpiod_lookup_table *);
+
+static int kunit_gpiod_add_lookup_table(struct kunit *test,
+					struct gpiod_lookup_table *table)
+{
+	gpiod_add_lookup_table(table);
+
+	return kunit_add_action_or_reset(test, gpiod_remove_lookup_table_wrapper, table);
+}
+
+static struct gpiod_lookup_table gpio_test_lookup_table_by_device = {
+	.dev_id = GPIO_BASE_TEST_CONSUMER,
+	.table = {
+		GPIO_LOOKUP(GPIO_TEST_PROVIDER, 0, "foo", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static void gpio_lookup_table_by_device(struct kunit *test)
+{
+	struct gpio_test_consumer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	int ret;
+
+	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_by_device);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_BASE_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_test_pdata_template,
+		.size_data = sizeof(gpio_test_pdata_template),
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	gpio_test_device_check_bound(test, &pdev->dev, true);
+
+	pdata = dev_get_platdata(&pdev->dev);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+static struct gpiod_lookup_table gpio_test_lookup_table_global = {
+	.dev_id = NULL,
+	.table = {
+		GPIO_LOOKUP(GPIO_TEST_PROVIDER, 0, "foo", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static void gpio_lookup_table_global(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct gpio_desc *desc;
+	int ret;
+
+	ret = kunit_gpiod_add_lookup_table(test, &gpio_test_lookup_table_global);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	gpio_test_device_check_bound(test, &pdev->dev, true);
+
+	desc = gpiod_get_index(NULL, "foo", 0, GPIOD_OUT_HIGH);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
+
+	gpiod_put(desc);
+}
+
+static struct kunit_case gpio_lookup_table_tests[] = {
+	KUNIT_CASE(gpio_lookup_table_by_device),
+	KUNIT_CASE(gpio_lookup_table_global),
+	{ }
+};
+
+static struct kunit_suite gpio_lookup_tables_suite = {
+	.name = "gpio-lookup-tables",
+	.test_cases = gpio_lookup_table_tests,
+	.init = gpio_test_register_drivers,
+};
+
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
 	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 	&gpio_swnode_hog_test_suite,
+	&gpio_lookup_tables_suite,
 );
 
 MODULE_DESCRIPTION("Test module for the GPIO subsystem");

-- 
2.47.3

