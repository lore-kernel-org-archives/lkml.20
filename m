Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83874BE45C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009256; cv=none; b=POXJm6AtNXcr0JcGKLne1dPLQOQVXYxUm9A/BPYsJeqLoSIoJvauDgIQBf45Ic7O7KGxi660U4ZeG5nyetORAOeWxNSXCavbxA2De1ADrjqOQ/EIzfKWsktgf4wE642k1xt/TuYLjzw7MAURYRTkiaSdTYfhYrSc9Y686zKZOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009256; c=relaxed/simple;
	bh=o3JUq21ldtJi/9FlfxlVCh1ViPHIOEMFWvVqUwMfnWQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=eH4PxRgPdUL52i+KBnCIaFHf8rLlyChEpphObI6SL4yp6ckpRO9di8Mx7e7zVxWJQChiO4Pj13/gR1qJcu/9idC+kQMEwaHv9fRHMUaB3TatXdDRPkNb5sFz2Cqy0UlESS7NWEvLc3frzTRlcPa/wtqkedCksaBplFGQwhxkB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ljeQPFbe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U6IOCybx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ljeQPFbe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U6IOCybx"
Date: Wed, 14 Oct 2026 20:20:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009252;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCoDXLU/SYhj8JtMKk2t4yoVBMy1tjP6IeWEah4+fW4=;
	b=ljeQPFbew5rcA/Ej54x7qMwIqC4VAV/MF3L09Otn0LX/FU5EgfI9PZdp4hRHm7FnJhRHPf
	hEz5udZL6kOn/0DiQJK0bPjk5/+FOrwgzkqgtE1NuYBglBS0O7RQnSo8ykE6ZEPaGXCaDs
	VZOes9ahCf6TnfXKhJOvg5GfRp6Vu7vOkKTrRZneKAZ8RCDHePwHj2/VUnQPrfXfaqM0AO
	b2kbgCQbJ7Ue4D9hTeWFyJkGbzUNxFRsg+/oQd/Kfbq8CRZFtnxNUArHBYQTzsD5fHVhBG
	uqdIy8LKdhCTM/b0hLIDJpQyOYanBQFK47UtO85HmzGPenMxr8tZoapbJt7Jcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009252;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vCoDXLU/SYhj8JtMKk2t4yoVBMy1tjP6IeWEah4+fW4=;
	b=U6IOCybxDX0rZFl20M+FqivxiCU6fz1fXNUtej2kLU9mzAW/4o44tMLp1CiE4/Bx9Dtrjm
	iiaVI0cvJnqy0JAA==
From: "clocksource-bot for Slavin Liu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/dbx500-prcmu:
 Check timer register mapping
Cc: Slavin Liu <bolin.liu@seu.edu.cn>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Linus Walleij <linusw@kernel.org>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
References: <20260911060917.94310-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925038.2666337.14259444745098740968.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     8f30b035a6676e292ee8e54334711d9905dd0495
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//8f30b035a6676e292ee8e54334711d9905dd0495
Author:        Slavin Liu <bolin.liu@seu.edu.cn>
AuthorDate:    Fri, 11 Sep 2026 14:09:17 +08:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 12:05:28 +02:00

clocksource/drivers/dbx500-prcmu: Check timer register mapping

Return -ENOMEM if of_iomap() fails, before reading or configuring
the timer register block.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 9d2aa8c7961a ("ARM/clocksource: use automatic DT probing for ux500 PRC=
MU")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Link: https://patch.msgid.link/20260911060917.94310-1-bolin.liu@seu.edu.cn
---
 drivers/clocksource/clksrc-dbx500-prcmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/clksrc-dbx500-prcmu.c b/drivers/clocksource/=
clksrc-dbx500-prcmu.c
index 2fc93e4..1af223b 100644
--- a/drivers/clocksource/clksrc-dbx500-prcmu.c
+++ b/drivers/clocksource/clksrc-dbx500-prcmu.c
@@ -52,6 +52,8 @@ static struct clocksource clocksource_dbx500_prcmu =3D {
 static int __init clksrc_dbx500_prcmu_init(struct device_node *node)
 {
 	clksrc_dbx500_timer_base =3D of_iomap(node, 0);
+	if (!clksrc_dbx500_timer_base)
+		return -ENOMEM;
=20
 	/*
 	 * The A9 sub system expects the timer to be configured as
