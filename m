Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820174D17BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547090; cv=none; b=KC5Pz3HNB1HTFAwEFH8NyP0A2vmrJjXvL/VzhU7HkLngs5A1+HCNjkuH2ty7mO1o5L2NsSxsDaCvaylj/G0FtcqkvFQVStKX8TzrTNEHi7fZbJPCGdzIoDF9vgihBqfKWE73q6WMQ2rRNkT9sk22Sp/P9c03vwbTMzl9SZlShcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547090; c=relaxed/simple;
	bh=OruZtNbHtR05YCmmNQ9tLKLY1cIMhQDt5/6DFqmzrbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKqtOAg2S5FjaZALxWNu2N9ahlMcPiEKQC+K5oQPi+IFhQbsShl38gky8PPwEdsGeMTJcwHY2OIS/yWBTggd7qmJLEZq303hqgyBqi8h12OLRtWYeOg4XanXhsH12d1E2rUPJgFusAz/GmUqoipQx+wKmLnE/Nf9F2EN5alJS4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gprRH0cv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gprRH0cv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e26719a0fso400043766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547083; x=1792151883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYMkoC21oZgVXLIM4qYI/k3O6A//pWisuhHGLwsZoZc=;
        b=gprRH0cvqw5mor4cepLSadwVa5vt9BEef5OY+/uPjOJvC7T7vOt3v2ZKz3O1a0yGcB
         QKGOeNBdTdAgUUV1R6zyJllUYFD4wXTqobzTcKWDcFHb95Dmkz1EkTaBEryPzOwLVp/v
         OGGLTWJ0qGhYxGedfqcl1+dUGGI4rRMntW7u7TlX7oclh5sHlaKgKxIQHjUDItdUtQ7n
         MDHwuuFnsOv6qH8TTdQVLZjIPV5oeUpG5TlcyNtEgaeRlEVaUymPoO3E0eLO/5XQqHZe
         4QKLYqWoUi3NXOdGdO4wv/S5JMMcN6TS7afAARjMXbwJNd3qyCeTmEKqjMrHYtEQjKcE
         3cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547083; x=1792151883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYMkoC21oZgVXLIM4qYI/k3O6A//pWisuhHGLwsZoZc=;
        b=TKZcTho7QUi/8T0XOJ/R3x8xAdbiOmyxfBfluXd5p9HKzprA6P01yGqf531nkUu95i
         DovFql+eoNEXfiKqWtpib33UxX6+rAnZmgFlEQT2XmEdoLomTa2nT3pg1igHMPCD4Ioa
         Jl6680rJLlNd/GFIGaXpw6URZ9sIq05+MmNI8AvRBlvaawgnt7aCJVjS8FFuN8ZrWlLf
         iBNLtHwMVYbZ686XWyFehdMTFTSwgm9+1NHE9P4x8jFTUexsWre/FnuR9vkQpn5YecKV
         1QkODRDDC7k3evhFaiJWWBhzLnodtL5RfN1DRwqi4+TrQxPjSoWVCBa/YjkDZ9VMQzHL
         K0xw==
X-Forwarded-Encrypted: i=1; AKwUvBy5+51EYfmlwJoZTWOo+MMbAYTwm2GHiZtdEYLNhU10moKHS2RxKplPUmOF0mt7i1taLK07xPGEV73J3Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcrU4J0cd9PHA3IiMqfxTV78HyvLD31/Vh0xmTiHYGnQpfFR9H
	TnXxjEs71qWIHIHtVjhzQvVNa04Q+YyzZIypGUJggYAm0wlySzmeARAi
X-Gm-Gg: AYBFou2RFS0uch5WEeQu2/wmDp5cVdunMWq1vn0a2Gj4fG/hG7EpWVIimwJeDi71abH
	SaYuqTP3cudzjW1Ebcx6eK9RSOBi0A2HprNBiI8hZucQZfv++WeZof772Nf7SPHNJ2lRoLxfL2l
	B2hLY3xlJA26FJqzwp2i65XCBK8Yk8SN96MX53RbDMVcgxfEUrCaQ5t0/pZwwhn3naq/6xBp+hV
	PvfZMw0g8bozXtp5Hm4byhsPp/4vJtdM9Aeg+vpQnGzojN94JSAt/BMfQkbaNTBGKjM49C5yVdb
	iiVr7HP2HjJ6MJnLRWbrOUXuq2ZLhsBlIafCPRKkCrEhXpLQUjUca9J5D88wO39VsjnRANwCdTB
	JQfautMUsU3GEj7IyI0D8lABz1WRUI6bp+PjkbiDV3YQG/jRAdhcaxivzzY6kDp6FVOda1BEXM4
	xVr2ujYjBqJ8z3+/uL3FsLCZDw2zQ51ANk3h1y6hAaqtSuqV89SZKYCFCftnonEbhZVuPhaaTQU
	IKv+ekvv3su5wvEJthI7fl9Jmm5guqFjmIuFW1G
