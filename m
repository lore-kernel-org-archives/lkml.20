Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13B3B27C7
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020784; cv=none; b=muCF9NHle519FzaTIPtjvsT61Z0c9XJp4PqxgG32wKcsoobHle6lAlOYbLGuqhsdKMyfFg3hnGu3uQIVXJNRsfE/uahM6woKkpJ3xtnKyqNcM9gybDbk8nMFRR8d86UEwja7gqSbRmTwcMTR/ccZwpQFE0r5RJv9enbug4OW6rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020784; c=relaxed/simple;
	bh=c1kpDXLLAzdZm5rs2ETbE/7TO3I2DSL19IHJCzFyRZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZp+Erz8ImSUD5YC6JLyHgBeMk9cKO2fny9c9I5aRX2BmlM994iGkWhxABQvFZsm8hupeCrWMiR5YHEAUuXbSsTi5seHHjRZYCR3pnTwwX/nlZ0QmphUevBYYo7YDM94Jg0pTC8ofYShdGp/vNAA48ShxY+hwcNpfqSxTtb7DOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0YC6sMp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0YC6sMp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso25761565e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020772; x=1788625572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKzkLe41uuu5Pw2n4p3dvsG3NzOD2toE69Y9PiVCR9A=;
        b=S0YC6sMpzBdU7UHM1by4zSSpewAj8A7Gr1P9qcHz9x8JKl7dmX8K2wQhDmRiP3TwF4
         /dmcCW8YKeT1e+iSMT7yWqqU7foERwjkSesOe07arMb0MBh6A32V2VAWKApNeI3pCJ3f
         6hsKfKNenoIWAnaTRaBrRw6nowFWhgto8Ryy5PS30D23OvlSVjWopyTnMKGXQ4rU3aeQ
         2JSgu6OCkdXHpLbeDubaxputpespsQlOFifLYC4mJFtVutLsUKF36DExwrXsLb/RakOI
         OBysi4c27dLCMrtiyLntTQuUSs3RhhqdqMMk9hmQGoKjhYW6vnIGNXzG3Difd6pE0q17
         6VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020772; x=1788625572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKzkLe41uuu5Pw2n4p3dvsG3NzOD2toE69Y9PiVCR9A=;
        b=SCeHG+4df6PUh7YiqGwdyJ3awZN0GIWnAmOqkMQQavijU2BlznwBuci1EjPWSBpqPj
         PQcVP1bXLnzaTwtgL6vNgJYbxKszUN6dbvFGeaRwf01iPDeRntMmoK52i9WbgIiOVbjd
         6lzFZ9p7zoUTxWtuuHNk4DmawYmG1ctN8xe/hhIFJKGkw6ap0YXRUYt/DQdrwKWWLj3P
         8UzVkUIMhRsZTZdxKvttBPcrdUn8clpomDdB59IcxsyA3guneJJ0VI5hNpgOWk4Kcg3F
         oOVj2ONb1KE1YM6TrUQu5N0Yj3ZQD4Jha6FvqreflhcD6wDx85dkUUjr1t0OldzRiim4
         5UhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rph2OWexeJcZJev5xxi0qVMKYfnNiPXn0+7CPesSQ3qd8EIKDvbHkXgSDI6+n4Fw807C3csYm/JqNHqWHY=@vger.kernel.org
X-Gm-Message-State: AFuF++nUVIPuiYgD7YYrBzF09j+RtY2tuGgH7yR0uZBjVy8nUj5uiJ54
	eN0O4eaos2e+RWHtRp4ZvhMj7Sc7Gog8UjvGkbp8D3KkqQf27U9MJjX0
X-Gm-Gg: AR+sD12WcUg+QcHxgQpIwndSyz6IuxW5f6QBDSXJ9OosShsoteav6WW6WMVKq8jTQjf
	o1h31pnZLhfPdvvaxT+RaVRThQ+QkYQR4HGir6IE3vKtsUJjJn84Sff5THPq7zJL5Gzyi+jON0t
	a7s8QWDCpDMycGk1+TC0Ozk6yHQpCvcg2h+6Zpsc1aLPVPIM/fYf11mMIo48WXJhzWuOrtQUOvT
	HJGfPSuLf6gnSI9Ytiislxg7Fivoomh110pdLhh0Abt9Ax47YoqYZ2W4uicONUPgrraH0E8aD3h
	15LijTUS2zRN23J+aqAk6vcdo8pn4vBrMbzzwCzyGep8fFpbmEnD+aqepzI6SLtMXEB2o7txoCZ
	lhg0JW0zc8YmnrFBuBPyX9U0cXcqGNpGFrRzh1kEoNZyMrYXANKlUq4H3f4bkkkxJ3ywT1rk9/W
	Cp6pnCdvgoWxI4/pIZ6Zrne/MBBg7Q81+1YEDISFMcIgw4V9ScP44d5ZDCNOt1dV8hcyg8NoY1A
	oJUQyXMaAsxQ520DicBk9+5dcLehXS+HJ40xnDOvyUoctVN9IYyHoptzOKvWP1STnGpaNIH9sGh
	3UhYYD4MdDm1jO9tj9+CO/zPnDAXK8QCynkC3GnvZlOn0jH3DlpW+oBUGLUZ3jppALLfI6lsfyQ
	AeKNo+a0tpr3hKbF2VdprtXvL
X-Received: by 2002:a05:600c:c08b:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49b92027118mr191307805e9.6.1788020772133;
        Sat, 29 Aug 2026 09:26:12 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:11 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:07 +0200
Subject: [PATCH v2 10/11] iio: temperature: tsys02d: reorder headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-10-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
In-Reply-To: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=842;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=c1kpDXLLAzdZm5rs2ETbE/7TO3I2DSL19IHJCzFyRZI=;
 b=Qbo2EHJhgVjsqlTOD0GebUJhrQ2Z/B+kP8zaH/E8LxPElE3Keuts078okjbj5a2ottrf1gd0H
 jAtKiZ+f5F7DJvZmRYsYbR1WwiIZ3oAoXTI9jEHuLYZONxiBntoX0ES
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically and group the IIO specific headers
separately.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tsys02d.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 3ef72347456e..377e27b45fdd 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -10,11 +10,12 @@
  *  http://www.meas-spec.com/downloads/Digital_Sensor_TSYS02D.pdf
  */
 
-#include <linux/init.h>
 #include <linux/device.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/stat.h>
 #include <linux/module.h>
+#include <linux/stat.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 

-- 
2.55.0

