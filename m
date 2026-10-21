Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556418;
	b=hetP1Pvfm26dobwzXG2nkYyCks2KmbI5mH/lkTSZnvrHUFlJGlDsao3duSW7w7joFVle
	 HiHs1VZyTC3Iozf1wze6YkV9ilvZwPnWE2yjAuYJ1Ckw9FpUKFnGg6MqwK6L4JiWVmKN2
	 OUjGC12VBi5HtIiY4z3izJH7awZ+ph3hIHqX+y5MXwTgAnGDRf0wzTFngkUOTaex4/71v
	 w2t3w2VFMojqz0vDjt/LS4pD0tDextlrayG4fgl/SVfqlW4zsJDT+6SUt3MpCbtvdQ9tn
	 y/ZwLa6UBimY+OEzQ5mnX80wV4uKg+MJVX9P6Dlj4VclaQUQ2R5Pk7iLl7Yw0KOyOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
	b=LWUw03tqBkg3jXLlKXgj1qcVUtcZGxGGwXWW13oWepf24B9eXriEdXDFN+dhijIxDuts
	 YRdTWw+1wesxjhx5/QiinfGjkzyKgZFoWRtKTeQ22N+aOW8Jcr6E2Epf4HpuvGAaZ/AZR
	 KmFfbzm3gFwG5YVsfekvnZRnvTmGX+7soaUrP92xpCVUpez2wD4JOih16sVDoIVfWNflI
	 h+XUy948R9yU7hEjnAlKnBFggO1qTwdUfibzmW6bWOJcZyE2SFvtCR3rxuWEBv95cgfFL
	 jwt/10w16YlG9BaFPuJGlsc4jFMnb2WUIGmlPOZ54Z205k1SAgMywgU9bWmqoWVCaZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0vtz86b;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D2606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478D2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0vtz86b
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3550c917fd3so334609eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792556417; x=1793161217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
        b=E0vtz86bT9ZOmK72ci7NpUjiT/4Cz0eu3NewGqtSC+asMbbObRHth0PaZfKucY3Ng0
         WsvfkmOIFz6ivmf0d1j6AfMqCzQsttn8eKATdaA+5ojCWD3BkokZ9L24mUAGcQpPJzEh
         typX5CCxSigal7DNhwcmW2NRtN+pKqJ3plWcZhq1JKVknkvZQXra8pu0NOuRjx2oAnt3
         JgNvSP/roCv17hex7+rThL6sfQxIPw7/emdqQTxje8B3vCUb2iaJ5F1xdK6V1V77arpS
         GukqE53SjlvemDJ6Vn7Ic8hA4NdrOxjKypbLmS5kS5t/XjhOYqWbYiZBZenQ83ZRNRci
         80JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792556417; x=1793161217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6nqS7mcyLguqD1PJrlyheTLjJilKtOGHy8lXcshPXw=;
        b=pe5fkKI8mD+uRugzEzJr19p5oboqeDucDjX0Qr/XReOVnN+UHHWdBW17i32u1dwdiM
         T2zVSDYC4h4+lF2+ENWyT9JfIy3CJzo/hq2NNa0Sn+g6YVKterK51hPIdImRJXQn0zER
         fMC8KY5B9qPA/kc/p4zlbjd9CKj26lkQeGARgRn0ZJK/eLjUk3ZfTEhOafmytsZrqLKq
         YMp+alqGg5784PWEks5IionfeEONNDHLNM6HNrLH0P0+IkoFUyt7YSlE7s79iN9Bpd4M
         eo6OslKfZ58s0si/+M9IBIZQ/cIEZ+5cPGflErtdIh58yys7RLdlCIFTh7FpCSNJOfks
         e4GA==
X-Forwarded-Encrypted: i=1; AKwUvByiVJkmV8xxqC46jMbImd56xJIYA+uk4Fy5VXZniR0KcUfuk5jYhC0bdAFVqZxs5x5ClZNrLRz2PJDA3H4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW+zmv2Qsdqat4F6jaCZ1HBEAVE/9E8A5JJxQAEzUp8dBwkV4L
	AuM1luPwJst10SsDGA0elPCAJxzYb1qgO9DcFXejCP/uogpMUYgE68TE
