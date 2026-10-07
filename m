Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693C3FAE19
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355315; cv=none; b=bdgJdPf0T+/rYv+A4NnslMFvYcLkzwOATm0E9o2eEMQ8WYDD1ngNyfU/shGQOlvC22FPbJoKjHBD3kFK6v5eUvDrSk9yB2zWctk1ZcnzMo+Fg/OVNOyGxlftGtbKHT0SGxelp5Zd6Row/GRJq01PfDVy3xa6RjoQA2pMlgYUQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355315; c=relaxed/simple;
	bh=yhLP2DeOu72zmFx7mJ8wXricgrO5UQfG09OWpvlDlzQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=syNG79UbhDLFbQYnicQtTiFEYEDjhjzqX1vCLteOiuyuoR5ZmzVd/kVjx7VYPGhxfONncq+VFcvpggNNuVas4W1HUzjC4QWwVRoIy+nRfV8uy39hgKhARcpbHtuBm+OY6Lnd554dhlC79kf+Pw5q9zD51rGX5cSfUYN+psVwRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lHOX0pIq; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VFT1TB1P; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lHOX0pIq";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VFT1TB1P"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791355309; bh=Ijd9ijL6a4OQCKNFEpr2U47
	YlaPuVh3AoiGsmjeUEwg=; b=lHOX0pIqCKxchk0L4Bk4jYXr2Jc4mZAHK7DbMMBBwH2+qMir6b
	Uf4BrsV195FDvTURtG3WjSyyUlGiHoSbBAf2IdSsYjV1TZOjHUAgzqQg8Oq7CRyAA6HiP0+AypE
	UcTmHQgQCtbUtZlKGIRxbEP3IhxOWsp0lAHA8nJW4k9bFKBTBykpi9/QbjCoiQAeZdpHpZXBW1T
	VtSZgkPpjCRYvvq6v3EYokkhlpWJm06T/x4/wenpJJQXjaAnjHXfI52999ebtbh+rV0GLVrOp2h
	cr83AelqgDCKYG7ZLaJ4HxQAoT6Y3TWCTX48yJ85Q7oKmOWEW2PlrlX5UQrwoGVydIQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791355309; bh=Ijd9ijL6a4OQCKNFEpr2U47
	YlaPuVh3AoiGsmjeUEwg=; b=VFT1TB1PdtfWLvRX2zcCKr+CmB21cGESQX/AC5ZYOlHZxkbBOu
	rXIeLvVH3VjQttGI79LJusopZBkl0Hn6deAg==;
Date: Wed, 07 Oct 2026 07:41:50 +0100
From: Bradley Morgan <brads@mainlining.org>
To: tzungbi@kernel.org
CC: akpm@linux-foundation.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, pmladek@suse.com, senozhatsky@chromium.org,
 tfiga@chromium.org
Subject: Re: [PATCH] watchdog: Force console verbose when reporting lockups
In-Reply-To: <20261007051726.4154849-1-tzungbi@kernel.org>
Message-ID: <1C79A45D-00FC-4A5D-A69B-9341B9DB13EF@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 7 October 2026 06:17:26 BST, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>When a hard or soft lockup is detected, the watchdog prints a header at
>KERN_EMERG (<0>), followed by diagnostic details (modules, registers,
>and backtraces) at KERN_WARNING/KERN_DEFAULT (<4>) and KERN_INFO (<6>).
>If console_loglevel is quiet (<= 4), the console skips those <4>/<6>
>diagnostic messages before vpanic() has a chance to call
>console_verbose().  With the buddy detector, this leaves only the
>detector CPU's panic stack on the console and nothing about the locked
>CPU:
>
>  <0>[ 1535.991833][    C6] watchdog: Watchdog detected hard LOCKUP on cpu 7
>  <0>[ 1535.995960][    C6] Kernel panic - not syncing: Hard LOCKUP
>  <4>[ 1535.995970][    C6] CPU: 6 UID: 0 PID: 0 Comm: swapper/6 ...
>  <4>[ 1535.995997][    C6] Call trace:
>  ...
>  <4>[ 1535.996063][    C6]  watchdog_hardlockup_check+0x1e0/0x288
>  <4>[ 1535.996075][    C6]  watchdog_buddy_check_hardlockup+0xb4/0xc0
>
>Similar to commit 168e06f7937d ("kernel/hung_task.c: force console
>verbose before panic"), call console_verbose() before printing the
>lockup report so the diagnostic output is not suppressed.
>

I personally love this patch, it's like incredibly useful:

Reviewed-by: Bradley Morgan <brads@mainlining.org>

I tested it on two machines:


Tested-by: Bradley Morgan <brads@mainlining.org> # Power10 / ARM64


>Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>---
> kernel/watchdog.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/watchdog.c b/kernel/watchdog.c
>index e5134ad7b663..64da2e500144 100644
>--- a/kernel/watchdog.c
>+++ b/kernel/watchdog.c
>@@ -255,6 +255,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
> 			return;
> 	}
> 
>+	if (hardlockup_panic)
>+		console_verbose();
>+
> 	/*
> 	 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
> 	 * the lockup message. While it would be nice to serialize
>@@ -880,6 +883,10 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
> 		/* Start period for the next softlockup warning. */
> 		update_report_ts();
> 
>+		thresh_count = duration / get_softlockup_thresh();
>+		if (softlockup_panic && thresh_count >= softlockup_panic)
>+			console_verbose();

Makes sense.

>+
> 		printk_cpu_sync_get_irqsave(flags);
> 		pr_emerg("BUG: soft lockup - CPU#%d stuck for %us! [%s:%d]\n",
> 			smp_processor_id(), duration,
>@@ -901,7 +908,6 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
> 
> 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
> 		sys_info(softlockup_si_mask & ~SYS_INFO_ALL_BT);
>-		thresh_count = duration / get_softlockup_thresh();
> 
> 		if (softlockup_panic && thresh_count >= softlockup_panic)
> 			panic("softlockup: hung tasks");
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
