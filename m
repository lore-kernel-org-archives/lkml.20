Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1FD4718F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246596; cv=none; b=jIRbTw5jHa6dL/03Z0wuMKANWFi6SqbH84nv0EnzJIfF2sPNAuBN/ZAtzDvoz0YNpuV2HWIgCaoS0p7sle2IwC3OCIE+A6oFlYbRZ6q5pZmXRNGKWvMkLoagINe8GKRum9V++3Jl828C3rZIjipzU+WqdzQRqRVlM9u74hUk/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246596; c=relaxed/simple;
	bh=XemqIC5pLvnQ1zYhmC1PaLoLaAGTDCioG4jT36ChOl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PISEXbSmRrxTQjk1oJSitWBfz3nQMIoNJ/d8jZKAafv8QCPytF9pT4/qtBIFl3quvT+l9xqXTgNVJC4RGB0Pyc+iRjqgoBBknJ6WuUOCzzvLnhjr2Zj6YxvV7uXYTnwCz1Sl5c92u4P0kYvAesedhq961/I7lUxaUy3dCP/NrR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CwpmdZj3; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CwpmdZj3"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso3150137a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790246592; x=1790851392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0QMo/BVQzerrn6zgiR6prs9hR07zwPBsUpYTlVofDJw=;
        b=CwpmdZj3yBbmATvXeT3yQ1Q3SnXEe9qNg4AJSz9yqgkTYWTO5QQK5PJmJi/yuOtKrl
         u0A0TPWTDgPUOB4oIsmUDZdET/aRgU+de1RcVoNcc0y17pH4rxiNyy6dHhIgHSK+VrYl
         Cu8jILC6L3+NrBJwVL7GJIPPs2MRRrdBklhMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246592; x=1790851392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QMo/BVQzerrn6zgiR6prs9hR07zwPBsUpYTlVofDJw=;
        b=Nfpf4cchz2Io5tdr/yhbeBqNNBLDE2xqsvhnqu7d0345hNtsPhOfTcicEbAl8q4MjB
         ICvLKVjuU7kcJ7I2TFbwhPY0UhEFHaMn+IzmXKKjqPauqTWa2i2QFwm5ywTk8yaF5esx
         L7yUBxDvwaTYnpNHJCl+Q17iuKzB1HqBuok6HXgiDMwF6Czog8fsz5IWbc2Bh0Qx0IzD
         kSVsx8Ami4K77it2iVo2vGpZolhz1TQdVdspw2vdlAY7wR7HtDVSi5gmiZLe3fFEy38Q
         Z1TY+KKn+D5DzARo4mO9mxxmHZeSWtklvNDe2qXqC9cZ4kDI1schA1l60djaBM6wzlO0
         Cm0A==
X-Gm-Message-State: AFuF++mvbszz6gmKS5xGnetrPEqX6DrrwxRNVUdhNQEGwcBQhbJ66E/J
	4nRZNZ+7GLW2ov0PPsgKp3Zo1TkXmS75SmKZBD2nBy7NTT8r4lLMAXZ0/f/HjHn4OA==
X-Gm-Gg: AYBFou05cm5iKytuudmv2MKb9p7HqzRQPGJv1fp2mrRCpHwX8wuW1rFin9eCdYQKJDc
	ZFOOsaLlSQM8q/5fS+8+NwNuQCElkXO7j8FreYfUKnf12phGDgcLes6Xbnv+rMRj3HAxMzHwRCs
	REfdUFjvn9IlHX67DPKQFI9ni0WA20owm5twq/b27+UCvExD/bwA2wSgrLFLp0AA0/TuKyhJaC2
	S9CfA0qkSw+kyzSDSF9meZJ1p7yVAxLm+FZaEElmsf3A4nAsowIZ8i+FPOcOARpntoGq3zZwSJA
	5xG9VilvgUO+qcaYJzmnRQghzBGQlo0IbDa2yD2naDVeOl4W8LQwzSaKwxuAVCXNi5gJKlwXMxI
	4nZShRjS1fzYFbTSbNVf1n8Dvy6CdBx1QCcAuN4Ca6ajCa6I3TfDzgQ5oW1KlGtzohjaVOE0KD1
	Q0VHoML1igdgNJUzwgXUUb4gRXjJLJihYi2Rn8kvVPiPpnqxK8Nwv4qrDWZifsAzwkB9ybGWANA
	MCwWz02rva/CJhjr7RS/NAIXnD9AxXLYu5/yItYJb1uEBxfgmxtyPywGw==
