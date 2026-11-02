Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646969;
	b=EUaBU9rji8PYAMMWd7gP0YGafk2mLuHcmMzx2a529j0jRV38goOeyFZNmH+0ZzPDYown
	 oVXuEtjuHdow+sQabGW9laemxYPL/pKxKVEtw2Nb+RZYp5exnoK+k5+Z3j8XXsaMk3vGc
	 AmBfEfyLo2fQeySCP3p+W2R2HeDnaLhq4uBCtBf45SqSCLm4em7cYG7wUK7bAINjeiZo9
	 uUDFjYQ8zFKR+wsV7nnYqE9RuSV6e98G1aa47M8Ds7hKh06N2G6cEUpfpeTLtG6DHFRct
	 XXgyhgwuH/HswToSDDEGtvag0YczZXc6E+uobqQ6IoFlajZ6GbNGlJtCZcx+tK39g8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xSwUt1ejfmZqGDfLTWVnhEyPBYCa77Ql8jnQXRCQM2M=;
	b=zoGiqcVWEjvYRDHY2Yd1WaU8HD50n9wRBzp8JjVDqkkAsvXIlXsga+d4fEuJ3Tl1QxFZ
	 Zw8GLsXW4pvUycAHn4nK0xPbDyoa5Khxae8XOslK1MHwa0uAcPZyW3yFavD7DdRl/I4Eu
	 FyG267kX2zQi2GpPVd3vrlUAIlVukRzGn6FfHfKa36hbQtPDHCSajxqPKOdHRqbJkhLdL
	 xylkpeMWoRwob1pWTS5nA6gkgG9UPS3qeeVzAAtT3Jiw1bBKLwxd9QA137DIJJJZJoQ1I
	 geyvIw4XWj5Hf4+EPZq5UDFbp58ZqsXcda/grse4d7YWXy7w67u+JzjGZxbpzKBc0Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=UOioP1aR;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A19606EE84
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A19606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=UOioP1aR
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6790844c9b0so2390067d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793646967; x=1794251767; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSwUt1ejfmZqGDfLTWVnhEyPBYCa77Ql8jnQXRCQM2M=;
        b=UOioP1aRX+ng7fQt90I3I7lPAuhsKrdkNHsgPY3jQrIPnM1M1whRaCshqEpYerLoVS
         Vb3sBlSgNgQNmfR2dafkirCXTn2zckbDU4vg4VWf4Bks3VJeQ3KvIq4Ac4ieWAjoC3M9
         TVHxSZF9g6Z3OAoKOyEoT6wjVd8oUJSylcA7krfbtrnBPMmmMLXFse1Z0MSvXUvGMdBy
         l09Uco5QfpGgegpgEI++HFOG/x+8gxhhQuEYB6MiwGfWow/nG6hDqWz2Jb0VRNfpOiMu
         Myq+QrSQeu4fKyiBvaJQdU+754o+ApUDj692D1MAKDanYf2on4+BhkfmAnOKcovO6BX7
         B1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646967; x=1794251767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSwUt1ejfmZqGDfLTWVnhEyPBYCa77Ql8jnQXRCQM2M=;
        b=ANxxV1H8x0tWBEIUKcOng9FsrxZYwfz2TNMfp44t15E4s3WaEPbd3JQFa4sJL2aPyk
         6oTDvfdXjjI/K7UwgYlqJs4fNQyowaFZL8G/8zRAW9iUmhW6AaVscBI/PuURe8FulKBV
         RNNyXi1V73JZmxpO1CCwLfByBQMmgt4vWsGaESt0XyljvTOMyc2B5foUKIqIGZKyEaCD
         TW5FSgXwWuNt7qDuQvJGdSPueTgkWCwDObEvTtkHqu9yD2KjPhWmW69OOXI5kjE8ER9U
         FCSikdudDRycEZpu2lX3ltQYZxikKXiXZXB6TNPeenpgPcdaHluYk2BldKPwLlWEYYJe
         OJXw==
X-Forwarded-Encrypted: i=1; AKwUvBzhUTMDb5L0VvGdLB8f/+TchG1jtVZz4JlGjxp/bmT5uQio5q2TvAeXU7WLc4idsilcbAPiDXtoiaYMnHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dgaC26iQW7xFakV0YEdz7ZnPK140jtZ1QuDQOrAh4ASZokuFT
	cHckYpycuObPrxfBIy+s1IcX6F9rzgEIQ4k8kqYhATOqLVuCspEO2CF4bv/X92ivA5ATEkr9gD4
	1DkKC
