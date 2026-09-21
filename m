Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED251472F8C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993702; cv=none; b=Rjfe5u+VtyKlSRL1+dWc3Didm9rIHQMqjXsxwxCJbiNO30WHjtGo6q0HH0HFWXMZRygA4ObWE8EGTNgLr5Ffd1lNEFBMiRgS/AskKFrnWlXqKlN6YzYBoodrn9UJfxoZKxfRilx49GM0GpgYRcpjJkaEHo/aXllzq2YnVtbQcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993702; c=relaxed/simple;
	bh=5Rjqza4Ls8OXbbe+BmoMXI60lbolQiZNNTkgLD7xAOw=;
	h=From:To:Cc:Cc:Cc:Cc:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=lfIC5SJpSnRhZhgebCQ2BKO9AvOBTRDHqHwdxiKebu02uIVjGU+awNM16ZRAjOuHnRE4FofrqidxFx79O6nEjYMTM6hi7G+PznAg4HKkN4Dab5KxFhsuv/+Tm7SsxcfbWAns/CwzjKEh0Kj48CrMNF5BTWYhy2zDJlpmvJ4Dc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MCc2mfgx; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MCc2mfgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=TOxDVeFf3QwNyJm6dh0CmaV+q4E2IDcDNlbZnf72M8k=;
	b=MCc2mfgxSCZhqer+mZaKGfzCfhIH/G9//ha8/SxPjhSJRV05F5PVB7gW2ZXfb5
	GR2yvvlD8pci9hyKlQ2JFYdhT1s4JZBtJQBk2fpQZbsZTHJtqAoMWxlmGbsoo8hn
	73APewhRZmzZcdYWQlRCgIna6WXEPreKXTTlyI4dxZob0=
Received: from LAPTOP-EGO65D59.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn5RevIrFqFWI4CA--.4357S2;
	Mon, 21 Sep 2026 20:27:30 +0800 (CST)
From: Lin Junzhe <m18667909625@163.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org
Cc: m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Date: Mon, 21 Sep 2026 22:40:00 +0800
Message-ID: <20260921224000.1-m18667909625@163.com>
In-Reply-To: <87ik3yssy0.fsf@jogness.linutronix.de>
References: <20260921050304.73440-1-m18667909625@163.com>
 <875wzzoxcd.fsf@jogness.linutronix.de>
 <20260921183000.1-m18667909625@163.com>
 <87ik3yssy0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn5RevIrFqFWI4CA--.4357S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UKr47Ar4fuw4DXw45Awb_yoW8GrWxpF
	Zaqw10kFs5JrW7A34kCa17uryS9w1ku3ZxCryrArs7Za98Wry7Zr4SgryjvFZF9F18G3Wj
	vF42vr97Aa4DZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMNUUUUU=
X-CM-SenderInfo: bpryllixzqmlisv6il2tof0z/xtbC-hO7wWqxIrNSsgAA39

Hi John,

Thanks for the detailed follow-up, and for taking the time to check
each of my examples against the actual source.

You are right on all counts. In every case I cited, the repeated
format string is interleaved with other messages, so a "consecutive
duplicate" check would not have helped. More fundamentally, your
point that "same format string does not mean same data" exposes a
real flaw in my implementation: the dedup key hashes only the fmt
pointer and facility/level, not the arguments (a va_list can only be
consumed once), so two messages with different argument values would
be wrongly folded. That alone makes the patch incorrect for exactly
the scenarios it was meant to address.

I also accept the broader point: a message that is spammy enough to
flood the console should be fixed at its source with a ratelimited
or once-per-event variant, rather than papered over in printk.

So I am withdrawing this patch:

  https://lore.kernel.org/lkml/20260921050304.73440-1-m18667909625@163.com/

Thank you and Petr for the reviews -- the "printk must remain lockless
and NMI-safe" invariant, and the guidance on where a feature like this
would have to live (store phase, exact-content match, LOG_CONT-style
ordering) were valuable lessons.

Best regards,
Lin Junzhe

--
Assisted-by: AI coding assistant (disclosed per kernel AI guidelines)

