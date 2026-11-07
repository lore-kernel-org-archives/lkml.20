Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036977;
	b=m1Z0LQbZJH5/M2w8mLfnOx6S+eDG5QTyaKDWPdsMC2dUE9/0CS4LR04yBrsqnJcaZwxH
	 UnTRjWynlVvHcZA7XeK+2eY57SrHsRsKhTWVLPrzkX5spCuQfWkMGRens9ON6VQPCdIiX
	 JRvPckvXnaIb47UZxit0Kk0nUFOPxqg3tO36PxF+89DO42R7QMmNIp4vYTP2SCnmAhcRG
	 5SJieDBfhP33QuUOIhPBDFLPvisht5n/2KM6LIoJiUlbgE10ks+VuQngTlxaWG1GVN1s2
	 o51/cheNhc83654KYmBXm/5ifaqe16PwgRTVz/R56UWVTCjGVXOH/0sftJRIRef82hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036977;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oZqXdr7vxG0HTV9d7pT+1eNUsi0QIN/Z/13bF1ZyXrs=;
	b=fxA6BmejK0DFjlDY0yOnmGt+Ll6La6l9Z4XjucnbUZK7HuZL+w8kF2woePF847eNrNSo
	 H2+DYRUBfKfLBtatlRMZRDTriz2Vo6JwSJAZPIwS5T6oSo0UV0rX9qsGBuiE41cpponV8
	 KBwPM3jJgL7/28wFe0fL7kv57V1ZKOflTo9FbiYU3o25QnAoEzSlRmfUvBVd1y61d5T3K
	 1WctS7SUhQn5YLOs7hYK9H4Z+DpKU8sqS/pzJxvTKlVp8SbOO5f20xvsF1ZxcJ7YC/o3l
	 wy3Yc+IACqeWQBMH/p2j38mk7FxOafu5tfQPQ+KWBxjgcOPvEksEHkTt/8BoZ9xdrFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ9RywFF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90839606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ9RywFF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B676C1F0089F;
	Sat,  7 Nov 2026 07:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036977;
	bh=oZqXdr7vxG0HTV9d7pT+1eNUsi0QIN/Z/13bF1ZyXrs=;
	h=From:To:Cc:Subject:Date;
	b=MQ9RywFFMoLuwpibDZWeYeqi8yO2oej5qUS8pVZf+qonrJox/YzJ8el747ZJ6+mM3
	 K8oONomkOFlKgaVj0LfyGhdPzx4o/6pMURA9+DanadHo5fZq8RPQnu1TI1BZAq9NQA
	 vQ69rIj2KrIsGWG2y3bH8kOII2+m60HSZkvql3viY3gHeBmhySXc9EcK6Kyvw2EhIt
	 FWh77sy8tReGd4d4os1Zyj3u/NYeamTdyzyQYn1ZfgX3jQQh9TrKu7+GjjK+CJEotO
	 YjN/UU5FofNIJDyJH9vwQe2wDPsaBxBE6LHuIAwpZxdTQt96t427quYZvdfD4lsDWQ
	 AIM2MufyuCGSw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: Keep helpers used by noinstr code in noinstr text
Date: Sat,  7 Nov 2026 15:16:03 +0800
Message-ID: <20261107071605.17536-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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

A plain inline annotation does not guarantee inlining. In particular,
size optimization can cause helpers called from noinstr functions to
be emitted out of line in .text. Such copies do not inherit the
caller's instrumentation restrictions.

Use __always_inline for the IRQ, idle, stack-check and vector helpers
reachable from non-instrumentable entry paths, including their nested
helpers. Also force inline arch_exit_to_user_mode_prepare().

do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.

Build-tested the affected entry, trap, idle, stacktrace and KVM objects
with GCC and CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Inspected object symbols
and relocations.


Jisheng Zhang (2):
  riscv/traps: Mark do_trap_misaligned() with __trap_section
  riscv: Keep helpers used by noinstr code in non-instrumentable text

 arch/riscv/include/asm/cpuidle.h      |  2 +-
 arch/riscv/include/asm/entry-common.h |  4 ++--
 arch/riscv/include/asm/irqflags.h     | 14 +++++++-------
 arch/riscv/include/asm/processor.h    |  2 +-
 arch/riscv/include/asm/stacktrace.h   |  2 +-
 arch/riscv/include/asm/vector.h       | 16 ++++++++--------
 arch/riscv/kernel/traps.c             |  3 ++-
 7 files changed, 22 insertions(+), 21 deletions(-)

-- 
2.55.0

