Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4C378832
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343327; cv=none; b=aTidEzPnjRqIiwU2lVdPU/Z1jK7PUSylAzs9UZx3QPw/2YOdOExo+VRcLsIB6DGe95qhW6cTret1eO6MjEXhCmmFbxuhbcfODYq3QHIjvvw+Ek8H56+ObL497T9m4FDNTP+NeSEVphhg3y4iJPCNNf60ps4t2GS5M89TySK02c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343327; c=relaxed/simple;
	bh=iWowelTfnD/Sqa1CSe4HGlOwOvPpQS09Od9B4ljnPqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gB4T3JtTpxZ8sy736cWHkU/urMSLvJ2BNaNFsqYtP8J61ZbcZT8gBjWdke9na3yureXhdyoKO4Cq25UqOSOVd3wKh0FEHxZsHJ9YaXnFrSHq2TWMX6p7ccoklzI6IiVxngYhqI4p7J+i8BNpUREnramEjcDgl8+cxuQ5xdwzHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eyUfgvu0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eyUfgvu0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1456086a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788343323; x=1788948123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4yBTqs5jwRTPYMT0/14DTINpZvY1iV3yr5rmhA0kGvE=;
        b=eyUfgvu0XngCPEvFM9BGAzCRu3OaC7erAkFmtwCipHWLHLmFLYSNPdG7eBHoYHL/3L
         9m555sa4wTby34fVR7oNJyF2CjOvUpovBLm5yeJzSvu7B2VwE5kjFv7QQyMvLs9u+PQI
         2FkKo8Xjn3VLB8XTRaiYR718BlP3M/++JZoYczxDRoXu3GkOeUH3WzTd1aEeWsCOAhpS
         hVIHk+APt/Zq9jWCTIOs4UxA9YCQhju5PecEi/ESC6lIJNUy+LHHv8h6mlG0k5XKv8lq
         IwlT75QCNIuhc+n6aJpH0Mby8/zcEvizFipYXTKyTg4++n05JSDTY7bTzMyZUCOuhJbq
         F0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343323; x=1788948123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yBTqs5jwRTPYMT0/14DTINpZvY1iV3yr5rmhA0kGvE=;
        b=p8s1E6GHAC3hEuwFBaB3FuojdDGhZUQ6UEsUi2JmSepBSNIcWftmO1+9/EZiZwSyVV
         ccIAFpS+BGmxiTZzir2zgFTbFsts+6UkNhOytCC4Ms7tSuq2jf8zDTuzXPPZpleNxrSf
         VyoRaP7/C56ytLRc2uMEJH+gEBpqdQd8UEA1Tcxi0eNpR+gtQLErkDFCUuLgTCr/Lb3T
         WfAk15ZyZ9zeRPAbSxrZV/o8TIUdMaWpsJBWC6g2vsBSlSib0Bro8pUR4PvFzsH4DZJC
         CreiHuY5gY1526NqbNrMO8L3mAGgTmUup7Sf35mx3rdBJ0ZBmMaXEGgU/fQ4FwBePpPt
         ut7g==
X-Forwarded-Encrypted: i=1; AKwUvBwSMYQSc+H382+F02WfCJz9WUOmAfb8afrU3deFQZ1whH8FxrptddULUbCeT0aWR5dh7ST/sejuuvl40Gs=@vger.kernel.org
X-Gm-Message-State: AFuF++kuk7OMA+IMYKo+h9D3qkG3cgKGzRQ0Qe6r654X4PQDEJ/5XnXr
	J/Jlp1YFsvmdPXD9S5fHdZORXi+E9IoVZgYVss9xl6lMXLw4jerqcdyb2iAxAJD26m8=
X-Gm-Gg: AYBFou2I6e9sYDluRt8G6DmctFxwFKJ+vWX4BIqJlKxdFFDZq7JLvDfSAwJvyzsqH9K
	S6DOGENXltCBqkeAe+sggGzQQ1Q/WDAMTSCj7AZFYJIzcw4fHow0RPF10LAgd6d6w4NMjbC9OgF
	uKZ52W6B7DG5FiJYQWkQ04LQhmgW7KkjKL8ukfHVtTEPTa/w7EPoPB9JKZya4hBF9nx9dcAZb2J
	b3Da2e9m5fBGnYvAHTVeNLCZmHOqRfexwqLXLlMQ3Uzt4HWl71mIyFGIzEkhDXHxd/pgj3xLvYk
	GS+dDxaHvClnpIgtBN78NfQnnHfvPmOyJ0iuRzDpDGBM6aALkdF0hy9CfoLxGnzC9r50eu0Hpvj
	KUMFqRO4tqMGp5vWh9d97UMaHbE7I15TFQmFL0sDsPos3Q7V0khOE+3mvQsqcWYRTgBngg6hsg4
	y0EOGK0aqlPlHsy1xj5rrUHOlazeqa6CkyTzEEDPqDLG7RchORgp3wHMhLxiUGdw==
X-Received: by 2002:a05:6402:46d0:b0:6a5:f692:9c3a with SMTP id 4fb4d7f45d1cf-6a6830397e0mr2543398a12.1.1788343323467;
        Wed, 02 Sep 2026 03:02:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4975275f8f.36.2026.09.02.03.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:02:02 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:02:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v3 0/2] nbcon irq_work fixes
Message-ID: <apf0GKgd5vxBAkOl@pathway.suse.cz>
References: <20260901093245.344455-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901093245.344455-1-john.ogness@linutronix.de>

On Tue 2026-09-01 11:37:41, John Ogness wrote:
> Hi,
> 
> This is v3 of a series to address some irq_work issues with nbcon.
> Initially motivated as a workaround for hardware-related regressions
> reported [0], it turns out that the workaround is actually a nice
> improvement for nbcon deferred printing in general.
> 
> v2 is here [1].
> 
> The changes since v2:
> 
> - On nbcon_free(), perform the irq_work flush before stopping the
>   kthread printer.
> 
> - Rework the commit message of patch 2/2 so that reducing interrupts
>   is the primary motivation and the Tegra workaround is a secondary
>   "benefit". I really want the Tegra workaround information to stay
>   in the commit message because it is historically significant.
> 
> John Ogness
> 
> [0] https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
> [1] https://lore.kernel.org/lkml/20260828140218.232439-1-john.ogness@linutronix.de
> 
> John Ogness (2):
>   printk/nbcon: Flush nbcon_irq_work in nbcon_free()
>   printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
> 
>  kernel/printk/nbcon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

JFYI, the patchset has been comitted into printk/linux.git,
branch for-7.3-irq-work-fixes.

I am going to give it few days in linux-next. Then I will create
a pull request for 7.3 unless any problems got reported.

Best Regards,
Petr
