Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB54ED19A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734341; cv=none; b=uXJAbrG8lotmyCqY5p6ftQ5IzZH+JtmuKr8mp6stOy6+y6Gg1AsyXWS/r6oEYdex3iUcLUQ+AEIA4gHJzjSkEtOnsu7JeWwKWAptf4ORWNVjTi0PwAS57/J85NphkiPvZs8skv1+MsLHscChWGwQnkgooeQOrfhr2eO2g0IpOvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734341; c=relaxed/simple;
	bh=LSoXDOkihoTe+1aeuwkzPsOIbGrXJATfUTeqR5S99lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEqJOk5d5IBCw6huLslenRXRAzWU6trRCWk3pIKZoVinZd3nDy2LW4C+BfN/6B1ohXWJuexPHOi75r3Bx1MHj/D/n+ZhYOwSedwl+wpvxE/S4hoZ9ynd+LgAg9pU1KHl/F5Q6+QfyHAsAdDACaauJQ0nbZx1M207/Ls5pF4i5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEL7xXN0; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEL7xXN0"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so660654e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734329; x=1790339129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=AEL7xXN0UwJ6VFsT/iXOdPakeB/ZVEYtVslE3nC65clMSIVOou1AHTB8zFs1EBYiK2
         dK3ml1bdkqUuHp+WKF+1oj587l55/l7MRv0uHjlLMTrPdABBPAX9/Xk/4ex1as6G2p/I
         LEQIW1QNxX5PBAdsIUZkghWsOxT3c5lppTj+kWa0gCD0h68QKDmDGEdHRX8rhh1PVtrD
         XodjbwqxXfZzpugmekin5S8nuRif3wn4hZYSvN8URrxUGdowDTd8Md5NRd9KcW4mMtUJ
         GVjpPikp++JFQmR4fIC5w+p4T1lNVwnepZTpl1ytkjhhx9pYMHlaFDhqx4TrI1+L6N4l
         cK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734329; x=1790339129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=MMGcPJKkxiXWB0tBm3XGQsJNN4GmcbPJCfKfB6KQxr9WkAxn/85TuplsJOVFnMT0EP
         oXF2o31xSAqQQOy3EOlecfayl0VNhM+5CN1b/5m4NIlaOqvcJYplub+vHRWA8lBdMF0m
         w6a8CsvQm5HbyiSVxnqiHX1bxBXLFFoQV5yTjCLwkX5P/8uVzO1RpE3AriSwMiBZMgQv
         EdQlO3p1A8Cuu2Td1qexsPZzbT+KEtkhEe4yHIpLeJRppXDqRwtzaLgY8aGkgwFqznZp
         cLmcpoh6XgtKPKW3qTjDC4Ni7phOkco+q9ZhABEI3xMnHTBWLE0Ni9KMXKo55MG2IJnL
         8IVA==
X-Forwarded-Encrypted: i=1; AKwUvBwrEOWPmyvj1+OYx+YeV3iD/v0VEBo7ChFfwRJ1h5FUO9jUgUXrQf3I9dbMzBIb+oFuzCttUM0/++ZZJ6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n2Q7z9DwErOhMROLP5AnbT+qWlSgCoPkJB2E5PWHFAogx0AQZg
	8igSpUQ0gs9PMu2iWg6+PTRZigZmmeuEgzbib1Cf8b+HBKOIT9gX6/uU
X-Gm-Gg: AYBFou1RtoqdmIOSBgXd77wqsUUKUKf/aNUuWiGKjyPtTkTxn+Y4K1PH/xioDw56vxp
	J79aW/RhxkkTrDyE4ZU58BjrV9g5fZnavjX5nEbGEmceegFN6hjmH5uZtW1iYR/yTZTHKLszMEx
	wk/rEJUEwzw1VeZBNC7tZ8/iK5QudLVq5wHLw8APMf+0a/B4jS8r82mu1+NlU87cXmqYRp1Ec4m
	ZUHrGUeutxRi/t22FO/kkqrGn+hcy85j0HDDvfoKdp9j5jNc+U36YBkKYg9oYaa5UTrWBgJ+ECf
	j5OpY3ovsYBN/2L4Hlc40o5na2WeAlnL89sJWy9hBrQ9AQ/dWwgDTVGj1ND3utD5Wt/pUTKjNc4
	nMDZV1GNqdg1PTKMcMWjrDXTrFloRRo0mnC6fEOX943op4C76tKXN3K3B3Q2r+GK4nVLkfR0m33
	Jd/xXk1PUuHB3gVgOkT+tD0T2fiRBF/pkzp20n3SJA0GWTHpsDAia1goS/kQJPyvaDyUbuiuOl4
	kKY6zY79TLx+ckoLAXafZuhK66iVJYWt9JSnY7Sg2oKQuoX3OdpgkHGR5O1uRYldOXqkg==
X-Received: by 2002:a05:6512:3c89:b0:5b8:bc5e:b584 with SMTP id 2adb3069b0e04-5b8c195dba5mr702953e87.60.1789734329260;
        Fri, 18 Sep 2026 05:25:29 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:28 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v7 10/10] iio: pressure: dps310: check the lock markings with context analysis
Date: Fri, 18 Sep 2026 15:25:17 +0300
Message-ID: <20260918122517.377565-11-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__must_hold() markings added earlier in this series are only
documentation unless the file opts in, so switch the analysis on for
dps310.o.

Clean with clang 23.1.0 and CONFIG_WARN_CONTEXT_ANALYSIS=y. It does run:
dropping the lock around dps310_fifo_drain() warns rather than going
quietly.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/Makefile b/drivers/iio/pressure/Makefile
index bc0d11a20acc..4b1a05f7a0bd 100644
--- a/drivers/iio/pressure/Makefile
+++ b/drivers/iio/pressure/Makefile
@@ -3,6 +3,8 @@
 # Makefile for industrial I/O pressure drivers
 #
 
+CONTEXT_ANALYSIS_dps310.o := y
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ABP060MG) += abp060mg.o
 obj-$(CONFIG_ABP2030PA) += abp2030pa.o
-- 
2.43.0

