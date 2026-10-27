Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118936;
	b=XmO6bBfIZVwdz9khunPrSDkVWokORfrU+xiWW1Dh3+gmXaJiREXdY4S9URuLaGl9ESiJ
	 Uq2ISX7hrrVK/Td4yRf3dR1Ude4gLmDcax7w0iwDvFOqroqGMv3nCem8PJuyjTBE2XWqy
	 GPULPtLsZZQMyhclpQesRJx2yuWDBnuv039o1Y+YOeH3/G81T/ZKzrpklCLrwwGw7WPPw
	 8SrrdGH2GhCV+Lm2BViZ/IkEJZ/pEyGA+cNW//a6UohsUwcCuLmAMoD287oyjjWCP0u1J
	 hmnye8OeuMsYwYdz+j0c4o2LcHF5eIG0q52VMBKWx6tE6ywBlIV/u8tXGL3rmwtGA3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8zfsEmvvEIyKGYebqHsmSSP0PgqljQxJolIvgr8S9M8=;
	b=s2trgTGP9yZrTyGbQ6aGvV6ftXF6zFcvyGZ/ibQeLPxa8uRxGxapO0NaFLAY+VYQlikN
	 HZyPMljDnROeJhZXhfmR7jgtUhUnwbwWm6lJ8XZk2MNqU9bAwVmXuoj+FFjUSex1QsztG
	 uAlgrrVEHWjlg3h48xYfjGpIQZhn/MUWpuUc9IHOJy1Uy8G8gXAUXpdBRhYiuuCYJlrms
	 NzV23M/gspBkidyOTSjrdPCpqqibqGvfGOxG6keIQWZhBOKwaesUImprLtmfQj/JgbEUH
	 MIgj57RJtDll4xjrLw8Xb+m5wuDD7F4A++7ytcLKAp3Yj0dxTXL+NGLXv9CfKyPpD+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plt7RT+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.64
