Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032211;
	b=c77iKwLXxFKjh43IYwd95+sgX2xfMuLq3t3tkTlXa4MCIAJaqpnUbHR9LLlr3wzcOI8e
	 qCqWt67eNdC5ZQIabohwlFUTlcNXpd0EXjcH8ro6y8SMDs/A5kw0n6ob/DAFZnVkwGgG0
	 4KPognvkC9DZLgBm9DHQpwr5KvAaBSahWLThdZ/Y7wiEdwxB5swpZsRtwgGKqLp4v7YjV
	 QPUGdruuBA5Z/sLDdkwLwPWye81dH1QuNcW2CcgZp06mduTeKEvJS9o51wVBFIUlbMREl
	 xVad5FnS/fnZDB+2EXIXYIe+1YwpQXXE4OpU/eLQllDRf+EUL+pwayAyWRNZXRmAB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
	b=BvXfsZEmAxwMW2ZS64Sdb9BkexuBMY+PdJokfGnI1xiVYn4QxuIpeIOtP5gR8D1ubJg9
	 6mWZyil7kg8A/m7kw/MVP5/WFb45Key21CkXuIJkzOg9n7vbzUmwCzqpbhecnA59TZw8X
	 cSr4NCYEZC9l37gy7m+JakZkFnSlsLIfFG8Ak+qF08ZlGryrZ1ehc3L9blamDVzX7Vu/W
	 gHTkiN95jedPUWdBhBGreNLBerUysFP7WLF4kRITmDFk8cTZY0q9wjRMXQM8soX7aHEgr
	 m8abzRlYlK0bcGpprI5fozBvd+n1Ipv2ZtkqIuCBpf2oUZOmdX8C8WPIpnfv6PDXU4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6sJHw1t;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EFA606B7CA
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64EFA606B7CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=E6sJHw1t
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so30777485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032209; x=1793637009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
        b=E6sJHw1tBAsvqO2OPAaOZ4zRxGEFNrhfyRV4UccY4DCqYTK/5vp/KF2Rpd6y1TRL32
         bnC0N3vzhCResvG/ZLiSkstkZhscHtSirKCGrCS0ufltDjZ/zPoqjBJWcxkzYwvmFr+Z
         pwjDRm8v8olP5UfOq95yGIp8t4TuUaNHn9RpbKwkJutYyDmRuBXOyC9Neq8rHil/959a
         0vgZQky+REuacnRiAlhf1MZiaJpJTwhKR7Gqx5nT2gtBGtzLvfrU/csmKXgMlQ+cMwu4
         g3Ur75ApltXx8OVZ18lA+PlQzFF2cgfHHtyaFGuYvysKoRL5Bk4/ImIY2A4ZbMHaAgA4
         bdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032209; x=1793637009;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsrGFIGUSYgIS9WAku3WtyuWXYZnqWS0fWPP6Qel7w0=;
        b=Sd9EFr5BiwRPtqbgGEm4ZLWCkzTnMeI4X2tllldPX7EB/+qtANxX3X0kWwbVEFt7kl
         ZrfWqYOEBL9lgcZeb0b8GO8I5QhAK/IYEA5D3wl14bCk6tOkXddP5E/CljdWa1p5eOrU
         /vlWlQNRbqmBjEWY14OYE3nkulN/D8uoXTpuZDqbBeiKo+qWewz8dsuNbxovTMWXhuFr
         j6t+VO0XtDUJFInqSxlxT8ETbFy9G71Xk3fsmTcNOgK2rcCxSXYB+g5phQkZ0aiW7awu
         uEtJwWfs5qgutvf3dCAZq4aS1nWWJZEK6gRLt7mMfxKcmOTeZyFaXQHR+7RzHMN4Ario
         MqTw==
X-Forwarded-Encrypted: i=1; AKwUvBwsVzHXYfAE/KSHKZRhjyq2hU7bfsC2gcsSsM9+D4YIoGPnVYCWCHYA731LDm/CNqkVmKn+4gkBaePfmpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaRFFapcuDikBi5dch7OoPRpS/S81kHdRsFYXEX9x2i+lpfSP6
	DSiJhfvOyVbf9bgu1Xx/rj0FT+RMqQTYqskG292HcbgMY12pqMxQs7G8rC/j/xx4FzU=
