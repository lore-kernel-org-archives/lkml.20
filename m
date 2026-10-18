Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667AE27603F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366894; cv=none; b=TS5ividN1F4cqT6epqVpzoRDL9soeoYmcXy3fuBWEsTCJMB/rgC9vaA3BoCsMyF+etkHjSdjEkn8N8V9BCWbZw49KJP9Yw0VWixJHHGCR28UBwjKBf8AAYYUFiBAYfLsAK7YIAt/1664J+HXGY/8HrZqpziHEF4jQrVGBVlDjaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366894; c=relaxed/simple;
	bh=gZzqusSYxl/F2UWTapjq2TfhqTnudD78LUKEigHGrSc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=TYlncuMeNuIn8SYyFW6AR0ZPQCy0TpUhFE1oA9HAQk4pY3hTMUr5TICNeOUf4xVFA29AKIDIWp1SwNEZZmECUJ0iKi414Z1NiKcblcWZ7nVLwMj1/YFp31Y3La48uxwxiYQMTlzHNjiVdZgnwyDsbJ2TL/ZmycNV7vVDcJR3egM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZVlRYVYD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZVlRYVYD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c445c95d553so24190366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792366889; x=1792971689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQSL9UT79SNskKlHpdY9zNkjphoUnCVZs2IbU/Bmb9M=;
        b=ZVlRYVYDEq/i+dpNnx8oNUFDzvY2PTeIyABmdp8u6qRgHR+VQpmZBoC4YWhT+CpsIs
         QVpVd6s1wYSd886ocFH7EClkt5RxzaGscMD/ep5AtcALwHCe43KYHJvtKuBvMtnJug7a
         VcmPs/OqoFUXIOIrFRUkLnJTG9OJqwlEK47ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792366889; x=1792971689;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQSL9UT79SNskKlHpdY9zNkjphoUnCVZs2IbU/Bmb9M=;
        b=YZ1LJguQqlA4F+OIgf5e60uCYy7heREmlnL3ZvxMZEgbrXsAQJramgGnDwn3DJb++R
         lHb9WVidVwTsAqmmUKqBWlc4zIdVCeNUXsVW0zFy6y66fV+EFs9+kVmpYvbLtgOCia2K
         1UiqZHMqI1s+wuyq4bMGbKVnXps5Fv7wZ8vLaVwwtR9JRas8R5AZkxvBdAbcdTQnwFZo
         eJWYVZQzHyKALoUiNYXFw8An11KS02k5jdtyexDaHofWifpSx8wrXlUop1N4a9KhilXh
         RreCv4ztvsuXET+RXV9EH9f5JH4Ogz/PnluQvjdbnJljaZkFGU7fYXHy3XlXIITSuRJ0
         R0WQ==
X-Gm-Message-State: AFq9FYL4b9/YJEE5jkVA+9Ijc6pcKlvoELsXinCdgMDRSy4ME//ydURJ
	4QiHr7bE2MNJ5QKfAvRq+IPoLxPIluMy/QTSxG3XbXLkXib6cCMUja1GuDPRRsr9kbgCkP+T0sa
	Oyw4Nf6Q=
X-Gm-Gg: AYBFou33w25dTVH8Hvd/rFZg1zOAqvewOLI8kzfbl9JuxSm114wC3nf8xR7K3lr6pJ+
	uzNTgS8++IS3USEvVXegfYyQNXFndyPFlrn8BRZDrqXkIOYer8b3Dhwsqw+hBN+JkJEBHlWcPOo
	/SRMQ7f9IVkm6gm9ATjvcQZNY5MRg4nBgGHA0yYY4ssDnD1pzvb/mtlRbqf1cnLsxai6UdESuEF
	jTceoQqXdRtHgf6GbvYSUZ00V/9wZGYdSK7iDZqBEceDC34Fanu5To1MtYFCpXz3cboMYB/RBv6
	TgfhjjIMWads8h+J9L/XRwFL2Qf4Wraukjz7Otsn/61YYSlNLyCdW+fctfddyDY7xxkzQioZXnK
	P1XP0UGENq3WrU9Ko0z+M65dODtKg9HPx7jKJMAudYgwcVoYxru5ljLd3jdEgrtouNz1PTzklCW
	3u3h8UUUNNIPjwCtCbwGrH+WBzfHTerAZG5lHHmG59013HlcByZJMDnMdeCHkxp7P7OmEZogQqx
	+oPvQlPHCIhM1DWI7ewCezWYBomMqu+s0XpdMAZynIdTfbz