Received: from mail-lr2-f0.google.com (mail-lr2-f0.google.com [74.125.230.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41343606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41343606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plt7RT+r
Received: by mail-lr2-f0.google.com with SMTP id 38308e7fff4ca-3ab1cf59ff4so27110491fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118933; cv=none;
        d=google.com; s=arc-20260327;
        b=HUmsD48zzViXUusPWMbYRdDugPu5Wx1M6k6qPY13dJEFHPYWSrD+9h6VHwbqRiht4W
         GTxKSBrnZIbWnGDrEEfbJHt04ASa1fGSj6ridgEeZYav/YMLbAO0GEDIUcRCTGJUzxKF
         AuG2lfbpRBizksjpHrOkeVyOdWDuh6ulJ+vj42vEHzpJhWsahIemrvCQiAnL9iWqp0ct
         0WS1bHLcx+lvR6ICU1r0en+jJqHI3OSfvyvoXKKtbxkh9J+XlIwhbDdZb3450txLzRdX
         9ZOB6Fj/2ZUHzQI8Wunu6HhdIkPodZUltLPM3YCrP+LvcjP74H5nqZhyOxHqMh4/hq4N
         5szg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8zfsEmvvEIyKGYebqHsmSSP0PgqljQxJolIvgr8S9M8=;
        fh=21n/M5Del64J/QLa7PFFiBJVsRrlISaCxEDGxeLZZs4=;
        b=GL1maGElP8RQ6yRqz5I28VkrvJ5yeO73N4kl5Hee1yg+wdlncYjSHtZI3GkeFX48uX
         xkf5LQT7h3JLe/pLoX1q9/xQq5mnWJwTcCvnAvUFaSTZSSToS3q+r8P1XMV7qVWtcwcV
         6OTsGHWjlaAa0thcbY0LteZlkRz7H7k+8NqYXhTmzRdeaQu/dIuLvnhwRwoZhwjTX7Fi
         Poau00lroFzJRhYIJA/8URHLBWL85o7yvCIi6fQ95xBn2ji/d6L4ukpJn42mM4Y9GD2T
         65qbldGxPZhRkeedHW7W82ni4YI71UDso0ZyLkenxyQkq5wKjVw1+AgpX9rrjsjOnahB
         WjUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118933; x=1793723733; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8zfsEmvvEIyKGYebqHsmSSP0PgqljQxJolIvgr8S9M8=;
        b=plt7RT+rReO1uv3DGoqtn5hgid4k6TW055WTECby5G3CxTpjrleAcNMeYuiNbbNwQk
         Uy0soNopyCpLowEY3e9sIS568TX3wvGjidJcuKxNus1h5KSTT1o6ECpfP77rggUgunVD
         xKDFP4KU05cYXbIetEKVvaCS0b619SdrgovzNm6FdBPCBt0jZWsd565ulgJEnvgaY3qO
         dbMp6TUMhwXyXeDc3UOnYJqf2Y6TQzTp9jlDCaK5EX/1PwfHOzdk6Mc7GGmr0Lvn3957
         78PyQCnu4aLn5rVOQSWAxr4hQa0GOXSxJo6teP0Nugk4j8OwLijDJgx3WjamAvg7p72N
         16Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118933; x=1793723733;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8zfsEmvvEIyKGYebqHsmSSP0PgqljQxJolIvgr8S9M8=;
        b=opOdz3XOmKmwIIgBgwmgfanVdLSwcjuPeUKf+f6BbmaofHZ8SIHpa81ImIa3GTZy5X
         9N4CCKH7YCydd2KmQ+hs16xt6j5Unwys9yymlzNWDuV9JMB0f6lz4qA6aEwfUeCrR9hO
         wOfOTIUxL6XMsgfYlcMMID8P51+j2RzGhJ6YbmzyAw9A136qaleJcT9voCD22lgbT+55
         jm2Nkm5sGRQoTvZY26Ooup93VETyn9pmnGLXplSQU5gpLdhVQ4zAKr2wOwYIvhx7lOJL
         2AmvZry8705eMhce2eIfSVTFunxnORpaacDHCaGDXEsNbNCswwoGKNF3ZsiSA0/63L0E
         ZBQw==
X-Forwarded-Encrypted: i=1; AKwUvBwa8AeVeXHsk4n5s7yo0NZLepBv1YcZPwjEGMkJsfKagAqdIvOa+HeasD6erRB28fgb+6SOJsTToCXruRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfNeVtDzPXZo93vZTQZTh/atwgCGOZ8STrHQ3jfFJ3LZNQdaTj
	YffCeiZKXxphkdJgVyW3Bv/Y35XDEZVUnNkVLb82InUv8GED4rPdmyr6g/9+uplmhZVDKJKh1ib
	KWx1yRPgHOdT7qMRmWxG8veO7N2NFdUkJt4riheOGSLlictWe3g==
X-Gm-Gg: AYBFou2+pwcyAQnn/t5QTkt23FA+CnSIflkuryHJ/L/EiGYKimEW19Y0lr8b2/O3rE5
	EIkdIDQy3DfnTKIT3P6/QurFK187D1ip6JW2ZKt+9MmHy1kmjEH0qk+numSb/inha0hhWFZ6zMy
	Dj1Z9MQ1VNuly0ahYmByBijc2yUdRHcccXuVm2DS3qhAhh1aDxSWiCzXbrqxX2GPU2FcnnZ56c1
	dVzBiaJ6zN7NcCUWFG/lP0z9Syfm09DOomi81lSSpk2ZEnBdYQZ0FEmgEUn1XGdO/EmlRY5gy4w
	4hoRAWiyqOc45qKzsAVdiinqjBFB+C0FC+7IGexeD2uDzWrlbbSe2e/XxWdRQ7J0CDdoAPoxxot
	NK5nvrFaVsZWQT4U4OpKu0FmvGXFKN0qf9fU=
X-Received: by 2002:a05:651c:a324:b0:3ab:1639:9a79 with SMTP id
 38308e7fff4ca-3ac6fd0d6bcmr26637271fa.15.1793118933187; Tue, 27 Oct 2026
 09:35:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Wed, 28 Oct 2026 00:35:20 +0800
X-Gm-Features: AclHuK-V9AfE3y9zpjFZtwNjnX9zkj6jNEXo9wHFvEsgWVBRge4G6NUXSzqXSk0
Message-ID: <CAO-4RZ2jOonxsnfq5RtzaTVARqHw_4s0X1yMZiEvG-h=ZFEWfg@mail.gmail.com>
Subject: [BUG] xfs: undersized log triggers assertion in xfs_log_mount()
To: cem@kernel.org
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Carlos,

Replaying the syzkaller recipe linked below triggers an assertion in
xfs_log_mount(). The log size check reports 516 blocks, below the required
minimum of 636 blocks.

Is this an expected assertion with my XFS debug configuration, or should this
malformed image be rejected without triggering a kernel BUG?

I am reporting an observable assertion with a deliberately malformed XFS
image. I am not claiming a new vulnerability or a specific root cause.

Environment
-----------
- Kernel used for the actual reproduction: 7.3.0-kernsight-kasan #1 SMP
  PREEMPT_DYNAMIC, x86_64, KASAN/KCOV. Source: mainline Linux v7.3, commit
  091b06388b117fefdcb63336ac09956a4914b961 (release tarball sha256
  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953).
- Original report: 7.1.3-kernsight-kasan #13, commit
  113be0295f4f632d61f4e9c93322f70e2365f54d (the tree is not a git checkout).
- Also reproduced on 7.2.11-kernsight-kasan, commit
  8316c24ec1b77dba19ba072ca4fe251b36dc65d3.
- XFS config (7.3.0): CONFIG_XFS_DEBUG=y, CONFIG_XFS_DEBUG_EXPENSIVE=y,
  CONFIG_XFS_ASSERT_FATAL=y. The 7.2.11 config has CONFIG_XFS_DEBUG=y and
  CONFIG_XFS_ASSERT_FATAL=y. The three .config files are in the repository.
- Kernel source changes: none for XFS or the VFS in any of the three trees.
  The KernSight changes are in the syzkaller tree, not in the kernel.
- Out-of-tree modules: the original 7.1.3 log was captured in a guest with
  the out-of-tree module ltp_tpci loaded (taint O/E). The 7.3.0 log used for
  this report does not contain ltp_tpci and is clean on that point; a 7.1.3
  re-validation without ltp_tpci has not been done.
- Guest: QEMU 6.2.0, 4 vCPU, 6 GiB, KVM, x86_64; a fresh VM per run.
- Syzkaller: revision 853b104bb454141a5b0fc0e4218ec78e9f34ffb1+
  (2026-09-18); "+" denotes local KernSight integration (seed ordering/state
  feedback in pkg/kernsight, prog/kernsight_*, syz-manager/kernsight_*,
  pkg/execbackend, vm/qemu snapshot support). It does not change the XFS
  syscall descriptions or the executor's fault-injection semantics.
- Kernel command line: root=/dev/sda console=ttyS0 fstab=no rw
  earlyprintk=serial net.ifnames=0 oops=panic panic_on_warn=1
  panic=86400 hung_task_panic=1 softlockup_panic=1 nmi_watchdog=panic
  sysctl.kernel.hung_task_all_cpu_backtrace=1
  sysctl.kernel.panic_on_rcu_stall=1
  sysctl.kernel.max_rcu_stall_to_panic=1 rcupdate.rcu_expedited=1
  rcupdate.rcu_cpu_stall_cputime=1 no_hash_pointers page_owner=on
  sysctl.vm.nr_hugepages=4 sysctl.vm.nr_overcommit_hugepages=4
  secretmem.enable=1 msr.allow_writes=off coredump_filter=0xffff
  vsyscall=native kvm-intel.nested=1 spec_store_bypass_disable=prctl
  nopcid vivid.n_devs=64
vivid.multiplanar=1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2
  netrom.nr_ndevs=32 rose.rose_ndevs=32 smp.csd_lock_timeout=100000
  watchdog_thresh=55 workqueue.watchdog_thresh=140
  sysctl.net.core.netdev_unregister_timeout_secs=140 dummy_hcd.num=16
  max_loop=32 nbd.nbds_max=32 comedi.comedi_num_legacy_minors=4
  kunit.autorun=0 vcan.echo=1
- Reproduction counts (methods kept separate): full 37-program recipe on
  7.3.0: 1/1; standalone mount-32.prog on 7.3.0: 1/1; 7.2.11 state-primed:
  1/1; 7.1.3: original report. A repeated cold-boot run (e.g. 5/5) and a
  non-debug / CONFIG_XFS_ASSERT_FATAL=n kernel were not tested.

Reproduction
------------
The independent trigger is `xfs-mounts/mount-32.prog`, a single
`syz_mount_image$xfs` program extracted from the full recipe. Run it alone in
a fresh 7.3.0 VM with the same execprog arguments:

  scp syz-execprog syz-executor mount-32.prog root@guest:/tmp/
  ssh root@guest
  cd /tmp && chmod +x syz-execprog syz-executor
  ./syz-execprog -procs=1 -repeat=1 -disable=swap -executor
./syz-executor ./mount-32.prog

Its serial log shows the same failure (516 < 636 blocks,
`fs/xfs/xfs_log.c:597`, kernel BUG, panic); it is archived as
`xfs-mounts/results/mount-32/serial.log`. The full 37-program recipe
(`repro/repro.kernsight.prog`) also triggers it. The other 9 extracted mount
blocks did not show the crash in their captured serial logs. The programs,
commands and per-run logs are in `xfs-mounts/` (`xfs-mounts/RESULTS.md`).
Note that syz-execprog's `executed programs: 0` / `EXIT:0` lines are not
proof of execution; the serial logs are the evidence. No preceding recipe
replay was needed in this standalone run. Further minimisation of
`mount-32.prog` has not been attempted. `repro/repro.prog` is only the
tty/KDSKBSENT testcase and is not the XFS trigger.

Observed on 7.3.0
-----------------
During the full-recipe run, at 155.287 s:

  [ 155.287055][T11019] XFS (loop0): Log size 516 blocks too small,
minimum size is 636 blocks
  [ 155.287075][T11019] XFS: Assertion failed: 0, file:
fs/xfs/xfs_log.c, line: 597
  [ 155.287882][T11019] kernel BUG at fs/xfs/xfs_message.c:102!
  [ 155.295065][T11019] RIP: 0010:assfail+0xa2/0xb0
  [ 155.304491][T11019]  xfs_log_mount+0x4e3/0x590
  [ 155.320739][T11019] RIP: 0010:assfail+0xa2/0xb0
  [ 155.320891][T11019] Kernel panic - not syncing: Fatal exception

In the standalone mount-32 run, at 259.143/259.154 s:

  [ 259.143249][T10455] XFS (loop0): Mounting V5 Filesystem
a2f82aab-77f8-4286-afd4-a8f747a74bab
  [ 259.154708][T10455] XFS (loop0): Log size 516 blocks too small,
minimum size is 636 blocks
  [ 259.154745][T10455] XFS: Assertion failed: 0, file:
fs/xfs/xfs_log.c, line: 597
  [ 259.155220][T10455] kernel BUG at fs/xfs/xfs_message.c:102!
  [ 259.193047][T10455] Kernel panic - not syncing: Fatal exception

The original 7.1.3 report shows the same log-size diagnostic and
assertion at fs/xfs/xfs_log.c:593:

  XFS (loop1): Log size 516 blocks too small, minimum size is 636 blocks
  XFS: Assertion failed: 0, file: fs/xfs/xfs_log.c, line: 593
  kernel BUG at fs/xfs/xfs_message.c:102!
  RIP: 0010:assfail fs/xfs/xfs_message.c:102 [inline]
  xfs_log_mount+0x4e3/0x590 fs/xfs/xfs_log.c:593

On 7.2.11 the state-primed replay reproduces the same crash
(2026-10-20T09:15:38Z, C=false); the report excerpt is in the repository.

Questions
---------
- Is this assertion expected when mounting an image whose log is smaller
  than the minimum, or should xfs_log_mount() reject the image without
  triggering a kernel BUG?
- Is the XFS (loop0) "Log size ... too small" path intended to be fatal
  under CONFIG_XFS_DEBUG + CONFIG_XFS_ASSERT_FATAL, or is it a case that
  should be handled gracefully regardless of the debug configuration?

Materials
---------
The full programs, embedded image, .config files and boot-to-crash serial
logs are available at:

  https://github.com/Zheng-zheng-codes/xfs-undersized-log-assert-repro

Contents:
  repro/repro.prog                tty/KDSKBSENT testcase (NOT the XFS trigger)
  repro/repro.kernsight.prog      full 37-program recipe; contains the
XFS image/mounts
  7.1.3/report0, 7.1.3/log0       original 7.1.3 report and full log
  7.1.3/machineInfo0, 7.1.3/description, 7.1.3/pre_state0
  7.2.11/RESULT.md, 7.2.11/repro.*   7.2.11 state-primed reproduction
  7.3/serial-7.3.log              full 7.3.0 boot-to-crash serial log
  7.3/console-7.3.log, 7.3/cmdline-7.3.txt,
  7.3/boot-info-7.3.txt, 7.3/RESULT-7.3.txt
  xfs-mounts/                     10 extracted mount blocks + standalone results
  kernel/kernel-7.1.3.config, kernel/kernel-7.2.11.config,
  kernel/kernel-7.3.config, kernel/SOURCES.md

Best regards,
Zheng Zheng
