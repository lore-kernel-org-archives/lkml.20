Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE33BBA1A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788109813; cv=none; b=OeUUVoQlOD2n8ZtYYLTOI6qYBdQ9elFRpnrwiJnYwVyeZIWQbRynAlGRRuEDZ63lxzVhgaCVQ1WtbiPZXk0Tyo91YyrbMHXBI6rJmGiWIcSiQmZ6MeGnZPUbYY3DHl0p1y3Fo6fceSGrQ8UvY9aJvp6aE6mQB8OkvfcEUNk1/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788109813; c=relaxed/simple;
	bh=bgK+DZod7mmJgogZgW1zioKzetKNGqoKIW9z56Vpb+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5oioWrL1B8ZFhQS0DtDw0ZUoSAAhSBSaEjf+P7AOoQRid4KZKD0iv7E4W3osDZeYiK5JhDM5T0wprFa+JDDOJ+qJSGrjg5CD7wVY0opwHVmbEtawsBEDb6/rmqJQgBq7V36lcEwYAh/AqMAv4Tkf5FzzEevOgDyT/IkmK8ouBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNENQCcU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNENQCcU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so4061097a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788109812; x=1788714612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=JNENQCcUfkz4Grh053ZdrHRJMBP1bi7Sv8ZGb7B5gtyvzNZTsXkGnVERYIVstQ268m
         HLRPBRq5xJVbeWxD+gD9FNJlH1bqxvnZq8zmsLIhzEZJUW7wwwd/CSKw5vYMovYCShXL
         TfvrBOvkqtv6ZxZuoTy107Kxmx+pXBlCZVyDyiLD05/dAYiAgCTLXUmH+pazlJu1HLZ1
         PkZZ3XmjBFevIRiVSUS5TWmqM28PfttFlCuxYp8sPCwRSFpIV4Vvhu+cs392BwfTa8B5
         hoY3bPfvCgpGmBWTo3vmj8Vxz2PauEMaakDvpDve9T6+K9XUGfICXK3ntDy6SlqDqxil
         QSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788109812; x=1788714612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2F/5Rn1z2wIFmLqiH74YcGVKvaBMa7CAe2jvYLlnR4=;
        b=mkWtVzSqkTzO/eFeR1SElRuBtgVKZ6KskJkEWSs8DQaRz0GpZA6SbO3gT6RXEpWvIX
         Cz14Ai2h7b/EMc7Dn7qRJNiONigOBNfGsZ2oUsPr8nIVcDZ0InrNvMRa10RZ12btENib
         EwhYbstIzZaNLWJfLOfQ67CTvNpbzJ34nGQKng9B96qEsnQckyd9iF+8Y0bw4lzl3971
         tatYCa0gBLQ4X9ANrWhgobIH8Kpld0COIlWm5pHdtxbJcLu1kZvM/RJB4HJDUjfxMcpn
         pPtGxBWZyTwL5Luf7VFYeh+f84eGg06dvNVav5jB3s6YeZt+fee4ZvXLBXvik1J5YOII
         OQzA==
X-Forwarded-Encrypted: i=1; AKwUvBycugXEPJbTWgXnivWIs7ezXXFskvCuUZ/9kRBNdyrN2oDRjcJkvglGoEszvfCr0uYyVw2lLl3KbdiPMKk=@vger.kernel.org
X-Gm-Message-State: AFuF++nwUUGK5z6CTMbTP1X0018ywmxLx62JOvkuP81KGtlRKh9L54Im
	UApHmtsQy0/igam2MGn4gkUp0jlb4UQ2RDmcigacrR+SMmriohe2Wspq
X-Gm-Gg: AYBFou2hwocmgSHv50+s1tfEH0ub0T7ZYvDzlUbBQBku9Cx10okQVUD6PORKAQHqym3
	eX6MDtl/1pHUa7ONr0+PXPR3kK1vzZHgu6Ih4iVbmIwr+4N3+e5QX+1DFNn2FCiY8sUQmGtEE7I
	h/FrIB5ctIGebHDhKZTXvNX2Ev5IUsKlqPNl52FdJd1Xb8dIfVcOjCuwG3dubh0TRvB57SoYfFr
	f7aFxSGfUyFd+wBQ9oVNJPmDyJQy58DtA9ulaPBbLbzZINEGWi0BHBXQ4Ar1u+y5NGRuKYKXZsV
	7D3fKXrvyKnS1m7BDRxSZk5O3MA023GcJfUQSj+lg/QxDLyXCP0LakkLTMmJP9Yx/9h+Uq2OcHc
	19PLxEl7tiRbUmMOFwiSrsrmKSALn2/qrTLEhtCT84EBkPFyrLKisMK9sy5zsHkctSG9F1oC0Fx
	eTFb2jX77qlnac+s9Paq0ZxLD8WVbXV8TWCEr3dgwHQJF73R0oUYNmua4+RA==
X-Received: by 2002:a17:90b:4cd1:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-3989bd40da3mr20529328a91.17.1788109811626;
        Sun, 30 Aug 2026 10:10:11 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:88d5:45ce:40e:490f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm17047101a91.6.2026.08.30.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 10:10:11 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v2 1/5] iio: adc: bcm_iproc_adc: sort headers alphabetically
Date: Sun, 30 Aug 2026 22:39:14 +0530
Message-ID: <20260830170919.470974-2-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830170919.470974-1-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Shahid <mdshahid03@gmail.com>

Sort the Linux kernel headers alphabetically to improve consistency
and make the include list easier to maintain.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index ab66b97d2f04..e46e3761993a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -3,14 +3,14 @@
  * Copyright 2016 Broadcom
  */
 
-#include <linux/module.h>
-#include <linux/io.h>
 #include <linux/clk.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0

