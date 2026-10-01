Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9749E151
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858481; cv=none; b=d/vq0moSyIVXwdaBI5fxBs+OHU+UBdJm7I2seuwOVXjyrEqARB4uNpc57OvwYpUf6e4GmfDK9vAl3uQ13RWFUSGuTxcx5HF2SnpfHkOwGRYBb4lEh3qGLpMIEv9cYv+ZXPE9wwydbNyOcXGBm4cTy6l73bO73vu0vKbFCarL/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858481; c=relaxed/simple;
	bh=8e/GLgxNv4hsaieYY+r7wjyUbyQjQXGdfzgUDM1kip0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4x7ajZ2WXdpHtFWrkOgyfSV/V3nI1U+nALGQ6uDFWfo0fV7IbSykxFrNbu+1BVNoNqGN3HPxR2f+xhm8kL+MRCOgQC5SGtKN0ZbrXU66AIOOGqzqOL2KE+wgYybGjTGNWgvwXQYtVz9QQu+mHVavOQK8tv/DqlMXKxeqTB9YDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgMY3Rrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LokWqIKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgMY3Rrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LokWqIKu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CAJve2176881
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foYqua58JAv4GBa0HFqaLV0MhIXPeBOU/62ShV+OcrQ=; b=LgMY3RrpbAQDl1bI
	KiuXSHbClNKSXbYFi5nSXCq2tz2gwXee/addUfKniaH2K7rF31yD3luhBPNVBWEN
	nMzQ57CiPjKG4hLsCvaiiZC4yU8AiwlDpHjD3ibFDbmBSxEl4eZpjevdMiU10bQn
	J4G5L1URlRnu2MpdYZ5ny2WfkumDWasSufQJUpzwoApVji/UXTeho02A/Lp+zXVX
	M6Lf4eeRwd/PsPYq2wh31xRwzfivkGDjQR1N4tWZ1tVmdw7/UvfgT/yLNf0OizWW
	1bzNmNDOG5xz1M/Sbh4t6M3zfV1GWorZAKecXUcHxo3yySoI6B/+BnHoUy6e7rRW
	Y3IC2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsu5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:41:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso236268285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858476; x=1791463276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=foYqua58JAv4GBa0HFqaLV0MhIXPeBOU/62ShV+OcrQ=;
        b=LokWqIKuxPyMLFhluQX1OASReAwuQW4MEGKPjOK1F14F6F+A4c+e0D+Xy0KvH/GbjY
         m21Wh7a/xeLiCn3pBxM+uxbeF24sBmFZjnPd88NMXuiLEWWCpcCXXkRLLzRUhDz68qeJ
         apxEjQmx27PM5EfY6pUncFcT0WikC5ttxhYPO3LjKPfOGV/isPSMNDb4dhqfE3Mh4PBh
         otkQHdia4BBGEuZpVwGL5FAPXHuAO6m0YdKGdB5OvBdAsuh7LD5gPZCbUT03WubVlEmI
         D2HS11ZQmTgcahqOm0SvmOL8/oR7EJj0fV0eb+SSZ9YqwzIdyzwPcnSnp3tlIE2b+r8I
         ijzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858476; x=1791463276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foYqua58JAv4GBa0HFqaLV0MhIXPeBOU/62ShV+OcrQ=;
        b=gJYjS3ViblmlLP1v8TkHZvl3t5JL04XagjZ4OoEdj/OUqY3G8lzG0vrNaFGMQAFeYF
         BW7ehWCzWiwm2W2SRBe4C6NEIGFcOyrWxIJz/CuSGvfc8huiaTxEhGed8Urz1mENGVRh
         Qa0/7I0/x4hXoWLB3xcQifsjpwBud2DIy6wruTcRh0Q+KLX8/tCvdz6Z7lwoEN0Za5W7
         iVgsmCPyTCA25C5TfV4IXnlhVLESo16o8wsVWN0HjUbO1ugJ4oS4uUrKirv3F+SLiYHo
         TpRc3KHh+SlMdINgwgC3wLD4DOzFE49JrhVDGw6mMtok3+qvsYShHbl+GXuPCinZup5C
         v5vg==
