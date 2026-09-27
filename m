Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192992FD1DA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525354; cv=none; b=Qj7jcq9grC4eaivHKo4Xy7xVxpdMo3p+/azgHkZYojw+6kjmF0jwP/vgf6DOh/DI1R2QUSnX9zFOojUVj9k5e+klU5c/h256uesFKV8ZSR7B9a0aM752g8pPEisGTNq5r6jfCEv1XspaR+v9YyLgfqUfyo9osNewVQ0DDVWqCs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525354; c=relaxed/simple;
	bh=PVBXT/nl9DNLIDZ9K+BNyKyOnMUX9gZqt8MeTi5HTAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RQAv7JY2oDYaZvnugU23gSiwNvYxLoUZgENW/tTy4Ayoe2kVZsmhd0PHhVx1io0Q3PXl8EdlL30c4cHSxCtQ0JxhzQh/485ryM5+sFl7W3N642iGWF2m49xtydQ2vZhJaoCzKfzgcSVd9ABLw5fatfRwEQ/Q80aArZ34zvHRcoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kWMyHh42; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PKUkpt8I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kWMyHh42";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PKUkpt8I"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790525350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVBXT/nl9DNLIDZ9K+BNyKyOnMUX9gZqt8MeTi5HTAE=;
	b=kWMyHh42RpqKCArpjVs/21XAZi3f+2h5oHf2+S72rK3fDe5SXUCwtegWb25nBc/6GxDEi8
	Dy2IA96iPllTybL4lExqafOkj6fLqtWiiOvgEvyYu9Jbw+IeTQD3dollwQPgB6Pjr9GVO9
	eeC1R9C8UdMSnro1Y3Jkz7cLJgB8BUfCY69CVZvginH80d6Ff4bGh8YYa6nemsBmcPuKle
	ydkW10MhRJtEeW159uNifZ+sYp9Mdsv07VSQERfzTH/bjDx4UPky/R+BbLOTECxECVW5Cm
	Wpp4mjlgB6+BRF4iUcX9WodHJtZCorRcg/JO4YOcsaSXDUrh407MICxdHW9Sfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790525350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PVBXT/nl9DNLIDZ9K+BNyKyOnMUX9gZqt8MeTi5HTAE=;
	b=PKUkpt8Ic3lF7QGRm+KK0wb20+Jwh+4PvQ4BYlUVSBd9xxpJLPgTmn8LIcwnoO/MwSwXc1
	d/bli1LNf01gBUDw==
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] printk: increase the ring buffer for more than 16
 CPUs by default
In-Reply-To: <20260927091756.50831-1-ekffu200098@gmail.com>
References: <20260927091756.50831-1-ekffu200098@gmail.com>
Date: Sun, 27 Sep 2026 18:15:10 +0206
Message-ID: <87fqyuhe1l.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-09-27, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
> The default LOG_BUF_SHIFT is 17, which means 128 KB, and
> LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.
>
> By default the ring buffer is increased when
> (num_possible_cpus() - 1) * 4 KB > 64 KB, which requires more than 17
> CPUs.
>
> Remove the explicit subtraction of one, so the ring buffer is increased
> for more than 16 CPUs, which is a power of two. Also fix the outdated
> comment.
>
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>
