Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800321;
	b=zjF7znKKUYKxUDZNus4YGf4LhuDP5WGUeKsKTl4VBsELKmKxciR7YP8IbCp3wOkOqfOt
	 r9BXzlrVPIv2PZqe1vMoQpEfy2ytMaavgKJNz8jYFhKRUROwv18CzOn3vfQaA1GYZAoyW
	 XQesynF6Sq1GxkDXEYgg8IytmJotfKdIZAIS38U7XSCwYHZHuouMg3uvj5DLqTg2xNIbq
	 AQ2tH1cqzR0101I1PZqjpGf8IF31OalmA27GWTUmyTL1QxNwHNf+a2ACC3MmqWxoTFO/n
	 5clqy5gmTAH+qacG9dkQGSrze4A9q061Y91bjd3Irb4XBAQXL/5CxRMkKt0ktVjcKBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
	b=gfhgy7MQSH24Q5KJXS3IpaRYDguyJrkNDb4+2x3QOc38dFQMklbJJeBJOV96vhRaIpFk
	 NWXTNjJUP8/s40pCIXRUJv6T8JloI6dsrEjLhIAOfDAYRajZgXC6LoIEcsRMa9wBWL5EU
	 BdgF6YW4TbyCTlYsQYeKhGjwuGg76dBIp3SBcscMOvYIyaapxi373e+qj8maUaBdZLe+o
	 mvUY0yuvV12jBvGWqQ6TZZclAsCIZZIVLOn9MXOB3nEkRcdx0w/GZtbQ7bdvZkw5Jimwp
	 WajZJCS6CldYEUdlHDKVybjgMRCpvjVRRxKUQ6yY0HE/Fqg6Dp1AZ4d6pE5ht+BTcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbMwDCU1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE0E606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE0E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbMwDCU1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so11445035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800319; x=1794405119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
        b=QbMwDCU1GBBhi0HNBlNPffLMPbXZaDrj0/d19Jjl2+wLg360OT07xsf1if+9nb5vLo
         NGT/muRwG9UdP1eqVjFjyd4EKzi/216CFVu/48xCeYXkV25whP1XKU3SiQDNqU/jbkTz
         xSyNnDbOm2lf25kxV/RauWoXmSpmm1HoSZsd/WMa29zfcGldjRjgU1SNCYHTXIwwu5eM
         QXc7eTC9gCvqc9Brh1QkNdCLdPqWi8ldcYGBMe6crKUCjnmznFHDEtHDKv235CI08d07
         wd2v2DNEkZO10vYdlXXFvfo5HRjO+nd3MI7J3oC+FrxIZ3ySi1aloRp5hPujJTF+ypIL
         QUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800319; x=1794405119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
        b=rnt/14PQsgEGph5mGxSTjLzdfxqWwcHarqA23NA74noqteVLJUavkClIxoP2Sj9TX+
         4u84s8AzKANYOW1ZRg9RPwa4jPQ+m3zTc+E3xAPtTx+XIN/b7oJXAvKmOk6hSJEeHfnJ
         jlWONJHcM67d+t7tfjJsf8MIrPiDuuhiyQSZriT8lbrlII1WZAav1mts3lZZkzGRRIUu
         +ubdSmQh4ZVg6quRRu7A6/A5o4basbcg0MZFsMPeG6QcxSB9RcbDFTARUHjT/gzGg2jH
         0FISSX3ZULK0RcTwKGJ5ChgsCiTeoeqWijkTrTe136gblbm7k0XaLwwH6fBLzPMixnWu
         uhew==
X-Forwarded-Encrypted: i=1; AKwUvBzFYThLN3RD8jgav5s71RZKr6juRpizEeQ9onnySnYriRZTPIQN8Rt8wt8yfr7J6bGF1qhCtcsUXlAhsRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eDwP/l19d6BJBB5zM9xlshTNWZFTR8BVRYrDTHqwQWijGyoYO
	T3g7qyBTMjSAmN5jltSpgXj7XYx/yjq+lZiFxbcD/TTrdcmZsuQfHO9M
X-Gm-Gg: AYBFou3GmipLnK48ADdI1QGMyLYwTr1fnBMvQ8ZMs0re9sCzVRcY5jwOfnyHxgmzN6r
	z6KmH2cgFZFBwFnzgvgm8dK1JN3jKlfgtjmejkTf5YBTFFl7BJ6NHKuaeDL+FatWHVK/ngsx6dM
	UQ1HPH87+IWunwKfZXODxTc9T6aGyOLhCsxBzCg0LG+EyR0TRFLoi7+oAsvQ9Q0rJEmUxcJge56
	+GhgVUgDUBgHEcHcK5CqsFjqlhtADYNSXICvSXrDzRjWn+Z6CzuA/9BnxHBPtxDuAtunHbsw5bZ
	XXi6jk07pZOZnvLedQBchAQggBaQYQP/bRL9KII9UcTwyfmqM1y0Z6M5l1WC0uFRXn4CI3qE30E
	rGTJL9kuIUaVeTVABvHxKeR7O89apn6TzzIzbMGITexOMDUS2WldosWfP33D5yNmG3fTewv9s3f
	6MNC5kPsxIRlYK40KP8vmhrw8oUQ7D+d0bVpWs3tUiGS5Cae8dm8bnF6QGVth8/+IeUDZ3mRZYz
	iTby+s29/O6me4RyiRAqJHj1VBIqb6GP6tmnxkX80lkA+mvj0kwD1SnFPnEJXFQhmxhkwae9+bq
	NkUHh2w5fGaOghL33GcDMe1q7GqsQX8aNHeJwN7w35bifDjVYFO4Ey878aCMeXHkjusWAGtcPYy
	cYw==
X-Received: by 2002:a05:600c:5246:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ac16acd947mr378511775e9.4.1793800319429;
        Wed, 04 Nov 2026 05:51:59 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm50795495e9.2.2026.11.04.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:51:58 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: Intel: kmb_platform: select BITREVERSE
Date: Wed,  4 Nov 2026 14:51:42 +0100
Message-ID: <20261104135142.3723042-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kmb_platform calls byte_rev_table, which lib/bitrev.c provides under
BITREVERSE.

  kmb_platform.c:(.text+0x1473): undefined reference to `byte_rev_table'

The driver can be built into vmlinux while GENERIC_BITREVERSE is a module,
in which case the symbol is not there at link time.

Select rather than depend on: BITREVERSE has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_INTEL_KEEMBAY unselectable.

BITREVERSE is the symbol to select rather than GENERIC_BITREVERSE: it
selects GENERIC_BITREVERSE only where the architecture has no native
implementation, so this stays correct on the architectures that do.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_INTEL_KEEMBAY=y and
CONFIG_GENERIC_BITREVERSE=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 63367364916a..3d361778a48d 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -87,6 +87,7 @@ config SND_SOC_INTEL_KEEMBAY
 	tristate "Keembay Platforms"
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	depends on COMMON_CLK
+	select BITREVERSE
 	select SND_DMAENGINE_PCM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.43.0

