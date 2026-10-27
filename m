Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102742;
	b=tRIGxD1PXKSweldBB8AptkkmtP7Cy+48cbhzFhUWZkpfiE1ZHU5X9pJK44w9wWBAablz
	 vd2tvGeYWqb3OiBWBN+Yl4vWHhtNtibTc+uJRu9V3rS86Y5o0LXtO8uhxpTFmV1q+nDEH
	 MmxDwj5S6Hems8ayeAg/f9Moe2ku4dF3CWPrgGeqFVM3YZniMc/MPu0mcnFtVDtf0PHfB
	 Yig+U1Vr/wm2POLjjeP0ZHWd5sY43o4jJRVrPeN0VZx0+pSNthHRcmQ4Hqhfv3grv9FWr
	 9C66/p5W30Gq6NwXQcWkzkyvsl2d84zd/zSqRrXmwblRLTxrPSd3nK/MA1k6uSRPMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102742;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=3wIeXYtcLGzGld3TeXFZLlcoOMDnhGa5Jpo/RU+mucs=;
	b=nvxhnj4SiPj/vaCPwUisQ8Qrfv0NN5jjVfDNiigFb1rWUZek7UMGlF7GonIx5FPLgHqK
	 929HB3yq8VGunRNru3cd7A7Gy43XGqV+cC5RaQJVuYhU0iRg9Bx+7LPtIroadS44dp/6P
	 S3Xc2Ka2rHvx1u5+OBFseXfFABXvAgBmpB2fpyXnl9rJib/XoZkUkTffDl3GIlDdT1VkW
	 d+CGs+5eDfcJ6AyFyEcTorIdvVM4S+0vYufSwXHMIGO0H1vo1pc20SK22pF5BiTF8SVHR
	 jK9tePq60sdmUx474uzY68ekRb+ysng0H/lKUPv8V5P+bRBobZ/0ZxD1A79EbrIfOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u2AY2i9m;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Fx+Hyk8Z;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42631606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42631606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u2AY2i9m;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Fx+Hyk8Z
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793102734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3wIeXYtcLGzGld3TeXFZLlcoOMDnhGa5Jpo/RU+mucs=;
	b=u2AY2i9mzv2WKZh5EvTjuGBJc4o69bqYX8nUKyfF8fxxeLHdJBli4v/oZ+otsYjCPNaxN5
	fCvAzze8l+R04vnbR/MWkWSiXoeZ5ixFegOsxlXnPbYhwALreB/2nIHy4sP0q7+aGwTjW/
	SMGChB7KHlgD9YVlD3p7l9w3byY7TBLSGwzJCPMwnOBvfhVB+VxI3Z7HZtRWEADSDp/9F0
	lGb4r86rrQdMESHvow/VmT+ibYuVlBMucunVEAPNxA/UaRt+9tR9r1EZNt2woCUpF01gAa
	Ufq7oerjf7ua2y02xbRVgJ5eJEdWMGG7Az6/uyK31sW+zIeJlvusnfZA5Tg1Eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793102734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3wIeXYtcLGzGld3TeXFZLlcoOMDnhGa5Jpo/RU+mucs=;
	b=Fx+Hyk8ZljGVLlDy36hw7gXFHMVLbLG3Rc7kuw+i4+1dxyD2zKJ5F3euLY0/utfvR918gl
	9A5RnZBt/h1l9iCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, linux-kernel@vger.kernel.org, Petr Mladek
 <pmladek@suse.com>
Subject: Re: [PATCH v5 04/16] printk: Separate code for adding/updating
 preferred console metadata
In-Reply-To: <20260929120546.328616-5-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-5-pmladek@suse.com>
Date: Tue, 27 Oct 2026 13:11:33 +0106
Message-ID: <87cxsv4acy.fsf@jogness.linutronix.de>
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

On 2026-09-29, Petr Mladek <pmladek@suse.com> wrote:
> The logic for adding or updating a preferred console is currently
> duplicated within __add_preferred_console(), making the code difficult
> to follow and prone to consistency issues.
>
> Split the code for adding or updating entries to avoid code duplication.
> Make it clear what operations are done only for new entries.
>
> Use this opportunity and replace an int with an unsigned int for
> iterating over the preferred_consoles array.
>
> It is a preparation step before adding more consistency checks.
> No intended functional changes.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

Some minor comments below...

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index c3e50f19a32b..174aee533a53 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2577,35 +2584,56 @@ static int __add_preferred_console(const char *name, const short idx,
>  	if (name && idx < 0)
>  		return -EINVAL;
>  
> +	if (!pc->name[0] && !pc->devname[0])
> +		is_new_entry = true;
> +
> +	if (is_new_entry) {
> +		if (devname)
> +			strscpy(pc->devname, devname);
> +		if (name)
> +			strscpy(pc->name, name);
> +		pc->index = idx;
> +	}
> +
>  	/*
> -	 *	See if this tty is not yet registered, and
> -	 *	if we have a slot free.
> +	 * Historically, the preferred options are stored only by the first
> +	 * caller who prefers the particular console.
>  	 */
> +	if (is_new_entry) {
> +		pc->options = options;
> +		braille_set_options(pc, brl_options);
> +	}
> +
> +	if (!brl_options)
> +		preferred_dev_console = i;
> +
> +	if (user_specified) {

Here you drop the comments:

	/*
	 * @pc console was defined by the user on the command line.
	 * Do not clear when added twice also by SPCR or the device tree.
	 */

> +		pc->user_specified = true;

And here you drop the comments:

	/* At least one console defined by the user on the command line. */

> +		console_set_on_cmdline = 1;
> +	}

The comments seem useful to help track all this. I do not see this
information preserved anywhere by the end of your series. But you have a
better understanding of the big picture. If you think the comments are
insignificant and/or misleading, I am fine with you dropping them.

John
