Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618148;
	b=dr/W4WnO1gaD7LTBFgIvgOzjX5JyCs56inZrXpkEo2KGl4+GPaP+omNUuj2kq40vYMJp
	 Z9yjXFbsOPtLcrIqeo1O5k6wpM9QoV44wS9sptp7kw83zBNBmuoUNfwagcddSofCJb5T6
	 aPWzNe+tgtRo7ehT4AjPFoXrPnY1iSJ3aEVhC02CqUvXAOLvLgWvqGCjzme6rEYCJu/Eo
	 /zhH0EM3SMMUPRBMhTBPaF4NZPmulE8YutH17EPjzqksHDSPf6ahhN1db1VBv0Q2jC9md
	 zMjNT+5CoRu97cV3cFwxlukJLN9SOUcr2LNETJxeavU8X+JBWokh91N1BhSLMOexc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618148;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=j3k2JcIDr9e6NfXKHf9MQ7O+/Axvni6jr8jzTqhwKMc=;
	b=jaeMK+REXc4rSULztX9XzatQRsEgR90cDmPfJKZGTP5lyXFRcEZIhBOpzsPiGCfgdcDY
	 ztKroixTZdg+8d8Am3nqBAD1XDN7Au7cv2rUed34MWGgwLdaOW9hLGNbCEfZLrxILB/qS
	 2UjXDJQjWsLi3fAUAgcl5tXqupXilslBoJFjEOrzkVmIVabDuIXg6KTwxLuDJay9S8EZM
	 xceQ6xKj/yqZOpdfeB0v8FZ+unJgW/2Iy4YVGrbzw3Ba0A59zqxM+aZOPPqPTBhl29qvw
	 6+zHCeh8Wtz79S+Xu9THga0k/M9mlyXa4OYzYfCEflNkrrToNYNrIJzB1vwrUQqYoUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eo2jFmGu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OMmCtm6M;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C2606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eo2jFmGu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OMmCtm6M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793618147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3k2JcIDr9e6NfXKHf9MQ7O+/Axvni6jr8jzTqhwKMc=;
	b=eo2jFmGuor/sRVdxTNFSSYJsOe4HPV60O3CYn6wj4QiGbldC9dtyNp23GaqW7vo7+RXar+
	HnfUjiIWaxSFtuZ3b+ajFZ88WhEoRqjUkR4Gq7yJCNkavqGpPQfm+KlywmFL4V5mvsqDDq
	X7nsWQ2o9Zn5M/h5l0V7abq55WMn9Zo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-V2s-M-FZP7aOPjQNSCIWhQ-1; Mon, 02 Nov 2026 06:15:45 -0500
X-MC-Unique: V2s-M-FZP7aOPjQNSCIWhQ-1
X-Mimecast-MFC-AGG-ID: V2s-M-FZP7aOPjQNSCIWhQ_1793618144
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ae2756fa7aso12594675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793618144; x=1794222944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3k2JcIDr9e6NfXKHf9MQ7O+/Axvni6jr8jzTqhwKMc=;
        b=OMmCtm6MT3QZEVIbElmvpJ3duPIicaLV36SAZwYZHqIxN+9alutHFweDWfsoYY9lQQ
         LrGf+8Re4w4OdJTjBzTqnrE9aePGkBKIXef5TVVizFLi/3Kp6rnCSXHzJHHFe4vjD/X6
         1cYwRDwTxI/irM5EIump+c9qNCV66jaccSNBalWtzo+o578Qz50pYfyvDBQA5P96EDNA
         gzX9FZUuY+y00YuY6O1Gpf4KByff8RzcU60HSNRWe/SI/hTUyDFdL8G8lq17//P3HccA
         cqhR4W7XVbTfKSBAv99L7kg2EKWjSyiDbjXicjMbisXzaKZqHx7ggztOQTe7+LzR2A4T
         nTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618144; x=1794222944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3k2JcIDr9e6NfXKHf9MQ7O+/Axvni6jr8jzTqhwKMc=;
        b=Wy3VogINTMFqq9poQLzkqy7ex6DL7+ZGXEue1i7Jki4Sn+pv8Gvzu65JdvLDwiqXth
         cz7Pt60z5ScJJ2spOEZuCA9SeVfTZqA7RjFkW/yHFFLjTuqTTncY5LXsYM8GUReQVGE2
         J1GaT3481T6CfhEsN8asSMMMgsKKDjG2v45HcPO7FJxkXpAdsYXfTreUKSsbXnMyH5DZ
         8Q5nELDCTO84JzgFBbrRSgaGTDLI81uQicGg83nAC7V0/DnBGfh8Z4BK6ejwG7mwlwzU
         FdrDjOSxw7TVXPSagEk0ccgxpHSHGgE1Z0fsH5Wpy2YbAezuz2kNDVhykN2rp5KTExtk
         p/uQ==
