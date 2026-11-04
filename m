Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788704;
	b=PH02kQ6DxlWv05mPrWY0KmCMwjqmXYjcsAnHewb50so84A77BSaNpYV6DY2bSq55jmI2
	 WtmeQMgpDNRDE/9nPjlyN/hlFzgvLomkofeR4xGILZ8Tm/s2QdCjJXtwllmdgPirPPZrZ
	 s+xgx1/L42SPWVx4ntphBMhTMOpUC5lFkMyeb+AgdCuq0rRE/WY3EZOTuyghGyDwm10AE
	 01qLStWiNCRJ59PhFO0iV40GYoGlYHZILR8jWfpW5RZLFZkRgWQTMUPq8KF7g4qwzaeOC
	 JrweuS8ReAlmSkeqjdBIf1jr5vlCrfvRf6wF6ik6tWjYi+ybeu6+6iWkTkSwcupkhmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
	b=TuQJ1luokniXNwS5LxlI7C1WpVkULUqVD9ko6mkxXsDmcZ7sC5UK9WMPv0O7eCzQ04Lm
	 jpOyX9Qq4FItDUsoVj1wH662hqg3Ao+OIuEhFHyGr4SVl8019l9vcMXgrU3qck8y/Y0as
	 eygpDqK5RM+1SpkhwmLAoKatE8INNfxDZxr3Cu6ZO3FjDJXyqiZqjuziBdQJEXzc1fy5k
	 T5Q3Le+RYHR4G5LPOfsE6zg4jZzwSkqUH4DMryIP88dSYAkRSDKvW5rnzyRGUIdrSwxzn
	 uK7qWOo0Lx5zdvwFD9ON/9yub9eZybqFkGrI1yeWELAJs+k9gBFElBzHb3wran3vp2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bls0judm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kplOW5Nd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA773606A333
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA773606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bls0judm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kplOW5Nd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KXrC3875532
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=; b=bls0judmASkZ8409
	TRfcUw/jNnwXhwf4YZVlPCAcgxuT3g1r8+Lm5NjyGmzWd/E683i4b7DqFgqLgKCS
	xkeJNEpCHTAwnqrGyPOusWcDuDILbhPvfIOGJElHxvH9GkQe7qEIIsGWdu822dHF
	xJ3uVLuiI9rkwttwDRuRDpHFXRDGqPKEKgIo/NPsSxN+4IEgIQAXvACSTBcCs+pS
	+2RmW2Yv+ujLvv6tK3NG29iU+VGOewjLmDmV/52uSede+x60EzxlX6ekc4GN953z
	1PxAiNDFziB2ARaFwn736fOFcROFMSyPe+QNXPoQzxchcMiX1/IIq4TDjO1KcEem
	nG0eow==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb09jx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:38:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99870ee564fso414195241.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788702; x=1794393502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
        b=kplOW5NdaahtWWhDAm5IilpMStJTPQTJcuZviLDLTyALdl6522mWngri408unVNH0C
         9cMHiSx9YfzE+Bqr/59TtLrb6VLzb3b9e0V/aXZyWrRBaNB3KCjNXNl458ozRfzCJ+FE
         EcJKh0h3VlSwoHErPDk3gs9T1r6HSiMnh1t5+2+NSQ2cPwxKiUvZGSNAbITgeYpuw+ga
         jQ1mC5Rhtx0FLfL+0V/ShPaI8zWAgZTE0NT8isQzKue7Kx3t4FIbXsmr0GW2CrxzxlU8
         WJv83x731Jii1OYp7lnfF4ZXXz5ssV1B1BytBH1YC2MVUPHXIfJ62eJiXCPa5QnH/m4V
         YeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788702; x=1794393502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jmLaa2Ndelru6cWeVd5V82e24xRVMrLml2FV29QRFE=;
        b=sTHEhedOFUoKN40XZoJmKMx+wMvZ7b/IW2pexaTcSf4RO5k54u3gzE34ASL9MHWUeI
         /WDr374vpkSvAVK7ddI391psUssaqZy2TEiPV2ECEMvWVNAkDUgZmuGfMSxPWVFm0ro+
         VPFQVNKcGsnZBOgDtgXescJJpZDQBPRK6XgpFrmqtiZL49v966snqTFi+P+sPffT33f5
         ktNJDX9j+ToDzdm8gogIRgOMK6ITtB/ZOVOnVG/ZUmy23HDvPqD7O6YdseJfnGQQmltj
         1Zwan55WVXdH+rBbscSdh2mwTJQAlefS0/n3xlSMYBP2cPOh4AoQvvBTTEdYfijsURsJ
         faUw==
