Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487495;
	b=SC65Beexlo0dDUag9JNeYqeoa4rWYfbuZ7JwuCTxdfZMvpU9o1RmxXLMoE2o6wntPrSK
	 U8HNJMJ84LhY1/1i7IeUMPyERi5HTpxTdl+Tq5b/ar9MItLa2AxjNIgH77kw2w/ibqqe+
	 QVHudN/PYYxGXT/Vh6Fkv93f+qeeJhVHnH54s16rlhsuQSWW67Nzjh8didp1xJkyHFLUa
	 6MOOU6CgzlCGnmbhQV+C3+cQshiIzuR/tWBv4Rc3c9Dvv0OEuXvPLGBCigxlrmn2NwFei
	 jEUjCUfE8fdNyery+fxpvRqvq2GUxN454tXlL4DsrXk360u4yqYhfwOwOUh9cmxJRsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487495;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=f1XHlG/1VgdvReV+lxl49g3+w+nT5a9aeMXBWrjsMjo=;
	b=OajlDFUfUAK4G622RzqGJPBLj9zDXN+L4COyOdJbXe+t5koCTUxtPGnTCZIOvGk/Muw3
	 crldL44XP6F8sttPgPgwoaAGj3HHXxcFKaH3jyVYdb55mxCj3650KeNiIrAKIGeafH9LB
	 yj8mp49wSptKu/VVW7/OjcCECJJFiY5e7QhxY/EBPleegBaqySSlj1d6HLXUIrvOD+9EP
	 HbZhP81b5LcHJCXRxscNSSrth+FSosCmGJBKNlPWEH0wexNsO7YDMTX3kuSqv4JFOJ4XE
	 8Sji5CtWVVFXDGy4VvSbGfKSzarx0KH//KG6AWEcOwigXt923dSzspnH98Q61fnwXPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlXcG7db;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0B606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dlXcG7db
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3911F00A08
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487494;
	bh=f1XHlG/1VgdvReV+lxl49g3+w+nT5a9aeMXBWrjsMjo=;
	h=From:Date:Subject:To:Cc;
	b=dlXcG7dbTYK1D8VOPf8Hj/UbwjkIktnm90nc8WDJT3WyDF88RtmnIZZwy0K+JmswD
	 rcQDJrIFlK504Fhb/zVvMddvXrVxop5M56zPwxpJ8c/dJcQ0662jQ9ZJUQB4zomMgN
	 OyQD1ZtzSCQdlFOx/rVuKOvrbtG7yiX3Xnszsv87BF7LYWdj8bnpbcvg0xYSAExtRD
	 1YDXVaMqTIKoHw6NQjuoT77nC5fz4ng9G2D+SIZ9jZOLlMAhS1evBWvQ3+WI1XbNAb
	 f9auX00uI8DGcGuV1a4sbb1XZBHHDPl18xoxMtNEZ1hacmzaY6eARFo3f8svdVRn4I
	 /ilt6/Yv5dMgQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae25c84207so2232721fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFphwQ5zMyDdo4WJwxhOx4RxVaG021Jgcl9/pHcHPKydA7KGR8Ms1JN9OMOB6UxgdcHKB52y40M7Ejo6Sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dMeJvtyb1Xxq8KOrIoWcfqVHzu5qebCJb/xk/5nZQs7fzHE8l
	xpkV+pdJKDJVyBxt7Lmhirf0OP7BOYs35nHeOmw8K6INQwYvEWxi51pvBQmd3c58UJnuex5vscC
	QoQOOV7QqM6zbMhaR63OG+93vnAQ95gg=
