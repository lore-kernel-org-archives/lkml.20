Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696472;
	b=RwCk4mUjlelsNguM2K+9O8RIeDeEea1y+aOzbyddbHIhUcZ+k2zzHKlXbBBh74BjF2g5
	 2SpE517L3c5aJSetuotSpzQf7eqK3W389tiY55XzoVejv5T5A3YM9SGyKjoSHKD44Hdvl
	 tT+Jh0rCPc8SvILu1S0uhirDkyji5ht/qrT0uXTRrlWevTiO+bB6AWd1P6Gjub3/ehXWC
	 vrgno0CxcOQs4PI73q1oKe/Q1JF9iRSS52qbbcJR/zwpIOrdVKqVBfRDzVgDuaCg/Gm7M
	 N18iUpIVSs/+ElTYXABeWUJ8GKNsPmksad8gMYwjPFkQz71eH2hrGVbTUhJ7fuGe6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
	b=UBuECLWG4Ow9lz7Ul7nKqIaWVk0ajUFeXGMcOc6wgZILpjUIEQSgAxgSlJnchCeZAGsj
	 xz07QUWsH0ISqCG5ZeYixXcgS7HuvacvObLFwP+xg2cD+Ldq6G+wcX+56uaeJCFlJaS+c
	 5vNZp2xnBucXHeGhKn+kRPJlP1abKG9KQ/MWoPz8m+f7sQYXMEGgC65LhkLF5oNrCgu+d
	 csX4LF/Eoq8auyo20pvdHyBU4T7Viin1qMQBAdAWsq/MCUaStuwpDDZPWsr7Lop7EX+7C
	 KSs1Z+0i1+J8MYQmMGL/3Y7eGBo2Yrb6CLD3rShfautMkY8DmlMYzxA/h0GQjdr1tgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XMv2nX5S;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XMv2nX5S
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso307845eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696471; x=1793301271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
        b=XMv2nX5SXHe0PmfVz0mxqtgWi7eN9XceYtglbrhF4agIwyjjdbvAmG1OPJkYyNLooo
         p25InBUGvCwNeVLJ2cxVHw3xqBtEN0I76CK3PqPe/EHvZkDdhyB66qs0jqXIkjVDBkFF
         lnGZoa3s1rncCo6q4UBEGqlxTW6JDuPE64DSgIbIgennnz7JAYsACJPjeU4iQvA28v3C
         b2/tHfdUDjHar8EJMxBNG22gdKVJ1fqBQ1q9P3KKxYwVA0T5giwXY/fuNLiVecAG67rh
         SrdjJOUlspeF1qoBoJ1KbOL6BjKWxNaXwXJzls8Z9pOp4woVt9/oyI8Pwp1H50T0MS7c
         vCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696471; x=1793301271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6kKdaF5AxgzpiROVhZ0qUCFn2LlsDmJ9V904EQhkRI=;
        b=tNwrrrQHGDAM64YDX0U4IzDuY+9Zjv7yFyw2cRr+2+Qg1/1szdIbU6YeAhEOekQI+I
         UsQVNxPZWZONbSBVKnCGND8t30nJPxqGEvOP57EdwC1xLJgKvJP4uTnwZC5uI+Uj2uKB
         DSue9Gc2sAvw+h7Q67XO8z8ViImamkoab3hrgaq5qOY5hD308mIi4oOMGxQUoMCoJ3Lf
         TjYVQcsrs0ZI+pMgUXMsH3zthGWnudmoZ7X8WEswiqANAD5FdllqxcobbxnYGy0nn5dd
         VFof5nAbGw3EeY71LOOM7134UYliy6tl3Iwp3bNTT46DHgN46sloOBUrI7yHDJKiqtRU
         w7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBym5HIql4bLh2Pqu7sf/8f6m3hPKoKBMMnVvZJF4DuQlw00EDJopnatPHRule6v/M/2E0q71nPOAKVWHl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf/ZsGka2BZSB6iuylfTms0pENyBsaMA1CnLHwDLmMVIAqSVQF
	qUW8pwm/0jVMgdvTMYbdNohoTTEqvsoa69u981RSEPOuC/NNipgtjzICUV70iUh2
