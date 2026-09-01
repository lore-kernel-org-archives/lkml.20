Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089514A1E14
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289496; cv=none; b=uKtL7qdUcOsU4IbKXM8a6iDYKfv/aJRJIMFrf4jBHVBrD5nX6uvezj7lUc/nsL3LcMiRvISsALqMKjelmoVe/Sc4hwgq1B9aPwd0RH8WS+OM7aCslFQ9Rwnab4pO/9yvzohKmgfWiMAA/PXbMagwy3DH6hU56i4olToyS6I8CK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289496; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvjfPZlfbK1+9FFHlmgW0VVrWHc4AtVZxMQtoUqZEcMjCdPEgpqXYDzLEiWPHVtSnOpFhoid73gkWwBbXBy3Vk2R0aCLldchJWvgUWfxLIdRNy3AXFT0fBRQHjw8jfauyaLeTHyAZh+HAnmjWs8U5wFsQFoxqKwGkelVMVxHmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj7A7mQa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj7A7mQa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso873465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289492; x=1788894292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=jj7A7mQaB8H+YSOvaFUtGiPW7JAM5dj6NWzgy3avgUzGJxjE25DyBDYfAhWwIWlYJu
         /bLroceMB3Fp93qXeLSYa6MyyBwdVw7yZ7BfPS3MrIUAAHCamsA5pczQ+HfWSaolnQpd
         Sad2T8BiZZP39gZ3G6R4jhMb+ZdBooYdg6GfvnzZ9+Ddx94ddJMPNKlxKw0p838g9rus
         dGuBAHTQWSITPfgfxH+vnBhz/1eaiqo2mRyHTO6PNGXFT3ivKmhvdChOgKXCM+iE28/3
         QQpRfQFJe1AKSGpUpFtoKh7Ph2yKkK4oAWMYWki9A5ZZbtqavEl5jrUkhcQhr39QoyAL
         Oqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289492; x=1788894292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=M6C4X6qmtfJ6xz7GFub1CzD9Y125m2ZeW380GXm5qllwDS/GwwbRCC+fEwK+GDsvNn
         4YFzIigN8nnSN9/8844wuR5j/a4l36oainmaGqOv38A6kt2ZxiScXKASDQfwl+3QswY1
         qmPRwsxBZA4Cfpq5sdLYgX8L+OmbdAFxhbvRMVwdVV4BogJUXu4fnCngtu9yyYDzP/1W
         BlPyzT3S8rfa8UHLG4y4EnpVmAnPJpkGXg+AWiClxwXRr0jA54m+e31X/8asrgmVxL6L
         UUpnNOJl2e07w7J2Ic04yGFPMdWJtygEMoXxue3Nfy9jZ6SRJGGh7UGkf2pgizn+xM17
         8x/w==
X-Forwarded-Encrypted: i=1; AHgh+RrbG7G8QDyqf5fkfhnYLwGxZ4jUa8O0XnlJ9QRjePD9obxWLtfRxiC2gFXRpRHgb9K4UVaqR2bTQOVEWBo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMHseqwedkYhenpHoj/LCg+o9+jIHOZVB1Z8r+2fPSiLfoUFVT
	UlwQNDyENIet/KJUwDw/bdPsrHKyM6LrlDpkXFVvexHMWGfv941i0Isv
X-Gm-Gg: AR+sD12AyogktwxjoJxBPetBGOvqELXXsQxkx3VjjjADC8cBmXQEpHck0Rk33SN8wL/
	1xRoupHo8CcYvS+ntIyFQ9X4wxe9TRTmYFoTt6sRorAEvac9pnM4R2bkfGRcVnBcvJwDlJ3QcWM
	tKoB5LxSrltIQUew8b8yTyebqbV4xN6tc2A++jJ78P0yATfhSpnTHCrGe1+n6gapC+j2PRV4DwD
	IaI1m2B44r3+7Mi/MPoP1nA8+woa43f9/1ouCKJ2+Bv6otLnRKcmXE1quLuW5Rpn7DMLcCEZqhl
	be/PtUnwdsqon3vf8yOHhBsT5sHvN49MroyzhnEI77awl+dibHi7KIoSrpwkrPAeS7NuqJmYxFw
	lzxs2SkrIFPyRZGEhK9259GqOVJdN4lYSRbE7iMc7R0h0ZGWvLb9zIOGd3fRnRRo6c/SXaHtuw+
	d/lf+zL5i7M2KsTHIbloOYIZnr0rbm8xWItK4GX/aZRMCFsluDIoE8fntezUQ6Bd2rEMDmYM5f4
	WrbyhEA3mw+SXU0KoFax2wGP3wnRctuNzLYBtGZBg==
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr573053315e9.13.1788289491923;
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Tue,  1 Sep 2026 21:04:28 +0200
Message-ID: <d76e894ab0bff5604856d7f165da1c4ac7055a36.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

