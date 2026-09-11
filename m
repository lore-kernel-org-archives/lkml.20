Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B6443C0A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789124822; cv=none; b=rNTPv6krnSmgH/XPkd6+pPhuoZKohGt3vgLhGJHtzVXi3X3cbFWMjCVGDNGJm1s3i33x2tP2uyoUHlvjsiVeMJNQxut1HzBeaJSgyaPtuyMHzDeiNJJnlaBHkdASb6dGX5mYrKqPboFrQCaVyU3FQDjBEDUO9bPgBuTi3clKkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789124822; c=relaxed/simple;
	bh=EzMqYzDCfAQK5VpIKxY1rBROjxfO+C/FptcZy2zwSMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCUiuKUnBWHT7eXbqD6/hdpruYCKpysPkRanvTJ2m3EKzBqirtL5HRuYhepXQ1zES77jJgE2Hclx0AXD/jkesIn5YzE23bC7ndspHeIW1MCHDye6hmJZz2T62fjeOtJqkVvxV2YH6Pj4bn7w0V1yTx0OEK9y9NA0k2yi1bLcVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnw5zctS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnw5zctS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so9770415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789124818; x=1789729618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3n3/zWk0l02hYrsGBXj2MvCkxdWvZK6d8q8d4YMlMfo=;
        b=dnw5zctS3rzEfTAY8YH4e1zkcEAhxnHPVzkL33y25FT2TSlJSH1RV9tL0QV/5fpwcr
         cGlLtu/z9IlNCCfI2gMzytHcWTAVRpFycP0VHzvwCfNN5hFbReX9cgA14SyGVz18T3FR
         zBwgdf5jempA8QA+nOVzhNC15OSu+HMYuPfLE6XcmUb23irqe4uCFK5oQZasY2vN8TAu
         RPcqnZK0ZpDSkCV5wiJ37rdfeecvgjjzn2xMHowB0p5KsLaxQuZVzH5zRDgURlEc/36j
         97NLudo+7YxjGN7zscIDu2EmJHNfuGkWRJmzOqoCrSCM5NLGOgLjTiWinfQUutaIz1Lk
         1mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124818; x=1789729618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n3/zWk0l02hYrsGBXj2MvCkxdWvZK6d8q8d4YMlMfo=;
        b=kmrwFssrK7gSCrTgxkTm3ocS/gsoYjv7ONi3vBoJwuvA2ZjHLzSGgc3A/g8gyDSK82
         WdaCrbpK1sLCJASyi3+RmKcJbMbIKqDZNU1Hc+nfaJmu8XlSOE2IEEsS05QtsKCi9UEu
         Sed5NoenApeJDcXLqBVBSwZJw///oIepceaPLFDYS2kwyWstyqz07iGFsv1siSUsqI7S
         euR5YUTu24LF5IJl+Ptif5L/5R5kPApdhN1hyFXATmF+yGkjtigrXbcOsojXurixX8G3
         c/7xXHHxnpiZoMx1TVWNTu134oZVX9PLs7LyD6/MVaM6KQu69UkreSiDsy/jvd65M6Vs
         Cy4w==
X-Forwarded-Encrypted: i=1; AKwUvBxfv6ylW8UntiUTCC42kjnnWTZKdFr5xPJt0pydBufy+Y2JY2pRX1rehNSMkduEZHWz71DcbbHLZOpKX5k=@vger.kernel.org
X-Gm-Message-State: AFuF++mb0oVWR12lreIfoEurXgthdlrG6TLHdumMrRc3RvQMS8mwDTJI
	hdWv8NKn3arb7DOAj9/+SBdjgbzNtfQpvFFk/MSyw2hUcICdLfkCaIcp
X-Gm-Gg: AYBFou3nFFmpR7Rnh4KAPVOnCOrGHi/UugfuTtq45qorHs080/xB2/NZwAupUmq6ECg
	4znlX4VyLUKsh2//YzilNDGH3Zhl9qXptxf31UgVmUMKo04CcdEmwEXD2F/2P/G0X5UOP/3lUaM
	gB1ToOjM9lIBNieynS9boVKhhQ2wmDDcz9Cv57oprys9KNqln1ITLW8YNaGUm/+HzulLSBJhYXt
	8HybYgpsr2mQi0Vhk2/5N9ti6YZohVzD+lj6TE4RwxwSU0I4vUmMJ0sjGYQbcCUNqZOWe0GhYUE
	j5jnHen+/KV8JGGC5wv2q7VdlOFfDBlAMMiR1TrKwzCn4N5eeoQMJ9jlvM0L6UPNmb6O0XSKG8v
	MfXOigzLHqviFviEYQFmsaDNOob4rvlbjL4Fr22Z5AdJAqgdtQJHFA5dzaN9dg9XoRTDMbnrvy3
	GW6sfcptOsAGWeiYFLllsDMPU+T3LVoyszbJ0vphzeDrQbvoxhDp7EWwJL/h/tUXv+95gu3mLt0
	ZspzHvgL7s9b/Ug1Vs=
X-Received: by 2002:a05:600c:c491:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e619bb949mr43669075e9.20.1789124817713;
        Fri, 11 Sep 2026 04:06:57 -0700 (PDT)
Received: from fedora ([154.182.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm66109065e9.8.2026.09.11.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:06:57 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v5 0/2] staging: iio: adc: ad7816: Fix SPI read race condition and DMA safety
Date: Fri, 11 Sep 2026 14:04:54 +0300
Message-ID: <20260911110456.24873-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses two separate issues in the ad7816 driver:
1. A race condition during SPI reads where multiple threads could
   disrupt the GPIO state.
2. A DMA safety issue caused by using a stack-allocated buffer for
   SPI transfers.

Changes in v5:
- Split the changes into two separate patches for bisectability, as
  requested by reviewers.
- Patch 1 focuses only on serializing the SPI read operations using
  guard(mutex) and devm_mutex_init().
- Patch 2 focuses only on replacing the stack buffer with a dedicated
  rx_buf aligned with IIO_DMA_MINALIGN.
- Updated commit messages to better describe the architectural issues.

Abdelnasser Hussein (2):
  staging: iio: adc: ad7816: Serialize SPI read operations
  staging: iio: adc: ad7816: Use DMA-safe buffer for SPI read

 drivers/staging/iio/adc/ad7816.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.54.0

