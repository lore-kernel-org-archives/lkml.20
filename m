Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793120469;
	b=Mz+I8nTpHCHbczCiiyaleh+9/qYLxuJigXISVXDQuVNMOasrr1cwhL/93yvJGqTkv9N/
	 qlL345LCEJZtgNRKzbKbhEkGmdLGf2Src1/DneT7oV8K0ENhoh6V3KxMUf1Zk2vJXfmgo
	 EKZBBMkjPMF2WaKexjS+w92yqnhIrnSW5t7K/6jp1jrhFx12SgzvBTp3QJ8LbUE88DNKd
	 yQpwBOEoidpQMBMQ8aS5N8N6Jj+C6+HFKGmub/khZNPbQtL5MI+5cCLHUS3x7GcyMFDV7
	 cpBBkxtngdTBC0tjPEMYhXaqdJ6pqsieRwOxNDG3ups8SFfh3vWZsljYDheexTHJluw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=zi4w/c44kjEfa6V924nGXSvk6C4q+Jl3FpQUCJP2Aq4=;
	b=t21hfGed1IL5NwSwMoZBohS92uOhbuDj0f1SA5icbE08fqTzszXjbANQaAEqN3b+TIXp
	 fHvshZf5nirU7UH90XiS39glTLu8CaiYPOMiT+3uSwvLeCEvfIotb041Mlth7G39CJc8I
	 mlizuHOAICMstZ94pcsJvdO31XhLAazXcNyg5FwvYgQARDjBd21MU/BRAr+zk7i90DoXl
	 MpQcUvuqNYpHhKc+bz+DnajDnnpC0e9HK8POvoZ5Q7G8ix8D9gLGggkLe6FjEo9c5taXW
	 owxjIUVJ4R41BsIDn9ticISVKN0xLY9gEAg4JQq/BkJRPWh22LNTm+qGud7Xcwc3Alw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdDgoeco;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fdDgoeco
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3ab28382b92so330991fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120467; cv=none;
        d=google.com; s=arc-20260327;
        b=R8OVYXk1igfRJPDbBBPTqO/pY2Q/xSrcz5YlOJco4XeNMJzrR4XUUE90WOLZEVYwv2
         xQFKTq+c2ybLMDS2oJXrWFMS4QMfABGtessJPTZ7S9CBOFmRc1oMKlQYTDzE0qgVERUb
         ig9eB5FGAGJaZVi5O2Bcb4lftSxwEJazcE53u/6bqq3W0SUl0QvDMRvM358uq5J+8EH4
         VBOhVJ9SdfM6we5HArq7wXh67dL7NOpetYHQrS2VUxApGXEMfpZh6tM6qQAwWEJ2Wzpa
         axf+MeuGjD/n8RRrS5zT+pDekRAqKja70UFg27VDyvfgbIBkNeCHJ+D/PpPy/vYqXJWO
         8d0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zi4w/c44kjEfa6V924nGXSvk6C4q+Jl3FpQUCJP2Aq4=;
        fh=/rU//+OGgjpHDWbSeGXAoKBeR0oF/cnkZAUUuYP0c24=;
        b=GGyEmTjkM08IPlINRYjoNCCYe5k5SNvKXcnb0V556FbwTFEJbSfQwtF8OChnUmCuHU
         l7rdFWKdfSdq+FDZtOnve0h2eIctB1PQre378pXiczFLRX9QqudEbzTmtE3tH1mzoNou
         q8guuo8eU/8byJV3RoL2jCAeCx8AeKpVeAKLwrLIlPE5qekztbRBbzCXptFMWaGxglcr
         xLEIAaaGiLhHQ4wcZ8XIVdPB43rg42mT660FtWSNWQtnm2w8cIbFzGpemAeoU45uPy/K
         2KrF6cyhh5ldhpTL405Za8p+v0oh4YiRjEGj0v1BhsJM5r9dZsb01PD4ogfewKWj6+xn
         84KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120467; x=1793725267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zi4w/c44kjEfa6V924nGXSvk6C4q+Jl3FpQUCJP2Aq4=;
        b=fdDgoecoIiBfOFqtlN9rln0tfD73jh+IA4IxvE4+jpDzfnH1ylQtpJ8vmi8izMdkIk
         bKovoGRkCuaQWurDmgujP4LkM0f7zhXIuFbJT/XSnZS32cNNLaPpqJ1NpRGSScXGlPGa
         d9JOI8ga3/oh8WFTdJKtkHtC8JcI/Y8Z4o39AuVZRO2y1nP2px0iahQTwFugMBXD7x9U
         r2764mM2HlMUkIgyY1wGL5EITjJn50UAjmZj9k3JPLtbXEmr2n8RZi7umDk5Z7jpkhmM
         f0wJJ9fPFcvhmV5NLNRIv8CHDLZLcQ+s2jrzo6C1ORb3mYts1bBg+jhgMEZs4GkybNfx
         viLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120467; x=1793725267;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zi4w/c44kjEfa6V924nGXSvk6C4q+Jl3FpQUCJP2Aq4=;
        b=EnzBuKsREQETmuGymBp80IhJW2oPuKAziWvvOVXiX21TNSwuT0wQnW725YoRekLUID
         Avq2FSoaTgxXbYG6KvOm3ADjy+T5gbrHXiai8yVvsBn56ItlnVyyRke4/fw3QtLM2oHM
         wO4v0H/rorFjXZ4zExS9Z3xIFzLca9nc2ogsBUc/PYAP9sk7PhIGrI6cTPRzWTUTtOkT
         Xw+JZLQTd5030uAdCD9DWxCCuyXupLqAnPlYJkW/ZuQAnNJdV/67glPdm6LePQOoV3Ya
         PxrIzo71TFrhshWmRJXF4rUfr3GfBsn17XPZzf20b0xC47fkh+LePzwfPpvWI27iX8RL
         IHwg==