X-Received: by 2002:a17:907:d643:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c419f80267amr410981166b.38.1792366889351;
        Sun, 18 Oct 2026 16:41:29 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceb9dsm297237066b.24.2026.10.18.16.41.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 16:41:28 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c423b145922so107579266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:41:28 -0700 (PDT)
X-Received: by 2002:a17:907:7f90:b0:c42:73df:933b with SMTP id
 a640c23a62f3a-c4273dfaba5mr281779466b.12.1792366887749; Sun, 18 Oct 2026
 16:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 Oct 2026 13:41:11 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgwnBm2zDdRM7u016NVHkv9KqbZW7AZ=8wZrqGyv_V+5A@mail.gmail.com>
X-Gm-Features: AclHuK_N3QIbUCazhEYWfeHKS-8Vkgq4bwDTwb0SOSvt__d9VmnmxcNKlLpfX9Y
Message-ID: <CAHk-=wgwnBm2zDdRM7u016NVHkv9KqbZW7AZ=8wZrqGyv_V+5A@mail.gmail.com>
Subject: LInux 7.3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's Sunday afternoon, and this week I somehow kept my wits together
long enough to keep track of the day of the week, so the release isn't
randomly delayed. Will wonders never cease?

Anyway, nothing very special seems to have happened this last week, so
as expected the final 7.3 is out, and thus tomorrow the merge window
for 7.4 opens. Except I'm on my annual family vacation, so instead of
merging anything first thing in the morning, I'll spend most of the
day on a boat and under water. I'll get back to merging in the
afternoon, but I expect my schedule to be a bit unusual for a while.

I hope I can still complete the merge window in the usual two weeks,
but it may be that I'll end up with an extra week of merging just to
catch up.

Note that that extra week doesn't mean that I'll accept pull requests
that come in past the usual timing - the rules are still that what
gets merged should be ready *before* the merge window opens, not some
kind of late development *during* the merge window.  So don't try any
shenanigans.

Below is the shortlog for the last week of 7.3 development. It looks
fairly spread out, no real pattern to it: random fixes all over.

                Linus

---

Abdurrahman Hussain (1):
      i2c: xiic: restore non-managed runtime PM to fix clk WARN flood

Abel Vesa (1):
      i2c: qcom-geni: Restore the source-clock selection policy

Adriel Santos (1):
      pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12

Alexander Gruhlke (2):
      PCI: Ignore Immediate Readiness on Samsung 990 PRO and 990 EVO Plus N=
VMe
      PCI: Don't treat ~0 as ready in pci_dev_wait() with RRS SV

Alexandre Cassen (2):
      net/mlx5: HWS, release L2 to L3 tunnel reformats to their own pool
      net/mlx5: HWS, fix flow meter offset within its bulk

Alexey Charkov (1):
      power: supply: core: prevent unregistering a power supply while
a callback runs

Ali Ahmet Memis (1):
      tools/power turbostat: Read complete CPU lists

Allison Henderson (1):
      net/rds: don't let the rdma_cm destroy an id RDS still owns on
route failure

Amirmohammad Eftekhar (1):
      KVM: nVMX: Reset MMU back to the root MMU if loading L2 state
fails for !VM-Entry

Amit Machhiwal (1):
      tracing: Do not initialize tracefs work if tracing is disabled

Andy Yan (1):
      MAINTAINERS: update my email address

Antoine Huret (1):
      perf: Update cgroup time when rotating multiplexed events

Aohan Mei (1):
      net: rds: fix uninitialized trans dereference in CM event handler

Avi Weiss (1):
      ASoC: stm32: spdifrx: fix synchronization state check

Aviv Vaknin (1):
      pid_namespace: make zap_pid_ns_processes() freezable

Bartosz Golaszewski (3):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: kunit: fix GPIO device reference leak with __free()

Benjamin Cheng (1):
      drm/amdgpu/userq: actually validate userq BOs

Bommu Krishnaiah (1):
      drm/xe/oa: Zero OA buffer at allocation

Breno Leitao (1):
      MAINTAINERS: add Gustavo Luiz Duarte as netconsole reviewer

Carlos Jones Jr (1):
      spi: tegra114: assert CS GPIO for every transfer in a message

Cen Zhang (1):
      ocfs2/dlm: Protect the recovery list during debugfs reads

