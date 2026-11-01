Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793496167;
	b=bZKs/NrEsPqWDl0u1q0b/Wyrmg2JlzohEloc5ZBONIsy1ybkqnzg0BLNEFn1gjYE4RUh
	 KU/1w3KJpGq+bnkUKMWFfxoTT1ztRvEZXx00yI9e0ftUkVmsuWAVVVIPOcUDWp4iZbXE7
	 2dNp83IS43CN5mXmYwhFm3OToxo+VVNv3NwdjX3aCJkBaA6vlaYTOqOAYzcW+k/GnCXsr
	 wJHRBysvY4Kdbu+EExoUzQ9mdEkUxp+0JlSL3nzez1B8F9YZMv51ae5f2Q37wesZqMrOS
	 HMu4MN9/S5b5gZvorHueAbRq/b9iWICOHNEi5oQyIEJfqg+7qr90uOV5toZOiboMVpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=adZ5p/K2XCIc9ZIqatzmVAiyk3FpES3PeTW7T0laFOY=;
	b=ZRTLbidD4I2YeZeMQsaZoMRhF1KpZHAvMwU7wsKysqltWemEMHBnV/Jhc/fIYBsVYPkZ
	 zy7WdYEnxn9feLQi4lFqN3alB88TPF2UzDnPBep2ta/S9uA2fYjbROYRf6KIuHAFVGi3j
	 i3d3+mnYlaxIKAxOSlPCTVPz4HGuAj4ofMYWRWqOiJ35C09laR0GF/NFNOiLalrKrlxd8
	 INU12x0qbAxmrngiodnYJcbNs2Bbmee+avhgugmzT4Py8bpmyJJAy9FZRjQjCuZLCzGnN
	 mN+Rhtqhp44ON0Chnf7VdTvRF2VLYtS6bTcYfTmPp+oFwRkGYUPe4OYPIKOvALNB5zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6HsXY5X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.71
Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0A7606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D0A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b6HsXY5X
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-3acaedeb908so13711381fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793496165; cv=none;
        d=google.com; s=arc-20260327;
        b=BMO0gZrbnARj1bJg/9dreSRuOkqdOz/4mM2heYDix31Lggso66UBcLQoKOfi+NKDxr
         jGY/qmbJapWUZGfuSAciIQH9pWE0Ba2gKieCLp3fzmhH26ulH4M/3/aatdOYgqDeIXMS
         R0cFfhw0n7/8SpCOqwzwgdrk7r42WVvt+s3GJPO0x5YpBsRDom+UWfhu0D40jRCDVyKj
         +aCxw/UExzxgZyh67w+KoaCNLVcsmX8SEVS/w+ktwXhfOStc5YAhCSj7BDQ7JBq9GKpy
         K4JeNC59EQvBT1X6nIjJ7uswjv/1NwJ1DEYSQg9U67wQPAbNpmf9p+quZzBXkWGU034c
         uZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=adZ5p/K2XCIc9ZIqatzmVAiyk3FpES3PeTW7T0laFOY=;
        fh=E8chnltHOd7Z0p8yOHmGOmn5Z52fAIaWxqdl12uV+b4=;
        b=TTWY4tjcBGcFd5acRaSkT691MFhm7jsM5R5+vJWZxSCyahL5rQ9E6ymAwCxKMTr2FT
         Q2mLYbuvbhqA/tvrv0lUUMGBPJg6YjkeQFQT6L/2ndqFzFkz9fefsgw4iTW/nDsCqJGA
         AvCU40tsIHvUprBNDejs8KJRrmEmQ1vFwKL4jmTnsvER+asy4nkZSRvp7sDwl44g6Nbk
         5LUJSryxbKLtQ4CCT5VRaxvtr8P3v8PqQoRNP2102n4hyxb6PvKsUreTc7yQcFXUaZl2
         iTQvmHG2KqhsF/ySwoyzokVRBNtyyDXp1+YezudZo2SJN6CJFAU+PNBXUkKR7EIawrcc
         rYFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793496165; x=1794100965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adZ5p/K2XCIc9ZIqatzmVAiyk3FpES3PeTW7T0laFOY=;
        b=b6HsXY5XE7IPWi9g/1jpJ3BYdBGP/lGp1yvcLUkYy+SG81mBVMk2iiJFM1+4/TYyAa
         FAy86ioLWJE5Wo6AoxD/8lJLhAeIPptRVzCxhTd+p12b7CenT2mncUjBtWDaQg9ZHDRK
         YM0OjxUB8C/coZFl1t+j4F+6Derx63qGUvgxO1hM93LUZc0KzQebGAoYhk0L1VpddaW5
         s97knUE4D8D8fr885TWBJjYNEXZuK5FisOqbN332fFKZBPMA9+Su3uyxv4GG1wCBdnKf
         saoG/Vncdgq9mJo3nJrSJvmY7uJG6KOLaVZIyCWhWog45NCS6FG1HsRKkANQ36WoCu09
         YnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496165; x=1794100965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=adZ5p/K2XCIc9ZIqatzmVAiyk3FpES3PeTW7T0laFOY=;
        b=O8o14BW5aZeoKbd+sj8EoqE1PdS18j1h3IZKJKILrGI3xp0zS8SfFVVutMK74+LqA4
         HYbA68VlE6PUZ0AiPV/TsK0VSAYYvDSWi/L/q9Pk3DVtM5XtCUSs1Yj9ZiU9C01K0tZK
         +k1xW6lklO8YqUBIwmv/hcUFD3olwj4oEQBeOLujGKZgYqAsfD9cpcfwqJTCN392CJIU
         FQVmWvWgzL5YtmMbNaQCSWXUc8OAfWDUabxTvXfreR7lCxnQZcmbXOf2MUVMAejHCwmo
         l5/+zuvhj64cRsvdjTh6H6DX8yaXOiWJeAg6NfO9yVL9ZayNrPSsoEfJem6eemKmqSHV
         6P0Q==
