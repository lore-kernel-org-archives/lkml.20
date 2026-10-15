Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74536480DC4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059850; cv=none; b=Ix1zpo5gHZuXUt14o35quv5C8omYc+sHFy72Kn5mymnJgFGfzrSoFOGXUvzZr4U4sEaD/sOoZI3ijIkqXv5CmfalL4tdOWYYIgafJMdJCvPhpxBOASTO1hvnEMjw9T6iD1WS1dN097Y8F9FmMWDbaelkmzyOewcefAfuezzIjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059850; c=relaxed/simple;
	bh=3khgOKeKmUoaWgJJenmKWRfZDfiGPSQWgn335B2SDxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnFa0NnYMxEN3UcdoAC/EtKsLoQ7s7dBgnmIWZMpK5zANkCHbUCjfxHSMVPsnoM2JGGwjPHtpdmgMFIk0mLZH49zZEm8+511CpEs5YiCQ57SRM0a2NlJ324dYXsfIirm//iHqjDEC+J5pMN/QZOjVtQl5ey8DJVwCeH8TKmHRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBbHR223; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBbHR223"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so2729596a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059847; x=1792664647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xmi74G8HFRQCFdS34OpGVxUvdaPm2FB3DuHQsxBpLfo=;
        b=dBbHR223HjTkwxDvWIIeTLfGXjMG2NafqiQM14vfBn/sKO980ZxZk38r0Bz6nm6dIV
         pZuTFAx7ObZ01yhWlxYD0OeCOmzMYAfXJtw6QlV4TY42fORv52ajwwDROoCvvklK/hP7
         gEu/xFSXcY2Meom96JAmnoLitxunV0Yn4Z/Jp8uUJJassqjlw+4e2Z3mwkmtaUDT2f3q
         gfvOHr3LWhO52wo8z/G/IwVoD2rhclNNkyXhFpptYNnWwkoTqo0lA8iAG4x9QNVFDt5p
         TrfXHy13A3tWUt7Ky3O6XNi+zvnHsFIMXejwe/+X3/o17hoehVr/IlfY1zG4iaofIpJJ
         ylEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059847; x=1792664647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xmi74G8HFRQCFdS34OpGVxUvdaPm2FB3DuHQsxBpLfo=;
        b=XqJB78IPnoD7RkNv0OpoZpKisnZIg/CYaP2nez3gcUvSD/CfHqtTAvH2Lejl3DuDO0
         6YHrJ1prRG6whWNC0h3e2ogsKiBAhmv5Ki/yWdt7Nd9Gq7MbKKRIdz1JOu2Ot0ovAyig
         VlDZyJA4HAfFg1Jx+wN2lTaT7qqHQjxMLH5tKOUoz3uap0WPAYJCBx1LM4epQw/XuIn1
         xiRFZnQawzWSwaTrozWyuFDk+V4Xh9vKj0AtjgwZUyLMhkK5om/l5ZuOdtqfAtx8WOZo
         unponQvEQBzRSjnjkWJcB2348unxakk2Kp4w5J4fq+N59HhJGPDumGasb2HT6ppDMycg
         DwtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsG/35uYbIRQhuLqediXrKvxCmAf11egkHKa62fGfOWrbVVkFICVePxb2fo9189z/4w4lh7sM3oS80Icg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIurG6XJKenPrOhgufPeJkXiguw7K6bNDo0iynfVXgTroiYiUra
	9cdFWSrk0G6Md8f/2OnHO7g1SdfDWQ1tMJHcB/sT3WPzZSy4aPfYqLFL
X-Gm-Gg: AYBFou2xbDS6t4kwGRII0AOrqFCclxyqXHx7tW07B9C+ZRJubmOQyEhNf9zYq9NEPT0
	gadYLszaiRIUF1G9WNzjGMleMPFExFy+XOJSNqXuzen67wga5JL8duI/jwTv9I4NtrSyhYG2dRu
	lWqm+XGVbp5vPeIJWVApwQxhob3zh2jedb1lzCjN2DrcpybSHFFbDAsthteOolt2tKfAihos0mu
	v30TDyVW1mk5D+Ppzo9KmrWnOn8wfr/wW7ypKKuCz2OaHMA95rS7U2VGtUeavn5wdnKPy/YgoCq
	Jlfq8KJHOuVm1TmpYbDDYbBHyhOCVLgSXgsz+BZAQiNY40/HaBQJ/yBlvqRtseeOHN88KwP0T8H
	/PK6LVKHzqC1XpVSUVC6/D05/62Fv3NnksMEmpKHMMjYMQDv6KHfI+KhxuPGrRRYEsYtvosvZnp
	Av5mF7k9pR2QkY+vvIE/J6VAvIwLpQ1+vrU+AQ080ClzOEjZ3Zz9z6lLIDZH5wP8no1nRJe/w0E
	b7cmRo1UVBrA32HMgeBx+9KKW817RVzl1BPEyfH
X-Received: by 2002:a17:906:2092:b0:c34:1ed:54d9 with SMTP id a640c23a62f3a-c3401ed6006mr801846666b.4.1792059846449;
        Thu, 15 Oct 2026 03:24:06 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 0/6] alpha: improve Tsunami machine check reporting
Date: Thu, 15 Oct 2026 12:22:49 +0200
Message-ID: <20261015102353.999695-1-linmag7@gmail.com>
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

