Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357318;
	b=Xd3fFn1OP4uVoZwrukJ3lCE5OPKGgjR1EcaEe5iR2FbXkR1wkD3dsYvX8KL4cOHxblbf
	 7yJXOhRUBureDHept5uRUpKnW4QDIjP0LLPvCuwFv+cJpco2bfbVOAZofN4ELuXSeQBuf
	 OEGJMJogSrT/uzUJDgsmmcbUiozBLyw9rg5hxsFLgnXbSfUnTRvzudcK8j/VeNKRP2chx
	 zlI1l1J9b0fDPVeQtEAQjTC7MGb46jKDLsOZiiMRFPKPYcFaDxNMX0dnO0trxC45xqzLn
	 938jLr1tNASkY3JyOx/d1JSMTfYaq9E1uIYE3WTHouLMAnUVYBRUjiWwezeDCHNomQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
	b=BFzyiFdlM/nwPxerePzMQVPwzWCMyLV0LUbSTocKzW79+tEE62cDMSDAt0mrNamnhBsf
	 WnO6anSC7ySftRFPjd8//YYT6xgpTM5A79J6pgJ398xcmHqrHapdj/KBTGgyD6oKtVIwl
	 Lc7xVFTeiQseuCxnu77tX6tbliWTe76As3Xap4Ge0FNN9/2wx9Qa/dQOcCA3qeCW+ybV8
	 CX3tBk/1JDvAVkQZy0CsQzSegHsGWxiojK0ppJVgEGKtFjBpmzqg97kImnpBkYn69GyxN
	 0HXDx9g39gGrm97sygF5+NzN1tIOy9kDj3hQwzMSLVhyQCMiyUsEip9JbcmBOrfphog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbOYjEda;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0AE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbOYjEda
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so328950f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357317; x=1793962117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
        b=vbOYjEdaBbyMdhIQakogxXUu3241PunB6JUFa0Iqc5AMpqkWSzGmMI1+SaDwdNQ/KE
         GFGm5ZGi42VCa2omb+54oZ1wviKjP3pPFPQhXs6Yo8L6OR3LMa6vz7Q61bdJ8bpJ/2Mn
         zQIuP/M/uZr5JEgiBMAnIiGenKZn6IGlmY113mpeiaHyTR0uOkSWO8tH8k/wCQdNd1Zy
         XM9iQNqcJ//mx5gcxgMREeeEI6KMlPzWVMyCmQCNBTRl9JUwGHB4/UHBWmd9qPp36Iai
         pBa/Q8DmJ0NtzyyqpP44dkXUOuHNhxWfMSTUuYJ1GDAYJj3/WHZmNsOKy99OUgsohD6O
         7NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357317; x=1793962117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1z9/DW1dCHbs+qEJtXcl5om+PqlKumxC7fOSdG5ZB4=;
        b=smwJWlVWHN/hd97wsxZLjHy+pdbIHfCjMwuXc96h4D5Pepf/VE1W4ZpHmyFoI1K8II
         lejvY6morvOX1Jrrd+3MMoIIQ8WNV/3U6c8IvskEVB7p3SlkhkaEDaLttkUNNQ0M0G1y
         6+rtiMigJBN4UFvQoVbBxJTuUPZAkJZFf96I7/imYbyxQvMeajqGVA+LVw2SajoMmXH8
         GEcbr38NqBiO6bcRhjZ3mo6ep55JPvh3F+3knupaTQ2UjtrfKqiVXSDyR3gfHroJPVWf
         vDjZnGYPhu+6oJJm33BeL9DJGYUiOkG3jBAS9MejjkcjLZpL709Aqy69ecu0vH5bwvJ4
         x8aA==
X-Forwarded-Encrypted: i=1; AKwUvByp3UlM4i5NjklHmhT/ejMBSXpm6jlW3y5t/8i3tD9z2mgpgXRPNHC5NW++jPDziknrUxlgoq1hcnnxpvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTgvbmeuGQYVwPDG+oeD9x05VUMc/HUoaATBaVSrNNRhnhmkXK
	4GOdmv28UihWzD/IZy4qZlux04IO+DW/NvBCxoPRrgujj5nLuMpNJyR8
X-Gm-Gg: AYBFou1Ld1jpw72+Ix3hZil3ljW8eiBCCwTqAeGRPNAKoddJpFOhjy7B/q0JsIwBZ2I
	usqlCucgqydmv69MZwqfihqK+o9i4u/8eJlKyI0htJjJsnr2jA+Au4wS4k8brvwovJchkuDoclm
	D8aYY77ZQccAauAY+CXQeHVdygAxAvvZLq8q2kikeTeTCGzakmEHRdWknzfwZsJi5aimQmyF7gi
	RGFg2BZcTRXzCAQHRZJE7M45GNXxsMe8BiCWGo29NglM9LW5ID8zoLXjH3lhq2V8JP31jV4SboO
	HwMHC5YWUSSbYoKUG8uzBz8tQsBtvnvwESPipftYeLYtdylgWRq7nC31I980TJ4uOdaX9XotLHT
	k5TrN3dXTdO7RiSIgBP8uik/ItWiLesWo7A6I80EwYJ5m/1hevc0PkwxFGmMisJ2yoK8PrUsTgB
	4ma9MmYZxshAMI9GtqJO/W8xnC9LgRdzFY0/J8O1NuH6eu95o3vDq2pRnO3iMvpBen/1TzHoxmu
	VMrRXRIZYb9LZ/QssulNAP5PPDWv6LUf9xxAbkUEWHe8/CktDwQ2dTmKwoEjlS0ep/O0Q3hXOYE
	OVGgEftkjrFEvWpN0COuCHOyuObK+XGEvyKm02w32xqB+keIpBlGjDEaESca
X-Received: by 2002:a05:6000:4020:b0:48e:791:1cb with SMTP id ffacd0b85a97d-48e6e4f502dmr4669993f8f.35.1793357316844;
        Fri, 30 Oct 2026 03:48:36 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:36 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 2/2] staging: iio: addac: adt7316: explicitly include missing headers and sort
Date: Fri, 30 Oct 2026 12:47:45 +0200
Message-ID: <20261030104745.16693-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
References: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
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

Explicitly include <linux/err.h>, <linux/errno.h>, <linux/pm.h>,
<linux/string.h>, and <linux/types.h> for error handling, error codes,
EXPORT_GPL_SIMPLE_DEV_PM_OPS(), memcmp(), and fixed-width types. Drop
unused headers and sort the remaining headers alphabetically.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index d4b759ef637c..54d942cae586 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,23 +5,24 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
-#include <linux/bits.h>
 #include <linux/kstrtox.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
-#include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0

