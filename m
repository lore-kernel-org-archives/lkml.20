Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2E4968EF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926167; cv=none; b=h7qRfZsZQTcCOOB5HNaSJgAxFU7jGkZBCpoGYxoOURgNG2hvs4N6pO/4VJPDcosUEYjd6oB91cP1F/uhkUQ+CPresKHXDNj4VEpD7seBdlA59R9tJvg711NdQYKqm2BVi6ZaVOeSpQaDE7o/rFsPDqRfd+rzm01kNoAFy6tFJBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926167; c=relaxed/simple;
	bh=4AN0iY5ozNGFZiexnrYN6yICHblyYBOHOqpHsEeC7GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5cX5U8LQYLTbkssPecGQRENBPlCsiO+5izOpuvCrKmEhW5/cox+FaImFr7JKtuAx16yKL7cZ/8aRAlMss+2itoQsXVjDHmsB2vF3vU8/3Je6yU4/VP7+3uS73osJFmb42ixt+hjuCUUx1tLqj0PNJUYgLnF8hpVnNb2oz+B6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJe20qCV; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJe20qCV"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20ce3c118aso473108366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926158; x=1792530958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2WmBZgorXHjNeqY2icnkka4pWJlaaYl5IWxZIXGwQY=;
        b=HJe20qCVo+twiDUelcjo2jyH1TuY2Szy/fN015zouwmlvm63a9kvQ6JmvFHgjOSSqN
         Cd5zWx5FEvNJyJikbrNJS1wlLX6JfAUTajZ3+BKFwHLVMN5WJGA0SU+5OowK2OiyfPLJ
         OKMhMjEI87OsmIcBRXDYV5Ubwcq532Sv+hMRuxelHtT7IzzsY3L8hWJA4l8fbdIKvZ7B
         bBT6S4iBI4PPxvwic+A0+t6eYu9UxIZj4yzfO6vhnEttLQE6HqI9S9fxM81QENjhAgah
         3OuXmjROYYt+On3LQ8Fizdm1rhEhkfQw9Q2nOx0PPoEJgzUU/bThOj+64X5cPwXxoFPQ
         btgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926158; x=1792530958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2WmBZgorXHjNeqY2icnkka4pWJlaaYl5IWxZIXGwQY=;
        b=fu9E+Wls6gkBNtgvtTg57aZPwkU4nD59tXVP/NqE+3R2cdh2Q3om7QCf6GdJNOHK6O
         0fymlmATeuDHkXPSohFCx8lmUKiYrcSWpN7WSx+IhIopd6VgXm3HMG5I3UdGfiqEDsON
         vVLAMUUXha15d8ADupxQg8rvinm4935CZDAci53p0ISnMPsWr2FHPWIISM6acSX/8iUn
         FiqG8vJG/99xt627ySK5DkLFUlQ1a1F1x4hqvfytckxKuxOKfHhPuW27lOR7XHLkO93q
         vz9rBzfSPYORnQdg6gRP6APPfSD6IgX1RgnGf/hEiTrY5HHd7PHTvavIhvq1+MhsitMY
         hPMg==
X-Forwarded-Encrypted: i=1; AKwUvBxE5UyEgPSYAFLAx9BbS7v8yL9cinp1Qeyc+q6tMrYTs1Yzv4L6n0YgOkPfQCWtevq3fuNBnJlA94uD+zo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcMDN1MKhmZ+JtSgDSRTHA1d5I7FjRUxmF6YHEEqgU8eVjMJpJ
	tuO/C8rMv0M7GecUMw3mdIWmtg1bIEfg24zUkrJFUxUO0TKfJ7WIb9bQ
X-Gm-Gg: AYBFou3WUBBPNaCm1qchN5skEsNGhR1UX2iBlZH+2HjUo/v30CDLsRYouC7YPN/ZbIP
	PEDsJ9i9CyR9+vSf1DZjwfiVY/YpgSlpRm/v8Sq5WPvud/4GerovCL3M/cXgi3b7F8VG0x2VuYS
	fgwZ52cHs5kxBpQhImy0VZ8wRFauNUHpXDl/KP7CcmpcegzjavU0EHRONv71qudYSG2129NgKdM
	om+5o9lNxVXqwTeto5DM7VrlVpa1Eiehaf0DDSkF3CyO+bFSz24SqCqvQLQYIyzPwzPernneuT7
	nks7uQpHW0P2x3VbEZJNjhHuN4lFXttQVO8CkyOSZw5oKAa1IgJ0Bz9uj1422EPHMnQXHmVXu71
	LZ+BZHNJnsWbazRbf02k0nsF+QCzhGvGW69wqPZvspDMU/rTb7Ql8h1bqpwN3hZakFi5wn7wSPt
	tV8IpjzbTwWdeC8QTB83SJW0sDSYTUszYTmM60WoTtdA+wvyq9jjlUFy2xc+lqGWtjGSnQn13WL
	f4z9nGvYRElxUgRpc6OLmDpvFQwHC+gFpmLdIZK
X-Received: by 2002:a17:906:6206:b0:c25:f7dc:2d9 with SMTP id a640c23a62f3a-c31a70cc77emr1309169866b.26.1791926157983;
        Tue, 13 Oct 2026 14:15:57 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:15:56 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 0/5] alpha: improve Tsunami machine check reporting
