Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16F48FF91
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588170; cv=none; b=KIPLqeuym+1KyoyNhBzdPZdjsJohpBLK4FieppqW5pG/uyWaqa+6Apsm/qd1YrS3QzJiLCJwReyQuqMZcckK4wnaiIvGMBK0JrMrhZKw2P4VPMk8T4iFlvrqLpVHhaxXk4L/4TFmatmWYGeqUPCd74dCN4GapJjxuxejpmE6K3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588170; c=relaxed/simple;
	bh=dyX53h+MD91U6otu1jivRLL6lUE7wIcAePwaKEPECnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBbnvw8G55TZh3lsXX/iZHXi0ZisIWUdjuNRyGv3S+9EEM9GABHp/6R+jjsAWanekBhEEQgRygWDl01mhT5HH9uuo7E3OCmmJDhjOUjKqVtD46Ig5fFEKN1L9T5RoEniiH++I4UoBnzqL+U1sbiROmPLaRTO3PVDDj/s1X6ohwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZRHkvlG; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZRHkvlG"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec308beso650676eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588167; x=1791192967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttEfPmYvo6xKPvKtGCdWP3FDzL/tf8jFsALyatGp42Y=;
        b=ZZRHkvlGMamnoccZKXQXHq27m0op1COpOzaAvbGPmPhUq1ZvjRHXlocFvCeJubYmGq
         7UK7Uzg5CNdJiiBgTItJlpxE2+tsmw5+9XtQnD8QPO04TNTGatt/hvX96a4IQU45Xeoa
         blVb368q+EgGG6LykFK4KFy1v9CKq9G37ETiFZsEqN9GJpzLSL9Wshtu+RIjMA+aixir
         IsjaTehbWTstMmBHUSUlSXcMulE39LFDzCVJrtTl0dYpv0A1+c7fubopCntJrP4JSBZp
         5LR3ZXYbn1D0w6qbjboFCNlbHTd28cUHRwgsVgff5qsHan0+M0GPtpoKnB5wg+mCC8sz
         bHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588167; x=1791192967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttEfPmYvo6xKPvKtGCdWP3FDzL/tf8jFsALyatGp42Y=;
        b=ipvWb9RrAzTTKKJogUuSks8opdSKPZ3+HZOueMCcwGHo7iAPMWARs2Xw6vPTKHzZf+
         OjZdyvywfHgbQjniO3271F8pG7LsUXGM5UbTpijlKmcUTcOTJPrVtVVn14TW/HQSiVgp
         CJvJQWXVuuhSqEDW2mYbRJ+WtRCjrUv+47x5fLSoDLvr129STdu37QzNxsnUsazbF7/z
         ZgeCTT7zl/lQRuNRDP+EsSoPiPRZwO1olz2QhqHmS3IakeW93jk9J7CIQeLO4qv5DyxU
         D+lesvwb/xL1+6r3Egs9n7GuyQTzUuJHxCn2d4BOW8guy0GRENo0MCasTQWeQFV1lrbE
         WQGg==
X-Forwarded-Encrypted: i=1; AKwUvByhcjQ42tNOggir0pK8Qe4nvsDxXSbJMRYlESmf0K3Rd5anMf5Oh32vtXDUEh11vTAEPKZSQwp8Tv4k2DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpa613MBlr1/Sv6A9guHPnPMA/WyEIIV1wVROC9WOOvorNg/C+
	WVxkjYw1ZR/GD/3nKKeGWtIdcCj6sfvO1zGz+G7fJWeu9ZJJdpt8+hhn
X-Gm-Gg: AYBFou1qauYSjnGO16QxU0yA4VgLymkTjgss9C/xFzHQS3Dq6BBed1UCprN51EjDr0p
	eFN4A8f5KRi3t+aCiaBZSTmmD9G80LXcRTZbR7i++FFlehprlUnDb72qYGUK7szN+zdhKukilpq
	uOGpmIhmKE6T7XxKXtFK0wn6aKCUlwbkA8rZ1X3Nf+6NcFuvoMt9ddtAecoGlfU3bmkcKTwXxu8
	nZLzJPN15Xn8/ahOuoLaAOGcuDruC/defGSQC9qj+P3uunGwhgLlezikaDA6JcjWLc9JSd2rzdz
	8NCOfsFAtMjPW71DQ6Pz2YvoMQFSW/rQCIWEGM0e+laPqAr9OdJfQzs+GjieG+dXtcoZ+3pciyp
	EwdrReLC5whZM/wzzcW5ebhdiF0GepoHi/vjMnOORUvPas2S99xDbD9SgO/LxfWplVMD76ktDaC
	IFnocEWXJ5onKaDIQzXiub+vaEQpTFPlgAVKWiNii5UBCfpIwcpgBhBVAEseItGqi5srXn4fdsT
	nUu2SswFOdojHFFsy106CYrXMhymcRBpZEPrfHLuY0f8p8Lcfvx32M+8191V6xJQvF47kdXGT2b
	RLyEK/FT2VqPKR9dqNSE1yS6HZMBczx7N+DnOExostfg1RQCNZ/10B+brmWFeyB2g9yJj498Jw=
	=
X-Received: by 2002:a05:7301:1125:b0:341:2f5b:423f with SMTP id 5a478bee46e88-342e35e427fmr8968618eec.29.1790588167299;
        Mon, 28 Sep 2026 02:36:07 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm19014358eec.14.2026.09.28.02.36.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 02:36:06 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] time/jiffies: Fix usecs_to_jiffies() saturation and jiffies_to_clock_t() rounding
