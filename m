Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277870;
	b=X0y4BcaitDiNVP1BqUr0by/upmPxtEj7eB4nOxF0T9mWHqlFQ84NhtJsxyuFBaCoE6vW
	 sxpEW/wGpbmQIy5Nj6k5JXXZkXYYuMgDno3zA62NRxGxgtq25X3/aIxFQzCkoLPQq+njj
	 dtyo9Zgv98YsMZsP0S4VRAUVhew5GgzW09GtRCZeXvKmjUSCTYTAZoHKJJjESqXC2v7P7
	 8dBm0DDq+wZ3BBOKa8qM+CTCvN6oOIQFYJ1WWKAvmUcCg/u25yOioZ1hpVDF9eznNxV8e
	 vj7ljgdLhzT7OZFpSJ2hVORp4JaNL/bGfKOmgZOMoC5wTsgzx/f6kq21YAIzJPV9bYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=31EfEmtXUctl4tETks4w5wfLM3YcO+BrxwJ7vj0eux4=;
	b=ijnJaFA+A5H9nMH/ptXfTpwC4hIcJmvjIABFogiQaMStsVVrrLRb9n3hxCGYPZEfC8NO
	 LP9sTR8JW9ssSo83gJTjeQ+BTaWv/oLby2ABtzBCJGBFlAY/NZcbC62S1RyQ3+Ruhs3iC
	 EJwmvVnDYvNDZ/wKf33+TGHCyZz0wEfKp/iwlFQ1u70lQWuAdgB69mnRaR12OQGi9Uhwf
	 LNp6H6TDkQtjb8bakvxnSDhfsPaVNNbASQj3s2qP5grl8cbLZQudmGG7l6/rnV2LvT11b
	 Y8hqiYoaoZzD0jwe/s+/BoAtwPd6XRjYZVksnNIGvZyLmuzaY4uTD5yhwC7k+XsJ29A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUOBmNjn;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A02B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUOBmNjn
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8470d7d430fso839180a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277869; x=1794882669; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31EfEmtXUctl4tETks4w5wfLM3YcO+BrxwJ7vj0eux4=;
        b=vUOBmNjnLoV/k6LXbSj7X2Srw+TarECX2hirKBjawHFIF+hZJJOpafpVs6+XYF8V9/
         oDbtf1E6wUwUDmpEvNRN12ituSMC5GmjWaPcIRIeXJ2KfALhh/RigNsqfUFeEdU+Zfsd
         DOfCsO/XoeJCOU63MASfr+NNeAvVrxuTrO9xSBvcR/CnXTdZEs5WPN1pKfIIXtrfRYa8
         ekI6YmZgDfZhsj1d/70ehE0sjMRmvEjDnNwAkJy/RKIOi7HehwFfo3QTe8o81myFk6AE
         56nbNV+v9xIvAbPIO624jst2rn/ZlGcuxnPviuxmltsG00gdW8hH817QeKMSNSGNYU28
         Io3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277869; x=1794882669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=31EfEmtXUctl4tETks4w5wfLM3YcO+BrxwJ7vj0eux4=;
        b=sz9ObshD09iUQIDbELQVYEqcM2Ux2CgZI120k2l99JHuh3KRGC7NXMK9zk+CzDbHMU
         t9RaZ9vYMlmQTFumBYI3BjV99wERkcOQXswB8CtTVDnLiRbtjisQ1R83Mhj0E7T2uxxq
         1O7RP/IBDKtQnO+WgkE8wRJV/dCLK/DK84FygCjDigQ4gmn92mIq8JDoi/W9JRt7mDgq
         1j0NQWujvVJTJHtR1Xqu/XyVqeVvNyuAJvjtykghZjAcV4y36v4xpgShZX/m7W7do6Ux
         gcC/8wyKgSOPYmaZEcRed9iduu7zD4VOqFXOqfImnWLaUC2znc6/IDWbbDjgSFXp+d6o
         /D8g==
