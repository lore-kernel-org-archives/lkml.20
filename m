Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A408F51A752
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859687; cv=none; b=dkRlglg2lPqaTg0CVeWIUSYBMHXTNI77ODdQRAZUZDggZa8jnsYRqyQ5vyxkvm6pgd2bMi0cccf79h2aJ18CRYBQelkqDSQouVNSkq9JE6LXs/lCpYWeo2H9pLFyFiMsk4QQyZiRHtvvWHZId6vm3IA4d+/ydSI/hr1NVjHOklA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859687; c=relaxed/simple;
	bh=e978EXWIA4sXTr97huLawpOgX8082ymb9e+2dGNjw5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IzTiZQiBO/dM05Zktpu4w+MnPkCf7PGoIvjw36pCF/oJXmsfzhYPG9tN0oAhvqNIpywU/EUcClQPcyF5+l5ZTtAx4jWzga7iEZ5HClqcWVMYdoytxs5fddFKXQ2jVThXZQjg/BwsHidJzI6M0W1IcvrVPaZwo5TN+SQr2ZSYkuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDuIpTTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OoB9sqhn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDuIpTTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OoB9sqhn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M4DI2979395
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 09:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xQ5AnXapuDmwQthGbSeXpd
	B6HyiT025OD5a5rgt3h+I=; b=IDuIpTTDT2iBrJo3NF3irTMMKpCHE7YD8YHlr5
	6VUacu/rh+6fudiycQJzvjxhR7mjrCAcHYxPBsv0NlinrNFcB/j9W2Dbhbe3wHuv
	AYpPRmRI53IGMkMe1So+1y4u1/B0nq8kX1ZWBfhijsU4WqeTKyQA5v3g86yfmg4G
	1NVH4DSX6ybRnsg0WPTID3ijy7cTqLNLZBTPsfahWvsyrUb8PsTpyarRObrrA7WT
	sU3hQ2g9sury0eAUYSsluQQa1jpAw0L1z9m6jWpFHBDHuUGniXsHKl2NY6JmrISH
	5TovdCVEjbmRElSYF8DryQi8QRHAKUw+mQVTOxVjLysj4i2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuykc5gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:28:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so789990385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788859684; x=1789464484; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQ5AnXapuDmwQthGbSeXpdB6HyiT025OD5a5rgt3h+I=;
        b=OoB9sqhn7JRo9Zhbft6zzwY6hS1YbMI0eMADV40ZA2b5sKPUi5DRezZlQTCI0bBG8C
         uVS4vilkagvYSI6c+gcorYh59rQNFRvinGPGf0mZHw1EjD2WJ46RY+9V0pCwrgE5yEfy
         okZOLFUO751QTV4uIvKXmDXNmNMloR1fZ6SB2N+Hy0mqgZ8EHXUgcAyw+pqkjV7dTGyU
         JhEdzQYA3WHTbnS8K9GZUjA/rR4LHB9QO9nzNnnQlVOYy6ZQg7XRXoaZtQXtuv1d5RQ7
         u5THSS2T/7gAUSSxaJZlNoxYWmW1v3/y7NtEVq3zAQCco/wJvwc5UYAAtYqAqbIl9bKX
         FRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859684; x=1789464484;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xQ5AnXapuDmwQthGbSeXpdB6HyiT025OD5a5rgt3h+I=;
        b=TrYT2PEkv1yrL1cnCXZJBpoltcBkNDgIqFsrX8t2d2E/as2x6YHq4ZHHldDng+L5my
         sq2+gqmH0tT4bLXtMNgUN3jl467rOpnx4diPJc6vW/4j9nwZYYUH9k1PpOP6QImTLYkK
         50ThjcXTS+V1GpmXKqnjIz2TW8yzAeOuuIHQ1A5CcVCMDof65aFKT3Egx61zU8N7oLEq
         Tmg9qS6Ru5CGoswYoBQHu9tM5JTwENEku5u7DxjCHzhrFpTwQNhPZ/TuJuYl5Y35276X
         NV1gV00ikotscK/glBrC7cmHMoJqB+VjxZMbCqNbUTc/4C5hKBWz231oPrBLETOSPDKd
         +4oQ==
