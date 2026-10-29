Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282043;
	b=XlSnfTIAUQBAxNsSY2KOgd6LEPrLch609eHDlg+3p2voil48RY33A7fYBrT3UP3i+awt
	 gM/YyW8lVNjk9aPtkEn5RBECymC6Lw6PS72rH62c0/mvw5c1XDinWQRulLP/hrIgE0lx8
	 omuLeB+0ClzmxCvg1b0u36MBCOmwS4sLomLSRjNwQiNLi9sp3GX+1YHtV7cHTC30EvMEC
	 Iyo6iJaKTHa3cdkuNfFPyNsrZyHllnR8ZCoNmJXuD3Ns2zxqdNd7FGspJyrxjaHDjcrpj
	 xOhqAAgnF9hXRvhpdYeahPnGh3i3uZqA5lrfbqSY5TK1dTvGV7LP3DstltKRqx+fj2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282043;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=TEP0+sGwERtlVBDbdcU0x+UIlqvQ4iYo5/q8vgPFMSo=;
	b=M6nwNuuC+HEWQy0DsYKm6c07QC7qO5aPatLExXieH6FN4Mk1r5v9rxr/dHvpc117FSiq
	 4TOE+7wD3ObEBQcrLcVOEDjpGAMZ2yqxpX0M1RBjF0iH9tl+wY6wdxM8G+cBhaZG3Dv/k
	 6hho4nUIJU5Yq8A6dkkHSvlFfAq5IlAvkcN9rEjY7enyrJhtmYwB0h205lXRa2TtvvBgI
	 mwZoIrCjdLJTNlFPjuUM4nritYAA+7D1UQOXftjXUIkH756ZGuXtJykBs+0V1CoHq0igz
	 Pg68ywFV1wzGWjOIsPqi6y9Jo+Z9g/hwUe9LOYTlCqQZ2UbMQlZK00Vh8np+3YIHqFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZUmBbGsh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YOvpGrGp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZUmBbGsh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YOvpGrGp
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793282040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEP0+sGwERtlVBDbdcU0x+UIlqvQ4iYo5/q8vgPFMSo=;
	b=ZUmBbGshRH9Uu78gzaZ5U0lNDp1fHK6sVU8avMjSz2vAxkolr6B9yOXX9JC3nZgD28GST7
	SygYC0lkKDx4VCdDpFZJDsTLy4LxvIqVNxQGa0RifZJIRViAfDvrfLyQA9j6zXUe4jyX2v
	p4fRzn7uY/rTocvydFB7v1TKSXZEk7TudhjjUIyCSpg9kOavyXW7T6DFF6py9UkJcUFHns
	f5VGtZgYzUwP34svKq0j4Mxl+ZmUv8QOhQLsUvnbv+GrOCKy5UQRlyWTJ9wf1eKQmprltM
	onfWMiODRiykl8HeAyUol10t0RIUztP/xp2woWceFLhQMnrJG+gVCDLAZXaUHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793282040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TEP0+sGwERtlVBDbdcU0x+UIlqvQ4iYo5/q8vgPFMSo=;
	b=YOvpGrGpp9wnoyP/ynDv84Ymr1c7IysWThTNsGHsFk8wUhPadFDp2sMdYJs+aWTxL/AszJ
	4KnBXlZN9OLru+BQ==
To: Breno Leitao <leitao@debian.org>
Cc: Petr Mladek <pmladek@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auMmQjcy1A6E0eUm@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz> <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com> <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com> <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
Date: Thu, 29 Oct 2026 14:59:59 +0106
Message-ID: <874ie4y5mw.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-29, Breno Leitao <leitao@debian.org> wrote:
> Here is my view right now:
>
> 1) Converting netconsole to NBCON caused an undesired "regression" for
>    users who would prefer the messages go out, even if unsafely. (as
>    Ryan and Meta)

Legacy consoles were never truly synchronous. But, generally speaking,
they were mostly synchronous in normal situations, which was good enough
(and certainly more synchronous than the nbcon netconsole implementation
today).

> 2) It seems the proper solution for this will take a few cycles.

Based on past experience, I agree.

> 3) I would hate to leave users with this "regression" we have today.

Agreed.

> Do you have any suggestion for something doable in the short term?

It depends on what is deemed acceptable. For example, we could introduce
a Kconfig to always unsafe-flush when the kernel ends. This would be a
fairly straight-forward change and require no changes from the user
environment. Later we could add boottime/runtime configuration for this
policy and make it per-console.

If Kconfig changes are not acceptable, we could hardwire unsafe flushing
only for the netconsole (rather than all consoles). This would be a bit
ugly, but it would still help us to identify all the correct points to
enforce a later boottime/runtime policy.

I am open to both of these suggestions.

> Would reverting netconsole's NBCON conversion, while we address the
> dependnecies above, be an option?

That would be unfortunate since the nbcon consoles provide a real
benefit during runtime (full offloading of console printing). Also, the
nbcon callbacks allowed the netconsole code to simplify due to the known
in_task() context.

And I would like to remind that our ultimate goal would be to establish
safe atomic printing for the netconsole. So any workarounds (such as
CON_NBCON_ATOMIC_UNSAFE) are only meant to be temporary (even if
temporary will be measured in years).

John