Cen Zhang (Microsoft) (1):
      watch_queue: Fix note pool publication race in watch_queue_set_size()

Christian Brauner (16):
      ext4: free the sbi after a grace period
      afs: free the super info after a grace period
      9p: free the session after a grace period
      eventfs: free the eventfs_inode after an rcu grace period too
      ipc: drop the mqueue mount with kern_unmount() on setup failure
      unicode: free the map after a grace period
      ntfs3: free the sbi after a grace period
      ntfs3: free replaced mount options after a grace period
      fs: drop the smp_mb()s that mnt_get_count() made redundant
      fs: pass flags to copy_fs()
      namei: test for a negative dentry the way traverse_mounts() does
      namespace: a mount that copy_tree() leaves out can't take over a lock
      fs: let idle threads share init_fs
      selftests/filesystems: test that a mntns file can't take over a lock
      eventfs: Free the eventfs_inode after an rcu grace period too
      Revert "namei: don't reveal overmounted entries in refwalk"

Christian K=C3=B6nig (1):
      drm/exec: don't immediately add prelocked obj to array of locked objs

Conor Dooley (1):
      riscv: dts: microchip: beaglev-fire: remove double definition of
gpio interrupts

Daehyeon Ko (1):
      sctp: revalidate output stream after association connect wait

Darrick J. Wong (1):
      MAINTAINERS: remove myself

Dave Stevenson (1):
      drm/vc4: hdmi: Move packet RAM enable to PM runtime

David Carlier (2):
      tracing: Take trace_types_lock when dropping the buffer_meta referenc=
e
      ring-buffer: Do not show buffer_meta for CPUs without a buffer

David Oberhollenzer (1):
      ARM: dts: ti/omap: dra7: fix PCIe PHY clock divider definition

David Yang (10):
      net: hisilicon: hisi_femac: Move setting of netops to fix crash
      net: hisilicon: hip04_eth: Move setting of netops to fix crash
      net: ethernet: actions: Move setting of netops to fix crash
      net: ethernet: adi: Move setting of netops to fix crash
      net: mv643xx: move setting of netops to fix crash
      net: au1000: move setting of netops to fix crash
      net: ethoc: move setting of netops to fix crash
      net: ethernet: aeroflex: move setting of netops to fix crash
      net: ti: icssm-prueth: Move setting of netops to fix crash
      microchip: lan865x: move setting of netops to fix crash

Dibin Moolakadan Subrahmanian (2):
      drm/i915/dmc: Harden DMC firmware payload parsing
      drm/i915/dmc: Add sanity check for DMC load address

Dmitry Kandybka (1):
      tracing: Fix ignored return value of resize_buffer_duplicate_size()

Dmitry Osipenko (1):
      Revert "drm/virtio: Add pixel blend mode property to cursor plane"

Dnyaneshwar Bhadane (1):
      drm/i915/cx0_phy: Fix ARL-S host bridge detection

Donggeun Yoo (3):
      tracing: Fix NULL dereference when copying keys for a field variable
      tracing: Fix the shift out of bounds in the log2 histogram modifier
      ring-buffer: Fix the sub-buffer array base in rb_meta_subbuf_idx()

EJ Campbell (1):
      x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context

Eric Biggers (2):
      lib/crypto: poly1305: Use memzero_explicit() in poly1305_final()
      lib/crypto: tests: Add Poly1305 split-update carry regression test

Erik Faye-Lund (1):
      drm/panthor: fix immortalis condition

Fran=C3=A7ois Roux (1):
      power: sequencing: qcom-wcn: power off WLAN at probe

George Moussalem (1):
      pinctrl: qcom: ipq5018: update PWM groups and corresponding pin funct=
ions

Gilberto Conde (1):
      pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13

Guanglei Zhu (1):
      ovl: reject lowerdir ending with unescaped backslash

Guangshuo Li (1):
      accel/rocket: clear rdev on device init failure

Guixiong Wei (1):
      perf/x86/intel/uncore: Fix DMR CXL CM invert filter

Hao Ge (1):
      tracing: Fix crash in print_graph_function_event()

Hardik Garg (1):
      mshv_vtl: Check per-CPU register page before mmap

Haris Okanovic (1):
      perf: Fix perf_pmu_migrate_context() leaving events behind

Heiko Stuebner (1):
      MAINTAINERS: Add myself as reviewer for the Rocket NPU driver

