Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.74
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793857354;
	b=KcGwuslK70dZndEZSgn/xe332yXNcCi7gacpXrDv9WamycHLzcDEY1/C224Ch361D8Nt
	 aDdaKW0G93ittnvJYjplvuIsxHuGX259HXdEirATG0Qa4sXBPoOrFUswtl/rWxC645/oC
	 J8c+FUBQFCvIcW70Yqb+tXl7539eCVXsxQVJ0CBl96bKd53lTRE2tl8/qkGEfPDznsogO
	 Ku9B87ZzImdDCKmU9+ue8/Ai0FxUnujCdRoxMWCVCrOfqE1b+EqvYS50K1vyU5eK6oxMQ
	 B3a8jQksHoOb518mo3s0xdHbC2+L58+c8TjXAYC6D2+ABdrPRfzG986Vi0M7S3FG5og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sJwxZdaMomxuzSPkUcgYTRWffu8jQrOj7UECiYOTgBY=;
	b=Po/8nnznN/ePK6mX8Phs/DZWaU78sQZCa49x5Fy41qX/6VXeMlRI/woxeSjvHFffpCHS
	 Xk4mNyRAlIa0RR7dJxdV5pSEdQlg7Bl/kmBITYlE4ON0bJRB6rPurD74lr3p04gwQLdRu
	 2DKsEKeqydt6fqe3GwqrBF8BenFTpfN5hUiFRziowBTEZqq5Zqne0FMCYF+mc2L4Nu2lO
	 /c6yaZJwR4LxS6cnmD3UD//yHRkcooDjY9bFo5b9H+ht6orYxifF15wlGWQjv6BzDVYGy
	 j2HHBDEiwl3BFsl0hO+NXxdX/AooUFN7v+qfBrs4b9jzj7exDR6cksS4Jzhr+sdPUCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTDzO7nl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.74
