Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1534A797
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811866; cv=pass; b=oNe4PeFzeD8toDOY4TyIxKzXsIx2M3/CjwY5ThFxdb9nEcIadHTCgk76FFC2zuIYWzPoC67YGfDti+7Ee0b9j3KGI8DDvYb/d8HiK6ZRUAOmaUGleBn/nRNDdnfZgQAPMY/WEtStV3sIQCtAk9AoNdJ6OdPJj8U3HdIZLq8Td5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811866; c=relaxed/simple;
	bh=m4koKE0Dza34+nXtLr7E7xUIQ0SHdMkEe30YrKi3yGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJjDi0hW2e/FiIs2KYonUi6rzhK/x6QyOMrP8+6Rc0VCQCTkzaddQ0xHDJgk6pbFVgvCqVa6QTj/6n7Zr3igRf9xuwK3WCsFH9BHsz+57qmjY80y8OG+1ee1JmvNQAN7I9SoDSrQEeMGFHOYrNz0+RvhWnn+KjlTjWfW6ekYiiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KFF3d+b+; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KFF3d+b+"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6de1fd5f572so753217eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811863; cv=none;
        d=google.com; s=arc-20260327;
        b=o8Gn1b84MsKVBPfU7Y3ubLJ0ihHWiDx45wj3+Kk86VZH3v/7LULuohh+SHpSb5SIQD
         K03FYhb/Jyazwxc0Cib8EtPs7pNZx8epaaHICCQ2arfYcvsWTFYyLn6GHfg9WJ0ze5sT
         oAy5YhadmaOc+17zKLk3hCBSvrOcZuVrSLI88IQrIkYQwj7+wQ+2CjrAvEwTItsEdgWs
         6B1gapGUnTbQND5C4N55lU7NlgALec46pQanDh6iw2HOdAipfaC8mMbcr4fUuBdntEyW
         4lBiFBwm6ohWXcw8em2Cjdr2b5b+zjyX6HMh0O67lGOQw8RV1kayLbwDNY0CcxApKQht
         JFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        fh=i+WR4u6Nxekh481+GTOso4FVGm6xJQNhAf3GUjbZsEY=;
        b=c71+bZGrQEq70delbpEzC8kCBO1AiUCtqOZzjYiCPo0Tv0+hVEsCQET5TFIIEA73g7
         Bw4I/f+4MmtsteoGmXe4UkgIIZcMNcL9X07z2oeUxsVawx8Yh22PjEorELOGWtZo9vLS
         W3Zu4G9kWDIBEAr5k/JyXjcPwkVMDPi8o2SofLcYJ2LzK8+Lb+FfOddMtd8R4MwW8uj0
         RfqbKps12oIkCNuLHGjM6lUpHj11uz3oPOdeLnrGNIaDz1HNFqNq1k/YJbCPHTrwOnCk
         7mRP5bn9ONdA0/oZk21Z9b5i0zpjhj6zLzD52GwMGz1nZoQL780+tNqaUM7JC4/MXrCl
         1xnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791811863; x=1792416663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        b=KFF3d+b+LZ6ivkhhG3B2LjD60EJP9gHuRZZUYclGW3As/xVT+mOXbowmJGB9TwNWTH
         idO5rLKd8PT2mem11d9LWv+MVOHyytAE+ergT1nvGan9g9zaC6oWOFsKT+dGWGhuW4Lr
         JklQH0vz5GUX3TdUgD+YcNlc7YcKQ36WK4UXuRuVYTPgs7zleaiOIvIcXQ2/xMXpxsQU
         HhdNAVM8yv2LXr59cbHAokBP9RBypbKkCAY+OUKaXh/f/G0F2ge7Tcbnkk19sosoi7OI
         q0h1KS+9Zkg10LwOUCgwY8cn4PtsptudGWZrDZugyQcqrPyHa2UZUBrb6/x+I/ObaEqj
         IKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811863; x=1792416663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KiOo/wZD2K62xmIXsdM9wvMcd8ElF/qU/XGwGHVWNnM=;
        b=SC/xqQeXJTFcW2vILieTb63HAVMpTWmYsnEJOuyOGGLZ6Qc5nAnmFoG9bAJa2dwqg+
         bYTANOR2w73JvJFr9dV1XGy5x1jsz2aezKCeLCs61lezf3Oz0B2Eil85uJVdWD+Ve1sk
         wjyhoTK2KSTpINN2AUvZ37RcnnjcmVJQTWaAWxOuKpBo8Ov6Aq0ZLmNhFAxXZf8vLrKI
         Ta9pVTvE3IbJoMrfz11aXHlC18mgdXSyWJE7cAtF9Z9U3kg+lEMbAbATwP+p588aoOdo
         9qcYq9kOIw5EgY1IT8TfeGtsJv+Hd8TwGcxzXwVhoiFvFopVkNp8Out7YzzY3mPUjZB7
         GRfg==
