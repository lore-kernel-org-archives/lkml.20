Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02739366045
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809149; cv=none; b=iBYdhkUfFdN2DCbpNUt+mAmR+tuou17R9vKFMeN1xn+eKgoP2UAfjobEO/DUEMXEu3jTcNbCkxn3PgQwu58W+8vcPJR3FT0RYggxiaYX8h0Itq36nlkyGJHsrDA6eO4CBJDj6p50VR6k2CIdZ6DzFhF7Aa64zd2FtsEIQf3x3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809149; c=relaxed/simple;
	bh=xfQh0Y5R20vSZUxjaK2vmYzmU1LW79HxmsPiG+WbHk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NWfNfMl2Jbt9kJd6rJtgltCeG8SCk0hBmdI+XH+0t5I5zVhmuxUvKQYlU+kNhz9uJ22kRup+QcnIUCZ3IyCIiggdiO9IWgk41sV/w2Shyr6JIOjUp6V6yTDP2exWHhV9ry5G84cxpya5IL+sHUcUSxLO2BY4X/R5OOYo58x53g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3ijnRxm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3ijnRxm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso180607f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787809146; x=1788413946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOz3YD9m113l6BvHxW+pci6nfgveDpLEimxy0iOIiEM=;
        b=c3ijnRxmJJGNX1Co5BRN6SCDFkviargZThXe98Dwp5eHrG01JVfRzw4BQssiQ8iRem
         k4AUVtA7vc57GEoYqWuqbwYR27VTnifhBFdUonsd7w5972g2+XFTUoV78+oqBMwqkerf
         VbFSbN0TIODlaO91kp8oKS2fMkBthjFUPxoAXH3TghfhqmwprnLqQ9zVv0IMIcSo5gnx
         l32818GwfTJ8a+zQIwUtsVfVYY4J2W+Vqc807J4WAw9k/NUp3W0nQvOgS9p5l1vReRp2
         Uwc9jcTTgoUyMf6jczXYFgMtme6Ht2/fpsXgk3UAU5fvMAhuYS3TG18Mh5vsxN1C2AuJ
         y+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787809146; x=1788413946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOz3YD9m113l6BvHxW+pci6nfgveDpLEimxy0iOIiEM=;
        b=h91ydIxPzeq1+9rqdLhhm6V+2teadXn/11krvZct6WvNS5dckdUqh8A7oum7Aa9Bi5
         L9BVlOfoa2FIr+Pw0336CblA9iS/X9QHAeKvncku/vewlbjPxuV73hrtDgMg4uxEkoiQ
         q3pG/iNvZB5rFZjl8Rra6EvRVvo8fhtnEbDIXON5e2tACjMRu4SzJc6VbjdFL7TmYv3c
         j5FbZFhZytr3rUZLCJ8hKcNtoNVLfjDA+juNA7oo/NSfOCvlYfiWtVBdoRgyVbcT8poZ
         APHZPNIa0qDWT81o0NiOpeP3URTHvVgnDCERoskcXiMSy7tm2N9oYf8s9Gl04vohLp0r
         d9BA==
X-Forwarded-Encrypted: i=1; AHgh+RqksNlnwzY1heVs3nN3uJdD/BjUnpx/YDZfj4WeBQn8bR+b9wYdMN7UsMpiIidskp5lPyrLzBd0ZA0UFPI=@vger.kernel.org
X-Gm-Message-State: AFuF++kYQwh2fHU0vfcOEqC7RwKGuGt3d1I8OFsatUs17JGEiC38qljQ
	DK6OioJE01CRGbMzwbkJQR8yKMixHQX3miNBHnF0J6nAenUm3RmF1DcN
X-Gm-Gg: AR+sD10zKPixdHnEsE1/ga5rzXNwQmRZJO537UgIwKPpx9wwfdrYHgJAvff99gx5wfO
	/MeyrIRndH0WMDSD1G3+c1zbu75QIVPuEzsP4nW1An6cRiL/BoBRHStbgLJJ6vcO4LDarXEUwCf
	y3G+j5Y17zmWC3YIgN5Jaxdc+DKI3sknhN8/DmGPK6Xd/VKO64/uo+vBRITcjWm3eOddLeFWPGH
	8KxECzmvpceQLfuxyvF3HwSYCz85jQdOv30I2GjDwzYLN4RB4UAWZrf5sePZGMmn8CLdptuv4HZ
	jwKIzATFA1yPACmBSodoURs+WyyowyEw3JexArlbx+jeSx9VAqXqy/ddrjpltNVLMmXAfskBqtL
	4+bMGl9G/S7LGzotVxtOPBqQw2hp/olyA6j8g0ODMousG6St3pntMWAH3p+Ag66Nzkh/XjMs/sO
	UjfPqn/LD7vx9zpYixq1BwZMYpvbNQhr1mXQAFW99hIboissOk6Jm56lIAd9YPrWiHnrjYC0cIQ
	9l8y0nVdP45jVhsBDnzY37N6tpcHf/tyQw/KzEYwRKULu5nH7+W588N6I/PctP2lV4L2B7LR9f4
	o/ANgMYs2ujsfcoFpR44DRVxtw==
X-Received: by 2002:adf:e00d:0:10b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-482e26d7482mr10341961f8f.9.1787809146021;
        Wed, 26 Aug 2026 22:39:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc3f5sm6397295f8f.21.2026.08.26.22.39.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 22:39:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	linux-acpi@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Len Brown <lenb@kernel.org>,
	Anirudh Prasad <icarus@a0rg.com>,
	Sashiko <sashiko-bot@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ACPI: pfr_update: zero-initialize capability query result
Date: Thu, 27 Aug 2026 07:37:41 +0200
Message-Id: <20260827053741.79425-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

query_capability() copies four ACPI buffers into fixed-size fields using
the firmware-supplied lengths.  The existing overflow guard rejects
oversized buffers, but shorter buffers are accepted and leave trailing
bytes of the stack-allocated cap_hdr uninitialized.  PFRU_IOC_QUERY_CAP
then copies the entire structure to userspace.

Zero-initialize cap_hdr before querying the firmware.  This preserves the
existing handling of short firmware responses while preventing disclosure
of kernel stack data.  Oversized buffers remain rejected.

A QEMU _DSM returning one-byte buffers reproduced nonzero stack suffix
bytes in all four fields.  With this change, the ioctl still succeeds and
each unwritten suffix is zero-filled, while 64-byte buffers continue to
return -EINVAL.

Fixes: 0db89fa243e5 ("ACPI: Introduce Platform Firmware Runtime Update device driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/1a001e1fee9.637da6dc3533246.238498880682901704%40a0rg.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/acpi/pfr_update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/pfr_update.c b/drivers/acpi/pfr_update.c
index 9afd2c52fdbd..98ace679601b 100644
--- a/drivers/acpi/pfr_update.c
+++ b/drivers/acpi/pfr_update.c
@@ -422,7 +422,7 @@ static int start_update(int action, struct pfru_device *pfru_dev)
 
 static long pfru_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct pfru_update_cap_info cap_hdr;
+	struct pfru_update_cap_info cap_hdr = {};
 	struct pfru_device *pfru_dev = to_pfru_dev(file);
 	void __user *p = (void __user *)arg;
 	u32 rev;
-- 
2.39.5 (Apple Git-154)

