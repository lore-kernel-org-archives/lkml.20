Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592661;
	b=CiAblnAe4wyh5r1m1ETE+nwM3fCq8SUDtF/2U/NhIArNcaWLUkbkc/kH9AvFQsz29Rxc
	 GRZn50EYBBrmI74hvJgeaKYRbkQIRwBH0ICoIxjwtvOu+ij+5fT6vfq92fhqxVjHoZWOk
	 YcxqjMarvxryWshLmNb4Y+Aft2RBbopHpR77lq4VoIFRcHI1Y026bTYWdN1I/vSufBq1w
	 S1xxyJt/dSCtAiiEj5e6s3ctmd0IGC66wU9SIM1XJ8IIe0zOD9GsStQj4grXWNmU+UMw8
	 2585u4eOqR4GUDI49OSaRBiB0ieXZe9+CIHO9FlLgX4yqJlccKLOa3YUFCObeuFNWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oG64eRPJEYRajEC4lpOk1RNn9L1w8FWzIvlc34ouUYc=;
	b=PU2BVldXrvS/a6RC5LQk3WPH1mfu7cupGvRBNZgxO8lBTRlLgEkPZGJKAEGdgUD6ZqDI
	 thm8m8KGWmHs1qz/yaCQOu6HxLYHOcu41hjvIghqQgz3MwBefL0Oe7esuOQW5aZswIseI
	 9kR57m62WK9TkzwXdpz34N9WGw2EeAr8ine1QoqexbDuyfMhS50IgJVS1QoEwW/rBKZC0
	 c2CYIennBD0bqqWn0c/eknhQZ6LdU3SpelOjk+5yd/H82hjhTZQJsaDJmXx6A8LnRJmDF
	 RPTWw499p+gkxeD+GrmZre0VQ8m9g7lEUjC/4puhf9vfTA1rVscJhF5+Z7vbNMnwfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI2Ha+Cm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSKzzYeK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A2C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A2C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI2Ha+Cm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSKzzYeK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEoZk4161294
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oG64eRPJEYRajEC4lpOk1RNn9L1w8FWzIvlc34ouUYc=; b=eI2Ha+CmZEn8QD+D
	r0jpfGYfaGqkDJqfD8MzMm6HOZZsVxzxsKRrQrE8I4CX+ng9N5SlP3oMnHHCtO44
	Mfw3+3NKEbcLPUkOQPi7vS6HDgwSG+LXMDiPhoLf+XssKF1P8XnP5vGpuIl+LYxJ
	QPygkMDmvtnhfVC4GXkdJiQaXVCD5wcRJF+XJj2cH47uunqdZcWjQ20pNlt3V8up
	1eGIef9CMu+ao4+UiH46uK/Co3p5CfI4stKhnWpXn8D5pqwJ9duoF7ai9Wfy7bsE
	bu/j9T5wCkTABF9m8JoYUb+uNWZo9zWtHllspMA23TUhR/ISyryg6BXg+SYXMXJG
	mtJSIA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5889ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso554896241.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592659; x=1793197459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oG64eRPJEYRajEC4lpOk1RNn9L1w8FWzIvlc34ouUYc=;
        b=WSKzzYeKFFT2BWoOeW7H8MnPIYIEBo1/Y0Ap+z5gqbQNv+9hvVda3GVVIiwcwKh8CF
         TXtDUjsExp9XuIkAsWTMO8QJgjoQ1CgwrqjRqrHHjfBfR5yAUFHQONbgEH0Qp8VyBUjg
         tpYGDPC2hxNU42U6GXhli9Jj9m9nwFwwwi5AR1rjU99/8FStw1D7r0TKPv14BDEfexPm
         Ypl3c2vRNNZtZK/27OHS6FcAu6QexsA2JzC0wzfPW3F91udXBawwGF9XFb7uOnGIr8vt
         7wdZ5LwYZdAE8JOJnCGTXNhp14yCFOr9gjq975P8Hu5tMZPMuQ/3HSEa9jvGRBoAsEPF
         XfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592659; x=1793197459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oG64eRPJEYRajEC4lpOk1RNn9L1w8FWzIvlc34ouUYc=;
        b=ucEbY+auBeFahyYaN2vR575ttVlTYOlpkzGCfr3ybumTFRAEtFQaaOUj8/prOGRrI+
         x2b5UTfDEzUiBM2OVT1pqrBdnz++qlMC8HKS5XZfhuWl7d0GwSgZ/4aFlHZxM35RNgm3
         uAm+RLjOjSnXS6LlzcKqpamHSOlSwRqN4S3n/34GxBjIdzTn7QcHQAK0CugGv6zRRuUU
         gBmxmJmwUWK4HHZBUVvlUz8kOuzeuJHPdq7KhY9lmf76EoHIKAFcCSrFuITZGj5Hn7wf
         RzTjotG2VFXd69zkaykcILnBWyF5DB4EPJO4x3M2J6yhGAukYPsH2JoSIJWQM5oD8ini
         zk6w==
