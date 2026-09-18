Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0538E5DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741053; cv=none; b=W9FvctI7pCkBkZD7t0kzNrwD1Be+cVF34gvkB+HYCbn0+e1QM5Fc8bt2Dd0jdjGxormNJsLgnecxVdnxzgkgZSeLopUFZPIUpko1ThHLAO5RrzbHhpwheghlAglinPQx8+Y0aorx2+nKlVsuqMDZjXf4/1tPedboHMIw7pAWo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741053; c=relaxed/simple;
	bh=0SUOoIAUaLT7F1Gk4YYUyXePP6L3UTYZWjgmxML1hhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc1JxyQbRtRier2N4R1xWH+6msM1O4RQcNx9jon8TfrkZxuT2QkW5VkQRxnU/kuaIYsFT/JzGJEPrS47fcjs31/+SL0/cGLQmma/FKuSSQxOHuTf3Gr1p27wxrkU7M2Q3FqnVb8mR0K+ufQyZ5YLO4D2A6z2mUhJjhR9/jgN2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tbnp0DPF; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tbnp0DPF"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so6301081cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789741051; x=1790345851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uadj5t2QE0GhPwN/LGtDC4GsH7sMKtOhGKh1V/7jDls=;
        b=tbnp0DPFZzCzJI92LO+DZBa4LFBADqSgbjMCOiVY0f04DmdXMo7xhxkmxpftADnhCX
         vEmsFrGVJC5hraBVWBUbx+1ApcBwRU2hbl2Wp7frwdHb3Qsa8rmbKo8WtS4qynZMxFnO
         X3eZceM3ShMYND/1X5fbiTV9ARGkdeEz+BaLOKxYg+qRtUxjy8AHHyDRUMeWiFv5eiwZ
         6cqp7hZL1h/ASPxGHzYH3jl4HBlrgFi1BmLeqvg/AXAgSO5gJPs6O+RfUuMOdXKhBsso
         D3kC6Phnj1Ob5lyLRkVkfaFhgBaqWv/Yy0JGoLndPS0E2qi0mz5d+vGtuXl1EEJugffC
         M2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741051; x=1790345851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uadj5t2QE0GhPwN/LGtDC4GsH7sMKtOhGKh1V/7jDls=;
        b=eV9XDlwmbZvhNGja52/4Vvs+yLDu2l7r1JmEK+0jHsv/SecIiTRkvVLYi4QIfh99II
         7wOVws9MENCUPsu+KgWRcveoO9iupOpBzff7b/y4Ff3Pmh1OgPNB6sqnntvBbGzjZUe4
         egSEqPXZpUM9xrTrqbAgJvPpz5k3hHvCKZlGvmNUvEBYewpmxYurOnpJrAV8ulwAL0AX
         hyPGNqoVfEhKAU/GXllAAhj4Y5Fh79iSS/tVXvp7v7bh6U5o1BnmGSBdzoYj/Fnq5ilq
         rfPx7TJYwemlUcmTjAMrZlrqTfigctfUXCzJfIRWqsypositIIV5vPMJOeVXRkYP3Dsa
         jSFw==
X-Forwarded-Encrypted: i=1; AKwUvBwdp0eMJWd+/sTp8pYhRadKT7yLXWcdo3DiHOtm2UEdkiXPOROb2grEPnQ3JmsjD3GKiQlVhzK9Asm8/vo=@vger.kernel.org
X-Gm-Message-State: AFuF++neDP0NxK7P0F/YbVZV0dx2VGr509Te2JbKmZis4ciNeBfIul78
	QPKrRKrUeFeiMQJy7qMXYBV1/McOqTHeKSckN5jlGqkX3+qJPjHKgX3XyfAdl49FhQ==
