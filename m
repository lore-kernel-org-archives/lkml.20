Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612601;
	b=DEdcW7TJOt19hgrqrbJKKD2oBTQSANcuuyQmxLdMUSvoJ8cGxnSaLx+sR0uyGn3mLbF2
	 BBSZftw9Fhz9prjwd5034DWYzbOkyyYrJdLJCy7u0Kdfm0z0zEI6h8ju60JXA4c4CEDrt
	 Mjt7uk8NhQAWK9mjtDqVTKPYLX/RMG+eztFAAFN4ma3+Yc45hOiXM4c+2KsPWSloC/Ht1
	 1AHtoIQca8kR8j7W2VeaNThatX+47CsSbJR3qQi9hGhaGP70HoMA2Rfxy5+ALvOM3rwfZ
	 /kmQzqCkACIJReK9qA+R3QNKE+3x7JZyu9JlseYQyQGPf3uZssqwza1y4gJzQgdzlbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
	b=Nz0vb9eZcu8yyJxPjnPu7hc3upXe4v7mwZwN6Dzi2CO8VKXHmIIPvxXbJv6cFASnJu/E
	 3RI+YoFSghh33MJShBgsWU8SoXVPdB3gt96g/GKa6d9H6lsPAOpxQYx7Lld+kHM5s9rf4
	 OYvygm09VtcQL9teIYuBjv8klI+A/XiXtiyX9IR9fDE2hLbhcozEDKXIUK5uLLGSFKWXL
	 ONWpby7A0rr3V8fX2jFLGz3zfoTQet+zLxfA/8v2mU3QMHGSnEX4qE+awcU28neDeVJpH
	 U1s5n5jwXLJAg8DjXnI8kahJ4HkjeWhcDyagIouuphFPckUx0dlzPmhmPDstwv3s0cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QUxj6C4j;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6875606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6875606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QUxj6C4j
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so16118405e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612599; x=1794217399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
        b=QUxj6C4jTM/fpGKIKda/EfSvaVA+WfxDvnfJ8ApU2q+sPhgkcjL3WCqJnb4Z5aeKkG
         u/pmR6IxF+7oUZum3xg5iQCWDok3opBaYeOM65wUBxk4Nb1cBMqKlteQZrL64PadhglF
         VFOzZTNzH3zmrsNOXhkZ13Xsmo+HafXbmIWMAGqGzNI31Zpig9AXlym/PSz9MoU8/LlH
         PCLBbwa1kQOmNySPS+O7NXp2pHNueGByp6fRFriLm/bsZ78eb1xKGFqu3hJnxGZzRItn
         66zHKFbteK3zlwFOvfsWUDE3E1V/Uk2HSSluTsz3m3NKkOLDxhyIUakH8d2lGPAd7gVg
         84fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612599; x=1794217399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zuRXRGdsCMZO3tCr5/uvz2iu/+zzw+UAMTABxMn/ko=;
        b=Fx7BpdD+t6z0CbPb8gN7/l/IkhLXIDBFZed93DOyqY9POnfnD7ZkEXuT657ZVDwR2T
         22EE4EOKZcNJNehhHCEcgfRi0s2WCBYBrXI4b9XY+sjDZULVXQ4IJxgsnhEOBQojGWix
         N+uhn2DoFDjIG3ma4xTcPJ+OdYxGKPbI0LFc0eO+CLAbM5T2aXcJUfq7cvY/LcTKOG0P
         IZHlF/hF05imPFvAYwyRhPopoxcaOoGTYpEKVj810No88EmGxTlwZuKXnbNpilx/3ZGC
         hqVoIQkDBdASv8+gGqWN9UCwuzUbA4JD9iqzmM/6mxm/ZqDFVx+YskoKpZba/AXF2Kav
         /oow==
X-Forwarded-Encrypted: i=1; AKwUvBxVJlm16FORqxSDduZhuXoux6LM3rFsiLP49tERUXHQ2Xssuu7sdP2yDNg0w6+rI3OkumohjoRpbNzqKdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyW5LdKZjibZuOOsjkryUnxJ3rRT7SkAAjIImPIgqS0bVs7s6U
	c/UEafJw6cHE2/gbU546NN6V69LK/u51uEp+AyF4lnLhYVAS80iwOwez
X-Gm-Gg: AYBFou04ERj2bKQL8fMznUzNtJxi29c++ES0NFrMGGi8LYtPHZ+GEA7gHtRsg3uUUv2
	Lv7bQSCKXdRVShXUggChicGvGRo7KbrNY2lCZBGRlYQxXmFJLma6QJ49Wb7qem8TgVeL6Eu1nJ3
	BlAgcXqbzc7iOMCk8Pd4gJICAOVfJgo9v6IKmNbMYEpXjdV50fO6DYDrNXpAFM3PY5jR9wxmg2W
	8Ou11bqHXNbF6rd6OecmP7a7in9z3anpoFLmHTsiDXZ/CFMzugTUGnahv0tVySRfbQn6a0XsNIL
	+oVw/d/m0Smusz7x0sWImD/nBXuecTtOo22oH3dJthm1jpCHtUAwKfSg6hxsrEcL90bAbgHvccI
	aLVD1ojT+DW80XRLLDZ91i/g0d0iEeO1pqQuvLiMQKemDWlzTv6ErwyJldkIEDvVGPFuA86Pn+1
	yAMf5dDMDycPW6XLy4Y0RWQjtU6O2BVMH3qRnoY+/ME2891DX3Hhp8akpUGObimcBWxV61ApU/B
	kXhYpfDjMhgA73CyjWoOfBRf+lMzVsjXYuJu74h85EOEX2Ehd6o65lrC9OpYTReZCxlii0Ejx4h
	HvyeeaGowYTgFHDkCejZhMid5CFpJnPLPI0lxZ8=
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr227970295e9.4.1793612599312;
        Mon, 02 Nov 2026 01:43:19 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:18 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 1/2] staging: iio: addac: adt7316: sort headers alphabetically
Date: Mon,  2 Nov 2026 11:42:35 +0200
Message-ID: <20261102094236.57757-2-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
References: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
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

Sort included headers alphabetically without altering the list of
inclusions. Keep the <linux/iio/*> subsystem headers separated from
the <linux/*> group, and add a blank line before the local "adt7316.h"
header.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
v3:
 - New patch in v3: sort existing headers alphabetically without
   additions or removals, as suggested by Joshua Crofts.

 drivers/staging/iio/addac/adt7316.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..515f1fdae46b 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -5,22 +5,23 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
+#include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/workqueue.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/list.h>
-#include <linux/i2c.h>
-#include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
-#include <linux/iio/iio.h>
 #include <linux/iio/events.h>
+#include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+
 #include "adt7316.h"
 
 /*
-- 
2.56.0

