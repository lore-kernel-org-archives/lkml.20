Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792781926;
	b=TgDe7Saib3FOiDWZTfGxAyBc4OoaV9kI3GmbMYfqoeM2DHkBmj0sR5wvnvMRMlpmrref
	 XqraAU8BkMFYXo3EIVZ3Mv/QMiQn9q157FTd6VEjazvPwWcwST0V7s2gdsS9+xrAMZIw5
	 r34Lxw0QQV22vUATITQUY4DWJnmzTYlUpKA9Sk4tH4AG/Q+3hcM/ccfqfMk0jjq/FfLez
	 FQpKgT+cj6Uk6KaCAV/r1afeWI9GU7wE187+1uGG5x5AN+tqv4prKUAk9fGGLiBVwfSuz
	 GKewyQLqIUAoYLNRlCLltvZO2Pexj7nzZjRKnk1n33ljbMaalSdW6Ou7PeYLhBEVG4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792781926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ftXpdhFkATxo6/EXtNI+J/Xc17Me9Qm6sS2VkoCB1jU=;
	b=j2TB1e+1GYuXZRHqI7uiB/wHt/VLriRtHUCkAgVKC/xp+cPNpxf5h4ndE1hg64GMtUaj
	 nRWeBaYMspOn4DlT6jvVFipPX0jC82WfNe9onyTuOOOv72WJsfMIDcTRvAc1Uha04nFtO
	 Uwj9Rlma8d7vJCX7feFvIHDI32fQR4bxgRKFXFDxDFfow9iMLjazTTC1tPYoLN2BbNMNc
	 MGZ6jdfqPYh4sibdxilEt6Zu4NB4nquO9pVGOe0HVja9bN5pg0He/wP/j2aU04G2nYrKP
	 I/TZ/gZjDVBhEiNJl/aqtaq9FvbeZnBBAqhQPJy+L1dlvruVmQdh6b/IwV4ZCqHPFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nCBeIUFB;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47869606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47869606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nCBeIUFB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2266917eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792781925; x=1793386725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftXpdhFkATxo6/EXtNI+J/Xc17Me9Qm6sS2VkoCB1jU=;
        b=nCBeIUFBM1c7udx6zt5cAvDNlfFtHhQDHrzljfxQkfDhVpyI6UuFLccKICERzDDpJf
         HHuG7cX/UpfMu8zIJ/LJeIVgpo/tcFMY81fpUl++GjL8PQFLlyf0HEINM1FOIxnUGoy2
         yButetyN3TcBxNoN6oG730YbmnEgobO/oszIuQp+xaHfbkvpp4/Utpkt9z3ihvuIjau7
         HBiu9vCZHZdftERVXqMu0obF3mXbGBzNyJoW7ZAoy2Kv0cd1iRg33Z5TNkhnAdqRoUN8
         izWapom+DQRJh7Phyb45y8TCelmg2aYDKyjDnrHPg05eMSefRDTFtQP9edflFj2IkTOf
         5+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792781925; x=1793386725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftXpdhFkATxo6/EXtNI+J/Xc17Me9Qm6sS2VkoCB1jU=;
        b=npP2IKrXJ2UOst9RGE2U88FnLAUqo6DEmFu6BKkm9ripj0Y2hGNW6BtSbd+LcitcaH
         jrPjOl5LMfh+sSiVFz/cQ6WZWl9mteGzz1MvBgAn0lp1tBW8R4NeuQBpeyCVYsaqysIe
         A36Qp9w3BWLwP9lfONwnmes7Oa/NKzYjeoIODsWDDp6q0FnWmainJC/VICJyhRsBMlqt
         Um+BhPGofQqFXmUPv2AHKYlYUGWeShGIaoghohvfh+/li0Ke7POua9TV3MwyplmYwYDL
         YGx9r2k120eMpAAnLP3HDwIVS3fv2qCMut0xNYojyIFp1MRhC215Os7O+w3qsFJeGiWG
         aD+A==
