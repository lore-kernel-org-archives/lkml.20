Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764929;
	b=vrG7nzWpEWKIaViuvZ2DwGWM4tamTi0f2aiLVeaJGqMaZ3eLO4OJrXqZSIoLDOtevhTC
	 Jpcx+En8SPRJ5K/eBkovwDntvInd5X5zVbaaJh/HjArDOJTANVyKUet4uXEja1Q5bSDyP
	 AqdMco4JLhNgA+uH84QPJPExIdmkU9wneLiA44gYy0yPI+0hZ3FREn+lboo76kcVTlof4
	 6rhOdmuNgUVYFDpDd4DfKVfXTPixRxNTr0w0NgNTfR/lOvGo9lWpKWhcsSQ2wCdk8gqvq
	 o1p4eImGG88U3aSFv7tgPtKKpwV8fQq/PfdwpxvEETAm2xM7qHyYVUJFzOkGKY+VCgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
	b=fi8t5Ku/YNPzkBrD6wBtCF2LT6MDRal/Tu+Xs36Mxs6O2OSDnRZRITz0Bpk1C2j/ANKt
	 4Hw6eUrpWnCA7pfs00McrbKGtugGGEeAuB3qRbwoYGfZRLgwrwpPfEy+8X88zVfX+WCsU
	 NrKB4SUBupHJL4U3TxAIY9GMaBVtF3cX4L7lDuacn1HhNYogEWcQGnX8RK7GJ3ZDfaiu4
	 VR/lkcsjHQyPXZKLyI4KHkdKktrME0D9qRysZwFw2/u9CWHAgdk6+edjnPBdf5Yr9kcxk
	 6cmpmOSO5S0uC5SetggB0aybNpob0aLUfjicbwahsskgl0+zJ6DB9HAqAmD+UF4LWhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IjsYUSfA;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA8760A2614
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA8760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IjsYUSfA
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so620243a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764928; x=1793369728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
        b=IjsYUSfAue94JFQbhh5hnEmtGsEXweK8TsINzpdfJb9RjNgvs9yfhXCjgertyLclLm
         P0dU/eXDn/+jw5TeSCuKltAyJ9CgPwmUrLi6e5AVtc8PnkUBojxY3LPkmfQc04nZaV+q
         p3O9+uo8ax62Jyrzy9KvE2NY7lUss/4uCeE3hO0z1qWxF6x4Jf6iq1R1GEtt51CKyYa2
         wptBnc+tPR/8nqum8sVX+xp6X5cGmGYVDYamEjjTzXkyMSd2gh9kpJd6as4/11XqN4sq
         0xrWCWHIK+isy1P6nftVmKZPrCxLi2rmKFZUfVN150+nBtWxNNjKzf+7ep6lNMS05BzL
         pCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764928; x=1793369728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tm/cpYxqrKZTkvEJNBnPzr85AedjzKo9UBMwFMFE+xU=;
        b=h1S3nC1oa61yDLCXND9mMvNMrzeF14owVNMMNe36mCI/j3QtCCDYMiXZ5/BQbx0CQg
         JE8mBfdsLj1vhBn1LL3HJMSyQ3XDjsqS2pP0UuxslLDXicsZao/gUj+HEzer/uLyWh+M
         U5haPV4yOyP9/dyaW0owwIoeG/WVZazytnKCS1P+Zjd1ibWlM56jQa2YVPlDr7vCh/M5
         TT1SNoyC8GfTyu0MGxoHeyA/qvl0Z2v8sm/21qpUbvQIT++QmgJjAnBHQmVfj9aHZxXQ
         g/wIyb89p6LqFIHdKQ7UUb0rcOlWIalae+2yCP0TTq3dTP1ysZmlJcDeMw3+R0z24yZ3
         JWMg==
X-Forwarded-Encrypted: i=1; AKwUvBzSGqGFK72Z73CzNlUBUz383oNXHIYjiFdXjohPRJDOJXKiTfXhGkc7kYuDghFG4Tpoxgl5cwtdWr2wHHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjFzQOKiUINEdNUjZ3z/MOGm5rjmFWtktnLuSky0XCslvtupJV
	SaMf7HSy37sLVFP6wFVWJvHoaHyzK1RxaAK33aaiKBXEjWkBhX5mcuynvd1wOVh4
