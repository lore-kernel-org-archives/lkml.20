Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705994;
	b=tmrq6JoI10Uo0L6iqbshsBQZw23JXayRAG2HfSOdfHKp5kSEQgxlobt6MEM4ZuimXMfn
	 YLPA+jOVr8A9NGfyUq4CC0ZcXz+Nq7/R4J3g5zGvWH1XzjVSuzZLzryuvBjL0Bq3CzDuT
	 uCLDQGXrlrany2A1zFrF05geWkMuMCXJH9pGAqVeYyk6eEfPswmGHyc+8f6kymtvecKqw
	 2843MQ3VzH8H5uE9YDMDs8wMFeq87JnVwI2YqnQ4jvHHY7qrV88u2NOc/HMbDq4anjBqy
	 iDygxm7JClb3KsdBbyhY0VowNdnSdrsCF2t0Tol4PMetoOy7sxnPpyIYY4DBN8LMxmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
	b=VaP4KSXNRx6vyQtnZsfVRejB13lRjhcnDaJtLSJbbf/0oOHwhT/IIHGzHRdFPh0G+BS6
	 N23vHrqDU8AjjDuvBHjLFrqmXk9iqjOpPZgGTqQsKHk1+nboTQ17KCL042mpoVmhibQsl
	 e6b6t7oQAijkJR6mk1dhLULLzLBXFmh39H65iYnqo2jE8f6wWANP8VHYajO/e8IzGVw0a
	 Enkuw7jMI1UQknTBt6hCRK//zFaBFG6MBxU+1n/7gSkHBIrfavXWpeqe9bcaW7fsEDwMQ
	 F9iv/NwPp9RwN3mAlrOJF+Ig5NuZjaZk91H1x57NfWve2vCDHTyy631hajxQmE/p8HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMvs7mKt;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB4C60A2602
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB4C60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMvs7mKt
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so493014eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705993; x=1793310793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
        b=lMvs7mKt2goRR3E7XKFcNsskAqipH2+jWWLWLLP5AG2y8Y/ibZrYGhpy2USVDZbFxC
         tdqizyjf07B3ZXjbgGWvWHSP3ctGxZPSmIqlDAUmi8gRscL94fsHphh2+Vp0t/BcRNBb
         H/wBJ4lgdCVPRzaWq2v5KWLHuHl57pND+K8DSIYYAGkmccFaEFOyv0X/GW/WMHpwSWRS
         Ed8PJlAf/2laLwlezpIeir28PoC8hT/xW0NnqB3xSCklg/hWl/2TdZLNSGhUfj2TxHij
         clDzyzHi8fqhMU3whXVgrH0cXSdAL4K71UaXFMqaSaBTkut9EzkWZxpGeVGZFEapLvY/
         R5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705993; x=1793310793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
        b=CKLAMADHOX2oioQ7q1RCBsZZ7iSBnNaJsxo465Rq0bDwT9atPTs3RLnchLb9hNctQK
         UrqVy4rl+j1POJ11/ejULfEjDMeiB+J81YgpSvzyuJtjRmpRKi/J8XS+Pu4QaWsdsJ9d
         P7ESG76PSlfg6+2D7l4GT0OL8+CfIetctdxJ5QkyJvdD3mjF6UM+0GRHlWXreNxpUh4d
         0kv2qz7Z/dNBrG8zG/jZkeCOe8c9OacyehsIdW3f54K2EldOAZvLIm+3oukWzEF0H2CP
         KgerUwhjaiZ8gIUjFKSSNr/FELi6/0aOsmM9d5Qx5OFsvVr1KstiwjWjtgggMinuvVHQ
         Mc7A==
X-Forwarded-Encrypted: i=1; AKwUvBy5sIFKgQHAVCLIPdvlAeobUZ+OoD0wQ8BqnXN+Gtegx3IkpJ1aNU8MpkObXK8G5NibmTkuYcTV9BPwMMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/PtKqLU3OHFcW1/8mTP+kEKRLgFXln1lmwenQsgiDyZbtqZvI
	tA748e+VLO15hC3zgBmiCbtbIn7u9KPSK6d6nP7P6dpMkTkcL+all7dHjhH0Lw==
X-Gm-Gg: AYBFou2MuzQ9DvnlELeKVGharqD9hNdHBuKfHF8rIHbFxoDoaUqq/dEA2AC1mu5n4IO
	sli3rqqsqrf2NgFd/+hQaPyELJvtYAEJwSGy8RmIfbWnHDlLvM4HV8q8xz5SGJW/C9vf7bI5lKa
	xfWXd8FWwBm80ZyV+4zcwcRydeowBIbdcLPYKr+R3OAhjCm8kFTfSO7rQjkdZUHOLQTbvYe8Km0
	+WXBVibNwCA0hCPU63qiwGLHx4yO/mwJ++zGLNjlcKZg9h/rZgYlKizHwj1pn/3E7rStxZIdGiD
	58gsFn7qv3wfAfV+eUX9F9wP9RKph+WMGWlGZv0skf5P8ws0PkEo3cyiofIduwDz3RF11zAbXPk
	ArBPALmvfk6Zya3dM+79uGQ5odLhYBrx8CmCSztikOlzE/3CvKB6/z0vFWdkc6YmohNRTyyeq1w
	Gk43YsO+/271za55a+JDTwM392Uc5dcTnRL0tsmziDB+Ih970zknc8bWNGnm/PwDr4uTOO76wvt
	/VnbQZnrpfGsSkX/O4Ww+eh+0/zXPivrIQew1sz8jweziUFdepkRfeaWHpNKVfpnFG/yMRWxX8t
	AOfePW0r7cUcwvL/EqkYtV6SKNQCcmfcUcDS7XymNddx
X-Received: by 2002:a05:7022:4588:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-195c4f4ef8amr912186c88.11.1792705993359;
        Thu, 22 Oct 2026 14:53:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:49 -0700
Subject: [PATCH v3 5/5] gpiolib: of: use __free(device_node) in
 of_get_named_gpiod_flags()
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
Message-Id: <20261022-gpiolib-of-v3-5-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Manage the gpiospec.np device node reference in
of_get_named_gpiod_flags() using __free(device_node) so that error paths
can return directly and the out label can be dropped.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e741a4f218f4..25b97109f97e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -430,17 +430,17 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
+	struct device_node *chip_np __free(device_node) = gpiospec.np;
+
 	struct gpio_device *gdev __free(gpio_device_put) =
 				of_find_gpio_device_by_xlate(&gpiospec);
-	if (!gdev) {
-		desc = ERR_PTR(-EPROBE_DEFER);
-		goto out;
-	}
+	if (!gdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	desc = of_xlate_and_get_gpiod_flags(gpio_device_get_chip(gdev),
 					    &gpiospec, flags);
 	if (IS_ERR(desc))
-		goto out;
+		return desc;
 
 	if (flags)
 		of_gpio_flags_quirks(np, propname, flags, index);
@@ -449,9 +449,6 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 		 __func__, propname, np, index,
 		 PTR_ERR_OR_ZERO(desc));
 
-out:
-	of_node_put(gpiospec.np);
-
 	return desc;
 }
 

-- 
2.56.0.257.gf7497c7d27-goog

