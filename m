Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896396;
	b=UXXQcUBshGyvB4EqHPPRCaBQPKOkHCnzA6IVGDbmPwYTPz+1dsBuUcnS5Hm+9j2DvxyY
	 +Sq+TTi9qhhFCJh09w1WngxJrxp75nkRGMkgHjhQJ+vkqSwCoZH9Bwig9rgqv8jetJHDA
	 PpSslONBKt5HmNzYkzx3zsRj4H3xoMwP4H/uxk3czIr15sgCuOUIhcfBQllsXruqa8ua9
	 oxVENpgIXN22BNmHLKO0UvM2Hz+xOaXdQ/B5xL0vx22otZV29ydBeLpg6W+4lxa5ICpmh
	 hnVtdcR+K+kyPtRbp4FJZpS2Xv0is4lyjVvsUZgsWE9xkaDGa9v4z3/HARYLl9SBwIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896396;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qE1tq1rr4cEJpbwdtqUsfVIbjxrmUGUzpJ4okWtgjys=;
	b=YnZriHbTcWhNVvdL0UkiAjfs+xJs1g0O5yd+GhHpc6hhJo/mUhr0cVNVqU1+tFDKdrCJ
	 tvW8N2JrGOo4TbnzpA8KlBncf9/r7/miND9M71TjOoYnoQyONJ5JYjkytR8CuGDtbBTyh
	 z8iPOF6Y14gyyt0SukzjRFGwWGgrk3X3xCrQLnmh/6YfKtTmKHqOlbezVE6fIIjZYPSah
	 yDk9o83uqOq+NvL7xE1vd/ASoBxvkMkpoO5wL+Bx+1jFooCRS9G9Q49dEOoVd9F1CzRtY
	 cVdH/2o1rKlXjYkm8YwqMLhHoCsTwhrF/jE1uNmWt7vrthCkeZZGqUq1Jzo875VplFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlAnTUHC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A9606F93E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlAnTUHC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E120E1F000C1;
	Thu,  5 Nov 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896396;
	bh=qE1tq1rr4cEJpbwdtqUsfVIbjxrmUGUzpJ4okWtgjys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlAnTUHC6GJYDGMliPGljXkCD9ZKMtZePBL3it1C+V7h24jrGjNfZ+q9k4OhE+xBE
	 0YcxgiYEDXXoIYqFGm+SNuiJ47x20TvhfkK3az6+7w7MdV1Kz0cLIOUlfh1wPL5haN
	 Rc+vUSxwJjrLuaKC3GPiVOunqT0+4LB2vezk+hBOr7YgotQasQW003edDJsxWeTvo+
	 tMpQbKmyn+LTxVPRYvt4Dz1kZc9JDrhThtDrK6fht6yn8gR41SSzv7BejXWbteVCuV
	 FwCzwfnCcDtRnz6Hsn17ZTWUrmc8wkF5oalI49lZgPQPodr49szTu1ZU58l8+JzM7o
	 qwtgGAO4+82GQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 47/47] ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:45 +0100
Message-ID: <20261105163045.38862-48-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The cache readahead can be globally disabled while the other CPUs are
running.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 995b235da733..b6d7a8e70fe5 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ONLINE);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
+	WARN_ON(st->state != CPUHP_AP_ONLINE);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

