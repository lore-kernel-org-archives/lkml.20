Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A45E38E5E9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695973; cv=none; b=PM67UqipTjs4RDzEqMBDu88AMLgSch6Ht+yS/esy8TKDZzMYHBYspdjewc7edOS74P4Hw1MpOwZhqJcFKVC5xx0KGC538IBeD8SMBTCV6AQ8eOvjGlucs4L9rfsz0QkJTrZqmkTWvyli9C8GzJYJqDB1g7UHwrnMiGdcpwT3fq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695973; c=relaxed/simple;
	bh=rMLJxJ8SnMqxXCZehmabyfHQqXJy/pxVRFCT9DNUloA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LbgDbTqwbx99X7tSL5zmp+mYEzdks2f3cCQmAnIQFrRAVHH67fkp6xhoveEleJQBC3JkQikQlUicGgRVEv6e9oGEOuG/IwkQYr8UySSKYqRopZ7BQafTif+jgeuhRKkwZdP/EjZRtNsd1Xtd+NxyGGADJfiCLPUo3bS+FZYBh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4HV1E+X; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4HV1E+X"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3515f9a5d25so2666105eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695971; x=1792300771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSdaIF5AoFzhQHRDv7nxKIsuYdrkXoDA2W4UfxebrhU=;
        b=L4HV1E+XJS4ytWzUKz1CEEQLOrGpQfdPEDBpK05cGZUouSIzL7PXfNf6HB3DGg1WIn
         eBhE1pjrn/aGcwPSbJENHp+/V2dQvr28LM5GvgAfMPi8MXn4DO2hrvKI3jRRGZ+NtsLj
         rd8qwZE19oFmrCR+mndj4QOg7Aj9b+hgfT9HeM1P/taKxArvHWp7lkyV4obdofgHV/DE
         pSftwaY2IbEGRxabCchR9CuLDkTY65qXc6EPpU2GZrauwEWVvaYO70j2yMRjU4Q1pSuS
         EkyO/JYvY/Wsrw0WKzoIrm8rpRd+Sz2WM3/MG/neGuP4h8kV8/aaFBIlFT/LZwLpaqTk
         ndOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695971; x=1792300771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSdaIF5AoFzhQHRDv7nxKIsuYdrkXoDA2W4UfxebrhU=;
        b=t9MOkRZ9aXNA0oTrhkKNA4z72iN5nzloeBnf8HpPnYWo7Y4/AGQjM5xcC7DGNHw8t8
         Z/ax+kixuw+8Rvpk0YGbwkp3j3eNNfKP06mvo0fz2stf1oNjWNdN3AY3irZxlKDJKcco
         hbN+B2ZNlYbv9oHAn6ATDxnZ33RDbUnMJmTL7oJjlCnsLGKl0LV+q8XA9ffbTH7nbfHJ
         d4nqrEAmmDwmPvBqLVjG5kWE4q/7A9mTlMHycfe44bHInwa60iZpxozgLn/uDo7EQZvB
         fcavpAbSOuDWUHkC1zwXTY64NIzdoRF6Mh8FQpy+9lAI+mPRyDLVwrp8OCPsPGS7mxRt
         hMuA==
X-Forwarded-Encrypted: i=1; AKwUvBwYB6IXHZp+KtlZYxEahJ5xesoKEtRkrtaTuKeP3GFvOTXLGYwgIDHTuc9CQfHBsNDRref6I529SFkuSMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYRTfAdky5DiGVhOW4cewU/EA4trt6hxcvN/FKo2qbWmkP0YJ
	P9ScSO4SL8NDc5c5nw4V59aYtcgNwLJk+rPIWdRK6ztCexAhrlhYtsQ7
X-Gm-Gg: AYBFou0ROYGjFa8nD4Ro/Yurr/ztJtH6DTQo+k3ZMAMsgkCN2XwVdG4/8ga80PJAhVU
	FLXShfShgq0MI9gJNWm2RqSTPNHLNOEStR00bTKUPCf9gExt+tI8GkGYf39zOFCQIlz9o08pwjF
	CXPsNrmQVQ30HOzoziBqn/5ND0kAso8rkOEwb+JptkGKQ76Xkka3TIfD7nAVEKHss/WPN4+C2uD
	W2DiZn0DSSttVWXVt/rkW93L9UxWQDA5oUdjMQ7JYnmlsjMde11/5FX7Du1GCtnjyPp/ffgImZI
	0Z8F7e0BENlPNmJd7MiLMR1rrOF01yBpdFf0Xu8gN41kPGhOloAUMTm4H5KO7Gl22OkfeXIKKN/
	QksbYq5FYsKNKEEji4EYMY8jbvDEUtUGWhppajRy2uUOGeKYavsfrl46BLYQns1JrIEDnTxDLmL
	TCHpe2pOqdye+Nnhet/uohC941knGCq8izdsDVfXb0ODDXk5u/6lDAo9yZnKM6kga2JvThH1E65
	MLIvgw/0uomPSSTKW0I/dTPcnlZMk9VX3xxQ0FexcvIAPMdhO7V2oYcaKKfsb8BeN/gzprGOAMX
	WyDumuMm743cISk7BgwU7gLxhGlKmoDwaYeJeITOBQ2utG4gbtpEG5v4QUsALRPKg+hZsE0wyWO
	Du+qTma68o1POBFDAzNBwhHobS8uuOtuj1xV+GmfRI0/q3FXZh+Z/Wyl2zxwnk50x5Q==
X-Received: by 2002:a05:7300:8806:b0:34e:9147:b862 with SMTP id 5a478bee46e88-3537e073ab1mr11321526eec.34.1791695970793;
        Sat, 10 Oct 2026 22:19:30 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm8502491eec.15.2026.10.10.22.19.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:30 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] iio: magnetometer: fix the register restore on resume in mmc35240 and mmc5633
Date: Sun, 11 Oct 2026 10:49:22 +0530
Message-ID: <20261011051924.60456-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resume callbacks of mmc35240 and mmc5633 call
regcache_sync_region() before they take the regmap out of cache-only
mode. Since v7.3-rc1 regmap refuses a sync in cache-only mode with a
WARN and -EINVAL (86fc3483a4d6 and afc8e3ee8307), so both drivers now
warn on every resume and no longer restore their control registers.

The kernel-doc added by 86fc3483a4d6 says that the caller has to
disable cache-only mode before the sync, so the two patches change the
order in the drivers.

The Fixes tags name the regcache commit, because that is where the
behaviour changed: the drivers have used this order since their resume
callbacks were added, and it worked until v7.2. Please tell me if you
would rather have the driver commits there.

I have no hardware for either chip. The patches were tested in qemu
with the drivers bound to an i2c-stub device and a suspend/resume
cycle through /sys/power/pm_test; the details are in the changelogs.
A scan of drivers/ and sound/ for other resume paths which sync before
leaving cache-only mode in the same function found only these two.

Based on mainline (a5ebb76233b7, v7.3-rc6+); the patches also apply
to next-20261009.

Shashank Mohan Jain (2):
  iio: magnetometer: mmc35240: leave cache-only mode before the cache
    sync
  iio: magnetometer: mmc5633: leave cache-only mode before the cache
    sync

 drivers/iio/magnetometer/mmc35240.c | 3 +--
 drivers/iio/magnetometer/mmc5633.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.43.0

