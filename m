Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081254CCDC7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393256; cv=pass; b=p8/S+HOo7mC/SyFcETVVOiFHBMxE6qZehB2uTKZcNpym6a2WRp2zm2LFDRvV0grEEbwTbFLS04fVrQXvuB05be/e7BDXAOsP1PrcMUXkabzqflc6yib/jFd1NiODeX16YROYTqpLotCipBboSUgFZOpBcdER9dKz6MXr69HwgnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393256; c=relaxed/simple;
	bh=wY5lJZFzaMcw6lGnaMo4ikBMYHZ0CfsHVCatbmTFMh4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iC61FZIUXhFgtdCxfk0c9SVCOfLUzdvGJTfSNgeIbydzZQwGAQQW5cggAxTHA7EmTvO48Or2RsydEk25F1/IL2fH+KjTnJxf3o8s9K1Mf4OdShr9/UNtjHQQP8eP8jfPIw9vuM/rLCpnqmXPvihNkSGipZaqsUApxjDvPz6Qawg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skvi37mg; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skvi37mg"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517dc520840so19796391cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788393254; cv=none;
        d=google.com; s=arc-20260327;
        b=gU5CpSmGLQ9prsynlTHJoJcMYeC4imTUX20kyzkxshDujRtGoCVDml/6GNwoKOGzL8
         lmd5iEvr4hzCVZvN2nTF89+UulW63MhWLwS/thipEZNs+G6VLANaOxwyKrHFlimk5MzL
         7R3ThO2az8114NMYROqv/moqMJAlQf3F5hes2OPSs0fivCcpeSAB/sKzwvgzr0Tz3ZCM
         38F6V+A9NUizJWLHnchDETNap8U2yq+yzbYxgpSODk2zySrsYImNhmAuYQhKm7Q9GFC0
         90lihz/aXR62911JDgfcfJQhId/aqO/O2w991Vn9Blk6iQcS12OcxqKHkPuONV1GyU7W
         7u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QGffjQeMvyurGQHkRNi9cRzIRToYPu/kZD1UWhsH/5E=;
        fh=dld+SvmToRRvf+eCu57XH0gU9ljQAb4RHMv/oi3Sapc=;
        b=Cknhqlgq7Pinud/fs4gIKTTXh1SJWR7ZjjLvQ8/w5Y9xH0CdX2gd81FKmZS6S+8hsF
         ZTdaDJaOENMa7fNMML/cEOGQf5jW4eooUvr8x3J3NVmPAFtBYVhLMwMdg9EwvcUePRZd
         tClLPCEC6mf1qHri1xCS1XX5XETQB8I/vTJ0neMug2rQRbl1vetFdeTprSFpxE+u3orT
         V/CCZyEIxvd8xCgSjBN17zLjHIzuCEVIp8OG22qNr3EWsg/R1EJ2LiwAk9O4iNFwf4mt
         SVMj0y6molWG+2H07E6NKppEEtXgcJVIuiEyif46kEAaSpV+56bXLE3NQoT60kFRcJ+E
         wBLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788393254; x=1788998054; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGffjQeMvyurGQHkRNi9cRzIRToYPu/kZD1UWhsH/5E=;
        b=skvi37mg96Zvrp2Bgys5jYmA+v5ABjc2XDMBvZm8ZgeLJMJdHx0LRmHWpFilHy1N+P
         hrir2PJUzgXdZTfdxi3QK5M77xFOeTB+62LNrrqDoXCNocwBL6xEwkb0KTQQPmDrRapr
         TSWeF42cmy298xa78E7as1uG5dcrPwqHDV7ZwgI87MNUQBV6Kcq8asPVCSvmy4cP+uC8
         GmanVLWmxQ6isCJGo5wB4i+8gpHJbwLrWBAwUb18yXZeF7L3T4c99uew/WFSH38fHFhT
         FU1XauIks16x5mNa0oi2/d9RNM13h1qe+HgPS58V9qDkTHDakN55nm5IWq5nZeXe+8V4
         Xs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393254; x=1788998054;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QGffjQeMvyurGQHkRNi9cRzIRToYPu/kZD1UWhsH/5E=;
        b=SCSJ6eyzW2DfkSxXObYVPhnONaQF/4wFZZd4Y1s/zLNgyisq0z1KN4dmvKILl8jh2y
         RUrDvzZjZvW3YesjBuYz03tp1RCRsVceRhseqnYfkgC5ZT3+1Dwuo2bPgmLBq/xYQHSO
         7aC+rTBgK9HOKkuVgTcm95/XHI7RUUlqCngW5NPOIfQLMs49eIk7BqOaUcbbOwEY6FHE
         LTWZK6PE4HgHh17hXo6tNHQfwxf7tb+nv+0axJh5vLFWuijxpZDgHGmMNhvAcpHsc3lU
         /7x2ptba2mFcg+jTZJkks3sRJoyZgf4w5EDAutSku3ZEepEIL1jxso5ORCn+fiK5uIon
         Dsyg==
