Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794244559;
	b=bylYVpbU32ubakLViO5UED/kUllvnNi5xG4FVt61rjRwzgoiY/R5FtndsesZNoqjTla5
	 yH1ADId/rTA7H6BxQK3+Hph0fS6n/aq4gxirjoiK5MC1XcgiF/dRtu/kSlc/17D4R3PmB
	 XI+paO+kcS2KDHjUFy/ILlr4dv7eo7Xem9Ko0VCKVH0jqE4LINmgvSDPIc5ZzhPyk9m2h
	 4/Eh2w8DN4CKt5aftZkmt9lRoiO8ps6+ct6NSPNx856XOYjc9/WyF8XvpiiQE1xHmQEPn
	 ljbXP36GhpzQ5Jo5fButfFLS5tT7QVXF8B56pMFdf3m2ikpUwfJfc15tLpe40r4rt8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=dGy8vnkQJmrEG5TrpIPtnubCMsqyJHlqpQL97808k94=;
	b=IoPmc0PF/xzoIWjv1BTkZHc/x+vLWWkPf64O0X4VTcRwAAQrBTKHH9LzP1M7xUAl1Cf/
	 4fkggPmASYz3kDb6ROunTQUVg8M23gdv9ojIoTQBljl3L9kPRkZ+OSUbqdjsJWm+aDboG
	 Dj/2K1dRz8rC8L9AzqS0t3l1SjZ4pqQ4hawB3PdIr22tx5PM0zgYRr2Lzq8js/podaLwf
	 q2P7jsdtYau4YQYOcOQqH+FutJ3EboyjiuOoUCmZZDIob55yWXzx9UUn/al/3Od7OHvfj
	 ZumoZ7eZXlBbW1adz9y9cEdghRUSctWVLHvIp0zbWstVmiB2YF65ap1kzUHEz/XCx2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnwe1UCZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.73
Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E40606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E40606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnwe1UCZ
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3ad31c004d8so8928321fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794244557; cv=none;
        d=google.com; s=arc-20260327;
        b=NGozs+5HsGU9QcuoiN9HkXhtCfK3bZmWjrj/CiwD6TxMChtvF733FME58gmgT7hNTw
         mKVRv4VxJKfy3dPEbIQA2UPna7o/Kos4Bwrj3+RrJb68vIG0byU9bHDPMZoSfq8OL+6v
         ICkY4mW52S9pOi64vMqLFD/o5ec3pD6Kat/AIOaaVTi9H4lytd8bunnmZQZHjOh2ckTj
         chdWctBKXQFV9dhMahRfYDgFVq4oBdzeGkKb/C0khwgBKSMsp7sA0BSWlH4lEb+uKIFW
         IGFvyyaoWTtgo7m3O4YRuondyPrj+n2QvmhcFU8V5ca9wUfVINlaC78aP17EfwXlV1mt
         KPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dGy8vnkQJmrEG5TrpIPtnubCMsqyJHlqpQL97808k94=;
        fh=rPP1wbgh1zHS0jvWh6j6yTiT0jLb5/U3ksMe7CxrdpQ=;
        b=j8l5tG5+33TGZKREaWPHmMYYhvcCMprXql3fEj6EuPYrE3kJ1Z7GDj5EvSbD4US05t
         Sj0zvTvTeD0Q78v4D/f8OAF1WS9piuoUP8rU+jRN0Zov7VF+tLDk0ioxajjqy/MaaAyI
         YB1N6Y0CMBNxYoAjP29zfIp4DrspghpnZ8xlJZOF8KmZ+feEXgj7mQhnX4AoC40uE0Xl
         KMxzsthiM32ntLCVcvzALo0tYS/0Xkmx2syw9PQBFP8nqoO05UDubMF/jP1yM/CA/ryg
         jQYgPwMFVwAoj40u1V4ZA8BbzdGDO/qjakBWJ/XwY1tK2q9BhGntCaMw14Uxtox0OUMm
         Bwzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244557; x=1794849357; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGy8vnkQJmrEG5TrpIPtnubCMsqyJHlqpQL97808k94=;
        b=Hnwe1UCZxKn8GN6XGR1k1iVfjhcx8FSFO1c6tJwaiAPZMfBIjeFNw5Fv4UlevWiPs5
         TeeHJ1oZ6LKmNjVmiQJYkvwKeS5ob06rwR2Ie6nCcZ8oNpkguZky0nsIOVzXkyMU2OkY
         xBoHsU9JWpwavQjh5Q3kbJOJIurVxu4bew91MQZwGgXzw12bBtuP4+3j0YZGP10E2VTn
         tHFS/wRu8NcFhsKNY35gZ9VEJfzbReh+xys/ZoF4JZgSpn92hHYuhOfp9Pr+OtcB8W10
         74uUXuS/wjpBsevYyhAvlX4AvzCVzdHudzXQdSYyWeSpg8j0i+baAxr5EJEnOpvRlaZK
         igBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244557; x=1794849357;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dGy8vnkQJmrEG5TrpIPtnubCMsqyJHlqpQL97808k94=;
        b=HadI1WeJdt9HCo+qOmY5n0SUuPwyqgmHFcvoeNH04VbS8IqEWhKxuCI/M9u7MgcO6V
         B+cCljCIVFcXuTn0A6ZcEuSWkDy2NS43FVyKTRHfz3pavlnbOvTtMzT/ALvnAaidI5M8
         HIs+QJnpu73JJN5VjYEplArXl1XYQgD0ixmmhXINpDLoYzphZvayqaQs3q1qX1ImQVtd
         MxYkaFWZ82A1YkvoGX5aiOzo0WjAlZSgsQIRPTLcjtwglZCukwNBMfpFWJ3j6m6Y5TkK
         QHxhtUr1512TZ0sJkGu3ttOqkJKwdW5RTALoyPRyVmVEaTRa9Mp+DXQ1G2dBWNxlzN8G
         Wdnw==
