Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50147FAF5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349971; cv=none; b=R/Dq0SByzYizuhqSO1zHNccVCatb50xwVhwatEcY6ziVnGAoodKBAPQhIt1y2ddfBoQJ+FwH0Sei2tKHVwKOSvYUd++0Paw3sjiYwdRS9oBFd4cweXCpnQCMjXQVOYrmgdLBmOuzT3VPe1FApVvp4jvwtmak0KdhQWq3y5dsGq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349971; c=relaxed/simple;
	bh=Xx5/+7ZUJhrHPNkGog4oL2YUXJEkXEiJ25LukQ+ck8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ITf0h9Zmaan4aPxk1aFc5h4HS7b9wj2EMRdfl9l3iwSQQ9gf1Y8tBfr6MLQJQgl+VveArkFZ9XI1BoVbAWk0qEimm+A5PZSqk6VLKOOao7OUsmAwUGMmD6tq/CrmEbg492fLjnuYSuABrgd6e3cNITRmUXEJkc7Mf1PV8FlWIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=B1Jy2snp; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="B1Jy2snp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788349962; x=1819885962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zOAftsAK+Nf90yUYNZWZd45OpI3sHjjNMKxymst/wiI=;
  b=B1Jy2snpKGxFe9+6xUeNKMwfz3Eiq3V127WUer90ckIdYP1vH7AFDAC6
   z5Ek7s7okyNzAW3YOL0w6OLGzzN42oXANhZwipdOE9184TMfUdDkQVzIn
   uVEKWjv/i4KS0o+FtzAYQR/soRhfTUthV6FJ9I/t5bdkO7WhaMq2Lvu4M
   nRzMJUsnYqKC5HJU4tzGVMF8UbmnKV/mYWv6m9Z6hoyFu9+a7Io8poThg
   3vt8MpY7qug84lvbMa0vctOCFEb2WYaqym8AV56oLpQM3eUDquHGTFdHs
   c7YAytLGysIN+5y4fmSwcwBlObrCbtgSoNIW58cz26eW30MHRn187FIN3
   g==;
X-CSE-ConnectionGUID: PjdE/nC5Tn+eSW71IvUofg==
X-CSE-MsgGUID: kHQdIjUhTY2P3vMe8DvttQ==
X-IronPort-AV: E=Sophos;i="6.25,257,1779148800"; 
   d="scan'208";a="27399083"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 11:52:39 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:7714]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.57.85:2525] with esmtp (Farcaster)
 id a7133567-32c7-4502-bf0e-5593dedafe5a; Wed, 2 Sep 2026 11:52:38 +0000 (UTC)
X-Farcaster-Flow-ID: a7133567-32c7-4502-bf0e-5593dedafe5a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 2 Sep 2026 11:52:38 +0000
Received: from 80a9970eed1e.amazon.com (10.187.170.39) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 2 Sep 2026 11:52:37 +0000
From: Justinien Bouron <jbouron@amazon.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton
	<akpm@linux-foundation.org>, Huang Ying <ying.huang@linux.alibaba.com>,
	Justinien Bouron <jbouron@amazon.com>, Quentin Perret <qperret@google.com>,
	Mark Brown <broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Gunnar Kudrjavets <gunnarku@amazon.com>
Subject: [PATCH v2 RESEND] arm64: Add user and kernel page-fault tracepoints
Date: Wed, 2 Sep 2026 04:52:13 -0700
Message-ID: <20260902115216.49158-1-jbouron@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D038UWB003.ant.amazon.com (10.13.139.157) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Those tracepoints were made generic in commit 06aa9378df01
("x86/tracing, x86/mm: Move page fault tracepoints to generic"), call
them from arm64's page fault handling routine.

Signed-off-by: Justinien Bouron <jbouron@amazon.com>
Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
---
Link to v1: https://lore.kernel.org/lkml/20260520045524.75670-1-jbouron@amazon.com/
Diff with v1:
    * Moved the tracepoint after kprobe_page_fault(), as recommended by Leo Yan.
