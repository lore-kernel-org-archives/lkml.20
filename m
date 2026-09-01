Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F624756D3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255174; cv=none; b=SV9dvkxMcIv6fI1b4L72GfVjV/W484Bm4kF8AEi5aifl1dxWvUH3dV5uDnE43ZPYwmoTCWLA1JiBXUQvttiUZemo9fjuDkP/A2obdcgAxABNYTbSOzr/yz61X7epcRncnAAgM4dODLVhg/cNIAbST792BaR7nQKSGAXMzaO4OwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255174; c=relaxed/simple;
	bh=+olPtzPREUbjYvyJL5qFtHsjMtAYXcx3HBJ7Qvl16dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoWXqGn4KGnU8QybtqPWcFgPHIQIGSsw35MU+Lu1LDXCCN3AtOVXNz0d2dcCu5D00j56cnlLn/hbTPgNECZebExuZUWC94v2kW6+CHvN+WNMs3anTGE41RaC+feGFw7Ny8dQicOjkgdfjwup0DxM4SePIkR7t5EcGc8Vjc2F1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mrPY3CRK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dB7ShJyX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mrPY3CRK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dB7ShJyX"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788255166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqcPvHOJhs4S3ckV2FQDT7Cdh0zzFSs05k0K+sNuGnE=;
	b=mrPY3CRKs+qYGjGE1lX3YZpm3oLS3e9tswMxMJ2+K3lTAdwJtVlJ1ulnEtLtlen5mYk+S8
	ZdckocN6VvfN/0KtYb4/5FBS1MDALuygYhMpBqyh7VWQ1PdiRxd2DP5JcMB90D+oXmJ8k4
	DHPmhxSrBuKvgwRizTAkVFiD60zBDLE2zk+VnRa6xhkH9cVXgyvu2Ap20jaWomS2IE3AM+
	y1lNa5kDtBga9S/Qdis9w3ucDO5jkt4Ak3wnb/gN+zrgunx77i6IufJ6sXvO5tYG76W8NB
	fM+O2fBaKfS23g5AF7XAUYTMGfHGKa8GrW59NV16JO0LHI1XSeI9R9o5JXngKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788255166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqcPvHOJhs4S3ckV2FQDT7Cdh0zzFSs05k0K+sNuGnE=;
	b=dB7ShJyXBQJal3qKFpX3itg0cZXzLSUJ1hp5SkFgY1dtC3e8u0qoU2leSjZggeHcMSCEQF
	tQjYFEFyEEyjwnBw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk v3 2/2] printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
Date: Tue,  1 Sep 2026 11:37:43 +0206
Message-ID: <20260901093245.344455-3-john.ogness@linutronix.de>
In-Reply-To: <20260901093245.344455-1-john.ogness@linutronix.de>
References: <20260901093245.344455-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
an IRQ upon irq_work queuing. The irq_work is then handled on the
next kernel tick. This additional delay is acceptable because
nbcon_irq_work is only responsible for non-emergency deferred
printing, which is delayed anyway. This has the benefit of not
needing to raise an IRQ for each printk() call.

On a side note, the Tegra20 and Tegra30 platforms can hang if an
irq_work IRQ is raised while entering cpuidle states. This problem
was reproducible by calling printk() while entering cpuidle. So
this change also provides a workaround for these platforms (as long
as they are not running tickless).

Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/nbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 68f77afee9106..d17704fe93ae1 100644
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