X-Forwarded-Encrypted: i=1; AKwUvByck4udyCp8x4pat8QHH+ALnLFshfWF9GHBUS+y2LiySEXAnpwnPB5aWIaP1/7q/TtAn0Mj3UaRuXhhUPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7Gnb7z/mKwUN+ITL3nda/+erzLbXGHpvlJKya1yYsPdqa7mpb
	d64ZVOq4r13HrDiorv1bjKNiFv+h0AjRH2/IGXBaszCQcdIMkesqfjtfJoZmTdlJo1F6FSb7p5H
	7P3md3YAoyc0vUP/xZyWai+y7pUMtIUM=
X-Gm-Gg: AYBFou1V6MvbUBlzbcWPvjeMFXeERetdTiLyuPlrbdzQ33CdaV82DC79K2q/IDQTkWt
	N9XBeGi89v0E/pfwppcOJyD6iuCeC24MsmwjE/+wchxIx0jA3X4xYVechRU/IqZ+IfEbtuCo6hI
	Bgg9vgx+dpgWB39SHO3NWdYje9KE2TZ4+fwLC5oCODNrJ92+hFq7P9GTtU/NDEdBm2o5532USbQ
	xLytYjIDZpAGc6EYGNt1xQP2acY3JDItSK1K+MWrk7qDHkL3vsJbd9mYNOdFjN7aypOd1+m3X2J
	tKlV6uX950Os0nr6eS73cGEMdIvcKooUbRHIzmiV0Vz5lrjB1OimKTzAYDvesJdQA4Ei2wQOQmp
	B3ktxJafXf2djokUFRhP1wF5FNNOU88m69Ls7EA==
