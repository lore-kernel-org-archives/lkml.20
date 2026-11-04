Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810950;
	b=gvATIomOi2LHNeIDa2Vtksnwg1JPr++N1namH5BBjItbVnOxp7IOoriRjSm6PmWUZNVO
	 jjd2Lk7zEGMO/dZHasLgGUnJKDywR/z23rH2lycHmdTbswBCUZ2mDhUfmtu7TBj81TZ9W
	 zu2TJPwnB6B9EjW06xkOB1crfaq6Pq5n1qxJbljV67htuM1/SZvU2ksGXJQSyi+3kDBla
	 MnMAXXpSvCMyyhCDzwZLVS4zyDefGkBGACjfpMpC3NO3NEww4lovFiVCiHT4P+CqHDQt7
	 YnlCJKoTIEVwadlLHTmGkE/d5/5n97TceGWUniXQfBreVWta/xiyGrVy8Lym1fF4eFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810950;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PR78OQZC44oMlK/XYpGZK5bYpp3zEZMsfPXrs3c5Gsg=;
	b=Yp6FgQXOoF8EgpkPGYGLHJ85g5W1U90wM59pmMZ6ccav9tRLnGAZHKSuRoaLOccm1B/s
	 fGNhvI0I4mwIierF8o4RwFpZLrTg/wyeAgytyLv8YjZWRkP62+OlJONoFR/Rc/qVloOnI
	 7mzs9rKoN5dDotP6jmYKFntQhzrJB5giWvHzpzXUErdX7DktydrTAj2YuaTuYdyzTJRbb
	 XXsKNGMKsSiQebsPrRvi/YypwWmdQzkrfv8zH7XiNQTE8pIzWqqicYVuOYAjIi6u1hodO
	 DseKrEQv46OVVwzz6gfV/zbIGVPgGPhxsk79U74x4A4rPw48KMqrhNo32h24dBgfOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epiWhkPW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4AF606A33A;
	Wed,  4 Nov 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=epiWhkPW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BAE1F0093A;
	Wed,  4 Nov 2026 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810950;
	bh=PR78OQZC44oMlK/XYpGZK5bYpp3zEZMsfPXrs3c5Gsg=;
	h=From:Subject:Date:To:Cc;
	b=epiWhkPWKt7xxdbI+e/n5TYXQcyOzBijjdRrkXt/Xk4N0TfRC3vpPz3XLeYo9nWV/
	 q0uA125dERaUHGGJ7n8gprIB3De5kekhrRO5tgQUPBt9BrESRHMQW6m99i0vGDB50m
	 Y8J5zGMy9F/AshgYwhXlCEqP4xCnIcc6cZwX0o7ANJFc3tZnsjdGAROzfb2poCIDGi
	 a8jAZM+ov1nby2BUVI1W+c4H9M0wKaMNZyH5uTCjyjzHn2Hu8SYxaAwtxcK3hIvb+x
	 JaxiQKar4E/g5Vfq4C6rftXr7QSuEUOfsxa9/C2wSZJo/3JbZjMUkSVZI7nZMdE1wa
	 8R96NJ4KmQoqw==
From: Drew Fustini <fustini@kernel.org>
Subject: [PATCH v10 0/6] riscv: Add initial CBQRI resctrl support
Date: Wed, 04 Nov 2026 08:35:17 -0800
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVe62oC/33RzU7EIBAH8FfZcBYzDJQPT76H8dDCsItuWm27j
 Waz7y5do9tI5Dhk+P2Z4cwmGhNN7GF3ZiMtaUpDnwsBdzvmD22/J55CPmAIqEEL4CGepjn1ibf
 zkU+e++59TDzMXAnwltAIEQLL199Giunjaj89f9fTqXshP6/e2nFI0zyMn9fwRax9PzHu/5hFc
 OBkXGsMyth28PhKY0/H+2HcszVnwY2EqiJhljBaUC4GB9gVktxKtiLJLHnnhVQYSfpYSOomGdA
 VSV2na3xuBRG0KqRmI4nadE2WOmjJkPNOIhWS3khY27jOkvGIHTRBaVHuydwkB6IimXVPLTrZB
 NtoxEKyG0mYimTXNzmtyAYjI9lCcr+SAJAVyWWpwRhsR86GP393uVy+ANsx2eEkAwAA
X-Change-ID: 20260610-dfustini-atl-sc-cbqri-dt-410c8e2711dd
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15200; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ykaJ8pgqtZo3KUkr1vCFAADY30pmnu1knDmA2iavmZk=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmI4pvXrQmiHcHLvrFvfu6ctknqssHm2tnWCmpL+f
 a/pnaczOkpZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATWZ3ByDBj95s+vZM7r1c8
 DvQJ2KZteshAceu0xIU743yfdlxepfuNkeH1GZeS1Tolcf+T1nz1LfjM+OjYjLm5dclfcqr/i4g
 t1GcGAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

