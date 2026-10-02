Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D023D295
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 02:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790907484; cv=none; b=h0nRsduj/iAdtCHoEOJziB1dcZI2fI7PZhy78RPLz9IxaviQe8VLtEk0QZfiRcnDLnxERMhDD/Z2ZzPt870SHQ+l9SxaE0rD0NVmp8OnTQ9wPbAqljW5iUw2epwOlAoAqQU71W5kBKGcHzZK1pdKTksdLD6Tx6pdl28Kz0GmHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790907484; c=relaxed/simple;
	bh=v7B+7ydzNsQJedTFcEih5jUTNDsmLAvLVDJGECtgAqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eECq/IsBwjRuO9Jl2jJ3bKm3xcH6zJiRBachRKoW8o320dScaaJ47+vujlnIlV+WozrM/3fhJosCGhnK8V9/mmDVGaBQ3WykEqhe4QAyDWez+0oSZpwcOBHnkMnXGsvPAWI2phokoooOEiVezj6aOINyBEaJtLdtJZSX1wj9zEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I65lxj1q; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I65lxj1q"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affce98dcso318182f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 19:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790907481; x=1791512281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3VaIb3BtBdftLmeTIXBSMEw6OrRCg+sJcH/2TWbb2M=;
        b=I65lxj1qGhSN/avluPbluSL/1B2rVQvtl3jh7kcWO41Ko2W/TSs5Zzl3mG7+fYcK9X
         uzuvxFLk5JhcmOmff3QG1FK9c2Cuf1z/k1ewvUT0B7xT+TFnZHHaAAVpsk6Tni8TZj1W
         fbSWjjuaX93NuXeJGaAbZB/hH8CoWMT4zTt9t6ucstwY/qoh1oc0ro3tkSt1MiAAY7y/
         /+dhxh3cfBJ2gQCA49nF2hLcFgTjUUXeeCEPo4ar3TmhTmsVBs/f7BwHagbwfM5FubM5
         GFBOfxoShLv19u9fZLH67wEVn6XHks2DDmD0pcQykgW+CKYTLRAwx6Jfevqpo1oB7etz
         liNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790907481; x=1791512281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3VaIb3BtBdftLmeTIXBSMEw6OrRCg+sJcH/2TWbb2M=;
        b=ZjNgl0+GM4N5meARj3JL5s7sajlRHP6nVWeW6K9wbhJl7XUx5PnjOp2xRlOQqoeFjH
         ZJI+/iRRkzg81lKAM9kWGIFSdaUBGmzuaDzkc5s2D3S8jYleL9nG6nLdzmwcgRwoWUHH
         Pe8VD21j+3b0J32yEvVYMQOXnsSC26OwbXgaQ/5Pi34uL9Ywc9+4ZJTgzEqp2i2KKAEx
         eaYQTga6ZVYeXhTxXkXPsy39fUoACNAjQnybs+qKu5hC9ji2BBV1RMon4CNQ5QIBYRJT
         sg6+OHhA04EHRuGWiyezDABxtAK6p4f+JEwvt21duFp3iD7qmWBN7xk4a6xPsP/PwKJK
         aDDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2POovLNht/rxq3YMlbKD/ygd4uUDeOUqAkScn5KfrG3oIMIy1IeAnkNRgPbQo+3ZyRnWdgKg1U04G0hE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD3AHb2yPvdiGfCWQFSEzX8vECjzfH79HQp+JAvNfJWTSakPO2
	TiPpolWH4gtYYKPqB7F6V+PrPTQAhghGVAGUsn0jTTtTWJ2J/pCR2DKfmN5F8wjDZ+ifVA==