X-Forwarded-Encrypted: i=1; AKwUvBwas0C/kGPttJYGsqN/gbUViAQ1oTUM32rwsw6OF2ZWnQZaOkR15+3k/Ej79FPEvv3ujnnerpch/FZsZhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsWgAR36joCUmHJPZIHYedmqq8Fzpj1voKhiVkRsDF2K1rHtO1
	IWRD7xi5Aa8gHLEOuxpllj2RaIcVexGnMffCUbkMHfFdbVKtzPFGF4skk3kgrdMAHVJR8f03kAu
	C2Uvw9u9U90LwuQEHRX3Y3wKXANX1yVqWAuv4LQKa//09d2eb0dt5+Gfglo37izWvfmwrU+OoS3
	w=
X-Gm-Gg: AYBFou2lQFZbhfLPU5J7AHAdfyUyJ2kdNnQ/XvHjvjBqS4tzrC1a+NnQx1W1Jp/aSII
	2xH2RzxQ76c/M2KNlWzJp9l+HfoYj+a5/9j6eKP5RseuL+ynYoGffTGaI1BOIa2YMJVHcUtxm+s
	PlT02S8NqcSCb4J/xPUibFQ++o0HUWpHdcoWDNvFamYf/MX2rnpkL/ntZ1VQyrz4kDlm6ZLg7MG
	TcWLU8ub7JOPiXZKhRVD7zunDE0HJhq3+3gxiPCkrDXgJqQE7LfVgl98Du5h2EcQoBlZgJHaLqP
	7fOqC1CqOzvG48M49rxZ0Fo4bNCgh1/UZGyf+M3KROPbAWmcKysAPaKIryPoakZcg3xWUW08wt4
	iYBiOXzC9CVhO7KeIuSJ5KRi7i0lH
X-Received: by 2002:a05:6102:1626:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7cc926e0308mr852454137.24.1792592658589;
        Wed, 21 Oct 2026 07:24:18 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7cc926e0308mr852441137.24.1792592658138;
        Wed, 21 Oct 2026 07:24:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:24:03 +0200
