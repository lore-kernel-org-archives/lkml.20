Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6384F36E470
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925742; cv=none; b=tPst8FIq33Ae70rz7gSShM6ztBxsqcPMy80AWDfvznwFusufBuoNgijhPUyhZBejlvpQPj2yiDYkf9N+cNm7ux/AwLx//kk6oCnbihqo8T/FBwYtU2ifdOk7prz/mRcaiT/shKpRDbF3ARWjPpETY6fIuZlnttcJE5ddQO7GMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925742; c=relaxed/simple;
	bh=p97qJWw4LCSL+2VOBITRGR4C3AcPmwbC00BD2z8Hpd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qrhknFwAt+KrlTXxUz7R7LHyR19/e+IRbUkgKQRktq1znsy/oPyB76xBRoGFn/9z36lYrOODq9lgPASxgXWYuCpuE7aeYpuPXS/ZswYqm52x5f4A3/KoteuY7r2Zis5Z1cgdJj4CazXViYGfKSPDPkeloc+ho6wlubjvsWHzh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MOEGJGd+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S8L1ilh0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MOEGJGd+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S8L1ilh0"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787925739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GeFJtIWKMeQFtcVlNcEqHSnyI+hPozUdwYYGVGal1Tc=;
	b=MOEGJGd+NrztMOqhpJcXBfPfCz09GvJbvJdIQ0oaNKF8S4d03fRiAKvBHmFlZILeBSYUsC
	7nTdoalgd1sdEwqv7uDlbRBz/Q265MPRGsTJLSOs96cRx9+wgPDqkunIatPnPeyEX/N7Hd
	DqiMf3nCCTX/xMdvlt4DBAESoAxsmOpcPaSb3x5isaO7a1PxoiB35hYlzMQlxSwD2h9Liv
	K1iVjXdrFqfCl6vCcAW1KUKaWfk9fu0b+HBwxJEXmH+t31uoXf6I8aOoaNLsVY9lBT2FCm
	kni/+tQwqC5WagVt4FcTCnTorGjgoSkOb6ljNMulCF/BJ0CpMeJ/359hkboUsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787925739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GeFJtIWKMeQFtcVlNcEqHSnyI+hPozUdwYYGVGal1Tc=;
	b=S8L1ilh0u6Bf8lFfP2b0f7/DNzh6YUsYav8h9B3e8XVZg1DsT822R4Jmx2LexvnlJ/o1/I
	ZdO+4NxPzvla2dCw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk v2 0/2] nbcon irq_work fixes
Date: Fri, 28 Aug 2026 16:08:07 +0206
Message-ID: <20260828140218.232439-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of a series to address some irq_work issues with nbcon.
Initially motivated as a workaround for hardware-related regressions
reported [0], it turns out that the workaround is actually a nice
improvement for nbcon deferred printing in general.

v1 is here [1].

John Ogness

The changes since v1:

- Add a preceding patch to flush the irq_work on nbcon_free(). This
  pre-existing issue was reported [2] by Sashiko while it was
  reviewing v1.

[0] https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
[1] https://lore.kernel.org/lkml/20260827184750.203521-1-john.ogness@linutronix.de
[2] https://sashiko.dev/#/patchset/20260827184750.203521-1-john.ogness%40linutronix.de

John Ogness (2):
  printk/nbcon: Flush nbcon_irq_work in nbcon_free()
  printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY

 kernel/printk/nbcon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


base-commit: ffe0486b139e45cd9c9ca2584f04a1910fe4f8a6
-- 
2.47.3

