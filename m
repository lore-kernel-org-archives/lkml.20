Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A894FE2FD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970735; cv=none; b=OLh/hqyUIWqZXw7/2ocP7onVugN5o1wqQvexUDV+yuv6wK6ROO0sbO92d1cpwPIo0T9J6mGh86zI+mFeCMp7of0YgcrR0Lun5TaCtZdoFJd5PlNQS9u4bdwjwtHnkHy5+k1S6ocMpaDNnIPgMCnoDQVNd+p+mQ+pIFKeTT18oOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970735; c=relaxed/simple;
	bh=PmQ4K19h0b2yWgf6ILF57TxrKOivCRnIZnNHtkcTRD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ktCo1i7BNZpLLFg0uz5xKWbsWtSrWp/ZU3CeSNLc7f0NjDAKqtJTR5dtGCd/EIbKRAixKCHitMA3WaR28ElfPDi4zZkHze3dKDUYRcy6UWuMqIul7NYIx9H7z6+TkWbH7E2LJ88EQIH8e5TLXRqjb/7IRJlmUkEEgHFnkQ49WY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8CHJf61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMyZalyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8CHJf61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMyZalyd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7iBdZ3018180
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gmu49K3drqvpev2Gtb782xZZ5qW9hFL3H/ybpMZ3EkE=; b=f8CHJf61ZHX2mcfx
	9dE683vHAX/+VP2wVOQiWXqPX6nn1gX3GNqYi0xzql/rlGRWBpjv7W3kz/GvRKCF
	FtOIcy7i8kvbXF60BZ+wr8/3ILMB0nEnX/Snj4uQoVJkr8qbkPVYZ9I3RR818BrC
	BrRY8X4KKMZRv3BtKFZ/ZQoyX+8+p8bq2PCnJTDV4XLzgO5Nn7vwzr/q/c1WjKNw
	w6hqGdpEbZO1XbqdHom/OK4/rb937HuKCYwT50XUn6mkguDD70F6/bAUyp/SGVAk
	/7y9Q6YYTHqPlyyB8qYq0lmiEidle9o9EJK5UG89DCClxkXK26UUbZDMKtEaGgZO
	+OTYew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b3kx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:38:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso728516085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791970732; x=1792575532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gmu49K3drqvpev2Gtb782xZZ5qW9hFL3H/ybpMZ3EkE=;
        b=YMyZalyd7YzsqupxnfsPWaeH+6DnPUVyvgI2/e0GnzqA7uyX1g9XexTE8+3D4CKZqO
         /UkijdxOaAeHilON+C5034H9CHB+wWHyAVeQjGSumn9XyNC94vO8oeS+99SN2aAPO4pt
         tamdTiYl5482t3xSPP8eZFbLhUnV+x1lT8t+QK3PrP9ZrWiAX7c3GovTnAzVrwTO1ifK
         Q53Lguu9LIj+LFxuM6eNHuRIP1LBBe1/yuoBNHRcvodt751ixrGbkyQRIgFDhdX0MPXx
         b9LCXuiMCFOMwms/5gY0twiVvkrTOF87LDiJyg0YvNJI7sPgZRDoz3txMv44W+0kzufk
         RO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970732; x=1792575532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gmu49K3drqvpev2Gtb782xZZ5qW9hFL3H/ybpMZ3EkE=;
        b=GHJAL72kXyYC2d+9S/JMkDpMFdPnZ2Y0fjWXodRZ5kYhEg4dDVxgPtXkT95ODSESPn
         WUsfyFdCkMDYXtWA0eptHH8Uby/JX+mnkC9VY7d4VZT8XTptBpnvgPPJRCAZHYMYYSlv
         1dGYcCu7vn/4XyUPzS4CUomYgPU6PTSSIXS3XE2dUAYLoM95CHde6QUmQId8H+ruiW2Z
         LUkvJ8jIXcu8C5qJD2iNbR7iM9HSBOQF/h25m03AADpy80wg0aqfdPiW6+3CdvuTJws0
         i0Pe2+Z0XPlJ18x9cOFyWaqHP97no+r98uVUPxXnsgXiSUL8y+OVWKPsuCq5mUxLY92f
         tt6w==
