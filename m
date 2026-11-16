Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862412;
	b=EM+d0IaNw0oKJZ3pBNZo8chG7V63DtF8WlNqOVW6sCbM4UpYDL9zPT+fBrDnNk6P+jkZ
	 heWyVi0ProPs+P6Zi0sN29XjvX7GeZkkaPwrmkOxqUZqJHh7s2fN9k68wIftpCHZ/Pmi3
	 19HkpvXtXd07A2fu+fBOAJ9oCf/VjIttEh4IIVVaJI5gYtdob7k/jzSvQdYI2VCMMiNgb
	 INhbYovYBv6AhAxR1JEqNS7ZsfcS738h9bR6LtA0kBgPDJPWmp2v+SkF5cBPuhk/3pxWN
	 iXsn1x0kXUgCTiXJWtC1ONpOLxA2jLkAbJ/14VMJMNxxMlGdFC57pqEpswhhzYMGu9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cvMupzOZtYxKix8i7YVSQn/OkBYaiL8fo+IIInVPVHE=;
	b=bq+jHr8WhseD7H+VM6jqMwPyetvjEpkmukwb0vmrGgn/jfR/hgvuMNFZhBOICiP7ITJt
	 CYB4gI5Ai/HadAIAis8BlM4Rtgrz/2xoDE/PGUMSU7JAta65rdh2Q1M9FRo/CSy95TN1y
	 dvY//DaXo6MjV8dmojVyLf6D9i6DCF5SYGlLpoO31WIGjI5MKMGQ7aormmZQv1Qqu789c
	 qYvw8qJ0rdY9G+FLdTykIkbZTMyyT1BJ8ZgAmBXdaCc4sRMFu71oY9dcSftUYp/s+xqzq
	 L0gi6uPhYlEZs09ZiyWiXGhjQPVPO6WBmLo6roB4Ge0oUOhsTzkqq5GMG0Srmc3AsyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkQD9kNY;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC1606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ECC1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkQD9kNY
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so4901582c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862411; x=1795467211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvMupzOZtYxKix8i7YVSQn/OkBYaiL8fo+IIInVPVHE=;
        b=TkQD9kNYr0ubQles2l/V1+jSh7+ys0KC1QAirijznyR5rFoIh55v746WOULNwPqeNx
         n+Fdy05eSychRqgXKCSpZ4iWzs3SwK1AxLvsiL5KWB2nuFv9Gl2XGHHwyWgo1AR6gtT6
         cYw9YopVqdB7zw9FKjWQuTvVgPYHPIZzFjtdGv2XW41pAiHGT4dLumODZ/8dxrhfteul
         DithxtNiWApU8WxvXqWdE2ulwdpMk5E90zbkALdi6SMXn5AX3Qhd2GTmoiUyPAajYhNx
         bw1n3vQmR2FG/IiHCaHlc22311sR8DO+2fZcEk5eirijC11CgxoTfl/3jGumS3LLJz9a
         Ui6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862411; x=1795467211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvMupzOZtYxKix8i7YVSQn/OkBYaiL8fo+IIInVPVHE=;
        b=CzSAEWCwIwaGbNWgdYgMdbIegUdjC74mpI6L2sDB2O9jQ9QUTwv4d5E21sQHgZw+tn
         3pvjRh7j3VHRYrAWfB5Aa3nnGAhC1v8oLHfSnpk2+WFovsLwkIeg7hITrqhRE8EtpqYo
         ybZk3sQgn+qUFTLWccHTWu0f7228ZI8kadrbcMGbT+qSpyfaPJEhPr46ZYrYUAD/pSaR
         RkUKqMETzY19xvJhbVvs9dzbOrv15yW0wOXFBDudz7/FjnIvj2Yej20boH5t+Uz3OHVH
         nYYNTgtFQja7jYmz2+fo+zPZfFJFKGt9MePyVQQBhJPmbDeak33x4lPkkJ7Tkky/XcNz
         lU7w==
X-Forwarded-Encrypted: i=1; AL+hErHw+zF4PP5mM1ShW5R6qJwejbjQdM6oi6mQyD7ySqVcwtLYwRNynEAhHOHiX9RhMBY7HyyO1H/vLWrjMbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HI5gtqi3+2/x8agtlbZxjOQrUtjeMKY1LysrLFRPN07SpKfce
	sDg6GEQ9n87ahr868DxNCbYhYEkg79GZ9G2kEC8NMY4tY6+NtJuj16Hu
