Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794898305;
	b=1eOQ208CQFQa0ayUT0caTIUcvQW/fxHsl2mA84Y5hmbQ+iC5uMpyOx23z43TaDaMcwh5
	 OapIauqprZrPbdccxT3LYXsoyJqwGTBdFi0xRPDxrrQXa0ANP76CDru573/vpYTKiVgzv
	 wCH/dwO6risHNkYz5WRj9vt6UKzOHq6B+u5RJZQtProK9zv0WdfigZN+YBughMluHcRHm
	 JGH5pHgLxexFRjxRn1qTWi0UZDl/PFW9OSk5Jf4PPyy8vO4Q5E0g10+LoKO7axm+wRbGP
	 NYEugzAoNG1BlkQXhbVBjM9HRqdTwH3vBClQ/WA3pFeYZ7ITZBiDn4Qq8xRPJkUagBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hPSUk+irIwnxGrE8T/ciuKFUm1SYddVzk8aA64/IVHM=;
	b=4Tdc+7T519WBKOvzOd+4so3fvWhfmZ+Zpc9WMUZE2fx/nkLITf9Gvi5T5DTucO85djtN
	 /fNeFnZ/d6vZ02R3t3yR8s3MVNtbcFizTU0XV7oyQwY/8NnMbLOFqoe12tnCwzJb1opFs
	 gHFfvcsSPYsn2oT+gkDnr63X2cUTBZKpo42Y8Hb/99/hb34Y41E9Y9WiwLUp2tJpyQMaO
	 WEiZU89liSFRWcZFhOx0LV8V7aedaOFD5Bu/uILg2pESOFNquSS9vHrd/dpiLEvHwLMjd
	 Jkc5bUKmdos41sG5HbeM+zygH+zI4KaUrnjk0NJdPRHNrxKVh9H8PWIdeUDMIB0mhrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsA4o4w9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.69
Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7258606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7258606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsA4o4w9
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3ab461daab0so20718961fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794898303; cv=none;
        d=google.com; s=arc-20260327;
        b=qe5jJvibScqmPLuAJEFv2EeySOxPH9WK/jFOihFKuH9h5zunQfIaEc/3ESvIlO0X6J
         s4QRq+kz6PgxdhqU8AzMwv5LgeH/GmQLb8y300wnNIBKEWkpdagrJxgBTDhIIfISbhrc
         RjT9k6pmhZOoaLpblKC47IZRZJQIMXMuyjcm9lHWl408o3vaObqV7pZ0JUAe4C4pdLm6
         BzLYGjeeuIo96qyV8UvEw/uBlimUhEGEPLgf1g2P52QMcFg2CNLPYto9F5RJNhsoNMcG
         Pd2MHEUglepUSq4yxesOdn+P1GgZ1PqhBwF3F1krEBVBUdcIkmXKE+wRYgMDxIohdYLV
         QquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hPSUk+irIwnxGrE8T/ciuKFUm1SYddVzk8aA64/IVHM=;
        fh=Fa05e9g3RGlB2IGKnkcyQhmUn87t34nNvqXCO8aJ5mo=;
        b=Bpn1/6FgUMUTm5Z2iDQv7xGSiK7Lqh6YNG7IYLXsClwqO0esql5gPTxQl/gRK99xZz
         czwytbQZAPlDB2+CgjluyD6owbH4CxuYBJxZAcgdAbt/E9vxsq+q4Scy5Jq7Rmjcs5We
         50cwBHQxXom8FO0T1z+GVgauytceMKG/B8fqht8U+JFQ2r4+eLtslmjFGki49o98ypBR
         +y6qMX6NbvC6NYiWM5bNWGlunIwk5vkFaSlYlMVPkkFHGyP4+acdmfH6+4OtWwu7ZnkN
         ZGhDV663RGkUTeBWbIaZpyzRUJhC5QSdkeg1gYi+2ru03wtDUbJmS2/Bv9A2R6hJlx6B
         WcCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898303; x=1795503103; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPSUk+irIwnxGrE8T/ciuKFUm1SYddVzk8aA64/IVHM=;
        b=nsA4o4w92e0aUonTEC1ZL/ygwT5O2ipxn6vw5wAfWOQg8vmfOb3XZSawHGzGejTPjc
         al1o+ws7Vi1K1SKR2plFuEdY1VXokZB7r7CXoOunW3H2qM/ndFFeGLbubj3VV98X2jqh
         orbcp+9yUtocQ3laHTa1B3lqjcODGDiRC4fym59zlN+7aEyea9kJTMbDzQY8kC6KseUw
         BCKdUtCbzpV7Yua8Mmcu8xbM8b5roOyRmeSBd/vuBl5Hk4GOJ6aVDD0xC5pWQSemzxOG
         G9Q+oCaA1EjtrYk8SGqFrL8XqVfXLvE8GWYbYi2s4eTginx1S72j3UEFweAYKI6kNdhC
         SP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898303; x=1795503103;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hPSUk+irIwnxGrE8T/ciuKFUm1SYddVzk8aA64/IVHM=;
        b=KhfAQy0Z8jumFig96/u3Td/W9dhpawh3E6I4xtpbWaX9Xh6unxKtsiZ/s2J6K5gjDD
         QiuGF9R9Y/2GWPTM25j9aBaWWRP07uYy3j5y/Bfj3LCDlU7wWpmdepVNy4yJJJOUJ5l7
         lVPDxwMGF+APUt52i8mzXgGxqWNjt7xJU6EopyvUVKaNWirWMSN/fLfDxW2AhW7nRzxN
         UfF4wZd6pkpu6E+VI0wyYpP8LayrsLLSBvUYoR/bhZI7A50tmCbYKk2pPZ6X8wVzvb2S
         HGnna0E3nJDCN4rsdKPZLpUdZzEhMAItBjvlCw/idxIdklZRhczDXrVJaXO5F2ey8sw+
         hylg==
