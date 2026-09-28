Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EE4BD34A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629901; cv=none; b=ZMffQyrtXY6kITX5yJQ32MVdyjr4QWs/YCYTHljbJVArWTEjCJ/pnRa288CE+UVsKy/UJ1wzZl6n3dHPCuaq/+7JBW62yhIyKpVgek7dvw3muRHivLb5+oSq/6LNhGTXmFVOJHCDdq4SqzoCkabyQzcvfhDUXTi8Vya5+jI5f78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629901; c=relaxed/simple;
	bh=tsxLQf8jd7dlQ+Ix8M4HThMl6rFIraMlD65LQaxolTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d25pBjcQUBZf+NSvsi70/OuYRQ2BqZfOCVEzgeuOHNCAK9iYrWge1tMrniouOMqWvXdFNoDxVSTvvC9zJDXqYwgNvBQmgGBftaBm8XG413cmErSe+DTsmYUW2H4AvIhO8io8geUAv5fKcsIPnGbYgE9ciUIMcfXjkxwgLQslBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXjt0K1n; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXjt0K1n"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso2799167e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629897; x=1791234697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrpocXf0O2heWpnp0ajD/rYn/Hmrr/pD9FGGdmh/wgQ=;
        b=aXjt0K1nn75bqqZNxEQZ0KbaUt34cCEv9uBkgKAtiRAfTjwQCwAXCtzxMghhX4yQ/N
         kECY0YwHhUpUpdHU18u7vyW6uKO4OMuS9fzBbvzIClStSYxYd0xfMp4TNX0l3V6LTT8A
         TpC9aTdPPcMaOGdi9MgWkZ6Plv64TrhCjeWPe9q45fN3EBzBrsV2269tdEwJMGaGAD+E
         yV/Ci3DgRe/P/oTHDc14I+qq3Z9u2PTLUyTE4cByt0r5ySkhl/mrZ8kXKW72h3OYOAvT
         UMKvPx5cGjO5ostxzePFhLqTQAztXg4teeonvl4G9YZqJLfNgacF8axWfwKMOoMCAW9X
         qDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629897; x=1791234697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrpocXf0O2heWpnp0ajD/rYn/Hmrr/pD9FGGdmh/wgQ=;
        b=m5QDvcFq9uQnfQMO1MkjNzhGv4XCX5ff7Lub5SOsfeSNFJKWDpdEzBA+l76btqsn6n
         R9SZlxN4JImqcIy1NS2ZUMVPfTybECa4yyUJPibmss9ZEXaquqfN/UYE/HGa1A6jI52g
         2iTJtNGJmYQ+SfKt8tzy9XtZ+9F+1BoLcDv/NaU/9OIPd36eTgOnO+QsdbXNTv1EYhaX
         7/ppT6T4BKKhMNkgpX7EFgeYQkHQUozy+W1rmMRgZ9FHosp6zcgsxwfpkVLBq3k2wxfW
         t4ZuTSj1iRtHFrqTiUdtDIoYMr+nvp7x3NdAp0rUgWzQ4UKn5+lt2rvCI88/1GeNFHuS
         5t8g==
X-Forwarded-Encrypted: i=1; AKwUvBwI+drI3RgoSMzfuNFHNg/nq3lrjFLqqOePE8FNX/PvjUEOxoxU8qfAS6xDihFs5LdwyQFT5q4lLE2ip+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyrzISEjkDKg+laKAJzLRjq+psOXYOVmbc5uee/Z/yYEySgaa4
	pPkJmqLExb7e/+fyuFMwCpM4LdAh89iOzI9Euj569XHG6UmBfF3JWWen
X-Gm-Gg: AYBFou1MSLu7jT8XoVFm5UavR6ltjGtjqh+qIhi/XO4wocjEdM+gHScZwp8u++NKgQS
	Y8kppbKnFAz+03pMBArZzzWJ92EntNGOl16w+sm1IYoF0qQN1biLRMIn7wnJ1POcO2SZlq+7iGo
	RAHw/vfk8hmmWcK5WhMdLr8VYnDuISCbSJnWHzDdDda/vR/Z+OkjyViFbeduJmeNlnDob3gCghV
	8ekD4IuYOW80zvRPoUZm9r0Bywv/KPEeUrEClZWI5wcEc4Y0hVzop9ASWioNT/Mi8FkHbPtHciT
	/Q6Lu2d4PdOBXCa/d8LXYUtXWtd2VibJUEVDN0MtulG27Jj641s/7Ibbgw7LqgllXVIB26dAqjL
	Hh3s8a0j4LFZ0+v9F4xfFIOjim/8eRLetuauHdsZVe81dy253D77lbRLxMNF+SyH0pkFgIvIPB4
	GJg/C7WYzFwZJ188s1K+2LMFsAvNXR26NUYrKdOrGYJreaW/YnYRA0D+TK0C+Idv4my6X2VdjBl
	kc/zU3EMBf/E37DiauzxX5XIToX01nxBzzEPo6UOclLQm9ikk2fRfbJf58sI49YJteZsA==
X-Received: by 2002:a05:6512:23a6:b0:5b8:f034:cbf7 with SMTP id 2adb3069b0e04-5b8f034cdeamr2665277e87.49.1790629897237;
        Mon, 28 Sep 2026 14:11:37 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826fa06sm842860e87.8.2026.09.28.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:11:35 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v9 0/3] iio: pressure: dps310: hardware FIFO support
Date: Tue, 29 Sep 2026 00:11:24 +0300
Message-ID: <20260928211127.641828-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rest of v8, rebased on iio/testing where 1-6 and 10 now are.

Since v8, both in patch 1:
 - a held entry that fails to compensate is dropped. v8 kept it and
   retried it at every temperature entry, failing that drain and losing
   rest of its batch. With one bad entry injected on hardware, v8 lost
   20 to 45% of samples and v9 only that entry
 - postenable takes the lock by hand instead of mixing guard() and goto

On your question about out-of-range values in the FIFO: none seen from
real data at any oversampling ratio. Checking turned up an s64 overflow in
pressure compensation, fixed on its own:
https://lore.kernel.org/linux-iio/20260928101803.547005-1-zoone.rupert@gmail.com/

Retested on a DPS310 on a BeagleBone Black: six of six buffer enables
produce data, flush race test clean. Built with clang 23 and
CONFIG_WARN_CONTEXT_ANALYSIS, no warnings.

Clang annotation for the mode claim helpers, from Andy's question on v7
9/10, comes as its own series, with at_least for dps310_fill_channels().
Cleanup series after that.

Rupesh Majhi (3):
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()

 drivers/iio/pressure/dps310.c | 410 +++++++++++++++++++++++++++++++++-
 1 file changed, 400 insertions(+), 10 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0