X-Forwarded-Encrypted: i=1; AKwUvBzu/V96hKn0ymDvGsdrmjqMT8LAAm9YzSi7UIVKUSWZM0PbgOft/2yiWf4Zsjp0hPY4R4RBmENFgQb4v3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiOUYUjiRQu8aJKhUFAw6hETwN/1rlPb1YWPXMVFPay9gPQM7g
	2xpGf67VjH7JlExuTUTmO5IAo8J/r2SkIF8WFl73WzuOigTyz2Wkd48e04n//KV3F2lauFu22LN
	ck2DuMJzzYG/BtCJhEIg+fJGGucvnyOHLhz1XRpnuXg==
X-Gm-Gg: AYBFou0IzoSQVm0CJTYtS2izfuJ/4wuBp93HDTD6noD0aiUTI+X1YGVBfYTgxOtChJV
	afzPB7VC4ZTtHP9sAIgl2/I0nssKeOgbPqxH/ho4Bq4XAsIeHx58ZPA5HRk7jjzsRzek6CcisX7
	L0cIIMQXsAKaMpvEcenV9mjquN2+zKt9GDj73fy47oRcTfvze9FRhmrVER+OBtTvOb+mJpu2fDe
	n7wLsrqC1iY7D+k+2/rq0ctp+5+5M30DmLvvaWI3V53Pqtw/OHi+w4HV+REHNk8+Yi4rDX16KlL
	nc6GMp+QiryM81akJsXJ0aGKllRAA1XdKY/9DiDQ/TapaqLMMzGiZDe7REZPrw==
X-Received: by 2002:a05:6820:1c8c:b0:6f8:3d45:b465 with SMTP id
 006d021491bc7-6f83d460e36mr597816eaf.11.1791811862469; Mon, 12 Oct 2026
 06:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831172245.42253-1-fenghuay@nvidia.com>
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 12 Oct 2026 21:30:51 +0800
X-Gm-Features: AclHuK_vMcorLODW8hzTAKchqs7y0a8-suXQ6J3y_WfRav5d6A8ZoaK1GGtrHOY
Message-ID: <CAEEQ3wmOqR5M0LzdKqOOH3iYmL04e4tDJ0wS0UqH7FER_2+JHw@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 00/19] arm,fs/resctrl: ARM MPAM MB_NODE support
To: Fenghua Yu <fenghuay@nvidia.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Tony Luck <tony.luck@intel.com>, 
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, 
	Dave Martin <Dave.Martin@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@fujitsu.com>, 
	Chen Yu <yu.c.chen@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Drew Fustini <fustini@kernel.org>, Vikram Sethi <vsethi@nvidia.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Newton Liu <newtonl@nvidia.com>, 
	Richard Cheng <icheng@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fenghua,


On Tue, Sep 1, 2026 at 4:03=E2=80=AFAM Fenghua Yu <fenghuay@nvidia.com> wro=
te:
>
> This series enables MBA bandwidth control emulation on ARM MPAM when the
> default MB control is disabled, using a node-scoped MB_NODE control as
> the native backend.  It extends memory-bandwidth monitoring and
> control to memory-level MSCs or CPU-less NUMA nodes, and adds
> documentation and tests.
>
> Background
>
> On x86, MBA bandwidth control is typically associated with the L3 cache:
> schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
> On some ARM MPAM systems the MBA control is backed by a memory-level MSC
> rather than the L3 cache MSC.  A memory-level MSC is represented as a
> NUMA node, and that node commonly has no CPUs of its own (a memory-only
> node that still participates in bandwidth control).  For such a resource
> the control scope is NODE, schemata identifiers are NUMA node ids,
> monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
> may be the only control with usable bandwidth hardware.
>
> Because the memory-level MSC lives on a CPU-less NUMA node, the driver
> must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
> affinity from the component's NUMA node id, so a memory-only node would
> otherwise end up with an empty CPU mask and never be registered.  When
> the derived mask is empty, the driver falls back to cpu_possible_mask
> (masked by MSC accessibility) so the node still gets a resctrl domain.
> The borrowed affinity is kept out of class->affinity: those CPUs already
> contribute through CPU-ful nodes in the class, and subtracting the
> borrowed mask on teardown would remove CPUs that other live nodes still
> depend on.  Domain setup iterates all MSC components per CPU (keyed by
> component), so each component =E2=80=94 including these CPU-less memory n=
odes =E2=80=94
> gets its own control and monitor domain.
>
> Examples of NODE and emulation interfaces on MPAM.
>
> ** On platform with CPU-less nodes, by default, control_mode is legacy.
> 1. By default, MB is emulated by MB_NODE in schemata.
> info/
> =E2=94=9C=E2=94=80=E2=94=80 MB
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bandwidth_gran
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control_mode        # [legacy] na=
tive
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 schemata
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 MB
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 MB_NODE     # emulated by=
 "MB_NODE"
