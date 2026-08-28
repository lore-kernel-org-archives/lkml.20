Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE4468C11
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925744; cv=none; b=AbR/2QTBA/WPZeneT8xghqEG+hSoJeeQyRefPe0PzR3T2+y8rRG8OBofQnps82AJHHNOTxq2QReXENxhE6+OF31JpFpIXk75dQ5ZJk7SzGXXRf2mfosNb/lss3YZe8sGgmHBirXt/UyNBqVMFDQ8VQwZt0bqH2CgyGGo8Vnqyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925744; c=relaxed/simple;
	bh=D36LFqj4WCm2twOcGO/XvXsu2R2nMEsW+hDePbdk7Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkFwItTQQEi8bHwaxgNgaK/+yy0/wOAcKCzZ+cpDRxOf4Q5113L54YFOi7hEdlZs14Kv94gxCJNIP3m3kuSncDK9izyZAFPDkVWR1xrPF9P6AKyCZolgkNqF4OcqYQrjNnyJ++lkzYYjb2Zd/tqZhlTQfYYZHRZPRYOuTrR2J5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mTn8K9bE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g4A/S1UO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mTn8K9bE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g4A/S1UO"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787925740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XE4Uvt3Enl7DJBidU2jFAJIJLb8tMlzq2KriTET8zlM=;
	b=mTn8K9bEAdkKxhOYV4U7w6smBnbgf7Q57O8/VnjU2kDmGPsCSIMDy0Y8KelrMm0Wx1M7BS
	hTFWuDxMRkitJ3/+khZB5Uka8X7KDRWSxxrL+yVFTdg1zr6YWjh2Fum4ijDWIJ9xZR8nFO
	M7dkwsYrZ1thvopiMGyfeNcEpNlasyosuTRvaSzm2pjTVYw4+gSZVQP2Kte11KcXP1XHco
	RMLcq6Bqu2XQPqCGTjS4KKQXGCnmkN+EiXK3IVZYJXZT0uBo+StfkvWzcgXLcn6fNjJpbo
	zxqdOopA6pGT+iVgE4Qrbt5v5n5EGhPEYexslYlL8V0W1RAYh22YnNxQGwPmxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787925740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XE4Uvt3Enl7DJBidU2jFAJIJLb8tMlzq2KriTET8zlM=;
	b=g4A/S1UOzjgwlDV0H9wPdRWWsShrlMAOInJW4Taw2XMM+/J/rmzJpJxRcaoCg7sr/ZVWHP
	nIRuR91EF7XN6jDQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk v2 2/2] printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
Date: Fri, 28 Aug 2026 16:08:09 +0206
Message-ID: <20260828140218.232439-3-john.ogness@linutronix.de>
In-Reply-To: <20260828140218.232439-1-john.ogness@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some platforms it is a problem to queue irq_work when entering
cpuidle states. Since nbcon uses irq_work for waking the printing
kthreads, any printk() calls when entering cpuidle states can lead
to the affected hardware hanging. Tegra20 and Tegra30 are examples
of such platforms. Avoiding raising the irq_work IRQ has shown to
circumvent the problem.

Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
an IRQ upon irq_work queuing. The irq_work is then handled on the
next interrupt (worst case, kernel tick). This additional delay is
acceptable because nbcon_irq_work is only responsible for
non-emergency deferred printing, which is delayed anyway. This also
has the benefit of not needing to raise an IRQ for each printk()
call.

Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/nbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 218b1922a58de..e5aede99304ed 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1782,7 +1782,7 @@ bool nbcon_alloc(struct console *con)
 	}
 
 	rcuwait_init(&con->rcuwait);
-	init_irq_work(&con->irq_work, nbcon_irq_work);
+	con->irq_work = IRQ_WORK_INIT_LAZY(nbcon_irq_work);
 	atomic_long_set(&ACCESS_PRIVATE(con, nbcon_prev_seq), -1UL);
 	nbcon_state_set(con, &state);
 
-- 
2.47.3