X-Forwarded-Encrypted: i=1; AKwUvBwAJqIBB5556LaSNfA/UdOwB0FIAwvMGFLB+I8f3qGNCYCR184b9XcuwboN+gZtvxf9Ovw/3d+txjCBkoI=@vger.kernel.org
X-Gm-Message-State: AFuF++nI/awG41JgD0D/RUoHSyAYOL+1kucRHhmsbbJ3t1wnk4KZNQwU
	5e99OmbRd+XrXhRLHiZ1ZE3ndcWSMtchJsid0FLu+Cb64mYGqVVUTtiXAmHuRzj31B1EXvQil76
	VeZRfqU3P85rYAy4bzcVSyzJQqMVQoq4=
X-Gm-Gg: AYBFou3+fxRI8PYHh1MBb3eQF7v5mj/WPe/vz5+oLxPgQkd3F0LOuO1QMhyWkLQvD8a
	pVhCgsU7pZ3soGkkVCYdoik9D7CJ8Ubk/iMQ4t9Stkw3LJu/Lb44LYkc8+OctukDAmu0rbznfgp
	pkTfUYUyn9LNT8DbEAqhW8298MvsuvUzBMItS6TcvQ4iDfocVExlf7Gl4YtPuKPulWmxqbafQYc
	PHm0bjpjbeVbgSEf6kRe7g8eGENgzHgtgBTedeHCP47S/ed+ecrDCxG0l2q7XRCDs4ZQfIlMslL
	FAGnJuQAO4Iy17dwFP0VZ6FZsisw6rAfHPtdVtnMkNE=
X-Received: by 2002:ac8:58c7:0:b0:52d:ce86:1393 with SMTP id
 d75a77b69052e-53036d2c206mr106348661cf.37.1788393253917; Wed, 02 Sep 2026
 16:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ville Poutiainen <villeaj.poutiainen@gmail.com>
Date: Thu, 3 Sep 2026 02:54:02 +0300
X-Gm-Features: AcwNN1VgxA8NMmM_IBkCVkoKeFvRLWGWd20bsg6PZZOw3hS4Z89zOr3rMaMTVUs
Message-ID: <CAKT_hvzXo14ER3NOc3pWhNmXbp0suVoQ8D+KmC2YzrfrBhWb+g@mail.gmail.com>
Subject: [BUG] tcp: NULL f_inode in listening_get_first() leaves listener
 spinlock held
To: edumazet@google.com, ncardwell@google.com
Cc: kuniyu@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I encountered a kernel NULL-pointer dereference in the TCP proc iterator
on Fedora 44, followed by a persistent listener-bucket spinlock lockup
when another process later read /proc/net/tcp.

Fedora bug with sanitized logs, exact kernel configuration, and decoded
vmlinux analysis:

https://bugzilla.redhat.com/show_bug.cgi?id=2527805

Affected kernel:
  7.1.10-200.fc44.x86_64

Architecture:
  x86_64

