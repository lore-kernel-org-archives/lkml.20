Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54C377AB4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255172; cv=none; b=PJokccwgdnbH0q6teih9BSndRgkM8rAl9ucvD02nGuytBiC6UWOzL5MHA6MNgASKuNoz5zxoeoyVI/aMJjiToF9Z05rKZCTyhaAiUkhJQOd0gnm0CNrA3Up+1LNsMUetTj9MGPDZRz1wI9rBKqn/M35OR6eV6gxTm1Td9r0TXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255172; c=relaxed/simple;
	bh=z152aH5z3VL72oqenBxEb2hgHnCb8CBVTKhEura4CcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cF43NXbv7+oi4kZ/eqPbMoSDYQ9hILmpP++U5KVPmLwrYAw3bvnNJTpsV1/60okl4KlsUTWYxTfqFWBqm2zLLdojRSQF0vs5osFrw4EoH4uhHTEkRG5ZrpXWZZw7Q02pLNfz4x5eG+N/KQU5AoM0S4R73a1Lukc6Iu7b0tAHrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jXtC7Rpw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dLctFSun; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jXtC7Rpw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dLctFSun"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788255165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fimDxLRjmaTDqvjzAuzM3zuPw4jzY4V3y0oythdsjP0=;
	b=jXtC7RpwJ0ah+SxTzZ2k0l4YpcGq8/5EK8Wbp2hJQDQIgrQAZh0PVjnPjXweCKKMJpKQ11
	hMiAtWkgXOo8ETNScNEJqsc2KSZdigkGUey7CdJy6sSatMk0Eo+KS7u5oTUBdjrUab+dUi
	bQYXZvmRQA9pvCbhskqWXq9MQAtdVZ5hWIQXynhl8IMA0gCWGUaqh07gEDVqJrdnk37xIE
	xPpwksh/uml+5lUnu5Rwo1A0c6O7hJHX5yhHUhMRxVRN4kEzN2q4E7pr4kG242U9HBwv5h
	Mj/mUljVCtRt2LrZ6Y3QMfTKarms2VRikPZEOK9Pt8Rs0C59OenBbApaoTxKLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788255165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fimDxLRjmaTDqvjzAuzM3zuPw4jzY4V3y0oythdsjP0=;
	b=dLctFSun0FiKuJ4x4cvOD/B4A9UGZAU8wCKlZz+xzXBincODqRyQaEItkso2k0b6/F69Vs
	BM8SA5O1qV4xVLCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH printk v3 0/2] nbcon irq_work fixes
Date: Tue,  1 Sep 2026 11:37:41 +0206
Message-ID: <20260901093245.344455-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v3 of a series to address some irq_work issues with nbcon.
Initially motivated as a workaround for hardware-related regressions
reported [0], it turns out that the workaround is actually a nice
improvement for nbcon deferred printing in general.

v2 is here [1].

The changes since v2:

- On nbcon_free(), perform the irq_work flush before stopping the
  kthread printer.

- Rework the commit message of patch 2/2 so that reducing interrupts
  is the primary motivation and the Tegra workaround is a secondary
  "benefit". I really want the Tegra workaround information to stay
  in the commit message because it is historically significant.

John Ogness

[0] https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
[1] https://lore.kernel.org/lkml/20260828140218.232439-1-john.ogness@linutronix.de

John Ogness (2):
  printk/nbcon: Flush nbcon_irq_work in nbcon_free()
  printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY

 kernel/printk/nbcon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


base-commit: ffe0486b139e45cd9c9ca2584f04a1910fe4f8a6
-- 
2.47.3

