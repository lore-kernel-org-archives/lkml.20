Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08847502566
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897126; cv=none; b=RJLGxPLsSGJYEBcVODwDqpUmTOu0plrCGyOuYUS9lqcLBmRRtr2z1iGjal3PrbL3FUepIgdg/axHQPVp1sK8olu/8bqjf4fCZCcnRTBy7ffDKCWZ6hYSB9cNQEb6xBFIh4Zy+BfXklt71inzaYXnFOt96huAmn7I3et+kk4d/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897126; c=relaxed/simple;
	bh=wRimfFBhTdHNg2yoeP8yhxO3Fx6yZZtgreGAqNEyEhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4d5XPlz8Eb0Mp9kod8jH8dZVUW9KfPSC54G2PkKEoSUWiuyHEUKvRGLFZB1P4uUabsYm56pM8FPTcgz4giTH4sE55ttwJJz0BXRdIxmmwq2I13I3R97qPA1GfHoCgFXFBzajpTytnI5q0K0v9w0IgEpziuB3AAB4bU6plsjDH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpztPrHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu8le2Di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpztPrHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu8le2Di"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBwqnC3208820
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=; b=lpztPrHGgYRcf/3t
	GMBbKopBFVgg4dIrtDZSr1Zs2gQfulorSGzw2w5SAG/QK8cPf+EOs64AI24ryh1X
	9HpS6XA8T3AA+0lLMAy3sqJ3u3bxPV4BIEw6qe5vUzcuTWSJFvQskD4ieTDQcA1I
	JpSLZ7Isdp5pCajEgfGlPcrjzD9UZ3489Jd8m4aYy8jRH/Hf175tiU2mopoDIXfM
	wqhBMFsO/8PN9BRVCcjCP/WmNB2LsLw/XeZD+rXqXjSkaqAd7RJddS8JRZbHcoKV
	xwuHOebZnCv1cOarithKo9u53kTO66NU9tRVvKKJeR1LG4ENBXvbTui/qNYjjIv1
	NTZspA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjhm8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98f0cae5b9cso204848241.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897122; x=1792501922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=;
        b=Qu8le2DiNb8o4KxI5D/9WXosHdPB+PQ4CCGd7tQZUdTgky8zgiAGd+Tjb3NR2qaQlh
         uY0K17sC5lSzdC6eoSc/X8w8GJyuDG71LiQYFAVTTDhtpJfmJ6G3kZU4kVooFFMoIT4R
         dN19GxD05hMt5On2pEObEm7sjkro19C/NJmCZizg2SAFeCMX39pSiYRzkIoD5YjHoVO+
         TLXc75Mp437cTaP2Sd5G7sY6In+Kz5k+fTPMDhQNlbb0M1/fTRU0Apqb8kFV/djbnWJv
         ZsrqN1pf3JIf9ZMztO0mAPWP7mYEyAhFiVkT4iYpS5wvquyCoOiC3xdo8j/1Tpb329wV
         j+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897122; x=1792501922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HApafeMN+yFyGCXa9NtRihlow3+PpaBbOz8/YN3Hoes=;
        b=eR6yEe0JzEm83mbYICquivBmvvLZKaQJG7n0EYbMuVnujXQ1Wdi3CJ3VYyNeq/Go3I
         pIx7XcYQ0VJU5Ekhwq5cLobmn4CGh0nMdeKbSvAjETzkVABYWxDP1qUCffeMOS2NwE2y
         +daEN/1UP9wD7GjKaMzRMubWZttE95dELI0C5TQlQjWKgTYy68HBPIi6rwmF41vfK6Fu
         FcwTFZnkJQNFQQwSBKlxEJ4HEKi/ODxNNM2RaKKQRcyF2T0q1B4aQEWJHkXDS1l7+KOg
         fXx4lKvwnDb8hV0nfw+o4+Ac+ubH3wm2yt/SyX39J0C+hyWupIs9JyHGyWd/VjsL3WjS
         VJOA==
