Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AB3C1D67
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788020778; cv=none; b=kza1Ifgzxf4/QzQEa+cbCaf8yAvrSCgOpQwFnQmUZFthGGoDmqrMHyqADgZ7MoTxiMFwdPaQbKmo2AZhkxZjcfCN2Dy56rPG6xlGS70FzkfK8dDh7G2J7fLW9LNCkqLvRTywogEFjgjm1xAgEBsP1yjX9e7LeZq8Qf1lc6SltvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788020778; c=relaxed/simple;
	bh=S0psc0GokPMG3r5dgQR0E3KceBkww71p70Ddzytet2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmjk2s0ylwVhYAB4wvwxn+gygrbUBAR1igKxwOjWKEwDxy+GVvxZMFBO7WkL/7i7hbSv2GQoaVkPJAIKp19/BSd4x37eiyFtZjtjTYv5Mj4n3ckFPXF3G2Kq5BTHpt57/6Wlf76/6jifS9U2Ek9WchyEzEJmT3mdLGSZIcMfK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPP6qe1O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPP6qe1O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso25761315e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788020770; x=1788625570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZLzJmQwMgWXL3sbjVA8gM6zLJbXj/mUC/hE8T4vkRg=;
        b=RPP6qe1OAYKTpcZB5weZFbheSLvek7xhDnM8N41s9xLKgdZo18CUUXxiIoLHVAbi+8
         5xlT6C/zz5suI8xwcOjZ0uRHf8oCRfvLUzq4t1tIRh9y/7cIAGBEDXnZJft15zom10VP
         wwCxjYQOCwnPe/MoTID4hzdvF26Pzl5XZbKpsSU6XxLi/GXGUiDxggbE9IMBs5V+Khw1
         /HiQggtIZNr54H9xZT5BEhsLzpwVLM09ewVmYQcSakk6SmDzfKLYg+64Eb9B8XmLyNVW
         skFY1zktYtrxpROgbrcllXRm5+4x2rv0yJa+/BbwtyASpKLuG2lyqbxWsOWgnuPTPH3E
         Vz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788020770; x=1788625570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZLzJmQwMgWXL3sbjVA8gM6zLJbXj/mUC/hE8T4vkRg=;
        b=U0DVpUH7WJl3oIpbvu5vce8PGPnVPmA6zK4qKyzAqVKkYZYVYDRS1OLMl4NwxEVI00
         jm8ALVf6Oiv456VerbCl6Pzh/LOidfCQPntmi3DF86VmzP+sbi3NIPglFAdU+l9Nky3P
         MrHM3CYhR18Xy9SYxOuOoV74JwKst0QZlVAk43YzzldLFJbPOUUBdSIIiO8/uYdWf7aK
         D8PcHrr5xFbTlHPyMXI5o+mi+g9TDvaiQwcySYanh/X6weAkmsmncJEuIhNsRStyThpV
         kPAjoe1A/czEp6bPf2ziX63v027mjDZWi64Bcywy29xQVJb6Vi6MgMzu+rWJceS5mzgh
         nUUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rooo8V0dW99ZfGTkZrLUXT773s5mv5/UBML7PX8u5DjJi45zGO+GkEHqTsZjyTX0H2KlkDRg2CMRxZ9bZw=@vger.kernel.org
X-Gm-Message-State: AFuF++ndYp8H+ng6AVVjYrQJvlOZwVh1vvmZKdGD6CjURB9X7VHLUVLL
	r2KHtB7j4TJJz5CsvZ+xROPXC71g0VcvmqVf2jg0djpsuSOmWR2Idfk8
X-Gm-Gg: AR+sD13I/cqg5SWAl1pSJlIxFPRf/zpNXNhk5+gAjLM6kEEWq3hUVLPUgQWW2ufAKjB
	tHOiBZg31ASGWrv5vuLpRL6kdVaEegqEjVEpgJoAyKUJ8BEgEncpigskHzfAX3CeTYbzaBTyTAR
	ec9XCKZgNs8F0ZNGJwWFmsO7nlju0zUsEgTq5RwE9JIdCk9o1IBRrZoXEl2H9aa4I1WxlTFS9qk
	rSVIb3tL9sihxSZrJjLdWCvv802GO0J45qYvhgf+dGLSD13Tjiy7VAGsDSndBvMWNblXj85Oa1y
	bbYxTgnrsOtzM+xrohGA5PTkVum3z//z4VhKE6RZ7MHRAyZTk6VHvFg7i++wfsZMLTq1Y8Ef1qF
	nKApHzVxL9L8jRZF8rg7tp7awhk6MOkJHoddUlcLQbbLYluimR9WIFsQjYVfvUN3HZCoG1LgfdE
	zfOlOicYD6OmCiIvwku8fy6Xz/8ih2dY/kdjgnuE96WCUv8XWRZvaTPSvKfLB8+WHTta6Uz3gt4
	kN8fxuwDi2jlsNwvHcPa7gq28QiRCYPS08P2zQp4dapY/h33gwZmEkylu60AooA3gMuN+lz5O9p
	KBf1ztuQ1BA+pR34HM9cJ/S+PhPNS6Y8kSb3ScOUO5a855QOlMGtntT9ZyEbjiCmt6X+fJXHc6p
	rn1vXknzGQU6qsgl5LUbuGYh1
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ccf18498emr47674955e9.12.1788020769528;
        Sat, 29 Aug 2026 09:26:09 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92679be5sm137861705e9.3.2026.08.29.09.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:26:09 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sat, 29 Aug 2026 18:26:03 +0200
Subject: [PATCH v2 06/11] iio: temperature: tmp117: sort headers
 alphabetically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-kernel-header-removal-v2-6-c67739d5dedf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788020764; l=928;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=S0psc0GokPMG3r5dgQR0E3KceBkww71p70Ddzytet2M=;
 b=ZYFfLtT6Syy/NUpaPutKPHlmtUMOJHqwuvm8i76shdwXaebkICsXD8FyumA0Dkr9zgJ1tIBbw
 WXNjhMkosLdDxUHs7kJDav7cvHJaVwy8XKujToCQr8Ud0sWnaQqnf0f
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically to improve readability.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tmp117.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
index 74cb8d62bef3..fed8af2d81eb 100644
--- a/drivers/iio/temperature/tmp117.c
+++ b/drivers/iio/temperature/tmp117.c
@@ -10,16 +10,16 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/bitops.h>
-#include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/limits.h>
+#include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 

-- 
2.55.0

