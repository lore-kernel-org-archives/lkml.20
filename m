Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391937;
	b=Tiq3fce07CFxBRdRdtP7PZSTWBpu0jFjmPT/fr01oV6LDE/8cexzRt0zAxrf73HSg35g
	 FtJubllF7889UZ6M0tUhjlq2X6nouTMDeNVwGytdWooZClz5WN7cmHDLP1M71uqZKaNsR
	 k7zsDAkFIVbuWQxDkcVnXlIlKYumyWV7jWB65po83tCNaLGzZLvxjqBBZOf/mTNR8qDph
	 jVJ+66MKgcSTQFJstcW0pCSn5TIATxykj4MWQ6MaWKplR/feOHo2Y/b5YLnbxwsTSugPa
	 TOVH4i1RBs1npitfDnINtMe7Lnuk0Wx4gA+HoqdeWwCPUN2cS0MlDyWd1/2CdS82adw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391937;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=h+S/iwpWTJ5inQBvcILucyNzwuBfB9Qt4tcm6aWtHVM=;
	b=leTM/CIyCHF5Mg8GyyTWoAYS8R09gTEyoyTrYFZ55/HQ4Ul4XHn+wi3h0bzXwkga0hyz
	 QzoipixnGqPsmRCgCaG6oRSQF31gqU+GaVhohqXzmQiEyw5t1xdOLUGiesqXIGFGammwl
	 MoIdfXjd4dpgDudPYocua5zYJyskzNVqD2IHqpQFfHxsRWxz8i+65sqnZ8mKgttbZp9mu
	 iu+eb7lcICx66vc3suzSk4+uwmEk3QcQAVq4eaJZJjQzBQaGjWoziP/6A1ewCzoquFQau
	 G/IJ0ukh0ptFTbDw3ylYi9TOXFXzeTrguANP8GP7fjRS7BSaXH7uEIuhiY7vkOoCqCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixOsJxxF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26E5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixOsJxxF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C07E1F00A16
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793391936;
	bh=h+S/iwpWTJ5inQBvcILucyNzwuBfB9Qt4tcm6aWtHVM=;
	h=From:Date:Subject:To:Cc;
	b=ixOsJxxF4fgDarUBZlmlz8RmvYGp90V9e1SWyaAqC5FghdiLIozPJNWpjzSJtcIHN
	 bMNVxlmjIhxs0T5rnYKXBgECC5neV/rOOvV0BX7/3zLvKhiJIeaw6Q2wHmDepBW1Pa
	 feCcpjXXhiRs2nGUmF7rKCwElk0kJ0hoI52+zkS1Rm570HbIiPHFaYcGHz+lnXQD72
	 jcGtAItAxtP/1qHnSrO3MuXAa96OfAeyRNzyoAAOgYJJn+moA2D2KiBKQyE0mhvSnx
	 72Rpcm2NoMbOU8eKmSlbqaJb2aA2JZaUZKtOpmsDz2PSkoLgP2CTV2504QHQ/XUFac
	 /I8Nno+Yfhthw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so729022e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:25:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzLOj3s3ezRYy9Ejc2zDe4t0QfnjbdTY5ERORaNBHruOdI0BkbzYh4P0kPyK3B5hNS1FgHZlraBUOEfcQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2ld3Ycbx3gUbw7RspyJ/lKsXDILE9usdJT4GmJGvrXYgO/dUT
	dhQvUOLvIls7hftEH+rm8cRrHyVSP5yaOGdvk55Xhz9yaEEyNwETsAys6qfEW2Yis1Z2oYA0u8z
	HPSFu0xNToyEVuCz6ihiAgFteZgCuoIA=
X-Received: by 2002:a05:6512:b9a:b0:5bf:b8f1:80dd with SMTP id
 2adb3069b0e04-5bfd9583a29mr1226796e87.54.1793391935000; Fri, 30 Oct 2026
 13:25:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 30 Oct 2026 21:25:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jSxPop-hQ+2+cDRihaUWB3ubNJEcW-p5VC--W+Xfr0YA@mail.gmail.com>
X-Gm-Features: AclHuK_lN9lxHG82WFu8SnI0fZmqRuMJe_aC4_DNFq31H3OntBN_qfbal4jvSsY
Message-ID: <CAJZ5v0jSxPop-hQ+2+cDRihaUWB3ubNJEcW-p5VC--W+Xfr0YA@mail.gmail.com>
Subject: [GIT PULL] Power management fixes for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.4-rc1-2

with top-most commit 018f42c9ac5fa9701fc09514ed0739ab72708331

 Merge branches 'pm-cpufreq', 'pm-cpuidle', 'pm-runtime' and 'pm-sleep'

on top of commit 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

 Merge tag 'driver-core-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core

to receive power management fixes for 7.4-rc1.

These address assorted issues in the power management code and update
documentation:

 - Fix potential out-of-bounds access in deferred reset in the cpufreq
   statistics code (Zhongqiu Han)

 - Cancel HWP notify work in the intel_pstate driver cleanup to prevent
   possible use-after-free from occurring (Tristan Madani)

 - Adjust state names and descriptions for ACPI _LPI idle states in the
   intel_idle driver to make them follow the driver's idle state naming
   convention (Rafael Wysocki)

 - Document the new pm_runtime_use_autosuspend() undo mechanism that
   triggers automatically on driver exit (Joshua Crofts)

 - Do not call suspend_ops->begin()/end() for suspend-to-idle to avoid
   driver confusion (Ovidiu Panait)

 - Make the energy model management code allocate the cpumask for
   non-CPU perf domains to prevent out-of-bounds reads from occurring
   in the EM netlink interface (Karl Mehltretter)

Thanks!


---------------

Joshua Crofts (1):
      PM: runtime: clarify pm_runtime_use_autosuspend() undo mechanism

Karl Mehltretter (1):
      PM: EM: allocate the cpumask for every perf domain

Ovidiu Panait (1):
      PM: suspend: Do not call suspend_ops->begin()/end() for s2idle

Rafael J. Wysocki (1):
      intel_idle: Adjust state names and descriptions for _LPI states

Tristan Madani (1):
      cpufreq: intel_pstate: cancel HWP notify work in driver cleanup

Zhongqiu Han (1):
      cpufreq: stats: Fix potential out-of-bounds access in deferred reset

---------------

 Documentation/admin-guide/pm/intel_idle.rst | 12 +++++++-----
 Documentation/power/runtime_pm.rst          | 10 +++++-----
 drivers/cpufreq/cpufreq_stats.c             |  4 ++++
 drivers/cpufreq/intel_pstate.c              |  2 ++
 drivers/idle/intel_idle.c                   |  9 +++++++--
 include/linux/pm_runtime.h                  |  6 +++---
 kernel/power/energy_model.c                 |  4 +++-
 kernel/power/suspend.c                      | 20 ++++++++++++--------
 8 files changed, 43 insertions(+), 24 deletions(-)
