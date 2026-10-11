Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C035DA42
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746040; cv=none; b=V0x8CjWtuPMmpMJqK2O1EM/ypKiQyNO6BvIPLu77aMHrTrszI8foVmLWRcc/E9FcbPOqBsYUlmIMCGnnIZjrCyz3nek95J8yS6ttTro+8IV/E+LbS2n4ghmBnyOQcPZzQ3Cwp4Oyr/LUZdjsH/ip+6DGZRzRUsSBl/L0LVcV5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746040; c=relaxed/simple;
	bh=u3GA36Yn1in3410a7NikaX25shwYKZA4aFjbSlUMpqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HmDoc8Mmwt/bGrfkiifYGKt74YHnVReL7s422CiKu11huClXE0l2ahmhJlNGO2LXepLAf1qNUwTKHTyXg80mg6HyRptRSIOdqU+KOb400wZ16GQECjeX/zf34EvML5Z4giFyylODUDB/A99yneK5pR7oQO2W1cx/5NyA04yjo1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9wgXTvl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9wgXTvl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so581871566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746037; x=1792350837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOSwhisIw431b/tMlifKmUueFNOwFyz7VxO+xdRddRQ=;
        b=g9wgXTvlJrwHZ6ip+Bo3mYZe6hBo8hEh5TeiULdJGkoq4kdTN49kagbfTRj5GGpyEa
         Yopgt0Bl7qr3mb8FjDRyvnO3cAHflAsSie9J/Cr/EHZstCMwRshMPSaTE5tIvNgnfpQu
         e9Rfr0E0q5HlKyYR6Qi7ap77tfBAJ/4MB1C8HJyQiP/K0kUy+IvM4hPlxsVY7KcOXfsN
         PFsxtnKLcY2HYhYSc8Vqf0jlZQUKxx7mCsknhPdG1g552VQOIFVCsCdIflQzBhXmfmFG
         r/Khx11fG5Y32t2OEvso1yh34Gy7aVp+aQ4cNZmGFhu7+/VkoCrXRKGVvlodAoCETM7G
         4lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746037; x=1792350837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOSwhisIw431b/tMlifKmUueFNOwFyz7VxO+xdRddRQ=;
        b=vHxJhHWGYZfurkUL7+hg4Rduj2jPu476z1IYGkg2QKi8DIcMVM9axvdMISkKpDVRo+
         /DbGwKk2OZEVCPovjBNjwBiFERSb6bDO2Bf5Of+7jyrrlD1ZPkw05VhpZR0qbw2wihn4
         DnybgfCNNcXWeCOoe8n8JZdpM2hzYvGJ8BQP8bAL8Ck5ff52WQahjKD2PsRYHH3uN8Zd
         ihV2d8ETFjIgbWVzZK9zC+2Aw9RtU95PrhZTUPktm6SDllJQryssvy6fuk6qo/LN+E6i
         yIfLn07KLkiLcGckkAZ/AGO6wzvf3ixGeP2SU3jYUuJK7JTeAvBz+JS/n7AkRXAULAy+
         xqLA==
X-Forwarded-Encrypted: i=1; AKwUvBybwmdCSZtXrjymmKWR6I7Dxznzq1GylebG6i5Sch6J6h+vMX82UXsQFdVTeg7Oe1s9Npi0bdIZ4G1js8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhjCY04+bTa3L+pTiHC9K39VdTN/0ywZLLs0Uur9XwOLnMk7me
	3ftMl3a4SKf5R7jNsUQ/3y0RlaP9nX5VunVYlZX8hazub4CCLW9PCIAu
X-Gm-Gg: AYBFou0YIFCOlsPYRwjInUe+1bprSJ86u25EpYvdBsUbZTBg+dGAlpw2BS++bPG/ryx
	6As8GBClrfwgb667S10m3diesFh2oL6NQyX1mHcJ4AA/w+EobXbnd4kS3BTD7I6rzePjiSD4Dyd
	e4uwKWD/NghlyWkpFQH04Wn9b0lQvKzvQJLwKpZHqUODoddzxeRwCjY9TB1t/vefpOrFNtOgiYm
	O9CfT4csKMtqD3YmdAtwpKAAinsSV0bxrKU+rCCR0qElroAe5SVL7x9ny1xwGKVPWADyIJZNa7u
	NiNYrLj7KF3W3jO8QxEIJcSShQ8e12fV6LE5QFhr1s2VolVrgRsDjtEZn8P+j10522PLnaQXOmn
	Wc1127wD15SFD4zBsYEHVLEy/NwTxAqBqUhgY253A+W7wSBAfvdXuLGZVUSKp6TLNkvCHbl+A13
	bgdTCXZB8dOvttweYjYS55DBf0GBtXPk4OM6Jri02UoJajkcAeAdn4xLeFIjXRIPa0ZKuQQxN+m
	1S9svBUEOWHmXPFYy3hTxNwTe8M+D3FJxK8ygZl