X-Received: by 2002:a05:6402:460c:b0:6aa:9823:218a with SMTP id 4fb4d7f45d1cf-6aac8f6bfb6mr1611896a12.31.1790246592141;
        Thu, 24 Sep 2026 03:43:12 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm3464110a12.3.2026.09.24.03.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:43:11 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaluka@chromium.org,
	vineethrp@chromium.org,
	chuanxiao.dong@intel.com,
	jaszczyk@google.com,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>
Subject: [PATCH v2 0/4] x86/apic: Switch to x2apic driver early if x2apic is enabled
Date: Thu, 24 Sep 2026 10:40:17 +0000
Message-ID: <20260924104102.3534474-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During early boot, the generic x86 kernel defaults to the MMIO-based
APIC driver (apic_physflat). When booting (e.g., via kexec into a
crashdump kernel) with x2APIC already enabled in hardware and without
ACPI MADT probing (e.g., !CONFIG_ACPI), the APIC driver pointer remains
set to apic_physflat until late_time_init() runs x86_64_probe_apic().

Because check_x2apic() detects hardware x2APIC mode and sets
x2apic_mode = 1, the APIC MMIO fixmap is not mapped. If a pending
interrupt fires in the window between local_irq_enable() and
late_time_init(), native_apic_mem_eoi() attempts to write to the
unmapped APIC EOI MMIO address, resulting in an early boot page fault
(#PF).

This series restructures early APIC initialization and installs
apic_x2apic_phys (or apic_noop if the APIC is disabled or built without
CONFIG_X86_X2APIC) as the default APIC driver in apic_early_init(),
ensuring safe MSR-based or no-op APIC accesses while still allowing
later APIC probing (e.g., upgrading to apic_x2apic_cluster) to proceed
normally.

Changes in v2:
- Reworked v1 based on Thomas Gleixner's feedback and suggested draft,
  splitting it into a 4-patch series and addressing several issues from
  the initial draft (!CONFIG_X86_LOCAL_APIC stubs, handling early
  apic_is_disabled in apic_early_init(), and avoiding duplicate routing
  log messages and the 'apic->probed' flag by dropping the dead check in
  x2apic_phys_probe()):
  - Rename init_apic_mappings() to apic_finalize_early_init().
  - Consolidate acpi_mps_check(), check_x2apic(), and
    apic_setup_apic_calls() from setup_arch() into apic_early_init().
  - Remove the redundant 'return apic == &apic_x2apic_phys;' check from
    x2apic_phys_probe() (dead code since commit cb214ede7657), which
    allows apic_x2apic_phys to be used as the early default driver
    without needing an extra 'apic->probed' flag in struct apic for
    x2apic_cluster to probe later.
  - Replace apic_setup_apic_calls() with apic_install_default_driver()
    and install apic_x2apic_phys or apic_noop as the early default
    driver in apic_early_init().

v1: https://lore.kernel.org/all/20260910090512.1197517-1-jaszczyk@chromium.org/

Grzegorz Jaszczyk (4):
  x86/apic: Rename init_apic_mappings() to apic_finalize_early_init()
  x86/apic: Consolidate early APIC initialization into apic_early_init()
  x86/apic: Remove redundant check from x2apic_phys_probe()
  x86/apic: Switch to x2apic driver early if x2apic is enabled

 arch/x86/include/asm/apic.h        | 11 ++++------
 arch/x86/kernel/apic/apic.c        | 33 +++++++++++++++++++++++-------
 arch/x86/kernel/apic/init.c        | 32 ++++++++++++++++++-----------
 arch/x86/kernel/apic/local.h       |  4 ++++
 arch/x86/kernel/apic/x2apic_phys.c |  9 ++------
 arch/x86/kernel/setup.c            | 12 ++---------
 6 files changed, 58 insertions(+), 43 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