This series adds initial RISC-V QoS support through the CBQRI
controller interface [1] integrated with resctrl [2], plus a DT-based
platform driver for cache controllers. It builds on the Ssqosid
extension [3] (srmcfg CSR) support that landed in the v7.3 merge
window. It has been tested on both the Tenstorrent Ascalon Shared Cache
controller and a QEMU implementation [4].

  qemu-system-riscv64 -M virt,aia=aplic-imsic -nographic -m 1G -smp 8 \
      -kernel arch/riscv/boot/Image \
      -append "root=/dev/vda ro console=ttyS0 rootwait" \
      -drive if=none,file=rootfs.ext2,format=raw,id=hd0 \
      -device virtio-blk-device,drive=hd0 \
      -device riscv.cbqri.capacity,max_mcids=256,max_rcids=64,ncblks=16,mmio_base=0x04820000

Cache allocation can be exercised on the booted system. Mount resctrl
and read the default schemata. The L2 controller has 16 capacity
blocks, so the default capacity bitmask (CBM) is 0xffff:

  # mount -t resctrl resctrl /sys/fs/resctrl
  # cat /sys/fs/resctrl/schemata
  L2:0=ffff

Write a narrower CBM to a new control group and read it back to confirm
the L2 controller applied it:

  # mkdir /sys/fs/resctrl/group0
  # echo "L2:0=ff" > /sys/fs/resctrl/group0/schemata
  # cat /sys/fs/resctrl/group0/schemata
  L2:0=ff

Note that this series only implements support for resctrl L2 and L3
cache resources using CBQRI capacity allocation control. cc_block_mask
maps onto resctrl's existing cbm schema. However, cc_cunits is not
supported as there is no existing equivalent for capacity units in the
resctrl schemata.

I previously iterated on an RFC series [5] that implemented all of
CBQRI, including capacity monitoring, bandwidth allocation and
monitoring. The bandwidth controls for CBQRI do not fit well into
resctrl's existing throttle-based MB schemata. I believe that the path
forward is Reinette's generic schema description proof of concept [6].
My plan is to rebase the full support of CBQRI onto the generic schema
once it is ready.

Tony Luck's AET series [7] replaces resctrl_arch_alloc_capable() and
resctrl_arch_mon_capable() with generic helpers that walk the resources.
This series keeps the two hooks because resctrl on v7.4-rc1 still
calls them, and answers the alloc hook from rdt_resource::alloc_capable
so whichever series lands second only has to delete them. If the AET
series lands first, the CBQRI glue will also need the three arch hooks
it adds, resctrl_arch_system_max_rmid_idx(),
resctrl_arch_get_num_rmid_idx() and resctrl_arch_unmount().

[1] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
[2] https://docs.kernel.org/filesystems/resctrl.html
[3] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
[4] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
[5] https://lore.kernel.org/linux-riscv/20260601-ssqosid-cbqri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org/
[6] https://lore.kernel.org/all/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/
[7] https://lore.kernel.org/lkml/20261019205031.16977-1-tony.luck@intel.com/

Changes in v10:
---------------
- Drop the claim that resctrl calls resctrl_arch_mon_ctx_alloc() without
  checking for monitoring. (Reinette)

- Have resctrl_arch_reset_all_ctrls() reuse cbqri_init_domain_ctrlval()
  instead of open coding it. (Reinette)

- Reword the comment in cbqri_init_domain_ctrlval() that spoke of
  staged slots, which belong to resctrl. (Reinette)

- Leave a CPU out of a cache level when its domain cannot be created
  instead of failing the CPU online. (Reinette)

- Add me as a reviewer for resctrl in MAINTAINERS. (Reinette)

- Fix the binding to require a vendor-specific compatible for bandwidth
  controllers. (Conor)

- Reject a capacity controller that reports a cc_capabilities version
  above 1.0. (Radim)

- Change register mapping to devm_platform_get_and_ioremap_resource()
  and add the base to cbqri_controller_info. (Sunil)

- Rename riscv_cbqri_register_cc_dt() to riscv_cbqri_register_cc() and
  add cache_level to cbqri_controller_info. (Sunil)

- Use __free() for cbqri_controller and move the rcid_count check
  before the allocation in riscv_cbqri_register_cc(). (Sunil)

- Make the controller list and its lock static in cbqri_devices.c and
  add cbqri_get_controllers() for cbqri_resctrl_pick_caches(). (Sunil)

- Rebase onto v7.4-rc1, which resulted in:
  - Add resctrl_arch_preconvert_bw(), which resctrl now requires.
  - Remove Assisted-by: LLM. I used Claude to review and improve the
    code in this series, but checkpatch no longer allows the tag.

