Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098219;
	b=BBNkTCvgAb65IIOHRvR4/KYKUabI6dDJCT8RL2twmJowsAwhEvKC0kwVp0EF0S1PDB+F
	 Erd5wKe0V7hsxmBNND5/ziBIOXkIR6g5ODghn78a/1SN4MKH//zLAu4AY1tggtUKVR8/+
	 aUSBotpQ1MiFIFlwEsFMTThwRg/cKyoggvz2DwMHmIOn1iBNMkOxQIGMlfamZavSXUyeY
	 EYuQ1PUIziakxfP596HStr4o8OzbgPGJzNm44+Pxo0OzstsDZCrYy7Z225Bj7gzPnraqj
	 5PwgHw8RhSGp1oFyLKPaxGf4uX7Hbar0/uBo8HFaQHInc68asZDFVIFk74ekeiih7Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
	b=GdQjuF5PijMx7QFqHA97pyaKdI49oZi4md1jhwO1+KYhyCfmTXmpPIEPVP3vWTas8xo+
	 glce8Lm1KXw8lx1G9NUbuKs/HaXEW4Jpet4G3DUigAgAUzmJaxjj/08hlunUjVZvpZLlI
	 cCl23mWW4xV45BTF993zWgvW1Jkad6ZqSNj7HP5+4245MVP2gEGxf9ooSYRE2KbPvEIhH
	 llsdfTxUcEIsLw9IWLbX5fteER/f/Z+yNUMX1jMKxaxt3hihw+SsPPa3EbR0gcaLREFnV
	 2miLtlhRD6rouaAGJLOeGfMFShwRWKfmFOHx026WOugHWSZTz/zqAoCJc6fy/0ynhHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ezoGoNS8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CB60A2612
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408CB60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ezoGoNS8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so608374f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098217; x=1793703017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=ezoGoNS8Pikx9g4SymUkplq3lT1YHsxN2XV8/G0eT0FANhqaoNp0aI8G//LysLEyzX
         BqW8ssIITqluCzkVnScue1HtjmAJvpaI9qJr5zJcdKg3wj340Vgo3ihXkbXWKBou16l9
         IPP87rCkUFIYzPzDfXpqOXsTp/viVowERjQuBivA0DXk8rxBseSQzERa/dau4pyvYpsE
         lpo07+eyvSs9SwkV+7I9uGVIz120JvHdqH3vZ367IJWzWjJsTdEXdk0QuvBWObwxLnWx
         gWey/oO47q1XplOMxoiKLkUVOSmIK0VJdPNDS55V5VAWvo79A0jXCsSocJdOpWrnbqC6
         Iauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098217; x=1793703017;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETEsZCw2EQD8kVp0lMlhrVaMPxfQkKrwcVthkx3hqKQ=;
        b=Jm9/dNtxlJXw88Kg4juEk4JlDPTruqUmceM7oeGxGOI0OSGwruZq/B5Jiak07vcZ2a
         OfAAvbz6+xucFCnYHcHKHzuH5tnJ425jXxDjoKh/bP+BLypvsr8yVN17N+h8pfU1W6AM
         UFTdTOJb4neYhx8a8Nf2395pat1n67bgXs2hPLjRlhQNgXNNXjFp6YR8bOOxVHNrOj4/
         SmvhHS6hup9c5fxoHpPmQAvVfhCdRTz9WV1ADKavd/sBtEOmW68C2f59DlNDkd2e0ojO
         nmtYlcuBpnuk2qkPq488kNsvTDTy4BWCuqBFE4o18/2BZwS0zzrkfCh/DhxQTWYU6UR9
         7ykQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZEjDhHjjtLqAK4wHftRhCW9dl2ONZuffBhe3Nojda9QMBW+8anu6yF7F1p4Yiczqk6eaF/2Fd5xwOxIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCK4nObNtAf71yPYdJdw5iIw4h4vMgKyu3muOBp4yVeQmnX8E7
	BkB96V6T9ee4Y0HX/RvZHi6rGDBnSaJOcweNSNWQ3zU8er44SohxUBnvHDy/Ho9yRnU=
