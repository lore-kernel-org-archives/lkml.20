Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F39511E76
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902795; cv=none; b=lKVVEwkkhFx/AAso0X+ieFIUwKj3CxBNgWvn02/DFT0Bf68HPIvruzK3FxlSVpYckUc5YVJoe0cwsLgVA2ZnhcKJ7eTvQSVFjYUjmaEO2l4GuV6w64Lw2seDRSC2d29KK8KPPtbvjXXnFJ8Lwc4/dtndjj954FTCSD8RIPN4Qwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902795; c=relaxed/simple;
	bh=feM6+hntC8wBOSAik1qQpLoLHxGhl+EVtmGJNZKVPbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tTTgu9bC5MWjSzS3o4A//yHBuaRWzCFMAKTbUiD4XjJRWvupKKiOMMKsFyfI7S1QxR0WQZOwYD/PQE49teE7tvLMNJCwO5qOoV17Lx7LKIXcBkR7ddD5PjB+a3Vhe91e0OppWdk7s350zuaJjP+sq3vLul4xMWe8L014lB/tzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LvwTwDu1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kj9uk8P4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LvwTwDu1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kj9uk8P4"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791902791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QLEY5yNO2gRiMs7oDkBuJHdee9b3BbXv5lhM5anqX/g=;
	b=LvwTwDu1Rzk1k0NzQtSEIdQLb1w+VHTEjYHvIkElJqcSAawUNvgo3XMsiSd6TGX+zPjoJC
	Vezo8ipeBi0gz/GnLvKY1bUr941UbYQZkWMqoXZG1lkcGsv6MAycm9PJy1gCWmiCw8oKp4
	k8lqjtp/gDFOt21OMVdDQP4zdz/x6C6Hbicll5CuNOmb4au4Ug9ggTO91sWUIqbODGnG/z
	buN/D/qgQiH7kyT9PS+yBaGLKiVEJ2uEwNaLxCpkYtmx7jCnfXzFlCnwMIBbAhx6Jue/3c
	LBJ+IDEghof35uk1TCShe0QtsDOIwPq8QZ+CbeAg/yW10ElQ4ZBKOeje2g8udg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791902791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QLEY5yNO2gRiMs7oDkBuJHdee9b3BbXv5lhM5anqX/g=;
	b=Kj9uk8P4aTPI2S0Z0xhUaE6YQrFQZufh803/kELHT63G+p78DbO0kBuiLfjJCZmPI69ty8
	jUeciRWtFZaMieDA==
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>, pmladek@suse.com
Cc: rostedt@goodmis.org, senozhatsky@chromium.org,
 linux-kernel@vger.kernel.org, Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: Re: [PATCH] printk: fix kernel-doc name for
 nbcon_write_context_is_braille
In-Reply-To: <20261006163141.304554-1-ampr.mhd@gmail.com>
References: <20261006163141.304554-1-ampr.mhd@gmail.com>
Date: Tue, 13 Oct 2026 16:52:30 +0206
Message-ID: <874iepwtdl.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-06, Muhammad Mahdi Amirpour <ampr.mhd@gmail.com> wrote:
>

Do we allow empty commit messages? The patch title says it all, so I
guess it is ok.

Now that Linus has pulled the Braille fix, please add:

Fixes: c83e3d291243 ("braille: nbcon: Allow to use a serial console with NBCON API as Braille console")

> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

...

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index fb1b37741..6f9735f4b 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -2005,7 +2005,7 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
>  }
>  
>  /**
> - * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
> + * nbcon_write_context_is_braille - Checks whether the nbcon write context is using Braille console

Please wrap the comment to 80 columns. You can see
nbcon_device_try_acquire() for an example of a wrapping short
kerneldoc description.

John Ogness