X-Forwarded-Encrypted: i=1; AKwUvBzjtO2x6Sc6CaYdH5rp1a3bhhiPK/DQUbXdYZIrvieeXvS4/szH1+Ab1QDKRgBHRaJKj347mF8M1uybP1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kNni/WMVYQkHUFS1jL3p1TwHkRozPkJDIvKr+jNu8YHNutAJAo
	vjWYv8sIwL+Y7yerf+6EE2S0v87yjSXqLvGK6MwPJt2h8PoFra7VUXSRE1wMwwbLMDhnGSDl1gv
	yB1QlcvTxSmr9DO1SQZId+kSAy2luIeaoMlqkuERrjolMyh8FsLAjdmHPpvkqdk7739I=
X-Gm-Gg: AYBFou2/KYzAH6aotLqBN4dbzClPyR3p4wJi2jjH7HcK14oRTQ+8IUISlNEJpRGxXgp
	06ct1ABHGziv/6IkGaND1Pmo/FbC7XylLy2/CL0TVFlvBbV7HlHKBTg5+Ni0MQPdF8ajCAkr/RI
	eGS6m2LXN5QV2p6sqIXyuFbLWI7RzjdriEJDtqXGNgPvu0ja49cHdwyMLM4f5PkCGQJPp6nAwcN
	44YzH/rrw+R9/h27F+sNi+kWKdEamLiMWsvKGhF+FqfY93iPJoYboPqn2FGgDiqm3/9+t6eJsLj
	xwN/XytQ/LTirdnQxrB47IHYjbAmc64qoND14RSS2C4WGNs2AVRDjUJeSOw+CTj7Lz8GdPwH6To
	pNTLq5Mo2F7EBh+KYrca0EXf0IpGY
X-Received: by 2002:a05:620a:4487:b0:93c:2ac6:37ca with SMTP id af79cd13be357-93ca96d7c1amr842690185a.34.1790858475374;
        Thu, 01 Oct 2026 05:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:93c:2ac6:37ca with SMTP id af79cd13be357-93ca96d7c1amr842684785a.34.1790858474838;
        Thu, 01 Oct 2026 05:41:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm6978867f8f.22.2026.10.01.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:41:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 14:40:54 +0200
Subject: [PATCH 2/4] gpio: kunit: factor out common code for waiting for
 device probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-kunit-plat-lookup-v1-2-03bfa84c5dd1@oss.qualcomm.com>
References: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-kunit-plat-lookup-v1-0-03bfa84c5dd1@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7417;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8e/GLgxNv4hsaieYY+r7wjyUbyQjQXGdfzgUDM1kip0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvlTccfbQ5Lvj+KDVQkLxoZt9bs3zg+PQmWMi7
 ouRGtjZkZiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5U3AAKCRAFnS7L/zaE
 w8c1D/9mQYO9hdPtor3cnFxipKqxydbs5Y2yK4IP6sfXHvs42AFCSULhoHPbRuHQPO9LD+wZUOX
 caH4UnUJ0K+sRMyVEaIEZnE7WlVAV8sg9S2m5XCS2JE75Yh6vOzjPf9mROMunBMz51Yg7WTZeGx
 siw8vFt9G8WE7ffoQpcEkFNiKOoStKLEEI5PPQbsZQDCVTKvaBBYwO7qWyN8A2+Gv/3fbHgGnaW
 mGtmFLA5kU6CksASvR4jF2g0GxUCI4ZNtSqqEFLisctHM12T2zl3lbPPanpkLsSCl7XE8dTXZ3n
 Pef9zVmT0aBcT6RvEYfRdpeb+l1bXfJUZmtBXOvjOf00/6wUXHglj2zKDK/7bVEWDuA3zZSAmGX
 P/wlOPOtCqlIb2d29UbFPY5RS3TmTdoCK1bxdqQm4hO9M55CuGTNHZtnW4LBoY50yeRBnvvA2w7
 DXWlAOFa3/Z+WThFRIdEukM0B6qtG5ghc35u7p4FuwoXabkYChj6mlf0b7ThFKVR93K5n6nqb9B
 jan3AdDQk4ORRujgZKdA5WGxcTyibCcBJ//+VzHTFo8Wbtyvy+Qt6TepxVU3IPGwNxeQE+vNvSU
 F9nxaJjfgfSEfjV39xGxqklm99WMrxjkf7EesYN81q1gwRqytYJrDfv5m936R1Pt8I9dcr7ATP0
 t/mugYp4NwUf0fg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe54ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=f8cV-Q5T5NN2lyXj7YIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3PJ+F479WVDu
 CdL8Z/4KAgcFYJQHgF5KhjFnmj5IABv8tXFKyCCMGeZogp4UBuw5un6o43PwG61FwE2j8e0UX3T
 cppHBsrdSuMK6eQwyAjfzVUEwM7rlIc=
