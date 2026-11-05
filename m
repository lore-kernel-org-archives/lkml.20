Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909914;
	b=CIulo6P6TX3h4wYrryLQAdn2upoZM8a4uZkcfUdhU+1iCP/9wxO3lgqS8c4tWnExaT+Y
	 VC+gzLwbg5BxVQ1ynUUF4Hi6sWGnDw/D4RF5gFOsrOGorv1kR+w7T0ziJSWu8bMlC0dSB
	 rTGpo2UmGhHQ5yYDPgt8RfkQpwUfVyj9GeRQH0bIjOhc5PJ4q9vLszKpqteWa9xa5jBcX
	 4SLtCDrH7cL+QjsVUB/1z9icN+jqz08lh3M06sAZZqtes/+oKtNuo3G2CVR/b/ZZLEYgq
	 WgOVlO/P7K7KMuXWpAl7BWhkUpYRKLDK49NxngYihU2QfY0yXdZ9akLTEK/pz1FVTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
	b=GQ5MMNYDB8X3Uc1bl65/pU4RUeCS0Do2t6ho+10VptKQEkIwEoj7aVg7fjdljAMAbqRO
	 hQL9qR6r2q8KaR1GkyA7cHQX6n1pFsQ+Oh+s6GkFMnM37vLm5hZq6OmzJtEThnuhVxV5Q
	 VCUYgwlOc1qoY6xk3/71CB541BYd1eaytxhDoLKgBekK0f8Dlq78WLSNCr9tTZQQWurPa
	 2pQG23vog6CEbLyGrvMgRHNmr4rQI5kpLxC6blctFfw4yIB5H2JhTC8u+N7UpwJNxT57d
	 48HSLd7gTqcUBQeANOjb/vlnn7LCaksqA97ZgtfP3N4H9Obemg1xQ7FofecUNjB+4Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fY92HljY;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C0606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08C0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fY92HljY
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e10a70540so1500315f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793909911; x=1794514711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
        b=fY92HljYm7SUL/irbYBIukak8YUb3C47lQ24TCLgGG5fynimxwPMQM+lYLIvhRAsPn
         qeUUtYqIRjEY35BnZd3pdA7+2EWRL0YEmPLA5UQch4Pmsy+TjNMBcr3MTzWON96WdVQW
         oL4VhqsBcv52vQnJuepnrDyVRTGTF3q+i9khUTk18gQQlez/vXzTpXcx+azvPnzpGGEt
         Pu6zHj0bebmvcJ6HDvrCNcnCbekezGsG0wMHx9JJ2rRXOwP5gRcGtCiKlDVRkmpycaAD
         uSyxZVf1n0IK3GC0YVK8+h9Ma5JBOF0GGkZPL5elj6Rn5CwQSU1cy/+Q5oCHg3VB1E0a
         fh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909911; x=1794514711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou4/lAhEpFwwKVnn/O173URP+OPA9Dr5LXSyF2aM0Kk=;
        b=LB2nbIcswFO8zTKPD4KX2+YFIKR+qKp+4aGzww5fEI7Bv8/4qnDXSEWO+6BS4HB5Ad
         DPVAyy6s+T6/vYJfGZzd+dssqoPqkeefoD3FMcm1I0kAeeSUM3qfxIza+ahliTs6MaIS
         Jr1pnC5E68MYaKKbqyoIPPoxFPxSXjhlYQ3jUxvfFlRXb90hfZollBVd7U7aB6EGlr9w
         vPJHG94eNw+A+ix8Cn76lNoB+JTTtag3jjibNGU7lXSutsz8OasXe4hNFGt1s1waE1MV
         aMeoL9gz69N3fZBQsy3/nMnEr86qj2mTsZBz3hzLZH9EnWoCWcXt6mxTOfF1TQH3OOjJ
         MG8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYleAqdaDOWI8Ey6eNQL0piNUyP/4k1pHG4T1HorECDNySEoDG5BQXom5Egl2orrUefiZsf7OoF75QGoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lIETJUO1TM1UuYm132XZYdqTWoAq7h/kQv7nZX2nJRoPOWJ/m
	nl1VwTm1bGQdatohjqED+MhT7GWBoP/TJsTgjLtM2m+UErMbgc+vKIU1buwAuE0TI9k=