X-Forwarded-Encrypted: i=1; AL+hErFS4GoRAwVrqIVxIZf3esIoQVxm6gf7Kinl/Js86JCsIjx7pWIS7ils3fu0qcXlIBK6pDkdvYbyyP6H000=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cg24CeYPPM57nhE5LbYtU35Ok0tJt5tbMsqVWWoz7TO4IQZqP
	bqlELlQwPQ3Rc/Ho5Tqh5ur4lRCmOSX1omzEMUhFvzjdCOQnVs9TfkpwxJeFJH4u
X-Gm-Gg: AYBFou3fupZp+EwY5rf+T4VcaJlk12KAS4bEcnSenluyvVNrElUgqCPDnPf6ock1D/R
	tEfiNmTv1Z106MCVQKtjzr+mbyeNzfEuCEIOnnL3/jqlzI6ZR4ES1CrEcoKBVr3s71CaZzwlMXM
	13x6xEO3W48eTMZalXQ9RhNo6yU8B/hoXjGHqhuswaXhB5hegw3ikZYZBKbV84FYACEJ3YtDpzg
	n1+7Itze6cpREoJIKPBVGFM6H5ZTJX/5F4BIjVpsgH0DOCOTdcKq/th5ORupa51dfnuAiKkRDgx
	Sj/SWCiLztSOX8RTKH5fhmyFTy72A0VZ8pghsznCwmPB+fAXnNtCQkUlTHgLvzyWgb2vyI82AK5
	BBx+YdVOk55C7srrGI1lSameH6XC6+6sJzCGgpxo2fpnfXh0YqlBhfgFIswARM3iBR9ylWZqSCd
	OkB0eS+RRR0UVqq7toLnVbkkbNdKmaaqd6tnniXjs00yK45t4/zw9vVpsYBqTiggBOTfvbUUEWh
	s5+hoByxMG5HR4PDbjn95ZyCmS47FD1djiFeNpos16RzWEQ1azqpK9Cr/4M4Tjxb6jbyYwJd3CO
	GCRybCzsQbnHQoaQZA3fokQeJDtsrxtlBIvT3VMa/2czw4jVjf/+iDlexln3wEZX/Mb3jgRS0Xy
	P3VjiWpoZZEGhA23xvWYnsMN8PQrBCGY=
X-Received: by 2002:a05:6830:906:b0:844:4959:e856 with SMTP id 46e09a7af769-860dc7c3282mr1262412a34.11.1794277869217;
        Mon, 09 Nov 2026 18:31:09 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dca41bdcsm916678a34.2.2026.11.09.18.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:31:08 -0800 (PST)
Date: Mon, 9 Nov 2026 20:31:02 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: =?utf-8?B?6ZOu?= <fengaojigui88@gmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] ublk: hung tasks in bdev_open during partition scan
 (v7.4-rc2)
Message-ID: <avKB5rb9DWry2WZe@fedora-laptop>
References: <CAO-4RZ2EvgmSRzBtSw+TabEy+3d9kgM9u3-MNS7=pfC6f_555g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-4RZ2EvgmSRzBtSw+TabEy+3d9kgM9u3-MNS7=pfC6f_555g@mail.gmail.com>

