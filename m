Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4D5208AB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865140; cv=none; b=DalgKAlVjNGb+fUUO7nP9srtuMYu/+2gZd5mbgWX3vhFz9yq7BQKwGfwiyUCxiQ1kO0wT8Gi23si/aaxVe6gyvmfy/ifuaa8PaeaYC1beAhHS1AVIj/jYPL/35KoOdfgaYnDA3mL66pm5qJ+JlOj2QwjM1eQJEAlmFyUTQlt2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865140; c=relaxed/simple;
	bh=Jr6qE7sqWRN+BXU5F8CKp1V+Oxu53GwVBxsb06y3yLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tb+AxZdR9AtyToWkDUNHpYBV2b1m6HUjIg26u7TUQJ6hP6H8i6yT9i1Zyc5L1dTNCQ8QG72GuSC3u1ujtj6jiMoNq5Xj5ob5Wm9x0E9zDONoN9+cznVzkMpcK5BDzE7WRJTp8WU3XeSTBpgp9X7WvaNIJupSTpLTQo4K5BdG9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLqwAlMB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDwrp6oW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLqwAlMB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDwrp6oW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dj51p3229396
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 14:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCxOhRGoRcuXnI/NVwUWctl17zN1yjTn686ZcXrohzo=; b=cLqwAlMBlqsc8lKl
	zIQ8Z0RlJoL4BUWPXQa606i7ztF+jayxps4NMTLX6TtQZsllrFnhAcETblfgdSFu
	wUba92PC77E8qTR5SCEHt9dNDCjN8OwD2PZUaaumVkKfRqKtHMFI/0phLah5GGKK
	pI7eb4qDS5wpsEpOyCh/Xt4zMYlgdF43SLANYQEq9kuAR1HPAB6h8ZSCZH/fFIvD
	214u5JJ2F3TKhMvFi9x8MbFb46qRoIoPpLiXrPJ+6ZKP1/hoDemJYz2pB+NlL82d
	+i+Qp3y+K7acdW6TiLaZ4KlOnMsbq/a/NYdpNoX3i9IhQMw1vaEcbEVBLjDjR3IK
	4YmZzw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk8eeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:32:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98929c3b03bso1266136241.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790865129; x=1791469929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCxOhRGoRcuXnI/NVwUWctl17zN1yjTn686ZcXrohzo=;
        b=TDwrp6oW78+gqITM/Gw6+qtdmy/u1ubN+L/c2jTZLNdIpboKhDCGM3Ekm/rbgxTmOw
         DQ9BxVOfI9tLKRnqgwpn31YhlyJRgISGMllg4+HGSyHd1m16M5QAFInjjI12Qz8MOsPl
         aSs9M006BXxfou/OVnU2Nx3bOckody36ROTYqtao2zH0TBLL6Csnw9ud3EX49lDVAFz7
         EKf9iJz6fmHSGVCmGrmSNom5DxnH+lOOdS3EfHNeRSWMEezJcTrY8GGMRV6OWWCstEJf
         0UQJOdwP+xzDNw6gz3tpUwPEY9+WPP/jkZ6gKI5rDaTd3l3eq/iJpuE6cr3RyuqnU5pD
         sKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865129; x=1791469929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCxOhRGoRcuXnI/NVwUWctl17zN1yjTn686ZcXrohzo=;
        b=NqTTwuTqMSEQVMiddNXMst3RGB8+nccPklVrwKFkyVN3D40eFEPi4+gUgNHjJhg+N7
         9s+XdvsaezgQH4/5YKdvio5+ITdBoQmfjashLC5tBUl3Dx5oImBWkfzREMUodc9lR3i/
         Wo7vHn69vfdbwFbMxHCjGbwhwmwa6Owk5aSpJlgmRiywpCPy+oBfrbJRWrnwAyrULUm4
         5oBWY7IYCrKeLac6NWCy8SUmv31ZpJfzbwnRT/ZWgUrfkoWAxgDTvozwULAB5/D7GXKZ
         fLtV9JkS53ctVg0zQdTwx8WEUDAg0ZEspDiyA/lAF8KOEGFIMg7OPsB9EjIrRhMKK4+R
         uNhg==