X-Received: by 2002:a2e:b88b:0:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3acb7aacdebmr14873131fa.15.1793496164431; Sat, 31 Oct 2026
 18:22:44 -0700 (PDT)
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
Date: Sun, 1 Nov 2026 09:22:30 +0800
X-Gm-Features: AclHuK9RPpmNuHM5PN_mRaWc7TyMYbicYKkLqhZYUNjB2KAFRdCXF3Uz9Bd0vog
Message-ID: <CAO-4RZ2EzuShr1dNEQt+CEjqan8SSyD=-E9g6RW1oocah+chcQ@mail.gmail.com>
Subject: [BUG] tpm: prolonged stall in vtpm_proxy_fops_release() on Linux 7.3
To: peterhuewe@gmx.de, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-integrity@vger.kernel.org, syzkaller@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter, Jarkko and Jason,

I observed a task hang in vtpm_proxy_fops_release() while fuzzing the
vTPM proxy with syzkaller. I reproduced it on Linux 7.3.0: the campaign
observed the hang 4 times; replaying the stored sequence reproduced it
once in an automated replay and three times in manual replays. In every
case a process is blocked for 143+ seconds in
vtpm_proxy_fops_release() -> vtpm_proxy_work_stop() -> flush_work(),
while at the same time the sysrq-t dumps show a chip-register work
(vtpm_proxy_work -> tpm_chip_register() -> tpm_chip_start() ->
vtpm_proxy_request_locality()) running on the tpm-vtpm workqueue plus a
backlog of further queued chip-register works. Which queued work the
blocked release is waiting for is unconfirmed. All logs end while the
task is still blocked, so I cannot say how long the stall ultimately
lasts; I am not claiming a permanent deadlock.

Environment
-----------
- Kernel: 7.3.0-kernsight-kasan #1 SMP PREEMPT_DYNAMIC, built 2026-10-20,
  x86_64. Vanilla 7.3.0 source tarball (sha256
  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953),
  built with KASAN/KCOV. No TPM changes were made for this testing
  (drivers/char/tpm/ matches vanilla apart from build artifacts).
- Guest: QEMU/KVM, 4 vCPU, 6 GiB, 8 scratch virtio disks, 2 NVDIMM/pmem
  devices, 2 NUMA nodes (the syzkaller standard environment). A fresh VM
  was used for every reproduction run.
- Syzkaller: revision 853b104bb454141a5b0fc0e4218ec78e9f34ffb1+
  (2026-09-18). The "+" denotes local KernSight integration changes
  (seed ordering/state feedback: pkg/kernsight, prog/kernsight_*,
  syz-manager/kernsight_*, pkg/execbackend, snapshot support in vm/qemu).
  They do not change the TPM syscall descriptions or the executor
  semantics.
- Reproduction: the campaign observed the hang 4 times; replaying the
  stored programs reproduced it once in an automated replay, three
  times as a single 50-program sequence, and once with the two-step
  form above (one of the manual replays is captured only as a sysrq-t
  dump). Four runs on a bare fresh VM with a *different kernel command
  line* and without the scratch/pmem/NUMA layout recorded no hang --
  since the command line differs as well, these runs cannot attribute
  the effect to the device layout.

Kernel command line (full text in the repository, cmdline/cmdline-7.3.txt):
  root=3D/dev/sda console=3DttyS0 fstab=3Dno rw earlyprintk=3Dserial net.if=
names=3D0
  oops=3Dpanic panic_on_warn=3D1 panic=3D86400 hung_task_panic=3D1 softlock=
up_panic=3D1
  nmi_watchdog=3Dpanic ... page_owner=3Don secretmem.enable=3D1
  dummy_hcd.num=3D16 max_loop=3D32 nbd.nbds_max=3D32 kunit.autorun=3D0
  (for the live-inspection runs, hung_task_panic=3D0 was used instead; see
  cmdline/cmdline-7.3-retest.txt)

Reproduction
------------
Two equivalent ways are verified; the two-step form is the simplest.

From the host:

  scp syz-execprog syz-executor repro.priming.prog repro.prog root@guest:/t=
mp/
  ssh root@guest
  cd /tmp && chmod +x syz-execprog syz-executor

