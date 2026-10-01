Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20344A0F05
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858485; cv=none; b=X0iFafYA4h0u++kLmYihZeKQjk/ov9YZZfK+1qelb7IEz9DEuNecxBtM/F03aU7gAjqqz5V/5cY3ppuEPqPpjJdrYktnaVHcHivRVcdfhj/R/VtC0oIWowcM7Hh1K6TTindeRVn5k5YNId+eqEHOL0YPEY+CfeUrWMbt/2nl1jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858485; c=relaxed/simple;
	bh=xeFPd9gSPUnT5me7qsk2JkqlpWvW4NjnMwbYLeyc4jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDjA3WLaynxtDthiDCgOo7I2KnP07uYph0DS//dH8nz3vojOxZ/5fv+pmkgz9YuEuH/Ggsz5fcm4cBd+lWvd/suK7texlVm2IkzUdHFh2N87nj+J9QMnPS36Dsn+dyuELss2DXeNrA78Q+2HrZeNU55NwYs3wnPmlcNpWUThVhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaSszHP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bdye+Db9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaSszHP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bdye+Db9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xkOJ396169
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=; b=kaSszHP/wcXA76hT
	M/o9OOUHM8VaMXKPmhg1Icv7D0McNy98KPtcHH5ucwaXGXy8c0YfwpMfLggFgEiR
	lrI+wYCZS6C8KNTK+gAp+BIeDhtSPLeXxrwfizb3PNiROQWjBu/y59PU3T07ggYN
	SzWlfcpR1apJPhp0xUBnHoYatvUtfQzsc98qL6ZO2Br95R9ZBumhS7XjN9tBe/DI
	t6gMDa8BqXszAdFIvNUIn1vJ0QWYCam2Swt6RhJAL6T5G752PE1pdIRe7x9xb5VU
	Ao4PYVRHUCjhsZwG2zHPPrZNv10D6gA+lgLmpaP2RkxMEoEpqdNoTk3B/0GsYDbu
	bVcWQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5axa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:41:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179524bf03so54903446d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858480; x=1791463280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=;
        b=Bdye+Db9p0cwhoJ8T8qtCTPzMQiFMo5I9M2rBfPGu3+3IiwJ4fV+sGnawBGRlhjP1s
         iiWeJIr64x1X/1NXWun1PCC/V9IZISdVB41jnWNWNZ22KzfAOHA2g8Y8CO1v+E+L4cxz
         37izgE9XtCyNYFrkfFwyM0fLa3R0ZH6BENMJqXHiukNGpglLDGNuPDUEgcwWg43+6xuZ
         iM3XWVJbFqKDZK7X33iuws5FXIeNzc+0yI54dei0LUV4E8Bn0JrS8vO2CynTUexAYeaO
         mnglKka//UNWS+XjqD3xxAl6GWNL/cf8hgSXZEL0NN6FfHwaJrPCxRg30xEA3YvVZODe
         /h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858480; x=1791463280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1P1BLu0CM5Nggmsns3W5UVApS+hXi8+FwmrX4InjHM=;
        b=KcLd+jJfzvLTCBb8dvQJqraSNIFn9brNSUzbTXeXx/AKRHW3C2PravmP4spkLVdgzX
         MofPdZZ1bF/ZLw13Z73ZvmZ8F3U7Ds4eY7b5B67HjPX81t7iGrXmZsxA2IsMAjpckxyl
         9kreKuwJO2AnaCwY6kE8MrHqpmBJidL/Z/JIOSwT9aFqX2gmj0buiRN4QRgFeze7KR+i
         Oqd+xQkN4qpVW5A33v19lGlB0SyQOjwWeSeajXs/QUkHPWfrYtT6uqauJ7vALLpo+xGu
         XBXW8k2r8N7+NsdKuY96wI4Yw3iXtW4bpEqbSiNoXCtb//xONjLGrzYrI/5N90VnvCBE
         s+RQ==
X-Forwarded-Encrypted: i=1; AKwUvByfFTw+93DNw+Cdnjbdn7jyVDXOHhKbu1z6MyLn+pq4YuLCQ/+WV4LA0KdXXbIdnl3NF+qz5unQqxEA5/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kqeepjbK6o4RsZDLLN6ZTqMMfMIeWZRZ3b+q+Ehj8x7t/EkdCB
	Eeq4gxHEab7FG/5Xi4lxKs1ui5hxI+FnENNWKL132CK1d3toAP7t4XaUmQdVZBOJBYaXOqBrco/
	dEvm0BbAO0FaQw+WlwQLqVotJhukq+fEL9ptnnkjoxkU4q5b9sLjHw5xcR2ggbZuuGWI=