X-Forwarded-Encrypted: i=1; AKwUvBw/rXQ/MAZbmAjENtcESomefhmAgXoy9NzMOox1czTPk6UnWnGRkl8oQrRndQ6yhFcRtMhxSZMUH2qaJ/c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDZPJ/NAF3Z+DpSWpXKsxNnpjgCTsBXXu9LqzPWnE0VAD7f3CZ
	dNQpmQunxv1ayAjuL4kRsOE/ZoqW04CvkAiHgYsrnyeugjUvZKEck1rtFK9X5erGahBTyCMO+uS
	luLfHZaVxySx6/5g/Rd77sfvtzn1rks9hcvg86Gw9oz3Ycv4E/DSZ7CS46HNddaktrBqYVGQkBO
	Y=
X-Gm-Gg: AYBFou2y1GP+glPrZJIXlo4/ADt8TvfbSmmcZkMsp0F5VMRPyoY4WNGNZkAluFLdaRj
	kqv4lE4oCBOW53uZNtEur3DP6yKamAUHwdV/3pxxbb90UVejJzjoI6KobK6SRo3AL2LTmLAk1v/
	SpzeXEJr23rf3T/1vWTIWeqx2tDQ8Wz1WX4fMqJoFi4siTYpEgFUE4SAndSdwRXcT9iWg7zhCYU
	y2tGZ/OxEI1Ie3W8mq1KAOIJy6w2npNYiMDe5KM1+HNNrrF9MZelOzlkji7NsM3NgN4C6oTIZmm
	PhMHc1QeybHDOcp75Z6atAvxVOLnba3jll2zsb7OfSqH6MqNeMURFEJTjrN3NQh5UielZ61OIOu
	H9wQWd/nNmPmRiwiKnvrZeeakhOgo
X-Received: by 2002:a05:6102:5ccb:b0:7b8:1a1b:8e84 with SMTP id ada2fe7eead31-7be6219abe1mr1562768137.5.1790865128953;
        Thu, 01 Oct 2026 07:32:08 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccb:b0:7b8:1a1b:8e84 with SMTP id ada2fe7eead31-7be6219abe1mr1562744137.5.1790865126518;
        Thu, 01 Oct 2026 07:32:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027276b6fsm321855e9.6.2026.10.01.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:31:49 +0200
