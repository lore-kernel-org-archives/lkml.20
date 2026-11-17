Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916564;
	b=cW5J1rTojpc6XoroHlN1LYnmHKPv34j2HnFIqm91fjnkS6XZSIpYBy8OiBpJei2gcrl5
	 v48SToZ4bIH0nxPsW7OHwxr1i4tf2DUT3bhmdPu7D6hZlYeJKwzfYNFhzBRa6gkMmXiLJ
	 aoieHY1CA4V3xqYdHUbkjp2o/Wd1Psrayn18FxChzT6AMSCZQA1rxj3rIa93IRYMaDB4X
	 hXkLCr8Y9Bf0qEVwqQPVPoC98Rmj0QanpHl1227UquIMD54Okd01TI7iZ1Hxe+qWPktWD
	 JkCBNONrXQ+FGcEIIWvMEsiCSOt6JKjs80HIP+tDTNLjzYIKTxcdlPRqDZJqK3PKknw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=zPU6ceRrOQUHHV+hxPWUqGfVLvSRRuiDTUWQgjgb5i4=;
	b=PuXPJs2191pBFQupPH+TNllgYWZH9p0752qRKnvj0/Bo74io06+eNgqiwVYrXnT87u5v
	 RXlsTSQsDbbLaqAV2oqVlzMo97WIUWN2myC9RVER05vT0WQA/ZYR3wEWasB11YYiztOpR
	 msMvzUCnfoJsCCb5U8RqCKN5Kpwr3/bfW/w4q7Tn6YT62d5fH//NknMqVumlE0fJ9XXAi
	 IC2kE2gcmoQn4BKCvPS94WyeSdnG+nY4vTF+MfyuHPLpFs/WULMPo4uNqSEmtDHbBdwh9
	 NuonMR8ls4homejrqsnIPRdmc9W3lFjJiC5vWc9XnLkHwByQqvMCxlZ04AGVJ0gxdBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNEirel;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jRNEirel
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3ad8a138a11so24023371fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794916562; cv=none;
        d=google.com; s=arc-20260327;
        b=Tpx/c1Xiv0fIM6Nzx8LGGI9Mf1zIMdioLIrfUoVI7tpFEqveUlmv2yqvYxA0DcHCF3
         1/o8yeOjIbRbd+HWEE32qmVLiGPSBhzJ8NwiM/PUlX1RIKqoTmmtQqtpWsPPUW/UJqQO
         TI9ADa+/CnQNC94LxLxwCoxjuwS35qLZRVcb2ZX/o69t9+9fj727RUHIFN5e0ty3TWRP
         CjGuQNzlw5aBccJQUbMmJbPG1PbcTbxKeUW14gWJdcU8k/Gv3upfFqLkj+2JfA4w3Rir
         XKlI2AYe1qxc6Yhs8DZ4JuLzTgPTETsHeCOI6J3+lxJgRG9FQqY4Yx6ZehQVDQnLox/5
         Spgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zPU6ceRrOQUHHV+hxPWUqGfVLvSRRuiDTUWQgjgb5i4=;
        fh=FQ2S3Lr8hlQ1PHmPh+fw59K90Nvc9WR+xuDGOpjdGYk=;
        b=BuLwSWgKpEd+F0Iio5vaTjV5oIkQbx+aB7qhEH7xLNGO9QhKe+T5xuvFH+W3FR+cep
         tTnQLIvUadJ7APlSBb70JEibYYPGsKqt1c0wcwzf2apfbN5QULt4R9yZMCHv4wlOF8nd
         MITy6RI2yhCoijqAXAZaBg/UczuAU96X6mTXHevW5IP+1XMN77RtuXndw/u0SgpDV2oh
         dn8PxASt9ywscOOEkSS3EOHpHJTbq8ovGf7Gf3FI9tYEQf59QTZ7lOwH1WKgtu7zG8J7
         0cH5cdtq9h4VAGeDSehnDdBOSQH7g/7k8AbCKmwIATO8x5eLRKZ8Iv3ltKQgj8MPilqJ
         1bIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794916562; x=1795521362; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPU6ceRrOQUHHV+hxPWUqGfVLvSRRuiDTUWQgjgb5i4=;
        b=jRNEirelTAcYqcXcH3R7zb2Pv1ktJS44geOSE6tFOSWg0C2AwOZogb1ZRLpGXP7s+i
         MjI73FlMbhlX2kkIp9IqdZBils/XhEQdJ+MNdJ91MbQw+Bm6iY6IslySSX3afmSv2yqh
         8hd4WXOpPxcfAilXF1w3R/vgpZU/glqK0cPitrG2wPx9fX9Q1QPL6bQyq6CGO86Yr06j
         Rv3UY0dd9YUgtpdzSHPnuUkB0QztbJfV1y8yL0QKPFJnky3p1044Gin67W00Ya0zRo0/
         fBB9sZZjGS1L1XBeK69MCGAjuGOQXd5eT36v4Y8lj/qaNg6rJrie6zKXqpOPm4D/YymH
         Ev2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916562; x=1795521362;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPU6ceRrOQUHHV+hxPWUqGfVLvSRRuiDTUWQgjgb5i4=;
        b=fhtJP4I/Gj4WqT0lajx5DxdlNPf2E0Y3TbvRhvR6FCg+DyVGjSEqY/MLNG+j4Kw9+7
         VfdibhHuospdIZ6cvswy/6naRT7V0J1PsM6Jw/5Rxn6u63LqQ19Go3HxL2EHgIvrnmxl
         Q1mZIwh1rtQeIT8LHvDs0f2zbGbpDsQZMPDMybhZy140w97Zhg8VBEjPWtKLbkCAKn24
         7bUfQYPrCWK1+4Tbup9o2sDn9NNE/+CQKZ24DJLMCDzipTlAOah2+9/JUhyCr7ulObxS
         QBZYixaQiDOxgfrKHnUrgLwkGPHGQADcQ6LVTfDnImoJs1af5qTdsDuKIYz8r/7rxNaf
         W1zQ==