X-Forwarded-Encrypted: i=1; AL+hErFGE7k/9q2i3DISXIsP2tHHXwydOfBLfheDNMLcxR5DcAUWyodYarlznR9bhnzmF9p0wo3TEqx6eBsnPR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W32tgB6yZAa/62SSXeIRHXsA8vAWcCifIh8mqLyz0977B+e2N
	rjfUf7Fk7c2ddlxl2jClwPD6cwEawUCatbbRFvt1W+8FwOuxJnCYVu9qPYZAl0489b6NwZ1HR9j
	QgBAsyq1dDXJxk/GTPX4JXuVdLOcm6f0=
X-Gm-Gg: AYBFou2GUAT6KSPVB5vecykoqhe2Cq76xHAGDTMWaqUe2XauwdyI3mUhldaJ0ysEUFi
	mKEYXWgYrWYrE++9pw/6Waq4lIoVHaeDvqk7kIjRZQwZIJGzi86vw6f6rheDkkZ7mhlEh45/EbR
	twbf2N4gH67LkRj0x+lTXlKac+oTVa9N9+QTwnF9HS4mvFy1y78MrTEyt4JgKMfIA1F0EDnlHEm
	NV/aPge+r1hypnXr+ZMXrksrUk9YulcXPRYs0+UIkYI/JGiRmPufLwKbkp8q3DF7WD3MRAzb42e
	VeatrodLCoFL7KAwQqErHcGG7FVDmZrNt/Xiy/AdyF7ltOKpTebDa2rgQDJrknydKpzxPwDkCTz
	h7sLzkyW+e4PoVqnKV4F3DFjbDUqEDHuzaiIbCco=
X-Received: by 2002:a05:6512:3e0f:b0:5c1:4c0a:49e8 with SMTP id
 2adb3069b0e04-5c156ea634emr7210e87.45.1794244556634; Mon, 09 Nov 2026
 09:15:56 -0800 (PST)
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
Date: Tue, 10 Nov 2026 01:15:43 +0800
X-Gm-Features: AclHuK9zCoDKkJMXK0TsiI95GI5FAr3ScxtzEnrCqWYRSEgp9KBzAmmvk1tACbU
Message-ID: <CAO-4RZ2EvgmSRzBtSw+TabEy+3d9kgM9u3-MNS7=pfC6f_555g@mail.gmail.com>
Subject: [BUG] ublk: hung tasks in bdev_open during partition scan (v7.4-rc2)
To: tom.leiming@gmail.com, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ming and Jens,

I encountered an `INFO: task hung in bdev_open()` while running
syzkaller on Linux v7.4-rc2.

Two tasks, a udev worker and a syzkaller executor, were blocked for
more than 143 seconds in `bdev_open()` (block/bdev.c:990), waiting on
the same gendisk `open_mutex` while opening block device nodes via
`openat()`.

The lock dump also identifies a ublk partition-scan workqueue
associated with the same mutex. This suggests that the prolonged wait
may be related to an unfinished ublk partition scan.

The issue was observed twice during concurrent fuzzing. A subsequent
state-primed verification run also reproduced the hung-task condition
on a freshly booted VM.

All raw logs, crash reports, reproduction programs, and kernel/fuzzing
configurations are available at:

https://github.com/Zheng-zheng-codes/bdev-open-hang-7.4-rc2

All relative paths below refer to files in this repository.

**Kernel information:**

- Kernel version: 7.4.0-rc2-kernsight-kasan #1
- Base: v7.4-rc2 (`7475ea8b5`)
- Architecture: x86_64
- Environment: QEMU Standard PC (i440FX + PIIX), KVM, systemd-based guest
- Configuration: KASAN enabled, `hung_task_panic=0`
- Fuzzing framework: syzkaller
- The full kernel configuration and QEMU/fuzzing settings are included
in the repository.

**Hung-task report (verification run):**