X-Gm-Gg: AYBFou2kMEf8ZTsHKoQNI+aXsP0t40Q9WQ5oaZ7sRQuQm+brwh4U+aLxPlQ2AR5OgGg
	nY0iU+nUzzDjMASQitBzLN7ZC8tICZNV1eKNxct9tFaS3tEtQ26hexmkIcn4znKSsIbdbPz97Sb
	RHjkAt6dSb0LllBGL8HChWWo2kbXENfQqh4SxVE5llp24P1RBHalanMHSKr4Teo+rk9tRhSmS5x
	KnBjFSlJjwiau/FJtB4nZjHc/r6znZprWq25JIGhspXRvFmj68DUw9OGJhDbtfSBASudh38BHLQ
	RHLrpSLmjoiOJjVkiP2L5VSVUab00zVxQy828VUdETiNjt7RNrQyfLO9Z+MBA76IOtsL4HGvdrr
	cxg+sirxt+3KVbWX7rG5OoLU5bGqczVLVUdYcgQHa298w5EqgOS6fOr/UejgV0GNnFpRKxweJXh
	b7cnu488YY6b2NT4MqEC2vTkrIcPE6XzogMKYHqqgzViQ8tHX23G12IccATqSIFHIPiU3hZAyYK
	3o7F3cuKNFEve5yroIi6emvejEYsp63W75Iw6x7aQO5LNXJHOVrigNrhT2rCDyeGK7p74U8dvU/
	oEtN5Jhh6iDUS8bioFuDlRY7unGBAB1GEZxXbNP5jkpCRTdQ+tVtT9QIYOMRmDeVL6t/Ym23mXh
	sHYMBINcQBogxpH7XtMooptLLi8dCgYQSGLZi8ygW7jo3lnGVnLq9+fH2D2uClKJZ00v8/qjoAb
	APKQi1UP23ja7FbThtXJApAxxwQmH/6MPaAoMhveRi2w==
X-Received: by 2002:a05:701b:4354:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b5031111afmr10808448c88.25.1794862410435;
        Mon, 16 Nov 2026 12:53:30 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:29 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 0/6] iio: proximity: sx93xx: fix raw reads, thresholds, hysteresis and gain
Date: Tue, 17 Nov 2026 02:23:08 +0530
Message-ID: <20261116205320.26070-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The remaining sx93xx fixes I had, sent as one series and grouped by
driver, as asked by Jonathan.

1: sx_common: a raw read can return on a stale completion (left by an
   interrupted read, or by conversions while another device uses the
   sensor's trigger), and it then turns off the CONVDONE interrupt the
   trigger depends on. The interrupted-read case was reported by
   Sashiko on Zhang Jie's sx9324 resolution patch.
2, 5: sx9324/sx9360 read_thresh() reports code r as r * r / 2, but
   write_thresh() inverts it with int_sqrt(2 * val), so writing back a
   value that was just read lowers odd codes by one; some negative
   values also wrap around instead of being rejected.
3, 6: sx9324/sx9360 write_hysteresis() turns negative values into the
   largest hysteresis.
4: the sx9360 gain encoding fix from the RFC, now a patch on top of
   "iio: proximity: sx9360: reject out-of-range hardware gain
   values" (in iio testing), as suggested by Jonathan. It uses the 
   encoding sx9324 got in 108e4d4de2b5 and that Semtech's own SX9360
   driver uses (codes 1..4 = x1..x8, 0 reserved).

Based on iio testing with the patches applied there since it was last
pushed (sx9324 reserved gain on read, sx9310 proxraw-strength = <0>,
sx9360 out-of-range gain).

Changes to patch 4 since the RFC:
- Rebased on the applied out-of-range gain patch; GAIN_8 becomes 0x4
  and the range check uses ilog2(val) + 1
- Commit message cites the Semtech vendor driver

RFC: https://lore.kernel.org/all/20261107112335.444813-1-kapoorarnav43@gmail.com/

The threshold change was checked against a userspace copy of both
conversions: all 256 codes round-trip, and every write picks the
largest code whose reported threshold doesn't exceed the request.
Compile-tested only (W=1); I don't have SX93xx hardware.

Arnav Kapoor (6):
  iio: proximity: sx_common: fix raw reads while the trigger is in use
  iio: proximity: sx9324: fix proximity threshold writes
  iio: proximity: sx9324: reject negative hysteresis values
  iio: proximity: sx9360: fix hardware gain encoding
  iio: proximity: sx9360: fix proximity threshold writes
  iio: proximity: sx9360: reject negative hysteresis values

 drivers/iio/proximity/sx9324.c    |  9 ++++++++-
 drivers/iio/proximity/sx9360.c    | 29 ++++++++++++++++++++++-------
 drivers/iio/proximity/sx_common.c | 25 +++++++++++++++++++------
 3 files changed, 49 insertions(+), 14 deletions(-)


base-commit: 8fda275449b68a96f0a38a61daa35cc39b0fb9d8
-- 
2.53.0