X-Gm-Gg: AYBFou1Gp7s1o9dQRO75M68K4crKHWbXSy/bTFfVgEUhAd0FfxMpD7MuDEapZaoGyjI
	QuAJC2JCqxIY2f6UMxuGBTNx43fU01ZMAqMXMTGbI+uAWT1VM+WFbSHGqIyGKJZgm/m5lIS6cFt
	12Rum6d/GwDQY7Oz5E3Zu/oudIh8Uc4+Lp+sBMp7HqQwJuBkVGMXYOB9fa2DN6iQ7mYLoL8WfZ4
	9s/CCFPD56CrQ5K/X8BufdvicSMFeedI0lEL2QiTn43nffrRBSQLEAW6+FB/fttuDqrILzW4A5X
	E6uTEB3PV198lXE4SiSHxZzDZ+a2+I+sWPy57gc8ZeHoea+XwnCKdaVLFfriAg1+j8xbqhQhD+n
	OL8QFI7V1nOfBD+wMyU21rD5N7ibIpuHeffP3iEviUj71wfzXbgA+gwKJLeDoPlPhIWpqJxY7qY
	GfO29suidjjwJ2uI65i3fVE4cXusLxlflDoB5syWmaseloCYB4TyCAr4kBtmqd5rztB3Sc8T3X
X-Received: by 2002:a05:622a:4c16:b0:52d:28f8:578c with SMTP id d75a77b69052e-5329e393052mr40542951cf.31.1789741050517;
        Fri, 18 Sep 2026 07:17:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ac48dfc9sm1986711cf.8.2026.09.18.07.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:17:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:17:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <fd663410-6aff-42f1-a6e7-652f073fdafe@rowland.harvard.edu>
References: <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
 <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
 <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com>
 <9c07ce98-a5bf-4bcc-9304-e7f5e1747842@rowland.harvard.edu>
 <CAFmvuTW5kqF8zNp7wSxB3abhD9ZvfJ0gu9Si8kRTiwcuXOeVuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTW5kqF8zNp7wSxB3abhD9ZvfJ0gu9Si8kRTiwcuXOeVuw@mail.gmail.com>

On Fri, Sep 18, 2026 at 10:30:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> > I wonder which part of the code was holding udc_usage above 0?
> 
> It was the udc_usage increment in ep_aio() during request submission.
> The increment occurs before dev->lock is released to call
> kiocb_set_cancel_fn() and usb_ep_queue(), and the corresponding decrement
> occurs after usb_ep_queue() returns:
> 
>     ++epdata->dev->udc_usage;
>     spin_unlock_irq(&epdata->dev->lock);
> 
>     kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>     value = usb_ep_queue(ep, req, GFP_KERNEL);
> 
>     spin_lock_irq(&epdata->dev->lock);
>     --epdata->dev->udc_usage;
> 
> In the matched control, a request with a length of 64 bytes took the
> direct giveback path, where dummy_queue() calls
> usb_gadget_giveback_request() before returning to usb_ep_queue().
> usb_gadget_giveback_request() synchronously invokes the request's
> completion callback, which was ep_aio_complete() in this test. Because I
> held ep_aio_complete() at the diagnostic gate immediately after
> iocb->ki_complete() returned, the nested giveback call could not return.
> Consequently, neither dummy_queue() nor usb_ep_queue() had returned, and
> ep_aio() had not reached the decrement. gadgetfs_unbind() therefore saw
> udc_usage at 1 and waited.

Of course.  Now I get it.

> In the normal transfer test, by contrast, usb_ep_queue() returned and
> ep_aio() decremented udc_usage before the later completion callback ran.
> I confirmed this ordering in three runs without enabling a callback
> gate.
> 
> I verified the sequence for direct giveback with markers after the
> increment, after usb_ep_queue() returned but before the decrement, after
> the decrement, and immediately before and after the unbind wait. In each
> of three runs, markers with the same dev pointer showed ep_aio()
> incrementing udc_usage to 1 and gadgetfs_unbind() entering the udc_usage
> wait with the count still at 1. After I released the diagnostic gate,
> usb_ep_queue() returned, ep_aio() decremented the count to 0, and
> gadgetfs_unbind() left the wait.
> 
> > I will submit the patches, with your Signed-off-by:
> > added to this one also, if that's okay with you.
> 
> Yes, that is okay with me. Please add it as:
> 
> Minseo Kim <neck3922@gmail.com>

I will, and I will CC: you on the submissions.

Alan Stern