---
Benchmarking
============

Since the added code sits in the page-fault handling hot-path, I've also ran
some benchmarks to make sure this change is not accidentally introducing a
regression. All testing below was done on a c6g.metal EC2 instance (i.e.
bare-metal) which is an ARM64 CPU with 64 cores and 128GiB of RAM.

First, a microbenchmark that maps anonymous memory and write to the first four
bytes of each page, thus running into page-fault for each one:
	#include <stdio.h>
	#include <sys/mman.h>
	#include <stdint.h>
	#include <stdlib.h>
	#include <unistd.h>
	#include <assert.h>

	int main(int argc, char **argv) {
		int npages = atoi(argv[1]);
		size_t size = npages * 4096;
		printf("pid = %d\n", getpid());
		char *p = mmap((void*)0xcafe0000,
				size,
				PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
				-1, 0);
		assert(p != MAP_FAILED);
		for (int i = 0; i < npages; i++)
			*(uint32_t *)(p + i * 4096) = 0xdeadbeef;
		munmap(p, size);
	}

Compiled with: `gcc microbench.c -no-pie -o microbench` (GCC 15.2.0)

Before the change:
	$ hyperfine --runs 50 './microbench 100000'
	Benchmark 1: ./microbench 100000
	  Time (mean ± σ):     148.9 ms ±   0.9 ms    [User: 6.0 ms, System: 142.9 ms]
	  Range (min … max):   147.5 ms … 151.5 ms    50 runs

After the change:
	$ hyperfine --runs 50 './microbench 100000'
	Benchmark 1: ./microbench 100000
	  Time (mean ± σ):     151.0 ms ±   0.6 ms    [User: 5.6 ms, System: 145.4 ms]
	  Range (min … max):   150.0 ms … 152.4 ms    50 runs


Second benchmark, linux kernel compilation benchmark with defconfig (on commit
bd5f485f3f02):

Before the change:
	$ hyperfine --runs 5 --prepare 'make clean && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches' 'make -j65'
	Benchmark 1: make -j65
	  Time (mean ± σ):     157.298 s ±  2.593 s    [User: 6993.534 s, System: 1213.435 s]
	  Range (min … max):   155.881 s … 161.870 s    5 runs

After the change:
	$ hyperfine --runs 3 --prepare 'make clean && sync && echo 3 | sudo tee /proc/sys/vm/drop_caches' 'make -j65'
	Benchmark 1: make -j65
	  Time (mean ± σ):     156.723 s ±  0.496 s    [User: 6987.524 s, System: 1236.200 s]
	  Range (min … max):   156.316 s … 157.275 s    3 runs

Testing
=======

