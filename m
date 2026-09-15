Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036263AA1BF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506915; cv=none; b=ASRaVejnmx2u7ox+SUjarK89hNdEoR6LfBp4a/5ojg++snMigb0bXBhnHLBF0JTVP3YTvSgLZm1PPcGG9VtTDVVtlVZ8Q4VnfbpH4DDcnJbfhAlcZro3iir/6rVO07hWq5j5yL6ylSsfHKc3vi6epijHGduNq03Xg7eaGFnGUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506915; c=relaxed/simple;
	bh=ALhkxPO+fNFOoRpay0MJRDbiqxW9v4c+hhntR24pFbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSa0LIV63Fl3kunVAP7yR3yK12o+p8629nt8KZR348NKC40pRKxyTByXlZz7LbFz0jFM4bQM9BtYatOT9pUihXlwi6DflsMP7kCB0OXjL8lyOiJUiqcK4fhN7QMe7xNZ4MihDkpNf18xWVgEDAY/hcMj4NOwgv1pBLWAULP6ZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXARi+p9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXARi+p9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1389665e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506912; x=1790111712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fh5M+SOXGFOo0fE5dDk6nfH861G3XeTauBS+ExEQBqw=;
        b=RXARi+p9Xb/ZFzb8B0LTJreAiBpb9iQmvRUPxQndqwEjYEYuz65BMRwSlQM/3VGm1j
         BH2mpLeDI4ZRhn5fTuAfg3Z7GWbLB4GRRfrd94QQHwc/yfnCmv5QW70KhZwnlV7+LdAJ
         0k9mf98hafdr6K9ynb1pmxyRWv9tTbQVAuOHtweiD51SNA9h6toqoAISFpS+kdHWHmlo
         A2IGM40CgBEq73fT4y+4Zc2RD+XVRmopbegBgs94dURXTO2dBirAaB2YMsQEopjzErbN
         yEsNDIeiuZ1JL6EzGuaY4cQkD5BIm40OvC4gYvEaijm6Cn295CHETRaYhaKELCTZAV80
         NLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506912; x=1790111712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh5M+SOXGFOo0fE5dDk6nfH861G3XeTauBS+ExEQBqw=;
        b=T3gDoHHnZPt9bo8X6B2Ifj6BkgCxnPH9WR2xZpo6Ohg1ok+AlGjHgFlAa9ov5AtQ2v
         zlhAxsWMU4T9XL/1eov+u+DXvgqX/87TEGvVkPRp9QrruqONegMZRhuw5i8bhlXsVsUS
         3iQgI3YQXJUgWnsjAmk0+iIw4NUUefpzKL/zEEGC8qLxONZcMTJ0mTZOXGCxqm8CA5i6
         QeCe/dwh1724JOf4bi//8CMz2+DULsmcwDihCYQCosnyoDHolwA3yp0Qqr8WK1SdaaG6
         IB0M7KuPbyq7je7YUp0nQ+y9adafYz01ZdMQt1x34CoxV0rRvw6RobAOCbLpze9gqKh4
         neTw==
X-Forwarded-Encrypted: i=1; AKwUvBwH2R83vbOcZACZM1AyeUo2qNWkrMd0ekK5/NEvuO9loYty56EP5EC0ZhLaYA9MNjEblaM3DyeIpQ1JO6s=@vger.kernel.org
X-Gm-Message-State: AFuF++nU7km96U8tSZ8bG0m9nlhjMD5QnkYf5c1KAWCpUhvHsoyjuryE
	wZsUkEvypLpAjJ3uv4x9dIC16ho8ntai11Ry+H0Siv50s5yvEjQfrsBh