Step 1 -- run the state-construction sequence (49 programs) once:

  ./syz-execprog -executor=3D/tmp/syz-executor -procs=3D1 -repeat=3D1
/tmp/repro.priming.prog

It runs for ~20 s and exits normally. When its executor process exits,
the vtpm fds it holds are released and the release path hangs: the
hung-task monitor reports at t=E2=89=88267 s (logs/serial-twostep.log):

  INFO: task syz.0.33:10843 blocked for more than 143 seconds.
        Blocked by coredump.

while `ps` shows `kworker/X:Y+tpm-vtpm` and the executor task both in
state D (sysrq-t dump: logs/dmesg-sysrq-twostep.txt), and the serial log
shows `tpm tpm1/tpm2: Operation Timed out` while the release is blocked.
Step 2 -- optionally run the crashing testcase afterwards
(./syz-execprog ... /tmp/repro.prog); on the already-blocked VM it
simply runs and exits.

The single-file form replays the state construction and the crashing
testcase as one 50-program sequence (logs/execprog-verify4.out:
"parsed 50 programs"):

  ./syz-execprog -executor=3D/tmp/syz-executor -procs=3D1 -repeat=3D1
/tmp/repro.kernsight.prog

In both forms programs run sequentially (procs=3D1, repeat=3D1,
sandbox=3Dnone), but a program can leave asynchronous kernel-side work
behind. The sequence creates several vTPM proxy devices and
closes/exits over them. The hang appears when a closing task's release
path races a still-running or queued chip-register work. The
hung-task monitor then reports (t=E2=89=88480 s in logs/serial-verify4.log)=
:

  INFO: task syz.0.33:10857 blocked for more than 143 seconds.
        Not tainted 7.3.0-kernsight-kasan #1
        Blocked by coredump.
  task:syz.0.33        state:D stack:26264 pid:10857 tgid:10857 ppid:10246
  Call Trace:
   <TASK>
   __schedule+0x134d/0x6880
   schedule_timeout+0x24a/0x290
   __wait_for_common+0x1d3/0x4e0
   __flush_work+0x6ab/0xd90
   vtpm_proxy_work_stop     drivers/char/tpm/tpm_vtpm_proxy.c:470 [inline]
   vtpm_proxy_delete_device drivers/char/tpm/tpm_vtpm_proxy.c:590 [inline]
   vtpm_proxy_fops_release+0xa8/0x1d0 drivers/char/tpm/tpm_vtpm_proxy.c:239
   __fput+0x408/0xb60
   task_work_run+0x170/0x260
   do_exit+0x90c/0x2b60
   ...

  Showing all locks held in the system:
   locks held by kworker/3:2/1235: 2, on CPU#3:
    #0: ff110000267a8540 ((wq_completion)tpm-vtpm){+.+.}-{0:0}
    #1: ffa0000006cafd08 ((work_completion)(&proxy_dev->work)){+.+.}-{0:0}

While the task was blocked I captured full task dumps with
`echo t > /proc/sysrq-trigger` (hung_task_panic=3D0 variant; three dumps
included). In the first dump the kworker running a vtpm_proxy_work is
itself blocked in the transmit loop:

  task:kworker/2:3     state:D stack:24648 pid:9703
  Workqueue: tpm-vtpm vtpm_proxy_work
  Call Trace:
   <TASK>
   schedule+0xec/0x2d0
   schedule_hrtimeout_range_clock+0x11d/0x310
   usleep_range_state+0x178/0x220
   ? vtpm_proxy_tpm_req_canceled
   tpm_transmit+0x4bf/0xb90
   tpm_transmit_cmd+0x62/0x1f0
   vtpm_proxy_request_locality+0x140/0x280
   tpm_chip_start+0x18f/0x340
   tpm_chip_bootstrap+0x80/0x1c0
   tpm_chip_register+0x27/0x4d0
   vtpm_proxy_work+0x41/0x100
   process_one_work+0xa9c/0x1dc0
   ...