X-Received: by 2002:a17:907:c386:b0:c2e:2275:1168 with SMTP id a640c23a62f3a-c31a70675b3mr740184466b.19.1791746037400;
        Sun, 11 Oct 2026 12:13:57 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:13:56 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 0/6] alpha: improve Tsunami machine check reporting
Date: Sun, 11 Oct 2026 21:12:47 +0200
Message-ID: <20261011191344.981000-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Tsunami/Typhoon system-error diagnostics and Clipper
ES40 environmental reporting. It applies to v7.3-rc1 on the Alpha for-next
branch at 33465f6ab697.

Thanks to Matt Turner for reviewing v5, building each patch for GENERIC
and SHARK with W=1, building its tip for DP264 and EIGER, and booting
GENERIC on QEMU Clipper with two CPUs. His Reviewed-by tags are carried
on patches 1 and 2; patch 1 also incorporates his build-ordering nit.

Changes since v5:
- Add bounded raw dumps for rejected EV6/system/environmental frames.
  Round down to whole quadwords and cap fallback dumps at 1 KiB.
- Clarify that ES40 documents the short EV6 frame; the corresponding
  Titan/Nautilus firmware behavior has not been verified.
- Move the non-generic Tsunami err_ev6.o dependency to patch 4.
- Correct the obsolete PERROR bit-9 RTO definitions: HRM rev. 4.0,
  Table 10-42 specifies reserved MBZ/RAZ, so the 0xdff mask is retained.
- Drop the ES40-specific system reason-code restriction, retain structural
  bounds checks, and restore CPU register/PC output for system errors.
- Remove inactive expected-probe handling and its changelog claims.
- Report valid environmental notifications with no recognized fault bits,
  including their status context; remove "Set =" from door messages.
- Keep PCI initialization in sys_dp264.c and error registration in the
  error file. Restrict console-log scanning to Clipper pending testing
  on older Tsunami firmware.
- Put UECC/PERR panic policy in patch 6 with its HRM rationale. Only
  system-error vectors can trigger it, not incidental live PERROR bits
  during CPU or environmental notifications.

PERRMASK remains as configured by firmware. Inverted SMIR halt/reset
bits remain undecoded. Console environmental records remain raw because
ES40 Table D-18 has conflicting offsets. Restricting console-log scanning
avoids extending it to untested boards; it does not validate arbitrary
firmware pointers or establish nonempty-log coverage on Clipper.

Testing:
- Native ASan/UBSan tests exercise the actual EV6/Tsunami handlers and
  console helpers, including malformed/short frames, raw-dump bounds,
  unfamiliar reason codes, separate live snapshots, register reporting,
  fault-free environmental notifications and system-only fatal policy.
- W=1 vmlinux builds passed for minimal GENERIC, SHARK, DP264 and EIGER
  configurations using GCC 15.0.1. The existing saved_config COMMON-symbol
  modpost warning remains; no compiler warnings in the final build logs.
- git am on the stated base reproduces the final source tree.
  git diff --check passes; checkpatch reports no errors.

V6 was boot-tested on my AlphaServer ES40 using my ES40 configuration,
with GENERIC_ENTRY enabled. Unplugging and reconnecting a PSU power cable
produced three correctable environmental notifications (code 206). PSU 1
was first reported enabled but failed, then its enabled indication was
absent. After reconnection, its enabled indication returned and its
individual failure indication cleared. No oops or panic appeared in the
available log during this test.

SMIR bit 0 remained set in all three reports, so this test does not
exercise notification reporting with all recognized fault bits clear.
That path, malformed-frame raw dumps, system-error register reporting and
the UECC/PERR panic policy remain covered by synthetic tests only. V6
hatch testing and nonempty firmware console-log testing remain outstanding.
PALcode clearing behavior, inverted halt/reset polarity and corresponding
firmware layouts on other boards remain unverified.

Earlier v4 testing used PSU power-cable changes, opened hatches and a
CALLSYS-based software trigger with modified handling. Matt's build and
QEMU results above apply to v5.

Magnus Lindholm (6):
  alpha: move Tsunami machine check handling to err_tsunami.c
  alpha: describe the Tsunami system machine check frame
  alpha: bound EV6 logout decoding by the processor area
  alpha: decode and acknowledge Tsunami system machine checks
  alpha: decode Clipper environmental events and retain console logs
  alpha: stop on fatal Tsunami system ECC and write parity errors

 arch/alpha/include/asm/core_tsunami.h |   8 +-
 arch/alpha/include/asm/err_common.h   |   2 +
 arch/alpha/kernel/Makefile            |   4 +-
 arch/alpha/kernel/core_tsunami.c      |  34 --
 arch/alpha/kernel/err_common.c        |  13 +
 arch/alpha/kernel/err_ev6.c           |  38 +-
 arch/alpha/kernel/err_impl.h          |   1 +
 arch/alpha/kernel/err_tsunami.c       | 592 ++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |   2 +
 arch/alpha/kernel/sys_dp264.c         |   5 +-
 10 files changed, 651 insertions(+), 48 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

