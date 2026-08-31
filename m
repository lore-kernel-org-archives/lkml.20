Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A1376A13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199281; cv=none; b=E09dke0z1jdSx6Atv1fWv/E+GT8jV3uuQw/+Jw4oj4miHZbtDJsxEeZ45/BSkLD6uXET6b/K0JFFBFxsvpAvRSn8q2vj47Ts/44+E+mhHAaOkKpgLHKzUKrcaBX4b54XlHAu/ZW1pkR4jcEwrkauMvqmAkVa274a1IgJXl1pimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199281; c=relaxed/simple;
	bh=WyTLm3nJrWyEPC1OlppN/k0EgaQgjfMDm7WlJrB5cQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILQnl/EIfbStgl0SDycSaXrjcTReAtnc/RH1A50nO4738Py3IBKuMTR3v66SuwjXjZviRHGWC09UXfZnqA2sK4xZTBPnwR+Vs+/q2hN6D2U5nXvweGUgSnkNkzcaoVyvIz46ADn9T8F32s382Rk6crzZPAmMKEc5hqwYbriaXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVFOhfVy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVFOhfVy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48436216a98so981976f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199277; x=1788804077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=RVFOhfVyiuBLKVMcE9W869HhgXwsmvhC33RHBi9A1O8FINvXt76H1FD63nkDcoEsUm
         3VcQqpJFOaIaUbqsguu4rOvLBtswj7O6uP9dXr/6l1sMZkeBYT8TgfQldtay2TpzHU1o
         2Z0pvSfYWqYCLkQgX1fBsh2HD0maLmFLxInV69O8Bk09qsECnM8uBSNBuDWNHEO47c1p
         xC9w9JcR4TccXEGIe4JukTDzgH8JuZk3FOEfIGHxA8JawS41Xm2hlXx75+2ubIvYkTtQ
         eCLKYJj+KJw3zU8qsT9iBDO/7gZP54/L6FZXheVBBip8ZcFBS27qPkC7cEw4+xE+d1ev
         B1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199277; x=1788804077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=DqptOb9CCdPdo9PDsh2YNUUOP/sNIsCqNpeWM6xI+qW3BUqShWHK140MgXaRsTqkMf
         JVq9Jq1jsDA7Xcq8SK1oBpCwssAUWr0CzQ873njpLvZCoawEUmDZnzwgAX3jG7Rp2T1X
         7WO/TbPhG71qav0RRZu38PsNygmiuqh2TpDYZ299CmCgnKTpkd4BPVtgA8W6BNviisi7
         YZuMiV4PJqcIL+r7iKnMCTvuA/4l6phiZmqINDW5OjzfhaCXhBcAReZSTTsBE+Js727f
         5c0lCBi7bVrSKN8voD2MzU49oSEdrTHFcoCZm4Fa7P6b9VFB5s7kgKCH1Qn2ycD/yhEI
         4e/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5jnCOIByGu5FvZGE9PyNAYUN2zrKQzIY0tAUf/H4ld6F1UJrxZTziTkCSX/K/ttWCj0z/nQvx4Hj/+js=@vger.kernel.org
X-Gm-Message-State: AFuF++nmMbkHMkcMItodITiex5iQBt0rGGnENUWAM7fx/a6LaglKuMV1
	H0xyA+vSYnE1sGfy8eHveTso8q2KPFHt3eVPXOAl7Tq7qOhZAsP4Aoo5
X-Gm-Gg: AYBFou0zEjQhEVPWezckuYZzGcTfBETRW5CTJRZBgofw+PRXhBkXUTb+gFMy2I1EnVZ
	X1jOqHpMqn3tHYaXL6HiMu+uvsMAYjHfKknmMIj9waaeK8GWfrxOBZwAgYY2dncSiXe6vhQG/5W
	pje9qtwxWjrfdAUd1RRK2SIcfNvsPOIBRVRvXDtC4d7AlOf8fiEIAP2tn1m14txZmJ8vxAulHBg
	89FA01H7WZnmy6EREI0P/GDpBP8dDTeRbJHqkT756lQ9orZQPCAGC1amcdLlus0j52H84rRKoTc
	DBR/WRHtK5DN7Hd60juItgeexa/JkcVTUwkOp+2EM+kzVI7iDRjUj1iVlXLgrGrqP7QYUOfaRAx
	m1uJ20ue3gLgrg4EQKGRdPsA8jBRrNuP92FE7MN3A7kv8ZQiH7+XkjQQPPGdwqYMN5Ij3fmIWy0
	oh4Igup9qKNLqnV/J4Ovti5yZT6zpRhEZM5kZJJRPoAc/v+JHHrvyS4AeTAmelvNkW5KkjidFHd
	fiV+TJvsrjlf6Qncp5Ve8e7PB+f1XrIvqVIYNRMpdU=
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr43581557f8f.19.1788199277291;
        Mon, 31 Aug 2026 11:01:17 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:16 -0700 (PDT)
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
Subject: [PATCH v5 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Mon, 31 Aug 2026 20:00:51 +0200
Message-ID: <20260831180101.3109854-7-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

