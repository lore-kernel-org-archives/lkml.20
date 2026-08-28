Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A94137268A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912744; cv=none; b=ZD3ID8wwCSUFVrP2uk6h44/UGQhwTD6H4JmN0DwX7KRJJBEIVnarbn3smxmXnLHipjiZ80NWlnYcSJ4yqEsBBrp2LcxmVJO9GgwhUO243jPGZeb/IRvl+/uXmxie4rsU7cZ4n9PNcR5jrYrNBdJFxeTfKCZZl6JwF4PoHYM/seU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912744; c=relaxed/simple;
	bh=UI6CJEinvN13kokQIXZTYHI0xvdANygSDlpMR2o938s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKnCqDIwiCarH8oReE7f6l1gsg5askchuERvecbulwcdx8478le/bXtqJSkMRk+8ZWTjONlgfUk/mv0V2W9T4f/f838FTMbOfjWuXteeFZFmuWe+DyoPXKtuwplt7gikgGjC9fEEXI4I5qLIjf9X5Wp1fy8t7ZEImhiKfhfLgZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a1HVdenW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a1HVdenW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so707275f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787912741; x=1788517541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh7Ww8/HSV+Ng+XmZ0hGhMyhyuUKsvxjgMZ0Lbj6bAw=;
        b=a1HVdenWoGRKdMI0eueknQJcApevsuRCLQTcY5xitVW5+FHBkpPn7it7hveUNn5cyK
         hxjiwdDZrFoTgF9NUgjMAwV61vvtKprwkH4MjjJy0su4rwarx4/sCR3patx88wjU3LII
         n6kWahzNq4ArdZeqb/aSRR1fpaOUHeZ0npgs9n4/AykdfajeUknrSEFj0hesI7cwQIB8
         bOWlvRcJ9jQ9Ff4nutozQzCdkbclto99MlhYB6H3rW38bigBXPWkm+MIow04ex/7qlBD
         Uav5YmXsd9eHq2qx+Se9maZurUfNrdnjs6EJ5kVFUSdcBuiYA4xTPIRiK9OPteHZxcyH
         PqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912741; x=1788517541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh7Ww8/HSV+Ng+XmZ0hGhMyhyuUKsvxjgMZ0Lbj6bAw=;
        b=Bl32I/caGkqF/ureoSKtkc8aEsfFQSz6+p3Y68OafTeTt2AYzYelmW4oF806Qzmb2v
         Zp/qy1JjfrVK2HsCjJ+YQZSuEMm+W31xk6pxBLfmFaJGlWFdOdZHe8lvo1pKNqf/j+SR
         UkFnXURuHJK/8TYdp/3gXBGwccjI94FgdqLYGLsXoTLcg1QagsMGzmEJoT42X0xh+xsT
         i1+JKZ/bQ+zdQVwj4W3QuiqeH7MQ9xKGJyA6pBeB3Z3V2ax07FWcG6RllAPec3TTngbQ
         +uLS7bVzTLCxRK7IKN8HGsJZI/hADGKNeAbki3xLCinkM4sswSoa4hsUUAY7BJTevMAU
         9WnA==
X-Forwarded-Encrypted: i=1; AHgh+RoBbSmjCu6nOl7fIwr2kHP+Piv+YBHTBwh+kqsDpvujbQQ3pailrkvf331hpnX7jXXYXghHLpjH9LmK7/c=@vger.kernel.org
X-Gm-Message-State: AFuF++nhFt/pCPKkvxJMaA0op1ayaR8oSHCzuwxYvKdinyvAXzFMy+7k
	oICua56mAFXJUkJZmMAB2vSX6UTkSqEamz2PyuCRBt0XoenAp9bgJ4stFyMJB62otQQ=
X-Gm-Gg: AR+sD12hpY8qkrLqvRZodvZNbw3v43/fk2eIC2I8n4n3WOd8tqX4iMDLxDnd/FBdzUK
	pRAsQYx8An+Nm/pPyGLXJVwb80imG3lVHE7mkzVNOonfAdX/i55XbdGseCN0AXXqG5nspPWkLYi
	CJTm7a9WuVzYBciR1hqQyodRYhE5EmR6rUOz0Gf6d/+VxNTZJy00SkgNtQnL+gfqLAEfv9gYU7H
	IADc3mSZmpWdbzfamMyyk4CVI/kzsPknHOX0v2bQttr29gha3K5xXk1oWx7ekVY5sRXvg8Rivgu
	BYEuTIdyd3HOYu5odd6gfLCLSMQcpdu2PhWOJk1IKZu1coAkB9JcR4JLWvqz15yiN3DtDjnAioF
	P18pfiBTXPmPS4MLBZT9CZgCwBLzq9+vs13u919TUlOjJPsOaP1BynqbOkhQ8+w5G7GoAfDjoDj
	7gKWpwlvUaYvXzl/7klcctBsCd1zXAIPdgFrewJQRcG6GhcL1mezYby3w0RN6wdQ==
X-Received: by 2002:a05:6000:268a:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-482f7985909mr8983909f8f.8.1787912741232;
        Fri, 28 Aug 2026 03:25:41 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm3142782f8f.3.2026.08.28.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:25:40 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:25:38 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk] printk/nbcon: Change nbcon_irq_work to
 IRQ_WORK_LAZY
Message-ID: <apFiIr5RNqJaFz2a@pathway.suse.cz>
References: <20260827184750.203521-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827184750.203521-1-john.ogness@linutronix.de>

On Thu 2026-08-27 20:53:38, John Ogness wrote:
> For some platforms it is a problem to queue irq_work when entering
> cpuidle states. Since nbcon uses irq_work for waking the printing
> kthreads, any printk() calls when entering cpuidle states can lead
> to the affected hardware hanging. Tegra20 and Tegra30 are examples
> of such platforms. Avoiding raising the irq_work IRQ has shown to
> circumvent the problem.
> 
> Change the nbcon_irq_work to be IRQ_WORK_LAZY, thus not raising
> an IRQ upon irq_work queuing. The irq_work is then handled on the
> next interrupt (worst case, kernel tick). This additional delay is
> acceptable because nbcon_irq_work is only responsible for
> non-emergency deferred printing, which is delayed anyway. This also
> has the benefit of not needing to raise an IRQ for each printk()
> call.
> 
> Link: https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to wait for v2 which would fix the preexisting problem
reported by Sashiko. Anyway, I am going to queue this for 7.3-rcX
to prevent regressions caused by converting the uart 8250 console
driver into nbcon API.

Best Regards,
Petr
