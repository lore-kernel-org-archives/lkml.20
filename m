Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694877;
	b=2HTvzOTgn1FQQn13zTlhmZsp95ooetgwn2Ea66Eaa6s7ohDFzw5LlMuvDYwGupIkg0sF
	 XRye7jOr+efS6B1D8MtlJAe6AoKvHLvxokjiCqjVGREORgGgelhdkumj5hsLk4z4n5rDV
	 yjyOiqabIImCrPJCflyeJ0aq6kU6ntyqCOyDWBiGmMXgcuYqHOyh7/nbP7zkcUPLXJwVB
	 0hek8jJw6x1up4CZIcTPXMUIbx7w1jePDgHXOVfcSSiMY4fDvHwnZVcxoKscYkbFZmhlf
	 tLY9kgEbtF/QukcCC216125MA7bIz6xXTf0QntR/3YDMCvx3v/JO/nLxYEkj5qwZaGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=o94uNRQqzrylUu01kiRSHaUQ5l5ZXHsTJxuqTtmUWsA=;
	b=oNsh/X52zzJbJfQN5lpayceMPRq/dU8ucFvZ4x3/qp+cNgLpwZpOcAR3+pZ2mPIxI3jy
	 oCZsgsY5y4uKthspFMlmo21bJi9hWx2Uf9W8KVJ+0YRvsuKFM9l9DpxkNyjSOvtC3bTA5
	 4gem3tYvckeXla2qV2WNmen5xaZUhiASRp71cs3CyZTLjKc0qIU13h43CsUnPbH4oZFjk
	 +Tgx2XDI9aR4xVeN1wW+5Keh9Mj0WBP9dkKN55V0tkOpyk064nx5SK6IO5OmxzCPIUFQU
	 h321D7bvxJv6mGZcXxIzdRJLa8wJrcx/A4ludj9BQEPvsU2wVEleLrfyxRv9vXZM7qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TLVy7iFt;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723A606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3723A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TLVy7iFt
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1931288f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793694874; x=1794299674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o94uNRQqzrylUu01kiRSHaUQ5l5ZXHsTJxuqTtmUWsA=;
        b=TLVy7iFtFV1eosB1viqZ7kViXpvbRMjgrFtWB9Imq6n76wjr8s3iRUHWE8hgHwH7Gr
         0KInipeNWTR08EjSERF8pBe1LkUAMlskiz3X0+LPzZHWD1VodvaOFpXD/XS36dPppxjU
         EdiIuVK+VO4HJkL8KSHmDuftog2QHWddAXkE3Ed+Il3YJmrHhKr/mAO8DsoyZJlUakNL
         4rxY/hQtmPfk36jSWuthX2k94iG9CN/Mho5dKMpxFLKqaIuEZzHldAH5jH+2JYLyUFMt
         lmeeuZpbICNNFyG19S+eF5BPU+e+q0kgrq+2pfK3WorZgLrO1HemIDKFRt/Js6Ibxqlr
         T3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694874; x=1794299674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o94uNRQqzrylUu01kiRSHaUQ5l5ZXHsTJxuqTtmUWsA=;
        b=xHeZ3x2nkALm0SnRg46+4yDwYWHalFysE3/VMRMtIpOvO3ZZdy606LMvvPuFNsYvi5
         IiCBgHfUOAzV5PqY2PsE1wr6K8pE8uvNrbuU0qQyhMY3vJdfjEukYSRHD78u5eHR1EUR
         TxQVS+tWekOhP1qExlRMksqYx1LbbejqNyFu0Hsea6VZPYdMXR0/z2frBP7EpJMO1qYG
         oWJ1G/T8n2QqhatPYoCdmQq67wLnBwll2l/STQH7t3J67+u5Ew7vWNJhfCQeoL27d7MW
         Va/rpo3t3UbjTtmmxSHQyOHxGC7qMzy9Rv8kJjScVVjBDR6O+oKI23t8puUMs86svecN
         9xww==
