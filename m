Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396081;
	b=HTTfebDqTNUr13CwTsGvaNPt9CxeAVuvEnC5PKDbiS4f1zlONf9PEg/EPvL2VwnIIvCm
	 MLJh+wvAjZE36ijB5n41Ub2bgpXBNvubx9cfm3mFpjoZAQihGHJuiblgtBmPEErCxm56g
	 aaq0QIPK8i3TF5nsWG7AWzTzb5SxTATLsbM3VopWKpOTlQlaALDJghDkIsQC+kg5lEnu/
	 N7hxUaZFKSeXYUER9jOuSdqM71H5jHpsvHfPp2O0Hk2G50ydUxmbbkRo0NtYFOWDmQkoT
	 7B/jYAeVanBgMRZSW6DizdlQ+n+a+U5kEiR6b8mY4RZ+aN8SnC0uF+jZyw+K1FhDUcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=wr9LUpNEHOOjAzDkbtOdFfPOarAUZcRS58IEDQefKL8=;
	b=28eFytvG4aQhKGwGz8znxvkc7n9oz+IYgR8ZQsKWfVR9hH5NLJMVpF1itiZus2chz7oK
	 L9BcdnjifoSXtJyqjY4SUmnAp8hFbOeRmpYnAKuuk/bnMqAQP2xKIcPkxWJxAXuEV7+L/
	 bIOfienRCAmfX4nMplsu1FSO7LefPZUpGZ2xonEZjRL1Jtqqg7BODbpdv68jlz+mAjVYN
	 g7fUPuKCjMbPq3y4eQSnqnA023ieP45XG9DFL1+OFd6mG/POd+uUJmkhSYEPbxeQdh2WA
	 NhpLZKe4UbvGxUlJvstfVAzbQF2KkeMRODyIBryS1QIfXmX1FRAdOCTggQs4KnQsCTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XRsRD/3i";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6606B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRsRD/3i
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35159e0092aso43141eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396080; x=1795000880; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wr9LUpNEHOOjAzDkbtOdFfPOarAUZcRS58IEDQefKL8=;
        b=XRsRD/3iB7VLko7slMbrsse3CjsFdMqIuAXlCtaKhgMpO1RYJchg0/kiqPBCf4yuuA
         ZRjdtflHU6dZ9uYUtt+MULpmMLUwWnqGFnNv5QEIxoBBWtOrbJGKq6W1G6l6QbPu03+p
         sA0eV0oh/40hu0tfJL5De7FUhr9WvMG9zaSO9/fjchyyoeTuKZWjE7PCnhjYLKx7MpRc
         EH0Qj6IDVShITQH3kn8vlSWrVE+vyIFQmBrjZYTfiZt/VJAT7hs5wziWwxn1xGbSQNJ0
         H0fzemWoMOR9F9ccNNMsUU4EV62koIvRogWOAYUTbqf1FsEyMZSp9kbxlKQasCuemumF
         63Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396080; x=1795000880;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr9LUpNEHOOjAzDkbtOdFfPOarAUZcRS58IEDQefKL8=;
        b=TY059QIOeCrwkAsX7Wbcyxe+CvuTvJNlgxKliYK9SibOU5UMHJempK74ziu2Tu2dV8
         BDR1oSWtZ5pySGcCN2gJuqtUSZ/Tio6GGfCbMc7lPat+kz9Wubh1j8dnsUK2363ZsT2M
         Tb8ONTdW98+qeso1iWdTSTwmpNE4rcAWguowGbcDH3/peXOIEXTUus2hhcNdY9VpNaMh
         ahbqylEdSX6qvS0yOsGUJvF92haL77Ee14793J35W7NNf1BUO8FlRxj6ET3hjckWdDIr
         WIa7C+t/UaxLkFcg3kobKEUVVn22vckUrXqNBskNfXhCbY/69wruWG2fPNp/bNfTCOAz
         f2gw==
X-Forwarded-Encrypted: i=1; AL+hErGJgAQqXdhTnGo4UF5SpmHGyiwRvcUOYhAx96qbxQNlWSoum13V5GEHpV8qWrW6tC3SmaVQR3D8DDE2n9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pERgOuf2e3jy1lmpFf4JYGnPx4KXLQdCwC6PZy0kHz+NhKj2A
	UbcJRTz9tLnfdJB0MPdHUWxLSiSdqPZVGvlGDy3ojpXhR5WI6g9hU1tY
X-Gm-Gg: AYBFou1Nce48addHnQL70GPL6z4bkXY+5a+iTpNQIcs6Q/KEAeJfeFPqhmdmVSSjpxQ
	R0RRcXMA430N2qfmtz7/lUdkyNmsyFRPrjy4tAdnT6WB7lAiZtbDAazClwRtBCuQNJxKYLf4KSN
	1f42anNaq00eXiuN0Cuxp8p70ZNyxa4Piw6RUYQjoBF/l2FYHFrQ+rB5CPYUhbSO0rZkSPSqprb
	WEv6Gh5OO540xzE8NURX+zcWHSydxYFZuC8mhUNCnOyC1CNeGQDdLC8bb5bfG1pSzPB1g9FOWoT
	T6LNZC4VrPle04gpZDnRR/KEKvisUGeD74+LKB49JV9ua27dDtwa6upbgXEWZGwBT+DQpLJNNGU
	eQOuXhKK3INX+cRwirwU5fMwDtkz2mtNWYG0EXOYY0hR+TmxsABW7dm1rYXPMWzrRh8Saavg9Y8
	Kk9TgUmWwroKcJqcJ8seySe4SnIiEKRw0LDR5Z4Vlk5mFM3VScFR9pr+duKq/K4p3Z+uBiIsQfI
	Q/M2ZzmlyVcFVL5XFKjDxsnQ4Lz846sWAA0cMs728Z1hTNjoKh8Ou8n/g5kd81f9LrJOPP210re
	4+Bdz+U4vKWXW1fIQFfkDAO4mHTCNaCUqziddL+6vNQTxHDrF4Kx3a31Plt1PvSBTtE=
X-Received: by 2002:a05:7300:f547:b0:36a:13fd:b5c with SMTP id 5a478bee46e88-376854b73ddmr4138428eec.2.1794396079980;
        Wed, 11 Nov 2026 03:21:19 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm24474631eec.22.2026.11.11.03.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:21:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
 <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>
Date: Wed, 11 Nov 2026 19:21:15 +0800
Message-Id: <179439607522.2142163.11892098572560820648.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-10 08:00 -0700, Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > counters are updated regardless of this option.
> >
> > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > debugfs is unavailable.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/zsmalloc.c | 33 ++-------------------------------
> >  1 file changed, 2 insertions(+), 31 deletions(-)
> 
> FWIW, LGTM:
> 
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>

Thanks for the review!

> 
> But I come from the perspective of large(r) server machines - I'd wait
> for the feedback of embedded folks too :)

I also tested the memory overhead. For a typical Android setup with
one zram pool, the additional inode/dentry slab object footprint is about 2.11 KB.
Even with 32 pools, it's only about 45.7 KB.

I think this overhead is acceptable for embedded devices.

>
> Sergey, how do you feel about this direction? We've run the stats
> collection (even before we select CONFIG_ZSMALLOC_STAT to expose the
> stats to userspace) for eons, and it was never a bottleneck AFAICS in
> our fleet...  And the stats files seem trivial, relatively speaking?
> 