Date: Mon, 28 Sep 2026 15:05:58 +0530
Message-ID: <20260928093601.79224-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two conversion helpers give wrong results for some HZ values:

1) usecs_to_jiffies() compares its input with jiffies_to_usecs(
   MAX_JIFFY_OFFSET), which is truncated to 32 bits. With HZ=300 every
   timeout from about 23.9 to 71.6 minutes becomes MAX_JIFFY_OFFSET
   (infinite); with HZ=100/250/1000 the top few thousand u32 values do.
   No u32 number of microseconds can reach MAX_JIFFY_OFFSET, so the
   check is dropped (and a u32 wrap it was masking is fixed). As a side
   effect, usecs_to_jiffies(<constant>) now folds to a constant when HZ
   does not divide USEC_PER_SEC, instead of calling jiffies_to_usecs().

2) jiffies_to_clock_t() and jiffies_64_to_clock_t() use the rounded
   TICK_NSEC when HZ does not divide NSEC_PER_SEC, so with HZ=300
   jiffies_to_clock_t(300) is 99 and values written in USER_HZ do not
   read back (bridge forward_delay reads 1499, neigh locktime reads 99).
   They now use the nominal HZ ratio, like clock_t_to_jiffies(). This
   also fixes the conversion on alpha (USER_HZ=1024) for large values.

Patch 3 adds HZ-independent KUnit tests for both to
kernel/time/time_test.c.

Testing:
- KUnit, filter "time_test_cases.*jiffies*", on master plus patch 3
  and on the whole series: UML x86_64 (HZ=100), and qemu x86_64 and
  i386 (TCG) with CONFIG_HZ_300=y. Without the fixes the usecs test
  fails on all three and the clock_t test fails on both HZ=300 runs;
  with them both tests pass everywhere. On UML x86_64 with HZ/USER_HZ
  temporarily edited, the series passes at 24/100, 1024/100, 1200/100,
  32/1024, 1024/1024 and 1200/1024, and master plus patch 3 fails both
  tests at 1200/100 and 1024/1024.
- A userspace harness that extracts the conversion code verbatim from
  the tree, both master and this series, and builds it with the
  generated timeconst.h for every Kconfig HZ value (24, 32, 48, 64,
  100, 128, 200, 250, 256, 300, 500, 1000, 1024 and 1200), USER_HZ 100
  and 1024, 32- and 64-bit. On master it shows both problems. With the
  series, usecs_to_jiffies() over all 2^32 inputs never saturates, is
  never below the exact rounded-up value and is at most one jiffy above
  it (only where HZ does not divide USEC_PER_SEC, as before).
  jiffies_to_clock_t() and jiffies_64_to_clock_t() equal
  floor(x * USER_HZ / HZ) for every x below 5e7 and invert
  clock_t_to_jiffies() for every clock_t value below 2e7 that is a
  whole number of jiffies. An earlier harness, with the fixed
  expressions retyped rather than extracted, also checked
  jiffies_to_clock_t() for every x below 4e8 with USER_HZ=100.
- An x86_64 defconfig kernel with HZ=300 and CONFIG_BRIDGE=y booted in
  qemu, with a small init that creates a bridge and reads the values
  back. On master: forward_delay 1499, hello_time 199, max_age 1999,
  ageing_time 29999, ipv4 neigh retrans_time/anycast_delay/locktime 99,
  proxy_delay 79, ipv6 neigh anycast_delay 99, and writing 1500 to
  forward_delay and then writing back what was read gives 1499, 1498,
  1497; writing 100 to ipv4 locktime reads back 99. With the series:
  1500, 200, 2000, 30000, 100, 80, 100, 1500 each time, and 100. ipv6
  neigh retrans_time reads 300 on both, as expected (raw jiffies).
- W=1 builds of kernel/time/{time,time_test,jiffies,timer}.o,
  net/bridge/{br_sysfs_br,br_netlink}.o and net/core/neighbour.o for
  x86_64 and i386 defconfig at HZ=300 and HZ=1000: no warnings before
  or after, and no libgcc 64-bit division helpers in time.o on i386.
- checkpatch --strict: clean once the Signed-off-by is added (checked
  with one appended).

Not tested: real hardware, and architectures other than x86 (alpha's
USER_HZ=1024 only through the edited UML builds and the harness).

jiffies_to_msecs() on 32-bit also rounds exact values up by one for
HZ=300 (jiffies_to_msecs(3) == 11); that is left for a separate patch.
The series does not overlap with "time/jiffies: Saturate in mult_hz()
instead of wrapping", which is also under review and touches
kernel/time/jiffies.c.

This series was prepared with Claude Code (Anthropic), model Claude
Opus 5.5 (claude-opus-5-5), which found the bugs with the harness above
and a Lean 4 model of the arithmetic, and wrote the patches and tests.
A separate Claude Code session reviewed the series independently, and
the changelogs and tests were revised after that review.

Shashank Mohan Jain (3):
  time/jiffies: Don't saturate usecs_to_jiffies() on a truncated limit
  time/jiffies: Use the exact HZ ratio in jiffies_to_clock_t()
  time/kunit: Add tests for usecs_to_jiffies() and jiffies_to_clock_t()

 include/linux/jiffies.h | 22 +++++-------
 kernel/time/time.c      | 24 +++++++------
 kernel/time/time_test.c | 79 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 24 deletions(-)

-- 
2.43.0