Re-using the microbenchmark above, we can see the page-faults generated by
writing to each mmap'ed page (mmap'ed region starts at address 0xcafe0000):
	$ sudo perf record -e exceptions:page_fault_user -- ./microbench 16
	pid = 1284962
	[ perf record: Woken up 2 times to write data ]
	[ perf record: Captured and wrote 0.015 MB perf.data (63 samples) ]
	$ sudo perf script
		  microbench 1284962 [020] 123047.716213: exceptions:page_fault_user: address=0xf25f095c3640 ip=0xf25f095c3640 error_code=0x82000007
		  microbench 1284962 [020] 123047.716221: exceptions:page_fault_user: address=0xf25f095e8066 ip=0xf25f095bf0c4 error_code=0x92000007
		  microbench 1284962 [020] 123047.716222: exceptions:page_fault_user: address=0xf25f095e8066 ip=0xf25f095bf0cc error_code=0x9200004f
		  microbench 1284962 [020] 123047.716227: exceptions:page_fault_user: address=0xf25f095e6e28 ip=0xf25f095bf0d0 error_code=0x92000007
		  microbench 1284962 [020] 123047.716229: exceptions:page_fault_user: address=0xf25f095e6e70 ip=0xf25f095bf19c error_code=0x9200004f
		  microbench 1284962 [020] 123047.716233: exceptions:page_fault_user: address=0xf25f095a7b38 ip=0xf25f095bf304 error_code=0x92000007
		  microbench 1284962 [020] 123047.716237: exceptions:page_fault_user: address=0xf25f095e5d28 ip=0xf25f095bf2f8 error_code=0x9200004f
		  microbench 1284962 [020] 123047.716241: exceptions:page_fault_user: address=0xfffff7aa5f10 ip=0xf25f095bdd64 error_code=0x92000047
		  microbench 1284962 [020] 123047.716256: exceptions:page_fault_user: address=0x400040 ip=0xf25f095c0160 error_code=0x92000007
		  microbench 1284962 [020] 123047.716258: exceptions:page_fault_user: address=0x41fdf8 ip=0xf25f095c02f0 error_code=0x92000007
		  microbench 1284962 [020] 123047.716260: exceptions:page_fault_user: address=0xf25f095e3020 ip=0xf25f095c0548 error_code=0x92000007
		  microbench 1284962 [020] 123047.716263: exceptions:page_fault_user: address=0xf25f095e4000 ip=0xf25f095c0640 error_code=0x92000007
		  microbench 1284962 [020] 123047.716270: exceptions:page_fault_user: address=0xf25f095dd008 ip=0xf25f095ad848 error_code=0x92000047
		  microbench 1284962 [020] 123047.716273: exceptions:page_fault_user: address=0x41fec0 ip=0xf25f095c0cd0 error_code=0x9200004f
		  microbench 1284962 [020] 123047.716293: exceptions:page_fault_user: address=0xf25f095d6000 ip=0xf25f095ba1c4 error_code=0x92000007
		  microbench 1284962 [020] 123047.716305: exceptions:page_fault_user: address=0xfffff7aa4e30 ip=0xf25f095addec error_code=0x92000047
		  microbench 1284962 [020] 123047.716335: exceptions:page_fault_user: address=0xf25f095914d8 ip=0xf25f095c5be0 error_code=0x92000047
		  microbench 1284962 [020] 123047.716342: exceptions:page_fault_user: address=0xf25f0958fa88 ip=0xf25f095ae4c0 error_code=0x92000007
		  microbench 1284962 [020] 123047.716345: exceptions:page_fault_user: address=0xf25f0958fb20 ip=0xf25f095ae534 error_code=0x9200004f
		  microbench 1284962 [020] 123047.716349: exceptions:page_fault_user: address=0xf25f093d02e0 ip=0xf25f095ae704 error_code=0x92000006
		  microbench 1284962 [020] 123047.716354: exceptions:page_fault_user: address=0xf25f09578788 ip=0xf25f095adbb0 error_code=0x92000007
		  microbench 1284962 [020] 123047.716357: exceptions:page_fault_user: address=0xf25f093efcef ip=0xf25f095c5358 error_code=0x92000007
		  microbench 1284962 [020] 123047.716361: exceptions:page_fault_user: address=0xf25f093f1650 ip=0xf25f095b927c error_code=0x92000007
		  microbench 1284962 [020] 123047.716366: exceptions:page_fault_user: address=0xf25f095de610 ip=0xf25f095c5c10 error_code=0x92000047
		  microbench 1284962 [020] 123047.716370: exceptions:page_fault_user: address=0xf25f0958d080 ip=0xf25f095b46a4 error_code=0x9200004f
		  microbench 1284962 [020] 123047.716375: exceptions:page_fault_user: address=0xf25f0958e000 ip=0xf25f095b46fc error_code=0x9200004f
		  microbench 1284962 [020] 123047.716380: exceptions:page_fault_user: address=0xf25f095902d8 ip=0xf25f095b46a4 error_code=0x9200004f
		  microbench 1284962 [020] 123047.716412: exceptions:page_fault_user: address=0xf25f09472180 ip=0xf25f09472180 error_code=0x82000007
		  microbench 1284962 [020] 123047.716431: exceptions:page_fault_user: address=0xf25f095d4000 ip=0xf25f095aaa40 error_code=0x92000047
		  microbench 1284962 [020] 123047.716443: exceptions:page_fault_user: address=0xf25f0951b1a0 ip=0xf25f0951b1a0 error_code=0x82000007
		  microbench 1284962 [020] 123047.716445: exceptions:page_fault_user: address=0xf25f0940188c ip=0xf25f0940188c error_code=0x82000007
		  microbench 1284962 [020] 123047.716446: exceptions:page_fault_user: address=0xf25f09597458 ip=0xf25f0951b1dc error_code=0x92000047
		  microbench 1284962 [020] 123047.716449: exceptions:page_fault_user: address=0xf25f0959de39 ip=0xf25f0951b1e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716451: exceptions:page_fault_user: address=0xf25f094bdce0 ip=0xf25f094bdce0 error_code=0x82000007
		  microbench 1284962 [020] 123047.716453: exceptions:page_fault_user: address=0xf25f09596518 ip=0xf25f0951b260 error_code=0x92000047
		  microbench 1284962 [020] 123047.716455: exceptions:page_fault_user: address=0xf25f0945ec10 ip=0xf25f0945ec10 error_code=0x82000007
		  microbench 1284962 [020] 123047.716457: exceptions:page_fault_user: address=0xf25f09592180 ip=0xf25f0940c918 error_code=0x92000047
		  microbench 1284962 [020] 123047.716459: exceptions:page_fault_user: address=0xf25f0946da88 ip=0xf25f0946da88 error_code=0x82000007
		  microbench 1284962 [020] 123047.716475: exceptions:page_fault_user: address=0xf25f094c66e0 ip=0xf25f094c66e0 error_code=0x82000007
		  microbench 1284962 [020] 123047.716478: exceptions:page_fault_user: address=0xf25f09418220 ip=0xf25f09418220 error_code=0x82000007
		  microbench 1284962 [020] 123047.716480: exceptions:page_fault_user: address=0xf25f095249a2 ip=0xf25f094182b8 error_code=0x92000007
		  microbench 1284962 [020] 123047.716482: exceptions:page_fault_user: address=0xf25f0949d180 ip=0xf25f0949d180 error_code=0x82000007
		  microbench 1284962 [020] 123047.716484: exceptions:page_fault_user: address=0xf25f09429e40 ip=0xf25f09429e40 error_code=0x82000007
		  microbench 1284962 [020] 123047.716486: exceptions:page_fault_user: address=0xf25f09535384 ip=0xf25f09427c58 error_code=0x92000007
		  microbench 1284962 [020] 123047.716488: exceptions:page_fault_user: address=0xf25f095433d2 ip=0xf25f0941e788 error_code=0x92000007
		  microbench 1284962 [020] 123047.716490: exceptions:page_fault_user: address=0xf25f09443b80 ip=0xf25f09443b80 error_code=0x82000007
		  microbench 1284962 [020] 123047.716497: exceptions:page_fault_user: address=0x18072008 ip=0xf25f0946bb88 error_code=0x92000046
		  microbench 1284962 [020] 123047.716517: exceptions:page_fault_user: address=0xcafe0000 ip=0x4008e4 error_code=0x92000045
		  microbench 1284962 [020] 123047.716522: exceptions:page_fault_user: address=0xcafe1000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716524: exceptions:page_fault_user: address=0xcafe2000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716530: exceptions:page_fault_user: address=0xcafe3000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716532: exceptions:page_fault_user: address=0xcafe4000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716533: exceptions:page_fault_user: address=0xcafe5000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716535: exceptions:page_fault_user: address=0xcafe6000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716537: exceptions:page_fault_user: address=0xcafe7000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716538: exceptions:page_fault_user: address=0xcafe8000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716540: exceptions:page_fault_user: address=0xcafe9000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716542: exceptions:page_fault_user: address=0xcafea000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716553: exceptions:page_fault_user: address=0xcafeb000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716555: exceptions:page_fault_user: address=0xcafec000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716557: exceptions:page_fault_user: address=0xcafed000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716559: exceptions:page_fault_user: address=0xcafee000 ip=0x4008e4 error_code=0x92000047
		  microbench 1284962 [020] 123047.716561: exceptions:page_fault_user: address=0xcafef000 ip=0x4008e4 error_code=0x92000047