X-Received: by 2002:a05:6512:31ce:b0:5c1:4a64:ca27 with SMTP id
 2adb3069b0e04-5c15d5a6501mr1787430e87.6.1794487493352; Thu, 12 Nov 2026
 04:44:53 -0800 (PST)
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
Date: Thu, 12 Nov 2026 13:44:40 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jbeLEdsBPW94yYQqxfJOyBBdGpq9x_OLcSyKzDHYoH4A@mail.gmail.com>
X-Gm-Features: AclHuK99WIgiDMoHkK_zotqn1drz6khEX4dAVoN5T-1Xq0Pcl4dpXw_3ipC3lEo
Message-ID: <CAJZ5v0jbeLEdsBPW94yYQqxfJOyBBdGpq9x_OLcSyKzDHYoH4A@mail.gmail.com>
Subject: [GIT PULL] Power management fixes for 7.4-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.4-rc3

with top-most commit df42809bd599109660bd3f95e2e22330c80993df

 Merge branches 'pm-cpufreq' and 'pm-runtime'

on top of commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

 Linux 7.4-rc2

to receive power management fixes for 7.4-rc3.

These address a few issues in the cpufreq core and drivers, including
issues actually seen in the field, a few issues related to runtime PM,
including a false-positive warning introduced relatively recently
and a long-standing defect in the runtime PM core code related to
autosuspend, and revert a problematic recent update of the intel_rapl
power capping driver.

Specifics:

 - Revert a recent update of the intel_rapl power capping driver that
   caused perf to return bogus values (Dennis Chen)

 - Fix the synchronization of boost state updates in cpufreq (Christian
   Loehle)

 - Fix issues related to system suspend-resume synchronization in the
   cpufreq core and intel_pstate driver (Rafael Wysocki)

 - Fix P-state index mismatch in extract_io() in the ACPI cpufreq driver
   on systems with defective _PSS (Li RongQing)

 - Fix issues related to target frequency caching in cpufreq (Rafael
   Wysocki)

 - Prevent a false-positive warning in pm_runtime_remove() introduced
   by a previous fix during the 7.0 development cycle (Zhou Minqiang)

 - Extend a recent improvement related to the handling of suppliers
   during device runtime-suspend to some previously missed cases in
   which it is relevant for consistency (Brian Norris)

 - Update runtime PM documentation to reflect new behavior after recent
   changes (Stanley Jhu)

 - Add last_busy timestamp updates for devices requested to resume from
   runtime suspend that are missing if those devices are not actually
   suspended (Rafael Wysocki)

Thanks!


---------------

Brian Norris (1):
      PM: runtime: Only queue an idle check for RPM-linked suppliers (part 2)

Christian Loehle (3):
      cpufreq: Hold the policy write lock when changing boost state
      cpufreq: Preserve global boost state on failed updates
      cpufreq: Serialize global boost updates

Dennis Chen (1):
      Revert "powercap: intel_rapl: Expose all package CPUs in PMU cpumask"

Li RongQing (1):
      cpufreq: acpi-cpufreq: fix P-state index mismatch in extract_io()

Li Zhaoxin (1):
      cpufreq: intel_pstate: Use rdmsrq_safe() to read MSR_MISC_PWR_MGMT

Rafael J. Wysocki (6):
      cpufreq: Improve suspend-resume synchronization
      cpufreq: Force passing target frequency to driver during resume
      cpufreq: intel_pstate: Clear last written P-state value on suspend
      cpufreq: Cache post-resolution target frequency in __resolve_freq()
      cpufreq: Fix updates of cached resolved frequency and index
      PM: runtime: Update last_busy in rpm_resume() for active devices

Stanley Jhu (1):
      PM: runtime: Update runtime_pm.rst for non-fatal resume errors

Zhou Minqiang (1):
      PM: runtime: Fix check_flush_dependency warning from pm_runtime_remove

---------------

 Documentation/power/runtime_pm.rst   |  17 ++--
 drivers/base/power/runtime.c         |  11 ++-
 drivers/cpufreq/acpi-cpufreq.c       |   9 +-
 drivers/cpufreq/cpufreq.c            | 162 +++++++++++++++++++++++++----------
 drivers/cpufreq/intel_pstate.c       |  18 +++-
 drivers/powercap/intel_rapl_common.c |  15 ++--
 include/linux/cpufreq.h              |   7 +-
 7 files changed, 169 insertions(+), 70 deletions(-)