X-Forwarded-Encrypted: i=1; AKwUvBznpbBdYALkJas5r9E0+B1pren182Mzc0ZdBmPB2Do4wdKgLq0f1RyEK0BTqFfkLwoia9w+U1/ym3Zxq1k=@vger.kernel.org
X-Gm-Message-State: AFuF++l34tJ01iYqPZv5Do/+FVh5CpBMy5foVqwZoQ8BRsiNzSixBdLi
	T0COCb268EA5npy7ttIyQqB4kcQWdhc/8tuJgz+hCeHRrBBnwPp+K7L2DGVzWN0FMNt11tSPZbo
	GSR2naLnj+GqxcdU/FwOugqz8268UX7Gis87j/cvoJeKx+cucDiv5ae5ALm5SZ+wD+JY=
X-Gm-Gg: AYBFou0XGEkH/ptRUkTUhkZxtn7IQygsspFmwgQGx+dn0s1cQQxlkEyLOB6e+OMec7L
	RzQQaXFZgGk082Uhsnb0+7i108kWud8Kg6JL9tXZbfK5p7YWQOesf/H+pO3WTQvhoDShOLoxhUp
	8CIPgilYPfgHow6cXSkiX1mRMfLu1RJVL2P4KGcV7yYkBIymQ+8rMsAtNc/kilJwhcKES8iCPoZ
	C/7MBXoSQp8LeSOfZ8QXaRWgn81i84fUS5Wrazgrf420u8lag4C12thTYeT2aKUesazdH1pHbOb
	Yuo5CIWnV393fAOQ48p/tlh0g26kfu+oy6i76EtYJEmlkpKI4UyPhcFm22Bc1sxj6Vff1l+Fnn+
	almKMj/ZzBPO6UAQW1weXEHKOoSIf
X-Received: by 2002:a05:620a:4875:b0:936:8840:427f with SMTP id af79cd13be357-93980328a11mr2689596485a.4.1788859683665;
        Tue, 08 Sep 2026 02:28:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4875:b0:936:8840:427f with SMTP id af79cd13be357-93980328a11mr2689592385a.4.1788859683082;
        Tue, 08 Sep 2026 02:28:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm349714825e9.11.2026.09.08.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:27:46 +0200
Subject: [PATCH] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABHVn2oC/x3NwQqDMAyA4VeRnBeIbs66VxEPLkYNSFsaKoL47
 is7fpf/v8AkqRh8qguSHGoafEH9qIC3ya+COhdDQ82beuow2xeXjRXnFCKuUQP64OXkPZsegq1
 7ccuO3PQkKJWYZNHzfxjG+/4B8MoRJHEAAAA=
