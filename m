Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96582147E6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165796; cv=none; b=NmTkhQ9kQ+hyuArj68VQrjm8tRpRv+BfsiAd/Sw/Ee2R1FEPof9fbKxMo0z9qn+CowVs9B54GTret9pj+V7gqCImg5IvZfwioFVGboQYsSPeTw4c7ALptie7lYEx8Qlb5hRU2HVYpyjxEMp6Ig09OQFPVwHHaBtss7VD870PJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165796; c=relaxed/simple;
	bh=nBggCNPH6bpTzD8mrC88cZnve5HLygAexyN0l35Ms20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsNSAGbLBdS1C/5DBxr1GurUuMKaZ9btzVXfc1bqC9c6iWmSq767ofj5VoIEIPxjAl+t/iG5esbBOMTTTQuIDdivIUEbKDGcPwrcoKjbszhXKIHu4ycADXxNmuzWPXaSJGorarghhdIXaQ3pT5xDF5c7x5SSJZTLAcr0VWyEwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EXLJb5JZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EXLJb5JZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso2645425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790165791; x=1790770591; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ixtpD3VykLYQiC4EZhJm008QI8qw2KZpD5O738a4zw=;
        b=EXLJb5JZ+HSSrSfE+YMJ+9U941PzVwaK/Os8mXaajGYk15XOAG0g+x7aMRPZI4ULph
         ismuHnTcRXoZ4lmjbA07uJmP3RtHUQKmT4fZHJzI89Wa5vsySXfFSc2Ac6TallGSeWEN
         EUGRHL0n7S8M2RTBVyhgEaG8k+nujYz69XOX0gPmr+AWNV8LS5SgmvykFc+Gfb9uaToI
         nzq3eZWBU0iVlaJvlGxBVfQ1bFsjdTDCdU0dZJKP/JB4uz8Vbc1Tvf53opoJVTGcrXiU
         Q5ifwyyn91ud8Nu+zPYCjgO7K+lY+hejn2hvUfzxr0EN7Wq7r/B22Hj+WkWAJceDrZO/
         +SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165791; x=1790770591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ixtpD3VykLYQiC4EZhJm008QI8qw2KZpD5O738a4zw=;
        b=om91IwcZmxpkyHRUURMfyfDvO30sqPy41H+f2U3ZttBDjI6PTBdhtweVn+PAYlgS7v
         7hIsdCMTYwhR22G3agqP4b8HcyCbf8Qh/WlrKP9bl2y6rx7PoYU/zdKg1p8WRleUPaXP
         zwUFBtR7BVi7dp37T1SqJsnhqBc/b/fIEslM6Si7R8kFfRwwUP72oYEcDuQsD8x+MlXv
         jY7nVPuCt+YC0tVCavhclZrMH98QvzVUMem6ZKo6JrZ2TVunJZvRBNRjXB2uGoF92l6m
         C8mHNKVnOkJa/xiFtsEQquAKy5fuT2Y0lGm0TVHteETNVTpMGW2Pqx0pz+0ksb0kzMS3
         msrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl+UrlYpVWxOLtPC5B7Vi7nk6aMM78fCYvMruP2hCftjLI+nIp8/LfA7JzGIhykir2WngCqggsQOCdlvQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgoPaqE3CBbYvPfOSDYffZSPgqFoGyltXDqhNrrRwYpiQ7Fkw8
	IOS5z3BKCtVvVZSI10PBPQlZqHqRHrCcanOlHWV8eR0uQsLoscsB2lIGGYZyXK7AVaU=
X-Gm-Gg: AYBFou2OOLbv9cD5vFfWXjEprBf1dJXB7tnQN54MCz69h0ZgHM555iWvqEbRfye36zt
	VTWgLT4a8XYzMdBuaHqtL22zPkRG5vLhNVYb2A+0b/AFP6gh7VewIMhceZMn2xo0+1l7BdCRGH5
	8s5jZtT/ldvoqB0YJy0wZV/LqYA3a3nce3B/s1N/IFkkGCb0dMhhjmz0tYpXmgZXHY2wuqdyd4V
	KocGe4Svk1qQrzbReAn7HgDCFOWR05bIWmrByh5FkTz6c52VDDX9Km1pxX45jjimpW1Vk3dhr3y
	fcuP3q93FFts8KluaXpiirGEVAse1rn3E8s05Ho94hcKPqy/hS274ru09EF77+Qz34rn4VPafBg
	F3ACAnFRiceWOP0/Y5AAbc+W3APp7E07O9jS3I9Hze36+zjX3J6dsLZVfdbAisoG891mmWbOcZL
	nmUeX0Nfr+C6U5kcxF9s9UfZXaUE4SNFZtQ6jmOyrq+unGEuYcmrFC6BwEinVR5maVIZxgL2cMd
	ytyQRl9oeegJOg=
X-Received: by 2002:a05:600c:1d1a:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fde360116mr36490405e9.4.1790165790614;
        Wed, 23 Sep 2026 05:16:30 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde198f85sm77809395e9.8.2026.09.23.05.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:16:29 -0700 (PDT)
Date: Wed, 23 Sep 2026 14:16:25 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <arPDGWWeBEb1b3vW@pathway.suse.cz>
References: <20260914143412.1sMcp89V@linutronix.de>
 <87zex9tcip.fsf@jogness.linutronix.de>
 <20260923075512.SBaoMRXt@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923075512.SBaoMRXt@linutronix.de>

On Wed 2026-09-23 09:55:12, Sebastian Andrzej Siewior wrote:
> On 2026-09-22 19:35:26 [+0200], John Ogness wrote:
> > > @@ -4643,12 +4637,11 @@ static void __wake_up_klogd(int val)
> > >  	 *
> > >  	 * This pairs with devkmsg_read:A and syslog_print:A.
> > >  	 */
> > > -	if (wq_has_sleeper(&log_wait) || /* LMM(__wake_up_klogd:A) */
> > > -	    (val & PRINTK_PENDING_OUTPUT)) {
> > > -		this_cpu_or(printk_pending, val);
> > > -		irq_work_queue(this_cpu_ptr(&wake_up_klogd_work));
> > > -	}
> > > -	preempt_enable();
> > > +	if (wq_has_sleeper(&log_wait)) /* LMM(__wake_up_klogd:A) */
> > > +		irq_work_queue(&pending_wakeup_work);
> > > +
> > > +	if (val & PRINTK_PENDING_OUTPUT)
> > > +		irq_work_queue(&pending_output_work);
> > 
> > The ordering of operations has been reverse queued. Perhaps because
> > irq_work is LIFO (implementation internal detail) and you wanted to
> > preserve the current ordering?

Great catch.

> > Or maybe this ordering was chosen because
> > the code looks nicer. Either way, I think it doesn't matter if the
> > legacy flushing occurs before/after waking the klogd waiter.
> 
> Hmm. I did not give much thinking into the ordering because it shouldn't
> matter. We used to have "unlock" followed by "wakeup" in the irq-work
> callback and this is what we have now given the LIFO ordering.
> Having "wakeup" first might not take effect immediately because the
> scheduler delays it or puts it on the current CPU and then it is delayed
> until after the interrupt ("unlock") is done. So…

Honestly, I am not sure what ordering is better. And it depends on
the internal irq_work implementation now. I would keep the patch
as is.

Best Regards,
Petr