X-Forwarded-Encrypted: i=1; AKwUvBz95Z0a/1ioTXpOy5lIiLkSi6Ch+cXpTqvkMfcJeKECgjxQz/spj4Fourn4fyiPtxRKRTF2YHmkacYLQ10=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHZQIklnp5JR0TmnSWeSLMF6B+fqzVyr3XPPKDH8tObuPtMv3h
	PZpi0gBsr01p7QTJbWMyA0wU40ZC1AHLOkCRBA5uxFeTRhoVACmrkcxbgmuHx54C3M4mK6D/NlZ
	EnPLUasjOIuoftJThLptQYAK1qH59j7XtIM/PMuOk/2AG1jvAXPedZ3+BWQBwr4gFmQ==
X-Gm-Gg: AYBFou3FtZeOAfLofW+p4XTdvYUOA5AxXldDFfKrqm6rD3V9NGyvxNi5Ng4OA8dDU6t
	ivQeY6ChnYuCEAS32NDmZK97/G6EIYj1R8fGAlo2o0U/uHY/LCSfvFzrSRyPP4kpl4Z30/pQBat
	5eevRoKq0gwdOUs4mn0h080BqG+82rZPL1v1d/1HE2Kzs6SmbRF0cmzPlvlVzBW77W0hmrDGH4C
	f2BvDgg57UNFcucNcr9BTMgxMWyErBjgHaTQ/aym4eW2ylVQHd5CzCMWSn4Jji2uDn9t4W/7dyI
	pV5qgx1/oSfZamLr6SsCsdJy8iy/xi+fL0wZER0TteqBI8SN8W8CV++NDMufCSFrzT8VK3uQbs0
	g/+FS7ucjIxljoZnEPxjVSR7wXgIn7YlmgFfe3kxOFQC8NH8oGQ08Nax0AN3wo/cSfN4KuhCNB3
	b9mw==
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr220395145e9.34.1793618144173;
        Mon, 02 Nov 2026 03:15:44 -0800 (PST)
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr220394775e9.34.1793618143852;
        Mon, 02 Nov 2026 03:15:43 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm19099569f8f.47.2026.11.02.03.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:15:43 -0800 (PST)
Date: Mon, 2 Nov 2026 12:15:41 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Andrea Righi <arighi@nvidia.com>, sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline: total_bw leak when a task leaves SCHED_DEADLINE
 while not queued
Message-ID: <auhw3ctxwy8qeOvs@jlelli-thinkpadt14gen4.remote.csb>
References: <2b5fb3f22bca6aa383be8f4781923392@kernel.org>
 <auRh42kZI1xLIWNr@jlelli-thinkpadt14gen4.remote.csb>
 <1a24bcdde0bb6e4a8c839351002e841d@kernel.org>
 <auhhGAjRtuSb5JP7@jlelli-thinkpadt14gen4.remote.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auhhGAjRtuSb5JP7@jlelli-thinkpadt14gen4.remote.csb>

On 02/11/26 11:08, Juri Lelli wrote:
> On 30/10/26 14:47, Tejun Heo wrote:
> > Hello, Juri.
> > 
> > On Fri, Oct 30, 2026 at 10:22:43AM +0100, Juri Lelli wrote:
> > > Does the below help?
> > 
> > Yes, it fixes the leak. On abf8c33470f7 with the patch, the reproducer leaks
> > 0 in all three cases, and 60s of random policy churn ends with total_bw back
> > at its starting value. Two problems though.
> 
> Thanks for testing and reporting the additional issues!
> 
> > sched_setattr(SCHED_OTHER) with SCHED_FLAG_KEEP_PARAMS on a sleeping
> > DEADLINE task leaves it DEADLINE, but each call releases its bandwidth, and
> > its exit releases it again. total_bw relative to before the task became
> > DEADLINE, with a 2ms/10ms task (0.2 CPU = 209715):
> > 
> >   after the DEADLINE set        +209715
> >   after the 1st KEEP_PARAMS call      0
> >   after the 2nd                 -209715
> >   after the 3rd                 -419430
> >   after the task exits          -629145
> > 
> > After that, sched_setattr(SCHED_DEADLINE) for a new 2ms/10ms task fails with
> > -EBUSY while a 3ms/10ms one is admitted, and offlining a CPU fails with
> > -EBUSY.
> 
> sched_setattr(OTHER, KEEP_PARAMS) on a DEADLINE task doesn't make much
> sense to me :).. I'm inclined to think we want to fail early in this
> case.
> 
> > Switching a sleeping DEADLINE task to SCHED_OTHER after its CPU was offlined
> > crashes in the __dl_sub() the patch adds, dividing by
> > dl_bw_cpus(task_cpu(p)), which is 0 for that root domain:
> > 
> >   Oops: divide error: 0000 [#1] SMP NOPTI
> >   RIP: 0010:switched_from_dl+0x13a/0x3e0
> > 
> > Unpatched mainline only leaks in this case.
> 
> This one looks like a pre-existing issue which my total_bw fix makes
> worse (w/p it we leak but don't crash).
> 
> Let me see what I can do about both.

Would you be able to re-test with the patches at

https://github.com/jlelli/linux.git fix/dl-total-bw-leak

BTW, it looks like I could verify with reproducers I pushed to
https://github.com/jlelli/sched-deadline-tests/commits/fix/dl-total-bw-leak-reproducer
but I'm not sure if they are similar/equivalent to what you have at your
end.

Thanks,
Juri