X-Forwarded-Encrypted: i=1; AKwUvByGDwaZP504SlnmSawxbX2QyaiIiCcsu4mPIbd7BOnAc4w5hizeyQ/C6auAf8AzAxJuHZs4cI5S/lXLOS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrMti6bvxq1rYX1tc4qRst/6jn0/XarPuv6oNgfwvQQIZJvW5D
	hFHwBi8S9NBZdZIRrcZrY9gao1el3fSj9lfSx0GcuXokZD1mFaeUAPrbZ2Uglli38EJortWYxBd
	LEAlhoWe/BLxTElKeuiC7wLQSyjeK9+0ScEF1ypt9nMHrsbKmtC2qT8JKgJwGzmA1FYc=
X-Gm-Gg: AYBFou3tUxjzrCykBKZo3KxBNvC8eCYLBJahckSu/3gKsrjLbBL0ATvYEw9cE1PUpam
	RgNyAAfye8zRVMrW37ykdLle8Wa2815Vga2N/JuLVm4nK8yW5aAKeL6Gux1GKJqSSwhEc5XBRE8
	TNnbOoRfzcFQU5rmSo8HJPznccHXBqd6dXcUj1o931EwJPb7wYGnIE+kzZBoT1uJVUtkHBbfswv
	hskYNZViS74lAyCuNdz8v1f/l2t7c/1+Qfom06OX7tFOMdVaSS/v5T9lCjxhNsdZpoe3u6KBkRO
	JNmU1LcDCDDN5qzSdHLRAvptner7LH2VZ2R5dOYLzYciDC/rdgoSoS2wg2/bqztKHfnVqjntE7m
	t+m6mZQfAx2Ia6kcZA8xP6MnQiWDr
X-Received: by 2002:a05:6102:441e:b0:7c3:fcb7:8c8f with SMTP id ada2fe7eead31-7cb3659063cmr2864351137.1.1791897121870;
        Tue, 13 Oct 2026 06:12:01 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:7c3:fcb7:8c8f with SMTP id ada2fe7eead31-7cb3659063cmr2864344137.1.1791897121330;
        Tue, 13 Oct 2026 06:12:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:12:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:11:46 +0200
Subject: [PATCH v3 3/4] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-3-4553c1a7d80f@oss.qualcomm.com>
References: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
In-Reply-To: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5943;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wRimfFBhTdHNg2yoeP8yhxO3Fx6yZZtgreGAqNEyEhw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4UX/S/U13JPfawOvxfJ89NM7k9IS/lVbt5d
 SZTeMe5JiOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uFAAKCRAFnS7L/zaE
 w5pvEACoRZvJJfgqfRJZx8uTHGju/u5eR01APPUxvy7QorAHH8L9ENeTc979hTtniSzLXWMCI3n
 3RKPCMrhA8sA2bUjyr4nvQ2Ud3FQoOKaKTWeZyi0SzBVivQqCJ/nuPJCBEaP1DG/UOTmkFOgteL
 /m0jVI8Z+51hn6YWztJYjll1XPHjiFYZRAaogLKyqWETw2ZxJyvURN/aiVvJEp/rF6aIYSoq/QM
 2xw+XU6zdB2yZ1W5+9wjr/7aD/UzEZWLa7hPK5+0TJgd5U7kgToJNA50RAf3Wcr0rmiYtC5pHxv
 BXNtt5a4YlA87GwQF/2BS6e6W+FqipO5sMmqAUTlBuN7Xhba4ftxFgPYW0dvmxIjQFi7TRauPzB
 h5h4b3UsiSujdi+kzLanFIfxioCAMFKGGTFChFBOHRRtW9WgYiRHfoV2se7oZ9xWnspOT+04B4r
 8NTAy+/NsJlRJH/S1c2TMLjDZBJYzsVNDkVy05K/TllBAmL2Cc/99S7wW/IFJUnVkxUtdyMkMgL
 l1mSyrBCvBcCYqypQZOZij4MxlAAfIq0zN3BVublvqyUdOuR7qPwoceq0GVKdb/EVWIxx24X78R
 0SFj1x8dtUOgkNUcn5mhcIrZqg1NZ5OonGs1+EDOS0vufgomC7TDB7Wx7zHE3UJ/GiTQFIK5etR
 mJQqQ+xdN03NFgQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: dCQgj-vKcviSU78SQA9QBSYt_I4OMgHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX6JYuzBFf3NKN
 UBdlA71I3q2KKDKxGJmMw8PTsNwEQUeRYixLa3dZldwcqo3gIx+4w3IQlRzGw4cYgPb1LChiZ4p
 XCjZeVEt1R5CRnlus7so6vhMxAN+b2nh08QC7P6RQzjh3CkUHwuycJQJ1dprk3A4sxXXynjg6hy
 t+cxaRVzyEzB7aawLBarhSALzfnZdR80HL3urqGq655yLLhjenIUzRVSgFc4eBZ3ND/I6WZO+0Y
 oAcsp9kK6htVjy4fOsJ/irpkBgt6qGzvPSBDFpf5FEQHQs/KUu+eGaYUVXgDN44iTqZKnwK4UzX
 D+m1jV8mczYErH5slogaXo7by3e79N5tt8O6Mn86jusfOI6C+BxHcgcaQ5/mKD/6drttEiS15uw
 pzrC7LDLAHpCvncuEozQfBs6V+tmSfrNfniu1OAw0nQETroKgJAf955WK1QyEsYXgzQc9Esp0sf
 R6ELgwGz4xWGlxpe3/Q==