X-Gm-Gg: AYBFou1KQHd8CdLfQYHoepiuFAMjGn3mLtYADGsscnyXD9ClTpNdYEb3qWQPH0ysUeM
	ie3hzGuTpOdwIcVHACSRqSSczKC0JW6EoCepK7oYDtYMr+ywE28/0XkQC2cLrnE5zHadF0a4N5g
	stpWCML6yw4j1L4EsW75Bo7izls07UopKwMcS1bpPo6RKTQ7ntXw/tgS8UVSSTc7AbYG5EZwYwV
	x42GxfFTLnzYbnK0/JrMJNBa4V+p5czGXB1mTqwL0v5BDkzZ6qzElYNkFeBgAV+4CoWrQ+QNDQV
	Ehm75+Xlopo/jMLzR6ufk5bP0Fnmst9v7vSMe0+xa+hYFipgk7m7bOYqmdQrunc0e9b5PtoqJoQ
	BbzgXL0rM8LRaul7CekLLjkWYOeqLn6+fT9x+juyMHZc43drMHhdXkCnQPevzSOZmhxVXJXS2Dg
	KTdRcIrehD6H1awQHHw8teyAUlp4wLbAN8LfFARpRxBA/yGLLkqWXB1t6EVrqBCIt+YHXcYELR4
	eAzNCidu1Q73km+F6AXBbuCzufR0i6ECrFnmyGSExDWbKntJgDknKB8I/9d
X-Received: by 2002:a05:7301:db83:b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-3674cb387admr1757579eec.16.1792556417222;
        Tue, 20 Oct 2026 21:20:17 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:2b85:4f59:7505:fbbf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm3682269eec.5.2026.10.20.21.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:20:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:49:51 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	rmfrfs@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com
Subject: Re: [PATCH v2] staging: greybus: Align function arguments
Message-ID: <atg9Zwie6-Dva-Xb@user>
References: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
 <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>
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
In-Reply-To: <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>

On Tue, Oct 20, 2026 at 09:00:03AM -0500, Alex Elder wrote:
> On 10/17/26 3:44 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Align the function arguments to follow the coding style and
> > improve readability, addressing the alignment warning reported by
> > checkpatch.pl
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> This patch is OK, and it's a good kind of thing to do for
> getting your feet wet with sending out patches for review.

Thank you for reviewing my patch.

> 
> But I encourage you to try to really *read* and understand
> the code, and see if you can find anything you think is wrong,
> or some bit of code or comments that you think could be more
> clear.
> 

I will try to understand the code better and look for ways to
improve it.

> I just scanned through "loopback.c" and one minor change (to
> *code*) you could try is using fsleep() in one place that
> uses other functions to delay.

I will look into this and work on it.

> 
> Another thing you could look for is printf-style format
> specifiers.  I see more than one place where an unsigned
> value uses %d (which, for large values, produce misleading
> results).

I will also check the format specifiers and make sure they
match the variable types.

> 
> These suggestions aren't especially complex, but my hope
> is they lead you further into understanding the code and
> not relying heavily on checkpatch.pl to find things.

I will keep these suggestions in mind when working on future
patches.

Thanks,
Pavan

> 
> Anyway, this change looks fine to me.
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> > ---
> > v2:
> >   - Rebased onto staging-next.
> > v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t
> > 
> >   drivers/staging/greybus/loopback.c | 3 ++-
> >   drivers/staging/greybus/spilib.c   | 3 ++-
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index fe48a687377a..efc69c10cffe 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
> >   		}
> >   		if (!gb_operation_response_alloc(operation,
> > -						 len + sizeof(*response), GFP_KERNEL)) {
> > +						 len + sizeof(*response),
> > +						 GFP_KERNEL)) {
> >   			dev_err(dev, "error allocating response\n");
> >   			return -ENOMEM;
> >   		}
> > diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> > index e4d1ae8308aa..c1982f3fb931 100644
> > --- a/drivers/staging/greybus/spilib.c
> > +++ b/drivers/staging/greybus/spilib.c
> > @@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
> >   /* Routines to transfer data */
> >   static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
> > -		struct gb_connection *connection, struct spi_message *msg)
> > +						    struct gb_connection *connection,
> > +						    struct spi_message *msg)
> >   {
> >   	struct gb_spi_transfer_request *request;
> >   	struct spi_device *dev = msg->spi;
> 