X-Forwarded-Encrypted: i=1; AKwUvBxWxTvvGWi8U1lxfYIjrlpQ7OdMdIzrrnA2N7cChJDkS+4efB1imBoJQwG6xWDa7q9xNwL669hdYj12bW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzIgjosqWWlQBXtMNkQ5lljX/X5y/Ygqzf6yg+lAfiurrozP1/
	B/xXvuvwVVeuczhpCiMVjFiz1iZeGhfiDU90l+BpYJd6cuuRAQk+P2Nr
X-Gm-Gg: AYBFou0C9n/UWo6qjCNuUEngwqYo94nc2w4mW/mvehmM6aXAFtHNsj1ukJ5HCkPEkXf
	ZYgFMJV8OW9I4uyUSDf+wVrhbfPpvJWU7tOjUdLa1DvwG8QuTcYwA6tR78uvEj2EAMbLT+91a4c
	mQIU74AQY2BzAZxvftWWY4Uot0MZzdZGDCLwlR2AGYmbYa2msWAFdDCGZVbomswjPSoSmbVEQsK
	xwJY9ABm7YFpej1zvtHDqM2UZmVo2Om0H1Lz8tGYTTFxEiS4Qu80kmieGRQVErzgXP7XiWV4jeo
	t5qIbvzpf+R660ekF38NVeqDOogPaMClVEnfSp+QFaTZa+/vzas7EPtMxO+N7vzenXsXbUTBO+A
	lIdmso1e/oNFZWvqBXqHWLLytNQpcdgFW+WLRYYalLvK2gdMghwBl2pC7aUy3OrCYoVwNKIzLsK
	KXAt7RozzfWgJiFxSVwhlkjjkKLJXc2YItg40sxP376Gz2KYd6pbB4Yc2/nbgrrOqeYYdQeqoDz
	P7iSyGcOMrU79NyctPNVIwguHwXdR5rxvaZEOZ8Z6DwxoEMLB/9bX/vgQdNJDlUkwcgfG8s+gtO
	u8wD41ivXjS1/WrZ8Azf6ZGhabg7jELFCfvjZxHtkw+68sa2e0llfPj0Kt7IUct2JD5qgvgWVll
	+Dp48wUKsENEr8xVLqHLp2zNvwhUgRvR8
X-Received: by 2002:a05:701b:2902:b0:186:5b49:90d8 with SMTP id a92af1059eb24-197c556c9c0mr1066617c88.4.1792781924931;
        Fri, 23 Oct 2026 11:58:44 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm366635c88.20.2026.10.23.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:58:44 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Marius Cristea <marius.cristea@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: adc: mcp3564: reject devices without match data
Date: Sat, 24 Oct 2026 00:28:34 +0530
Message-ID: <20261023185837.195943-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the chip can't be identified from its ID registers, the driver
falls back to spi_get_device_match_data() and dereferences the result
unconditionally. That returns NULL for a device bound through
driver_override whose name isn't in the id table, causing an oops.

Return -ENODATA in that case.

Fixes: 33ec3e5fc1ea ("iio: adc: adding support for MCP3564 ADC")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Shorten the commit message (Andy)
- Add Fixes tag
- Collect Andy's Reviewed-by
- Rebase on fixes-togreg

v1: https://lore.kernel.org/all/20261021225431.627718-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have MCP3564 hardware.

 drivers/iio/adc/mcp3564.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/adc/mcp3564.c b/drivers/iio/adc/mcp3564.c
index 259ac4ebdedf..91796a47e412 100644
--- a/drivers/iio/adc/mcp3564.c
+++ b/drivers/iio/adc/mcp3564.c
@@ -1204,6 +1204,9 @@ static int mcp3564_config(struct iio_dev *indio_dev, bool *use_internal_vref_att
 		 * try using fallback compatible in device tree to deal with some newer part number.
 		 */
 		adc->chip_info = spi_get_device_match_data(adc->spi);
+		if (!adc->chip_info)
+			return -ENODATA;
+
 		adc->have_vref = adc->chip_info->have_vref;
 	} else {
 		adc->chip_info = &mcp3564_chip_infos_tbl[ids];

base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9
-- 
2.53.0

