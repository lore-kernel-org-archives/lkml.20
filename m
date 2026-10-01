Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21E4A49A3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858488; cv=none; b=RuxO597HEysYE299XDZhBZNWMPuAY87eYsaIJrdkvp00F+1g8PomR6yD18Zoa+8+Ocp1mTa3TOW5MYWTyCAkk2VwS9KX9vtQ2Oqme3GN96Z97+AjmZc367PM1fUDD4hvy5AugXGwftd31UsPv+1xa5R/x5SSokLqHJ5PXZACn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858488; c=relaxed/simple;
	bh=17/qrJTnRapYE8MAg278jUE4dH/DJyzvWQSXIGwBq2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pySq05YhVRG5k4ZHCe2oTlWiBz2SXIhpxoSCmWHaeJKBUBkElYUEiXWRPEErHDprWx6dTDDNY7L/ssVQl5Zuvv4QWD4vzmgd7DKzcKxmZUQcH9KQJaSsWOICwRuNQyc1RPqLuwHQOTGfFMZWOr5h844JwSDLfnspH8C4y8xyg0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuCwiD2/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpZh06ef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuCwiD2/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpZh06ef"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CYaQk1512127
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biw8P3noxrC3MEcOhGUK7iTfyFomKdhAHycou3mOF34=; b=MuCwiD2/yUaObZ4j
	gIp9Mr28t6FsAseUToZoBlisU8N4NsMlhBsV67aEDsjSUgxr4oL83Gjo6HAdkUVo
	BNh7aaEmmjmIr6K8V+/iFp40HdYZLZ6azk3MdRLxwx9ejOfQy3Y0/ztviMcGln+3
	HGe06vcdJ7Oh7D559liYNp2ae0MUiOyqFUJGgOqX0z3zrKHGCTTg+zfkx/wqvHvI
	j08HFOONd/svGW6MMKlklXnaji0y2+dWRtGC02ULR/EDExE1Y6wDC2zuoKMe2bZb
	azblofDWctyDhfb9SIwAsVQVRInr64XQm0qW32kSrmQvaJJ0f3CsAXMjz2SBxg76
	PZ0p1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188suqqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:41:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso1428541785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858484; x=1791463284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biw8P3noxrC3MEcOhGUK7iTfyFomKdhAHycou3mOF34=;
        b=YpZh06ef0Yg4aTT9hkr5OsLCmv1leblv/MZ5XUFzXURs4fIn8wx0/+lD7t+KYT6KGF
         Ra8fyi3sjIMR1enteuQ7er7C29G1S6PSES5CY7NW76Xtp0cMEpEWHJb++Nm8G4Ltklyu
         7/iQZAhK2BnnLyeo7hSh+JFyOEiVRmMQslpV12jCaTAvpF/d1PK3Hx2BJirJjnJFlETb
         Bv+TUAkU09U5t2r3h9sbwtHoDoeIhKqqRI0oIcDUJhu17cPBBoKVPjC/O1LPOAUka5Cm
         UIkgLXL9dToSOTMauzXr2rq9HmLE2sBTFkc1NBwPTFbEic7r0bbEGeQ2Ldm8i5N+yZdf
         qj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858484; x=1791463284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biw8P3noxrC3MEcOhGUK7iTfyFomKdhAHycou3mOF34=;
        b=utbY1QXoJsp3sj+9+tNvp1Z5AoDF2/00BoAS87aqmjD/mucjW9JzinDOIywGCC4Uis
         0ETs4tMa91/MXHR1Ke2EbqTurK72+c29BLQWrpaZB73KWVpvwYKDCx6lhSBUt1d8BHJ6
         SNWiwJITbhVM6MJL1rdZfjwK3d3nBXbqzXC4Vef07B7jD49Od4Aj1VwMN+jriiHPPko6
         Kmy3v+6FB9S9QCji8qMIOD+ngETBx1kOB4DAwOhQmEIkq9BAuCboDWC4Uuuaomj4C1ce
         v8MPNO4R65VRitN6jfgnlzJemRKXetmTmgpebV7vBpgkO3B4vxClGNNJtQ6CcmHxFwCT
         ueWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7AvzKICab4ycGkjsNblGyegGkEcU4TdbGsLDX4vejrAn0E/XSKl2uL6CPXMESHA7ZKntiWoORdvykql0=@vger.kernel.org
X-Gm-Message-State: AFuF++mdeXRZzXB3h6O1fVxdlDbPfznQTshj8nunF81vvV+eSLHsIRrc
	O2yvl4e4FAUYemHDtkuZC+zMKgHpKg6O7LFy6he+a4N0z5MIzABK/qwHqn2GGLU2OqqOZTbEaGx
	zG3pQCRRwqlfkoP/iXEWaZzSHSZviQRYZgA27Vh0rjYM0l8z50dYrlXqXajjgR1lwLVb8IWPieW
	M=
X-Gm-Gg: AYBFou1K//Ui7DXuxIw59StuXMlCMsb94GzppS1PUopOZuQgnf85xi47pcczP7Mw8E/
	88EQTE5h1t3B/AdlR41Odi6X3ZnshPv+K+AKGizXYCuSAsAjldJZ6JEy0HSUfexZJK+lsOpnlua
	sKlS7RQ+7gDeDV6a8io9I2IW6iGD9PRFLj65Q1aBFdMzSW8UDUZq+nlzhzaSwwwcpD5UYKumyzt
	GioZe/VtbRFykZZHKOdLACUYg/6DN+/iJHZ34ziPwYHZHB+ZMmxR/pxzfogpta5IDBHDNMGpWp8
	eAMgm4FI/U3K8PDf2R9KtmAX/jmsDZrYwihvBBXxlbEv6x9nbCyYuz6RRbxEPEKc8cMF7ZRHRfK
	TgaXtzT3wT7CEdjjkePCUQCVKO1C0