X-Forwarded-Encrypted: i=1; AKwUvBwQ2Yi66r7hTJff3JxAsAh1hMm1/4Znx0bggyHG5Vgmtikvh+lNjLvorVUpJrDaanLvivMMlVc9gYuvr38=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP6p8dfwWgd9hDJJOaaZFSr55qCGMT1YlGj3kAuJlqWyZn/W7O
	GOVois28YtAuCO89JoEbUnjoM+B2gs+SlbBusn9G3BuHg9ycsLdrvobgzDOSaPksJmhrinTyGGZ
	ZW5uEgWVrbbp25VsPt/eZc3Wz1BV6nyk=
X-Gm-Gg: AYBFou1BGEfLFZBu6L5kq5Lu9sKHprtgATHFGWoQhlSn3glyRD2f5A+rRZuWtE+1k/I
	Be9l4TLnhv6Wp/H5WUAUugkRr5k34odvsphBZS1XVk+GpnhD+aXuBSDGY0Mt22kdjCUHkQFDfQa
	et9y85z0GJIjPsh3zs/GGM8HwMAmULDyKX/uAB/h/K8QVmMKV34pDKE2/dULbSB0aGT4fbMpPsG
	/fwikfm/MC65IKGpTjftRkZek6AI50jh8c30N+AhGeq/nfQ8lv2/Cn3qDj+KKj4FK46ovzDijlG
	TUAh1HqkFFB0RJHTc2Yxxs91qGtKUWDao2mQ98lsz1VFJoNlYWWjnLqQK58Ahf6b3ugwprxZMrx
	jmyl/KgSe/5UD4kzy4Hp7hjdNRbTpyher1Y4=
X-Received: by 2002:a2e:bc14:0:b0:3a9:82c2:ec1e with SMTP id
 38308e7fff4ca-3ac6fd0b4ccmr27235761fa.15.1793120466960; Tue, 27 Oct 2026
 10:01:06 -0700 (PDT)
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
Date: Wed, 28 Oct 2026 01:00:54 +0800
X-Gm-Features: AclHuK_T5zbz1aBN4vXlACbADxhIhPFWfhZBWoWr8eVkT95CYHG06F69Ck5S7L8
Message-ID: <CAO-4RZ25PZ5BM+83Vk8t5NUY3ksLGz5nzONrncipu2_MZhFSsg@mail.gmail.com>
Subject: [BUG] xfs: undersized log triggers assertion in xfs_log_mount()
To: cem@kernel.org
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Carlos,

Executing the stored syzkaller testcases on Linux 7.3.0 ultimately triggers
an assertion in xfs_log_mount():

  XFS (loop0): AAIEEE! Log failed size checks. Abort!
  XFS: Assertion failed: 0, file: fs/xfs/xfs_log.c, line: 597
  kernel BUG at fs/xfs/xfs_message.c:102!
  ...
  xfs_log_mount+0x4e3/0x590
  xfs_mountfs+0x10b9/0x2270
  xfs_fs_fill_super+0x15cc/0x20b0
  ...
  Kernel panic - not syncing: Fatal exception

The log size check reports 516 blocks, below the required minimum of
636 blocks.

Is this an expected assertion with my XFS debug configuration, or should
this malformed image be rejected without triggering a kernel BUG?

I am reporting an observable assertion from a syzkaller reproduction. I am
not claiming a new vulnerability or a specific root cause.

Environment
-----------
- Kernel: 7.3.0-kernsight-kasan #1 SMP PREEMPT_DYNAMIC (2026-10-20),
  x86_64, KASAN/KCOV. Source: mainline Linux v7.3, commit
  091b06388b117fefdcb63336ac09956a4914b961, release tarball sha256
  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953.