X-Forwarded-Encrypted: i=1; AKwUvBxEwP9MoeyVoePvhPIMwOXt/eE/Fcqv27YQqSliGoCSG8AiXhf8nbSAI1SJ3ljc5FGk+8atBQFpW7U7i9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8PwKbJmMRWVFGyuTQl0Yo2sEwnH9VCjlfBSmwGgwgD5ALHP0Z
	oGp0ccxGbDFbfrFjaAxvtZBbzGljjw3ZXmChHz4lXWlwJY01tZTgvkDdKfRpw0uylno=
X-Gm-Gg: AYBFou3eelJEfRrcRSQQwNlGnokx08uRWBr/lXy7yGr2MdiXeb/OSett3H0e6WnLGlv
	NSoA6q/lntugqp+ziH38x/spaf3BrnSr6tEpLIrc+ZdJcgUD3t4vASosiqzE6V1co9aym152ke6
	AAWtjMLn0byxDA9gGTjyS817I7G07a+UCygRvqI6hAuFWYRZ5evgoj73P47RiWCXkKHS4FgDQ7V
	t1hmX0yVCIalOP9DrSP4iNccxOmsqgPDft9RXIo9rR7NvYqxts2vrC2czMsg54OM2xbpfQC5NYZ
	QCEEMXkKF2/aQdwzARM8EnxKPkH3NdNcFvYY/7XbMZeKkXX51bbc3u+YcvtlJEglyF/56dMK1Ui
	lxAicTi3SIM4ia3+rNOtfUMGelKUfO8hIt5lD14Xm0mb7kdACGvL0MOVNF1tkARHFc8jiN6IBXj
	Hwe7KfiRLdZXA1VQbrJ2+j/01e4ls0B9531IQcW/kB4v4XrjStiS1s9Os2/O3VnJ6qDfHajG4t4
	GQSeyI5kXUo4W0ACzSqr79/oFnekYzerKeMbhwM69QCg+UUIcAm4+bCt7qoaPHXhfsd3Ju8ufKr
	1St8C5SZbdgNBhwIdCiW+ZZt6jzyA9D91UiDRY0=
X-Received: by 2002:a05:6000:2892:b0:48d:eb44:650c with SMTP id ffacd0b85a97d-48e6e309f40mr28006453f8f.40.1793694874669;
        Tue, 03 Nov 2026 00:34:34 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm23718452f8f.38.2026.11.03.00.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:34:34 -0800 (PST)
Date: Tue, 3 Nov 2026 09:34:33 +0100
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] memcg: force charges from reclaim before trying
 the limits
Message-ID: <aumcmb9iBpovh97u@tiehlicka>
References: <20261030205418.341214-1-shakeel.butt@linux.dev>
 <20261030205418.341214-3-shakeel.butt@linux.dev>
 <auhN7v127jwy-q-W@tiehlicka>
 <auli2Zlf1F0tyi4X@linux.dev>
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
In-Reply-To: <auli2Zlf1F0tyi4X@linux.dev>

On Mon 02-11-26 20:34:40, Shakeel Butt wrote:
> On Mon, Nov 02, 2026 at 09:46:38AM +0100, Michal Hocko wrote:
[...]
> > @@ -2789,6 +2779,15 @@ static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
> >  	if (do_memsw_account())
> >  		page_counter_charge(&memcg->memsw, nr_pages);
> >  
> > +	/*
> > +	 * If the allocation has to be enforced, don't forget to raise
> > +	 * a MEMCG_MAX event.
> > +	 */
> > +	for (mem_over_limit = memcg; mem_over_limit;
> > +	     mem_over_limit = parent_mem_cgroup(mem_over_limit))
> > +		if (!mem_cgroup_margin(mem_over_limit))
> 
> Second, !mem_cgroup_margin() is true at usage == max, so a charge that fits
> exactly raises an event (unlike today).

True

> 
> > +			__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
> 
> Third, we definitely need a break here otherwise every ancestor at its limit gets
> an event which does not happen today.

This is a separate thing but shouldn't we actually raise the event on
all levels that are over?

> I want to keep my current version.

OK, fair enough. My intention was to have those two parts closer
together but this is not something I would insist.

Acked-by: Michal Hocko <mhocko@sus.com>
Thanks!

-- 
Michal Hocko
SUSE Labs