X-Gm-Gg: AYBFou3VBANPTcQB/FOu++t2p9UIduVlyCsvbf02+0Nf0gJxEJwTkZOkebq2GUvNDw4
	Y3Ix80J56Beg2ty6QDlAKlihUqEHJNefoB507d/NK5GqzsWLJdSNP26fjjfBhSZXsxbn+lvaP7F
	I1CsfjYhO+vvlVc+mqFzgxJnROhB/2CN+phZxv8e6heOfVZgxcIPzMEDP9SNaclJxD3qkm1e4o+
	1gU/G5X7ArUEEXYCRR3PgioKbrAjdrRpciJjdyahLcIXZaNyCHfBXaZtBF/SOUAjycl3V/T1kN/
	N4v4OwyF+P5v2j0NO4rm+x/Qv57WpYQwCxAqpAl8Pq2ozWEDARpQ62WZB7HJAzNVT1h9NO6X+V4
	Vln8SaRE7d9sXuMZjAoz6Saf3BuLVvu+DbDGP92YBQTO8VyiIluscSK/ampLnnKY/cvUzOHXyrm
	h+Jdh52LXSi2e8ky4IwQ2xGeWLIYcgOAdKnqTxPjXtrSOQOND9JxSTIB2dLqk4xqHVZ0qduZ6IA
	aH8STjLUsZEPUGXPDypRZ7QIsoE3aleD5PGPQqJhqhVExb3T3lBaY4CavVPLFiC4AkqZ7+ZYeu7
	C/eliBjcpTMamo9ppxP7AB9DsZqVnfBQrP+VI+xFA4BKb/yL
X-Received: by 2002:a05:690e:191a:b0:67b:9a76:cd0b with SMTP id 956f58d0204a3-67ba4edd88fmr8834059d50.28.1793646966752;
        Mon, 02 Nov 2026 11:16:06 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf147246sm5737296d50.1.2026.11.02.11.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:16:00 -0800 (PST)
Date: Mon, 2 Nov 2026 14:15:52 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Tao Cui <cui.tao@linux.dev>, Michal Hocko <mhocko@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from
 struct mem_cgroup
Message-ID: <aujhaEfimB0S5Msu@cmpxchg.org>
References: <b36ab4a7-b692-49e8-92b5-1dc4d76dee00@linux.dev>
 <0BEF7489-16EC-44EE-847B-A6AA380BE11F@linux.dev>
 <32e80536-64e4-4ae3-a7da-4a37ed415f0a@linux.dev>
 <7ia41p9341lv.fsf@castle.c.googlers.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ia41p9341lv.fsf@castle.c.googlers.com>

On Mon, Nov 02, 2026 at 04:52:44PM +0000, Roman Gushchin wrote:
> Tao Cui <cui.tao@linux.dev> writes:
> 
> > Hi Roman,
> >
> > 在 2026/10/30 14:05, Roman Gushchin 写道:
> >> I believe we want to delete this code sooner than later, why would we rewrite it before that?
> >> 
> >
> > My assumption was that v1 would still be maintained for some time
> > before its eventual removal, and the goal was to reduce the coupling
> > between the remaining v1 code and the shared core structures during
> > that period, rather than to rewrite the implementation for its own
> > sake.
> 
> I understand. But personally I don't see big issues with the current
> code caused by the v1 stuff. Maybe I miss something...
> 
> The proposed changes on the other hand create difficulties for those
> who use v1 and maintain some local changes or simple backport upstream
> fixes. Of course, it's not a reason to not change the upstream code if
> it's justified, but in this case I'm hardly convinced.
> 
> > If the expectation is that the remaining v1 implementation will be
> > removed in the near future, then I agree this work becomes much harder
> > to justify.
> >
> > Am I being too optimistic about how long the remaining v1 code is
> > expected to stay around?
> 
> Well, Idk, it was considered deprecated for quite some time already,
> so maybe announcing that it will be deleted in a year is reasonable?

That might be tougher for v1 users than the member placement :-)

My understanding is that there are still a few heavy v1 users out
there. I'm not sure they can move within that timeframe. Personally I
think the cost of the v1 code now is kind of negligible now?

> Shakeel, Johannes, Michal, wdyt?

I was a weak yes on Tao's patch. Happy to keep it out with you and
Michal not being fans of it.