X-Forwarded-Encrypted: i=1; AKwUvBwkq57nqzhq2cSBiwaZmjv7W20bWbG22Wxla0myUjgXymI56f5l5I8E/vykugSRtAUriWmHMjuiQSFtkTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vTUCqPEfBjJUH3bcPZrL3BLWNeacuDVthvuaosD8OhkufU51J
	mcNP+vKf9v5x2rQs8bKYQkz47EQljEwOg+YXF1M6VTCSvf+oUPlOD4XAiYIwgd/ksbvIpRWAS4K
	MbZrzGFYOAm8+xSS+QqWsiEEbet51AlDSEeR90TyIPysT9nomqqMfODCrimO2ttgFfnM=
X-Gm-Gg: AYBFou1RMP+o6ylCJWsAVUJwjkXkAQhQ5Nn1LI8YpnOy7ytav4HrNj7AtUWBe9znFJB
	QY5dONNHkRay47NcHpGjXQ0l8BjQGkf5G82JieEYnY0/Tbfyfdz0xdObkZ9OIcm+dot1BAqmA3w
	ZUtSyM0OayxgqSW6Y9+1uuXkkMEHnqhpk9ZSmzgZUw4UfY3t2f4GnHVSF5b5k6OT2PI39VF8yYq
	CUt2gAzHUhVHAuDsbA1zyJgqTQ2MKv5FeKIsh8IRDP7eegyZIJIwdWBXHhz/KsMhxuTYycg0Tu2
	VDDid/HbivDYAAg9nDQuGKWNBUjznx49SdYmlRiQ6uYOnwii8dvvTApXS8EWGDUdnhmyqIH2skL
	IU2/+mwddqYN+ibxJgWQarcXkSrva46SYSA6ofq7aZRvuRebOF0O3JS/oJT0hnI4tfqGWUp4zYD
	J4OQ==
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr6832152137.35.1793788701915;
        Wed, 04 Nov 2026 02:38:21 -0800 (PST)
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr6832139137.35.1793788701298;
        Wed, 04 Nov 2026 02:38:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:12 +0100
