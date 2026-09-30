Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CD4F7CBF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788341; cv=none; b=UuIfwqQh/2wIaYYNqDKlB+R+cnPL1ZDvDAmtYlhzx+eV7MZ2JPT2NhAGhRRR5XqUGfp04+vOsOyhT44vUc1wb51HvZJTzq8oFJun9YfAJom0dnkFRgvdNvnqzMJCBuD00hHe2EkwVR/aOYawZlnftuaXOUmqVmAFTzlvqTzgJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788341; c=relaxed/simple;
	bh=dd1I3r3F7lLJezbJ2c0vFVJogVCqoQehOAJ+ZNxAkyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W2/XdaajmwvBzcbLeij8yHcMd0+OF/2X/ODUNJ06Q9u0mFTP7LYP6HgQnzFH1aTCzcBsH6ixMjldF5GtzD3y1PFzsoqRWUP9agpmC5upXKYSx/E4kKNBnxA8P/UDdAJ6+fPy2j90iZ27EUyUHxfB0XrTjZVsyTn93cSEvMM2zaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FesgtJzF; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FesgtJzF"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2455835b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788339; x=1791393139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+X1mw0NxxMT1/FtTHXPunXU5xaJlmPTMYaptRLwyeI=;
        b=FesgtJzF3w0/vb6dYh8UubmdgX1wk+8QPfreIeZ64GCGiweOROQXI/rvOWScEl4GCQ
         dSbObZdMFIs11BOpVrRM6Jd9qX95Mv7tuluoMBHbm2hMiBo+EX3z97Zq2Y7bdCFTHewA
         sW1w0V1G4OFYkhQPgyIyG67vQhLJuZbLbpSLwCAlXFQQ5L7mPzsE2fJaG3aPnX0BsB1G
         ylEGTmVB3uYBOoOS6oszZjB+6+bc0UqyQ0gHyIWIYfABa8hNzP1pFwCJvw/+qC8XTF3S
         aU14QYCJ2T7zLy0h3ryf8C0dTDavpoED4XyD47KZTfPl36hjqHYjnp+/NN61CKDaStam
         bQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788339; x=1791393139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+X1mw0NxxMT1/FtTHXPunXU5xaJlmPTMYaptRLwyeI=;
        b=j/lP77S3FSfmQmc4plZXZxZj8QHdtkoC4ZjPdLGCge6f5VGeQHxT8iU5rwIbWpL712
         /vRBIKQKO39z9dFijz1lkX7kEA9o1WbGQyXDzhrqunAO5ximhYyzg/EdVoknTH8QWE1l
         hl/++UnI19UQ+12l4/caOdE6siJyYHVEnYxZqpYc7RVZdH5ayi8GwOXDGZ/HjRtGISlE
         ud6gWthutUAtXaO1QEmEvhZZ3/3AnB6s8INjd8TIqDoZpeNMeckkgrn2rBE3X78CDjo9
         5FDxAUUTsnBqj1zJD70W7LVcVR+iyF8T6BVkDR58ClP8xHYSwD8xzUqBVjSTG40XDYjZ
         EZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvByW8XD/T6pWgpN2bUKxjDdpoEf0VNAMgP8jmW/dZG7PDc+wXGLE7Mn/BvwECwlWzxaHhP+iO4I7P5lRBNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lujTSKdrvkzBpNxGcbe3yK+KS/lAFnVwsozadEqkXdQ5tyL2sB
	1qeZuFR5mwFRLq4SH8dK2ROowUPggZ90O5s27KQxN4saEQwZvPvBxdrD
