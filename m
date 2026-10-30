Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336393;
	b=ndWi5oWzN3ocUnblHFOc1sbflfC3iaqCGqZtZKsOyn3rJRLhamWzoi3coq0NEgmQvnJ0
	 VkHTJ7Slvv0Q5K16EaArFzDA3dU4poi0Qa/UD2PJfogbcnGk+N88nYK8y6tKQZ4KHW16q
	 eKuz0jvZdEHBVDikjNJ9ists6UTLXnvfvOsXwjOXI0C6Fz3nRzzPlCPb9lSr4E/I0VFVK
	 +R2Q3Nt4w9Ryf/uGa9SkvzqG0smQnrU4/zWZ3ojq2KyYWCJCP6y9SGAx091mPBjy6MLrq
	 H05PIg2aCVm0k9r6fdkY+JC78t0NxpQhv4cwymEbkJdzqkzEUj3CQ6SsZevcHLYTzSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=e7tEpwtIn4tmjp4Z0Nv9H81+oDdUJIUZCkg7ifmKdAE=;
	b=h/Y+/7InZtb1zqnDx6uEQC7WM5S7MtRNxeR1nF0MWR3kfEcnxZo5cXLFdpFB91kjq6dA
	 38L+/jvXp7I9IU8FDeeLJe+D3LxcJcWOGnnrQjn6PZ/B5JAK8XR2X/O1KmmbddkIYCT3N
	 WHgWrm0K3Wxb83kQObPyQpeTXsI3xXRo4eSCPfv00wkAgEA5MUS7sUEzT32WermesjgJ/
	 Nt7upqO0dUHamaqifB2LaIhsZixNWv3ScrjqXxBM4nG/amVhJgVa4LQljnmkw7nYVYSyi
	 KX4h9L8KuLKxH5HWeqZ2nlfOLnBPkGG1rJFi6fKjn2qv48A+I9LmXlaaZRHXpFAMOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AMHzS26m;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27633606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27633606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AMHzS26m
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso413486b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793336392; x=1793941192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7tEpwtIn4tmjp4Z0Nv9H81+oDdUJIUZCkg7ifmKdAE=;
        b=AMHzS26mzD9JmjdaN1nWBXCyR8Q2auTjDhCiW/4NIimnCZvUO9/BuNbEfpzFicz4zd
         IwP6Kgh2K53SN1PGJg5ULG1CRrYcz2NVT+q/BedGgIKst0ZStBV4rKwbMA5zevZi3Kzv
         zkXkIOf7Q3nkRiXpuVscopy75Y39Y5aq51R2EdWBzMY4PSqEdD7W6ASr6nv4x99P4qtt
         RUAtKSZHhH4X+Kw0sfPF0z1lRxeqjVFKQKzOR9+Lmf8QpoWRahaQhsztK9J3JnlKELGP
         k1L4+Pwq7CHssWOah1qKcpn9eALcj1yfkBZwg9hS6QPGHXWLW/kJS0hsTzTjpBBHPkSy
         deKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336392; x=1793941192;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7tEpwtIn4tmjp4Z0Nv9H81+oDdUJIUZCkg7ifmKdAE=;
        b=TzFDmEgSGhy+HBu6a/oNNpgyatF5UTtiz0nk08dh/d8wEi/4GasgtLkYS+wxgjh6EI
         NhVOfr9s4vsOlqaEpqqxwaibf5nB0Po28o16H7Ku+iRRXKsQpEqac7KRhqxSyEdtiyXM
         HU2ylR2i75QwjWl2e8ANOBDdtKKV4pB95slfjtSMtWyS7+juWmjnNdBQTniP8wXyDROY
         H7L/0jteR4P9VzPzBn3ZHz35diLFhZUQ9wt45lTEf+QSbOfxX3yKKUDA4xUnKWbQC5nK
         2R8cMZ9C+lSxXQEfSY0ZRoYS13MkuCVyjHzKa6WYgdCxkeBa39L6iSv0ajVQkY6Zc1mR
         l9rg==
X-Forwarded-Encrypted: i=1; AKwUvBwt8PlPYrmx//PiwrfLGtfcloxeX20aKyM04SA7UqTjblGnf9DsbR+vdxiqGmIXlIWBqTr9IZZ2KJhrJxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfRQ+P3sb9RICDvkY1ZTkk+K+Snobu4Wc1Zhz87NLWNFJ2fSoE
	7TIYoM+DifNM7cbpRafSmNnhR/6ovmfAnAYWQzAhwjqsg334eQotafcvx1y56cF8/X1wvxmgl+w
	vGY7+Ir32ieNYzdhwerwo75qXT5WJBD94vA==
