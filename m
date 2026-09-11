Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3982A2609C5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114129; cv=none; b=tP2GOu6/fNBYlWwEipm/FG1188LXeEhajZ23FYcJ/9DJGCLZ4+BwbMlcuzU1ZkQFTccFxcvC+RYuEsdHW2KRxtmlAa3aqBbuGbrDzeyfJKkbBfq/h5shirW3wXMsizsQuLkofzXSWp6rtBpDNaDSBE4+ncFpduif3o3iQacBs88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114129; c=relaxed/simple;
	bh=S7AZjOKq89PBJIDRSwSxlgeOPYH07XKVJXtXOsyKcak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jw3gTfPMvAfqZOT9pHNYI4NLfoHz2JBog90f3q2fG0HgH+a/gWnTQ0cnwN8w7CWt8o3KtIwWb3Hnwl+W5jDOCXmqI0LVj3snSHzThpJ0zL2ZdCxxW7yJW4gWAHaiI+pGlpxCtKavBYGslQeTB4s9LdWLDkl+rnseLCHRIqbUL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Dl/MtIH6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ups/MWxn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Dl/MtIH6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ups/MWxn"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789114125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7AZjOKq89PBJIDRSwSxlgeOPYH07XKVJXtXOsyKcak=;
	b=Dl/MtIH6zMN6JR+v7VDFUiJUedoin65kYqqQDgClHJFONkNNyJZzd1NJ6pVgHh31GMDm0O
	Wap9t+7Ns+EZ3E71bbaCamdFq4S87OaqowHMr/z+K66/qrr2fl7yjeAjF8w6VZ1QjCEnhQ
	bfNZLQUYH38xOOjGXr/JdPHPoPXLUK6atpZUZafB3EIyC++BKJpn9pPh7R818T/xJCYy/p
	6p2UQ1/4hgxDxh2Mg5lDmp+VXNKCggS+UsCU3UEg2WxSsmw4gcV8a2rUkIWqLSYMMlz/q9
	kYrjGeVDg27vwLD6SJz3hcdGh/WGtNcXfNsFUohOGcHf0VOGiqxGwqEfZel63g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789114125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7AZjOKq89PBJIDRSwSxlgeOPYH07XKVJXtXOsyKcak=;
	b=Ups/MWxnjKhohUqCmsXvfqzmyXkkXcE8u8vLGtAGBcsupwqMaISQmyLA5GYs/d+uti/16w
	gdxk6P7eWqEekOAQ==
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org
Subject: Re: [PATCH 0/1] printk: Yield console_sem to blocking waiters
In-Reply-To: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
References: <20260910203331.4139656-1-aruna.ramakrishna@oracle.com>
Date: Fri, 11 Sep 2026 10:14:45 +0206
Message-ID: <87zexocir6.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-10, Aruna Ramakrishna <aruna.ramakrishna@oracle.com> wrote:
> Problem context:
>
> After a reboot, NetworkManager failed to bring up interfaces because
> systemd was stalled, due to a flood of printk warnings.

Note that kernel warnings are considered serious and will put the CPU
into emergency state.

> Systemd was
> blocked waiting on the console lock for over 122 seconds:

Also note that the console lock is related to legacy consoles. Rather
than trying to make the legacy console trainwreck more reliable and
non-interfering, efforts should be spent converting legacy consoles to
NBCON.

What console driver are you using?

For v7.3 the 8250 driver will be NBCON.

John