Subject: [PATCH v6 5/5] gpio: shared: convert to using software nodes for
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-5-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9524;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=scLUAn/ep1C6d0V3Axg23aTkzIxRrtg6lQigrnX0Yo8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsHLi6UAyMc2D95CxnU9SoJMxgr/bbXgh2Ew
 jcw3BBbLtOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBwAKCRAFnS7L/zaE
 w9hCD/9RcEUPMskpY0GadkQS6wGxLtwbTTMMREVaz1PuOg7jVdJz1eLBXOMhgsCFl5cBYneZyIz
 eSOjNcC35A9s9mqGVQ5ve6Lb3gWCLtDAEYaeYHvwwsbO8s8vr41oV0SVYltFuxwhnbLPOajl5cO
 7YwYJ+osNzW7lbiXgtxAL1/2LdWmoSVk4atdYVpgga9xGjiym9ZB9DaMAQABQo9fmZ1e7ktYB1/
 7GJw9P2seIY2bxOqFXpYIxOP4VPgpo1ejXjRZ9mOCEeoetwsmIlfRyQKZg+Us/5CQvL9o8ubrey
 nCS6aWKufPqYkqORWnqZbyMkbF1mokCqbE8xj2EHHxRO72NxFTILUNBeeSRZNXpx47dSEHknLqn
 RuD94SBXIPkjuXwlURPme+QCcuWBcwl2n3lDpG9BALizWD009SK6ugzIexq5QZTEMrwKca4Udc0
 dqUzY3zwzB8lm/lrcHrTUxV/Gk2cgIBWPS5W4VAU90KXq4hHgfLaO4qT91fpbRld6BuQTV0IP3f
 +DJw7B+43CIaKEkiRn8L3auXoUpLpZDmjADLeQ9xRi1yS0fD6bM0ZGd72+hdvfhscynsZcvEKK5
 tbIz1zptmLWegCmA95qDAz8AfWJskFx8alRo8jcifgwJUrQnAgeO6Nagb2rN/ZIhWD3ydHXRy2i
 bohbQt4geZY7MEg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX0nHOFwiJIYLQ
 IbmAQZfvyDNl6oyH5qaMCy2B4wDORHE9fongjfK3Lf2ohd1Nj9cMghbh3XZRHNJpDXrUnQgB146
 Xf/p1ugFoYUKxThCcaKLSfZDiGvyzT0=
X-Proofpoint-GUID: 8MSsKfMVU_wfiIwfnsyIao8Av1tlPvy4
X-Proofpoint-ORIG-GUID: 8MSsKfMVU_wfiIwfnsyIao8Av1tlPvy4
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8cb13 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXxonev6qZ5tH0
 +EGP0h+muXrJG6Hhp1U4LpLH1GJ/AqvHTpHPIQgUan1fRUG7nh7wv8rCOUQ6xVxTyfu9NRB2fJw
 R0+XBRi2ymCFd81dHr2CgsF0c+g/7rkJyD4rbaumpMWZkkMZOjF1TobcXqUfgJ3jpFyxonc8FAM
 bRxpwx0gwcvRnh+sAJRqthxE/0LxgCMC3jwiUTDRNhWJZoch42Q1lI8n3Mseq4AceDgo1i8Yr6u
 YEyDpzTwKh7E4HPYpAc8jfzCud3GuZiEd84r0iE5ZwR6eB30adEvHhydSSvHQ9KD+MjZwbRRX5y
 MGJIiGjCLosNcq8KFueclMCanjzLmCSXIQHTspmulihl5LY9qZppGWDHNDGW+jONPuXvYXOqGvp
 e2hP8A3ntCpmojemes8dZocED7j6L1lgLfI4R9sSl1sMG5OBpCA028YIuMjuTNe7hlNBPqlJLBa
 LZvaPjRuKmMDrSVJuwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

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
 drivers/gpio/gpiolib-shared.c | 117 ++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++---
 drivers/gpio/gpiolib.c        |  20 +-------
 3 files changed, 65 insertions(+), 87 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3ed25609cae10081a0ab5276ebcd47aa3c49f76a..71f16105f7a5c51f657ccf60569209b3d819ade2 100644
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
@@ -484,49 +506,31 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
-
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * A matching entry is there but the associated
+				 * controller has not been registered yet.
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
 	auxiliary_device_delete(ref->proxy_dev);
 	auxiliary_device_uninit(ref->proxy_dev);
+	software_node_unregister(&ref->proxy_swnode);
 	ref->proxy_dev = NULL;
+	ref->proxy_fwnode = NULL;
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -537,17 +541,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
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
index c7f6e4c4055f405562fa1d0dbad181af508273da..409fea3720a6e6c7f173b835f1aa5b747a4495b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4832,24 +4832,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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