X-Received: by 2002:a05:620a:1a20:b0:93b:d7a0:d9de with SMTP id af79cd13be357-93ca975f4edmr840501285a.56.1790858483603;
        Thu, 01 Oct 2026 05:41:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93b:d7a0:d9de with SMTP id af79cd13be357-93ca975f4edmr840494285a.56.1790858482899;
        Thu, 01 Oct 2026 05:41:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 14:40:56 +0200
Subject: [PATCH 4/4] gpio: kunit: add a test case for platform lookup
 tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-4-03bfa84c5dd1@oss.qualcomm.com>
References: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3967;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=17/qrJTnRapYE8MAg278jUE4dH/DJyzvWQSXIGwBq2s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTfazxoUwWwpYcEVzxf/aRF2jDeciTvTPqnD
 kSUlEMKK0eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U3wAKCRAFnS7L/zaE
 w3KhD/9iusPYFi197Y65n291CvcH0k7DU6PdphU2ms9ySEvwOvV8Ps9/Jm4HFfcbdfbtydDttYL
 FgmOQlxyFZT2QT18Sc5osYkgYPIS2biJ77acrjdNu/jeBqnbNjrKDWa3hw0XB/rll5rjWhMpIOd
 qt5Z8jD4/2bFpl+sys+kt9KVbwd3fTvs8VcoGWnDAZbv3dzdHComlqC28AOE8+YCJ46mWkIcXXL
 xU1w7+Jjtjv/6JTdx5v7tLaOWBDvWUmwSMx8PxWa8lLSHtenXowWyd2mAHtCnAYfejW0EiA3Rrz
 xuCp6Ev71cRWtCwliQj5Ur6bs2GL6EIo6xIIwByWJroty/Xl7uAcPXbkfwm2mc1UxQ8WSoo7yYY
 CtNe2WOOeAGyp5iBUMvZBXt5XD7DIfjAaKOOTMvQscGWBL1bd72tVE3sAFczuuPKyvkGq/YuPW2
 Q9YW0mny5c7d1aQI/f91tI9MozOAMD4ExbGf3MGrCenzqQU90Mfjr2Y5IpQft4jXdpdpxMqWCop
 6jfyVX0ouS/s/UgcFjdFpWyK+ViKc2KMMdrlGr72434vIS//rWr4TNAQHpnzON85W1C3ItHSRMe
 BOhBfcbenraGk/0H+8UH20LIQR3Dq06EZy9/9PdYfqLw3UodkgAlgVFuhegwC8xrr4WU3nTk3cL
 jYF4zOiCdL35MxQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfXxAweOFHNGBz1
 e8K8C9Lre9MU8Zp3VZADH1+AVP8wcsjOI3fE1gebmCaWFaBCIaYS6uCC3HJt6Zn2KQKazTjviMY
 ujKFJBhg40v6wvi/6C/CSGfXLjeN4Tg=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe54f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6Kgsdax8oSNbX6mdXg4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EwR4AT7QfMK4nI-F2gcr5vxmj5hDu34r
X-Proofpoint-GUID: EwR4AT7QfMK4nI-F2gcr5vxmj5hDu34r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX/EteOCcvMHV+
 aIhKw8tpb8x9Xsq1abk8V9cPziJQD7CFB2EJUzpsbmIwHPuOx2+D5qaNSO9aUzsCJPB4uhskfQW
 mglq1Px2c1bQTqgw31VMLOuEqxxFjPbeB+YbItXf9CTYh4xVFx/vFZ1WzF9c5ihSTm4whNHe4ic
 8RXyASFeYfEJRlFtUZFYX4cMA97+AG1MmY/Oc1SDidOoSof0OpSXSRy9YeE2K0YGBFxBOElgtVK
 Pj7xZu1aqnmoh4rKuvJhRMnpfRV88cup4jOZmDBKvb39woVxz5bGcBX10ZFF6AsG8Wm50FgqdEl
 Apq99QwMUQsS9iJ+bvKk7q0odg31h2w2GDgtgObEMUhHwh9x0LK9R+mnPPoTuF59GWwHRfOkYwK
 6Rnle8o16LcFEmTU6m9tbva0yPe3NEg+lhyUCzRLMnV/UmGcHwl4kz8xJ9DQ6j4/GShf91FbPgm
 4xQcZg1v1urrTwudNeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010050

Add a kunit test-case for retrieving GPIOs using platform lookup tables.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 101 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index eb64e1f17d1337b5f371a4c39cd9a40704bd38f3..380ad1fc46b01cbeedec95dc83c6df65f5260afd 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -18,6 +18,7 @@
 
 #include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
+#include <kunit/resource.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
@@ -829,11 +830,111 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
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
+		.data = &gpio_swnode_pdata_template,
+		.size_data = sizeof(gpio_swnode_pdata_template),
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
+	struct gpio_test_consumer_pdata *pdata;
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
+	desc = gpiod_get_index(NULL, "foo", 0, GPIO_ACTIVE_HIGH);
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