Subject: [PATCH v2 3/4] gpio: shared: rename the aux device field in struct
 gpio_shared_ref
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-gpio-shared-fwnode-lookup-v2-3-9a40681713cc@oss.qualcomm.com>
References: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
In-Reply-To: <20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3521;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jr6qE7sqWRN+BXU5F8CKp1V+Oxu53GwVBxsb06y3yLE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqvm7dQD2AhOcMjlKyKU6B2atJnI1E4O/55gNLE
 oDOPdq4eR+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar5u3QAKCRAFnS7L/zaE
 w61JEACgICtJbiHLim8TXu+ph2/oS4Ip0vPSFLDyqrioq4gu3US6Dxhf9qh4YxFrsXFspR2aCAy
 xhLt/harzHEo9zyu5qcss6ZWX9/klUZQj6AGlfUXAbs16VBlmq/bTRGaoF8ISUUy/21WOnRhX4U
 +tXlhQl7h4tdal8Y8BKCB3XOVe38dndAVAlOg2CcvixLX5cSTP2ZiLtDaFuBTUrfc2zRoMQxhir
 N/5AzMas4nLUMnX48WLUXmHpxiKEHhGB01RJAVarIH9nERlPx4iE9EPD40qV7SX3r0ctPo1gkF/
 KUIcIisjHxLFPg8J2G/4e2OusjC0fuBMSp+MjITT8HT3MONGOL6gOObm0gd0lJNistdFLpBnfgZ
 Kp4et2s9Rkx4UH6uQlHTxvFE7hdVlE/Ralq5/wr49oRd8/oUxqeY9eOM0v3BLm2LEjOavqHeYjG
 Hr8t1tP3o1YTgO6rcf5lN+LVK5UkFdxoJIidVZBjDCaZAq5A/RuuPtEEai9b4lXQv11+dwNjN/O
 +/bzv0AFBbH+6RKGCOx0WKgcV0kd0C9qqoZ2rESkB395GdxR1XLv8IixatymBuL6//WJRRYZ46U
 uQJe2i4WIxW2l+ZfQgnxf6XeS3ZScAq1aSeGgXSEQNA+ddj/mgvjavFWYl+1msblurb4XIJYRy2
 MJJC22LzzVz0leg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfXzdwiNOe3zLV2
 FVQlsSi6V4ln+Q/me8Ze4UMA0fxTpYeH2Z/RSCFqiSC+pr0Y+f7kKQWs1kaMZIhixgIIxlEl7B+
 HU4RHwGsYNKXD6qJEQ3sAUm+SHuo5T8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NyBTYWx0ZWRfX0ZNlmigNqQPt
 NjggN545rJ6OyFtQeYmOnI7h9YpBhTwQcLgv9OyV00OWVuhVlJUOBtg8LYCEEIxrl2BzbC/wm41
 6iyHSfft0XZ21KoHaqXcAXXW9fiUYew4W+MUAaC76TamEcgkWS0OvUT5HsArsIonmwu6AfE8aHC
 70EFY/ms5zLn9Bl7x7VXyPtb2QJOPHJ2gDsFLEPzS4aEnxY7o6Jtqd0+9ekWByU2B/gYGvd+d1C
 aB2VjNjeU9mGklOMSPXVmkHe2gn47Wu6jZ13FZZ0eZZ3CoRC4aRZr7OC7cOLQ2t+LIw9SyRxDdV
 MiCDFBiHmLxLEkDIapvnV2CxuLsKk7MAaivxzzGrDFJ4XNl6UNNnivHkXMIQKjlef+Dfpao3H0Z
 SUPYA69gUpTO6eSnVf/scyaq8Xj5CHDAaLu+0TC0lPlK2QGTh5hmtqTSHk1ASHopr/Aidk7MKxk
 CLHksw3BDEe3sXiAl/w==
X-Proofpoint-GUID: 3wqeo0fGnnk6XsOuepLv2DWNeDL_93Ob
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe6ee9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=AX-0qW0-_SK98OTediEA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 3wqeo0fGnnk6XsOuepLv2DWNeDL_93Ob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010057

The auxiliary device held by struct gpio_shared_ref is the parent device
of the shared proxy GPIO controller. Make the naming convention for it a
bit more clear on its function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..604777f252bebb1c3e6b471b5a55e1be7beb0f71 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -39,7 +39,7 @@ struct gpio_shared_ref {
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -306,16 +306,16 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
 
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
+	struct auxiliary_device *adev = &ref->proxy_dev;
 	int ret;
 
 	guard(mutex)(&ref->lock);
@@ -326,7 +326,7 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
 	if (ret)
@@ -480,7 +480,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev.id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,7 +511,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct auxiliary_device *adev)
 {
 	auxiliary_device_delete(adev);
 	auxiliary_device_uninit(adev);
@@ -527,7 +527,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (gdev->dev.parent == &ref->proxy_dev.dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -592,7 +592,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 				 ref->con_id ?: "(none)");
 
-			ret = gpio_shared_make_adev(gdev, entry, ref);
+			ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 			if (ret) {
 				gpiod_free_commit(desc);
 				return ret;
@@ -624,7 +624,7 @@ void gpio_device_teardown_shared(struct gpio_device *gdev)
 				ref->lookup = NULL;
 			}
 
-			gpio_shared_remove_adev(&ref->adev);
+			gpio_shared_remove_proxy_dev(&ref->proxy_dev);
 		}
 	}
 }

-- 
2.47.3

