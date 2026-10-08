Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F703B14DE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431554; cv=none; b=a7TwpRQr5gyK0LzUcFu0nGqnabzw6uaCMHGwnpaLJQuWUXRP6Ldidd2Hl2lvLP5HZUD3LVUo1jGqUnW1+x6R/RvOmnGynPLnMVHkE4CW7VO8OU6aYVVWA1vwpz6z/+as2IUcFEFv8e1J7POax/5NkqlqgGezWBLtI+qFzO6VtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431554; c=relaxed/simple;
	bh=+S7+6b0tE0OmnLFC+QstPEqY3o50EFg74OIiryzh5ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNM2JkFGuBKkK5dzy5kMgRrKljlM66YwFfN3Gsu9oWeTmhc2uKzEc8WTvOjBf+wyfVJEu0qDyzArENxm5zFjmipq5Zpz8NlQEsqyvL95llmDh0m41lxqoXSUqXFFgEedFxTN9sQdiVo+JqupNUUqMeJ3jVaapaXsB4gq2J4Qqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c+JIULFa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c+JIULFa"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-885cd98d226so90045b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791431550; x=1792036350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=c+JIULFawh9O9VQ87fwLeM+LvkiSl70/x6DXs5EcnJs4AIMY1GEWJp8ObgBPZGJB4x
         Mv05UncODjqv2XyRjoBKQVbMrhjwEpgHXgw9TY63vhs/aUwuE3SSQTJZSrZUcCc/8UiJ
         ddvf+4LXB6MROmkpIb8AqBcLQdRz76QjzjoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431550; x=1792036350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=buZb79/Z+Sp/WDAWWbugeNMhZWDPOtXySIahnsw0FJSC+trHQqA2B8n55tL7Mh2TWZ
         dhbLQWixi3pirFNwEWrZoeJ9iX1iksnP/yQLfxwzt8aTrEDaPyTqskxDKYfC/4TkOTYe
         R7QksWwUxU69uo5R02l7QuEf7sfTcMc4Nb8rG9qP74e6UMqt/i/KnTOr7CAkhZ1nNTpV
         sbdjY+z2QiZqeief4XS/7OidkZeZDpUm1E8VORAz386rnhAEKwCrFiJoIBoaeiMrjnks
         zgsYxToJrpEK5MeXIB/7q1/JtlmwaKHN4Yvj4POfOB/9aPZ/gH0pTAGOm1uFrTRGlI7f
         eSGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHm/vAtOr1k3zz0J6bgQbHmmMjMIMNuk+S71W5ilZXtxeHMBCUYruyEE7VxQSsE01OCuZYYLKfzSIfQN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIll4wJR1ODPsBnF3zlIWqdFsAz6pFhkm0Rq0uWj0J3gD/lAugL
	lEWAwwMHIPWa1IwEzXisiIMD26p6JOEAVfeVGeXQr/7exFw6rHRrtEqLTz7rnncEEw==
X-Gm-Gg: AYBFou3BGzQv2l5CEAmhVLpXQdYA5WHZSz3UmYVociqFU8w6yNMdYzD5Si4zrSIcA3I
	HQ1jST/dNoeyvR7sdx2mZf+VBGQ45lyw1N0RQ/9h8cyUWqauvqXxJGZ9CXNy7xYt4rhCLUSI6ma
	ud0WvQo53OM2yL3YEP2nvESmU/sRBKK8DvPAYKM+n5wPIhLS0VE+PEiz/CR03A7EpjoFAMT/UQA
	7zebfDA4iB12NFBqPfAvA4un3c60iZ2qY3agH5dGSxKg8Onn/PxgsaqozMTZAcGtjTMdm8LCLvY
	loiCP+6Wjsc2UcwqtsjfaXWM7UeofLiZ3oGF8viafPpb/UnkSKWOixVxZfBv/09JZAbz8x23ko7
	t4JMHOV9390qTbplKfQg1UDqPddb5GhE5354iw6GOcJyEdgQKTNNhHSzqVz6aI8pUgoDJ4i9ElV
	seA7nt0QsCXiO6Tjx63OiFvmD3s9sxHEJc9Q1pslfiMjtPVVfzNLq2F7RP3EfGt4D+2eJwCTjKe
	MMbKvHio4tHFs3zeyL9y7oJ7XUGUPdUudeR5Q==
X-Received: by 2002:a05:6a00:4b4f:b0:880:f22a:b123 with SMTP id d2e1a72fcca58-8930d0045e0mr655238b3a.36.1791431549972;
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:97d3:292:91b3:138d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb49a188sm977281b3a.33.2026.10.07.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:52:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ascS2nPCSQJxOGDS@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
 <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>

On (26/10/06 16:53), Oreoluwa Babatunde wrote:
> On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> > On (26/09/30 07:52), Georgi Djakov wrote:
> > [..]
> > > @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
> > >   	while (backends[i]) {
> > >   		if (sysfs_streq(comp, backends[i]->name))
> > > -			break;
> > > +			return backends[i];
> > >   		i++;
> > >   	}
> > > -	return backends[i];
> > > +	return NULL;
> > >   }
> > 
> > This hunk looks unrelated to the patch in question.
> ACK. Will remove this.

Thanks, if you are going to add qpace zcomp backend, please note
that zcomp API is undergoing some architectural changes [1] (shouldn't
be too much extra work to adapt.)

[1] https://lore.kernel.org/linux-kernel/20261005122036.718976-1-senozhatsky@chromium.org
