Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53640A956;
	Mon,  7 Sep 2026 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811025; cv=none; b=HOtSviAfGFzzW8liUzl7oJ3BXTkWyX77onHsYEay+Oezu7Sq6w1h4NA9C4k5BHOeSDBfmVgii872kbt/zFeTJicYcIXkxNMdvseKmoSfo3RVbIIkn3NQXT6uwgNVPo8y4QFn26OcCs5eqQwHFcApDkNUCEYHgQDYzv19bzzMvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811025; c=relaxed/simple;
	bh=6q50bluftUwML1nax/AzEOCG5q+Fmfxveii9P2Iel9s=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hozsEqgP3nCYgNNnIwXPErShSZDmiG+2GaBltnlsWLQJSRxfMrnAJQRT3ceO0SWki9hlqjO4iDWdUfrpdEMTryG/eW5oMTIvIkPX98uXi1CHjIQgArgpVLIWjSu/5RjQQZ5pqKovqqOHI20Whk+A+0qi5kOdF6CYjr46VpWjJvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r9QS7jJf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fnBKBEa7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r9QS7jJf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fnBKBEa7"
Date: Mon, 07 Sep 2026 19:57:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788811022;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlnXWyQ5P4mltYvxGiuegBxsUY0nQx4SjdjQVslIHhA=;
	b=r9QS7jJf4IJo9xMH/2C3ERSPaBJR4KZgI8l29l/d7DfV9GDdsQGXj9MwxVdSsRY+0ft7CZ
	fGUUty3pO/TmNMQx06DkWD3ERohOq2DLpuXUkJM81Vxh6WziRFNv8CtkuOFrmiFL2EJsXf
	bRBdm3Xf/MWWV0wT6DIAcqs9BNzZIUnGg1y71su1XOt6I9mCrFnLsawiwiuVat+lZUtmJU
	ghqpNOjeSv7hXoWNJqKo108GVAFVhMSd+1a8F/1vYlBj88VaJ4Xp8m8v3xUO8RqjuZI3fZ
	yBKJn1Qyy1EOje9poW10fgTm7F4U3w0UVBevmlAdJdpenJSGt75mhfEOjCbWvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788811022;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlnXWyQ5P4mltYvxGiuegBxsUY0nQx4SjdjQVslIHhA=;
	b=fnBKBEa7tlkVhSbWOXQKziPUBoLLUte7str4e1Z6cA0pajbeXWRKQKszofbtoGwku6pQM6
	oqPvm+WWIBZPlvAA==
From: "tip-bot2 for Karl Mehltretter" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3-its: Don't WARN on LPI free
 allocation failure
Cc: syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com,
 Karl Mehltretter <kmehltretter@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260811095532.48454-1-kmehltretter@gmail.com>
References: <20260811095532.48454-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178881102081.623050.17001872269814761092.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     135d9e67f7ab4f261c2157ee2de1f93a4de39a41
Gitweb:        https://git.kernel.org/tip/135d9e67f7ab4f261c2157ee2de1f93a4de=
39a41
Author:        Karl Mehltretter <kmehltretter@gmail.com>
AuthorDate:    Tue, 11 Aug 2026 11:55:32 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 07 Sep 2026 21:53:05 +02:00

irqchip/gic-v3-its: Don't WARN on LPI free allocation failure

free_lpi_range() cannot give LPIs back to the allocator without
allocating a struct lpi_range to describe the freed range, so it
returns -ENOMEM (its only failure mode) when that allocation fails,
and its_lpi_free() turns this into a WARN_ON().

syzbot triggers the WARN_ON() by injecting a slab allocation failure
on device teardown, which with panic_on_warn becomes a panic:

  WARNING: drivers/irqchip/irq-gic-v3-its.c:2251 at its_msi_teardown+0x3a4/0x=
424
   its_msi_teardown+0x3a4/0x424
   msi_remove_device_irq_domain+0x16c/0x27c
   msi_device_data_release+0x38/0x9c

The failure is transient and the consequence benign: the freed range
is simply never returned to the allocator. This does not warrant a
WARN_ON() backtrace, so log a rate-limited error instead.

Fixes: 880cb3cddd16 ("irqchip/gic-v3-its: Refactor LPI allocator")
Reported-by: syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: Claude:claude-fable-5
Link: https://patch.msgid.link/20260811095532.48454-1-kmehltretter@gmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D229d761b8a110e6de517
---
 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index e9807af..b0fdc2b 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2248,7 +2248,8 @@ out:
=20
 static void its_lpi_free(unsigned long *bitmap, u32 base, u32 nr_ids)
 {
-	WARN_ON(free_lpi_range(base, nr_ids));
+	if (free_lpi_range(base, nr_ids))
+		pr_err_ratelimited("ITS: failed to free LPI range %u:%u\n", base, nr_ids);
 	bitmap_free(bitmap);
 }
=20
