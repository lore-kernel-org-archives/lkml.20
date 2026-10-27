Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098244;
	b=DzpsT1yKsNjmul+NMXgLjl4I9x7gXqTs05dlqvXoyLFZtFJCHYUneDS0xIlpBJAQLEwb
	 ItswNyO3vZOsf0xdpxrB/EMSWgy6oyu5SZ102HHAOf491M/XMyLH8fEQVc00KKpj93aTJ
	 YI5/lcUSpwQRq42WlzcBHcYgzmucklEWBaVl0OpgMvXLE0Iw9byaz+GQzE9jBiUXyvyGY
	 K6DA8FN48JEQl+nHAT6SCOlqXj5cueIy4T5pC8Adw49SCkl+db86REehwQkO+xA36sSPX
	 AKv9Lv1MvIvbXqLF7aJyWqs8B/JR1yYIE2SzFlgbK6v8CXl4F3W/J+fP572e7LCWKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
	b=PmziMHcAJL74y9SIGGI6Y0s2Ej/+gb7qT4zQbB/KYyzl4z1Xi9Uru/EfGJaqFzkTF+AI
	 LOsRKDYnnlJx9Kw+jUl+hepP4g6Tef4kXVxTCOozol0a+CVJ0V+bxnoVRwdYRMY43Hlnt
	 wyPE1S8zZfWFeztN/aUDptXpYWiRbVqMIi/cRCVYzYCZvWVNi3xvq6UjX1Wt0lr6FtU5E
	 JK1IdeUY9/FGO9aUMxWspkxpQBoGVLyphmtEHI6R6lElpSuj/7oor54syewE0yqsFK163
	 BTimwo8KSDyC0cm7guq7uBOrUNTs4dTOdlMfmgcu0CUCuYDoQKg8GavRQdxFGANkpMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YZk0TejA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CF606ADCC
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4CF606ADCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YZk0TejA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3624356f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098242; x=1793703042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
        b=YZk0TejAnTs0P+KOA6rHvt/ppOoJngOLD8zd94q6da/tdzGsUPuhRhSSCaxC7bocwn
         9ku8Rgx0rTLibpWYkSTjYwSqUmx3eJ13MDUbyTbSbZdHbJVPyXba6+z5eHSxMc1C7wYR
         iau1vRE/36T4wGNhIdGc11DXzHlLbIRjf5f2vd5H2Kjtbrwh6arlgoeQZjnk+/AUMtax
         Bvhx8CNZbxN+Nw56mP4oo01TZQcLAlm3XG6jMo3R6QEUuHln61pc6XV1+vZolAhe4FGK
         MZ201uPfzJevyCfNA5F65KVadaeSSy6J8KNfDrWALfdOdzfZRBHXKXJetoLkVc2D6XrP
         NkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098242; x=1793703042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
        b=MVqaqsy+JOGPlpb4t5CeLrAA05yItkfHpbnKlHTWDl8Fyq18RyUCQDzj96rIdwU4N3
         FjhEQhSym8eyRNw6f9jq+9xR7sdqUcI4SAiqKj3p3EcQFW+sZOWFyobv/f6VzkgqHHV5
         kzDVFcePAYztSzZtFNt4fbg5IlaEx0whs9LcUYLYpErJpzgg//3b6KMwmayxUJulv9ZR
         kJFVhv3P34GUPVp9znSALgoPVrbPQSbWCCqDHMhrHILFnre1MC86gx+/C832alxSvbSl
         HsHWe2eeVjIHbedtHGikWEBNVp78bLWfmgktd2Vlk4MIQ38ttqOB6uq7QiBf5DDLG5lo
         en8A==
X-Forwarded-Encrypted: i=1; AKwUvBz/c+wiHdIFkH+CUKVp0aOuQr4wowDHrBq2/7bKahEo/WqWOhK3cARFxVP9/p/h4M8uiLPeur+zjhYno2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYInkW73C6p+Nb/NvyHih/0TgzC4OcndtIqnH7k7A8qLXjIXB9Vs
	W0ezdMxOlDsaLkJ6em4d8pQXrE22jmmtdie388WLW/EF6RX6ooa18p0URrfd6iHosS2510Fopj1
	KFW0yu3Q=
