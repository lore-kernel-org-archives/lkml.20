Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808462;
	b=M0W/KTP9cUhaawtlkvSBqV5DXI2Rq0+UqmSmrOQFmNb/e49ZQCNamWf/5Xdmnc0On+vJ
	 grVV1wtzl75UUE7C7htmst2XJDV8Tw1HeyrXX3hvJpl8BFDhCaRzsNT/yu3trizYqaAih
	 DM/2auc5wKWpMeqjgYZqqmIsMQQXxQliN5UemcjsPbq/fixjA6Hj4ZEN43n/7oDHN14Hq
	 FbrEmUntlEpaAhK+XmLwJnSiq0D/vunIiIRMcPesGmsF0WpyJ7Jgotd/0CNkJdGAgwR9h
	 YjKhHHTuE+plaJbpXU+kPVWoJvglZBVUksxLirGkekWY6KMe2rEx9fl8w+bZGvFTJjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808462;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tUI0nKZKutgcYVVqywY0bgNqE6wcGLtzzloSBXTvSY0=;
	b=IjDSMbvw4zJVKH7yQ1R0ZKfvty5c6DYfgLwdYMfWEr5JVzC5j+i3l5VFDUEssVTA2/x5
	 UcBmiChU4AcxcrJ72UuVouiZww4WTfq+IJlqf8di9wrm/1gIs2h2cMgVQWpc6izS1eulU
	 JnSNowIpZCffTgWfMDyDXKu1utiuvOnY702l8EZgxEp6jOViTLfNpsKOoGDA6oPR0JNzP
	 w+Ir7OpUM5crEHJothUGRzgFGom/xebSVw/tauB+TButBdiLobBhol11UznkkvS1Op3Wt
	 iC6yyuw9Q8QbXo1r0eWmzVgWFCH5jCWKoMZg4OgZBB2adPNSba3ZUOpmc8/JiLNFWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="XQNU/is/";
	arc=none smtp.remote-ip=95.215.58.43
Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E0606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XQNU/is/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8h6G/EKHbetMFLZ3FoTwPAwj6jQwPZCmaugSiKT4/5M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793808459; v=1; x=1794413259;
 b=XQNU/is/dft3ETxtjnalCy4ZDdy1INN6nP91Ud3MGemBsNgDbMYrTU65cc0u6EwccevYOCUf
 PjysVVkSQsy3EbBBbFIKb818S2ixg3BPIQD4p7qP5yRYuPtSkoRRb3cLjmGe69aebS2/tD96/XW
 k9wvx0LQjVKBMNDKulLWg/qk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 64b2df2fbae2508c;
	Wed, 04 Nov 2026 16:07:38 +0000
X-Mizu-Trace-ID: 64b2df2fbae2508c
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Brian Gerst <brgerst@gmail.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/4] Fix the x86 defconfig build with GCC 17
Date: Wed,  4 Nov 2026 08:07:17 -0800
Message-ID: <20261104160722.1637541-1-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
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

Fix build warnings and failures (CONFIG_WERROR=y) with a GCC 17 build.
GCC 17 adds -Wconstant-logical-operand which is strict about operands
of && or || that fold to a constant other than 0 or 1.

In the past similar fixes have been done for clang, e.g.

  93f56de25937 2017-04-06 mac80211: Fix clang warning about constant operand in logical operation  [v4.12-rc1]
  ...
  dd7fe5d9fd6a 2024-01-17 rtc: max31335: Fix comparison in max31335_volatile_reg()                 [v6.8-rc1]

The reason this trips only with gcc is that clang's toggle is more
permissive:
 - it checks RHS only, not constant LHS.
 - Macros are not checked.

Fix is to effectively make a macro or condition return 0 or 1.

The patches are split up per subsystem and can go independently via
respective trees:

  1/4 x86/cpufeatures: the awk-generated *_MASK_BIT_SET() returns 0 or 1.
  2/4 wait: ___wait_is_interruptible() with a constant state.
  3/4 iommupt: PT_SUPPORTED_FEATURE() in the fvalog2_*() helpers.
  4/4 drm/i915: IS_POWER_OF_2() in reg_bits.h, and two Kconfig timeouts.

Tested on x86 defconfig with CONFIG_WERROR=y, at each patch:

 - GCC 17 trunk (20261103): each patch removes only its own errors. The
   build has no warnings after 4/4.
 - GCC 16.1: the build has no warnings. The .text of each object file
   does not change. The only differences come from the build timestamp
   and the release string.

Vineet Gupta (4):
  x86/cpufeatures: Make {REQUIRED,DISABLED}_MASK_BIT_SET() return 0 or 1
  wait: Make ___wait_is_interruptible() return 0 or 1
  iommupt: Make PT_SUPPORTED_FEATURE() return 0 or 1
  drm/i915: Avoid -Wconstant-logical-operand with GCC 17

 arch/x86/tools/cpufeaturemasks.awk          | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 drivers/gpu/drm/i915/i915_config.c          | 2 +-
 drivers/iommu/generic_pt/pt_defs.h          | 2 +-
 include/drm/intel/reg_bits.h                | 2 +-
 include/linux/wait.h                        | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0-Meta

