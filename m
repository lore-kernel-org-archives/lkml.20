Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F145AA66C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161469; cv=none; b=RPQPTiUKqwyfuSy2ViFQTDQOVJh5vcaSdF1nnS5xHfEFRUUnzs6CtTlVMDJ54Bo30pBlCOd8ZujLfNsLPKCMXBKOPi1tb8A5CaLmGWMLcO2rjv2p87KuBpmZSRJjBkz6jbxDjB18X4luW0dMNnCOI3QLRujaQh3X+/bQY+Eps4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161469; c=relaxed/simple;
	bh=pRD2Q0MOiyrSPSkiYE4fxvcMyAVQbuFTvSwJ+4B57jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQGl5qt+VmgGaqCceH35R5xqpgy3tR2oCu6bM0b+bjX6gdx9LAHW7/VJyGwNC4YrRpuWbyOSjKNxlch2kBpeNf2FxM+uXixYGRzI+elzAiPDPf0UhdbM+RSP6bNUPo0qc7xhkjj+aqEn5sm66W0Nd0OrBG/o0lhRAhdJesloAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs74dA3K; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs74dA3K"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc1ddb3ba3eso609353a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789161466; x=1789766266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LWlsthWmOa/1IA1PfJb6FIh38eowBq8VdzTMOAowcpM=;
        b=bs74dA3K3naqIrJtlIPH5LwqdU7oVnuiXIBlv61335vTrF1dQWKu4kaGoiI+QenrvW
         UR/jqimohk8MbAe090XP4nFmdPNLzFgbiLOJmYjUnbWhIyFxuEtPiu+Fg2CXy8OWknCb
         n4v2odrgCkVHisgzihf9A7Guz0gXw/4VGu/wwBlQcTV54xLVtnAuy3V2vVI0obZl+OOw
         TKS2jFOrrY6bwFjJry1eBVrZN5sduYVPYZ9Sc4OsC4cDAw18CyAsNPEBc9sgIatj8JaO
         aD5Xn78vCw4a7J7v6WIP7IWCnbyENhLbh5L5WnvyQE2tDcDo5JTU8Ne5yYWmt78GovKR
         b0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161466; x=1789766266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWlsthWmOa/1IA1PfJb6FIh38eowBq8VdzTMOAowcpM=;
        b=iwPYE+tGExfjYuL54nTp+z6h8I7j+vlNHqyy1Q2XqLKHhmQOuwcAN2IehnPC8arC1v
         eVzp1dCLH9mJbKoIe/Bk475NfHmhG7TY2LbsDvtGP7i4PgZw1zDM7cvE1tgqz+xjoN/M
         LslPrIEny/uzvlLddfjhUMwvOsPFWT+YY/s4RZCc63NG/37+KlCOdL6SanVWCCArb4Ux
         MuhYe+wHMVGwjFhM0jGtk2iTEmisx59lZG0Cez2kmReRX46TZ2+zHxeJ+SaZEihvlKJN
         OTzhRPxPPXixRXiqzLZ7SWueK8SZQfY3rET6QUuXizgpYYr/DZeILJoLVn3UAo4WEhqR
         9Xpg==
X-Forwarded-Encrypted: i=1; AKwUvBybCaugt40pABRoK5wAXFtaakklUd4G2lG9bI2gyJUJKiB/Ir985bvTfT5SEAMoz8zrtmGhY3f9YswqpiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++km8Cc1ZdjCqVl6UPBLHTXkyQevbJb+vxHaNZSdb44oBTwZXgQg
	vp5kaOvLpyJLu/IHOcvfw76BbbkWfl2nIcmMND4e3m/ejlFmWrEW3yOG
X-Gm-Gg: AYBFou0uAYia6yj+sGoyKY3MKijBN/q+LeeZQ2/M1sha/x58kQmEu0vVdQmhaUhJMEp
	dkLxkUz4TtH4SFUuXdVlAIwGxtYWDWp3a+mToSWMwi46gTnkfWV7w82e060kBR3Xsp3xLlsELCQ
	JW1e95SljjuWi2ILSwKt0FK4RDWTRzomMfKslf/TLCpwpory5RZ1xHTaWLqW7xvnGz3lLGzO5Sl
	xJkWHZadLTg+V+ZfZOExsxlCsBDlLzhOsWFwKN5xTlHgV0oSYyEkhBj+dTXhGRCP1VY3oj5EjeI
	GTq1aJLmAn62kJSkY5NuXaNhZ+pdRfkgM/Xsnhr9j4I++GGCLrkeh35rwR9FOLmBzGtyU4GBU9Q
	RFRXKc/jdg5SQKcH3CRF9zL6xwI9JeaB9AJWnjpSBMZksCcTVB0THHJ8NfXi2HKNDlwKgEP3XDA
	CNZb+1zP2SjG2JWpOUhXFTD9ove31qg+OCJ4wPXe1QQVHW3HBbfz0tP9JEKpCIvcKD
X-Received: by 2002:a05:6a00:8d4:b0:869:4d90:a0cd with SMTP id d2e1a72fcca58-86b31200babmr9143371b3a.16.1789161465559;
        Fri, 11 Sep 2026 14:17:45 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a1b827esm1613687b3a.51.2026.09.11.14.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:17:45 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:17:41 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, kernel-team@meta.com
Subject: Re: [PATCH net-next 1/2] net: add sockopt_expand_out()
Message-ID: <aqRvwUJ-ksUxrG-c@devvm7509.cco0.facebook.com>
References: <20260910-getsockopt_phase6-v1-0-e681e102d5b8@debian.org>
 <20260910-getsockopt_phase6-v1-1-e681e102d5b8@debian.org>
 <aqQkImqiHPorszOY@devvm7509.cco0.facebook.com>
 <aqQnF9vWKVk3GkTp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqQnF9vWKVk3GkTp@gmail.com>

On 09/11, Breno Leitao wrote:
> On Fri, Sep 11, 2026 at 08:56:23AM -0700, Stanislav Fomichev wrote:
> > On 09/10, Breno Leitao wrote:
> > >
> > > +	if (size <= iov_iter_count(&opt->iter_out))
> > > +		return 0;
> > > +
> > > +	if (WARN_ON_ONCE(!iter_is_ubuf(&opt->iter_out)))
> > > +		return -EINVAL;
> > 
> > nit: if you end up re-spinning for some reason, maybe swap these two?
> 
> I am not sure we want to swap these two. This is the reason:
> 
> 1) The first check (size <= iov_iter_count(&opt->iter_out)), check if we
>    need the "hack" or not.
> 
>    a) If we don't need the tack, then we are fine and this could be called
>       from user or kernel.
>    
>    b) for the hack (which happens in the next line -- iov_iter_ubuf()), it
>       needs to be ubuf.
> 
> So, this force kernel callers to use the right optlen, avoiding hitting
> the same issue as userspace.

Hmm, that feels a bit too magical :-/ Who are the kernel callers? Do we
have any? Is it reachable via bpf or something else?