Received: from mail-lr2-f10.google.com (mail-lr2-f10.google.com [74.125.230.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17C0606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTDzO7nl
Received: by mail-lr2-f10.google.com with SMTP id 38308e7fff4ca-3acdab5afe2so10801831fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793857352; cv=none;
        d=google.com; s=arc-20260327;
        b=AvkTkduT6C71FmPXFaOhIi+n5bsI0L5vHxSF73PZRPimprmkQXxEwUYk9VN37PwCh9
         8yP6Jior9XJMIIqRTGOHASPrhyzEJx9ZrIwAtqF4gbnjpWLaZllW5il6zwJS6RSQXHyz
         uXy4Mh4TIRHrVSw1J8yerya+N3NL/Zf0fwu0W36F4fTVTbGTBXSFlr8P+uCIyanNdDxI
         Hye6z4/qbd2b8cLqAnEvSV3u1NNeA2OS65MckxPFstPRZRZYAPR8Nm5HJcuZ2AVOs8e8
         JUI58safdztfqQNTZaEjE6zewxWaHOM6Im3hTfEQgp3PeE3E3UeJen2uQS32ia6JDHZY
         qxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sJwxZdaMomxuzSPkUcgYTRWffu8jQrOj7UECiYOTgBY=;
        fh=R6NOR5Rf29uTsLDrf7sY6eAyQX42SgFSxTCMy5Wy5nk=;
        b=qJd0Lrtkks5PBFlazWSwBIzJi4kkAgn82QIo29M0sk8gxfRZwYtvl6TVKoppI8BPgk
         8bWGJcD6kAFOoueLuZI49/f2ojGriI08eXGjMvDVozS2Jx/cBUCIFnTa8XQHRzV5g608
         9OrG4oY+p7sNC5kNVIK2XM/sAFBQTP3FcyWBSmseio+x5qRcmVjdPbCrf8x/v/MOzP9/
         Hcz6INx8SqNqqMDjVa6yac7QS52lWdlr/4/LjQDerl4E0u/zDevRlrhwnTaMuWez+qEe
         HsWyeEhDxRAryy6wq3VQ3MgSgnxtzY/tsF/mU2nxzFxPyAIgKqUH3RJSk5bTxhqIUu1/
         WP7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793857352; x=1794462152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJwxZdaMomxuzSPkUcgYTRWffu8jQrOj7UECiYOTgBY=;
        b=wTDzO7nl8z+vDNVXZ+06zrAQzmUU5s54GB9f+fpF9hS4/8BUrPGy1kfqlxiCsI/1ma
         J2+wygfFWv8RNpYP81SN5JPiyM4k5vNopmPOK7SOeyaHO2JK8MnlxUgARsZP/AA0NDpl
         UsTcZ+Saoa6Z+IqW9xRTFGh+/E12I5OCTOye+EGZsoB47rS2jj8WNWpKbo9AlbmR5gJp
         xjK2h56g9HZ4HN5n2YKsGRf1ecsKTrZO4KLWVLNXeWmOwGzDTe8HV5Gv/Yx75G6jELX2
         7xQc4WKP7TH+rwo0DQOQ5YlHwftIJfMdoFm2y4Pqk9XzVfgqr7YdIM9MJGzkQW4hGmPa
         W2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857352; x=1794462152;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sJwxZdaMomxuzSPkUcgYTRWffu8jQrOj7UECiYOTgBY=;
        b=QFAG8VhbgRM87+OHxwXxRo0uOCE/rQ4Tdl1j5pMrxvRsHUyjHq24Io5oVVfCwqconT
         7YrMwnGDs82W0HCEpW/IbDEQgxnKLphatEplQUJRgRYVMQ0qA6GC2N+jmoG04W2TPM5x
         BFOqAt2WcmooONNVskhZ72kcl51WQSeHnVZtEHficQzLCAVRQxI/hzTXQUeSSuhHV+zZ
         rqhDZrj3PHrj1lPRfyv5ropKkjGmKamcCT9wKu+mBd5TGd46hoH0SzlEmoyQa+BfX6jH
         Fv3OD8/3HS+yymvtq61xtKIATX561YF0AAtHbaTRI84pnNSLh9G/gbXwuTV3XJozklDz
         nkbA==
X-Forwarded-Encrypted: i=1; AKwUvBzDtztADPicpiv4av9HzKJvxJTJXYD3JBezftZW9NQ1sWe3cRQzeSD/rjd3xwDnJkLzCTioB+4nOaG9J8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8taBw7J2GjPSwIoyGBJ3oT1B7uHQBWI4AHSIxMH5jweYRtMVmk
	sIdYId8g7M+zVZ7XXWTDydhm7izsEGryodoSb+DO+xRlLHSxP96LO9ID/d8aMJHZDvT2EhPDHav
	shMcEeAc6gkBF5QlSTixwHuBDrzdidYQ=
X-Gm-Gg: AYBFou039Zgtbyvgl0/gCECdI8WaxHYBLDp2RjeMdJAdX3SkI5cK97AUK8K2kHFq7nz
	UJNuBEHS99VV7GC9ke/J/ap4nNqipgpKc7sMqHqIMaYr8M9R0G9s4tM2kxjW7OlNrYk1/sqU+kI
	30XYUCL4musau3Nz2N1nLjEsycX+R3x289Cwoz3D+9TSgf5H0cxqH2pptQ0LuSFmbgjBxVBW/mf
	5ci6MT5+YCC6GD8A5Afce86we1f8D6cNa4DpDhTAZxuBYAfHF2xIfRo1WexB086I/vShgd4Wby/
	0TuPgSTgO8rGuOQVuRpPOuV/5VXleitm7/TVxIdxOLyPxPlM03DOBuv78+cO1E8/FXgMI1TetEr
	lzrML+O5x5iY4v5YHXlqoB7XBMs6QcmZ4DNGQgw==
X-Received: by 2002:a05:651c:3605:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3acb7a2bd0cmr44712301fa.5.1793857351847; Wed, 04 Nov 2026
 21:42:31 -0800 (PST)
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
Date: Thu, 5 Nov 2026 13:42:19 +0800
X-Gm-Features: AclHuK87av003HGGv7TYWaUqf2Nj99Vy2yPpXmd11YNPMJBG96--wmz1nktymeE
Message-ID: <CAO-4RZ0mqFEU8z44B+biaMw5Ee4ogCjs80Uws9YY8LMV7J685w@mail.gmail.com>
Subject: [BUG] btrfs: WARNING in invalidate_and_check_btree_folios, during
 unmount on 7.4-rc1
To: dsterba@suse.com
Cc: mason@kernel.org, linux-btrfs@vger.kernel.org, syzkaller@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Btrfs maintainers,

We observed a WARNING in invalidate_and_check_btree_folios() during
Btrfs filesystem unmount while running syzkaller on Linux 7.4-rc1.
Because panic_on_warn was enabled, the warning escalated to a kernel
panic.

Kernel information:

- Kernel: 7.4.0-rc1-kernsight-kasan+ #3
- Base: v7.4-rc1 (6628e7d4c), plus one local io_uring SQPOLL fix
(00043c58565e2d0d804f50c2e127f6966cd594af). The Btrfs source is
unmodified.
- Architecture: x86_64
- Environment: QEMU Standard PC (i440FX + PIIX), KVM
- Configuration: KASAN, CONFIG_BTRFS_DEBUG=y (full .config in repository)
- Fuzzing framework: syzkaller

Warning:

    BTRFS info (device loop3): last unmount of filesystem
    0cb7aac4-39d5-48d7-a0de-5529c14770b2

    ------------[ cut here ]------------
    IS_ENABLED(CONFIG_BTRFS_DEBUG)
    WARNING: fs/btrfs/disk-io.c:3326 at
    invalidate_and_check_btree_folios+0x5ce/0xbe0

    Call Trace:
      close_ctree+0xac9/0x16a0
      generic_shutdown_super+0x169/0x3a0
      kill_anon_super+0x3f/0x70
      btrfs_kill_super+0x41/0x60
      deactivate_locked_super
      deactivate_super
      cleanup_mnt
      task_work_run
    ...

    Kernel panic - not syncing: kernel: panic_on_warn set ...

Some initial reports carried the SOFTLOCKUP taint flag (L). We have
not established whether an earlier soft lockup contributed to those
reports. At least one independent reproduction was reported as "Not
tainted" at the warning site.

Reproduction:

- The warning was observed 19 times during concurrent syzkaller
fuzzing, with the same warning site and call chain.
- We reproduced it three times on fresh QEMU VMs by replaying a
recorded set of 483 syzkaller programs extracted from the crash-store
execution logs and a state-primed recipe.
- The reproductions used syz-execprog -procs=8 -threaded -repeat=0.
- Time to warning was approximately 32 minutes, 45 minutes and 2
hours, respectively (kernel uptime 1807 s, 2732 s and 7445 s).
- We have not yet obtained a minimized single-program reproducer.
Automated minimization did not converge.

Additional diagnostics:

We also reproduced the warning with panic_on_warn=0, allowing the
kernel to print the extent buffer diagnostics following the WARN.

Four instances were captured:

    BTRFS warning (device loop4 state I): unable to release extent
buffer 6881280 owner 5 gen 9 refs 2 flags 0xd
    BTRFS warning (device loop0 state I): unable to release extent
buffer 6885376 owner 5 gen 9 refs 2 flags 0x1d
    BTRFS warning (device loop8 state I): unable to release extent
buffer 6885376 owner 5 gen 9 refs 2 flags 0x1d
    BTRFS warning (device loop1 state I): unable to release extent
buffer 6885376 owner 5 gen 9 refs 2 flags 0x5

In all four instances, the recorded reference count was 2,
corresponding to the expected baseline references described in
invalidate_and_check_btree_folios().

Two instances had EXTENT_BUFFER_WRITEBACK set (flags 0x1d), indicating
that the extent buffer was marked as under writeback when its flags
were printed.

The other two instances (flags 0xd and 0x5) did not have
EXTENT_BUFFER_DIRTY or EXTENT_BUFFER_WRITEBACK set at print time.

Since WARN_ON_ONCE() is executed before the diagnostic message and the
flags are read later, these observations may reflect changes in the
extent buffer state between the initial condition check and the
diagnostic print.

The results suggest that the warning may involve extent buffer I/O
state during filesystem teardown rather than an additional reference
holder. However, we have not established the underlying cause.

Related fixes:

We checked two previous fixes associated with extent buffer cleanup
and reference-counting warnings:

- 4066c55e109475a06d18a1f127c939d551211956
- 690c2accacb1aca91ab8186d15dee56da8723f31

The corresponding dirty-pages cleanup and reference-count
synchronization logic is present in the tested source tree.

We are not yet sure whether this is another manifestation of a known
issue or a separate extent buffer lifetime problem.

Logs and reproduction evidence:

Repository:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro

Kernel configuration:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/config/kernel-7.4-rc1-kasan.config

Initial warning and call trace:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/kernel-warning.log

Full serial console (independent reproduction):
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/external-repro-full-serial.log

Additional reproductions:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/serial-btrfs-repro2.log
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/serial-btrfs-repro3.log

Extent buffer refs/flags diagnostics:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/refcap-refs-flags-diagnostic.log

Syzkaller execution log:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/logs/syzkaller-execution-log0.txt

Reproduction program set:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/repro/program-set.db

Reproduction results:
https://github.com/Zheng-zheng-codes/btrfs-extent-buffer-warning-repro/blob/main/REPRO-RESULTS.md

Could you please advise whether this warning is related to a known
issue or whether further diagnostics would be useful?

Thanks,
Zheng Zheng