X-Received: from pfaj11.prod.google.com ([2002:aa7:928b:0:b0:8a5:a56c:9408])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1785:b0:892:fc00:6e68 with SMTP id d2e1a72fcca58-8a9ba22a4a0mr1167146b3a.3.1793336392054;
 Thu, 29 Oct 2026 21:59:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:29:45 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030045947.3049598-1-vamshigajjela@google.com>
Subject: [PATCH v4 0/2] spmi: core: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: sboyd@kernel.org, abelvesa@kernel.org
Cc: abel.vesa@oss.qualcomm.com, jwylder@google.com, 
	linux-kernel@vger.kernel.org, vamshigajjela@google.com
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

This series introduces a generic, controller-agnostic DebugFS interface in the
SPMI core under /sys/kernel/debug/spmi/spmi-<nr>/ to inspect registered
controllers and perform SPMI transactions during board bringup and debugging.

Patch 1/2 renames drivers/spmi/spmi.c to spmi-core.c so that the core driver
and optional debugfs support can be linked into the spmi.ko composite module.

Patch 2/2 adds the DebugFS interface (name and xfer) along with its ABI
documentation under Documentation/ABI/testing/debugfs-spmi.

Changes in v4:
- Rebased onto spmi-next (8f70c729e68c).
- Split the rename of drivers/spmi/spmi.c -> spmi-core.c into a separate
  preparatory patch.
- Removed the 'detect' debugfs entry as MIPI SPMI does not mandate a universal
  register address across all slave devices, and probing 0x0000 fails on
  controllers with channel/register access policies such as Qualcomm PMIC Arb.
- Dropped redundant Runtime PM calls from spmi-debugfs.c since SPMI controller
  drivers manage their own runtime PM inside their transaction callbacks.
- Gated raw write ('w') and command ('c') operations behind
  #undef SPMI_ALLOW_WRITE_DEBUGFS (matching regmap-debugfs.c) so that the
  interface is read-only by default unless explicitly enabled in source.
- Updated Date and KernelVersion in Documentation/ABI/testing/debugfs-spmi.
- Link to v3: https://lore.kernel.org/r/20261019202107.888262-1-vamshigajjela@google.com

Changes in v3:
- Move internal SPMI core command helpers (spmi_cmd(), spmi_read_cmd(),
  spmi_write_cmd()) and DebugFS prototypes out of the public
  include/linux/spmi.h header into a local drivers/spmi/spmi-internal.h
  header.

Changes in v2:
- Rename spmi.c to spmi-core.c and link spmi-debugfs.o into the composite
  spmi.o module so CONFIG_SPMI=m builds cleanly with CONFIG_DEBUG_FS=y.
- Route DebugFS bus operations through spmi_read_cmd(), spmi_write_cmd(),
  and spmi_cmd() instead of calling controller callbacks directly,
  preserving SPMI tracepoints and core validation.
- Allocate a per-open-file struct spmi_xfer_ctx in open() instead of
  sharing a controller-wide buffer, avoiding races across concurrent file
  descriptors, and store struct dentry *debugfs directly on
  struct spmi_controller.
- Reset *ppos = 0 on register read commands so repeated transactions on
  the same open file descriptor work without manual seeking.
- Restrict SPMI_CMD_ZERO_WRITE at address 0x00 to 7-bit payloads
  (data[0] <= 0x7f) per the MIPI SPMI specification, falling back to
  SPMI_CMD_WRITE for 8-bit values.
- Parse register addresses with kstrtou16() so values above 0xffff are
  rejected instead of silently truncated.
- Update Documentation/ABI/testing/debugfs-spmi to document per-fd xfer
  buffers and 7-bit Zero Write opcode selection.

Vamshi Gajjela (2):
  spmi: core: Rename spmi.c to spmi-core.c
  spmi: core: Add generic DebugFS interface for bus inspection

 Documentation/ABI/testing/debugfs-spmi |  68 +++++
 MAINTAINERS                            |   1 +
 drivers/spmi/Makefile                  |   2 +
 drivers/spmi/{spmi.c => spmi-core.c}   |  20 +-
 drivers/spmi/spmi-debugfs.c            | 341 +++++++++++++++++++++++++
 drivers/spmi/spmi-internal.h           |  28 ++
 include/linux/spmi.h                   |   6 +
 7 files changed, 460 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
 create mode 100644 drivers/spmi/spmi-debugfs.c
 create mode 100644 drivers/spmi/spmi-internal.h

-- 
2.56.0.317.g454f8302e1-goog