X-Forwarded-Encrypted: i=1; AL+hErGD04ixiykmSD+35RCm/VsWVQe0Cijfd0Wq16Lq8PdijvtGZ4dxM2l7qnVwyaPKH1ZoVQ7o5gDvYzvb78M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AmUt2x2dJJhP2O6sOQj9GfWLbcIB0sQje6yZNJKwH56u/0FgU
	dZSBVX13E1boQ4toK0mIt1W5Hd5BatLkBCVH0a5rRGSAX0HUxiMMkrnSU1VY7vMyoKpWSBfLK74
	oKEvrFDNPAO8EfVcFt/2TulhYwZ7fLpg=
X-Gm-Gg: AYBFou3TTZV7nrVyoGSg1sdlzcGDgLJrDWyiTyhuy955a82YMVgHrQcWNIcMp3bJgSi
	G3o/q/lBUfkdowwXpfV4kjeFyCbNgc8+lWM36lrkNhwe+tVc2+BEwpWPFo/NXcrs/QAGnu3WTvM
	13cC+UNRck5gOUdNKTEhZTVLW/QAn6d1N20/HDyXI4vD04k8L6hdOEzsK0P0EQtkWTuTlJgToQY
	OvsxOL2vOT6eIXZCoAXdaewNlbWBeCerd2JG+yZVuAnpQbYG7Qaly56j9lrTmmqBigRBS+W+VPe
	q4SAeorj9JyimWcACU77gTGcTc79PLXdHAdGzzSX+qJOM0F5UnPfIuBSnuNBFaIL46w2PbJ9vwv
	mVBrtQzj6XpMlV2UUOSrqOyJV+yfUtYus4EABBsrLtyu64jCTBSWwbrq9ce97jzJSjGj8zQ==
X-Received: by 2002:a05:651c:199f:b0:3ae:25fc:66ee with SMTP id
 38308e7fff4ca-3ae2b4bc376mr40394291fa.14.1794898302442; Mon, 16 Nov 2026
 22:51:42 -0800 (PST)
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
Date: Tue, 17 Nov 2026 14:51:28 +0800
X-Gm-Features: AclHuK9-LoUVdHftMYHvIyHY9bPKBGHQL9OF4RgvrHt7I3K2GXOVwkZQ5H2k4aE
Message-ID: <CAO-4RZ3n2NFZkVDdOW7o5WvsZ=g7b=8mPrq5jLkKL1Fw2P+cxA@mail.gmail.com>
Subject: [BUG] WARNING: bad unlock balance in ntfs_readdir (fs/ntfs3/dir.c:625,
 v7.4-rc3)
To: almaz.alexandrovich@paragon-software.com
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

We found a reproducible lockdep bad-unlock-balance in ntfs3 on v7.4-rc3
with syzkaller.

Warning:

  WARNING: bad unlock balance detected!
  7.4.0-rc3-kernsight-kasan #1
  -------------------------------------
  syz-executor/10086 is trying to release lock (&ni->ni_lock) at:
  [<ffffffff833e9657>] ni_unlock fs/ntfs3/ntfs_fs.h:1267 [inline]
  [<ffffffff833e9657>] ntfs_readdir+0x7e7/0x1170 fs/ntfs3/dir.c:625
  but there are no more locks to release!

Call trace:

  __dump_stack
   dump_stack_lvl
    print_unlock_imbalance_bug
     __lock_release
      lock_release
       __mutex_unlock_slowpath
        ni_unlock                 fs/ntfs3/ntfs_fs.h:1267
         ntfs_readdir             fs/ntfs3/dir.c:625
          iterate_dir
           __do_sys_getdents64
            __x64_sys_getdents64
             do_syscall_64