X-Forwarded-Encrypted: i=1; AKwUvByA9qKgN2cflpKSZPVYpEd3Bi3rVeEVMy8TBGventq7GcNoT9zv2NtQ1T4PFMvJbNtCLyi435J/q5W2/TQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHbrSN9W9CLwf4+JbaiFqcYGHEIkHCrEHlac3oKL9Yo/2ZcHB5
	mRiO2tGa+IpmSU82IcDDgo2Q2iqHndxaSMMS/ykXrCawZUGDqx5wIr2Px2dCJ5uOWfyMFFnaIRn
	NS1qPPNj0iulxwvo3hc/FKkINKd+9qSUD5eJDuq7+aN7qdGw3O2GsY2UVDlwr87mk2aw=
X-Gm-Gg: AYBFou3zZcIMSPaCQm+i9HQx3ZmPLHEEvuQcauycGo1qXkVyJDwRPUWORCc0NQv/3ou
	Qur+h6RQopLJoO6SmxXzlvApIGbjYnAxRZyCRz8/eRMNg1PtFY3LQEaH8mxetYOCVD2B3U/tTMK
	4GfyFKrJk493p2xO2JmHbXxQ++gBTz4RsutYolmT7FuFmJ4Ie+DJfggN2k40/KqGnsMmAqMx7AK
	W0gIMgIakINr9C9CeQJpx4sLKpnSqMXbC5Gx+YZbAIn8pRDYPssTkpnPv4UbTI5Q5IwWeknv5Ar
	N0Nb30PsSnNJksHDyYizDfHJ2tvaSnOsWeaT/bPf24mFS9TZXfw+QW9GU3Ske2BT/U7iEKs3ea9
	u2vCuBziC7eSbA3YZfEoh5ivQ+fpr
X-Received: by 2002:a05:620a:271d:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93ebd0df02emr2385804685a.6.1791970732323;
        Wed, 14 Oct 2026 02:38:52 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:93b:c537:fdb8 with SMTP id af79cd13be357-93ebd0df02emr2385801085a.6.1791970731854;
        Wed, 14 Oct 2026 02:38:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b9ea1csm19510655e9.3.2026.10.14.02.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:38:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 11:38:28 +0200
Subject: [PATCH v4 4/4] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-gpio-shared-fwnode-lookup-v4-4-2253ad645fd6@oss.qualcomm.com>
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9516;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PmQ4K19h0b2yWgf6ILF57TxrKOivCRnIZnNHtkcTRD8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz02fkwYo7CCOCy1upG09yIeTkXLONtlnEQfZd
 jF0dwLppESJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9NnwAKCRAFnS7L/zaE
 w2StD/9ZZWY2E/tZ26+Ed4ti2S+GP3USikbXES1U4LzL0ivSSqEPWrBsm9lPVX0E66g5pSZql4w
 P2mkIzIQ+SElqbpZGJgYr/p36VIpfsV5LxilOpldFwX/CVOK1Dy4I3V9WxaB29pFea1UfOR9sMg
 6SlCka5bBhMqeVCwOsxILoJeuILLfbdHSp3ZAAJARQQtPVqs9Krojs9eBiuaZflxUULIg8rRb5+
 om+JzC9iuHbzwjfOsf0p3o206sbplZAAosRNYflOajQAhtwcjsfWFYKSdHNz0+NH+VsJ504h1uw
 580iVZ/2tpvN95rhJ2enZmhyFPWPxczUulDVv3BdL3Dr+jAx9B9gRFYJIGtYe+8NZx3YlCgQvOC
 5ED7VKJDeRmw4Gw7jqT2R/nURnGMAMAisCNyZOqEyuOqVWiVfFOZei0ExeRPuWTuUtMjNEruI+D
 nJqlq3+qj7DfZeI8x9H2R2V8XXE+1iepMlicOx4jxKYf+1V4ZWyXVGbTqlbHHdxRhqXbx4WDqaR
 UiIi7f72uhv77qOVaHxVySW4wRrEyM5rYIAVPRjO4o0m8BQdtvagp9yAROQZ2f0gACUerpL3giT
 Jmr2/tX44FGBfCj6lQ8aqWWWC3usqU8O26qAkoi0KhQI9MbGwontS5VyHbX5bJiG+VFPJSqzp8V
 ynDxQFXX/fAE/wQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf4dad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=-KlJ1dLh0LyCFQG1QjkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LXOk7bfwPaWHkjEUz-7KZWGtw8K3cDHf