- Sashiko review of v9:
  https://sashiko.dev/#/patchset/20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org

- Link to v9:
  https://patch.msgid.link/20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org

Changes in v9:
--------------
- Key the binding's required-properties block on
  riscv,cbqri-capacity-controller instead of the Tenstorrent compatible,
  so a capacity controller from any vendor listed in the enum must carry
  riscv,cbqri-rcid and riscv,cbqri-cache.

- Drop exposed_alloc_capable. resctrl_arch_alloc_capable() walks
  rdt_resource::alloc_capable and cbqri_resctrl_teardown() clears it,
  the same answer as the generic resctrl_alloc_capable() in Tony Luck's
  AET series, so removing the RISC-V hooks on top of it is a pure
  delete. (Reinette)

- Comment on resctrl_arch_get_num_closid() explaining why the CDP
  halving in fs/resctrl is not needed for CBQRI but harmless. (yunhui)

- Keep every capacity controller accepted for a cache level and have
  the cpuhp online path look the CPU's cache id up in that set instead
  of walking cbqri_controllers again. A controller registered after
  resctrl is set up is ignored, and a CPU whose cache has no controller
  in the set is left out of that level with a one-time warning. This
  replaces the attach-time capability check mentioned in the v8 Sashiko
  reply. (Reinette)

- Read the RCID count from the resource in both the per-domain init
  and the reset-all path. (Reinette)

- Call resctrl_init() after cpuhp_setup_state(), as x86 does. A failure
  there unwinds with cpuhp_remove_state(), so resctrl_exit() is no
  longer called. (Reinette)

- Pass the list position found by cbqri_find_ctrl_domain() to
  cbqri_create_ctrl_domain() instead of searching the domain list a
  second time. (Reinette)

- Sort the riscv_cbqri.h include alphabetically. (Reinette)

- Reject a second controller for the same cache level and cache id at
  registration with -EEXIST, since the resctrl glue keys its domains on
  the cache id.

- Warn when cc_capabilities reads zero instead of skipping the
  controller silently.

- Sashiko review of v8:
  https://sashiko.dev/#/patchset/20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org

- Link to v8:
  https://patch.msgid.link/20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org

Changes in v8:
--------------
- Write cc_block_mask and cc_cunits only after the BUSY bit in
  cc_alloc_ctl reads 0. A controller that timed out on a previous
  operation and then recovered could otherwise apply the previous mask
  to the new RCID.

- Reword the cache allocation patch to say that controllers at one
  cache level must report the same number of capacity blocks, since
  resctrl exposes a single capacity mask per resource. No code change.

- Sashiko review of v7:
  https://sashiko.dev/#/patchset/20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org

- Link to v7:
  https://patch.msgid.link/20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org

Changes in v7:
--------------
- Drop the three Ssqosid patches (dt-bindings description, extension
  detection, and srmcfg CSR support). They are in mainline as of the
  v7.3 merge window, so this revision is just the CBQRI driver, the
  resctrl glue, and the CBQRI binding.

- Rebase from next-20260713 onto v7.3-rc1. The five remaining patches
  are otherwise unchanged from v6.

- Sashiko review of v6:
  https://sashiko.dev/#/patchset/20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org

- Link to v6:
  https://patch.msgid.link/20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org

Changes in v6:
--------------
- Introduce the RISCV_CBQRI Kconfig if/endif block in the patch that
  adds the RISCV_CBQRI_CAPACITY option it guards, rather than as an
  empty block in an earlier patch.

- Note in cbqri_probe_cc() that the 32 capacity block limit comes from
  resctrl representing the CBM as a u32.

- Sashiko review of v5:
  https://sashiko.dev/#/message/20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org

- Link to v5:
  https://patch.msgid.link/20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org

Changes in v5:
--------------
- Resolve control domain membership from each CPU's cache id in
  cacheinfo at hotplug, instead of a CPU mask captured at probe.

- Add and remove control domains on the ctrl_domains RCU list
  following the documented traversal rules.

- Restructure cbqri_resctrl_pick_caches() to select one controller per
  cache level, which removes the separate dropped[] array and the
  overloaded NULL controller pointer.

- Initialize the control domain's resource id.

- Drop the inaccurate comment above the stubbed resctrl_arch_*()
  operations.

- Sashiko review of v4:
  https://sashiko.dev/#/patchset/20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org

- Link to v4:
  https://patch.msgid.link/20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org

Changes in v4:
--------------
- Register the srmcfg PM notifier even if cpuhp_setup_state() fails in
  riscv_srmcfg_init(). The early return on failure had skipped it,
  dropping the srmcfg restore across suspend and resume.

- Make RISCV_CBQRI a user-selectable option that depends on
  RISCV_ISA_SSQOSID, instead of being selected unconditionally.

