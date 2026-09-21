Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747134E0B78
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015498; cv=none; b=pch0G+PT9Tf5fz3ogdkfo/RsyqCDczxNJ0CjY4+UQaAMSKwu4wyL8tUXPr+XlzSCUSQwed56SXFfU1nEcMCbnvZ+2NXVf3fQNjGk7RTStl/kV+J5+wa4BmJm+RAdje+E7OQO5jL9+T6E8sgjwzdjrIkn8fef54ABHafOl/2+09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015498; c=relaxed/simple;
	bh=yLp8lkrNj8/Ef7uLVEplyOWYdw/qqWhTRV1VUGljIY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABsqY7zoz3XoHdOn5+EoNAhtonqFtnRp3EhGP4Dj8xex+2/w8RUKEtVQFRtUgIDcwuqNfZITPXaVXBoHkZiwgUYTQv60YTuutOecCahMTRwUW4UQiWavICsA5n9dfNeymvLUb8TEtweuuN29NcMrX5AKhhGZR+5OwDN7f9xgoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8jGCdQo; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8jGCdQo"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302a4e42aso24962521fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015495; x=1790620295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0llHZI6UR/HQTlJ6R42f57JuOnDRnuq2B34vI1wLEFM=;
        b=G8jGCdQo7llEbMse5q5BwRntBP9MUraRh8IBlz3xAZ2piBwqOgl/45sKhJwgdfmL6o
         IodpGptE1ywHE/TNuFbsLWG/ZW+Olh5DNPwzVSbsvqwmvyzVf/t8VQ96Ue5m7cuWS96k
         Gx559sOCv93qSrgxgyxckpM8P1vQ3QR5xK/Q8v2kB9YW+5PG3ihBK6X+Sphm8IXITU81
         Q24ValjacIOFTEHdeJDPh1PNNfqY0vFZ18YvohhIEgSqODb/QR2IAt7m3/4+tOTe/mz+
         52hWfk1t+AnGXDEG1ES42TfHRd8TChOwX7UIqwMmlKdGc+Ch9Ndf+ZKSYgP1DNICj/UI
         wtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015495; x=1790620295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0llHZI6UR/HQTlJ6R42f57JuOnDRnuq2B34vI1wLEFM=;
        b=Qh5mFoIe9QdQK5pDZPuQ/BR6V9Ir+baGjSqwZK+Si+zdAum8kbwkvS1yaMaHpXX5Od
         6ztyzmDidzXxiZc7Uqf6xjekPSZJ7+VNoH2axkPBgUgM4jAlv74kmZ3N6hHoHtBy7R3h
         bwL/Iai653s/vlAzWhPfb0Sg/3yCYFk1pUp0PkJgeaPJklxkJr8TWCHwTa6QzwuNhO7T
         5gRNRLdG1m0UfsnWmGh2hqDC/Q3jlid9lha7gNoQvHGy3Ga8pLhgYHRjg/mTOpu4Hqw8
         VIebYYctwXH0FrX2ii51koAkWiWQcvy3eraNcgTf7fEFPMJG5cMJ6C6/xW++hQP3FvpS
         Lk8A==
X-Forwarded-Encrypted: i=1; AKwUvByfTz67x1dsFQlWaxeOx6jKb1wEhOGMr6aHOmEBDKLBQgtL07vU8Nde0chdyhD2UBTIkSCVm/+WvOaXcC0=@vger.kernel.org
X-Gm-Message-State: AFuF++n7s9bEGL/Z49P2jgvubvWyN6kP79jNmIMD/x2i1AywSdMhu5MR
	f30wCxXTtgL31KmvAlmSodq8rTxbxtg0u3xf/M/PPjEM8XPMNyeUNEqk
X-Gm-Gg: AYBFou2FQyLMZr5rYdL9izXsRbUkt9nv8Ak6s1vVuXnLKa3tRLNIlecPckM6m5+IdE0
	jg6TUQ3fxrgbSONzJFR3FOe8yqpi3GZUJOhhgyGkFWsxgbPmVEJCCQnfzYyXBrlwejLCqwDiIlL
	ab24URJfu1vM6HkJCjPmrizAObN1rf/bt1qlJbh2qYsbG+OLvUyKyrq9nKSKQHKv08uvyldW8RR
	NG4Sh7bPs7yxm+mlBofECjNYZNOtZvtvK04wtW7HJgicYqR4tLj984q5bVZpMvvJoUFXgDwefS4
	tLjvsMa8GwGhdeAUjC/9IU4psk6WT7xKG1PcPwnw1VrPnJ2OoVB7WEM5G/rphPF9NQSeVf5V4Su
	53Bas7E5wi5nuO18QrT0Ht+/J/gcx9+ayw11uJaVj8e+KfCU+Ds+r71nI2WCLXpLH97L9slmmZr
	uh/ub8VuBY6waLhn9Q/eaA0lLQw8ylW+eD1eq1CumkvQ4H9W0Ir5S7Ntf+78N3lqIMLN89Q7ZbF
	NZ+pYrBNXgJkdUD1WlO5pUJZfShX8HU/gJ18y5kRsCknTsbvIwuGwKvPox3uWCk79Xg2g==
X-Received: by 2002:a2e:b889:0:b0:3a5:fe42:8c9 with SMTP id 38308e7fff4ca-3a5fe420e6emr24210701fa.24.1790015494952;
        Mon, 21 Sep 2026 11:31:34 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:32 -0700 (PDT)
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
Subject: [PATCH v8 00/10] iio: pressure: dps310: FIFO and triggered buffer support
Date: Mon, 21 Sep 2026 21:31:22 +0300
Message-ID: <20260921183132.233136-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jonathan's review fixes on v7. Same functionality, except the flush hook,
which now holds the device mode while it drains.

Since v7:
 - the timestamp scan index lands in patch 5, where the enum is
 - the FIFO drain reads with one loop counter, declarations split
 - dps310_fifo_hold_free() is gone. It was a bare kfree() once the
   clearing went, and the alloc side sets the fields instead
 - the flush hook holds the mode across the drain, so a concurrent
   buffer disable cannot free active_scan_mask under it. Found by
   Sashiko on v7. Done with IIO_DEV_GUARD_CURRENT_MODE() and not the
   buffer mode claim, which patch 10 warns on, see the reply on 9/10

Retested on a DPS310 on a BeagleBone Black: six of six buffer enables
produce data, and 64 scan reads come back whole at watermark 1, 8 and 24.
Built with clang 23 and CONFIG_WARN_CONTEXT_ANALYSIS, no warnings.

Patch 10 opts into clang context analysis and comes last, so it can be
dropped alone.

Deferred to a cleanup series: min_t() to min(), 1000 to KILO,
30 * USEC_PER_MSEC, David's define sort, c00/c10 via get_unaligned_be24().

Rupesh Majhi (10):
  iio: pressure: dps310: fix CFG_REG bit definitions
  iio: pressure: dps310: use a local device pointer in probe
  iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
  iio: pressure: dps310: take the lock once per raw read
  iio: pressure: dps310: add triggered buffer support
  iio: core: add an accessor for scan_timestamp
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: check the lock markings with context analysis

 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/Makefile |   2 +
 drivers/iio/pressure/dps310.c | 726 ++++++++++++++++++++++++++++++----
 include/linux/iio/iio.h       |   9 +
 4 files changed, 652 insertions(+), 87 deletions(-)

-- 
2.43.0

