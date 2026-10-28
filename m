Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198696;
	b=0HX+HoRfgzpxHnPRBs5IAm/F7wzqsIDHrsL4jIEHMp7U3O54IVCtssP+BsOOO81VVaDf
	 uWrYz7HVUWc6QtGZjWKraV/Au450v6/63n5CN4fHmyKYEpFKSUEDkojRiMAKTmcc9sgVa
	 3f5DHjDAPjv3MO3olip6Oe/Zl8giuogtDTN2r9kJA4hUMoabLv65akVPBguWS+2AdMVSr
	 jg3TzdesNA0bjQuIjackeWNpHtcAL8lYgS0ko6x/WsjPJvxvkWQjNeojiu9PQBCmqBWgi
	 R0gR0nHm+p+p3B7sse9dEfuHDjMXNjuLZgPRjoy9Yjoz/xd2hUV69ujs4qH/+baSKOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
	b=j2C/kwOQTTHWTkCzHC0PlhXvx1ODVMLv7XC7+UpMa/+BRcE2Yro85ByIaiCxNYIJKOAx
	 +NyuH/kSr9n18HkRRmy/6AHBv+yicYjBq7E6Um9SrefVHp6yD2si0gABkyjXceTaCjhOV
	 S8IgOzPRgzY9k4QKF3mOR+o9fAfaGtcIm2PUg+CwpaamT47JOJruEEXNUdjRPYllKJEzX
	 NdNo8ubcPw8xYkwYk0WVryMwmQ0pb1n9ym6DWK+py8p4u23+XkXzz61rKi9SUfdzYRFmS
	 JMuSfszMeEqlCPBoa13zLP18rC7JdopcBgM+BORKDwFMCIXxDika3wbPoncmiQTJakQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736D60A380D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9736D60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSSiKmVm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2h1dE36
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxre2082401
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=; b=NSSiKmVmog0ICnvW
	yUGUsNFU9N3zvMgqpqJgS6qaDBPbkcRj31zGNjpDlkpbPYlxgWvYu3hNmPoQTy8K
	ys//JvJnepI18fii2bLjVBLWXSgCTEUzV8cEVwR4DfkmstFMVk11R/2mVuEt/9eg
	8EjVtghwXkMrU5vch8uGV2n9kuj2MYU6cImu4DDWDQQ6WJl7LCJYmlJqXloXuTnX
	4Bw2p1w2PlNz82smojAY5O3e67sPHeAQHzCvyD7bPnn9QyFDbXg0tPqfA2JhBVwy
	v+Hrq+fgqPkaK98rejYFUapeIkO8ZBLWy3YOLVMrbgxqE20+QTubk2uY6UtNq7Ul
	ABfkLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvh3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so188141185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198693; x=1793803493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=L2h1dE36Ebh/RwecejL8jssrSoTtVj5yaAwtc2vmGLUP2R/sk4MEjQ9iI7oUpFL6NJ
         xaNok4VmifjqONKQYrZlNaYIcmHMDv3ZMoTXCa5xaOzX+GW9FZkfu/V3bY/r4v2kQB9V
         ZYTVxa3l++Pxou20991jr3Fuq09oC/DtX2Twq9ctg9q8DIrKoQs6Pq3HymlY5ALhdNx8
         C6QG6Ra0g3YeoCPZsr+nnqmDrwEHN6SdFRXETZMKhjO3Z6WxHMbn/8ApZmwuqUF3HzAH
         FfDBEWG84ibc2oI+04IVxb/aT4MvdMQppnez11t26Ah2G4pEdd28bhWCC22qz6x5jng1
         TlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198693; x=1793803493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhl3DSD/bUX55tHhe1Ml6B2sBMLIQThnyxCWBFIR0JI=;
        b=vD0/OMTB4r7SL2Fk8VUFfDIhTY5LkxzHVJKWl4nHk/gRsOuMZr8/jna02qKmI6c3Tc
         ScqBfiMFNwippapMUBmap2Jfx+iKMlGA0hLvj4G/HW6XW3bOfIXHCd8g3qJ7PvKoJnvk
         NcVcwAfTwvnv9tlhag4llV4nnNyO4qG3hKSGLPdnR3pG3GPIzVuENEPVoWHe5urpmICc
         y7llGB6FqHPn/aOsLWOq91WZ56ABBjVyyKQo65w+aKvUHpX5JXsIbQLAUca7pK+0cHql
         L6z2BBNhxdWiX+00eSLEXV22wm2KzBKaPn1vODzfUasUIBXp/Xgb9W/qcPqCGZKgyfjt
         RPjg==
