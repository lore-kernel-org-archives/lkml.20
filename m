Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896492;
	b=pRKxt3Slgnl2DtDp3bjdLukOiidionJtFYbtEID/6Y8z9KjuLYQ9JZPyolaX4951FeEq
	 T3+iRbSE4tWHuLddKTOCHo3upIMbqBZQ1H3KPXPACQCmORuGoIZMnCahYByFk779kBh3N
	 roj3qd5ZJKyb0nnkFzMzB9v3lktqCb/Qsz0nIFGRmADXid3l1gP5IRdjjFiQggJ5ble9A
	 iYjIDxbNf4pii7PknGViWTltWY0H4H3cUUHTUzAJ1ghjIjerHVVKk4NjETI754bk4JOeK
	 UPTd1mPNVRy3lc+y1spXj0zpl9iFZKjCswupP7cEWI45EaDzBTxeFyodsbz+hMfik7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896492;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KeOLiIzJxpfmiLshHLz2qYHvDd4SD5yPvBKJUX6WQ7o=;
	b=4CIlZSsnBX/rnLgqWAYAf22jqVHpdMMxldA5V8aDG7k+20o3zXCwMnMsyWO7OlEsnrKo
	 gqUAUP9lmjf8A9M+ICzwpvl7DT1mOLpNmTOoTFhUzWaduVFwfM3LIpK6fG36USZNyo/SM
	 l2hNttjTsiOX/SIooAmgO0r+K6D7OA1hXE91jELErEXYq/9PRV97ojFXEJI3rny0jlvzf
	 FHpw3uUQFUhmVsIOVciRkL4B9eEHZsxRsOpSBiZBXzQe6AzrXuOZVtPlQHwLrWZfkIXCZ
	 5z3NILxmZZ5xy+nBcZ6/MulrnTLfJSxScU48ITqph37WOudnE7laepS9JbLFjMm9F9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEJ8IsVm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8F606D824
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEJ8IsVm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009BD1F00A1F;
	Thu,  5 Nov 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896491;
	bh=KeOLiIzJxpfmiLshHLz2qYHvDd4SD5yPvBKJUX6WQ7o=;
	h=From:To:Cc:Subject:Date;
	b=XEJ8IsVmUMQs2Bw45dm6T2sy0DrruDROy51FRHVZsjNjM3hsI9ywV64xK3WMGfR4V
	 PjOI5a47xwbYj3JUyStbkNGEZjAols9gi6ooaH4ZyAbRJbcLfe9cS8GcunshCbLmOt
	 +16Wx9eTHZ28mNqbaljuF03bd7DfGdjUMT/G/9cGIT4mChGJhBiX9Bbh+YyomYGZnu
	 XFsQMwWdoP8YRfYIBEwjwbxZS6yl3XOJNjTdeytOd5rBbyF2hPQNhzFac9IihO9djg
	 YSlinCSpFCas4LWJ6cXeAkE17KVcuZ6hLiO03JG6j9Wr5eKIwdNH4XCZ4rXU5g97u2
	 bSkxaXS+Sc0iw==
From: Arnd Bergmann <arnd@kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH v2 0/7] x86-32 CPU configuration cleanups
Date: Thu,  5 Nov 2026 17:34:31 +0100
Message-ID: <20261105163440.2381661-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Hi Ingo,

Here are some follow-ups to your x86-32 CPU level changes based on
patches I did last year but rebased onto current mainline.

The first three just drop code that is no longer relevant now that Élan
is gone and all CPUs support both TSC and CX8.

The other four patches change the CPU configuration to be more like
x86-64 and other architectures where all kernels are expected to be
generic by default.  I did keep the distinction between i586 and i686
class, but everything else is now just an optimization, building e.g. for
CONFIG_MATOM will still run on all other i686 class CPUs, and picking
any i586-class option will work on everything.

Changes since v1:
 https://lore.kernel.org/all/20260522141959.1071595-1-arnd@kernel.org/

 - rebase to 7.4-rc1
 - drop ts5500 removal patch that was merged [Sean Young]
 - reorder patches for cache line size [Juergen Gross]
  
	Arnd

Arnd Bergmann (7):
  x86: remove AMD Élan remnants
  x86: make TSC usage unconditional
  x86: make CX8 usage unconditional
  x86: require minimum 64 byte cache lines
  x86: remove dependencies on CONFIG_M... CPU options
  x86: remove dependencies on per-CPU options
  x86: simplify 32-bit instruction set selection

 Documentation/virt/kvm/x86/timekeeping.rst |   1 -
 arch/um/include/asm/asm-prototypes.h       |   4 -
 arch/x86/Kconfig.cpu                       |  42 ++---
 arch/x86/Kconfig.cpufeatures               |  14 +-
 arch/x86/Makefile_32.cpu                   |  16 +-
 arch/x86/events/msr.c                      |   5 -
 arch/x86/include/asm/asm-prototypes.h      |   4 -
 arch/x86/include/asm/atomic64_32.h         |  15 --
 arch/x86/include/asm/bitops.h              |   4 +-
 arch/x86/include/asm/cmpxchg_32.h          |  76 +-------
 arch/x86/include/asm/debugreg.h            |  10 +-
 arch/x86/include/asm/percpu.h              |  14 +-
 arch/x86/include/asm/ptrace.h              |   6 +-
 arch/x86/include/asm/timex.h               |   2 -
 arch/x86/include/asm/tsc.h                 |   2 -
 arch/x86/include/asm/vermagic.h            |  36 +---
 arch/x86/kernel/apic/apic.c                |  23 +--
 arch/x86/kernel/apic/io_apic.c             |  22 +--
 arch/x86/kernel/cpu/amd.c                  |  20 ---
 arch/x86/kernel/cpu/centaur.c              |   2 -
 arch/x86/kernel/cpu/common.c               |   4 +-
 arch/x86/kernel/cpu/proc.c                 |  15 +-
 arch/x86/kernel/i8253.c                    |   3 -
 arch/x86/kernel/tsc.c                      |  18 +-
 arch/x86/lib/Makefile                      |   4 -
 arch/x86/lib/atomic64_386_32.S             | 195 ---------------------
 arch/x86/lib/cmpxchg8b_emu.S               |  97 ----------
 arch/x86/lib/kaslr.c                       |  20 +--
 arch/x86/um/Kconfig                        |   2 +-
 arch/x86/um/Makefile                       |   3 +-
 arch/x86/xen/Kconfig                       |   1 -
 arch/x86/xen/time.c                        |   2 -
 drivers/misc/mei/Kconfig                   |   2 +-
 drivers/net/ethernet/intel/igc/igc_ptp.c   |   4 +-
 drivers/ptp/Kconfig                        |   2 +-
 lib/atomic64_test.c                        |   7 +-
 tools/power/cpupower/debug/kernel/Makefile |   5 +-
 37 files changed, 72 insertions(+), 630 deletions(-)
 delete mode 100644 arch/x86/lib/atomic64_386_32.S
 delete mode 100644 arch/x86/lib/cmpxchg8b_emu.S

-- 
2.53.0

Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Cc: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-um@lists.infradead.org