Subject: [PATCH v11 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-5-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10463;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vfpt8vKe1i7wgPJEPc6hSex7r3YX4WW18es7Af3sNRg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSMXSqTVxNEZZ3KG4nknm+Lp9xvrRdDSbEn
 R9b8dX+VASJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 wwvsEACg4hgWMKnEXYIV0sNiEvsqBKdhJ8/qg+yDn0ULFSyUZ0glJWriZs24ODGP1MG3syeQZXi
 iPWp538HPKeFrTdQTFrLcF7y7by9Aaxj/imZ/Xd1AoaTGyvhObjlwTLVBQU5tDIxN8Rf/8HyySB
 T6zFLTh78C6ZwmJGFQlzL/vgT6up4RS/Z+PRZtFrYHAMVRr84ALgFoG9oOlzri9CG1cXtLhEmK8
 hPZb4sCztoh82qGeSbUxcrECwSQCZEGeNkyVtByEgQLvwimDPf88hU/HE7gypV8UC38mTWQlbrV
 A8AapWLqpwT9CSw6IuodMYYcBHvf6OMLxgFIYGBXvUeezF8nmj/3XUOgLgr2BKh4PRSoXZUqvJb
 SMlUNY5uctKLtMDxBM/JntaUueLFjjNrSw4yZJDkqgeRYWLYfNLCGRwQ62CquyLoclMEHCSk96S
 G68ocsVF+NtOda+iz5sCaq75D4172e7i8PV1Lmv1koW5uQSO1OoaPhJA2F4kER0DW+eIwffEnml
 X1qxwz7XfU+d6ImmNg/Q8kb4sb72hOi5jLKVkpFbfnWbQlKOkZ4H6f3S4F6NDXKnABV75k7vnZ/
 h7uvhpedqw1/VjLMWPIfTs0ewQukx8ZM1Bip+GVPXbICW71XfOxa7pkvRA0ygjmf2mIRtGhSf9O
 3ffer21HR+U7mBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfXxW7LcQUp9Tk8
 w1XiHMu3E8JItZlqj1DwDofotOvhTd9105oTlUk3U+Up4j8rtq87BpFKzBbFHvEu2Qv5KKWwiv4
 LF2qDrkVsArJedK5AlK7Qf9ON1byCcs=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb0b1f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Kgpy9_VVMJhbcq1J-EAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: b6hEFi7_aoqXq_WARSeKpXazpOns1szJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX7Y9A6yoXSoCg
 j+aD+t/Ua7KbXdkkZfCquvtLTHIkBXv9LZNjKJsm2znt95PHKJgyGnkpsrxd1kL1Be/D4r5GVaH
 2CSRxPw733xPB2DsSuoQTuCgpxMEa/bDKm2DIw2I8JM0nhHmYPxReljQwJtK4yzEJMV9D56GqFn
 uC8s+FAkkrtrMrKjKImsPBBGn9Dtmu7o5lWhDZNnzdWil6a5tmdN1vE+5nZGIyOpev0xKGZTs3K
 2vvaEUhm4l9BkDV9RGLbeFNWg4c/YJIrJBhpRmf7acLHWJYBAgfzyrwX/g3jhJvCkp8AffAQgni
 5Mh+THjDxSS01zyE5phyCPJycFS8jm9pcz0e0nD9ExplKBsMp/EwBHJCD8qYgsRffsIGHKI31wp
 yr+JjtWDeLHHt1aMpnAeXjORG4IJY+esbZ8QWeLx9d657G+eVWTRcEYDI2uDP0Erf34qlKzijdZ
 Vd/VPRdjlwi04EEaZQw==
X-Proofpoint-ORIG-GUID: b6hEFi7_aoqXq_WARSeKpXazpOns1szJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices which allow us - once the correct struct gpio_shared_ref
is found - to find the target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 145 +++++++++++++++++++++---------------------
 drivers/gpio/gpiolib-shared.h |  15 ++---
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 82 insertions(+), 98 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 7270a861bb5d787d41b7e2f055d707415774256f..cc13ec1e674282bf26e5a59fe110b5334a72f79f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,11 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
-	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct fwnode_handle *proxy_fwnode;
+	struct lock_class_key lock_key;
 	bool is_reset_gpio;
 };
 
@@ -303,56 +303,76 @@ static int gpio_shared_of_scan(void)
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct auxiliary_device *proxy = to_auxiliary_dev(dev);
 
-	ida_free(&gpio_shared_ida, adev->id);
-	kfree(adev);
+	ida_free(&gpio_shared_ida, proxy->id);
+	kfree(proxy);
 }
 
 static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev;
+	struct property_entry properties = { };
+	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
+	struct device *dev;
 	int ret, id;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
+	proxy = kzalloc_obj(*proxy);
+	if (!proxy)
 		return -ENOMEM;
 
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_proxy;
 	}
 