X-Change-ID: 20260907-usb-fhci-drop-gpio-nonexclusive-584c5c808a30
To: Qiang Zhao <qiang.zhao@nxp.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e978EXWIA4sXTr97huLawpOgX8082ymb9e+2dGNjw5M=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqn9UYmHVJfDtsLbAHMyEmW5VQCD+WP9drTn2DY
 AcGBHo39UOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCap/VGAAKCRAFnS7L/zaE
 w9tfD/9kbyaVWzykBOKPu+CBlGh1AiRvifpabM2JsEGENIXivb7FefAWZOoT8QEnHrIIZObwq/5
 fpsbf7Dl0zV754tbqWvoUKs9j76lidy1OGe3AG2WuIt8BLKXwFOaqrBqi9Qtlwa6AKBm6FoIbQM
 H9rEBskiyvJkNu++hVDq3kwTGyDH2BlGnwyIMAew6esPJoS1KzhrzlSnTNvfJfdRzdWJjNsWhnp
 7pljZKS/GU0mATdh4pXPZlv1eCcFFj9xypUVwRyd6FyhyGtf13ZM+qGjwYZVWCaU2GQiYkQcSdC
 arBhhDHyFJWexzeZXvE8ndOYT7q6Z7wwUXvDcebEN1aMmcsilnlD4jGM2etJ45XbskWjFwtAxlD
 gvfTNnbmg9udfGHeWstwt2kt4oh2CDJznp4xuMn+p+kQNlyrn7VdLM1nKaT724m0Rj2Wa/lTZyc
 DzeaRRCCmOq1nuRhJp3s/SWWvGYDNdKSUZyuCBKd1DrxYptp9xMrdHG7vNBw3IEnTTTtoGKCxdh
 sklyMapEBIVXc2rdJJtRIF7fXgRp5VqzW8MaQm3D2ocB370fZKXncEYzc7/V69mDPZErQbn5kPi
 6sTDiZ/jY/ONBjNPql+1Hm517jQrhl7H3EZdNMmxWIwnAqdVZ5iEUjSaTuq6XQmRHIAxzpJiINP
 7H96kj5/CoBUaMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX5JZQw/zszSAy
 p5a3Y/cwltMVkqLjMAF2wTPFQYsQpOst7bhUZxIV2OEWL+vFLVlQ3RnWY4A53e3Dr4b1cRSHoFY
 vFjI9TjOEthgXjb6fRoZOy5QHSlJ6FE=
X-Proofpoint-GUID: s-Waf_xft6nNfz4c_aDr5TI6pQ4sUP75
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9fd524 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=buOPlMvk26ltgJ9tiNoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: s-Waf_xft6nNfz4c_aDr5TI6pQ4sUP75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX9XgVaTezjWlX
 iDR5Ow69jDFbnK4FkQRGpA1Y822DIP1TLdEakUAqWLcYtBGiv7LArRpegXI5TeQPmSf+sRFoVCU
 +fjOcHBgeHf8TIjXeW0EZKr9DZDZqL4t6QggY+t8zv4XlE/Q3cshpnoNkpNs8igNaYxTPFS9hfW
 AJTGb8lNMSgwG77RqL8gPZP62A3wGXJvL6hMclcjD7DIohAq7EXDWavwruAfAP2K5ga1TZzrYPD
 slNpJtrpUFdKKrl+voENY7JMvV4MVdQ2x0MKjnRxgtwTKQ/XRF0ib/bAJvqaXJs1AnkVhSgTiET
 yjpCOvIJeDx6Z05g8RoxEO0f3Ugrw47k6P8p2dozxtnpD7L4JPWbmsuqqwYqfaQ4toacQw1kx/s
 ONzFsxVZb+aExK50ENWLHU3d4Z9NeoXYxbakuDLlEd/MuiuxTdZ3uY4Eo2VDZbQtuAhHEC/uwJj
 H72HHZHjTDyhYYo1hMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for gpiod_get() is deprecated. For
actually shared GPIOs, it should be replaced by using the functionality
provided by gpio-shared-proxy. The Freescale QUICC Engine GPIO driver
uses it as a workaround to access the GPIO descriptor already requested
by the caller of qe_pin_request() in order to access the private GPIO
chip data.

