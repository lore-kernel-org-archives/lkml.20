Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.54.77.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006433;
	b=tsaTdfYrZ8AONSDzZrh2c5Dz/MEWBtLhaksZCJkLl7MjSRSCKzApMTbGRFXgfPA5HBhq
	 KTZ7QgvnrCHqDfuXP1vnyRIop4yFBx4JNQ0ohAJbvaOz+p1rbAxzaSpgnls01dhV/EvXN
	 HsCqzkL1i4mQ+T/q6Cj5MGAqIBSDjTnJ2DAesV9ELFfipQjhzGOVpCcxkJYdQoRMgBp/X
	 ju0YDqwgsjE85izdIqq020fgJv8mc5soMziSkh5ZLFCTdYgMrlzHINbr5kwb1utDpc6S5
	 0QPW8amMBkCb+0UVj3hhH/NnvcNa6Mcj9vMD4TYJ0pCVkPDsQypgL9Kaj+6vUROtGHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006433;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-Amp-Result:X-Amp-File-Uploaded:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=Y5zQ5hD9b2Nib/D8yvHInUsmqVxDh1JCae9h7/D8Hc0=;
	b=jPBPZJfO0W+Khlel6FCQpoqPnHIIS39GtRzdfs3YJETlG7TpZXNro2YlG47MFN+csXmc
	 umVmzpG/sZb32m91syCemWyBAqkXhqiZbf3EWgsqTxNn4SOwcIkJ/LO6kNO7LcU3OcpZd
	 IICkY1kH4XCywGD9pk5nmejJCqqYLJRcU1RiX51cDDTAuktN6cpuKGyE02/LHmKvLq7iS
	 DrKkFYHhoWKPNCB2Cr57fIF4qV4zffxY5QJVoWWZIRI3E20Y9/uJRD7Z+vRVV1K4Msrqw
	 WufbVFHaYvYrFcbCJtZ4LigGedjk4ZmlGLz6eptlBFbl7EcM2wZFZbsNePYyFVrUpfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mobileye.com;
	spf=pass smtp.mailfrom=mobileye.com;
	arc=none smtp.remote-ip=207.54.77.171
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63467606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63467606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793006430; x=1824542430;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=uGCeqIYPVTWeDJJfWeU+9/cQCa+F/WwI43wicP9K2Yw=;
  b=NFje3rBpZpM6HsPII/L4Ake2OtPK/I9WGfMpCk8XkK/ljDs4c5tIEspQ
   deMm+OFkL55Rlar2/MsyCzqDgJ2o3KXBe5Q3kMKECppPMufCt7J9o+LyV
   cv7/2CwwKuVBJFPtdeLcuNGq1zTRvIl3fS5kCAh/zigs+FzDavqskLD+A
   4ak75tLpGQd3Vvf13DWBfxV9u7C4TH/62J5Dl8SkLwblMHHBzdjC9AvyT
   kTwc2YrQ8PRqTZMG24PGz9QRjw233OYYgjSbQgu8sl7ahH0Uuc/+boQoQ
   ELG3yZgj/ygZjO/kuOTbb/87XWYDsfjncyjO0Tmqpgze/4tCrVwZ/+e9F
   g==;
X-CSE-ConnectionGUID: xS3iF+39QmqurrUaAM0qCQ==
X-CSE-MsgGUID: WOavY69jQ3u0IXgpBp0JYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:20:22 +0200
X-CSE-ConnectionGUID: CkXdoubjRnyo21NCJH6SIQ==
X-CSE-MsgGUID: pykcE/+eQSyNxiY+M3dD6w==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 26 Oct 2026 11:28:12 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 26 Oct 2026 11:20:21 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v3 0/2] riscv: support CPUs with Zalrsc but not Zaamo
Date: Mon, 26 Oct 2026 11:20:01 +0200
Message-Id: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEb32oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3Zyi4mTd/LycSt3kZAMzEyOjNNOkJEMloPqCotS0zAqwWdGxtbU
 A31/R3FsAAAA=
X-Change-ID: 20260120-lrsc-only-cc06422f5bb1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0

RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
(LR/SC). Linux has so far required the whole A extension.

MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
trap into SBI. I measured typical userspace atomics on this CPU: an
LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
ratio applies to kernel refcounts, bitops, xchg and futexes, so the
kernel needs to emit LR/SC when Zaamo is not implemented.

Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
ADAS and autonomous driving. Kernel atomics are on the scheduling,
memory-management and driver paths of that product, so the emulated
AMO cost is not acceptable there.

This series keeps today's default: both extensions on, -march still
contains "a", generated code is unchanged. Turning Zaamo off is a
NONPORTABLE choice. The resulting kernel matches one -march, which
userspace has to use as well, so a runtime alternative would not
produce a portable image.

Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
still emit AMO and remain unsupported on a Zalrsc-only kernel.

[1] https://mips.com/products/hardware/p8700/

Changes in v3:
- Make Zalrsc mandatory. cmpxchg and the conditional atomics already
  use LR/SC, so RISCV_ISA_ZALRSC can no longer be turned off.
- Check AMO and LR/SC support independently. A kernel that emits both
  requires "a", or both "zaamo" and "zalrsc".
- Put the LR/SC bitop sequence in its own block so two inlined
  set_bit or clear_bit calls compile.
- Remove the LR/SC loop that ran after the hart lottery and accessed
  address 1. Build the lottery increment with add so RV32 assembles.
- Add an exception-table entry for sc as well as lr in the futex
  LR/SC helper.

Changes in v2:
- Switch from a runtime choice of atomic implementation to a
  compile-time one, gated by NONPORTABLE.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Vladimir Kondratiev (2):
      riscv: build kernel atomics from LR/SC when Zaamo is disabled
      riscv: accept the atomic extensions this kernel was built with

 arch/riscv/Kconfig               | 23 +++++++++++++++++
 arch/riscv/Makefile              | 15 ++++++++---
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 53 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c          | 28 +++++++++++++++++---
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 14 ++++++++++
 9 files changed, 258 insertions(+), 9 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260120-lrsc-only-cc06422f5bb1

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