X-Gm-Gg: AYBFou1y1mDGEcs2gOl9ApGGkKECQU98EV0Rm+lobyCek6IKAO9M8iDeZ/Tnsfp0SmJ
	zeGvoVljSNOYViUO6x/1HJhGhOemlWTpE0vRThVFFpXwmbJtjubWYbnVlYbY3Vg867bVXoP+zqn
	CP/9VoZt3Q6UhTHv0vg8Fssvu3g6fMamU3LtmubXd167cznL3UJmNF57NAMRbd1ucwrzIY/W+FL
	phC2cY6Feq+Gc24W/EmJtjc6B5cpzOfwozViG/JRSKYUYD8za6k5Kva9Zww1mTQEsetExdN2Iu2
	O5TMlBqiHuLeY4X11XQanWwWTUvxn+W1ti0EYkzo8vOibYiV+M0zIZt7idSuo8iPB3ynUFy6OWC
	/QPyfYgFNCYmbwqoSHJ7pub/NNyymLeWOnckqx90LPQ/OiPIc60djsqqhoVH5fTeAuAHvwnyj7d
	jv/ACdqtOW/MHPcfBTG62PUbzXNET/ZT7460uLzh36kBGxunC9b6M5HhV/oVlD0ldusEVJhGC/6
	HwwoTwC/B+m9kZT2QVX0Ih3BLU23hMayEaQPf8L7N8qeWoEOHjQ53AtWtfbpwUYI2QbIm/6Cke8
	kPeyKIEMrJGccCOBnLI9nFDqeb5Pr4wTP+3T53i/NRM=
X-Received: by 2002:a05:6000:1a85:b0:48d:efcb:1fea with SMTP id ffacd0b85a97d-48e559bc0d3mr5212733f8f.0.1793098217507;
        Tue, 27 Oct 2026 03:50:17 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f37csm17981730f8f.8.2026.10.27.03.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/23] gpio: Remove __maybe_unused annotations from acpi_device_id arrays
Date: Tue, 27 Oct 2026 11:48:38 +0100
Message-ID:  <9d9f0d81695cad02de8c0516c85d0b16c9cd51b0.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cOZ+9x4xpZu4jqMcVJUumxSmFjEiphgP8TFgVdGEb54=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGIqA6euQvoBlkmcuUXcw/PhJi9pqLaEpKUR 9+Znv/HzvaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBiAAKCRCPgPtYfRL+ Ts/+CACJydjZ6T4QJlLgb2TaNOcUBTVRmCSbOU/o7pkYAcbRLQWWzbbBK/MogfnWqxhUSLRRheR ND7Ch7FsHIG4ise8YqPugsPjAHd3QgJT0sVJHxQ88AqIkpzDs6qb1NWY10X7QePPDmYZAtVmoHl 1lNNnPLZuxM1GEdcgzUgQM2jmzzkC8XRNOdbtIg1W+vxM4C9cOPE2GvJ12aW+YKyhJDVocTWVwX +phFrKVcV8uDDJ6SdnyxX4cf8tRmtbs66u8bzXh0BBbXBod/G5KYD85npo1qPfFHayk4Uvud4ZS pdPwcb0Z/ZUHM2dVqMTLJ+dculyfIrf34zL8luR5RjyHOK7s
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the ACPI device-id arrays are always
used, thus the __maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mlxbf.c  | 2 +-
 drivers/gpio/gpio-mlxbf2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf.c b/drivers/gpio/gpio-mlxbf.c
index a18fedbc463e..1d338b24d52c 100644
--- a/drivers/gpio/gpio-mlxbf.c
+++ b/drivers/gpio/gpio-mlxbf.c
@@ -132,7 +132,7 @@ static int mlxbf_gpio_resume(struct platform_device *pdev)
 }
 #endif
 
-static const struct acpi_device_id __maybe_unused mlxbf_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf_gpio_acpi_match[] = {
 	{ "MLNXBF02", 0 },
 	{}
 };
diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e5c5d196a50..5e4726d583c1 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -450,7 +450,7 @@ static int mlxbf2_gpio_resume(struct device *dev)
 }
 static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
-static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
+static const struct acpi_device_id mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
 	{},
 };
-- 
2.56.0.rc1

