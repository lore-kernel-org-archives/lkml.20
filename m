Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098232;
	b=4T8zOwV5BtVtYyMJs8GrsbWHFm4mIGxRsUzLwsCrPw3Sxm+Xu0UolK/ml0D8qlthfL1N
	 NGGvy+a0ZnPukkio4qi/h8Km8fzMiNkLi7aQdyVfA7IxLe+oAUqUfmOqTiLR0rMN9aHKn
	 KEM/WJfoMs4LsIvLEogOl5pY5OLbh6UTdhGahnYczjLkAwSbYy4VM4AISTgmaf5m3M6bN
	 8vbSDl1wjYSp0dLhvba3LhGyL4X9nI31a9xBvAiXSD2JjsbRhzAtFurAgYBWc/0zvsq/T
	 uaAoIUuaP5+UEmyEFtwT7FQBlaO+vwvqkbbmb9ylBRYiM6f2S56xMnvNSe4psqOcaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
	b=4MQ4Pyb/xvrro8Iqntp8prKWAtmEFeoYLfubpcaNIPUYCdqAbfquAeLbB71DM+Lrrp3P
	 iUcxIDoiAz68KPXrHMSWrAjZNyoU6c4Za6aRGQIKbyekkQnPd6dWu10IdXftkOUQe924/
	 zo45RT+G8eDP9nNshmW9kY3suQHmbV7VVxlY5r9UOufO8mV6xbOmztSzqNBmkeCxtzmPP
	 mqMgd9kWWOQD7dug0yoavLuhsJ6DcuWznbeEWpP9bCk3MjFFAq1bUzSX7rebBO4m/AFKK
	 EPicLmRchPMqI7+o8100+IrAAncaqejQLLycznbCC0ZSyvnQKAG0H8hAvypf9SORutQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XBGgq8o9;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59560A2634
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C59560A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XBGgq8o9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2539122f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098231; x=1793703031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
        b=XBGgq8o9JbOb4l46j2L+47pvl2lkQ13eqUdWXV8qlOY3Cp5KOr4bkNX9G8mh1D/AnG
         9f6hBwSZ1oLg6AEAHTxYxWZKpiIxKY3EtVMobh/ce1pd0DbuwBrWC4muJ7z2hekULjDJ
         rTltdNO0INQvd2u+aQGjsz0CJ8Z74ifG04klP5zrw3KLxBptFuG6GzRHTPzCqf2zQ05t
         i36I16dlt2uThYXqvuYW/aO+Vkowcld6cCakPTu1Hl2RIgFRGiqOzsnuwQ2BEvwuJxc0
         wkU+27EOW+AHGLorYL5REyQ4mPaFW0kR1wMf8E0M9BQrB3J05EGwIyjrgnyBqJ9neahp
         ZJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098231; x=1793703031;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYv8EXHvJRMuMkMYBGGipYHZCbhiodU9PiArP5nrXCI=;
        b=yzY/GwPOxRonlTekovNQNvnHWRsjmorFYvzQlCdBBwHXiG/DcxXC+Y+T+tWIoOC0VZ
         4ebRTrD7rK2Q2zgzVvfw0bK9kgh7OSgWCqphh0fHT5/W+ONqDryi5VsW6l4cBL9a+iIa
         IvFbdtMw7Ft3v4w17WZ6zFQeS5QTPdR5hFENJtW3qw2Do5hARgIkfR0Y4cf1IUSm5I5Z
         KUU4Ti5MPmK4yay72c9C9BLe4cHOLKnVxQIum+O5IQkfYcQ2RJSdnIu+zGy3IpyVh4uS
         jS3A217AuHYDgZJWNhd/draDjPtuPfHksag0LI4jdTBtxZiPgEj3Ab2+pJzJ5OsdLsS9
         73ug==
