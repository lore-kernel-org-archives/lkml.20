Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF8476682
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255174; cv=none; b=g78VptOWrpGvPcJWPlGPzDHfCg0CPaep1yFYjM2m2wUpMG0e1uh/Dl5FiHIJHDq3cVSJ7N/Nbvvc9JW832NP2aJXuWPBptEmLeAxsct7DTvMzq/3YEuVMsNY/bjeCL5ldzOh/luHZX4p7k1znco9oCt4RnDhUlDNe1trE1fuNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255174; c=relaxed/simple;
	bh=+Cy8Q5PxUPQrM69/XpqWTIp/pzmpYzlVmRnKXkC1+RM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM/Ui/hK+hQlfeah4ZJx57F/83HrFiB78ruJvVrLYbhBH7B95UmWcKVcHRrHUHynRc0jqDEaHPY3CNoKgaGOJsN51kfzdSfH91S23JNjrUNI/OUNtD2xYBVh0Feo0lI9nsS1F+ubQ8XpGvdqsR6nS73Hga7Zw0H1U4IG0mM5h8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f8f8Wb1i; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2NJ06RRz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f8f8Wb1i";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2NJ06RRz"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788255166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz/a6ccVkYCQsTaCcHsJvUxIM8MUAq211m5EeLm/qb0=;
	b=f8f8Wb1ixgkLPKeTSSDZevnrLHKB1uqKSuv37v0yf4k4IsWkB3S1Kdz9awLa3ydMJF0y+7
	7ztO62Th88FMr9Fi/SEvl9hgv8m4AC8pnYnN5KrwEx5aLTyDupUx1ZLtePdidbNWz24X4/
	3ltKO6uk6cQ3j+PFCPT9et/mBBBNnjBwb/OfWCg9syyiHmASUauOqIgeAmZIY4y8H9oIcI
	sZSmbMwSKKBgl6hJ01o0C2vAnUGp4aQhGW/FSVgbXP1fQqHptn2KX/4SDTe2GrkP3HX1Bu
	zkqO0WM/iSeVlps365F/3FECS114mDci125hfksK3Grmhzeu7NGiU5ENuTvxgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788255166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz/a6ccVkYCQsTaCcHsJvUxIM8MUAq211m5EeLm/qb0=;
	b=2NJ06RRzwU94DWT2Qf0UYdulgkAEhIXmUx2SYhO+6qMXeMlICweF46ulRSCEYiyvpAXzpH
	zjf7xHNUbHBciuAA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH printk v3 1/2] printk/nbcon: Flush nbcon_irq_work in nbcon_free()
Date: Tue,  1 Sep 2026 11:37:42 +0206
Message-ID: <20260901093245.344455-2-john.ogness@linutronix.de>
In-Reply-To: <20260901093245.344455-1-john.ogness@linutronix.de>
References: <20260901093245.344455-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure any pending nbcon_irq_work is flushed before allowing the
console to be recycled.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index a5921a84a80ed..68f77afee9106 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1837,6 +1837,8 @@ void nbcon_free(struct console *con)
 	/* Synchronize the kthread stop. */
 	lockdep_assert_console_list_lock_held();
 
+	irq_work_sync(&con->irq_work);
+
 	if (printk_kthreads_running) {
 		nbcon_kthread_stop(con);
 
-- 
2.47.3