X-Forwarded-Encrypted: i=1; AKwUvBxiQcLASJ0VW9cVj7fXELtQBCAFloLUraQPbBzT9Q62MVUJhMn5ujJt8XC+veGEBa55v7QL1jZckE5dAEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK09pto1WDJWNIhpw/zULtyqIOpkQVCH7sFidoCt+KBu0p9CYPe
	hqAxCt8kv737QMMcoRu2pGqwcCoVMowvF72MFO2Y8e6YTlBbch+m4v+ssxQqKE7UpyNh4v2A2cn
	mYCSlf0hhrasguJfBm1ItmqgWZmhjkDzGtmjOTZDH24JqYGUbmOxbJZLOZgW1UDkSJ+k=
X-Gm-Gg: AYBFou3rbsGi/kW0Go2qlAfAzJeRpUYU+fdnG8np8upklMcHosa56AV3P28VVVIX+QD
	sDa1B64e76yYfjUB473/olMmgZ8rA2lOSMSVBRZn820c/uz1sLeDZ+lky6hljrgAgipwh8Z8CKT
	q+xCvjw7H5lsn42Dx3axdjBbK6BdJ8RUsyMf+9Q+G3lHBg/4jnHoH4Pph+QaMcTlUTdl6cy//Ht
	WAPc+6gfdMc1FWQKiMxFLxWNGtWC3PP2IRtup4SAY5iBp4Kv8WHUgs6TJDQCc8IKdUSCYLIaE2p
	7UDb09P8focZhgF994tTn5PuuFJV7TznUbUBKiqEBFfnahoV6cRwrvuJOeSAsjMu8J6Wb0Uz3yQ
	o/C+TA9K4vdiULAECVxa6QxqmNDJ7P8mHmFigvvidorb2DMwIFiBMscBtNgq4VWlHbSUOqIknBa
	B9Yw==
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370133385a.29.1793198693270;
        Wed, 28 Oct 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93e:5daa:67a4 with SMTP id af79cd13be357-94408aa107cmr370128885a.29.1793198692792;
        Wed, 28 Oct 2026 07:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:41 +0100