The reproducer mounts a crafted NTFS3 image. The log also shows a sector
size mismatch:

  ntfs3(loop4): Different NTFS sector size (4096) and media sector size (512).

That mismatch is an observed reproduction detail; we have not established it
as the cause of the double unlock.

Analysis: in ntfs_readdir(), the code drops ni->ni_lock before
ntfs_read_hdr()/dir_emit() and reacquires it afterwards. If
ntfs_read_hdr() returns a non-zero value, the `goto out` path skips the
re-lock, and `out` calls ni_unlock() again. This includes negative errors
and the `+1` "directory buffer is full" return value:

  ni_unlock(ni);
  err = ntfs_read_hdr(...);
  if (err)
      goto out;          /* ni_lock is not held here */
  ni_lock(ni);

  out:
  ni_unlock(ni);         /* double unlock on this error path */

A reasonable fix is to distinguish the two cleanup paths instead of
unconditionally re-locking: after the explicit ni_unlock(), a non-zero
return from ntfs_read_hdr() should jump to a cleanup label that does not
call ni_unlock(); the normal out path should still unlock. A bool lock_held
flag or a separate out_unlocked label can express this clearly.

How to reproduce stably:

1. Build vanilla v7.4-rc3 with:
     CONFIG_KASAN=y
     CONFIG_PROVE_LOCKING=y
     CONFIG_NTFS3_FS=y
     CONFIG_DEBUG_INFO=y
   The bzImage used here has sha256
   0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882.

2. Boot a Debian trixie x86_64 guest (6 GiB RAM, 4 vCPU, KVM) with at least:
     root=/dev/sda console=ttyS0 oops=panic panic_on_warn=1
   The full QEMU command line is in environment.txt.

3. Copy syz-execprog and syz-executor built from syzkaller commit
   853b104bb454141a5b0fc0e4218ec78e9f34ffb1, plus
   reproducer/repro.kernsight.prog, into the guest.

4. In the guest, as root, run:

     syz-execprog -procs=8 -threaded -repeat=1 \
         -executor ./syz-executor repro.kernsight.prog

Expected result: "bad unlock balance detected" with
ntfs_readdir+0x7e7/0x1170 after roughly 120-145 seconds. This is a lockdep
report, not a panic; panic_on_warn=1 did not escalate this particular
lockdep path in our runs, so serial/dmesg is the success signal. We observed
the hit 4/4 on fresh VMs (runs 1-2 with -repeat=0; runs 3-4 with a single
ordered -repeat=1 pass):

  Run 1: 138.18 s
  Run 2: 144.69 s
  Run 3: 119.98 s
  Run 4: 141.08 s

Source/line-number check: the unlock is at fs/ntfs3/dir.c:625 in the
v7.4-rc3 tree used here. The file is identical to the torvalds v7.4-rc3 tag
(sha256 86fa0e100b32c38980b72767cfb905acacebe8b7c7eb26c39bf13b6bde5cd768);
addr2line maps ntfs_readdir+0x7e7 to line 627 (adjacent/inlined unlock),
consistent with the reported line 625.

The reproducer is a 177-entry state-reconstruction recipe (168 replay
entries + 8 priming programs + the triggering testcase) and is
self-contained. The old 1131-program external program set is not needed.

Repository contents (all v7.4-rc3):

  https://github.com/Zheng-zheng-codes/ntfs-readdir-bad-unlock-balance

- README.md: phenomenon, root-cause analysis, stable reproduction steps
  and verification results.
- MINIMIZATION.md: notes on reducing the old 1131-program set to the
  current 177-entry rc3 recipe.
- environment.txt: rc3 kernel/guest image hashes, QEMU command line and
  syzkaller revision.
- kernel.config: v7.4-rc3 kernel configuration.
- reproducer/repro.kernsight.prog: 177-entry self-contained state recipe.
- reproducer/repro.priming.prog: state-priming portion.
- reproducer/repro.prog: triggering testcase.
- reproducer/repro.report, repro.stats, repro.outcomes.jsonl,
  repro.context.json: pipeline verification evidence.
- logs/log-0.txt, logs/report-0.txt: original rc3 syzkaller log and crash
  report.
- logs/machineInfo-0.txt, logs/title-stat.json: guest environment and title
  statistics.
- logs/external-verification/: full serial consoles and run records for
  all four fresh-VM reproductions listed above.
- logs/external-verification/verification-summary.txt: concise reproduction
  summary and hashes.
- SHA256SUMS: checksums for the inputs and logs.

Is this error path the intended one to fix, or am I missing another place
that should hold ni_lock before reaching out?

Best regards,
Zheng Zheng