X-Gm-Gg: AYBFou04SywtFzscsFZ3HK5bDvupXlHWqXLsNmAV++TtmvB2DJ6B9RhiCGRUPclAY9Z
	Xqz4S8lsozpEvFFDPVx/9hmgmkuZ2G1bbGbWFd8WE6buI+rKJabatRIUjI7v5oW95sO+wdOwLMV
	PyqVQ0QBnYJYV4tQJ206dfX1nqjE3MK/0KlbaHXx6+jxGo3TVEh01A+rtoft7Ld5JJyY6feaitt
	mZtJ2NlbhTGG2a+SC5vr5Vic20vhUUAnwPqF8c7b8ldQuKg5dMiAnx2h35pSWAkhjFcvzVpKFJj
	NWaN5xM8wlGXhOjZEC9H3+qQI4myUqkc1jaB/rPihdu6U1ccEx7CIgFE0C1lVhPNJL5Bv1DpCkZ
	V534vapHeKgjXdroMv1TAX1exRGiiXg9b/5FvjYn5K0sWC6oQB0tyl6PFLr38B1bF4OLNqYdBKP
	vm9mOZ9Ncam9RDQhh8078t1gJCNLZ1J56FDPwUSWA34dcjIsRb4g+iWQq8gqojtgPg9JEx8MoYs
	QnkgMg1i3vavflWvXWrXu2t5N4z8M9+KZUPcjJzR9KArVwkGLwZQs6id+2TlEsYOoNBwZ5prgy+
	A05EuW4v/PSrnXHQKBWGdBEgBpApWuwcNuISUOl+Cp5/LU5v
X-Received: by 2002:a05:6000:1788:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49276977d36mr1397300f8f.23.1793909911128;
        Thu, 05 Nov 2026 12:18:31 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm11653632f8f.21.2026.11.05.12.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:18:30 -0800 (PST)
Date: Thu, 5 Nov 2026 12:18:27 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Haris Iqbal <haris.iqbal@linux.dev>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [v3 for-next 1/3] block: Reject unknown status tags in error
 injection rules
Message-ID: <20261105201827.GB2439-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20260928221634.43239-2-haris.iqbal@linux.dev>
 <20261005084917.GA9160@lst.de>
 <20261020223402.GA1582237-mkhalfella@purestorage.com>
 <58a98f7d-b2c5-47b5-a372-0ab5afa6a8ed@linux.dev>
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
In-Reply-To: <58a98f7d-b2c5-47b5-a372-0ab5afa6a8ed@linux.dev>

