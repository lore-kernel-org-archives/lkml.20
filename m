Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702384FE2C3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415424; cv=none; b=f2VWMOGdVKrXp7OoeWFaboXHyj9sJI+fbpJJboKes9KOljg60/pId33KYdqCChCrdw3eOO2DdW66WxrEs/tBcA//lMuHBSx39e7XvdVBG8RPjNPvCPCBfGMOwOmzSWBCTxAkfKWvtHjgm6aze+dtdxHktj2dKFUpJAs4I0oBFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415424; c=relaxed/simple;
	bh=F3OOhn7NYU0iZmQVmnyMvRkiVtsnQfmlBICGNOtSyZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7UKo+td8HeVg1xA6YgF2MV41+U2DmyqcZHd+4JpHGpraGhom/dwq37OlO84moFwB2VHvGJaMbm79IZWHcxVVIkLN4shyMECrD3VfItPqzApwNW7SdaLtfCFV4SmeMFTtey4IeCumqW9bMKsfmZ6UbTr7ynLblucMkaW5SKZXnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huBTchtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huBTchtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FCB1F000C6;
	Mon, 19 Oct 2026 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415423;
	bh=+FC+thagwKj1TEPiVmc1OaHEPj4Ko6vShcCzv13/aPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huBTchtvFX2h6QFxjR7JOuhP9PAKtdxE3PBE6od8s8Ncai/rzicKrgmr/GZPBnceC
	 v7kKNSrnLyJVbnwVHdlDT8ak6ECOf1L/rVNbAr36hQrsBkhu+SKg1xWYVkVU5yjkqL
	 233fnkRL4ConhiZBATW2qzwkJkssanbkb3uZnCgBkDEBa6fYZhVNUKsYWqHkqOphOz
	 K0ECMpHYy7NYHQhLZOWODXd2IySzuYROF3IHxLZ5YmPOlTVFdGWJcyPi3qkUvORLZX
	 njjwKYtV/QBNPXCisyf3QRVRVUDLDZjkfx3U0WKUa1TBvYxmhyi7nJPfYH+3KrMTj9
	 BUHyETDLDOnYQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 27/49] ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:34 +0200
Message-ID: <20261019130856.49711-28-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1b3942012f2d..1a98d05c7f55 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

