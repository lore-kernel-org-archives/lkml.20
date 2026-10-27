Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086839;
	b=vFU3EGz92ZZv9Q2xe4X7FQwjjlGJrMPLx7LOSDlYc3B0V7dNN68zVq4jr+tF9gfNxY0D
	 lhg9Rql2Uo3jbyAVv2vNssxmt5Vn6EL8/ECNXu8eQVlfMbByu1qu86Jzr4hOCBpFUdyHF
	 BrKsoYGOg38JDHjo0OhZ8bofVwM/mpvdBdGNLQvMJf/Q5qiUmAK5vg04p8mgYlsh6uggM
	 PpSFFmebNJlTAbHEQ6UgE0WxH+pOkRlrp56Rv+Kgeu1imXmXzus8KEC1wD5nproeSeBgA
	 xYbV1I71cPs0eh+4hdV+Ynit5FKxUikGXBIedZXlepKpCprDrosYu3xT5eLwXt1/TLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086839;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0dSKP4mzbhr4ZbEkscIx3I5WqNRn/Q7p4AbTndmod+Y=;
	b=QATTdBw2GJ+koqOBEWMhsZHIqk1De0klA3CtNabFmUrCJQ4nNnTCPDudYSCECB/cHZ2w
	 Ki7cxR2OOvC9yw7eqmkZwwVxrZ5lMW0DQXWJVb7BXIrb04PSl7XSKgWkA/8glBxqJ5Jkp
	 T66fqZEAXUMxecoZO3omrpF9Pq5NtB5ASOWyGeLLRNy2OTjiu+WFfNapyvLUWYE/7oZu3
	 98xKJpuaVJ+T3ndGWhSMNZAjTjRV2GtYrJuCbwR+zunqGIuSbR0gOH3uz3lIjlH6CtJNE
	 LBaADxE3fxWBCWLZRYoBTh9pQQWmLYIQEx6RzZ3adGdiutYrPdKplrV9z02+PTJIXdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=s06zv9MW;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7CB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=s06zv9MW
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793086835; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=0dSKP4mzbhr4ZbEkscIx3I5WqNRn/Q7p4AbTndmod+Y=;
	b=s06zv9MWbwbi4uLqObJXwtSUh7wK4oHft9IifWlgbQkO/bXMWIslvNrHyVlbC/fCcbMrRlY01dg02lKz0YnqjH+lWmVnMP4/SjOHf3RQ5tBZCsharxd0GwF/DiZlB/lw7C2HoVCVpcm5564IwTpGG52gWq6iV0Io45Ri4fQb9V4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XDd6LIt_1793086828;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDd6LIt_1793086828 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 15:40:34 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pratyush@kernel.org
Cc: graf@amazon.com,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org
Subject: Re: [PATCH] kho: Skip zero-sized bootmem areas
Date: Tue, 27 Oct 2026 15:40:25 +0800
Message-ID: <20261027074028.13042-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2vxzld7kpmmi.fsf@kernel.org>
References: <20261026131851.9942-1-cp0613@linux.alibaba.com> <2vxzld7kpmmi.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Do you see zero sized lowmem or global scratch in practice? If yes,
> how? What's your setup?

Yes. Enabling KHO for riscv64 gave me three cases. They differ in which
size ends up 0 and in what it costs, and all three are measured:

  #  condition                     size    cost
  1  all memory below the limit    global  empty area kept
  2  no memory below the limit     lowmem  KHO off
  3  kho_bootmem= with explicit 0  either  empty area kept

Case 1, measured with a temporary pr_info(), not part of the patch.
riscv64 defconfig plus KEXEC_HANDOVER, cmdline "kho=on", four RAM sizes:

  mem   reserved_low   reserved_any   lowmem       global
  1G    0x32d3ea5      0x32d3ea5      0x6800000    0x0
  2G    0x4557164      0x4557165      0x8c00000    0x400000
  4G    0x4000000      0xa7116e5      0x8000000    0xd000000
  8G    0x4000000      0xed121e5      0x8000000    0x15c00000

riscv does not define ARCH_LOW_ADDRESS_LIMIT, so it uses the 0xffffffff
default and every reservation is below it; the two queries then agree
and the global size is a number scaled minus itself. The 1 GiB case is
exactly 0, and from 2 GiB up a single byte of difference between the two
queries is enough to leave the 4 MiB minimum after rounding up. The 0 is
recorded, not just computed - /sys/kernel/debug/kho/out/ on an
unpatched 1 GiB configuration reads

  bootmem_phys:  0xb6400000  0xbcc00000  0xa2c00000
  bootmem_len:   0x6800000   0x0         0x13800000

with the middle pair gone after the patch.

Case 2 is the one that actually costs something. On a riscv64 platform
whose memory all starts above the 0xffffffff default limit, unpatched
and with memblock=debug:

  memblock_phys_alloc_range: 0 bytes align=0x400000 from=0x0
                             max_addr=0x00000000ffffffff
  KHO: Failed to reserve lowmem bootmem
  KHO: Failed to reserve bootmem, disabling kexec handover

The size is 0 because nothing is reserved below a limit that has no
memory under it, and the range below the limit is empty as well, so the
allocation returns 0 and kho_enable is cleared. KHO ends up off on a
machine that needed no lowmem area at all, and /sys/kernel/debug/kho is
not there. With the skip the same machine comes up with two areas and no
error:

  bootmem_phys:  0x1000f3400000  0x1000ca000000
  bootmem_len:   0xdc00000       0x29400000

Case 3 is a cheap way to reproduce the recording of an empty area on any
architecture: the parser rejects the explicit sizes only when their sum
is 0, so "kho_bootmem=0,128M,128M" is accepted and the zero reaches the
allocator. On an unpatched kernel it gives

  bootmem_phys:  0xbcc00000  0xb4c00000  0xacc00000
  bootmem_len:   0x0         0x8000000   0x8000000

and with the patch it stops at the two real areas.

> Note that I already fixed this for per-node areas since those do end
> up with no allocations with movable_node set [0].

That one covers the per-node loop only; lowmem and global are still
unconditional in linux-next today, which is what cases 1, 2 and 3 above
are about. Is there anything I have not considered here? Please point
it out and I will follow up accordingly.

Best regards,
Chen