X-Gm-Gg: AYBFou2HeiXtdyfWQ1ie8v/AmIIuncK4unlFzz3KDkN+g2g8iI/uXqKcweo9fOMdAcB
	N4TrUyryTDfHDfJFzvVF/kTHrZjDGfzy6dRyHosoJyN5SZpkKjulaovCpmBdEMR8Gjq4vK/CGFl
	gQb03ZPcTxqsEz01Tfy2w+uqfQ1R3oW8mumwlc9BVukOqSvoiknDlGy5dPXvJpHm2x0SeRArh6v
	C/zNVJW9VmRdiRMoHoHp7SvopaX/YxdO3OQ+StFEwNpZXjGdNA9oRpKK10LlxbaUOcL2ky+1o2n
	HmClqu377HRy3Qp8Wd2sL3pGj0M/5++XcrgiQcYxzLgxIe/nGKOllJDhm0LeLwTkKFI3eRPH/lW
	Q9ig4jgsuBQMOHOOuIECiHqHJ3eR0IpNKOxxk5QxILfNGsC1fIhNiik2kLf6PPp0O8ty903xDa9
	a9hT916SwNpadvdvVTPYgRK0BIRF3NI2HJVLDOCQE/oiRzy7n6JxDaxMzp48yGsNsO/vrjjG6ws
	1N0HgQPSJ6VuAbfXIwaQg==
X-Received: by 2002:a05:6000:2007:b0:48a:f4c1:4301 with SMTP id ffacd0b85a97d-48b127206d0mr2096245f8f.6.1790907480475;
        Thu, 01 Oct 2026 19:18:00 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e6bsm1605411f8f.6.2026.10.01.19.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 19:18:00 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	emmaonana18@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: fix kernel-doc warnings for cgs register typedefs
Date: Fri,  2 Oct 2026 03:17:50 +0100
Message-ID: <20261002021750.13596-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc reports prototype mismatches for the cgs register accessor
typedefs, whose comments do not use the documented typedef format, e.g.:

  drivers/gpu/drm/amd/include/cgs_common.h:89 ... expecting prototype
  for cgs_read_register(). Prototype was for uint32_t() instead

Use the typedef comment format for all four accessors (also restoring
the dropped _t suffix) and replace the wrong @offset with the real
@space/@index params in the two indirect-register comments.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 drivers/gpu/drm/amd/include/cgs_common.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/cgs_common.h b/drivers/gpu/drm/amd/include/cgs_common.h
index f40b6a03fe63..3a25c3c75a3a 100644
--- a/drivers/gpu/drm/amd/include/cgs_common.h
+++ b/drivers/gpu/drm/amd/include/cgs_common.h
@@ -81,7 +81,7 @@ struct cgs_firmware_info {
 typedef unsigned long cgs_handle_t;
 
 /**
- * cgs_read_register() - Read an MMIO register
+ * typedef cgs_read_register_t - Read an MMIO register
  * @cgs_device:	opaque device handle
  * @offset:	register offset
  *
@@ -90,7 +90,7 @@ typedef unsigned long cgs_handle_t;
 typedef uint32_t (*cgs_read_register_t)(struct cgs_device *cgs_device, unsigned offset);
 
 /**
- * cgs_write_register() - Write an MMIO register
+ * typedef cgs_write_register_t - Write an MMIO register
  * @cgs_device:	opaque device handle
  * @offset:	register offset
  * @value:	register value
@@ -99,9 +99,10 @@ typedef void (*cgs_write_register_t)(struct cgs_device *cgs_device, unsigned off
 				     uint32_t value);
 
 /**
- * cgs_read_ind_register() - Read an indirect register
+ * typedef cgs_read_ind_register_t - Read an indirect register
  * @cgs_device:	opaque device handle
- * @offset:	register offset
+ * @space:	indirect register space
+ * @index:	register index
  *
  * Return:  register value
  */
@@ -109,9 +110,10 @@ typedef uint32_t (*cgs_read_ind_register_t)(struct cgs_device *cgs_device, enum
 					    unsigned index);
 
 /**
- * cgs_write_ind_register() - Write an indirect register
+ * typedef cgs_write_ind_register_t - Write an indirect register
  * @cgs_device:	opaque device handle
- * @offset:	register offset
+ * @space:	indirect register space
+ * @index:	register index
  * @value:	register value
  */
 typedef void (*cgs_write_ind_register_t)(struct cgs_device *cgs_device, enum cgs_ind_reg space,
-- 
2.43.0