On Tue, Nov 10, 2026 at 01:15:43AM +0800, 铮 wrote:
> Hi Ming and Jens,
> 
> I encountered an `INFO: task hung in bdev_open()` while running
> syzkaller on Linux v7.4-rc2.
> 
> Two tasks, a udev worker and a syzkaller executor, were blocked for
> more than 143 seconds in `bdev_open()` (block/bdev.c:990), waiting on
> the same gendisk `open_mutex` while opening block device nodes via
> `openat()`.
> 
> The lock dump also identifies a ublk partition-scan workqueue
> associated with the same mutex. This suggests that the prolonged wait
> may be related to an unfinished ublk partition scan.
> 
> The issue was observed twice during concurrent fuzzing. A subsequent
> state-primed verification run also reproduced the hung-task condition
> on a freshly booted VM.
> 
> All raw logs, crash reports, reproduction programs, and kernel/fuzzing
> configurations are available at:
> 
> https://github.com/Zheng-zheng-codes/bdev-open-hang-7.4-rc2
> 
> All relative paths below refer to files in this repository.
> 
> **Kernel information:**
> 
> - Kernel version: 7.4.0-rc2-kernsight-kasan #1
> - Base: v7.4-rc2 (`7475ea8b5`)
> - Architecture: x86_64
> - Environment: QEMU Standard PC (i440FX + PIIX), KVM, systemd-based guest
> - Configuration: KASAN enabled, `hung_task_panic=0`
> - Fuzzing framework: syzkaller
> - The full kernel configuration and QEMU/fuzzing settings are included
> in the repository.
> 
> **Hung-task report (verification run):**
> 
> ```text
> INFO: task (udev-worker):9713 blocked for more than 143 seconds.
>       Not tainted 7.4.0-rc2-kernsight-kasan #1
> task:(udev-worker) state:D stack:25208 pid:9713 tgid:9713 ppid:4787
> 
> Call Trace:
>  <TASK>
>  __schedule+0x1425/0x6840 kernel/sched/core.c:7389
>  schedule+0xec/0x2d0 kernel/sched/core.c:7481
>  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
>  __mutex_lock+0xe0c/0x1dd0 kernel/locking/mutex.c:821
>  bdev_open+0x3fa/0xe50 block/bdev.c:990
>  blkdev_open+0x355/0x500 block/fops.c:686
>  do_dentry_open+0x693/0x14f0 fs/open.c:1000
>  vfs_open_consume+0xd1/0x460 fs/open.c:1131
>  do_open fs/namei.c:4851 [inline]
>  path_openat+0x1c1b/0x2240 fs/namei.c:5016
>  do_file_open+0x21b/0x470 fs/namei.c:5045
>  do_sys_openat2+0x13e/0x1d0 fs/open.c:1443
>  __x64_sys_openat+0x144/0x200 fs/open.c:1460
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> INFO: task syz.2.29:12841 blocked for more than 143 seconds.
> task:syz.2.29 state:D stack:27784 pid:12841 tgid:12818 ppid:10317
> 
> Call Trace:
>  <TASK>
>  __mutex_lock
>  bdev_open        block/bdev.c:990
>  blkdev_open      block/fops.c:686
>  do_dentry_open
>  path_openat
>  __x64_sys_openat
>  </TASK>
> ```
> 
> **Lock observations:**
> 
> In the verification report, the lock dump identifies the ublk
> partition-scan worker:
> 
> ```text
> locks held by kworker/2:2/1815:
> 
> #1: ((work_completion)(&ub->partition_scan_work))
>     at process_one_work
> 
> #2: ff1100017b50c350 (&disk->open_mutex)
>     at ublk_partition_scan_work+0xdb/0x170
>     drivers/block/ublk_drv.c:2478
> ```
> 
> The same mutex address appears in the lock records for the two blocked tasks:
> 
> ```text
> locks held by (udev-worker)/9713:
>     ff1100017b50c350 (&disk->open_mutex)
>     at bdev_open+0x3fa/0xe50
> 
> locks held by syz.2.29/12841:
>     ff1100017b50c350 (&disk->open_mutex)
>     at bdev_open+0x3fa/0xe50
> ```
> 
> A separate fuzzing occurrence shows a similar relationship:
> 
> ```text
> kworker/3:2/1260:
>     ublk_partition_scan_work
>     (&disk->open_mutex)
> 
> (udev-worker)/9505:
>     bdev_open
>     (&disk->open_mutex)
> 
> syz.4.2301/42546:
>     bdev_open
>     (&disk->open_mutex)
> ```
> 
> The repeated association between the blocked openers and
> `ublk_partition_scan_work()` suggests that the partition scan may be
> involved in the prolonged wait.
> 
> However, the current logs do not establish why the partition-scan
> worker fails to complete. In particular, I have not determined whether
> it is waiting for outstanding I/O from the userspace ublk backend or
> encountering another condition.
> 
> **Reproduction:**
> 
> The repository contains a minimized target program together with a
> recorded state-reconstruction sequence.
> 
> The minimized `repro/repro.prog` is not sufficient by itself to
> reliably reproduce the hang. The state-primed reproduction uses the
> recorded sequence and the target program in the same VM.
> 
> The relevant files are:
> 
> - `repro/repro.prog`: minimized target program
> - `repro/repro.priming.prog`: recorded state-reconstruction sequence
> - `repro/repro.kernsight.prog`: combined state-primed reproduction input
> - `repro/repro.README.txt`: detailed reproduction instructions
> 
> The state-primed reproduction can be attempted using:
> 
> ```bash
> ./syz-execprog \
>     -executor=./syz-executor \
>     -procs=1 \
>     -repeat=1 \
>     ./repro.kernsight.prog
> ```
> 
> The guest should be booted using the kernel configuration and QEMU
> settings documented in the repository. The same syzkaller environment
> should be used for the reproduction.
> 
> The verification run recorded a hung-task report, and the repository
> contains the corresponding execution log and report.
> 
> One caveat is that the udev worker appears to have entered the blocked
> state before the final minimized target program was executed.
> Therefore, I do not claim that the minimized target program alone
> causes the hang. The preceding state-reconstruction sequence may be
> responsible for establishing the condition.
> 
> **Observed results:**
> 
> - Two occurrences during concurrent syzkaller fuzzing
> - One recorded successful state-primed verification run
> - Both the udev worker and a syzkaller executor were observed waiting
> in `bdev_open()`
> - The lock dumps associate the same `disk->open_mutex` with the ublk
> partition-scan workqueue
> - The VM remained running with `hung_task_panic=0`
> 
> **Repository contents:**
> 
> Reproduction artifacts:
> 
> - `repro/repro.prog`
> - `repro/repro.kernsight.prog`
> - `repro/repro.priming.prog`
> - `repro/repro.README.txt`
> - `repro/repro.report`
> - `repro/repro.log`
> - `repro/repro.state.json`
> - `repro/repro.context.json`
> - `repro/repro.attempts.json`
> - `repro/repro.outcomes.jsonl`
> 
> Original fuzzing evidence:
> 
> - `logs/log0`, `logs/log1`
> - `logs/report0`, `logs/report1`
> - `logs/machineInfo0`, `logs/machineInfo1`
> - `logs/pre_state0`, `logs/pre_state1`
> - `logs/crash-excerpt.txt`
> 
> Environment:
> 
> - `config-7.4.0-rc2-kernsight-kasan`: full kernel configuration
> - `syzkaller.cfg`: syzkaller and QEMU configuration
> 
> **Related upstream work:**
> 
> I noticed the earlier ublk fixes concerning canceled I/O commands and
> partition-scan hangs, including the change titled:
> 
> "ublk: refuse to go live after an io command was canceled"
> 
> This issue was observed on v7.4-rc2, but I have not established
> whether it involves the same underlying condition or a different
> problem.
> 
> Could you please advise whether this corresponds to a known issue, or
> whether additional diagnostics from the partition-scan worker or the
> ublk I/O queues would be useful?


Thanks for the report!

From the ublk program in your log, the same process does the following:

	syz_ublk_setup_queues()			/* FETCH */
	START_DEV
	syz_open_dev$ublk_bdev()		/* open /dev/ublkbN */
	syz_ublk_process_io()			/* handle io */

After START_DEV, ublk scans partitions from one work function, which
grabs disk->open_mutex and reads partition table from the ublk server.
But the server is opening its own disk before handling any io, so it
waits on the same open_mutex in bdev_open(), and the read can't be
served. That is one deadlock in the test program itself.

That is definitely one *wrong* ublk server implementation, ublk server
can't issue IO from its own frontend(`/dev/ublkbN`).


Thanks,
Ming