X-Received: by 2002:a17:907:6e9f:b0:c29:f5d5:5a9b with SMTP id a640c23a62f3a-c31aa085ddfmr166792066b.37.1791547083353;
        Fri, 09 Oct 2026 04:58:03 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:02 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 0/5] alpha: improve Tsunami machine check reporting
Date: Fri,  9 Oct 2026 13:54:36 +0200
Message-ID: <20261009115627.969047-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds system-error diagnostics for Tsunami/Typhoon and live
ES40 environmental diagnostics for Clipper. It applies to v7.3-rc1
on the Alpha for-next branch (33465f6ab697).

The first two patches move the existing handler unchanged and describe
the system logout frame. A separate EV6 prerequisite handles the short
correctable CPU frame safely. The final two patches add Tsunami system
handling, Clipper live environmental decoding and console-log reporting.

PERRMASK is left as configured by firmware. Enabling more checking needs
separate justification and hardware testing. Inverted SMIR halt/reset
signals remain undecoded; PSU tests do not establish their polarity.

ES40 Service Guide Table D-18 gives sys_offset=0x20 in its console header,
but places the summary at frame+0x18. Console environmental packets are
therefore printed raw until an actual SRM record can resolve the layout.
Live environmental decoding follows Tables D-20 and D-21; QW8 is not used.

Changes since v4:
- Split the implementation into five patches; build error objects for
  CONFIG_ALPHA_TSUNAMI, covering non-generic Shark, DP264 and Eiger.
- Correct PCI/system addresses, ECC commands and syndrome, INV/SERR
  handling, DAC/MWIN selection, and SGE page granularity.
- Remove the unsupported Titan master-abort dismissal policy and leave
  PERRMASK as configured by firmware.
- Snapshot each live PERROR and MISC before acknowledging defined W1C
  bits; report additional live status without combining transaction fields.
- Check saved and live UECC/PERR before expected-probe dismissal and panic
  on either; retain expected NXM probe handling.
- Add an EV6 prerequisite to validate CPU-area bounds, including short
  correctable frames, before decoding extended registers.
- Restrict ES40 environmental decoding to Clipper; fix masks, fan input,
  print suppression, context-only status, and PSU warning source.
- Leave inverted SMIR halt/reset bits undecoded pending polarity checks.
- Preserve console environmental packets as raw data pending verification.
- Register console handling on all Tsunami boards; bound subpacket decode
  and terminate extended-register annotation arrays.
- Remove duplicate definitions and the private header; use shared IDs.

Link to v4
https://lore.kernel.org/linux-alpha/20251125224352.32034-1-linmag7@gmail.com/

Validation:
- Fresh vmlinux builds for minimal GENERIC, SHARK, DP264 and EIGER
  configurations, using GCC 15.0.1.
- Native ASan/UBSan tests of the actual EV6/Tsunami handlers, console
  dispatch and raw-dump helpers, including short/truncated frames, saved
  fatal errors during expected probes, and separate live snapshots.
- git am of the five exported patches on the base produces the exact
  branch tree; git diff --check passes.
- checkpatch reports zero errors. Its remaining warnings include the
  Alpha err_print_prefix convention, existing split printk strings,
  moved barrier code and the new-file MAINTAINERS prompt.

This version was boot-tested on an AlphaServer ES40 using my ES40
configuration. Unplugging and reconnecting a PSU power cable produced
correctable environmental events (code 206): PSU 0 was reported failed,
then enabled again with its individual failure indication cleared. SMIR
bit 0 remained set in all three reports; this does not establish whether
it describes current status or a latched event.

Earlier v4 testing was on the same ES40, using PSU power-cable changes,
opened hatches and a CALLSYS-based software trigger with modified
handling. PALcode clearing behavior and halt/reset polarity remain
unverified.

Magnus Lindholm (5):
  alpha: move Tsunami machine check handling to err_tsunami.c
  alpha: describe the Tsunami system machine check frame
  alpha: bound EV6 logout decoding by the processor area
  alpha: decode and acknowledge Tsunami system machine checks
  alpha: decode Clipper environmental events and retain Tsunami console
    logs

 arch/alpha/include/asm/core_tsunami.h |   5 +
 arch/alpha/include/asm/err_common.h   |   2 +
 arch/alpha/kernel/Makefile            |   4 +-
 arch/alpha/kernel/core_tsunami.c      |  34 --
 arch/alpha/kernel/err_ev6.c           |  36 +-
 arch/alpha/kernel/err_tsunami.c       | 595 ++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |   2 +
 arch/alpha/kernel/sys_dp264.c         |  12 +-
 arch/alpha/kernel/sys_eiger.c         |   2 +-
 9 files changed, 640 insertions(+), 52 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c


base-commit: 33465f6ab697abceafd9a340067a544d551c4412
-- 
2.43.0

