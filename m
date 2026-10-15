Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DC518143
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069646; cv=none; b=Hj42mvAz1YcuVZm4t6N48xgJMr32P34w43kpNFA+OFIa1fYFmldK/+jo5n+AyT6IHHWM6qpRJ9jdmpDdpF4QsuXMJpwH/XUEGFdf016/ZgL93ZwP6VbZ4GxMvFacEJwDB6Mcuh4L6DffoxOpq0FRTvxQA1agmbk2wQmBe3u4NCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069646; c=relaxed/simple;
	bh=7ij5z9QdJytT01whps8du2H8/n2+ABTVYcangWxqFTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c74Ufa5T/04XYHfi0xr2EhFHvscq1HBArhKxvuvgTOIrn4VX9I1DiYRrfl+L6hsMJJLc5dnSfYPK1nEIw+wGZ4ulFpM8kWU/wCSUQGwBrFpgAyIEjNexv6VqdiM4A6FM3iterf4mqj+cvj+CDPjqEO4udqsZ9yPJstjyMMzSMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MkCxnsgK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RlQoEn3c; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MkCxnsgK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RlQoEn3c"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792069643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j+KHqReo2og9psgRRyqQsfpDI/DpFxNVmPFO1AgRnLY=;
	b=MkCxnsgKBZG1+fxm7KkcSNt+pV6U/Mwuwe3eb3/ro3+tueQlpaY+occp/dLDJ7QE5BAzVt
	a9NWeo1/rif16/RnVwdAM/J/We4m8jkqyDlDgcOjAf3h5xUaN8YM/CAzvrkc7580QvvgFU
	qcnmgkWX/tULrXnEgL1RMAkAUVRTXHQ3OXn+HUUDQqE/NPR3981IojzpIW2pBomywsiuGw
	6d5Ya/+itltZFFrVjPZz+5N6K4GvF47QQhku9UxNF6/o4CRTGIXvmWl9V7/Lz+SNLEhbYp
	0a87W9pilMJSqF2mNvamKN4oMwF0tsrfwIGYqwOtdw02VPqG9VyVbVV0fi2gvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792069643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j+KHqReo2og9psgRRyqQsfpDI/DpFxNVmPFO1AgRnLY=;
	b=RlQoEn3c71YuMwMh1PIvtzXq5UBjlFZdV+ANurfngTO7V2belz1muBiXCjQmrP/mj/fDAz
	B0DztB1lMIk2AODQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
    Steven Rostedt <rostedt@goodmis.org>,
    Derek Barbosa <debarbos@redhat.com>,
    linux-kernel@vger.kernel.org
Subject: [PATCH RFC printk] printk: Postpone kthread startup
Date: Thu, 15 Oct 2026 15:13:23 +0206
Message-ID: <87ecdrqfhw.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

There have been various bug reports related to SMP systems hanging
on boot. The reports vary wildly but seem to have some overlap with
regard to missed IPI's during SMP setup. The reports also show that
reverting NBCON console usage allows the bugs to disappear.

The NBCON kthreads for console printing are started very early
during boot using early_initcall(). Since these kthreads are
actively enabling/disabling interrupts during early boot, they may
be interfering with SMP setup.

Postpone kthread starting until after all arch initcalls have
completed.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
@pmladek: This patch came about from the RedHat reports we were talking
about at LPC. Derek is still doing final testing, but this patch most
likely fixes the issue. We probably will want this for the 7.3-hotfix in
order to preempt any other surprise bug reports.

It would be nice to start the kthreads sooner, but it is not worth
possibly hanging some sensitive (buggy?) hardware.

 kernel/printk/nbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index f05cc90123bd4..04fdd71b37e55 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1475,7 +1475,7 @@ static int __init printk_setup_threads(void)
 	console_list_unlock();
 	return 0;
 }
-early_initcall(printk_setup_threads);
+subsys_initcall(printk_setup_threads);
 
 /**
  * nbcon_alloc - Allocate buffers needed by the nbcon console