X-Gm-Gg: AYBFou1V9q1N274Cq+AHDXQUQfigoOCQT1ibEQOwuLK4e53k5JqwBUkxs8rvdMJE7lH
	UzQ2tIjMd98rlH8KiCqpEBeI7jVvUsE0mY2gLyL8gfMfhfeMaY7YITUL2ZKnoe99+IyiQJpeCIG
	7WhgzGjv8H91x+PFsLQVQ04rIK5nSZhiGSYdv5aFHfAeTRKSMYAwzfQt656WqJw0rU04j5dwpj0
	fCX6a4L8U3fo2dtgZrPtgVCPKB4I94MREFt0iGNT4xLxPftaLI/PqfkVH2DCxTRlwaspiWTPDOl
	CNgV9KnUiDjhCu8usQ48cNJHBe0hKouHnGQyUyhgDx2VNyJl7sdTq5ZRq4gnMAlKcF8MJnfdhu8
	c04B8MXiRZDh0HxbLGWFyBeIQmw9uHSND1K9XogRqoBIQwCWrpDwKnppkllaCS++6rWHS6ugk7/
	0zh5bkOngrZDA2IdOVNUzWaVsJnZILwr6sFhI83s0nplbaddvLqnPRfAbcb3A+pcpZR9EtgA14G
	74jL9WGcgcJfMxHYqrAIKkuyTKFVAArrqqA
X-Received: by 2002:a05:600c:3548:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49e822a8fccmr30161045e9.26.1789506912023;
        Tue, 15 Sep 2026 14:15:12 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:11 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 0/5] kconfig: improve input validation for numeric options
Date: Tue, 15 Sep 2026 22:15:03 +0100
Message-ID: <20260915211508.291790-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves checks for invalid values of 'int' and 'hex' config
options in the Kconfig interpreter.

Tests are added for all new warnings and errors.

Patch 1/5 promotes an existing warning to an error, for attempting to use
a non-numeric option to set a numeric option's value. This warning did not
have a test, but one is added with the promotion to error.

Patch 2/5 adds a check that the constant values for numerics are within
the bounds of the type (64-bit signed integer for 'int', and 64-bit
unsigned integer for 'hex'). This prevents silent failures, for example in
comparisons.

Patch 3/5 adds a check that 'int' and 'hex' options aren't used to set
each other's values. Since the values are naively reused from their
internal string representations, this currently also leads to later silent
failures.

Patch 4/5 rejects out-of-bounds numeric values from the Kconfig
frontends and adds a warning upon reading in an existing .config file
with one of these values. In the future, this warning should be promoted
to an error.

Finally, patch 5/5 fixes an existing issue where checks on 'range' values
for hex options parsed them as signed integers using 'strtoll' instead of
'strtoull'.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- unified formatting of int/hex messages in patch 4 (Nathan)
- added a 5th patch for the hex range issue (Nathan/Sashiko)

Link to v1:
https://lore.kernel.org/all/20260829171902.1510587-1-julianbraha@gmail.com/
---
Julian Braha (5):
  kconfig: promote invalid numeric reference from warning to error
  kconfig: check for out-of-bounds numeric constants
  kconfig: check for hex and int mismatches
  kconfig: prevent out-of-bounds user input for numeric options
  kconfig: use unsigned integers for hex range checks

 scripts/kconfig/confdata.c                    |  6 ++
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/lkc_proto.h                   |  1 +
 scripts/kconfig/menu.c                        | 62 ++++++++++-----
 scripts/kconfig/parser.y                      |  2 +-
 scripts/kconfig/symbol.c                      | 61 +++++++++++---
 scripts/kconfig/tests/err_num_bounds/Kconfig  | 79 +++++++++++++++++++
 .../kconfig/tests/err_num_bounds/__init__.py  | 12 +++
 .../tests/err_num_bounds/expected_stderr      | 10 +++
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++
 .../tests/err_num_mismatch/expected_stderr    |  4 +
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 ++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 16 ++++
 .../kconfig/tests/warn_changed_input/Kconfig  |  5 ++
 .../tests/warn_changed_input/expected_config  |  1 +
 scripts/kconfig/tests/warn_num_bounds/Kconfig | 24 ++++++
 .../kconfig/tests/warn_num_bounds/__init__.py | 25 ++++++
 scripts/kconfig/tests/warn_num_bounds/config  |  7 ++
 .../tests/warn_num_bounds/expected_config     | 11 +++
 .../warn_num_bounds/expected_config_stderr    |  3 +
 .../warn_num_bounds/expected_frontend_config  | 11 +++
 .../warn_num_bounds/expected_frontend_stderr  |  0
 24 files changed, 442 insertions(+), 31 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_bounds/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_config_stderr
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_config
 create mode 100644 scripts/kconfig/tests/warn_num_bounds/expected_frontend_stderr

-- 
2.55.0

