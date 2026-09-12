Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBA212FAD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173299; cv=none; b=flDMial6aC04xiIjZhW9c22uAvKBXbCTMyp5UVzYFnQ3HAL4s803Lt7hIni829RDhgJioEhCaJYmKrHWUD3HrkliGymX/h273i4v+GpvY/ujEGw7m+f+RG99qJ3J3Wf/Df/ippy0mkiY0ZqZKzHeYfX1y/szA14lBZe+WVlmXxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173299; c=relaxed/simple;
	bh=2EYSZw9dI+RSs3BAv9B+mxAKE9gVZ0mMPhca6XrblwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WyPrQXK+NBGYzkDDm5Mdmw73yY4z+a3qzhz2lytatpURs9FtW8ZzFdzvAqnbsab/5v22HqCpPK3kwl9on8STC1yKi2qRJSAdHsXsS6AYN7TnGSR9WwKENFAHtFfWboRCNHwRvb7aR+gjrJg6bdRFgR7QVQ2VLNt38h3a0QXE1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJjH2a0F; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJjH2a0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173297; x=1820709297;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2EYSZw9dI+RSs3BAv9B+mxAKE9gVZ0mMPhca6XrblwU=;
  b=eJjH2a0FLhlc5rvJ0HdGD9Ctrvdmu35aarcot4NtVQfctidu9TCZh6Pp
   fFisGLhmTTzvMhbCKalTubSuV/5JcTFLzGCnhO4GsEMcKYW1jpEn+Mqr3
   ReEDMw93rFmPMuxYrVxozcQWjRW8lhYrsr8Fa4oFSiJnNYft2/+svdDLo
   MxapRIvmODIsu20zE7Hm6yMkBsXl6zKJDLXgNSkRVvBjPxD8IWv2JJa5L
   KTgI8a3wTr6mjs8grsGBUO2Tsw9qZmuO5sT0gNmD/e2UCICHWNdwKQeam
   1+SfUaUDPeqMlIngljk2UgSzvwwfkCKdYbIPPrJn3xRj6NW89GgNxEu7x
   A==;
X-CSE-ConnectionGUID: tYyrQtpmR2+o71vfh3tN6w==
X-CSE-MsgGUID: GD0jtMrqTVi9YFfFm5cCQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174942"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174942"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:34:56 -0700
X-CSE-ConnectionGUID: sInwGSRASd2PtTM1LIfBmQ==
X-CSE-MsgGUID: hovEKBDGRV2hWuvKZtj4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217554"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:34:56 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 0/8] x86/microcode: Enable uniform feature
Date: Sat, 12 Sep 2026 00:08:06 +0000
Message-ID: <20260912000815.997720-1-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series enables another Intel microcode loading feature.

While this initial posting is marked with RFC, it is also expected to
provide patches to the people who are interested in testing/using this
feature. Tested-by is anticipated from that end.

So, x86 maintainers, feel free to ignore this round. Having said that,
feedback will be appreciated and always welcomed.

== Introduction ==

Traditionally, a single trigger updates a core-scoped microcode, which
thus requires executing WRMSR0x79 on every core. This also means that
there is a possibility to load different microcode patches between cores.
Despite this fact, the kernel currently enforces loading the same image
across the CPUs.

This uniform microcode conceptually eliminates a chance of running a
different microcode within a scope of CPUs. From the loader perspective,
the uniform feature extends the loading scope to a larger number of cores
than one core.

A few points worth calling out about the feature:

  * The CPU enumerates the update scope such as package-wide or system-
    wide, depending on the implementation. The scope is advertised
    via MSR and isn't programmable.

  * The scope reduces the number of triggers, whereas staging primarily
    reduces the amount of work under the WRMSR window. Unlike staging,
    uniform loading is applicable to both early- and late-loading paths.

  * For early loading, only the parallel CPU bringup is relevant. In the
    legacy serial bringup, once the first CPU in a scope completes the
    update, subsequent CPUs will observe the updated revision so skip
    WRMSR0x79.

  * Staging introduced a new loading process. But uniform loading extends
    the semantics of the existing flow. Software that assumes the legacy
    scope remains supported. The next section discusses this
    compatibility aspect in more detail.

== Backward Compatibility ==

Older kernels assume a per-core scope, being ignorant of the uniform
loading scope. So, they trigger loading via WRMSR0x79 on every core. And
the spec [1] has the following statement, in Section 2.4 "Uniform
Microcode Update":

   NOTE [*]
   ... It is always allowed to load the update on more logical processors
   than necessary, which may result in unnecessary additional latency.

So this means legacy kernels remain functional on uniform systems. To
provide more context, folks involved in the implementation agreed to
share additional implementation details with the community. Their
write-up is attached at the end of this cover letter.

== Latency Trade-off ==

The above spec also states `additional latency` which in fact is a
side-effect from preserving the backward compatibility. Excessive update
triggers may elevate lock contention and waiting time inside the
microcode updater.