X-Proofpoint-ORIG-GUID: wlo-ypofuPIn9VYmcVtsDo4hiZ0vNdcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX/J4g/n+UkYkw
 5aoc4cRWkSP4oR9fahFzqhCHvqNsFczuAzQdUsItwp6HvJ/RZ/1PwLs6Wb0TTrBZBWLAgbcNVfT
 1/TAgLWHwrSVGcNp4WUyR1c2c5No76wLBR+ipAc07hE/3t5FQWCHqef1obAMDlgMAsIGTMWUD00
 wdrg/4joATevQj+EK65lVTXhylY0/I/qnX8ftTjkyGdnGMfMRAN5rCNUINbVlle4kppnFZJw8Dz
 YRJUcfubDLRlZVzchl3HCL1boNRoRQKODySNZvuFxpRoQ8Em3s7N8VHfKHgLQ1A43UIxT9vZuA2
 xSNRl8Mf5KoP9UUK6HmRa68A33Wha3EULmyDBTBCDSWA1+2RjgndxDFYjoOedq2vCF+JtI5TjgP
 eYt7XYtPvqTeY+bk+nFth7b8BPnamvo+5PI2f5ozY6awdYpHwoi3ncawyxXsIIP+H8Huhavf6YF
 WzXcFty+v1oyeI2/etA==
X-Proofpoint-GUID: wlo-ypofuPIn9VYmcVtsDo4hiZ0vNdcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050

We repeat the same sequence of function calls when waiting synchronously
for a device to probe. Put them into a dedicated helper function and
shrink the test-case code in the process.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 80 ++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 09bbbbbde61694dd8b201ad699ed1943f6bfc48d..2dc000c6201d9983b16aec3f1368509756fe7800 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
@@ -28,6 +29,21 @@
 
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
@@ -178,7 +194,6 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *pdev;
-	bool bound = false;
 
 	pdevinfo = (struct platform_device_info){
 		.name = GPIO_TEST_PROVIDER,
@@ -205,11 +220,7 @@ static void gpio_swnode_lookup_by_primary(struct kunit *test)
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
@@ -222,7 +233,6 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
 	struct property_entry properties[2];
 	struct fwnode_handle *primary;
 	struct platform_device *pdev;
-	bool bound = false;
 
 	/*
 	 * Can't live on the stack as it will still get referenced in cleanup
@@ -259,11 +269,7 @@ static void gpio_swnode_lookup_by_secondary(struct kunit *test)
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
@@ -333,7 +339,6 @@ static void gpio_swnode_probe_order(struct kunit *test)
 	struct gpio_probe_order_pdata *pdata;
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -364,11 +369,7 @@ static void gpio_swnode_probe_order(struct kunit *test)
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
@@ -383,15 +384,8 @@ static void gpio_swnode_probe_order(struct kunit *test)
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
@@ -453,7 +447,6 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct platform_device *prvd, *cons;
 	struct fwnode_handle *fwnode;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -477,11 +470,7 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
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
@@ -499,15 +488,8 @@ static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
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
@@ -604,7 +586,6 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	struct platform_device_info pdevinfo;
 	struct property_entry properties[2];
 	struct platform_device *prvd, *cons;
-	bool bound = false;
 	int ret;
 
 	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
@@ -645,11 +626,7 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 	ret = kunit_platform_device_add(test, cons);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	wait_for_device_probe();
-	scoped_guard(device, &cons->dev)
-		bound = device_is_bound(&cons->dev);
-
-	KUNIT_ASSERT_TRUE(test, bound);
+	gpio_test_device_check_bound(test, &cons->dev, true);
 
 	kunit_platform_device_unregister(test, prvd);
 
@@ -761,7 +738,6 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
 	struct platform_device *pdev;
 	struct fwnode_handle *fwnode;
 	struct gpio_desc *desc;
-	bool bound = true;
 	int ret;
 
 	fwnode = software_node_fwnode(&gpio_test_provider_swnode);
@@ -806,11 +782,7 @@ static void gpio_hog_assert(struct kunit *test, unsigned int offset,
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