X-Forwarded-Encrypted: i=1; AL+hErEZF9ATKRr3Xq6U058ohG+x0MywiGk+KMqSTy2J3js8ysbkvgRto7wUiaulZZOg5sop6cne5khcznhroxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KtNy+uMsm+FCyGYHvPp3Ji95/VmAW3lVn/8v3F66Xo+KpaFQC
	F3GAbtEauk47GBn6OTUXGzPuaa6yGfqhJpcphGoF4bPlSJoIP/1PeJcnD953+EUKT9tNutVge+z
	X7CNblVDNLiQwFpnsiUrQSRLuj4c/Nco=
X-Gm-Gg: AYBFou32TRI08rX3YtccyelhlVLA6UfXn2HJmhIiKpVaMKSR3ovG0wx2LgvuKcXqjhr
	895R03EzBLj39hi/nWceZ33+ytmvfR/iTiWc5MSRQoXgFaw98oCn9Y3nsrWxPHt1pjGtif1p4TB
	q7xunLUQdkSbzzW7VBfjuj9HFsgWHMD2BgVBgUb1qBjxqylPITfwuS2+4LJLc3LRuX8MtfCGF9r
	7e7a6cLCAeEdS5Wnx61ZEeeu/7up3676Tzrgpop55goSQh5dBqnWSFJcrrJ3sXy7iL6aigP1AWH
	F+7LuXJKpo1beALO00ucOucaNDzW20HHwifix1gaOh4oTq7+nxxHIDF2dFeWh76mnTdNQK7S2d6
	PVxNJaw2d60nvW+T1g2ScpDW7fLhhWXNzvkm2T+JoDPzMv5HU+G1Y1YVqeypdLDOrfGBk4dczfA
	GzOgH71JCB9mJl9/A=
X-Received: by 2002:a2e:bd08:0:b0:3ae:25db:795 with SMTP id
 38308e7fff4ca-3ae2b55b170mr41244861fa.12.1794916561911; Tue, 17 Nov 2026
 03:56:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Tue, 17 Nov 2026 19:55:48 +0800
X-Gm-Features: AclHuK97JT3tcI4OB1Pi1Tv50c508Am-TqojV31gyjYgKRKJYvztqlBkLpD9SOY
Message-ID: <CAO-4RZ3Od6cyGSMJpW=yATKYde8NEc=Mkyv328+uA1Y56z_7Mw@mail.gmail.com>
Subject: [BUG] INFO: task hung in gfs2_glock_nq (v7.4-rc3)
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

We found a reproducible GFS2 task hang on mainline v7.4-rc3 with
syzkaller.

The hang is reported by the kernel's hung-task detector (khungtaskd), not
by the test harness. A task sits in D state on a GFS2 glock and the kernel
prints:

  [  331.476369][   T44] INFO: task syz-executor:10136 blocked for
more than 143 seconds.
  [  331.476395][   T44]       Tainted: G            EL
7.4.0-rc3-kernsight-kasan #1
  [  331.476415][   T44] task:syz-executor    state:D stack:22904
