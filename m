Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198694;
	b=YJ2ZQ7lh36MNE2SoXFc3XpiPX8PnJbJko/NBV8We9ThKZINUQcId8bgagxdtaOq5f+tM
	 R5ugyPsc+/qlOQ+aMUbNgQRAOmt0mTSSyQSCfSJ/0aBNVuTgI1u+u9HPCJQidQQYbARsZ
	 tSkTKzqz0CezrjV4AkqIGsOsxuYgYmcU5KPGOsPrdrMMBM50fBoNm0ITs3mXnXY6ifByK
	 hJdvIdnnibIQd5B3vStji6dz3mhsRMD9k8wbReSeJHated+hZ0ihxfVFNMC+IGKjU/DOO
	 o6HQVsMH8Nm+PwNJKKsU4xc7DfBFOIJ2SL4MEAo6Fy1u51i3LN4DPaCM7lT45c2ZnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
	b=c7KTe7dZNwVc0KLLqaKsRGOke80mfXGvMmtFS23x4tFgccNRkwtFDNTo3hIdmZc+BW6S
	 DEblQ8/zQMWQZ5EGNus13vTdvNot7rxzm44j+CHpoaia9ayMuaZVVhXq4ezArkJrgey4M
	 8GLzc1gLvr4W5aCsHWq4uxhsvetzo2PYoRYtUArLeJ4d259IvsQdaDTuNaO9TdGD7Ja+E
	 zxEzOT4EEecenara8S4DvH638pA8qQl8bmmnp8kArULkYlbcnEQYqIXpIeGgEAWzzUoai
	 vltRRZPGg7IN3jqPzZMc2Qxx9Jm7ERGfQkN8nUaDbMzcNff4yFeu56KUM3q7q2lTV6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUXSoEXk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAiW+Ef2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5760A263A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F5760A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUXSoEXk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAiW+Ef2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe55T1053347
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=; b=SUXSoEXk+AQ4hcxA
	5xBltn4jfdrM1kfjECKYRAfrUNPNqs6g7VnSTVh3eMx67EdjPolxXBYklJe3iREk
	l3SN6451AEqT1tDo83ktTnM9yu+7Xm3AUIsS/LnoN+FSiN2R5m4+7gjnUNwh/p1A
	3t4TFyeDFPgdNVhBQ13NHwm/l9bskAtamsqzUBiH6kF79raXbKdqxb2SwOEZ3vaB
	29Ln0Alh/KumIRMbKEHw7SCXd/EVwG7o5TBWtIwi03dQP3ZfhxTCwWQdaEIuaM+W
	9iMVyP36X9iBYikqVEPUlZn7upSChNNriySE3lQFMAwghkvLwimR970j8dz7mvzq
	1xIzvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9x2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:44:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so216803985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198692; x=1793803492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=IAiW+Ef2g5ywuswuFIyWo3Q8xqHhikYmVIrL7Jjc++6of1aJDq07ZOf9sq6WZTEWFp
         QgzKp4Ltcw965PrDI0nIips0Dw7nFYbRrrJj9CFIeS5odwPrHOODf0MCStWGeFqfCfbf
         RCEisyXB033Ul0CoSpln8uyra6/trrzxhe5jvW1u8Twfd1V3BKHDhF3mwAc986XTMPE9
         VvQORv68VPwc6pd/wGUrzvvz7m86u6AJA5mj/0TmENE8Uzxa6AA8qurmx5GAZKZxNeM8
         Oe65emowCEczYDUZDywbcsBrj05JDrld+lI7XZXoboZ5mG+oVribz7Nhbx753deiIT2e
         rT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198692; x=1793803492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qe76duvudliqlNEFLEvcwKXzgBgBKEWKHbDZ7o09q5A=;
        b=0oaKFsXXdfkZwP63cbBMnalU2otYzytF0eJUJLxpGrItSKRKmIyVgYobCwcT3bZL+w
         pi+dgV1ldyFKRxnKU9N5wjtyhCf+xjxUCaRbHzyVW5c/T/Lx8eOQMGtTxyaujYZ0c+Kd
         CDBKI6mEiEZnMxYfzx17Yx99JV4HlfOZgYC+W8d5ogy9yI85Yi/0rS292HudafXguLHo
         AfbppTfGOYjHu6Ap54CRia6ZI27vRVN+Ps9zAtiQV7DLWtVbXQw+3qfCYxhsBwFhxp9+
         LgOa8e5r1geuw4YMfbjwwa43veJlxwt3mccEDSRtE6PYh/YfgeCpwgg9j0lm1LH3+fUJ
         KMGw==
X-Forwarded-Encrypted: i=1; AKwUvBw7uYJsBF2OE2QwzwsnyYNKengd2m72pOc9N6JNsVmkXM9jD6g58SXHqaZAq5+8qiD7jk7sMz0yCdNf0QA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyFki1E+3n0p/4nArAagXx/vkVXZztt5KYyFsTVzzzw34sYfB4
	OQBK4Eam0HZeBW6AoDIN4pMKBVvfCRDV/EPA1zRsoIWlmq90L4Hrw3nxnzPuxeQo7QbIDt/r7Xc
	sA9O880ekPjOU4kKIhqe8GsdowIaHuuTB6pzNMFVh/hYfCrqDVoRpxxqMrBvfxeOJOYE=