X-Gm-Gg: AYBFou1ZvN9motWOzfIB7XeVKdPzVKpMKGGjv6CLXpIn3k0p0DQ2Me6aHbiWbQ1+XP/
	5e3Kh0F4Zj0ZwadMSX8emgUpnBJvEKFk0N+arAa6PeQLS2dAFulNzRkxlRPFDoBS1QZR6m35unc
	IxRiaI0vv4rpVJz4AHrGjF9KJH7x4Um3hUvIxTl4Nc6Rfx4Duoqk02Hc1EYZuH1c1V6iimtOszz
	AyBjPrs7X4joTYuzCm+uU2kL4DgwCRFdLyC9sWPkgeea1anIS8k89xBUNzPEbQnp1YN74GNKjuA
	/0m2opmvS0HU3SbjYzTv6c5qVl6gQhviSB4NcuifKirGGTKqHIhRHF8XKDUkaAYR/dOxKXWFkqy
	bqDx5XzDiLj4axaNn06sN0xEPEWjMVMUs9R9AUvIRyBCOdBv48yjrPkUuG0qcX2XRM02IxAEhql
	JQ8RcdNByrchUvNh9CoFkqAVvmMuk5jMNj+JhfGLuDVLoSTrJcqqM87+wfjn361+RANw0TnEo2F
	ilsSQvxWvTuiATBnave3ABV7wNx58/jw4qXayqL5YSmoJk1lZY4OVzXvddaHt3izIsiUibHUgmv
	/TTJJNyvO9d97mwgQBt10hZzRVln7+clbvVrXudBwKA=
X-Received: by 2002:a05:6000:25fc:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e3eb946b0mr17432153f8f.47.1793098241777;
        Tue, 27 Oct 2026 03:50:41 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm18106886f8f.19.2026.10.27.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4 13/23] gpio: Use named initializers for auxiliary_device_id arrays
Date: Tue, 27 Oct 2026 11:48:50 +0100
Message-ID:  <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ipK29xnsieM2Z67q+CvAQl79lTyhNKiU3EM6eQhLh+c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IG801Xj/dsnHBArUA01/9dajOs2YXsMz0r7/ 0bdBzCqWM6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBvAAKCRCPgPtYfRL+ Th39B/wO8L/KjsTN4YYo8sIDVMQshfXCnz3w4I0wsZDrmfl0ibSrpJEKPvUoeuTjbTk5TNVcUOA 7Nj1aG55ByyZvBvw1Wnxztb0fRyeysfOrIQrpk/GoxGEWG3El0646Dv8VQYGfwjPjaP1K3UgEOm 0UnSD9538+APY2fa/H4Mrllgl6SbVOawNiE87RLGviWy95wLqsmOYQKO2B/u6eAmENFaWCxOt6w s4h5TvuHKsO+z1oiHsnhaEFplEPmeUO0p4zZWnsJpPxgmwkQf0/qLRNBwGi26Ms2PQIcdGKLdIK tY+JJUdsfqoHvvEpioYzH9wYhQPWbjYSkJ1VPcSti4MFUewc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
auxiliary_device_id that replaces .driver_data by an anonymous union
(though none of these drivers uses .driver_data, so this patch isn't
strictly necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-elkhartlake.c | 2 +-
 drivers/gpio/gpio-ljca.c        | 2 +-
 drivers/gpio/gpio-ltc4283.c     | 2 +-
 drivers/gpio/gpio-tc9563.c      | 2 +-
 drivers/gpio/gpio-usbio.c       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartlake.c
index b96e7928b6e5..d4ddb3d00b86 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -59,7 +59,7 @@ static int ehl_gpio_probe(struct auxiliary_device *adev, const struct auxiliary_
 }
 
 static const struct auxiliary_device_id ehl_gpio_ids[] = {
-	{ EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
+	{ .name = EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ehl_gpio_ids);
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index ad5dc9a3a119..f967feedb5d2 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio" },
+	{ .name = "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
index 88aa6216006a..3295f159d83f 100644
--- a/drivers/gpio/gpio-ltc4283.c
+++ b/drivers/gpio/gpio-ltc4283.c
@@ -201,7 +201,7 @@ static int ltc4283_gpio_probe(struct auxiliary_device *adev,
 }
 
 static const struct auxiliary_device_id ltc4283_aux_id_table[] = {
-	{ "ltc4283.gpio" },
+	{ .name = "ltc4283.gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ltc4283_aux_id_table);
diff --git a/drivers/gpio/gpio-tc9563.c b/drivers/gpio/gpio-tc9563.c
index 68c20c8cba79..5ba9df2b6936 100644
--- a/drivers/gpio/gpio-tc9563.c
+++ b/drivers/gpio/gpio-tc9563.c
@@ -80,7 +80,7 @@ static int tc9563_gpio_probe(struct auxiliary_device *adev,
 };
 
 static const struct auxiliary_device_id tc9563_gpio_ids[] = {
-	{ "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
+	{ .name = "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, tc9563_gpio_ids);
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index e34734aa4365..fe8f51f1a4b1 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -230,7 +230,7 @@ static int usbio_gpio_probe(struct auxiliary_device *adev,
 }
 
 static const struct auxiliary_device_id usbio_gpio_id_table[] = {
-	{ "usbio.usbio-gpio" },
+	{ .name = "usbio.usbio-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, usbio_gpio_id_table);
-- 
2.56.0.rc1