Thanks to Matt Turner for reviewing v7 and checking the register and
frame layouts against the manuals. His Reviewed-by tags are carried on
patches 1 and 2 from v5, patch 3 from v6, and patch 4 from v7. Patches
1-3 are unchanged. The new panic policy remains deferred as agreed.

Changes since v7:
- Restrict live chipset reads, acknowledgment and live-status reporting
  to system vectors 660/620. CPU and environmental vectors leave those
  registers alone so they cannot consume a pending Pchip error.
- Correct the PERROR comment: the first error freezes the register,
  mixed error bits were detected together, and only LOST can be set
  afterwards. Remove the detached PERRMASK comment.
- Split live environmental reporting (patch 5) from console-log support
  (patch 6), so the scanner can be reviewed or deferred independently.
- Remove the environmental decoder's unused return value and print
  parameter, and keep version-history notes below the separator.
- Print console wrapper names, event/halt timestamps and halt codes.
- Replace the open-coded byte dump with print_hex_dump().
- Remove the unused console-handler registration and mark the private
  scanner helpers __init.
- Remove the unverified type-6/type-7 definitions and register annotation
  tables. Those payloads remain raw; no register ordering is assumed.

PERRMASK remains as firmware configured it. Its reset value is zero,
and the HRM says mask bits gate PERROR latching. On my ES40,
both Pchips read 0x0000000000000ff7 under the v7 console-test kernel,
and the same values were confirmed after booting v8.
DCRTO is masked; the other defined error bits are enabled. Bit 9 is also
set but is not interpreted as a defined PERROR error. These were read
through read-only /dev/mem mappings without accessing PERROR or writing
any CSR; dmesg was unchanged and kernel taint remained zero. This is an
observed runtime setting, not a measurement at reset or a claim about
other firmware configurations.

The class-5/type-4 console record observed on ES40 remains unsupported.
Patch 6 retains its firmware pointer and prints at most 1 KiB of raw
bytes per log, so it may be reported again on subsequent boots. Console
environmental payloads also remain raw because Table D-18's sys_offset
conflicts with its field offsets. Successful decoding of a nonempty
hardware console log is not claimed.

Validation:
- Native ASan/UBSan handler tests pass with CONFIG_VERBOSE_MCHECK enabled
  and disabled. Protected mock CSR pages establish that CPU and
  environmental vectors make no live chipset accesses. Tests also cover
  stale INV state, system-vector acknowledgment, malformed frames,
  environmental status, wrapper metadata and bounded console dumps.
- The six-patch mailbox applies cleanly to the stated base and reproduces
  the source tree exactly.
- Each of patches 4, 5 and 6 builds as vmlinux with W=1 and GCC 15.0.1
  for GENERIC, SHARK, DP264, EIGER and DP264 with VERBOSE_MCHECK enabled
  (15 builds). The other four configurations have it disabled. No warnings
  in touched files; logs contain unrelated kernel-doc warnings and the
  existing saved_config COMMON-symbol modpost warning. These are minimal
  configurations, not ES40 deployment builds.

V8, built with my ES40 configuration, boots on the ES40 with three CPUs
online and the root filesystem mounted read/write. Available dmesg shows
no oops, panic or new I/O/filesystem errors; kernel taint was zero during
inspection. I unplugged and reconnected one PSU. The final notification
at 926.597181 seconds reports no recognized environmental fault bits and
all three supplies enabled; all three PSU LEDs are green. SMIR bit 0
remained set, so keeping it as raw context avoids a false failure message.
This exercises reporting of a valid notification with no fault bits set.
Earlier notifications named both PSU 0 and PSU 1 despite only one supply
being disconnected; the extra indication's origin remains unexplained.

Earlier CPU, memory and file I/O stress results apply to v7, not v8.
V8's available boot log shows raw console fallback but omits the start of
scanning, so it does not independently verify firmware-pointer retention.
V8 hatch tests, ECC/PCI fault injection, successful decoding of nonempty
hardware console logs and testing on other boards remain outstanding.

Matt's v7 build report covered patches 4 and 5 for GENERIC, DP264, SHARK
and EIGER, plus DP264 without CONFIG_VERBOSE_MCHECK, with no warnings in
touched files. Those minimal configurations were not booted. His manual
review confirmed the PERROR/MISC decoding, frame layouts and Clipper bit
tables, including unconditional SERR suppression and the fact that
configuration reads do not set NDS.

Magnus Lindholm (6):
  alpha: move Tsunami machine check handling to err_tsunami.c
  alpha: describe the Tsunami system machine check frame
  alpha: bound EV6 logout decoding by the processor area
  alpha: decode and acknowledge Tsunami system machine checks
  alpha: decode Clipper environmental events
  alpha: add bounded Clipper console-log scanning

 arch/alpha/include/asm/core_tsunami.h |   8 +-
 arch/alpha/kernel/Makefile            |   4 +-
 arch/alpha/kernel/core_tsunami.c      |  34 --
 arch/alpha/kernel/err_common.c        |  13 +
 arch/alpha/kernel/err_ev6.c           |  38 +-
 arch/alpha/kernel/err_impl.h          |   1 +
 arch/alpha/kernel/err_tsunami.c       | 682 ++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |   2 +
 arch/alpha/kernel/sys_dp264.c         |   3 +-
 9 files changed, 737 insertions(+), 48 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