- XFS config: CONFIG_XFS_DEBUG=y, CONFIG_XFS_DEBUG_EXPENSIVE=y,
  CONFIG_XFS_ASSERT_FATAL=y. The full configuration is available as
  kernel/kernel-7.3.config in the repository.
- Kernel source changes: none for XFS or the VFS. The KernSight changes are
  in the syzkaller tree, not in the kernel.
- Taint: Not tainted (the report above is from a clean boot).
- Guest: QEMU 6.2.0, 4 vCPU, 6 GiB, KVM, x86_64; a fresh VM per run.
- Syzkaller: revision 853b104bb454141a5b0fc0e4218ec78e9f34ffb1+
  (2026-09-18). The "+" denotes local KernSight integration (seed ordering/
  state feedback: pkg/kernsight, prog/kernsight_*, syz-manager/kernsight_*,
  pkg/execbackend, vm/qemu snapshot support). It does not change the XFS
  syscall descriptions or the executor's fault-injection semantics.
- Full kernel command line:
  7.3/cmdline-7.3-20261024.txt in the repository.
- An additional fresh-VM validation on 2026-10-28 confirmed that
  repro.kernsight.prog alone triggers the assertion using the command
  below. The kernel BUG occurred at approximately 162.26 seconds after
  boot.

Reproduction
------------
The trigger is the state-construction recipe alone
(`repro.kernsight.prog`, ~2.6 MB); the smaller `repro.prog` (~24 KB) is not
needed. There is no standalone XFS image file; the image data is embedded in
the recipe. Run it on a fresh VM:

  scp syz-execprog syz-executor repro/repro.kernsight.prog root@guest:/tmp/
  ssh root@guest
  cd /tmp && chmod +x syz-execprog syz-executor
  ./syz-execprog -procs=1 -repeat=1 -disable=swap -executor
./syz-executor ./repro.kernsight.prog

Earlier observation on 7.3.0 (2026-10-24)
----------------------------------------
```
[ 155.506948][T11067] XFS (loop0): AAIEEE! Log failed size checks. Abort!
[ 155.506958][T11067] XFS: Assertion failed: 0, file:
fs/xfs/xfs_log.c, line: 597
[ 155.507283][T11067] ------------[ cut here ]------------
[ 155.507292][T11067] kernel BUG at fs/xfs/xfs_message.c:102!
[ 155.507311][T11067] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
[ 155.513319][T11067] CPU: 2 UID: 0 PID: 11067 Comm: syz.0.50 Not
tainted 7.3.0-kernsight-kasan #1 PREEMPT(full)
[ 155.515662][T11067] RIP: 0010:assfail+0xa2/0xb0
[ 155.527881][T11067] Call Trace:
[ 155.528122][T11067]  xfs_log_mount+0x4e3/0x590
[ 155.528503][T11067]  xfs_mountfs+0x10b9/0x2270
[ 155.530595][T11067]  xfs_fs_fill_super+0x15cc/0x20b0
[ 155.531014][T11067]  get_tree_bdev_flags+0x38e/0x620
[ 155.553843][T11067] Kernel panic - not syncing: Fatal exception
```

Questions
---------
- Is triggering a fatal assertion for an undersized V5 log intentional
  with CONFIG_XFS_DEBUG=y and CONFIG_XFS_ASSERT_FATAL=y, or should this
  case return -EINVAL without triggering a BUG?
- If a diagnostic dump would help, what state should be printed before the
  assertion so the malformed image/log geometry can be identified?

Materials
---------
The full testcases, 7.3.0 serial/console logs, crash report, .config and
reproduction script are in the public repository:

  https://github.com/Zheng-zheng-codes/e713403e-xfs-assfail-repro

Contents include:
  repro/repro.kernsight.prog             state-construction recipe (~2.6 MB)
  repro/repro.prog                       small testcase (~24 KB; NOT needed)
  7.3/validation-run-20261028/          2026-10-28 recipe-only validation
                                         (serial log, boot information,
                                         kernel command line)
  7.3/serial-7.3-20261024.log            full boot-to-crash serial log
  7.3/crash-excerpt-7.3-20261024.txt     extracted crash report
  7.3/console-7.3-20261024.log
  7.3/cmdline-7.3-20261024.txt
  7.3/boot-info-7.3-20261024.txt
  7.3/RESULT.txt                          earlier 2026-10-24 harness result
                                         (its 466 s is the old harness duration,
                                         not the 162.26 s crash time above)
  kernel/kernel-7.3.config, kernel/SOURCES.md
  reproduce.sh, verify.sh, MANIFEST.sha256

Best regards,
Zheng Zheng