```text
INFO: task (udev-worker):9713 blocked for more than 143 seconds.
      Not tainted 7.4.0-rc2-kernsight-kasan #1
task:(udev-worker) state:D stack:25208 pid:9713 tgid:9713 ppid:4787

Call Trace:
 <TASK>
 __schedule+0x1425/0x6840 kernel/sched/core.c:7389
 schedule+0xec/0x2d0 kernel/sched/core.c:7481
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0xe0c/0x1dd0 kernel/locking/mutex.c:821
 bdev_open+0x3fa/0xe50 block/bdev.c:990
 blkdev_open+0x355/0x500 block/fops.c:686
 do_dentry_open+0x693/0x14f0 fs/open.c:1000
 vfs_open_consume+0xd1/0x460 fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1c1b/0x2240 fs/namei.c:5016
 do_file_open+0x21b/0x470 fs/namei.c:5045
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1443
 __x64_sys_openat+0x144/0x200 fs/open.c:1460
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

INFO: task syz.2.29:12841 blocked for more than 143 seconds.
task:syz.2.29 state:D stack:27784 pid:12841 tgid:12818 ppid:10317

Call Trace:
 <TASK>
 __mutex_lock
 bdev_open        block/bdev.c:990
 blkdev_open      block/fops.c:686
 do_dentry_open
 path_openat
 __x64_sys_openat
 </TASK>
```

**Lock observations:**

In the verification report, the lock dump identifies the ublk
partition-scan worker:

```text
locks held by kworker/2:2/1815:

#1: ((work_completion)(&ub->partition_scan_work))
    at process_one_work

#2: ff1100017b50c350 (&disk->open_mutex)
    at ublk_partition_scan_work+0xdb/0x170
    drivers/block/ublk_drv.c:2478
```

The same mutex address appears in the lock records for the two blocked tasks:

```text
locks held by (udev-worker)/9713:
    ff1100017b50c350 (&disk->open_mutex)
    at bdev_open+0x3fa/0xe50

locks held by syz.2.29/12841:
    ff1100017b50c350 (&disk->open_mutex)
    at bdev_open+0x3fa/0xe50
```

A separate fuzzing occurrence shows a similar relationship:

```text
kworker/3:2/1260:
    ublk_partition_scan_work
    (&disk->open_mutex)

(udev-worker)/9505:
    bdev_open
    (&disk->open_mutex)

syz.4.2301/42546:
    bdev_open
    (&disk->open_mutex)
```

The repeated association between the blocked openers and
`ublk_partition_scan_work()` suggests that the partition scan may be
involved in the prolonged wait.

However, the current logs do not establish why the partition-scan
worker fails to complete. In particular, I have not determined whether
it is waiting for outstanding I/O from the userspace ublk backend or
encountering another condition.

**Reproduction:**

The repository contains a minimized target program together with a
recorded state-reconstruction sequence.

The minimized `repro/repro.prog` is not sufficient by itself to
reliably reproduce the hang. The state-primed reproduction uses the
recorded sequence and the target program in the same VM.

The relevant files are:

- `repro/repro.prog`: minimized target program
- `repro/repro.priming.prog`: recorded state-reconstruction sequence
- `repro/repro.kernsight.prog`: combined state-primed reproduction input
- `repro/repro.README.txt`: detailed reproduction instructions

The state-primed reproduction can be attempted using:

```bash
./syz-execprog \
    -executor=./syz-executor \
    -procs=1 \
    -repeat=1 \
    ./repro.kernsight.prog
```

The guest should be booted using the kernel configuration and QEMU
settings documented in the repository. The same syzkaller environment
should be used for the reproduction.

The verification run recorded a hung-task report, and the repository
contains the corresponding execution log and report.

One caveat is that the udev worker appears to have entered the blocked
state before the final minimized target program was executed.
Therefore, I do not claim that the minimized target program alone
causes the hang. The preceding state-reconstruction sequence may be
responsible for establishing the condition.

**Observed results:**

- Two occurrences during concurrent syzkaller fuzzing
- One recorded successful state-primed verification run
- Both the udev worker and a syzkaller executor were observed waiting
in `bdev_open()`
- The lock dumps associate the same `disk->open_mutex` with the ublk
partition-scan workqueue
- The VM remained running with `hung_task_panic=0`

**Repository contents:**

Reproduction artifacts:

- `repro/repro.prog`
- `repro/repro.kernsight.prog`
- `repro/repro.priming.prog`
- `repro/repro.README.txt`
- `repro/repro.report`
- `repro/repro.log`
- `repro/repro.state.json`
- `repro/repro.context.json`
- `repro/repro.attempts.json`
- `repro/repro.outcomes.jsonl`

Original fuzzing evidence:

- `logs/log0`, `logs/log1`
- `logs/report0`, `logs/report1`
- `logs/machineInfo0`, `logs/machineInfo1`
- `logs/pre_state0`, `logs/pre_state1`
- `logs/crash-excerpt.txt`

Environment:

- `config-7.4.0-rc2-kernsight-kasan`: full kernel configuration
- `syzkaller.cfg`: syzkaller and QEMU configuration

**Related upstream work:**

I noticed the earlier ublk fixes concerning canceled I/O commands and
partition-scan hangs, including the change titled:

"ublk: refuse to go live after an io command was canceled"

This issue was observed on v7.4-rc2, but I have not established
whether it involves the same underlying condition or a different
problem.

Could you please advise whether this corresponds to a known issue, or
whether additional diagnostics from the partition-scan worker or the
ublk I/O queues would be useful?

Thank you for your time.

Best regards,
Zheng Zheng