X-Forwarded-Encrypted: i=1; AKwUvBzXMoUDlDaxPrD55UEy1gQtpd5UQlfPoJYjdULOOj3UYOya0HXxiz/widSjhwqksGjfWY1AQHcbIP5BYhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyZOshLz4L8xVJuhGM8H13jfIv0U76kLnkFBxmSV08gcJf/rFY
	sTJCsfpXsHO5uQ6jPVatMWvX4SP+uCxdWDxlqQc81EDBjGXsKBuvYwXc+zHPdpj75lQ=
X-Gm-Gg: AYBFou3MTlXAlWqh5GE1diMGE/Yfm52hxARg7XseMJZKdXpy+MUqNrtzuPlPA7OAal2
	rp8jCL9e+knFN/IgrrW0lyWTdC+o9W2kftFIo7ictEkYKvHUP3Od6Oze90I6vAZ1UojiaPU7V4l
	C4KBRewGL04rWWIiWdXA+QX7kaNG/Zr19saTT6HIeUkxYv1VFMZBqUGKdzqx4PgxMqrqQvi++DH
	p+suBPnKZWn4PFKIWb7C4uHp/vzp9Tf1QOSOcC9A8Wf5m4IxgQ/6evCeF8yIAG46viWBLlzoEpP
	xV2J3A8alyTNqAaxjnPTwllwEC4X1QOI+J5sKfBwVC5y/KpkTI47uhHW5ZNXYjHd9yaQlCwWDyH
	K2DxNZM1XT0oeJvLmsGpsbeNa345ZxKt/gABH69SbUe9euAddRFucDVjmqk3ghE94mp/N2BcY2s
	PjUl48vv0nVe9aSdQO9zeEXCO70s4J1Atc/pKcdfzNDNiM3d9VnGhW9lb3jrXgCttnxZBxwRH39
	MECbe8skBknr70mMZfrPrQcU+4I588gaP5LD5OCPuavEVwTGtTJy3X5Rcl0lh8gZbbrKbBwVtfR
	Cv5hyUOzL34+u2RnxEvE7DEHLdCav9CcHzslaoK5h+w=
X-Received: by 2002:a05:6000:26c3:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e3eba2ad5mr17598797f8f.52.1793098230886;
        Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e412cc164sm20695508f8f.7.2026.10.27.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 08/23] gpio: sodaville: Add missing PCI module annotations
Date: Tue, 27 Oct 2026 11:48:45 +0100
Message-ID:  <44f004501d01b664d1bf61de3cf21b4415aef130.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WtjqA4a3vKGHy0KVRjMPxwLtVbVqn9jeY+O0QX7Ce+g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGphJAsvuyB2zcGVASwINr+K9dBC0GDAB9De ytk70ao4XKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBqQAKCRCPgPtYfRL+ TmcSB/9bawIqlP18JvgyKSnF9doZWtpD8DWY5ErViVjqoc4eQFQ0qKGn8IgvqJHu8XG28o886RQ TKcE9CWrItKnUSuGYa1sHIjJd/04bziHD43EoKCrvaBtvb+espwN3tg7Xz4qIQw55W8gBmVH1+E JBi9OxLt0bOO3shuaVCA2zfD+AgQzb3U+fKIrBZ5ocV7Vz9KCkYiJulfCO3WdgHRywPxdqN+VVP tKdjsiBcFxFZFoy2qTJKB11SW5wxJhm9rSRYdEi+UOQN4jRoCCaj5FEY2Ds+Jxw898ngnjW8g13 fn/rlbC33yXAetFEreVhXp4FhgB5ODOzbHyEM/UEKp4UTmR+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a PCI device id table is
supposed to declare that in the module's metadata. Add this information
to the sodaville driver.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-sodaville.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c..950aa12815eb 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -241,6 +241,7 @@ static const struct pci_device_id sdv_gpio_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_SDV_GPIO) },
 	{ 0, },
 };
+MODULE_DEVICE_TABLE(pci, sdv_gpio_pci_ids);
 
 static struct pci_driver sdv_gpio_driver = {
 	.driver = {
-- 
2.56.0.rc1