pid:10136 tgid:10136 ppid:1
  [  331.476466][   T44] Call Trace:
  [  331.476472][   T44]  <TASK>
  [  331.476489][   T44]  __schedule+0x1405/0x7510
  [  331.478052][   T44]  bit_wait+0x1a/0x130
  [  331.478073][   T44]  __wait_on_bit+0x6f/0x1b0
  [  331.478127][   T44]  out_of_line_wait_on_bit+0xdf/0x110
  [  331.478237][   T44]  gfs2_glock_wait+0xaa/0x2e0
  [  331.478267][   T44]  gfs2_glock_nq+0xd0b/0x17b0
  [  331.478312][   T44]  __gfs2_lookup+0x10f/0x2a0
  [  331.478360][   T44]  __lookup_slow+0x15b/0x330
  [  331.478509][   T44]  lookup_slow+0x59/0x80
  [  331.478532][   T44]  path_lookupat+0x603/0xb80
  [  331.478568][   T44]  filename_lookup+0x218/0x5f0
  [  331.478767][   T44]  user_path_at+0x45/0x90
  [  331.478794][   T44]  __x64_sys_umount+0x100/0x190
  [  331.478871][   T44]  do_syscall_64+0x132/0x7c0
  [  331.478898][   T44]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

The blocked task is unmounting a crafted GFS2 filesystem. It enters
__gfs2_lookup(), calls gfs2_glock_nq_init()/gfs2_glock_nq(), and waits in
gfs2_glock_wait() for a glock that does not make progress. The guest runs
with hung_task_panic=0, so this is a hang report rather than a panic.

Stable reproduction on mainline v7.4-rc3:

1. Build vanilla v7.4-rc3 with:
     CONFIG_KASAN=y
     CONFIG_PROVE_LOCKING=y
     CONFIG_GFS2_FS=y
     CONFIG_DEBUG_INFO=y
   The bzImage used here has sha256
   0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882.

2. Boot a Debian trixie x86_64 guest (6 GiB RAM, 4 vCPU, KVM) with at least:
     root=/dev/sda console=ttyS0 oops=panic panic_on_warn=1 hung_task_panic=0
   The full QEMU command line is in environment.txt.

3. Copy syz-execprog and syz-executor built from syzkaller commit
   853b104bb454141a5b0fc0e4218ec78e9f34ffb1, plus
   reproducer/repro.kernsight.prog, into the guest.

4. In the guest, as root, run:

     syz-execprog -procs=8 -threaded -repeat=0 \
         -executor ./syz-executor repro.kernsight.prog

5. Wait for the kernel hung-task detector to print
   "INFO: task ... blocked for more than 143 seconds" with the
   gfs2_glock_nq / gfs2_glock_wait stack.

The outer timeout is only used to stop the -repeat=0 loop; it is not the
success criterion. We observed the kernel hung-task report 2/2 on fresh VMs:

  Run 1: 331.48 s after boot (blocked > 143 s)
  Run 2: 290.82 s after boot (blocked > 143 s)

Both runs show the same gfs2_glock_wait -> gfs2_glock_nq ->
__gfs2_lookup -> ksys_umount stack.

The pipeline-provided recipe is a 183-entry state-reconstruction recipe; it
builds the needed glock state by repeated replay.

Repository contents (all v7.4-rc3):

  https://github.com/Zheng-zheng-codes/gfs2-glock-nq-hang

- README.md: phenomenon, kernel hung-task semantics, reproduction steps
  and verification results.
- environment.txt: rc3 kernel/guest image hashes, QEMU command line and
  syzkaller revision.
- kernel.config: v7.4-rc3 kernel configuration.
- reproducer/repro.kernsight.prog: 183-entry state recipe.
- reproducer/repro.priming.prog: priming portion.
- reproducer/repro.prog: triggering testcase.
- reproducer/repro.report, repro.stats, repro.outcomes.jsonl,
  repro.context.json: pipeline verification evidence.
- logs/log-0.txt, logs/report-0.txt: original rc3 syzkaller log and crash
  report.
- logs/machineInfo-0.txt, logs/title-stat.json: guest environment and title
  statistics.
- logs/external-verification/: full serial consoles and run records for
  the two external rc3 reproductions (331.48 s and 290.82 s).
- SHA256SUMS: checksums for the inputs and logs.

Could you advise how to identify which holder is preventing the glock from
being granted in this state, or whether this crafted-image path needs an
additional check?

Best regards,
Zheng Zheng
