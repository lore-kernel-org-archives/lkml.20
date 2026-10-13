Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF352CCD6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905167; cv=none; b=NJ4PWVnMZp4wyb4ZxZEBvaNvAJIspzV39gUWjm5U+vj/aK8Pcg2Oa6IOamMJQ1rqiZ/yAa4HVVEmJDmCuqYD1xKgPUHQZ8TdKfQiYbTkrMeeGLFLebcdY0ngP/e7lBR+BxA0rwr7QpNw2jWEKyo9bAdJUUctU4Fe7txRLIzX0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905167; c=relaxed/simple;
	bh=zar4WG1VC8vnPQQJrVR10nPh8X3m1EMmuiLNJtuKVLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FEdJxKIrrts/ZbNxQP/+7IJtKZp6lyOOKYOLr0JiMlYf+UbyiwIUNfF0iCnl3QjWdvyR+VteruJH+hqAwQET5NnGIgN03XATGojnyQlvILPJ8kSC+NSyeCHvlvJesIIYPiLSF3tExFEASYGUIi9n+xyHKnSisx15AykFXvVfrh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3mRE2Kks; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u9AfeBzK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3mRE2Kks";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u9AfeBzK"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791905163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JyEe2/LeqMVPzdwSCEjmgGSWseGr/gQxPEKWn/hT98I=;
	b=3mRE2KksL+ZshxqnU7/V9r/wecaiWSweN2Tbqtg6DVm6KxfXgp6fXGXXkpmpia4utovV+t
	9zeHnN9ogJ5+HDLpY1tq22yWvkCguG3f47a2lXjKk2RHKz8grqonG/arTeuCZW09YYVI9p
	hbr9q3LBI6pg0E2TzOsTP5e7WHoOTTomDa94yksQJc+XttQHuAQK4/OCyswwwZWpacYQkw
	ThhRAFDsvNWR5YsEk+SICkDGzXH4DNgELvkPuFNfQ5D3B2nnD3wAbTyidi/T5UQdlco8EC
	+tB4JPh71v5iEwokxAvciQ44iAsvn651MRxX51/4v54MRA0/5z9GHQ7Lz6eP2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791905163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JyEe2/LeqMVPzdwSCEjmgGSWseGr/gQxPEKWn/hT98I=;
	b=u9AfeBzKBKuqBRkFhDRvJg/kuQ9aTB42AherRUqfz9/05x33boxncAgOhhje52gmJ5XwIJ
	eYccOIH3/n6sXPBw==
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, senozhatsky@chromium.org,
 linux-kernel@vger.kernel.org, Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Subject: Re: [PATCH v2] printk: fix kernel-doc name for
 nbcon_write_context_is_braille
In-Reply-To: <20261013151300.75966-1-ampr.mhd@gmail.com>
References: <20261006163141.304554-1-ampr.mhd@gmail.com>
 <20261013151300.75966-1-ampr.mhd@gmail.com>
Date: Tue, 13 Oct 2026 17:32:02 +0206
Message-ID: <871p9twrjp.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-13, Muhammad Mahdi Amirpour <ampr.mhd@gmail.com> wrote:
> Use the function name in the kerneldoc description.
>
> Fixes: c83e3d291243 ("braille: nbcon: Allow to use a serial console with NBCON API as Braille console")
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
> ---
>  kernel/printk/nbcon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index fb1b37741..5f8afaca8 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -2005,7 +2005,8 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
>  }
>  
>  /**
> - * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
> + * nbcon_write_context_is_braille - Checks whether the nbcon write context
> + *                                  is using Braille console

Generally we use tabs instead of spaces, but perhaps Petr can fix it up
on commit or maybe he does not care. Either way:

Reviewed-by: John Ogness <john.ogness@linutronix.de>
