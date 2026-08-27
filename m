Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C593E1680
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872674; cv=none; b=LXcBWdYtLHSHO3z7O76H5/TlaOFpybXYyWT0H16h7yQcrHUBnmOtrm1c53ctXRqAPzaw5KykLkpivT4I8Ov5ozXU5V77+Vc4WAER+0DVnV0PcaoloZQ3YJAb1DV9jPbQdH2h5H/aIkR3tJBj4c4SQ7T0uhfJ/YhqOdIsHt3MHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872674; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKmrQvXxINdH2GdT5je99OCvahn9Wptenbn7DGIMpCwA9KMJs+gV6VmN6PXdfhg0AMuoE51/th97wT8rS5Wnyi0kaRJbk8Xxbv0bZqHWhW95buo8UAoiCKRoyhtF9qEdbth/TcVdg6X+AjuZnt7rf5xMawtn7fpDlLwGaz1c4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeVlJvMv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeVlJvMv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso2108165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872670; x=1788477470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=CeVlJvMvTnQ2bjJQmPBegbv1dsB0blCe8Pr1UDNo+ML/n9E9hZxGsZGI1/W3RCTE3o
         wiIOlW49yyGhp+/w6rZ+ZtCRvhPl6mImaFNwTnSVucVvb4B693EVPRJg275lOJlt4f0g
         NF4zeSukMuyKk6Usdy2I2LbSisYfX5nqGGIyQ7x88qKR/40+xQeBwVKZRm2xm4mJ+H9T
         HEWgrdhaYUduy0fqxD+4Ans0/ID7nSRFHZR+iY3x9yzqEloAOeq8mEE7ISCdkXSaWVtk
         z23887lhfmilVWaiUHV4p1Plaik+rW1L6N83sDEAPGzHbxJyvM6ofTnZWfRr1ueJ5ysU
         72Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872670; x=1788477470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=q87MX3Oao8Yvx1/B5N/FPq+OXN0YFynjrZO2oxZPoFyquHjhOKtFvg8Q8rUIwnOaLo
         W/VM83IS5eN7VcJGShB0Bbwrpr3a5Ghz5orFoJT9I5OyZW1hVUHd/Ivn0cMlXVfGpF/I
         1MElIWxx+jEgyUzE8/5uddJWXtRJ1JeKcSv2nVglmB2rNPHXHzV1OtUSlCCB7ZmZr0dn
         xebwBVUj15VqBGTrizES0nz8HTd6sLxuGE9rlOM7VhgJc0SB9ELdCNsuvXpEATdeCmQ7
         zQqUkDnhMGXuCRCaIjZ44XXad3PrjwzhELnRaCWsrGOLVxweMv+6rGxbqLFxCZyPd4UF
         aatw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/8iEiMjY9t8XxJ7xQ3A/hJrJKxnQoQWmH03y7CxmbqRhVeIxD2OBNj2jVXoGxFfQf2zCBbVKp2xUtbDg=@vger.kernel.org
X-Gm-Message-State: AFuF++l19LzAdwhQhYwCfZBZDoZU6WiCEJ+fTZBe+bVk7d1Cy6OSxv5N
	BGADc9jHChWpPbNRntoUtNaQeSQB30DGgZ33R0pWKJ9Rhf9Lg65LABfp
X-Gm-Gg: AR+sD130QMLDtjcERsblKvo/hmbkgknqYxW2ekAh0H792nOMJe9puo0xgqfbrjPSgDk
	ECHUXy3d/Z9ekXMs1506v46bqYI5cgvAz0jwU3mpzQ2KR7lvD6VkDn1SrpNhOyimU4ap/OGnp8H
	ilqK1AbLhUoPNh3W8kpcfUkNxD777bUArdATyJM0wzAukkeb/4OaLUtS7uDRslorNvx7z3L35z+
	oBTluKgfJhES8tN5JusMJjHtGvfvW55962HiqObgW16wsP2z8Z7ndCq5Eoq51AphLQjLg+cmfx+
	sswc1EcNS9KPdf4lPp8p7nXNQWKQ8KjXX5R7lntt6LmVl9kRHZDmNrDIspZPzaSVPicSylJwn1B
	cNkDyRKiaI3qlb7sUChGRnKgiWEgrEM+f5btIScXQZPWgWWEB7vlG5lHBK4nVqwqAwN2VvCYrTB
	PKzZUOnyyKSJ+6hRvhBu5hDi5/DloOWqXLjmvfviKdzTLcGv/C5zdP/32v1ptPGTKDg8Ru6l9jC
	aRnZWGJ/1nvFXyVX9rmTmILkAdUN2EkCB3xIemDE3yJ
X-Received: by 2002:a05:600c:6748:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49b91c57449mr33983265e9.11.1787872670200;
        Thu, 27 Aug 2026 16:17:50 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:49 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 06/12] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Fri, 28 Aug 2026 01:17:24 +0200
Message-ID: <074af4590e20c3c88e372f482faad03a358c7de5.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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

