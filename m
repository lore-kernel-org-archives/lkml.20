Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA534A99D1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188979; cv=none; b=iBMXqiH6PxiV7w8xnxIVnJnawt0faTnY7f6rEFaI4woEOZq3KqoK2RyawySdZ7W2OUPAivOMXXrzOE9PaDZ9qSoYJ2DJwKCSxKn5rV3reN6V1sIlUjeim2znZ99DVBh9JvZZ6rWQQs/r01lyspEF7INhFqSIe4XrEDzlTuuu3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188979; c=relaxed/simple;
	bh=OmxPAmN9jzKHSRgcJG1ik51XWFC3z8+tpZ3P1qNyx0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UBUmcSmYlmw3lNMErMKBZE3DSa0WmOrECOK3nJrZsbRu7Uz6FX67v2XleGUIuZKu7zOEqLJFxoK9MmlDsE6KcQUVaDCE3QFAtf35s6RE3VMmm1kN/HRf7yECpQg+Gwlg8DPLfQDkVV0vN5FmtrND2tMl/zph/jU/+wLIXAJtNQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZAS9b7OU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KKemcN9V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZAS9b7OU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KKemcN9V"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788188975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIPf3I38SfMYwRck4BCYzzcNAPHJgmV7zqu5YNqXfj8=;
	b=ZAS9b7OU6ZNatgTDePgri9c4/LfEV8Lib+j3uLyD6CG/DwLE4JProW3Uy8HbKcjWVL2H0A
	ECTwj2HjBmXFC3sK291ZMkSq9T/Ye7MJ/byXgvtnwX2lpH70+7PB2ugCS/r0WbY1SeHUKV
	YwVaqAYS2GCVnbcPeWOjlGCinOkAfL4j3uE2jzGUMGtcXNhC+KaIEnGKfzIBy0Mbx1lf63
	wQGI3+K9/WfOCcksxu+KdGh8XzFD2GeN9cVQrYfmn8I/Y0qQuU2Xxys3OP1GqKDwnpA+kJ
	l7URfiI5idQ262hwAGPXSsn04Diahn7kRzbnBuvTeE6NGSXHkLuHrk7Cnxu3eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788188975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIPf3I38SfMYwRck4BCYzzcNAPHJgmV7zqu5YNqXfj8=;
	b=KKemcN9VrGRVmguws4VfKjqtJFp6GrCmf9mJZ74Op0JB5c4lvVEp95MgNBZTPZYmamyrxr
	OTZq/7OWkysDH3Aw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v2 1/2] printk/nbcon: Flush nbcon_irq_work in
 nbcon_free()
In-Reply-To: <apWXS74ckfSIrH5m@pathway.suse.cz>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <20260828140218.232439-2-john.ogness@linutronix.de>
 <apWXS74ckfSIrH5m@pathway.suse.cz>
Date: Mon, 31 Aug 2026 17:15:35 +0206
Message-ID: <87se3upbrk.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-08-31, Petr Mladek <pmladek@suse.com> wrote:
>> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
>> index a5921a84a80ed..218b1922a58de 100644
>> --- a/kernel/printk/nbcon.c
>> +++ b/kernel/printk/nbcon.c
>> @@ -1849,6 +1849,8 @@ void nbcon_free(struct console *con)
>>  			printk_kthreads_running = false;
>>  	}
>>  
>> +	irq_work_sync(&con->irq_work);
>
> The irq_work work tries to wake up the printk kthread which
> has been destroyed above. 

Note that the irq_work only wakes up con->rcuwait waiters. Since the
kthread has already ended, it certainly is not waiting and there is no
wakeup.

The irq_work_sync() call is literally just to clear out the irq_work
queue, not to actually wake anything.

John
