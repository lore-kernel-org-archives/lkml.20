Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925623B19B3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079877; cv=none; b=U7NiBLO+ek5zCA6xdI1UZ6pF0E7WfUstuR4oMtIabl31IGqM5T99OwY0y+P5MlwV2U7vGzsojMOCA+HMvSo+KWWIvkfvRK5tFBTKDgiacXVlQYHQBsa244cO4ASbTRfq1+z/bB986cKiXizZPsD1wlb0tno1H4nCYdEnHZ88nF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079877; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq57RhG1J2wdU5WOMrStAQqM87JtVoxWM4GDNfyFM7TLxDCMbIOHb54wPKhXJBrum6mGSdZopuqjgoqEjhOoJTvh4u/uEt23Em2avEle0t3m8TJmvheSzmhYPAtbJl73bm4NVzOwoyE274E2ecq4Az+A57vlTlBWxZ5PKsg66os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KUcJexIu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KUcJexIu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so49772865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079859; x=1792684659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=KUcJexIuP0X1spU5BTCIdLySxpGmyypeRaamvko0s2lMuCQod7lr8A3VFZ9pdUOdLu
         TY6hrEYMEMbOEoCQRMT+2AVVaZqxMQj3dgAIPGj0LKPGJQZtW+nhW0N/PhKAddvNN0p0
         VzMjOf0gXS/WHhpkoDzi/YOQ/TbIMrXCjdE1JnbUwNt556Qjj6XTRCv1uvTRXaOFvfgr
         EbXytLLtLMz3ZXN1SSDBZaQIfoDpFRKZtSmDgfkjloQbupKTyETbML3lMMo8Q7ONW/qx
         7MqWzbH8+xkk3Myvk+fVgh5ZqCXMKLDLaeUJD4Gc1jeKkAAMSnU+rEZsuo4LDay6tsk4
         W/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079859; x=1792684659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=l4vhKwMjf/NVdqIstwz7LkVgYbZT7LO+sLJII+02L/YCt9qAhwLQ7PPwbwKXoNrPIn
         MkXjt9U//DC5RkikzuOlPQoAhq0PBCOWrma9BoxDsDuQLGUD1xMsyPkfg7gyfDvxuyPp
         KlI2j2XFY00Ayon7QRa6LDwTP+4ecPGRLC+vimgx2UOvEeFW0V0afSz49HMecVmWPKQ9
         jBMXd6gl/qYz7LuY/RXc4/308cx/N+ex2GSJZIY4wjqMZynbaNMUnIOdDp7PfmZBBsu4
         wl0u8jKMIb9OcDNEYPdiYJVtQnfaPDTA5ztHKxCG4OBLrjiHEXYNAWTsf3KBHYSXGYwK
         S8TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgqyTEGgMmAzk7LNeeltzJYNWA7GloQyGy+6dMMUA0ujX4N0qv9oTGYwpveyv91Gsq77dtTDrqseGs2wU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbBmvV2gR3UEffdq2YdRCR/YJdlgV0rXih4HdnksIeBvxTdFWN
	E+CbA8H3xrdnZv8K6HP2FDWeMC21n2V8rsMt9lTD7LtrMbPHEHLZlBXRvLcFQSz91+w=
X-Gm-Gg: AYBFou1hULBd8hZkbYaUod7LdrvdSdfwoHFuoWP6CXSdGEGNbjpc578fEMqA/HJApRU
	YkP8asJvNr/vLdrvkTcVYy2hBuq7VCFBX+HB4OSGiqcok5+AJw3Cm0CRgyvYU+cIqipdanFiLCZ
	qYEo0v0oSVe/ACmkUt8G4H3UjbJk3pZjFZ2XKCZ/STMdMCpqtI/W6AkuYdksV+XlR77q2dM2MTD
	X0GBzmHcFKoyTCjwpuM7a9FZ9WItReSHSMQ816Y4AeibgadD3IUUrRdBP81lgYf36I1dAUttzoF
	YL8SioM9GdX9J+0HQ7Hfj7kc7CyImMn7/RlGkGp02JQsR06qAHrUJ8+2CTVSf+1aXvhg8iqOeEw
	nbBQfor1WMWicieiWI8Y0W5YmX1NxJZAbPemrlNy+YHCHKWBiPmUivs4yF8GYrVUDcXJlqhDVU2
	c0GIzvHDjAAaTtRK2OQhvtMaVsanrVHVXnIRiVhjzkmOAm+yr2SuB9/BbFI0m9yf0GOP7RCDHp7
	PoTBOL7UoddcfJU834T97ApUPFbqkThPfUNavWcLbzHMr8q2w==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr469180905e9.16.1792079859303;
        Thu, 15 Oct 2026 08:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:29 +0100
Subject: [PATCH v4 03/16] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-3-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

