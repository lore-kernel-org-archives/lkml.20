Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392654;
	b=GYPqKTTkFRnI3Nf6+29lnTqpYCiZxu9PiwsQFoD80GhbxmS8kfEawtYbfHKUShpC0h5K
	 AsWEjrVh6urIgtbH8C+757HwobtnEFxHBoTJrxGLxpcJXYx2eCNlfkPWwsgDInh1ygNS8
	 EfYPYiaYt0yswIg0vJqhnQGUlrsIZ0LX1wKoGD8OGtogvW3Ggg7qw8Ex77Nc4S2VZoJaL
	 m4jFjAtDGPJ+oK4SCv197fw2/aDajoueEVAWcZmbKEZTwv/lOYSHv7ecZXnXEbKYWdvZK
	 Uz5UYga5LL8ejPqFTnw+OHpGkNM7wD/WZCE/dG687Qa+hdxAtuAr7BPlRQH6TT4Crag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Rl9SgzPKturiXXIxyUsQG7R9DJFZKxh+CZ3BLrjWpDA=;
	b=02fTflT2WimufjnOh0HWwyP8Rc05XzkvEWlgourvg8prn5yF5w74F3bejUB4d/CCPxn/
	 6+6tHkPufobjqBD8BcWOZkcygwbdKo52P+ZO3uOwnJ719UhTrGJDqXHDVzFDLv3uYkd0n
	 eGfa8+VuQG4hbHXkY095CslznCknWC2U1K7We39QNW3GW4RZLaBs1z6vRzhw+T1mvUckF
	 X6cjxDL1pDsr3qFwPRcns4A6nqTMJfcJ/n3fKo41dJQJ/y6vzI+cutRzd9XRT60E5INNN
	 4kQqoGzkuY679YYGzM3EF0C/ByvBmskqFwKb1JmsXaBRMKfA0mD/aQ/0vT3cRj9AdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyZyGAxP;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88283606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88283606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyZyGAxP
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so705880a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392653; x=1793997453; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rl9SgzPKturiXXIxyUsQG7R9DJFZKxh+CZ3BLrjWpDA=;
        b=gyZyGAxPq9FjKpxgC+S8GHU058ZXu12ZclJClRklEXgmJ/C4qi9PFYHONkcVqQ3qrA
         y6EgCqovF/BarXJqeqweL7dh054qn+nig6JiFag8cSgfL/nb2VNIFt25OJV9DjvqbXAw
         f5RM49aifNTUyG42/u/3wQOUVpdTR9IdDSHTlWnuNgmhQ8M8OnA88KYRm/AJpAhKun0A
         CpOaSAHTYqnlI9erxhFRajA23TVl14VHS5yHGJucEtReRWyZw/KD32JkDaLtlpmTvUpE
         5Xuat9IA0Iw3P8vtirOLkhXRfCpYMoIrPE6z8fY0jFvZvkCq6LhaAfmokFEn9dvKalSI
         EtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392653; x=1793997453;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl9SgzPKturiXXIxyUsQG7R9DJFZKxh+CZ3BLrjWpDA=;
        b=NZFGhXujnYOm82HPp23xBdez1k/HnCU9ze+wOK9Ody3L19FG+vLQW2OyAj6mNzq/Cp
         kYWS+GaSkuRSLwLBoNry+pUn0Tz+Ye5gdG3QQ62n8sH1ixEksQtDt2pIDWCJOTYB0gRn
         QabRnjDyYRfvOJcOcfyL7sI6a5B++g64QzIXDJvte60KRPLKQpJLYu+6A995OaJKcinM
         HBBvBC4aE7VY9HzXd6kipW2JselGo/+1iuaM2KLEUJ6/K6ve+Ikz7rT9Ri6nm7IlbV81
         8Tnkr/PSJ1JAuUmNzSgiV4B7/2x384++WsCQFZFBe6EpdPnFBPtWNc++rPplHIYDcqBa
         FBHw==
X-Forwarded-Encrypted: i=1; AKwUvByeWTvXR9XfQ52SXK0akaJyQBNdDUmTLBWg5IKrMHVPAiMglNwvKWQc0Z/rkAUZcYv+mb4SI5MpbrgRiOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM/OCeaUG0Rn8YWGtk2RywDCrpr0hOEau/dEyFkRyu15vkFuSI
	AXiJbvR8UCEY1fOmjtX1bWcHjrho7rcPfTIswVzjKR8NZiXKDhW54N8S0C139Xdq+9CMKvaphj7
	+RpvT6bzvrIwc7Qd0Cg+uV9YDpE1fOeXUCQ==
X-Received: from pfbln18.prod.google.com ([2002:a05:6a00:3cd2:b0:8a8:8472:cd94])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:48e:b0:3e2:afda:c37d with SMTP id adf61e73a8af0-3e928dfa35amr2606682637.60.1793392652748;
 Fri, 30 Oct 2026 13:37:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 02:07:26 +0530
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
Message-ID: <20261030203728.3784902-1-vamshigajjela@google.com>
Subject: [PATCH v5 0/2] spmi: Add generic DebugFS interface for bus inspection
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Jim Wylder <jwylder@google.com>, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

This series introduces a generic, controller-agnostic DebugFS interface in the
SPMI core under /sys/kernel/debug/spmi/spmi-<nr>/ to inspect registered
controllers and perform SPMI transactions during board bringup and debugging.

Patch 1/2 renames drivers/spmi/spmi.c to spmi-core.c so that the core driver
and optional debugfs support can be linked into the spmi.ko composite module.

Patch 2/2 adds the DebugFS interface (name and xfer) along with its ABI
documentation under Documentation/ABI/testing/debugfs-spmi.

Changes in v5:
- Drop "core:" from patch subject prefixes to match SPMI core convention.
- Collect Abel Vesa's Reviewed-by tag on Patch 1/2.
- Update KernelVersion from 7.4 to 7.5 in Documentation/ABI/testing/debugfs-spmi.
- Drop debugfs return value and root checks, drop redundant NULL assignment in
  spmi_debugfs_exit()/spmi_controller_debugfs_remove(), and use
  dev_name(&ctrl->dev) for the controller directory name in
  drivers/spmi/spmi-debugfs.c.
- Link to v4: https://lore.kernel.org/r/20261030045947.3049598-1-vamshigajjela@google.com

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
  spmi: Rename spmi.c to spmi-core.c
  spmi: Add generic DebugFS interface for bus inspection

 Documentation/ABI/testing/debugfs-spmi |  68 +++++
 MAINTAINERS                            |   1 +
 drivers/spmi/Makefile                  |   2 +
 drivers/spmi/{spmi.c => spmi-core.c}   |  20 +-
 drivers/spmi/spmi-debugfs.c            | 331 +++++++++++++++++++++++++
 drivers/spmi/spmi-internal.h           |  28 +++
 include/linux/spmi.h                   |   6 +
 7 files changed, 450 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-spmi
 rename drivers/spmi/{spmi.c => spmi-core.c} (97%)
 create mode 100644 drivers/spmi/spmi-debugfs.c
 create mode 100644 drivers/spmi/spmi-internal.h

-- 
2.56.0.317.g454f8302e1-goog