On Thu 2026-11-05 21:00:27 +0100, Haris Iqbal wrote:
> 
> 
> On 10/21/26 00:34, Mohamed Khalfella wrote:
> > On Mon 2026-10-05 10:49:17 +0200, Christoph Hellwig wrote:
> >> On Tue, Sep 29, 2026 at 12:16:32AM +0200, Md Haris Iqbal wrote:
> >>> tag_to_blk_status() returns BLK_STS_OK both for the "OK" tag and for a
> >>> tag it does not recognize, so a caller cannot tell the two apart. The
> >>> block error injection code (which is the sole user of this function
> >>> currently) relies on error_inject_add() later to reject adding a rule with
> >>> status=BLK_STS_OK. This is okay for the current state of error injection.
> >>>
> >>> The delay option added in the next commit makes the rule with status=OK
> >>> valid, meaning the function tag_to_blk_status() now needs to explicitly
> >>> match BLK_STS_OK for it, and fail for a tag it does not recognize. Hence
> >>> make tag_to_blk_status() take a second param to update the matched status,
> >>> and return true in case of a successful match. If a match is not found,
> >>> the function tag_to_blk_status() returns false and *status remains
> >>> unchanged.
> >>>
> >>> A repeated status= where an invalid tag comes first is now rejected
> >>> instead of being overridden by the later one.
> >>>
> >>> Cc: Christoph Hellwig <hch@lst.de>
> >>> Assisted-by: Claude:claude-opus-5
> >>> Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
> >>> ---
> >>>   block/blk-core.c        | 14 ++++++--------
> >>>   block/blk.h             |  2 +-
> >>>   block/error-injection.c |  7 ++++---
> >>>   3 files changed, 11 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/block/blk-core.c b/block/blk-core.c
> >>> index 13dc70e8f55d..c45846b9c50d 100644
> >>> --- a/block/blk-core.c
> >>> +++ b/block/blk-core.c
> >>> @@ -225,21 +225,19 @@ const char *blk_status_to_tag(blk_status_t status)
> >>>   	return blk_errors[idx].tag;
> >>>   }
> >>>   
> >>> -blk_status_t tag_to_blk_status(const char *tag)
> >>> +bool tag_to_blk_status(const char *tag, blk_status_t *status)
> >>>   {
> >>>   	int i;
> >>>   
> >>>   	for (i = 0; i < ARRAY_SIZE(blk_errors); i++) {
> >>>   		if (blk_errors[i].tag &&
> >>> -		    !strcmp(blk_errors[i].tag, tag))
> >>> -			return (__force blk_status_t)i;
> >>> +		    !strcmp(blk_errors[i].tag, tag)) {
> >>> +			*status = (__force blk_status_t)i;
> >>> +			return true;
> >>> +		}
> >>>   	}
> >>>   
> >>> -	/*
> >>> -	 * Return BLK_STS_OK for mismatches as this function is intended to
> >>> -	 * parse error status values.
> >>> -	 */
> >>> -	return BLK_STS_OK;
> >>> +	return false;
> >>>   }
> >>>   
> >>>   /**
> >>> diff --git a/block/blk.h b/block/blk.h
> >>> index 2cc03aa54c53..5fa54162c686 100644
> >>> --- a/block/blk.h
> >>> +++ b/block/blk.h
> >>> @@ -52,7 +52,7 @@ void blk_free_flush_queue(struct blk_flush_queue *q);
> >>>   
> >>>   const char *blk_status_to_str(blk_status_t status);
> >>>   const char *blk_status_to_tag(blk_status_t status);
> >>> -blk_status_t tag_to_blk_status(const char *tag);
> >>> +bool tag_to_blk_status(const char *tag, blk_status_t *status);
> >>>   enum req_op str_to_blk_op(const char *op);
> >>>   
> >>>   bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
> >>> diff --git a/block/error-injection.c b/block/error-injection.c
> >>> index e14bc4b723ef..db543fe27630 100644
> >>> --- a/block/error-injection.c
> >>> +++ b/block/error-injection.c
> >>> @@ -171,15 +171,16 @@ static int match_op(substring_t *args, enum req_op *op)
> >>>   static int match_status(substring_t *args, blk_status_t *status)
> >>>   {
> >>>   	const char *tag;
> >>> +	bool found;
> >>>   
> >>>   	tag = match_strdup(args);
> >>>   	if (!tag)
> >>>   		return -ENOMEM;
> >>> -	*status = tag_to_blk_status(tag);
> >>> -	if (!*status)
> >>> +	found = tag_to_blk_status(tag, status);
> >>> +	if (!found)
> >>>   		pr_warn("invalid status '%s'\n", tag);
> >>>   	kfree(tag);
> >>> -	return 0;
> >>> +	return found ? 0 : -EINVAL;
> >>
> >> 	if (!found) {
> >>    		pr_warn("invalid status '%s'\n", tag);
> >> 		return -EINVAL;
> >> 	}
> >> 	return 0;
> 
> As Mohamed mentioned below, "tag" would leak then.
> 
> > 
> > Doing it this way will result in use-after-free. "tag" has already been
> > freed above.
> > 
> > Maybe change tag_to_blk_status() to return an int (0 on success and
> > -EINVAL on failure) and use its return value without mapping it?
> 
> I am not sure I get your suggestion completely. Even if we change the 
> return type of tag_to_blk_status(), we would have to free the "tag" 
> before returning.

Changing tag_to_blk_status() to return an int will not have an effect or
"tag" like you mentioned. But you will not need to map the return from
that function.

return found ? 0 : -EINVAL;

The line above just returns what tag_to_blk_status() returned.

> 
> What can make it simpler is allocating "tag" on stack, and then use 
> match_strlcpy() instead of match_strdup().

That can work too. Just make sure we limit the string size somehow.