X-Proofpoint-ORIG-GUID: LXOk7bfwPaWHkjEUz-7KZWGtw8K3cDHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfXyflVic9UJ0/E
 Wivzxhqf28Ps73a41yq8WaeHHlbQimPINUTOvUJ/DjfiiWLSGZpCXLcQVpjshy6l13teJmzn5rg
 oR11FZi9W8jhR+AYfK9FbH0b1rvaTOWK5g9x5D629tClY1zB/FO2PZMvgxYqsc8zH6gizZBGvAh
 pCWkbXFGKRCxLnsEY2v9taAdQFUXM4ehNes8TRDVxwPOQ2+kM2bNkhO7qZ6KCb6RcoTWiwz4VW/
 JEcfTjLekXhjQHRkNnCDjSLwvweBP3DKTnkH1AH+H+kHYOfcAxBFsTsuy5lpgQkNqORqWyD1J5I
 vYTHPiG48DIWjeGg+96DV5JIB0is15hYqKOTzbeiWckpEZReGg+IdEW0/EP5kfi4ff6UzxHbG2w
 e/ApXkGEO3hPUzOOgFy9Ixq32FPdM5NAYjIq5fzlyhGdU9pmQTeKKRAzkK2R0ANXrkOYVsB6a+0
 E4VgmvsuKDqZdc67Hyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX2wOpubfW9g82
 wVG3YtA+g05+IJUW2RFnhQmQhu9J06dYWj0W5FEM3hiC1tnErB4nKlXOnkiatupGJTwFAJsjH7m
 6UL93w1S6mFeX4Mws09k6/A9NYk7R8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140038

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
 drivers/gpio/gpiolib-shared.c | 121 +++++++++++++++++++-----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++---
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 65 insertions(+), 91 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index a57a2dd5ca00eead40dc79198c94862b5a3d1ee9..16c0a9d491167c08dd011c7eb05ebfc68a6fc9fb 100644
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
 
@@ -313,37 +314,55 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
+	struct software_node *swnode = &ref->proxy_swnode;
 	struct auxiliary_device *adev;
+	struct device *dev;
 	int ret, id;
 
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
 
+
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
 		kfree(adev);
 		return id;
 	}
 
+	ret = software_node_register(swnode);
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
+		return ret;
+	}
+
+	ref->proxy_fwnode = software_node_fwnode(swnode);
+	if (!ref->proxy_fwnode) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
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
 	if (ret) {
 		ida_free(&gpio_shared_ida, id);
 		kfree(adev);
-		return ret;
+		goto err_swnode_unreg;
 	}
 
 	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	if (ret)
+		goto err_dev_uninit;
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
@@ -353,6 +372,13 @@ static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 	}
 
 	return 0;
+
+err_dev_uninit:
+	auxiliary_device_uninit(adev);
+err_swnode_unreg:
+	software_node_unregister(swnode);
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
@@ -484,49 +506,22 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
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
-}
-
-static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
-{
-	auxiliary_device_delete(ref->proxy_dev);
-	auxiliary_device_uninit(ref->proxy_dev);
-	ref->proxy_dev = NULL;
+	return ERR_PTR(-ENOENT);
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -628,15 +623,11 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 			gpiod_free_commit(&gdev->descs[entry->offset]);
 
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_proxy_dev(ref);
+			auxiliary_device_delete(ref->proxy_dev);
+			auxiliary_device_uninit(ref->proxy_dev);
+			software_node_unregister(&ref->proxy_swnode);
+			ref->proxy_dev = NULL;
+			ref->proxy_fwnode = NULL;
 		}
 	}
 }
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
index f9173560812d00020f41a745f8a67e0a3a6bbf76..253da538aa98674aeaa488b3ed0317faab5e5a4b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4824,24 +4824,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
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

