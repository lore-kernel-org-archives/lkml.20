Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806792;
	b=UF1dhYbJ1LHg0nDUMO7JyFIaF6HGk/RP6Lqz/fbfrFXKC3L11FhJOJ89MRRVu1DzZ5k8
	 yhe3s4bHSA0GOfcQu/3A2LksmYfqdZzt22F+IckryY7Hw3sNgMF+SiUTaU4sUROBOQXop
	 s3WLDjdDZHYqhbsudmUPKMBZ+rExxjtVETbiSOUKKUuOpCZEkfFz4ABcvBLG3rc6b6RC/
	 9I7WjFFaYfHvikPQA1Vzibhc3pSpGGBV5hw0Ebnu9sDnUUYrGpZYcEF/EJ1PeXNcbYRyg
	 S0gnYrYgWnLtwV2ohFFBFbsOiH1zM3t7TEIe3BVD/Xzkn2NFkvDyikjLaYumRiEmSGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
	b=wwn+KoHQkDYreBGucsXSKMTXPlfDOEx2Z1U0ujqDq06MSqHEoF5QqnPP98rE061QIEfB
	 e77VLv/e1TVGv5GQWgVJET2nZvE2SU//Zz6Emi2B/7+FgOLVSLq8Dq1qTk48cx0C2AR7v
	 OhnPoS7pel7FdzJS5bC2+dRq1M8k7I2nm0FgyyBg671NBXysIL/D+YQ8j1PBxjYKrheRR
	 JGBxPC3iM0e/JaCb7LBD6npt/NaQJeJJ+YKGWQv+NKlbIn1g2Au3MzD0zbHdSV5d1ru5c
	 OjRho7koR6Nj1csenMjiHVSjqON0Zum4J2S9i0Isypp1OE/EqdSAe9Kw0Q5RO46boaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qJuEGuii;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD3F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD3F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qJuEGuii
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f36c18b75so74406885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792806786; x=1793411586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
        b=qJuEGuiiTo4qSSJz7+E1oluEgXCF5Q7bIkPpU+mVQJxKqdJQl0qn99fQARIHEz0SLf
         7Zq/R5fGJcEoYsDfI4rKiSj6X2gKELccAr9cvephMMb6R69nQL5BERqC1sdoe72MomTI
         nfJ1+BFPu8ya8iOaDBmS1HPMjKmwWP2cYv7U3FUlsTJBHFsyo/cnHwyxD57v1QJAf1uF
         EL9xd+P4nRtom4L07elrIoZWOPmB5+/hTi9vtr8wIVbw5rafwGWXAek60zJP3O4vNzkR
         w+j52awfLN3pFwyE80YIl7wuJOP4FQqA6jyPp/b4f+bgLReMowERYR/DpctJgX5Jj/lp
         Vi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806786; x=1793411586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
        b=ca9WAjwZYuvpUi8v21vM5SralR4aGxKFJVkqkp8p7+PBFLkGZ2Pjl6V0gPrhhfHN6k
         qsl+9N3mJLjVNti+PpiwrM1UvDXAeBQ1xk4j/eaU9p9ymUPWOaFVKEpTuAxxj1vYO5ph
         Tz3omqQiIVQTbX/eEaROspIbA0AADxx0lk2fxfmLRZOY74fcmnizBoaXEUTwtpBv6D+9
         UDqp7TJZyqa3J3UQo1iq1fg4VvzNkG2ycQjF+X7lRJqa/YuBkTjaZhQRaVszTKnDcxdP
         7/tSRMZANnmaqhQD87MNWuqtSp6DYFtuw9EbhalTif5kO6Sx4jom4KVkV6+/VplnYiMu
         ESeQ==
X-Forwarded-Encrypted: i=1; AKwUvBylTM2oM/a2OdwHFO8v71FFm7BY8gPY5faVYQUxIRFwaqtkPBcLT56o/NRjAXYw428Ip6Vfg3GkDj3WeBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkcCsnpUTemLaHvqDV2LNu9ZXmz9HsCIlBhX7d/CF4PaZx5ZkB
	eMmCbH9OrO7aQz1Fpq15Ozxq9HkvpeYxg160CKYsZjLBU3nZ9YzN/9mClgIWi8l9TA==
X-Gm-Gg: AYBFou19unnES3lglV1pCX7h2f6YEf98r9HITQpf4NyAsM0HUvk7ZewQQs8j6eOv/jp
	6YasGAFKAqAPmdDvlpYyT9xW90E2xZV/hjQndINN5WJVThPAXBQHnhZ4/94Yw2g/rzT5TJqKM0G
	VPMSmG5io6iXTsRIg5Kl38BoITcYuLy9jXwNc+Bp8ZJInLuOI9veBeslidz6YCZTVP/NNwlYnGf
	4pWO4rW43TXJBce0QozHv2ftkcYPyy3wHXW5V7ZL5Cy7Po6IwLidNiThyNM9yh1Q8HgXNk0LdR5
	aQXdUWzUhoia7TzwDObFOmwyqE75zwuNIjDqHBZCuV2dSegY8F/bR3ODA2iv14h4Nn/Q6Iy5TKk
	Maa/FyzNXi5rsF3BjY6kG3p3vZO1CjsiJUTqzQJeijRFpWinJF+NYman1OzCSiobYL92CPLI1z8
	ZJ8I5fYhuAqOvpOz5Z/YpfQgyEKmavNjhGTo0rNb7XAZpjBBzz4pfVpnLIRA2sSIb3L4KZ9e3qG
	5qErRmVoJwHMhR3x21WMXbF1PYpNTNyqhxnBxd707rZhqlWMFmva49cxKCWf9R7OYOnjF2xnMUa
	tw==
X-Received: by 2002:a05:620a:271d:b0:93e:ad16:9590 with SMTP id af79cd13be357-940ef94e80fmr107135785a.36.1792806786139;
        Fri, 23 Oct 2026 18:53:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f06672d6sm62365285a.12.2026.10.23.18.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 18:53:05 -0700 (PDT)
Date: Fri, 23 Oct 2026 21:53:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on
 stop
Message-ID: <d95ba108-30f2-4c86-a47a-2b842b8cb25a@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
 <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>
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
In-Reply-To: <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>

On Fri, Oct 23, 2026 at 10:31:27PM +0300, IgorpetinDev wrote:
> Hi Alan,
> 
> Thanks for looking at the patch.
> 
> I think the bot caused some confusion by talking about stranded URBs.
> There are actually no pending URBs left on the list at all. The driver
> properly killed all of them.
> The issue is a race inside usb_giveback_urb_bh itself. The function
> usb_kill_urb() unblocks as soon as __usb_hcd_giveback_urb() drops
> use_count and wakes the waitqueue. The caller immediately wakes up,
> finishes removal, and frees struct usb_hcd via usb_put_hcd().
> 
> Meanwhile, the worker thread on the other CPU is still running the
> tail of usb_giveback_urb_bh(). Right after __usb_hcd_giveback_urb()
> returns, it tries to access bh->completing_ep, bh->lock, and
> bh->running. Because bh is embedded directly inside struct usb_hcd,
> this access hits already freed memory.

Okay, now I understand your concern.

> So all URBs are already completed and bh->head is empty, but the
> teardown path still needs to wait for the worker thread to fully exit
> before the HCD structure gets freed.
> Would calling flush_work() on both BH work items be the better way to
> synchronize this without the concern raised by the bot?

Yes, I think it would.  After all, it's just good form to flush or 
cancel a work item before deallocating it, if you can't prove that it 
must already be idle.

Alan Stern