X-Proofpoint-ORIG-GUID: dCQgj-vKcviSU78SQA9QBSYt_I4OMgHa
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace2e23 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7-zWc0oKUx6pH-XSlPsA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX3di7PrnntREW
 kocT+unKEe+e6lz2lIIYNxUdLaw2NWrD+sCw5P9W/hvhBztmNKIzlf7/Kiz7QZTRTEhQCZGHImV
 kD12JYifXKGNnYqpeqDy++wn2DKpjew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052

Sashiko reported a pre-existing issue with the reference-counted
auxiliary device being embedded in struct gpio_shared_ref. We
unconditionally memset() the struct when setting up the GPIO shared
proxy parent while there may still be references to it held by users.

While in practice this would never happen and sashiko seems to have
confused the parent auxiliary device and the separately allocated struct
device embedded in struct gpio_device, it's still a bad pattern and
could lead to memory corruption if a user deliberately took reference to
the auxiliary device via one of the lookup functions and kept it over
the GPIO parent's teardown.

Move the auxiliary device struct out of the shared reference structure
and allocate its memory separately on proxy setup.

Since we're already touching that field: change the name to something
more meaningful: it's more important to point out this is the proxy
device instead of indicating its type in the name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 61 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..a57a2dd5ca00eead40dc79198c94862b5a3d1ee9 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device *proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -94,10 +93,6 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 			return NULL;
 	}
 
-	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-	if (ref->dev_id < 0)
-		return NULL;
-
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
@@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	ida_free(&gpio_shared_ida, adev->id);
+	kfree(adev);
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
-	int ret;
+	struct auxiliary_device *adev;
+	int ret, id;
 
-	guard(mutex)(&ref->lock);
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
 
-	memset(adev, 0, sizeof(*adev));
+	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
 
-	adev->id = ref->dev_id;
+	adev->id = id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
@@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
+	scoped_guard(mutex, &ref->lock) {
+		ref->proxy_dev = adev;
+	}
+
 	return 0;
 }
 
@@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev->id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,10 +522,11 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	auxiliary_device_delete(ref->proxy_dev);
+	auxiliary_device_uninit(ref->proxy_dev);
+	ref->proxy_dev = NULL;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -527,7 +539,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -592,7 +604,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 				 ref->con_id ?: "(none)");
 
-			ret = gpio_shared_make_adev(gdev, entry, ref);
+			ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 			if (ret) {
 				gpiod_free_commit(desc);
 				return ret;
@@ -624,7 +636,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 				ref->lookup = NULL;
 			}
 
-			gpio_shared_remove_adev(&ref->adev);
+			gpio_shared_remove_proxy_dev(ref);
 		}
 	}
 }
@@ -718,7 +730,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