X-Gm-Gg: AYBFou0cTKA5SL614iTW9uZS8cb5r4y4c8/bjvF1Vg30TXT/iDR5QabGRxAkWZKA6go
	PcspSgRxkgq96dL80nyIHEbWuWN/7rsSm729iu9P6lZ5IxqN89mti0BYYOI6z/6VubfKgZzvzD3
	Me7ZLSmm6YZIThor/DETZRTrksnhVioOwKWEY73zXjg5jwAoQFVWO4/IWGBYGjof+dPzNqnexMA
	5JFwDlAA7ZDDwurvU3I+IhNn/vBreo8G9v2DPL5ESpHp+5mPdZvvqm4uqEhiipxnc2i6x3ZVhAN
	C+M5H1DrNKgo5ID+Y+sW3wcNK9OHn2AJIGJVxAAsuxteaR68o7wW8iJL8vGEDwtTky5E1zD6tW2
	L/XRmUgFWkKJe68lBEjpN3yAcP90ii8qhCC87DgxS2/v0cyvfEuyKGizl4IfvIrZ91uV8jZT3jM
	jonQ==
X-Received: by 2002:a05:620a:444a:b0:93a:1b82:4962 with SMTP id af79cd13be357-94408cbfd49mr368341985a.47.1793198691648;
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:93a:1b82:4962 with SMTP id af79cd13be357-94408cbfd49mr368337685a.47.1793198691145;
        Wed, 28 Oct 2026 07:44:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:40 +0100
Subject: [PATCH v7 4/5] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-4-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6332;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AK3+tDXO+muQ4ZCcxhm/oDc0hzzPO4mlQf5U9mOOPuU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpagW7Ew6MtnX6EuHyMs782Syq52UJW0OTDz
 kZ3dDY04GyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w0v+D/4tKI5ddWhk2UPaWxw7CpNKqXge+dMm88JLniEoGQaiDcmzNejGr2c5Lq4hK2lvzZXiMQH
 3hTDfMSTALOK+sqmExT05BZcQ2VschC8EQfuPYp9pzuQANKSxNO9e+danc4FvlU89j5q9q+DwD8
 j1hmVYJxZqqeRSRotmGyT438sY0LD4kjWbkHzJx/644r0UqcqXQCON6NVJcN5mBw1BcIHU/mjb+
 6UoJD/e2weDDNkL6vhGs7M1Bpen8flkeVXS/dcuvWzyuGFjeFJEzGgT/8Ah4xFIZcU5tWD+UwGT
 +KVnuoNlvpdF2DXBSuhK/whpiHtFTx+QrN/ZICCt1AE+uOfBw2L2bcC+HD0yqeIU9aaj7x1sLVc
 mNkW0+wgWLNwf8Kb/Jn052sCqNYXu6F3907MquxCjOXbC5cgJae/F/i+3TcHDzw0xQLTQOruxAs
 oVqqg+E5iNHfoRWZ75AnIr7/SybdfKna0pOUNndQdg6S4hPAIN2ALplgzGMOGnRuPeoO5MHlO7y
 YQr7YRt5Ckot07RSbBzWfsc3vgpuVqIiTOvGyVJN0mRtKNU5qY0EtzATVPdmRcne8BhOw3OVXYE
 gZo+UXmFn0Cxs296TPc1QAvqeKWPmpAjjYIBzX3kD5r8K8do/uq2iYQYYwJNgU3XrPAYBz8r5gK
 +gTeFlezP4ZGBNg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: S1rI1p4VXn4yjJrKH_CqloLCu91KoPeM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2N3pZ1gBcEo/
 pgf6b360msKFPiaJhf6rMG1b7L8d/Yfj5/UC/iojcSQHWCeaWdtgmtdQQ7Jmi3Ylz98DC7ASmI/
 tLwTOIN+BJ6ZLaFhdGqoV6fI1fIHnOs=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae20a64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: S1rI1p4VXn4yjJrKH_CqloLCu91KoPeM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX4tF/mCl5axR6
 XqGqK+nkYXaAqBCAguYpSnqF/OJ8M+jSYqI3zKsPwmQtfkcf7v56NxtzvtGh+rLqC2nrVsngcCZ
 WqAhrLUjkehVUqq4tbQXLhg9R4rs1h4j8QvhsCjBBmwc8I/t6kqNl1zqcpznxPKzvnaKL2KuDK+
 /k9FTnCvKLAlNer06t9cIUiLRURCnH3WUlBmO/OkOVUYG7QKIFqBuCkAAtQXe9Fx/bYgUG5+GY7
 UjY1fQ+c4zvO2VpI7D4HKwU9Yvim2KBS/woaWuJWBPm4Y+HrBW3Wrq7Ago3N/G8dzuGVOjoSnPj
 5F9ARzP1P0M3ktdD9oCsdTzfWEOGQHwkoy1Q6ErtjOAgsWJZOTW91meBTJwu4BPpbaUet5wd8KD
 EOZSCoFnfvUuvx1ZM21a3MlW6QWCNzp9Xh+UNwa2jeHu6YKU72RTeoHL57o3vMR/jio1uzUZvMP
 mgj5Nc0qef3aFMMLuFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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
 drivers/gpio/gpiolib-shared.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 043d5daba7a73062151a089b3ee8ccdac726f221..c0e2a1207cccf16fe9fcf998eaf6ef744fe93eae 100644
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
 
@@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	struct auxiliary_device *proxy;
+
+	scoped_guard(mutex, &ref->lock) {
+		proxy = ref->proxy_dev;
+		ref->proxy_dev = NULL;
+	}
+
+	auxiliary_device_delete(proxy);
+	auxiliary_device_uninit(proxy);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +552,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,7 +606,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret)
 			goto err_out;
 	}
@@ -598,7 +616,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 err_out:
 	gpiod_free_commit(desc);
 	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 
 	return ret;
 }
@@ -619,7 +637,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -756,7 +774,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