Date: Tue, 13 Oct 2026 23:15:33 +0200
Message-ID: <20261013211551.991723-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Tsunami/Typhoon system-error diagnostics and Clipper
ES40 environmental reporting. It applies to v7.3-rc1 on Alpha for-next
at 33465f6ab697.

Thanks to Matt Turner for the v6 review. His Reviewed-by tags are carried
on patches 1 and 2 from v5 and patch 3 from v6. Patches 1-3 have no code
changes since v6.

Changes since v6:
- Drop v6 patch 6, "alpha: stop on fatal Tsunami system ECC and write
  parity errors", as agreed with Matt. The panic policy will be handled
  separately; v7 focuses on reporting and acknowledgment improvements
  without adding a new panic path.
- Remove the duplicate irq_regs.h include and the trailing blank line.
- Gate full register dumps for correctable system errors on verbose
  machine-check reporting; retain their error decode and always show
  registers for uncorrectable system errors.
- Document that PERRMASK gates new PERROR latching (HRM 10.2.5.7), and
  that the ECC field selection does not establish mixed-error ordering.
- Retain conservative SERR transaction suppression: HRM 8.8.2.6 leaves
  address/command undefined whenever SERR is set, with no stated exception
  for combined errors. This differs from the suggested SERR-only check.
- Remove the redundant environmental silent pass and always-true condition.
- Treat SMIR bit 0 as raw context, using fault mask 0x14. It stayed set
  after PSU reconnection on the ES40, so do not label it a current failure.
- Print the recorded CPU ID for processor console subpackets.
- Bound Clipper console-log traversal by the HWRPB byte count. Preserve
  the firmware pointer on unknown or truncated records and dump at most
  1 KiB of raw data. Acknowledge only after a complete termination packet;
  no class-5/type-4 layout is assumed.

Deferring panic policy preserves the existing continuation behavior; it
is not a claim that continuing is safe after an uncorrectable error.
Acknowledging a latch does not repair corrupted data. A follow-up needs
to consider CPU-detected ECC, Pchip UECC, RDPE/PERR, previously latched
errors, firmware masks and the impact of a device asserting PERR#.
In particular, HRM 8.8.2.3 says erroneous PIO read data is returned as
received; it does not establish an automatic CPU 670 for that case.

PERRMASK is left as firmware configured it. A zero mask bit prevents new
latching but does not establish that previously latched status is cleared.
SMIR polarity/latching, inverted halt/reset bits, other-board firmware
layouts and successful nonempty console-log decoding remain unverified.
Console-log scanning remains restricted to Clipper; ambiguous console
environmental records remain raw.

Testing:
- Native ASan/UBSan tests pass with CONFIG_VERBOSE_MCHECK enabled and
  disabled, including runtime verbosity selection, SERR with other bits,
  mixed ECC/PCI decoding, processor subpacket CPU IDs and the new SMIR mask.
- The observed v6 PSU state sequence was replayed synthetically: individual
  failure reports remain visible and the final state reports no recognized
  fault bits while preserving raw SMIR=1. This is not a v7 hardware test.
- V7 tip vmlinux builds pass with W=1 and GCC 15.0.1 for GENERIC,
  DP264, SHARK and EIGER using minimal configurations. No warnings in
  touched files; logs contain unrelated kernel-doc warnings and the
  saved_config COMMON-symbol modpost warning. These are not per-patch
  or ES40 deployment builds.

V6 was boot-tested on my ES40 with GENERIC_ENTRY enabled. Unplugging and
reconnecting PSU AC power produced code 206 notifications: PSU 1's
individual failure indication cleared and its enabled indication returned,
while SMIR bit 0 remained set in all three reports.

V7 was built and boot-tested on my AlphaServer ES40. Basic CPU, memory
and file I/O checks passed with no new kernel messages or kernel taint.

Matt built all six v6 patches for GENERIC, DP264, SHARK and EIGER with
W=1 and GCC 16.2.0 (24 builds), with no warnings in touched files, and
booted its GENERIC tip on QEMU Clipper to root mounting. These results
apply to v6; they do not establish machine-check or manual-layout coverage.

Magnus Lindholm (5):
  alpha: move Tsunami machine check handling to err_tsunami.c
  alpha: describe the Tsunami system machine check frame
  alpha: bound EV6 logout decoding by the processor area
  alpha: decode and acknowledge Tsunami system machine checks
  alpha: decode Clipper environmental events and retain console logs

 arch/alpha/include/asm/core_tsunami.h |   8 +-
 arch/alpha/include/asm/err_common.h   |   2 +
 arch/alpha/kernel/Makefile            |   4 +-
 arch/alpha/kernel/core_tsunami.c      |  34 --
 arch/alpha/kernel/err_common.c        |  13 +
 arch/alpha/kernel/err_ev6.c           |  38 +-
 arch/alpha/kernel/err_impl.h          |   1 +
 arch/alpha/kernel/err_tsunami.c       | 724 ++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |   3 +
 arch/alpha/kernel/sys_dp264.c         |   5 +-
 10 files changed, 784 insertions(+), 48 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

