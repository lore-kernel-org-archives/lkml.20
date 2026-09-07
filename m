Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F4251FCDA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799262; cv=none; b=EUfNwx3GjvZFRZOLXhzRMKkOSORmpl8YoD+afLKk3Y7OTsXtzWmBQIfSuRtPmJpuhYnQVIEOEBSTLHU0vVn4Q9hcqmrq7yrwDis/agyHKck7pvoBtomV/gIqr7wwmckb1dDm14aIOD5OewZ2Zgl6baz+yn1a0i4q0tm7fQZVFQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799262; c=relaxed/simple;
	bh=JITq0QqiTospfA3Bb6L55OzvagCVW6EwDv1LU6sYck8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIW2vr/ISiI+MoVx1UWdJ1b+PJAeyG7sowildbmwYtnViYkejdvN8mREjutlx7x2NKkoVJhKqHPqMdAeehkrINEh7PGRsnf0Q4JhmsXAB5irwo8KexeiN5oYjUDmsbK3t6fPmaHbofyYORDd9ADMyPCsjMYUT1FF+iVOc+N8yQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHJZGIiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHJZGIiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26031F00A3D;
	Mon,  7 Sep 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799261;
	bh=LJEGgvgnN1hym5yIpfDS0W2oDSWIdSPnh+cxxfZttlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mHJZGIiO+b4ld5TXPrhQUYQg1gt+4WRfvj7fDMWLG6LBnRMyU+izkaFl/m/yW1kuR
	 H253JRi5LDDFu++KHhvMqmblxkZ/SjnpQCLFvuLHHDLavXF9/XwiyHZIcMumGWD2Ck
	 OOZdrPq/8OLdXF1PnfUAYZKoISCSg8krsb2P0sgqhtU766Icv8tXH+swRwPYZxr0Zr
	 Q1TGAXkcmCWH6KEAkLIPL67waOSbKCnLA5vnudzF3RJtHcpWMAK9S/AzJhe+8RfBdP
	 roYUzxNulv+rNbZ6+JcPxSAuTwdSCQ5d0kiKbnpwzRu1FPIS9IWmWSMdVUlfpxkBba
	 eaD9GO7sfkusA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 09/19] arm64: smp: Defer RCU registration during secondary CPU bringup
Date: Mon,  7 Sep 2026 17:40:12 +0100
Message-ID: <20260907164024.17164-10-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling rcutree_report_cpu_starting() early during boot can lead to
livelocks with the generic CPU hotplug mechanism if the boot CPU blocks
on an RCU grace period while the CPU being onlined is spinning in
cpuhp_ap_sync_alive().

In preparation for enabling the generic CPU hotplug code on arm64, split
up the trace_hardirqs_off() call during secondary CPU bringup so that we
update lockdep early but defer the tracing updates until after
notify_cpu_starting() has registered the new CPU with RCU, allowing us
to drop the explicit call to rcutree_report_cpu_starting() entirely.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/smp.c | 5 ++---
 include/linux/rcutree.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index f4cabf9e19e6..ff68640d0c0b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -217,8 +217,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	if (system_uses_irq_prio_masking())
 		init_gic_priority_masking();
 
-	rcutree_report_cpu_starting(cpu);
-	trace_hardirqs_off();
+	lockdep_hardirqs_off(CALLER_ADDR0);
 
 	/*
 	 * If the system has established the capabilities, make sure
@@ -242,6 +241,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * Enable GIC and timers.
 	 */
 	notify_cpu_starting(cpu);
+	trace_hardirqs_off_finish();
 
 	ipi_setup(cpu);
 
@@ -411,7 +411,6 @@ void __noreturn cpu_die_early(void)
 
 	/* Mark this CPU absent */
 	set_cpu_present(cpu, 0);
-	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
 		update_cpu_boot_status(CPU_KILL_ME);
diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
index 16a04202888b..e6ad4f2a475c 100644
--- a/include/linux/rcutree.h
+++ b/include/linux/rcutree.h
@@ -116,7 +116,7 @@ int rcutree_offline_cpu(unsigned int cpu);
 
 void rcutree_migrate_callbacks(int cpu);
 
-/* Called from hotplug and also arm64 early secondary boot failure */
+/* Called from hotplug */
 void rcutree_report_cpu_dead(void);
 
 #endif /* __LINUX_RCUTREE_H */
-- 
2.55.0.979.g7e5102b832-goog

