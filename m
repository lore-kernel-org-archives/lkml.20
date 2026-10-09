Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565D2D2381
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540480; cv=none; b=uoDllXn129Zjb4C9Ia7V1vm5n9RwmgEYTJ6bBMRcxvCL2z7voCnAbn9+xTAsm/rJnsg/ckU95IQC5l/3iitVgaL6c/kSpQon7bnbGjQhCM/uXlHe87MedrT/ag0XcmQDVZHB/511bv3dJY2CR4B+qGBQezyqN6MqeNdy5ZsO7/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540480; c=relaxed/simple;
	bh=dG6yaarN7wPQbioysVtWG7EAmpIMja53RBZpwJfUSrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqLttS+BE2u1sxmh1FJ/wXOQMGLa4I1u3uXZnFdnsPc/wsfd+3S8WbLYl5dD6ag2ViDgu7IPNyrEt0CPIIxWj5iK0WBz1iacUs49bK6lDGutTiDah3556ORXwTWebTYxGLf1QgAmg1n7I4atxDeIPRmM3SclbMth4LGhfsJkqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKfqshKB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKfqshKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9BC1F000FF;
	Fri,  9 Oct 2026 10:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540478;
	bh=yuatJsYuabYYvzPBBzh4zcG6HEJg4mE6fowtxZTSlU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cKfqshKBfJc3VMLlat94tBBi/MIBRn9tTRz6ntjL0YoKvrE54VlbPuaoR2rKbA0od
	 lGLN9X1iEdgAL7xDZpl7/YUMUmTC7pP1NuY9KUh+D7B6DLY4oaqD51NSIF7AHh3poi
	 9EA+tVVX7l6PXamV0hmZa4iwf72jvvUZV6QjAXWLRxKxBpzFYfD+F1816F6xLtyLSJ
	 Aejflcc5vuMoUUz7KDGTSAYQLWy5YIK2a6ZtaAGaco5l8WuWP0VJsSGlyzGOof4XLM
	 qhmdUPgiHS7yeNt9MZYOhfgSydjz2D2x4WqboyoKwsVnvwKwPJ+0IYPfhls+V8p9gm
	 i0JPTqQSmJrJA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	=?UTF-8?q?=C8=98tefania=20Ion?= <stefion@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 03/23] cpu/hotplug: Avoid busy-polling on archs where cpu_relax() is a no-op
Date: Fri,  9 Oct 2026 11:07:14 +0100
Message-ID: <20261009100738.31288-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009100738.31288-1-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some architectures (such as arm64), cpu_relax() is effectively a NOP
and so isn't particularly efficient when used in a tight polling loop
such as the CPU state synchronisation in cpuhp_ap_sync_alive().

Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
that it is executing within the kernel and so we can use the more
efficient polling mechanism provided by the atomic_cond_read* API,
allowing the use of WFE on arm64 and Zawrs on RISC-V.

Change cpuhp_ap_sync_alive() to poll using atomic_cond_read_relaxed()
instead of cpu_relax(). No change on x86.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 97a9bfe4edad..786c3191431c 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -395,8 +395,7 @@ void cpuhp_ap_sync_alive(void)
 	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
-	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
-		cpu_relax();
+	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);
 }
 
 static bool cpuhp_can_boot_ap(unsigned int cpu)
-- 
2.56.0.385.gd3acb90ef8-goog