Hemanth Selam (2):
      Drivers: hv: vmbus: fix typo "substract" in comment
      tools/hv: fix typo "retrive" in comment

Hui Su (2):
      sched_ext: idle: Respect task affinity in restricted CPU selection
      sched/fair: Avoid overflow in place_entity()

HyeongJun An (6):
      ASoC: cs42l56: Put the Limiter Cushion control on the limiter registe=
r
      ASoC: cs42l52: Fix the NG Type Switch bit
      ASoC: pcm3168a: Fix the DAC zero flag polarity bit
      ASoC: max98371: Fix the Speaker DHT Min Volume bits
      ASoC: wm8978: Fix the 128x oversampling switch bits
      ASoC: nau8822: Fix the 128x oversampling switch bits

Igor Paunovic (2):
      accel/rocket: search every core slot when a core is removed
      accel/rocket: search every core slot when looking up a scheduler

Igor Velkov (1):
      net: stmmac: dwmac1000: clear the RGMII status interrupt

Jann Horn (2):
      KVM: SEV: Fix page dirtying in sev_gmem_post_populate()
      futex: Fix mm reuse handling for FUT_OFF_MMSHARED

Jason Gunthorpe (1):
      iommupt/kunit: Use if_changed_rule for the kunit

Jason Perlow (1):
      PCI/AER: Keep ANFE masked on Apple T2 Secure Enclave

Jesse Zhang (4):
      drm/amdgpu: don't drop the runtime PM reference twice in amdgpu_gpr
      drm/amdgpu: free the userptr ranges when a CS fails after parser_bos
      drm/amdgpu: report the BO alignment in bytes in GEM_LIST_HANDLES
      drm/amdgpu: keep the eviction fence until the last handle is closed

Jianfeng Liu (1):
      Revert "dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kerne=
ls"

Jiangshan Yi (1):
      x86/hyperv: Fix stale comments after stimer message mode removal

Jinhui Guo (1):
      soc/tegra: fuse: Add missing newline to APBMISC error message

Jinu Kim (1):
      KVM: x86: Use active memslots for the per-vCPU MMIO cache

Joas Antonio dos Santos (1):
      calipso: keep BIG TCP payload_len in calipso_skbuff_setattr()

Joerg Roedel (1):
      Revert "iommu/amd: Remove redundant check in irq_remapping_select()"

John Ogness (1):
      printk: Postpone kthread startup

Jon Hunter (1):
      soc/tegra: pmc: Fix uninitialised clock rate

J=C3=A9r=C3=A9my Jean (2):
      lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state
      net/sched: fix use-after-free in __tcf_action_put()

K Prateek Nayak (1):
      sched/core: Call wakeup_preempt() for queued tasks during class chang=
e

Karl Mehltretter (1):
      power: supply: Fix maintenance charge table kernel-doc

Kees Cook (2):
      x86/kcfi: Decode the kCFI check from the trap address
      x86/kcfi: Emit the FineIBT paranoid "cs" prefix as a byte

Keith Busch (1):
      nios2: fix __wsum type degradation in csum_fold()

Kenneth Feng (1):
      drm/amd/pm: add zero fan stop temperature support on smu 14.0.2

Kent Gibson (1):
      gpiolib: fix memory leak in gpiod_set_array_value_complex() on error =
paths

Konrad Dybcio (3):
      pinctrl: qcom: hawi: Fix intr_target_width
      pinctrl: qcom: maili: Fix intr_target_width
      pinctrl: qcom: qcs8300: Fix intr_target_width

Krystian Kaniewski (1):
      ring-buffer: Fix false warning in ring_buffer_map_get_reader()

Kuba Piecuch (2):
      sched_ext: Rename scx_reenq_wait_dispatching() to scx_wait_dispatchin=
g()
      sched_ext: Wait for SCX_OPSS_DISPATCHING before moving tasks off DSQs

Kyle Zeng (4):
      netlink: reset skb headers before unicast and multicast filtering
      pipe: preserve existing fasync readers on writer setup failure
      fsnotify: prevent mark additions during connector teardown
      netlink: avoid hashing the network namespace pointer

Laurence Oberman (2):
      scsi: st: Save the visited block for the partition the drive is in
      scsi: st: Fix use-after-free race between st_remove() and st_open()

Lee Jones (1):
      tracing/histograms: Reject non-stacktrace fields for synthetic