>
> schemata: Only show MB, which is emulated by MB_NODE. domain id is numa
> id
> MB:0=3D100;1=3D100;2=3D100;10=3D100;18=3D100;26=3D100;34=3D100;35=3D100
> L3:1=3Dffff;2=3Dffff
>
> 2. root can switch to native by writing "native" to "control_mode":
> info/
> =E2=94=9C=E2=94=80=E2=94=80 MB
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bandwidth_gran
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control_mode        # legacy [nat=
ive]
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 schemata
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 MB
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 MB_NODE     # no emulatio=
n, native mode
>
> schemata: Only show MB_NODE. No "MB:" is emulated.
> MB_NODE:0=3D100;1=3D100;2=3D100;10=3D100;18=3D100;26=3D100;34=3D100;35=3D=
100
>      L3:1=3Dffff;2=3Dffff
>
> 3. llc_occupancy in mon_L3_x where x is cache id
>    mbm_total_bytes in mon_NODE_y where y is numa id
> mon_data/
> mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
> mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35
>
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_NODE_01/mbm_total_bytes
>
> ** On legacy machine which only has L3 MSCs. No NODE scope in schemata
>    or mon_data
> schemata: MB's domain id is cache id, not numa node id
> MB:1=3D100;2=3D100
> L3:1=3Dffff;2=3Dffff
>
> mon_data/
> mon_L3_01 mon_L3_02
>
> mon_data/mon_L3_01/llc_occupancy
> mon_data/mon_L3_01/mbm_total_bytes
> mon_data/mon_L3_02/llc_occupancy
> mon_data/mon_L3_02/mbm_total_bytes
>
> The patches can be compiled but not tested on x86 yet.
>
> The 19 patches are grouped as follows:
>
> 1. Memory bandwidth monitoring and control on memory-level MSCs
>    (patches 1=E2=80=9310, 12)
>
>    Generalise the monitor infrastructure beyond hard-wired L3 paths:
>    de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
>    name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
>    total event, and make MBM handling resource-aware.
>
>    On the ARM MPAM side, add memory-level MSC and ABMC support, refine
>    L3 topology and class selection, refactor domain setup to iterate all
>    MSC components per CPU (keyed by component), and handle CPU-less NUMA
>    memory nodes that have no local CPUs but still participate in MPAM
>    bandwidth control. Memory hotplug locking and notifier are added.
>
> 4. MB_NODE emulates MB (patch 11) [1]
>
>    Wire MB_NODE as the native backend that emulates a MB control
>    in the ARM MPAM driver.
>
>    If emulation is unnecessary, this patch can be removed.
>
> 5. Documentation (patches 14=E2=80=9317)
>
>    Document memory-level MB control and NUMA nodes in the arm64 MPAM
>    guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
>    in the resctrl documentation (patch 20), and an MB_NODE emulation
>    example on ARM MPAM (patch 21).
>
> 6. Tests (patches 18=E2=80=9319)
>
>    Add a KUnit test for CPU-less NUMA node affinity handling and a
>    kselftest that exercises MB emulation mode switching,
>    resource_schemata hierarchy, and schemata mirroring on ARM MPAM.
>
> Apply the patches on top of [2].
>
> Testing
>
>   # KUnit (CPU-less affinity)
>   sudo cat /sys/kernel/debug/kunit/mpam_devices_test_suite/results
>
>
>   # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
>   cd tools/testing/selftests/resctrl
>   sudo ./resctrl_tests -t mb_emulation
>
> This series is in https://github.com/fyu1/linux/  cpu_less.rfc.v2/
> which is on top of [2].
>
> Change Log:
> RFC v2:
> - Remove fix patches 1-2 which are implemented in [2]
> - Remove the emulation patches 3-8 which are implemented in [2]
> - Update emulated_by to *emulated_by in patch 11. Ben seems
>   doesn't like to emulate MB by MB_NODE. If that's case, I can
>   remove this patch. But for now, I keep this patch for further
>   discussion.
> - Add patch 13 to implemente legacy and native modes to emulate
>   "mbm_L3_assignments" by "mbm_NODE_assignments" in patch 13.
> - Add patch 9 for memory hotplug locking (Ben)
> - Add patch 12 for memory hotplug notifier (Ben)
>
> RFC v1:
> https://lore.kernel.org/lkml/cover.1784217438.git.fenghuay@nvidia.com/
>
> [1] [RFC v2] mpam,x86,fs/resctrl: Generic schema description Proof of Con=
cept https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@inte=
l.com/
> [2] Reinette's resctrl control branch RFC v2: git://git.kernel.org/pub/sc=
m/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v2.4
>
> Fenghua Yu (17):
>   resctrl: De-hardcode L3 monitor infrastructure
>   resctrl: Expose MBA MBM counter assignment sysfs
>   resctrl: name node-scoped monitor domains mon_NODE_<id>
>   resctrl: Add node-scope MBM total event
>   resctrl: Make MBM paths resource-aware
>   arm_mpam: Support memory-level MSCs and ABMC per class
>   arm_mpam: Refine L3 topology and class selection
>   arm_mpam: Include all MSC components during domain setup
>   arm_mpam: Handle CPU-less numa nodes
>   arm_mpam: Emulate MB control with node-scoped MB_NODE control
>   resctrl: Add mbm_assign_scope_mode for native assignment file names
>   Documentation: resctrl: document mbm_assign_scope_mode
>   Documentation: arm64: mpam: document memory-level MB control and NUMA
>     nodes
>   Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE
>     monitoring
>   Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
>   arm_mpam: Add KUnit test for CPU-less NUMA node affinity
>   selftests/resctrl: Add MB emulation test for ARM MPAM
>
> James Morse (2):
>   fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
>   arm_mpam: resctrl: Add NUMA node notifier for domain online/offline
>
>  Documentation/arch/arm64/mpam.rst             | 105 ++-
>  Documentation/filesystems/resctrl.rst         | 135 ++-
>  drivers/resctrl/mpam_devices.c                |  59 +-
>  drivers/resctrl/mpam_internal.h               |   8 +
>  drivers/resctrl/mpam_resctrl.c                | 879 +++++++++++++++---
>  drivers/resctrl/test_mpam_devices.c           |  67 ++
>  fs/resctrl/ctrlmondata.c                      |   6 +-
>  fs/resctrl/internal.h                         |  18 +-
>  fs/resctrl/monitor.c                          | 355 +++++--
>  fs/resctrl/pseudo_lock.c                      |   3 +
>  fs/resctrl/rdtgroup.c                         | 157 +++-
>  include/linux/memory.h                        |   1 +
>  include/linux/resctrl.h                       |  36 +-
>  include/linux/resctrl_types.h                 |  15 +-
>  .../selftests/resctrl/mb_emulation_test.c     | 314 +++++++
>  tools/testing/selftests/resctrl/resctrl.h     |   1 +
>  .../testing/selftests/resctrl/resctrl_tests.c |   1 +
>  17 files changed, 1827 insertions(+), 333 deletions(-)
>  create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c
>
> --
> 2.53.0
>
>

1. The logical control-domain model looks useful. One domain can
represent a logical resource backed by multiple physical controllers.
RISC-V CBQRI has a similar model, grouping cache controllers by cache
ID and bandwidth controllers by NUMA node ID. It would be helpful to
keep this infrastructure generic.

2. Since MB and MB_NODE share the same NODE scope and ultimately
program the same memory-class MSC, would it be possible to use the
existing MB control with a discoverable NODE scope? If a separate
MB_NODE control and emulation mode are still needed, could you clarify
the userspace requirement for them?

Thanks,
Yunhui