- Bound the per-domain control value init by the domain's own
  controller's RCID count rather than the resource wide count.

- Drop only the affected cache level when capacity controllers at the
  same level report mismatched capabilities, rather than aborting the
  whole resctrl setup.

- Use guard(mutex) instead of lock/unlock for cbqri_controllers_lock.

- Read the CBQRI control registers into low and high halves so the
  access order is explicit and comment on torn reads.

- Clarify in cbqri_resctrl_pick_caches() that the first matching leaf is
  correct for a unified shared cache.

- Link to v3:
  https://patch.msgid.link/20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org

- Sashiko review of v3:
  https://sashiko.dev/#/patchset/20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org

Changes in v3:
--------------
- riscv,cbqri.yaml:
  - Require a device-specific compatible so a bare generic compatible
    is no longer valid on its own.
  - Rename node name from cache-controller@ to qos-controller@
  - Rename compatible from tenstorrent,ascalon-sc-cbqri to
    tenstorrent,ascalon-shared-cache-controller

- Take cbqri_controllers_lock in cbqri_attach_cpu_to_all_ctrls() so a
  controller probed after boot can't corrupt the cbqri_controllers list.

- Revise comment above riscv_srmcfg_reset_cache() to clarify that the
  teardown callback is not relied on. The cpuhp startup callback re-arms
  the per-cpu sentinel, which forces the csr write on a re-onlined CPU.

- Drop the memory fences around the srmcfg CSR write on context switch.
  Ssqosid does not require the ordering. The brief tagging inaccuracy at
  the switch boundary is acceptable for QoS.

- Access the CBQRI controller registers with 32-bit reads and writes.
  The spec only guarantees single-copy atomicity for 4-byte accesses.
  This also removes the dependency on native 64-bit MMIO.

- Program cc_cunits to 0 before a config limit operation on controllers
  that support capacity units, so a stale unit limit does not constrain
  block-mask allocation.

- Link to v2:
  https://patch.msgid.link/20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org

- Sashiko review of v2:
  https://sashiko.dev/#/patchset/20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org

Changes in v2:
--------------
The changes in this revision address the Sashiko review of v1.

- Restore the srmcfg CSR for the current task on CPU_PM_EXIT and
  CPU_PM_ENTER_FAILED, so it is not left configured incorrectly until
  the next context switch.

- Serialize the cbqri_controllers list insert and the boot time walk
  with a mutex, so an asynchronous driver probe cannot corrupt the list.

- Skip a controller at an unsupported cache level instead of aborting
  resctrl setup, so valid L2 and L3 controllers still register.

- RISCV_ISA_SSQOSID selects ARCH_HAS_CPU_RESCTRL and RISCV_CBQRI
  together, so no intermediate commit enables RESCTRL_FS without the
  CBQRI resctrl glue.

- Rename the RISCV_CBQRI_DRIVER to RISCV_CBQRI, since it builds the
  CBQRI core ops and resctrl integration rather than a driver.

- Drop the RISCV_CBQRI_DRIVER_DEBUG Kconfig option and rely on dynamic
  debug to control the pr_debug() output.

- Note: Sashiko flagged the lack of suspend/resume state restore. I will
  not fix that as register state is only lost when the power domain is
  gated, which offlines the harts sharing the cache. resctrl reprograms
  the default capacity mask through the normal control domain online
  path on resume.

- Link to v1:
  https://lore.kernel.org/all/20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org/

- Sashiko review of v1:
  https://sashiko.dev/#/patchset/20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org

---
Drew Fustini (6):
      riscv_cbqri: Add capacity controller core
      riscv_cbqri: resctrl: Add cache allocation via capacity block mask
      riscv_cbqri: Make RESCTRL_FS available on RISC-V
      dt-bindings: riscv: Add binding for CBQRI controllers
      riscv_cbqri: Add CBQRI capacity allocation platform driver
      MAINTAINERS: resctrl: Add myself as reviewer

 .../devicetree/bindings/riscv/riscv,cbqri.yaml     |  98 +++
 MAINTAINERS                                        |   8 +
 arch/riscv/include/asm/resctrl.h                   | 149 ++++
 drivers/resctrl/Kconfig                            |  30 +
 drivers/resctrl/Makefile                           |   5 +
 drivers/resctrl/cbqri_capacity.c                   | 131 ++++
 drivers/resctrl/cbqri_devices.c                    | 562 ++++++++++++++
 drivers/resctrl/cbqri_internal.h                   | 114 +++
 drivers/resctrl/cbqri_resctrl.c                    | 823 +++++++++++++++++++++
 include/linux/riscv_cbqri.h                        |  49 ++
 10 files changed, 1969 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260610-dfustini-atl-sc-cbqri-dt-410c8e2711dd

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>