stacktrace fields

Len Brown (7):
      tools/power turbostat: Warn, but don't Err on out-dated perf systems
      tools/power turbostat: Sanity check GFX%rc6 and SAM%mc6 percentages
      tools/power turbostat: Fix fd_perf leak on reset
      tools/power turbostat: Fix CWF PMT off-by-one
      tools/power turbostat: Fix PMT error path fd handling
      tools/power turbostat: Fix add_counter issue if > 24 counters.
      turbostat 2026.09.28

Liam R. Howlett (1):
      accel/amdxdna: Fix Kconfig invalid configuration

Linfeng Sun (1):
      scsi: target: iscsi: Fix race in discovery auth updates

Linus Torvalds (1):
      Linux 7.3

Loic Poulain (1):
      i2c: qcom-cci: Fix HALT_ACK reset request being dropped

Long Li (1):
      MAINTAINERS: remove myself from the Hyper-V entries

Lorenzo Stoakes (ARM) (1):
      perf: Track the perf mlock gift separately

Lukas Zobernig (1):
      x86/insn-eval: Fix shadowed segment index in get_seg_reg_override_idx=
()

Marc Kleine-Budde (2):
      spi: spi-fsl-lpspi: pass struct fsl_lpspi_data instead of struct
spi_controller if possible
      spi: spi-fsl-lpspi: directly return ret in fsl_lpspi_transfer_one()

Mario Limonciello (2):
      pinctrl: amd: Clear S4 wake bits when firmware has _AEI
      ASoC: amd: yc: disable MSI on resume

Mark Brown (1):
      regmap: irq: Free the irqdomain we create

Martin Kaiser (1):
      tracing: probes: error if BTF is required but unavailable

Michael Kelley (2):
      x86/hyperv: Avoid using per-cpu output page in hv_apicid_to_vp_index(=
)
      Drivers: hv: Don't reset VMBus connection state on error/exit paths

Michael Reeves (2):
      regmap: Remove debugfs before cache teardown
      regmap: Drop map lock during cache init and exit

Michal Luczaj (1):
      vsock: treat TCP_CLOSING as once-established

Mikhail Gavrilov (1):
      entry: Account the deferred hrtimer rearm as hardirq context for lock=
dep

Ming Yu (1):
      gpio: nct6694: Mark the GPIO controller as sleeping

Muhammad Mahdi Amirpour (1):
      printk: fix kernel-doc name for nbcon_write_context_is_braille

Naman Jain (1):
      PCI: hv: Probe vPCI buses asynchronously

Naveen N Rao (AMD) (1):
      KVM: SVM: Clear AVIC Physical ID table entry if vCPU creation fails

Nickolai Zeldovich (1):
      exit: fix lost-update race on the child_subreaper bitfields

Nicolai Buchwitz (1):
      net: bcmgenet: unshare the skb before writing the control block

Niranjana Vishwanathapura (1):
      drm/xe: skip eviction of a BO with no resource

Pablo Mazzini (1):
      pinctrl: sunxi: dt: do not accumulate npins across probe attempts

Paolo Bonzini (1):
      KVM: x86/mmu: Cope with the SS bit being set in #NPF exit codes

Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in mem-reclaim helper

Peng Fan (4):
      gpio: mxc: fix race between chained IRQ handler install and
probe completion
      gpio: mxc: fix both_edges bit operations
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: fix race between gpiochip registration and IRQ domain setu=
p

Pengpeng Hou (1):
      ARM: configs: sama5: enable current Microchip KSZ DSA symbols

Perry Yuan (3):
      drm/amdgpu: fix sched entity leak in ttm buffer entity init
      drm/amdgpu: destroy mutex when tearing down ttm buffer entity
      drm/amdgpu: fix GEM object leak on ENOMEM in userptr ioctl

Peter Ujfalusi (2):
      ASoC: SOF: ipc4-topology: Fix shift-out-of-bounds for aggregated
ALH capture
      ASoC: SOF: sof-client: Use event-handler mutex consistently

Petr Mladek (1):
      nbcon/reboot: Switch NBCON consoles into the emergency mode in
emergency_restart()

Richard Leitner (1):
      spi: imx: fix slab corruption from undersized DMA bounce buffers

Sahil Chandna (1):
      PCI: hv: Warn when wait_for_response() waits indefinitely