X-Gm-Gg: AYBFou0TC+ZkL4EJgHsMv6qYLChzviTs/lqIM3ZUrJA6pbND+iPy/yEfI+8xF3m8UR+
	l2NtmC77ZWC90yX8ljMykPMe4DxDuZVsG4i9q5APiJkwVWFCQxT98mFH5E2kOkXd9Ub+cfP0t9t
	IrLgSlYdTb8VL+B5LjNQVOJ+ULQJS17PehW/L/adricz35nsuNt5thondviciA1rwUES5e0SjIn
	IkGzYAdvvBLNsDz4dWiBqnCe1J9aO0ZSqTzSDMd0qYAWVoJFPWpljE4394gBgpRcRHKTmcaxb+N
	DANQU6qfebA9dnu1PmgANJyC6xGwECaZp/2Dp7bmQoNpSFZ0Sev/iT9btKUr+qLg51aoaH5OB+s
	YEd25XW7RKCTaRj67r/nbi90W+SlA
X-Received: by 2002:a05:620a:c52:b0:93c:68f0:f098 with SMTP id af79cd13be357-93ca9779490mr822867985a.20.1790858479969;
        Thu, 01 Oct 2026 05:41:19 -0700 (PDT)
X-Received: by 2002:a05:620a:c52:b0:93c:68f0:f098 with SMTP id af79cd13be357-93ca9779490mr822862385a.20.1790858479342;
        Thu, 01 Oct 2026 05:41:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 14:40:55 +0200
Subject: [PATCH 3/4] gpio: kunit: rename the swnode consumer to a more
 generic test consumer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-3-03bfa84c5dd1@oss.qualcomm.com>
References: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5697;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xeFPd9gSPUnT5me7qsk2JkqlpWvW4NjnMwbYLeyc4jc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTe3320T2XTkuE3pEYofMFzpda5Z3b/1sAs0
 QSnnMUarmSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U3gAKCRAFnS7L/zaE
 w+DnD/4rGqkPypuipmC36i+35UxmV9EcvyNR+HtQiuZcI44qa5pcnudi0EALTG1nFeYGrlkM1j4
 d1Z6O1xMlh+Q29S8sDiub49WFN1dYpWf4UlJOcso8qXdgOBvPCctXZFlRFDW7z4/hkIofckPPYE
 yS5mlF5TzY/ocyeEoVhDDWtwkD4+AFhAWY4frWnLxIgN5p+c9rIl3efO1XBlxxCtxZBeTTebBLy
 UN9c7Q+a7vS251WUEWJMtwy9RHAYxFwGn2PC5pLlg0rrlfLg0VurZRGBYeU+r2j8mWk372Bup72
 IwMUXn/rQtRAyIkbtYq48mYTzi/u3UUSAmnH2NF2yRgqAd9keKifnTmzuYBxUKUY3sCsOLHYMNg
 gUBolu2OsjgAEnOszyHhH7YDCuGsAVj2obansbLCZvWkNXv7o2ftDaQVGzvmP0nS5uRwyXfRUtw
 Wo3VwT9xWFbwZCPvvvB4wGCWOX++/Q2Mw/5hwxE5+I0/71aAtIj6e2sMQS9SvGYf6ibNqO46MAR
 crsWJWMJoFkCHukw/sZzsflXeOY75vgSSsb+uNG4VhJBSwtI1kdUy4eLV+oLJ6FBSggCRshm5P2
 Pu6Ia/elFfieKweKfqOEVHT+KHHfLSd66Q1wm3V5kK9GJfvM/Dlf1hUcjxyKwvgM9iuaWBo7mAo
 cAE4KEFBUGqZbPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX5Z6QEz5RumDv
 ZYU7eDludO+gtqRHNQQ6g4OMLJLq0590QZGsti7YqkEHqontCMzNbl9jnS8kFkYgeNUh3wNRUCX
 aij/K4Z1CqCERokPNmjbJz1672yWsCoUSfuIRHPM6QXujUngxX7j1UG3T7dU/+q3d4KnO1Up5Om
 MYpdWr830731nBzadz56+/BdsNkp6DyEWyVCsT2D1la7pDUniXvg5ECOxRuv2BQx69RPK0rSOgY
 1gZ1YykwaHcssyvjci6T7qdeNNlKYnCZxusKEZOHR0y+DtBGcvqTKMCkitIjI2dIa9VGlGvJrgq
 lSnYqCTx/AYF2pDi0TnrLlNU1kqZzIAUgt93zbNeAtRj+wJ6r+bVjxZegaFJ0T4hiXqHAjeSfhz
 twNXzmCA9Sh7mQPz2LX7FRALNOlZrxvo8ZclEplXNXr2r9Bd9XOvz57QNn0me79EPjFFEIBkHLh
 BoKqMA6KpbnPjzy9fhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX4a+l3xbwhxFM
 c59abCIoBqZpgkr2SLp/2Rk8IEfuD4SRArWPOlhF+t2fMPO4KPEpEnXNHtwUb9qL9Tw+Yzb9kcG
 a0rzjgrK9CYYyF7AN0pWGn0kz19t0Wc=