Subject: [PATCH v7 5/5] gpio: shared: convert to using software nodes for
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-5-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9792;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VqQFAcdQslhA+FOM56xgGaartlvzl9PKEWzaLYMwuHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpbqa6KuoznuPYwHA9SqJ36W4s2ps37G5yMY
 E+qbktKl56JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWwAKCRAFnS7L/zaE
 wxCCEACQqCuhhEkZx0awpTfHDjzI5KLTq/+hKu9cW2MD/ARs+BPPl9y4FwpqjjnQJo7WswYuFry
 DvElPrds6Wa2GXX5OfZewB7Q0vZQB+H81xq1NKEbsFCqRohfy4A8fAxi4kKSaZFW6BDpGZC7OLH
 u706a/PhklU+wv3DPOMJ4xa5peKl4bTHC3YrZem2PGQdiHgss2+4t/CUCfdYEGTO/9nc+at/p8V
 bXksj2mtUW5pc0LXw4uOiH6uOZ5cnyk9sqXweD65PB7Pozujmr2O1TJ/CVfJMkG6PBeXd5oi9wD
 CtB5ph4kSr+uZx2YgJiVcc62PvpLupaQjqo8cXuUfwQljGbSE12pS+Rz4hOM+pm+5M91Ym0XKeJ
 3NlIngOb/GUWAChsXKjrunGEIEM2LHhUs4TnkhpXsDidYyKtHDQIoWNvuIW8zKVeNHlOUdB5EDD
 BX2CCkpnAg5wmWlCH+DMYOfCJq+AKqtwYJqanGMFprmd2j08N7Z3z1bcbkpbalzLsterliSHshv
 8cthPKhCbF43WS5STRm60Uc8BKemOn3r0TVK847D4t0ogwMragQS4gTcmTI/RtJEufu7Y5aDsJF
 srG9x/0Q4t7Aiy3XokZ6Ny4R23bNyGhifuv5Q6Eas5l6xfpbd2IeTfa+9YnsxGkIBVprTjtijdT
 V0xWmlXHsoPiY2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX1SBfPZahbfAF
 Q7/c1IOw7h122GoIFxHSpNBDsoHAeShrwU6gOWxUrfbvrHJ5UGoUCDcw88fNuqZMs9oYvL2qjEl
 C1y4RlPbRW0VCFD6qUxQw/g8v2zAQ8XLC3kGopZVaa3Zx2Ep8Rr17K0nKwLJfU0tzj09FgHdXiL
 8ePk4HxAUVsLO4cfNiyzKAvqzgA//3jUPbrNB8KujfYD3LLIFL7k8iyCA3IeviKLlcaPxwXmKZJ
 su9XD+fhg2mjSmoAQYbR7yyC8TTkctRWX81697Zyc5WKR+2aQzwMqIJMshcf7W5hLo3Q4Zv+c1B
 pxD51qYMMt/cWx8O63q25TWWRx1UjnjJNK8s9rU5NFpaHEbn+r84u+1+TltKbhOWVKqUtVXaa5y
 KTT6DNAVAzQlEhJi6nBH69EJ/iRNsiSFMOQfd4IC/pdnz4CSUajg+F+toC0mQElFPWbqPtbjGhv
 tfJgg6yuUQPFY8g5QSw==
X-Proofpoint-ORIG-GUID: rX6rhrnbuBPaM09I94WyXg-CCYgT1bs1
X-Proofpoint-GUID: rX6rhrnbuBPaM09I94WyXg-CCYgT1bs1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxgcMWT7epaUT
 icWeweQkThU7nbmRsbY9ZC+Sq2HDJc9Cs480m0ut9kVFuuclcsdohWDkciglvet0sFuotS06fN9
 aBIuPl2xY9S/bWkjmNAo0SK4udM97fQ=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae20a66 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy software nodes assigned to the
proxy devices and stored in the reference structures which allow us -
once the correct struct gpio_shared_ref is found - to find the correct
target GPIO device by its firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 124 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae..4f5ecdfcc63ac175b9c4fcc7044ba3ada83e6349 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,12 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct software_node proxy_swnode;
+	struct fwnode_handle *proxy_fwnode;
 	bool is_reset_gpio;
 };
 
@@ -313,35 +314,50 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev;
+	struct fwnode_handle *fwnode;
+	struct device *dev;
 	int ret, id;
 
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
 
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_adev;
 	}
 
+	ret = software_node_register(swnode);
+	if (ret)
+		goto err_free_ida;
+
+	fwnode = software_node_fwnode(swnode);
+	if (!fwnode) {
+		ret = -ENODEV;
+		goto err_swnode_unreg;
+	}
+
+	dev = &adev->dev;
 	adev->id = id;
 	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
+
+	device_set_node(dev, software_node_fwnode(swnode));
 
 	ret = auxiliary_device_init(adev);
-	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
-		return ret;
-	}
+	if (ret)
+		goto err_swnode_unreg;
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
+		software_node_unregister(swnode);
 		return ret;
 	}
 
@@ -350,9 +366,19 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 
 	scoped_guard(mutex, &ref->lock) {
 		ref->proxy_dev = adev;
+		ref->proxy_fwnode = fwnode;
 	}
 
 	return 0;
+
+err_swnode_unreg:
+	software_node_unregister(swnode);
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_adev:
+	kfree(adev);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +483,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
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
@@ -484,42 +506,31 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
@@ -529,6 +540,8 @@ static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
 		ref->proxy_dev = NULL;
+		software_node_unregister(&ref->proxy_swnode);
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
@@ -543,17 +556,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
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