All three dumps also show that the tpm-vtpm workqueue carries a backlog
of further chip-register works behind the running one
(logs/dmesg-sysrq-verify3.txt):

  workqueue tpm-vtpm: flags=3D0x40108
    pwq 6: cpus=3D1 node=3D0 active=3D1 refcnt=3D33
      in-flight: 24:vtpm_proxy_work for 75s
      inactive: 4*vtpm_proxy_work BAR(10837), 26*vtpm_proxy_work

(logs/dmesg-sysrq-verify4.txt: in-flight for 109 s,
inactive: 29*vtpm_proxy_work BAR(10857).) With this backlog I cannot
tell which specific queued work the blocked release is waiting for; the
running work shown in the stacks may or may not be that one.

While the release was blocked, the serial log shows
"tpm tpm3: Operation Timed out" / "tpm tpm31: Operation Timed out"
lines. All included logs end while the task is still blocked, so I have
no log evidence of the release completing; I have also not established
an upper bound for the stall.

Two entry paths were observed for the blocked release:
- process exit: do_exit() -> task_work_run() -> __fput()
  (campaign reports, the automated reproduction, dmesg-sysrq-verify4.txt)
- close_range() returning to user space: task_work_run() -> __fput()
  (dmesg-sysrq-verify3.txt)

The minimized single-program testcase does not reproduce the hang; the
full 50-program sequence above is the reproducer. I have not isolated
which preceding operations or timing conditions are required.

Question
--------
vtpm_proxy_tpm_req_canceled() already exists and the driver marks the
device as being torn down before flush_work(); from the captured dumps
I cannot tell why the wait nevertheless persists for minutes. Should
the release path be bounded, or should the in-flight chip-register work
be ended more promptly once the proxy is being torn down? I am happy to
test proposed patches.

Materials (the reproducer, the sysrq-t task dumps, full serial logs,
the syz-execprog output, kernel config, command lines, a sha256 manifest,
and a verify.sh that re-checks the numbers quoted here):
  https://github.com/Zheng-zheng-codes/vtpm-proxy-release-hang-repro

Repository contents
-------------------
  repro/repro.priming.prog           state-construction sequence (49 progra=
ms)
  repro/repro.prog                   crashing testcase (use after the
priming run)
  repro/repro.kernsight.prog         single-file form (50 programs)
  logs/vtpm-sysrq-t-all-tasks.txt    sysrq-t dump: kworker stack +
backlog (run 1)
  logs/dmesg-sysrq-verify3.txt       sysrq-t dump: backlog,
close_range entry path
  logs/dmesg-sysrq-verify4.txt       sysrq-t dump: backlog, do_exit entry p=
ath
  logs/serial-7.3-auto-repro.log     automated state-primed reproduction
  logs/serial-7.3-manual-repro.log   manual replay, run 1
  logs/serial-verify4.log            manual replay, run 2 (serial)
  logs/serial-twostep.log            two-step reproduction (serial)
  logs/execprog-twostep-step1.out    two-step step 1 output ("parsed
49 programs")
  logs/dmesg-sysrq-twostep.txt       two-step sysrq-t dump
  logs/execprog-verify4.out          run 2 syz-execprog stdout
("parsed 50 programs")
  logs/serial-7.3-bare-no-trigger-*.log  4 bare-VM runs (no hang recorded)
  logs/report-7.3-*.txt, log-7.3-*.txt   the 4 campaign instances
  logs/crash-title.txt               crash title
  kernel/kernel-7.3.config           kernel configuration
  cmdline/cmdline-7.3.txt            kernel command line (syzkaller
standard set)
  cmdline/cmdline-7.3-retest.txt     verification variant (hung_task_panic=
=3D0)
  verify.sh                          re-checks the numbers quoted in this m=
ail
  MANIFEST.sha256                    sha256 of every file (except itself)

I am happy to provide additional information and test proposed patches.

Best regards,
Zheng Zheng