For example, consider a system with 100 cores per package where hardware
advertises package scope. Ideally, only one WRMSR is enough instead of
100. However, if all 100 CPUs attempt the update concurrently, the
update mechanism has to secure an atomic operation where only one CPU
participates in the actual update while the others wait.

This effect is measurable when comparing kernels with and without
uniform support. The exact numbers depend on the patch characteristic,
the lock contention, and the underlying synchronization implementation.
On multiple implementations, uniform loading showed loading-time
reductions especially during the late loading.

On the other hand, early loading showed only marginal gains from parallel
bringup. CPU0 already updates the scoped APs before they come online. In
addition, unlike stop_machine()-based late loading, parallel bringup is
not strictly simultaneous but instead iterates through CPUs for bringup.
Thus, the degree of contention appears much lower during early loading.

== Call for Reviews ==

Below are some aspects to collect feedback:

  * Early-loading support

    Supporting uniform scopes during early loading appears consistent
    with late loading support. But there is also a trade-off to consider:
    code complexity vs benefit. As mentioned above, the measurable
    latency impact looks marginal. And at the same time infrastructure
    change (patches 1/2) also appears moderate (except for the new
    cpumask -- see below).

    If the consensus ends up skipping uniform support for early loading,
    then at least the microcode implementation details need to be
    documented instead.

  * New cpumask: primary core CPUs

    Introducing a new topology cpumask was not the preferred option. But,
    during early loading CPU0 must determine which APs participate in the
    primary bringup phase before AP topology state is fully established.

    For both core- and system-scopes, the selection is straightforward.
    But package scope cannot reliably depend on package IDs at that stage
    because logical package IDs are established later during AP bringup.
    Patch3 has more detail.

  * Error handling on firmware misconfiguration

    If firmware is expected to configure the feature but leaves the
    system in an incomplete state, then that could be an indication of
    an unreliable situation. This version disables the loader entirely
    (patch8).

    Alternatively, instead of being paranoid, tainting could be an option
    too.

But any review beyond these points are definitely welcome too.

== Patchset and Validation ==

This series can be divided into two parts:

  * Part 1, patch 1-3: Preparatory infrastructure changes
  * Part 2, patch 4-8: Uniform-loading enablement

Testing was performed on one primary test machine. Since the feature is
architectural, the expected semantics should remain consistent across
implementations.

The patch set is available in this repository:
  git://github.com/intel-staging/microcode.git uniform_rfc-v1

Thanks,
Chang

== Reference ==

[1] Intel Runtime Microcode Update Technical Paper
    https://cdrdv2.intel.com/v1/dl/getContent/782715

[*] The NOTE paragraph primarily discusses certain unusual configurations
    where the uniform scope is not explicitly exported but effectively
    active. But the quoted compatibility statement should stand
    generally.

== Appendix: Microcode Implementation Note ==

The uniform update protocol is an optimization for boot/runtime microcode
update. It is backward compatible with existing microarchitecture of
core/thread scope update and any OS MCU drivers that rely on legacy
method of update.

With uniform update, if multiple logical processors attempt to load an
update simultaneously, there is a race to an internal semaphore within
the microcode. The winner of the race assumes control of the update
process and sends an internal interrupt to all other threads (if only one
thread initiates the update, it is the winner by default).

All other logical processors receive the internal interrupt at an
architectural instruction boundary and proceed to load the update under
the coordination of the winner. This ensures that the responding threads
load the update in a controlled manner while at a well-defined
architectural instruction boundary. If a higher priority interrupt or a
fault happens, all logical processors will see it either before the
microcode patch has been applied or after. In either case, all logical
processors will see the same microcode revision and nothing intermediate.

Chang S. Bae (8):
  cpu/hotplug: Allow architecture-specific primary CPU bringup
  x86/hotplug: Implement SMT-primary selection for parallel bringup
  x86/cpu/topology: Introduce primary core mask
  x86/microcode: Extend struct microcode_ops for uniform loading
  x86/microcode: Clarify online enforcement with uniform loading
  x86/microcode: Support uniform scope for late loading
  x86/microcode/intel: Support uniform scope for early loading
  x86/microcode/intel: Enable uniform loading

 arch/Kconfig                             |   4 +
 arch/x86/Kconfig                         |   1 +
 arch/x86/include/asm/microcode.h         |   2 +
 arch/x86/include/asm/msr-index.h         |  10 ++
 arch/x86/include/asm/topology.h          |   3 +
 arch/x86/kernel/cpu/microcode/core.c     |  76 ++++++++++-
 arch/x86/kernel/cpu/microcode/intel.c    | 153 +++++++++++++++++++++--
 arch/x86/kernel/cpu/microcode/internal.h |  15 ++-
 arch/x86/kernel/cpu/topology.c           |  23 +++-
 arch/x86/kernel/cpu/topology_common.c    |   9 ++
 include/linux/cpu.h                      |   9 ++
 kernel/cpu.c                             |   8 +-
 12 files changed, 291 insertions(+), 22 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.53.0

