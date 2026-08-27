Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6B4D90C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854695; cv=none; b=MIUPDVxo6JUjarq4xCPRBpU6Za13IYItPGLNly7jg+PEnVbGrQzQ7KIWW/r8u3XcNV0UZnyiU0Cxz1X4ZLybz1RZibPq0q85Q4l3Vtgx7Ouo4DVl5eOahUWNRuCDaVrpJFtJdG7Scsfjg0GYsRick7VX6EYf5DElDZ/ivqlWkw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854695; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHv9HhTjJC74SJs9idjvEwYktGkmq+FVCAPKVKUe4IE2o/Xh8UIxfffLyESG3BjuPJdwGemNJO2OvepSL9TA1NhfCKNUVFu+9hTlylrw4q4gI2maDAzMRGILro6L5I2qug8FsduW7kgKoBKmYIEiesZitYo4d/tQz82USlMpQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rS8c6GRN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rS8c6GRN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so621335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854692; x=1788459492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=rS8c6GRNzy8gd2CgbyJjFX1+/4c+4ZA16oDC33F4vfDwiQwodpx4qFWqcRr0khmY89
         t4HFzQjI47OetUrg7HmReo1FC3NNL+3JabuvS4nHZuElhKtBj3PGSMXx4kh3BDtI0K5s
         ZnRIEBuuQtphFdBcG3qIzYYirbQqgvoTiTRDX1t/j5QxEN795Vxs8XgdJsGQPK7C+4l1
         5+ZU4OCAXRa6JV58LWZlrxnHv+Yk4ClRZQiS4lgGGT1qRa2VqiGhd29V82Asgz/bK3fK
         u46Rud1Q5MIBavVlXdiWh25GnP8RDzbDVy+vlfjHsSx+q27Wn0mcCZhIg7Sn96L8csYq
         BmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854692; x=1788459492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=kdSe9WHbXfLSUIuS2IGCfi+16kJfyqv1eE0tslJKW/H7fqXpHbsKYVDoNOh61R/YPa
         8Y9vhEgQs+kfuCs3enJ/1XBUEm9rrNPqdfktnv/KGk7zg4U+/XmV7EDu1Nb6LCSRQrZ+
         gxBuWrCsgpKymi3mz9X3KfAmXdSDc3Fk/CMsAtxyGFBv3DdLcJk5/W1RbIfYBJbig3hw
         3eS4frZN0DkDR0dF99cuxRBCeCZo8ymezNEwk+4J7JI0u7e3t+CXMgjIqA42w4OkUngh
         Y0f62a3xYdhqs5ZsbR1JmXUmUp6D6TK00KRhW2zX9A2BT8PaaXGHI/h2kTZjrjxL8WSm
         js/A==
X-Forwarded-Encrypted: i=1; AHgh+RpOtt9e47eTuTVhDISatnXsnL+ohQxIqLvZIBGgxrmgehN6SxQJXLlkTiLJ3GpULr3bkv12sqMfY0/CPsc=@vger.kernel.org
X-Gm-Message-State: AFuF++m+6MRKP0E1lhlWsIEM84QGcL0mHBnoYoIN0nyj2aC6c2gQo2l3
	06LfzIiUBKmcaQP80TucveQj3tNWm7TyIq8FDiFYXHh3jODMzzEhs4Ku
X-Gm-Gg: AR+sD10hPlnNABZjim0dI13WTbpjsjMEa+YWCqZQv7ZhWpmuK5Oj8Ny0oRdaZDu7H+x
	yzn9cEB1H3KnRegmr8BlV4pidTEuBtugPNYgn4Vko+w4QTPhJdHYGa3PqIJ6IVa6RE7BZFtOvkf
	wjTne77ArAPRoSfBlOSPxkgSxkC05yGlcwvz1WS6waLcVPi63zzzv+HVz82R8O7v8iZdezxfj6b
	Zy32QM4Ej+pjjKWWjdJAn/MATt2kODMTL+dsO2HCSaowwNTNeLLdSyGlp3f6Dld+vw36MsJiyr4
	wzZAEIhcwvROMP3GL9PBqqqG975jEpXSJyl2cWyzCcZLuwdheL5LzDbg50ahfO09h33SX3w2rqw
	ULQX+QgYvyUjdq2HiBVaNFAMeq2HAphGgysu2wWcPqR3BgR9H75JGpmVRLmRRfsQVTmzK0aCc8A
	xZPfgyQ+3D3OC8VvGw/LIPP1cRnt2s3HLt5Ql6HLnn4EERzkViQwX6Ie5jetKYF0Cj3M6UsCZBC
	4Eop3esuOmzvugDzGP9/cW136CO8zkfF3X7XgM2EfhcHC7Hm0g9DZQ=
X-Received: by 2002:a05:600c:4e14:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-49b91bd78c0mr16681215e9.0.1787854692236;
        Thu, 27 Aug 2026 11:18:12 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 06/11] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Thu, 27 Aug 2026 20:17:51 +0200
Message-ID: <20260827181756.2430054-7-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
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
Assisted-by: Codex:gpt-5.6-sol sparse
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