X-Gm-Gg: AYBFou39pgIiVJfwiFjjfPdEroJV61fmgoB7xTVYB5ek0rPq8n8MjudhZVobwe0sbpb
	lAsRlUP/GBvuPuEf6ypQmx4agkzhR3EP8836ZChfJ4HMp/Kcsv+ZtlYs4+xA48QTHkC66NY1Q9B
	mJt0X23nrGdm7tW/UEepQUX75d6eJK40qYNNNHyZb5QpnwEEl+a03Aiam/eAmUkDzuNs1pVQsj7
	SzC1hEoCILQQY66PcykUhywTNyrx/ULfcqX7pj/4Q9jfi2vmG/tVFBUQ4acsHhOtmgJz0+mFKkF
	qTjYgjDWCf+v8bv5LSj45NKmdYih5SSfVnjzuF7tpwF/LB0KWXWY4YdeLyetHABiUlKduqMD4iT
	q7NC3SGsl129oLh11yGugwcKtQCYkLg9sRgcFG+nu99rKEOYigc3kVz3DyZ94nLUc/u57Whq920
	DCJ51CuRnVblmlP99oIRXsC7ic7no7NZl8Y87JkrY3JUw2GuDzfBc7kzhi6GWKyF52QFqbxF8wD
	on3bsu/4P92J6IGAFH4noCifuf5bizquxguJDCbLP9F7x8pDg==
X-Received: by 2002:a05:6a00:b92:b0:878:3538:8f7e with SMTP id d2e1a72fcca58-8874b06aa70mr1662616b3a.44.1790788339324;
        Wed, 30 Sep 2026 10:12:19 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:18 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 00/10] iio: adc: ti-ads1015: modernize resource management and bitfield logic
Date: Wed, 30 Sep 2026 22:41:54 +0530
Message-Id: <20260930171204.12863-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the ti-ads1015 driver by updating its runtime PM
handling, error handling, resource management, and register bitfield
operations.

This series builds on top of Stepan Ionichev's devm error path fix [1] and:
- Replaces SET_RUNTIME_PM_OPS() with DEFINE_RUNTIME_DEV_PM_OPS().
- Sorts the driver headers alphabetically.
- Returns -ENODATA when match data is missing.
- Uses a local device pointer in probe.
- Converts suitable error paths to dev_err_probe().
- Drops unneeded '< 0' error checks for functions returning 0 or error.
- Converts mutex initialization to devm_mutex_init().
- Transitions runtime PM setup to devm_pm_runtime_set_active_enabled().
- Inlines the redundant ads1015_set_conv_mode() helper.
- Replaces custom shift macros with FIELD_PREP()/FIELD_GET().

[1] https://lore.kernel.org/all/20260529183708.17819-1-sozdayvek@gmail.com/

---
v5:
- Reordered patches: inlined ads1015_set_conv_mode() before applying
  FIELD_PREP() to completely eliminate code churn.
- Extracted FIELD_PREP() evaluations into local variables for
  regmap_update_bits() calls to ensure clean line lengths and readability.
- Added a patch to return -ENODATA when i2c_get_match_data() fails, as
  requested by Andy Shevchenko.
- Split devm_mutex_init() into its own patch to decouple it from the
  runtime PM modernization, as requested by Andy Shevchenko.

v4: https://lore.kernel.org/linux-iio/20260827172100.39176-1-architanant5@gmail.com/

Archit Anant (10):
  iio: adc: ti-ads1015: use DEFINE_RUNTIME_DEV_PM_OPS()
  iio: adc: ti-ads1015: sort headers alphabetically
  iio: adc: ti-ads1015: return -ENODATA when match data is missing
  iio: adc: ti-ads1015: use local device pointer in probe
  iio: adc: ti-ads1015: use dev_err_probe() for error handling
  iio: adc: ti-ads1015: drop unneeded < 0 error checks
  iio: adc: ti-ads1015: use devm_mutex_init()
  iio: adc: ti-ads1015: use managed runtime PM setup
  iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
  iio: adc: ti-ads1015: replace custom shift macros with FIELD_PREP/GET

 drivers/iio/adc/ti-ads1015.c | 160 +++++++++++++++++------------------
 1 file changed, 76 insertions(+), 84 deletions(-)

-- 
2.39.5