X-Gm-Gg: AYBFou1vBCYRS4nYURS9/EkRI1KIdhP4/mHl6uW2rxaUxktziBEKDFq5CIJT1HiMvwV
	GweJ6gcer6G+AdfTzksZirEWNrZ/VsY9J/7rIuNZN1SrBUp8k7RsriPrOA/Tx9zrQLRsmIf/TL7
	JUGl79bSQA7MQ6EkxKaxKc9/iYEtTqbSK+WSWsofgR8OgVerHFHe4yA82hJR9VNcIzlbDL0UkvN
	EDXQaTu5LI/GtuHrOgN2fQilUGFGF1Mu846oaQJBhUVHqf+4UleRYpDJNp+cWzMxSQ0BTr8vi2l
	iRGe6udd/Ysr5t52P36HmdH80Hrt49ObWwzP37ikt1xyCVpvciCWzJfEtKM7Ha6ncdA2aBZKZlq
	GQzkT3nHZLSTtIiEJ2K9sBhyEUR6zLfGcOStae0/E2u3+MxA0/poKaY0uCBlRfoR0rAo7cVOrNg
	6RUPeuWQGqI7Ytlss5B6L2nBraHwL1Pln3pW+LrWQwdta5u78arkbzmcnIHBZKkM338SIJakBw5
	NjPGV86dU9dz84L8Oa2w/dxEwxL9Tti+8JzE3NNhACckHeb+LbRLzSHU0Mf
X-Received: by 2002:a05:701b:42cc:10b0:14a:5284:1bf5 with SMTP id a92af1059eb24-195c4f4ef96mr212310c88.13.1792696470556;
        Thu, 22 Oct 2026 12:14:30 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:5e95:3be4:ff57:f0a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d8f8eaf9sm220483eec.16.2026.10.22.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:14:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 00:44:08 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
Message-ID: <atpggBthwjZIFwXR@user>
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
 <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>
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
In-Reply-To: <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>

On Thu, Oct 22, 2026 at 08:28:23AM -0500, Alex Elder wrote:
> On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > In the loopback function, usleep_range() is used for short delays
> > and msleep() for longer delays. This requires choosing the delay
> > function based on the requested time and converting microseconds
> > to milliseconds when using msleep().
> > 
> > Replace both functions with fsleep(), which selects a suitable
> > delay method based on the requested time. This avoids the need
> > to choose the delay function and convert the time manually.
> > 
> > Suggested-by: Alex Elder <elder@riscstar.com>
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Your description above is pretty good, but I agree with
> Johan's comment.  In fact, you should think about and
> understand exactly how that behavior changes with the
> switch to using fsleep().
> - When would the delay be different from before?
> - When it differs--by how much does it differ?

The current code uses usleep_range() for delays below 20
milliseconds and msleep() for longer delays. When using
msleep(), it converts microseconds to milliseconds by
rounding down, which can make the delay shorter than
requested.

For example, a requested delay of 20,500 microseconds
becomes msleep(20), which requests a 20 millisecond
sleep.

With fsleep(), the kernel selects the delay method
based on the requested time. For a 1000 microsecond
delay, the current code allows 100 microseconds of
extra time, while fsleep() allows up to 250 microseconds.

> - Is this amount significant?
> And the third question gets at exactly what Johan was
> saying should be included in the patch description.
> 
> We want to know not just the mechanics of the change,
> but at a higher level, what is its effect?

The change may affect the time between loopback operations
and the reported performance. The code does not seem to
need an exact delay, so i think using fsleep() is reasonable.
However, testing is needed to confirm its actual effect.

I do not have Greybus hardware to test the driver at runtime,
so my assessment is based on reviewing the code and fsleep()
implementation.

If possible, could you please check the runtime behavior or
and let me know if you find any issues with this change?

Thanks,
Pavan

> 
> You don't need to provide a super high level of detail
> in this particular change, but you should demonstrate
> somehow that you've thought about these things.
> 
> Please submit a new version of the patch and reword
> the description a bit to concisely capture why it
> makes sense to make the change, and why you believe
> that the change in behavior is likely harmless.
> 
> Thanks.
> 
> 					-Alex
> 
> > ---
> >   drivers/staging/greybus/loopback.c | 8 ++------
> >   1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index efc69c10cffe..2fe845eaef29 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
> >   		gb->send_count++;
> >   		mutex_unlock(&gb->mutex);
> > -		if (us_wait) {
> > -			if (us_wait < 20000)
> > -				usleep_range(us_wait, us_wait + 100);
> > -			else
> > -				msleep(us_wait / 1000);
> > -		}
> > +		if (us_wait)
> > +			fsleep(us_wait);
> >   	}
> >   	gb_pm_runtime_put_autosuspend(bundle);
> 
