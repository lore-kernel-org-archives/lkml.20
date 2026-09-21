Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018314949FA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992827; cv=none; b=sV0G6JikIIa0WaHDOqwkuubnditnAB71fL6dgHDEQfXWvvf8SaExeVAkRHBnOdJbwHGPSwUK80D8MSNVtVM7wOPySCIHYzJ7D99WNsijIb8Y7gIND/1eY07vP51Zq+o/E/4V3FUQ9+vIbJT8NNCHX86a7Taju5x6cUD5Tg8ems8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992827; c=relaxed/simple;
	bh=m63S1tDkytIt2CeDM5UL0KOmZILF8KJMh4kvg49OBu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nf7fmC2vwo7fcDLvRkZOldTjv9BBFViPkua/jwefThko9PgD6zX7gdP4ak/aTaJD+tyVBBD7BGWcD59P2R9o3kmVANLz7511Uk7qVahPCS7MV4X3zESjG+1qkFqjQghqyUSMVWG/V8L+t56+dNdjdrmFuS2vE4UeGdmW84i4v2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1EssTxzL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hnHeWKT3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1EssTxzL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hnHeWKT3"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789992823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xgu36wPsKJb7zws7FdWwPj1iq8KSafmu0xDhZYDQ8AE=;
	b=1EssTxzLSqbqUMwqRdshghXvIcuvXCiRezDSu+OQ1fB8lQ8o2MyfDBPHyo8b1ZXCUlT0FW
	WvgO7Ehjj8lG3mBKe5G7uL8jbhL2ZzWEjhyUmg7xa9dq8UqfYG9BTOuPUwtp6fKKQ/Iat7
	CqZx18rp+F/9OvT8g2QuG5FdU7JtKsCgc8qQLlMjHt8/ladvKh+MljdZy4KAY7sQ+eHvSy
	3G0RBtgqgz7Z/5FMG1DYj2RjJBAtuiNodAjSwOin81egFxiRQ5bfbNfbzF89ZE8FPvXmcj
	aaGFx4btUj4sClktXla9EEmIOhTczNIvvIhbUoFezM0l43f3WzDpGQ0CUk18Iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789992823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xgu36wPsKJb7zws7FdWwPj1iq8KSafmu0xDhZYDQ8AE=;
	b=hnHeWKT3DrCckm+spTouE5B01OUvOIANk05jWMRkGuB1SeRZ/sxwpgbLCB6PjjkTLQon91
	3vddBIC8ddpcZZCA==
To: Lin Junzhe <m18667909625@163.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-kernel@vger.kernel.org, m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
In-Reply-To: <20260921183000.1-m18667909625@163.com>
References: <20260921050304.73440-1-m18667909625@163.com>
 <875wzzoxcd.fsf@jogness.linutronix.de>
 <20260921183000.1-m18667909625@163.com>
Date: Mon, 21 Sep 2026 14:19:43 +0206
Message-ID: <87ik3yssy0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Lin,

On 2026-09-21, Lin Junzhe <m18667909625@163.com> wrote:
> Real cases I have seen in the field and in bug reports:
>
> 1. GPU faults (nouveau): a misbehaving userspace program or a dying
>    GPU can trigger a stream of identical fault reports from the
>    in-tree nouveau driver, e.g. repeated "fifo: fault at ..." lines
>    while the offending context keeps being rescheduled. Similar
>    spam exists for other GPU drivers when a fence or scheduler
>    loop misbehaves.

There are several such "fault at" messages. However, the ones I looked
at have other printk messages following in the same context, so your
patch would not even help in these cases.

Please specify the exact message (file + line number) you are talking
about. Perhaps it would be enough to change it to use a printk
ratelimited variant.

> 2. Failing storage: a dying SATA disk produces endless identical
>    "ata1.00: failed command" / "ata1: SError" storms. This is a
>    classic dmesg flood that buries everything else on machines
>    with a serial console and no syslogd.

The "failed command" ata printk is also followed by further printk's, so
your patch would not help.

Please specify the exact message you are concerned about.

> 3. USB reset loops: a flaky cable or port makes the USB stack
>    repeatedly print the identical "usb X-Y: reset <speed> USB
>    device number N using <hcd>" line, sometimes for minutes.

I could not find this pattern. Please specify the exact message.

> 4. IRQ storms: an unhandled level-triggered interrupt prints the
>    identical "irq N: nobody cared" report for every retrigger
>    until the IRQ is disabled.

This message also follows with more messages, so your patch would not
help.

>> printk is NMI safe and lockless. It needs to remain so.
>
> Fully agreed, and thank you for the clear statement. My
> implementation takes a raw spinlock in vprintk_emit(), which
> violates exactly that invariant -- the in_nmi() guard only avoids
> the deadlock by disabling the feature where it would be most
> dangerous, which is not acceptable either.
>
> Given this, I see two options:
>
> a) I drop the patch entirely; or
>
> b) I rework the idea as lockless per-CPU/per-console state at the
>    console output layer (or on top of nbcon), so the printk
>    fast path stays lock- and NMI-safe.
>
> Please tell me whether (b) is worth exploring or whether the
> consensus is that deduplication belongs in userspace and (a) is
> the right outcome. Either way is fine with me.

I am against a patch that drops messages just because a format string
repeats. The _data_ is not the same and that is important (particularly
with your GPU and SATA examples).

I am also skeptical that these are real-world issues as all of your
examples (that I could find) had different printk messages following,
which would lead to no drops.

There is also the ratelimited variant of printk. If there are indeed
messages that are not useful and can flood the kernel log, perhaps those
messages should be either removed or ratelimited.

If such a feature were to exist, I would prefer it is implemented such
that:

1. A duplicate message means contents are identical (except for the
timestamp of course).

2. It is implemented using flows similar to LOG_CONT to be certain that
the message being dropped is really the next message.

3. Records could be extended to include a counter for how often they
repeat (so that deferred consoles can print the "repeated" line).

Honestly, I do not see a real value for this feature. In my experience,
even if a console is being flooded with messages, I still want all those
messages. If a console is unable to keep up with the flood of incoming
records, I need to use a faster console and/or reduce my console
loglevel. And if there really are printk messages that can flood the
kernel log and are useless when repeated output, they should be make to
use the once or ratelimited variants.

John