As the existing comment itself states, the user already requested this
GPIO and the only user in tree is the FHCI USB driver which does in fact
request it, we can safely modify the function to take the *exclusive*
GPIO descriptor as argument and stop using the deprecated flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/qe/gpio.c   | 29 +++++++----------------------
 drivers/usb/host/fhci-hcd.c |  2 +-
 include/soc/fsl/qe/qe.h     |  6 ++++--
 3 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5cd59cfbf22fa68d39ad00b8f73ad389ac8860a3..5a3a1d5df669b1e0a084a0ebfd2aef91e15f126e 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -196,18 +196,17 @@ struct qe_pin {
 /**
  * qe_pin_request - Request a QE pin
  * @dev:	device to get the pin from
- * @index:	index of the pin in the device tree
+ * @gpiod:	GPIO descriptor associated with this pin
  * Context:	non-atomic
  *
  * This function return qe_pin so that you could use it with the rest of
  * the QE Pin Multiplexing API.
  */
-struct qe_pin *qe_pin_request(struct device *dev, int index)
+struct qe_pin *qe_pin_request(struct device *dev, struct gpio_desc *gpiod)
 {
+	struct gpio_device *gdev;
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
-	struct gpio_desc *gpiod;
-	int gpio_num;
 	int err;
 
 	qe_pin = kzalloc_obj(*qe_pin);
@@ -216,34 +215,20 @@ struct qe_pin *qe_pin_request(struct device *dev, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	/*
-	 * Request gpio as nonexclusive as it was likely reserved by the
-	 * caller, and we are not planning on controlling it, we only need
-	 * the descriptor to the to the gpio chip structure.
-	 */
-	gpiod = gpiod_get_index(dev, NULL, index,
-			        GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	err = PTR_ERR_OR_ZERO(gpiod);
-	if (err)
-		goto err0;
-
-	gc = gpiod_to_chip(gpiod);
-	gpio_num = desc_to_gpio(gpiod);
-	/* We no longer need this descriptor */
-	gpiod_put(gpiod);
-
-	if (WARN_ON(!gc)) {
+	gdev = gpiod_to_gpio_device(gpiod);
+	if (WARN_ON(!gdev)) {
 		err = -ENODEV;
 		goto err0;
 	}
 
+	gc = gpio_device_get_chip(gdev);
 	qe_pin->controller = gpiochip_get_data(gc);
 	/*
 	 * FIXME: this gets the local offset on the gpio_chip so that the driver
 	 * can manipulate pin control settings through its custom API. The real
 	 * solution is to create a real pin control driver for this.
 	 */
-	qe_pin->num = gpio_num - gc->base;
+	qe_pin->num = desc_to_gpio(gpiod) - gc->base;
 
 	if (!fwnode_device_is_compatible(gc->fwnode, "fsl,mpc8323-qe-pario-bank")) {
 		dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 71e785f445a30e116a9cb421d417deaf24389174..d572f0c1dffaf3a40b2fe4326ba8ab021fefb986 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -643,7 +643,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	}
 
 	for (j = 0; j < NUM_PINS; j++) {
-		fhci->pins[j] = qe_pin_request(dev, j);
+		fhci->pins[j] = qe_pin_request(dev, fhci->gpiods[j]);
 		if (IS_ERR(fhci->pins[j])) {
 			ret = PTR_ERR(fhci->pins[j]);
 			dev_err(dev, "can't get pin %d: %d\n", j, ret);
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index 8f967d15e479792219333264c2a463d26e5edae9..7f0e4165c3b0cafdf401be20862aa1bf28047102 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 
 struct device;
+struct gpio_desc;
 
 #define QE_NUM_OF_SNUM	256	/* There are 256 serial number in QE */
 #define QE_NUM_OF_BRGS	16
@@ -193,12 +194,13 @@ static inline int par_io_data_set(u8 port, u8 pin, u8 val) { return -ENOSYS; }
  */
 struct qe_pin;
 #ifdef CONFIG_QE_GPIO
-extern struct qe_pin *qe_pin_request(struct device *dev, int index);
+extern struct qe_pin *qe_pin_request(struct device *dev, struct gpio_desc *gpiod);
 extern void qe_pin_free(struct qe_pin *qe_pin);
 extern void qe_pin_set_gpio(struct qe_pin *qe_pin);
 extern void qe_pin_set_dedicated(struct qe_pin *pin);
 #else
-static inline struct qe_pin *qe_pin_request(struct device *dev, int index)
+static inline struct qe_pin *
+qe_pin_request(struct device *dev, struct gpio_desc *gpiod)
 {
 	return ERR_PTR(-ENOSYS);
 }

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-usb-fhci-drop-gpio-nonexclusive-584c5c808a30

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