X-Gm-Gg: AYBFou0ATU66xjqkUQhE8cMoscnhFsZtZREHuRZutP0VtOF1rktIbnTy0x7UoN7ZGNN
	kl6DxkEYTFWIzyQtzebZp58ONhW6OwtFuXKqyjI1hOd+obru/thQ0a3+giMW4S9eTBO8O7Iilly
	FC+lI+UH/ZzuaBN9EUdwHWG7hrapnIsTJovapkhV7Ep5wbhTcQDyTBIr2MnRtfEotEgNXKQuERR
	D5b9+5BIYizneD3NQg7/+5aCxcD0RvUkMJOObvPQ1mwlECjyRTs72SYW9uFYz3Gec4CWhFYnoEX
	waIBC0xnGrTJ89ZRo5EtCHmfI3lH8DqPUbigpWVLTZuqyrb6/nMEgJhAK7yJftgiUnREmI6wl2f
	66dvcGIgAZj5jhE8Y52/zeINpr7QMVyPGs9Ed+hEd5y3Lw63S1AsGOFqW6wK+n4ztQ8Zzb5flCw
	0UcVlXvQ7u3D851mQT3uThHxBquO0UlFBtG8D2LoJK8TfTVW7NfJhdChuyCtda1pq7FJiWbGCHg
	hIAUYNlAZVRwyDdi22RjmJetdOvcz9TYElg4SG/IaT9fFR5AJAIAQ8Mc9UkGsY1nn32rWyNrzcL
	q6z5mPhn1R3iPdfHqWxk5lYTPfiXMt3hGFAA9DWf0CBHeY4dBZF5yHOcAzxvvtqp
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr134780025e9.3.1793032208691;
        Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecdfb8esm17396493f8f.54.2026.10.26.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:30:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 22/22] gpio: Unify style of various *_device_id arrays
Date: Mon, 26 Oct 2026 17:28:33 +0100
Message-ID:  <7a3aad753cd5bebe6dd3f05d72edff398920d1f6.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3362; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j/C3qYFYRthO80RC2ruW66dF5Huy3Fq9N8YWUVYu5G4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/c0ojVyzZ+u43M0bI2sq6g/5XGn+69FfExb 6JR29ElxDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/3AAKCRCPgPtYfRL+ Tu3mCACkeeZltd8ipKxsWv88vZPp7a51zX9A/QuTuoijhYbibnTnLrZgZA76jfu63MGJaQJGlqO RZ784GJXMxzbqjs80BfJAWadFOuUNepVzzvkgn3Y+A278UUH9Vsh3Mlb2YhbI7SHJQ3YleBzjj3 0BmtkMk6cPK3D+LwmR74MSGw0vDvjW0UzNI3hbPpG58wgMHfoHv3nny+SevlCB36OXOJ5BbzS+7 OMdumhFuzEkiijn3dxQybyFAvc5crrWIPu8XZmk9XvSGj3b2iMp0/LZ/YXGbHJqMg1xVEcbZTQ3 2HrFm6e6RZWV9HGnGroKYMqkR1OKXTuNCH+/gY3/+9skqw7X
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various *_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c           | 2 +-
 drivers/gpio/gpio-mpsse.c          | 3 +--
 drivers/gpio/gpio-pca953x.c        | 2 +-
 drivers/gpio/gpio-virtio.c         | 2 +-
 drivers/gpio/gpiolib-acpi-quirks.c | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index ad5dc9a3a119..d9d7394d8b95 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -473,7 +473,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
 	{ "usb_ljca.ljca-gpio" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
 
diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 61c5ca96314b..a540f6e94f11 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -80,10 +80,9 @@ static struct mpsse_quirk bryx_brik_quirk = {
 static const struct usb_device_id gpio_mpsse_table[] = {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
 	{ USB_DEVICE(0x0403, 0x6988),     /* FTDI, assigned to Bryx */
-	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk},
+	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk },
 	{ }                               /* Terminating entry */
 };
-
 MODULE_DEVICE_TABLE(usb, gpio_mpsse_table);
 
 static DEFINE_IDA(gpio_mpsse_ida);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 77b447c0fea5..06f7ad0299f3 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -175,7 +175,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
 		},
 	},
-	{}
+	{ }
 };
 #endif
 
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 42871db05ec1..062c70fe4671 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -647,7 +647,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 
 static const struct virtio_device_id id_table[] = {
 	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
 
diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index 3ab02c5f95df..77b9e34cd618 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -465,7 +465,7 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "GTCH7503:00@10",
 		},
 	},
-	{} /* Terminating entry */
+	{ } /* Terminating entry */
 };
 
 static int __init acpi_gpio_setup_params(void)
-- 
2.56.0.rc1

