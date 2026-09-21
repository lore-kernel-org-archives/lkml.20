Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602331A6813
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789950653; cv=none; b=cvrcUwALG4UwxmEjMoa6ZrC7wbU+hIfD21mXwJLZlmGpfXCIva2+QerleA8hcLC/A1qeEcJ49HnxoboRKZpQ9voB3ex+wHRUntuKUUCv8x9KHkU9Qz6YdDZK7ZbqxDsvI0qYKTaZnihUfy7lMoE9oPZoLsAYpYRajWOj+ZTxjl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789950653; c=relaxed/simple;
	bh=4Dgw1zCRHDEtgIGxmbZQtufHRqGIxj+BJYBhqMcRX9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oLXv1ODdTl11tgG1yeVI1xhlnJZS2cxqyI8u0cwndHOOuF51kcvl6wnBAUb0oxh3GwKPh3ND7HONhBZV3wQjJZtL6iFo6ojImNFNDzWz+V0/a3gLVXF92WTu9QiBczgAhDxINEbPz5h8KNxs5Rqsk5+r0rgdknjOrwemBeDrB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0yTzktC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0yTzktC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so14411395e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789950651; x=1790555451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gh1EhGas2z2opfanmdNTY/ZLd4Wr396PDY9OySpgHE=;
        b=d0yTzktCYHQPjvnkO0dKhoRI8wCCbZoLwk9ws9PckvYM+cqXv1sw4pxxBii8JVxC+i
         4Y2F0tTwnK8Cr+bhSXITDBRfrcEh5fhPvMwJUGpvZGcY4KpL/bdt3GyI+1nPF+6l4H7L
         pI0n3/mRnmv2vhix4TbKD0it2rgZBsMPLlOT4OcvH4ovBnXSn88A2bO3z5XkV+9Kmkyk
         fDsZEDGSvOPohBHnZpSzK6QcsONtOhleFMrNRyhwdBW87tkik7DnD7elF9HRAhTW6ZBh
         jkBqadqjFr7X9VhNHLNTAv5MbUXfWwC4dXEqd8gGtu2BJOYrNEwHzgTZT7T9mSrCYLXT
         Fx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789950651; x=1790555451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gh1EhGas2z2opfanmdNTY/ZLd4Wr396PDY9OySpgHE=;
        b=Ja/g/pThdJ2oWo5k8i31yAZvoj/kHIp2ydEmZEoH8H8O8EitmjbCsdb1QP2epNAxYm
         S9XgCmKVmEj2DivniDcBYp9UqfiSYjBPbS7BuenvJRPyOHjxSssPi3yjAx9ewKgdIqh6
         /s0wo7gC/BWoWzNaxM4FyUn/F1I2tT9oHlsYMygNvQAt83Hk/BHITRZ2Tj46N1YLpEZL
         KDP7bzBSCYYqwge/NDYuoWaC80DaKLRgFck31RhDvZapwgZtOlVBaw/uIgcHC8860/NN
         cC5bUXp0PGo240lGjN4CU1zixIb2R/HflaAYFuRt3Cwnr97AbM7UfI1qti8Cf7A8BiSj
         dNMw==
X-Forwarded-Encrypted: i=1; AKwUvBw6lQZX70iY80D+kOd/PW7GGseLdM0yCzje3SYjM2I/htShGpQYYCd+9GTeEWA/edkl1wlxis4KM2Ok7II=@vger.kernel.org
X-Gm-Message-State: AFuF++nEJuIeIDeoDq+gzd1Wpij+3z+BbHNbspAP0te77RGhF4V36hgA
	U5jKtSvr4fR0nCn7GQ9GhlDTh2K7BzvdMNOZhxMD5KiJxcK4VgRjJHWQ
X-Gm-Gg: AYBFou1PwvLsMu4bP/8nut0qjjbRFN6BJf7zeVuCxxGpdcRQvN3Lix2dJEi1BerHrhE
	AuKXAcjUMOmymabkJk1FJfSCuz4pXA1P6ZtdEUSpSKHouY6kbtIAHkTqjdKaIrl19pev2SUQWSq
	ATYx1+CzpBOcAdKb6vziOuBwTEWa404NlZ7YkDFGiD2FQiI675Qdbn8++bvhP3DtYS3jhYbUcRk
	/u/UQEZYxPiAXEovovupcnU1YmvVtTKrqg9jwr4FWC6z8k1aVZLEaTWA5HRFPif5pv7gBO4GJC4
	RsHs7vhnHobOufNZsR3gQZsP++vVIoC7lapCrBVmBJm/1C9/oT3KqxCxnxkw2EPinP1PItbXzRo
	CqnK82jkkJGJmfUF/bJloGVwsr1XQnCs2Xq+NPrXkL6oH1BgYMe5Ht+q3Dr3w4jAGb4aMXRiKWy
	6KTJxfljsc+GUF1NwJIKGsd4oUp5jne8CR3WMWxysWpzs4Hazh+QjVJlnTojgVVTvIvI3H+Ccj0
	99PB6ItNJzTqLg5wWn37PhKlrZAvcZrPCUDDcYK7PzGqKX2QMLQj5Jf70jtR/ALKuBPIpZPzehJ
	5vZfM2lPKNYTwXoOC36356R1Dc6m1FaHJJkTQVNWypyrifmFu40dylT72Ki5q+OaG8znW3JdKmI
	8sA==
X-Received: by 2002:a05:600c:8b8b:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49fc56d170dmr118923645e9.15.1789950650423;
        Sun, 20 Sep 2026 17:30:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a012-6c01-e0c2-ccc1-7acc-3570.310.pool.telefonica.de. [2a02:3100:a012:6c01:e0c2:ccc1:7acc:3570])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724583fffsm17515695f8f.23.2026.09.20.17.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 17:30:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mm/damon: preserve quota state when constructing schemes
Date: Mon, 21 Sep 2026 02:30:45 +0200
Message-Id: <20260921003047.12041-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_new_scheme() initializes the caller's quota in place before copying
it. When damon_commit_ctx() clones the running context for validation,
the quota pointer belongs to a running scheme. Constructing the temporary
scheme therefore clears the running scheme's quota state, even if the
proposed update is later rejected with -EINVAL.

Initialize the new scheme's copy instead, and add KUnit tests for the
constructor and for accepted and rejected context updates.

In a live test with damo, a scheme with a plain 64 KiB size quota and a
60-second reset interval uses its quota, and a full "damo tune" with
unchanged parameters then lets it try another 64 KiB within the same
window. With the fix, sz_tried stays at 64 KiB.

With only patch 2 applied, the two new tests fail on x86-64 and i386.
With the fix, all 43 DAMON KUnit tests pass on both, and the DAMON
selftests show no new failures (QEMU TCG guest; the wss_estimation test
misses its accuracy bounds with and without the fix).

Karl Mehltretter (2):
  mm/damon/core: preserve the caller's quota in damon_new_scheme()
  mm/damon/tests/core-kunit: test preservation of caller quota state

 mm/damon/core.c             |   6 +-
 mm/damon/tests/core-kunit.h | 107 ++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+), 3 deletions(-)


base-commit: 185111f116aabf202d12ce440c0f6e9bae073514
-- 
2.53.0