Initial failure:

  BUG: kernel NULL pointer dereference, address: 0000000000000230
  #PF: supervisor read access in kernel mode
  Oops: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 1000 PID: 1634 Comm: pasta.avx2
  RIP: listening_get_first+0xc0/0x120

Call path:

  listening_get_first
  tcp_get_idx
  tcp_seq_start
  seq_read_iter
  seq_read
  proc_reg_read
  vfs_read
  ksys_read

The userspace syscall was read(fd=16, ...). The process was pasta,
performing automatic port discovery by reading /proc/net/tcp.

I obtained the exact Fedora debuginfo/vmlinux matching the affected
kernel. Its Build ID is:

  4c9470ef910bac97b4554b740c84f337cada5950

GDB against that exact binary shows:

  struct seq_file.file     = 0x60
  struct file.f_inode      = 0x20
  struct inode.i_private   = 0x230

The relevant instructions in listening_get_first are:

  +0x8f: call _raw_spin_lock
  ...
  +0xb8: mov 0x60(%rbp),%rdx
  +0xbc: mov 0x20(%rdx),%rdx
  +0xc0: mov 0x230(%rdx),%rdx
  ...
  +0xff: call _raw_spin_unlock

At the fault:

  RDX = 0
  CR2 = 0x230

Thus, as far as I can tell from the exact binary and register state,
seq->file->f_inode was NULL while the active /proc/net/tcp read was in
progress. The fault occurred when the code then accessed
inode->i_private.

The listener hash-bucket spinlock had already been acquired and the
Oops occurred before the normal unlock path.

The kernel continued after the Oops and reported:

  note: pasta.avx2[1634] exited with irqs disabled
  note: pasta.avx2[1634] exited with preempt_count 1

A few minutes later, "ss" became permanently stuck at 100% system CPU:

  native_queued_spin_lock_slowpath
  _raw_spin_lock
  listening_get_first+0x94
  tcp_get_idx
  tcp_seq_next
  seq_read_iter

The listener-bucket lock address in the original pasta Oops was:

  ffff8f0d05894ec0

The later ss soft-lockup was attempting to acquire the same address:

  ffff8f0d05894ec0

The watchdog subsequently reported the task stuck for 26, 52, 85, 112,
138, 164, 190, 216, and at least 253 seconds, together with RCU stalls.
The machine ultimately became unusable and required a forced reboot.

Crash-time userspace configuration:

  passt/pasta:  0^20260728.gf8df3f1-2.fc44
  RootlessKit:  3.1.0-1.fc44
  moby-engine:  29.7.2-1.fc44

RootlessKit was running with:

  --net=pasta
  --port-driver=implicit

which caused pasta to use its automatic TCP/UDP port scanning path.

The first Oops was tainted G OE due to the NVIDIA out-of-tree/unsigned
modules which were loaded on the system. I have not reproduced this on
an untainted or vanilla upstream kernel.

This failure has occurred once. I have not deliberately reproduced it,
because once the Oops occurs the leaked spinlock can lead to a
system-wide lockup.

The machine is now running Fedora kernel 7.1.12-200.fc44.x86_64, but I
also changed RootlessKit to the pesto port driver. The current pasta
instance uses --tcp-ports=none --udp-ports=none, so the original scan
path is no longer being exercised. Therefore the absence of another
failure on 7.1.12 does not establish that the kernel issue is fixed.

I have not established whether the underlying cause of the NULL f_inode
is a struct file lifetime/reuse problem, other memory corruption, or
something else.

The Fedora bug linked above contains:

  kernel-crash-public.txt
  kernel-config.txt
  vmlinux-analysis-public.txt

The first file contains the complete initial Oops and subsequent
soft-lockup/RCU traces. The vmlinux analysis contains the exact
disassembly and structure layouts from the matching Fedora debuginfo.

I currently do not have enough spare compute resources to run a
controlled reproduction on current mainline, but I can provide
additional targeted information or perform a specific test later if it
would help identify the cause.

Regards,
Ville Poutiainen