X-Proofpoint-ORIG-GUID: eN7BmJrCEAojKfRYwwQTyElGGt57DGvI
X-Proofpoint-GUID: eN7BmJrCEAojKfRYwwQTyElGGt57DGvI
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe54f1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZYxMm2tPHDp-qjSs8_8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

Ahead of reusing the existing code in machine lookup test cases, rename
the swnode consumer variables and functions to a more generic "test
consumer".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 2dc000c6201d9983b16aec3f1368509756fe7800..eb64e1f17d1337b5f371a4c39cd9a40704bd38f3 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -21,7 +21,7 @@
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
-#define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_BASE_TEST_CONSUMER		"gpio-base-test-consumer"
 #define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
 #define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
@@ -141,20 +141,20 @@ static const struct software_node gpio_test_provider_swnode = {
 	.name = "gpio-test-provider-primary",
 };
 
-struct gpio_swnode_consumer_pdata {
+struct gpio_test_consumer_pdata {
 	bool gpio_ok;
 	int errno;
 };
 
-static const struct gpio_swnode_consumer_pdata gpio_swnode_pdata_template = {
+static const struct gpio_test_consumer_pdata gpio_swnode_pdata_template = {
 	.gpio_ok = false,
 	.errno = 0,
 };
 
-static int gpio_swnode_consumer_probe(struct platform_device *pdev)
+static int gpio_test_consumer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct gpio_swnode_consumer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_test_consumer_pdata *pdata = dev_get_platdata(dev);
 	struct gpio_desc *desc;
 
 	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
@@ -168,21 +168,21 @@ static int gpio_swnode_consumer_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver gpio_swnode_consumer_driver = {
-	.probe = gpio_swnode_consumer_probe,
+static struct platform_driver gpio_test_consumer_driver = {
+	.probe = gpio_test_consumer_probe,
 	.driver = {
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 	},
 };
 
-static int gpio_swnode_register_drivers(struct kunit *test)
+static int gpio_test_register_drivers(struct kunit *test)
 {
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ret = kunit_platform_driver_register(test, &gpio_swnode_consumer_driver);
+	ret = kunit_platform_driver_register(test, &gpio_test_consumer_driver);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	return 0;
@@ -190,7 +190,7 @@ static int gpio_swnode_register_drivers(struct kunit *test)
 
 static void gpio_swnode_lookup_by_primary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -210,7 +210,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -228,7 +228,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 
 static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
@@ -259,7 +259,7 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -284,7 +284,7 @@ static struct kunit_case gpio_swnode_lookup_tests[] = {
 static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.name = "gpio-swnode-lookup",
 	.test_cases = gpio_swnode_lookup_tests,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 static void gpio_swnode_unregister_swnode(void *data)
@@ -732,7 +732,7 @@ static const struct software_node *const gpio_hog_swnodes[] = {
 static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 			    int expected_direction)
 {
-	struct gpio_swnode_consumer_pdata *pdata;
+	struct gpio_test_consumer_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
@@ -772,7 +772,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	properties[1] = (struct property_entry){ };
 
 	pdevinfo = (struct platform_device_info){
-		.name = GPIO_SWNODE_TEST_CONSUMER,
+		.name = GPIO_BASE_TEST_CONSUMER,
 		.id = PLATFORM_DEVID_NONE,
 		.data = &gpio_swnode_pdata_template,
 		.size_data = sizeof(gpio_swnode_pdata_template),
@@ -826,7 +826,7 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.test_cases = gpio_swnode_hog_tests,
 	.suite_init = gpio_hog_suite_init,
 	.suite_exit = gpio_hog_suite_exit,
-	.init = gpio_swnode_register_drivers,
+	.init = gpio_test_register_drivers,
 };
 
 kunit_test_suites(

-- 
2.47.3