X-Gm-Gg: AYBFou0K05CJ6PO3cv6ls7povdDqINWflzyHq53ZZCKHlFpGEakjaSCLwDQhUeKz4e0
	+/02HYNeXvP+Yx2Sq/aK7350F+mFQ/XC3SY6cd9LEt3p5J9ELx0GyHMjZO3e1OCRoe95OJ/SAVN
	4Gj7CMMV78dqY8Zern6u6ExXklJp4YyBimVnrP4AMrFUgahVbFOH+f+qF7t3fKnxJaZhb4CW1Xp
	Ba2YQiKvUeVefGEeJbtlX9+MASNnjI6ibIhUr90BkLa53wLJe7yLRVvcB2QzsaDpOsng2qEKtsU
	9442LVbukGbEvx1iG1NSHrCH0ncRevpfmCpQdqOZJmnm0FH+hpsCEIwPM23sFn4lc85NBkGFVGY
	rSYhg0d/BnkPaHHqrLWt+aAwNutO8+4RtzIucAcHirUaNVtMkq5V8MqK5Z1/HvC52qAA7bC3gpr
	0PeX1UkCG2B39+nBVy8F3lc+QjC6Zdrh3LYayajY7lyh0hNlPIr+8t1DH3dmh1dKw1oe47NDrJh
	uAZhK88VVqNcaihEKUKRfVXLx33M/QhjobI5vhjKrRMiHovI2oE25PaExmv
X-Received: by 2002:a17:90b:3c8b:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3adcdfaab13mr2265897a91.10.1792764928355;
        Fri, 23 Oct 2026 07:15:28 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4145:da00:43b2:a151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addeb56578sm360792a91.11.2026.10.23.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:15:27 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:44:47 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
	johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
Message-ID: <attr11CuxTty7rPn@user>
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
 <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
 <2026102338-rack-garland-2a29@gregkh>
 <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>
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
In-Reply-To: <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>

On Fri, Oct 23, 2026 at 08:18:04AM -0500, Alex Elder wrote:
> On 10/23/26 8:04 AM, Greg KH wrote:
> > On Fri, Oct 23, 2026 at 07:48:54AM -0500, Alex Elder wrote:
> > > On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
> > > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > > 
> > > > In the loopback function, usleep_range() is used for short delays
> > > > and msleep() for longer delays. This requires choosing the delay
> > > > function based on the requested time and converting microseconds
> > > > to milliseconds when using msleep().
> > > > 
> > > > Replace both functions with fsleep(), which chooses a delay
> > > > delay method based on the requested time. For short delays,
> > > 
> > > s/delay delay/delay/
> > > 
> > > I think "checkpatch.pl" would have caught this.
> > > 
> > > Maybe Greg can fix this up.
> > 
> > Nope, not for staging patches, this is for "learning" :)
> 
> Sounds good.
> 
> Please provide version 3.  And given that, I'll add one more
> suggestion.

Yes, sure. I will send version 3.

> 
> You don't provide the *reason* for making this change in your
> description.  You say that fsleep() does roughly the same thing
> as the existing code.  But... why make the change?

Understood, I will make the reason for this change clearer in the
commit message.

> 
> The answer is roughly that fsleep() is a common or "standard"
> function, and it's better to use those where available.  I can
> think of at least three reasons:
> - It's better to use a well-known common function where available,
>   because reviewers will already be familiar with what it does
> - A common function might get optimizations and improvements that
>   your code would otherwise not benefit from
> - It might (slightly) reduce code size
> 
> I am not suggesting you include all that, but you should
> understand it.  My point is that you should be clear on
> the reason for the suggested change in your patch header.
> 
> Even something like:
>   Replace this block of code with a simple call to fsleep(),
>   which does the same thing.
> is enough to explain *why*.

Yes, I understand.

Thank you for explaining the reasons behind this change.
I will update the commit message accordingly.

> 
> Also, before sending *any* patch for review, please *always*
> re-run checkpatch.pl so it can find trivial problems for you.

I did run checkpatch.pl before sending v2, but it didn't catch
the duplicate word. I should have checked the commit message
more carefully myself. I will be more careful with future
patches.

Thanks for your guidance.

Pavan

> 
> 					-Alex
> 
> > 
> > thanks.
> > 
> > greg k-h
> 