-	adev->id = id;
-	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev = &proxy->dev;
+	proxy->id = id;
+	proxy->name = "proxy";
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
+	ret = auxiliary_device_init(proxy);
+	if (ret)
+		goto err_free_ida;
+
+	swnode = fwnode_create_software_node(&properties, NULL);
+	if (IS_ERR(swnode)) {
+		ret = PTR_ERR(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
-	ret = auxiliary_device_add(adev);
+	set_secondary_fwnode(dev, swnode);
+
+	ret = auxiliary_device_add(proxy);
 	if (ret) {
-		auxiliary_device_uninit(adev);
+		set_secondary_fwnode(dev, NULL);
+		fwnode_remove_software_node(swnode);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
-		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+		 dev_name(&proxy->dev), gpio_device_get_label(gdev));
 
 	scoped_guard(mutex, &ref->lock) {
-		ref->proxy_dev = adev;
+		ref->proxy_dev = proxy;
+		ref->proxy_fwnode = swnode;
 	}
 
 	return 0;
+
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_proxy:
+	kfree(proxy);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +477,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags)
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	const char *dev_id;
-
-	if (!consumer)
-		return -EOPNOTSUPP;
-
-	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -484,54 +500,48 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev->id);
-			if (!key)
-				return -ENOMEM;
-
-			struct gpiod_lookup_table *lookup __free(kfree) =
-				kzalloc_flex(*lookup, table, 2);
-			if (!lookup)
-				return -ENOMEM;
-
-			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
-
-			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
-			if (!lookup->dev_id)
-				return -ENOMEM;
-
-			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
-						       ref->con_id, lflags);
+			if (!ref->proxy_fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * There's a matching shared reference but the
+				 * associated GPIO controller has not been
+				 * registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 
 static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
 	struct auxiliary_device *proxy;
+	struct fwnode_handle *swnode;
 
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
+		swnode = ref->proxy_fwnode;
 		ref->proxy_dev = NULL;
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
+	set_secondary_fwnode(&proxy->dev, NULL);
+	fwnode_remove_software_node(swnode);
 	auxiliary_device_uninit(proxy);
 }
 
@@ -543,17 +553,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	scoped_guard(mutex, &entry->lock)
 		gpiod_free_commit(&gdev->descs[entry->offset]);
 
-	list_for_each_entry(ref, &entry->refs, list) {
-		if (ref->lookup) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup->dev_id);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
-		}
-
+	list_for_each_entry(ref, &entry->refs, list)
 		gpio_shared_remove_proxy_dev(ref);
-	}
 }
 
 static int gpio_shared_setup_entry(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aafd087df267a4a32732ccc03af38e..27fd2a40c5cb77a19c258e3fbf429d3f6e7d4b32 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,9 +14,9 @@ struct fwnode_handle;
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer,
-				 struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags);
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id);
 
 #else
 
@@ -27,12 +27,11 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
-static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
-					       struct fwnode_handle *fwnode,
-					       const char *con_id,
-					       unsigned long lflags)
+static inline struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
-	return 0;
+	return NULL;
 }
 
 #endif /* CONFIG_GPIO_SHARED */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..402de2e106f19fd110d67eeecd3c07794b7a5cdd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4841,24 +4841,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
-		if (!IS_ERR_OR_NULL(desc) &&
-		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
-			/*
-			 * We're dealing with a GPIO shared by multiple
-			 * consumers. This is the moment to add the machine
-			 * lookup table for the proxy device as previously
-			 * we only knew the consumer's fwnode.
-			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
-							   con_id, lookupflags);
-			if (ret)
-				return ERR_PTR(ret);
-
-			/* Trigger platform lookup for shared GPIO proxy. */
-			desc = ERR_PTR(-ENOENT);
-			/* Trigger it even for fwnode-only gpiod_get(). */
-			platform_lookup_allowed = true;
-		}
+		if (!IS_ERR_OR_NULL(desc) && test_bit(GPIOD_FLAG_SHARED, &desc->flags))
+			desc = gpio_shared_get_proxy(consumer, fwnode, con_id);
 
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*

-- 
2.47.3