IP 0x4008e4 corresponds to the instruction where the write to each page is
performed:
	$ objdump --disassemble=main ./microbench | grep 4008e4 -C7
	  4008c8:       b9402be0        ldr     w0, [sp, #40]
	  4008cc:       53144c00        lsl     w0, w0, #12
	  4008d0:       93407c00        sxtw    x0, w0
	  4008d4:       f9401fe1        ldr     x1, [sp, #56]
	  4008d8:       8b000020        add     x0, x1, x0
	  4008dc:       5297dde1        mov     w1, #0xbeef                     // #48879
	  4008e0:       72bbd5a1        movk    w1, #0xdead, lsl #16
	=>4008e4:       b9000001        str     w1, [x0]
	  4008e8:       b9402be0        ldr     w0, [sp, #40]
	  4008ec:       11000400        add     w0, w0, #0x1
	  4008f0:       b9002be0        str     w0, [sp, #40]
	  4008f4:       b9402be1        ldr     w1, [sp, #40]
	  4008f8:       b9402fe0        ldr     w0, [sp, #44]
	  4008fc:       6b00003f        cmp     w1, w0
	  400900:       54fffe4b        b.lt    4008c8 <main+0x9c>  // b.tstop

First error_code when writing to the mmap'ed region is 0x92000045 which, as
expected, corresponds to user-mode, write fault, at page-table level 1 (see
https://esr.arm64.dev/#0x92000045). Following faults have similar error_code but
for page-table level 3 fault (https://esr.arm64.dev/#0x92000047).

For kernel page-faults, tested using tracepoints directly:
	# echo 1 > events/exceptions/page_fault_kernel/enable
	# cat trace_pipe
				bash-1285046 [022] ..... 123669.960098: page_fault_kernel: address=0xeb76fd8ce0f0 ip=schedule_tail error_code=0x9600004f
				bash-1285046 [022] ..... 123669.960196: page_fault_kernel: address=0xeb76fd7e3088 ip=__arch_copy_from_user error_code=0x96000007
				bash-1285046 [022] ..... 123669.960535: page_fault_kernel: address=0xc434acd45e08 ip=__arch_clear_user error_code=0x96000044
				bash-1285046 [022] ..... 123669.960553: page_fault_kernel: address=0xe4a5638f98e4 ip=__arch_clear_user error_code=0x96000044
			   <...>-1285047 [056] ..... 123673.423617: page_fault_kernel: address=0xb4b46cea0010 ip=__arch_clear_user error_code=0x96000044
			   <...>-1285047 [056] ..... 123673.423644: page_fault_kernel: address=0xf1a30e2c28e4 ip=__arch_clear_user error_code=0x96000044
---
 arch/arm64/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 0b52557652be..2a4a3e9089ad 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -46,6 +46,9 @@
 #include <asm/traps.h>
 #include <asm/virt.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 struct fault_info {
 	int	(*fn)(unsigned long far, unsigned long esr,
 		      struct pt_regs *regs);
@@ -614,6 +617,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (kprobe_page_fault(regs, esr))
 		return 0;
 
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, esr);
+	else
+		trace_page_fault_kernel(addr, regs, esr);
+
 	/*
 	 * If we're in an interrupt or have no user context, we must not take
 	 * the fault.
-- 
2.53.0