Sasha Levin (3):
      bootconfig: give the footer size static_assert a message
      tools: gpio: fix building from the top level with O=3D
      samples: pidfd: fix userprogs typo

Sean Christopherson (2):
      KVM: SVM: Add paranoid helper for checking if vCPU is AVIC-addressabl=
e
      KVM: SVM: Use "is AVIC-addressable" helper to sanity check load()/put=
()

Sergey Tiraspolsky (1):
      ASoC: Intel: avs: Reset the stream unless it is already prepared

Shawn Guo (2):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
      pinctrl: qcom: spmi-gpio: make direction changes exclusive

Shawn Lin (1):
      PCI: dw-rockchip: Move INTx IRQ setup to probe

Srinivasan Shanmugam (1):
      drm/amd/display: Fix NULL sink dereference in USB4 bandwidth function=
s

Stanley Jhu (1):
      scsi: bsg: Pass reply_len to bsg_setup_queue() to fit UFS ARPMB repli=
es

Sung Byeongchan (1):
      autofs: ignore notification errors from a replaced pipe

Svyatoslav Ryhel (1):
      power: supply: generic-adc-battery: Fix temperature IIO channel conve=
rsion

Taeyang Lee (2):
      tracing: Keep the predicate limit separate from program capacity
      tracing: Check operator stack capacity before pushing

Takashi Sakamoto (1):
      firewire: core: fix race condition in split transaction handling

Tejun Heo (4):
      sched_ext: Fix stall when a task enqueued with SCX_ENQ_LAST
lands back on its CPU's local DSQ
      sched_ext: Fix use-after-free of a destroyed user DSQ by a
deferred reenqueue
      sched_ext: Propagate every bypass depth change to the descendants
      sched_ext: Fix the bypass dispatch claim for schedulers bypassed
by an ancestor

Tengda Wu (1):
      tracing: Fix hist trigger timestamps for buffered events

Thierry Reding (4):
      arm64: tegra: Add PWM controllers on Tegra264
      arm64: tegra: Add PWM fan on Jetson AGX Thor DevKit
      arm64: tegra: Reorder reg and reg-names to match bindings
      arm64: tegra: Add PCIe root ports on Tegra264

Thomas Hellstr=C3=B6m (2):
      drm/xe: Don't transfer shrinker pages for pinned bos on
purgeable state change
      drm/xe: Bump LRU for external objects on exec and rebind

Timur Krist=C3=B3f (2):
      drm/amdgpu/uvd3.1: Fix checking whether UVD firmware keyselect
was already set
      drm/amdgpu/sdma3: Work around POLL_REGMEM / FENCE hang

Toke H=C3=B8iland-J=C3=B8rgensen (1):
      wifi: atk9k: Revert "wifi: ath9k: reject short WMI command responses"

Vincent Donnefort (5):
      tracing: Fix empty symbol names in simple_ring_buffer undef check
      tracing: Fix simple_ring_buffer undef check on parisc
      tracing: Fix simple_ring_buffer undef check on sparc64
      ring-buffer: Skip si_mem_available() for persistent and remote buffer=
s
      ring-buffer: Use subbuf_order in available memory estimation

Waiman Long (1):
      Drivers: hv: Avoid infinite retry loop in init_vp_index()

Wei Liu (1):
      MAINTAINERS: drop KY from Hyper-V maintainers list

Wentao Liang (1):
      i2c: viai2c-wmt: Fix clock leak in wmt_i2c_probe()

Xingui Yang (1):
      scsi: libsas: Fix SMP IO deadlock during HA resume

Xueqin Luo (2):
      power: supply: max17042_battery: Fix vmin assigned instead of
vmax in DT parsing
      power: supply: ds2780: Fix ds2780_get_capacity() returning raw value

Yehyeong Lee (4):
      scsi: xen/scsifront: Check for a NULL shadow entry on a backend respo=
nse
      scsi: libiscsi: Reject a negative task index from parse_pdu_itt
      scsi: libiscsi: Validate the ITT reflected in a Reject PDU
      scsi: libiscsi: Validate the task named by a management response

Yu Zhang (1):
      scsi: target: Disable interrupts while holding delayed_cmd_lock

Yuho Choi (1):
      drm/virtio: Reset device before deleting virtqueues on freeze

Zhangfei Gao (1):
      pinctrl: qcom: nord: fix GPIO interrupt target width

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

longlong yan (1):
      tools/power turbostat: add NULL check after calloc()
