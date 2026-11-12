Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508401;
	b=oGiTgqnQK3xUquYdj/YAFtS5XAGSoPg5KtYS4izdndGPGMCvP3DUNZ2pQeWOxE09ioaO
	 qpA+fLjOiPt2t73RiLVhSyjkaaMuB8YwGNx4S1f4ElpVzMR+P8TPuRcsO84PrY+nwS0Fi
	 ONVgd9wYXSBCuQ2EO+GhA2JSfsEK+F+tNpBy15acwVSd9+5frT+rlJ3K8kDVrJvoorMNA
	 BNfrZsrVWS2PGAY3x0a81Yftvw/GwUxaVNp4Fp8PboOtSPdZ8pkDCbpuDdvQBJvG/12Xw
	 H7o89+zfgFwH8fdX3DYr+hgYv7GvCTuJ5WN0UVzqHiPFiOrkTPU09WQbPV7ayRu8RAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+0890/1KdBxvDOFaG5+6Gtq1sFZ3f+/3xUbaBwJyo30=;
	b=IkJOP+NMzUE9QAgEFRFjhDwV7zuMqKJFdjLZUs9SHK+jQzhWJasdqIS/qVwr/0Kyb0J9
	 DJ/gciu8bKt+nOCnX58LJmdqdYO9kLNFB0FvRo0g37+nKh1oiuEfigRr/lHj8EwgAOS2o
	 o2eWM8n4BcDr1v308AH+RGIATeASCAh+202mxGUv6xIQ9KscAfUB7MYmk7yJxbZJNuNKS
	 UtcTy6wjefQqKNQ02bWUq7Pggf+rzvm3RQ2VjaHvmcRA9NlzkHgkj78oPyjjPjJjbGJYn
	 GbxrWBi/whVAszTbYn+HPyIX2ALfLr5z54Lp7ynbqxVUusw1PjMFEAnnGo5Pl9sxtiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpJb013w;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173A606A89A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3173A606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpJb013w
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so1898756a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794508399; x=1795113199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+0890/1KdBxvDOFaG5+6Gtq1sFZ3f+/3xUbaBwJyo30=;
        b=bpJb013wg86TqxRRlt4sD67lUpI5p2+GLIho39k7oCu3QGTMGi+VmybFlQbzbYOvWa
         TnZ2bwWfbluvwDTDSUeNSX+b7jc4Lt6Zo7P1EPak/SThQLr7vtt0X9DHs8IqAKxVDdjN
         g5KbnjYEuuYMYhMMw1wUa41FWtu/T5h8r29aCpnwpsIvqF9xt0gVlLDJUM2x9pwUjy3R
         2XnCBtztXNRasQLxA1HL+pN/n77Tk+Gj7idiZOnJCKOk4HOTKBadsMG1mqQrCDYruHN6
         IANIFSepZ5jOz2SDRsvUfch8m7CLPqfCmxRZ75qu00DNEDZpWs7nqlhFeNLlpGutHtrc
         crxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508399; x=1795113199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0890/1KdBxvDOFaG5+6Gtq1sFZ3f+/3xUbaBwJyo30=;
        b=OZRE4CJ3vgRAwgy2RyTbxsTAHnjKf8bSCOqcNvBp8dOP4VvyKhU0F3x+44OA0O2MAq
         wUoMbI+cd/XpylO1Tmv07ocleeQ8zT8+zWdvyyGsRFmt9dcoDJk8i7qg8M5hZOmi7Fs7
         5qN5/pePokfgc3cQ/pCXoE6osIqRwsvxUvlFMWL1W0evIN8JXDFJO9SeIi2DCP6NQgUF
         0MXHGfIx7RppK3UNS6u+bd/DXXSI4alUlYwKdfR9WMRXiVdwfTeENF3fJxvSgSHxlLvA
         +d3A8eH7U5EhFhzIHboxqHedtc9Z9SWp0cCeD+qCrxcjwR91JnRRja/uMnKRpkQk/Ha7
         /IwQ==
X-Forwarded-Encrypted: i=1; AL+hErHSz42iiax1UMKVb5iyb8kFpsP+gEDRokY0x+DXgUSofsdFeYdRhE4m7VU9QADiotEAXrtPi2C9YDZp/xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9UwV+/gM8hf2kndwlznm/sgGqLVTakrUZsGHPOr9KY5Qb8+9f
	m5aAEJ8pqvj3fS/GaO6+HXsngwbQyPkktNNDXgqonNzWEEDmyG6lajL8
X-Gm-Gg: AYBFou3sd5E7LawKBAw68nVKQrRtoFFsPiZBe6G4CclgD3krZPMJVBYjeJ0JrVDOaD3
	NuYACcaGM6GUd8dwUVgWi9abfbH6rd5UUY4Nl5+zKsHwZnPCrTWHzZiF1bC7Y4bc7zarkKPHGwW
	qnbUb1ZpLVxORRdyeEqZ3ZPqRkMMjBasSzgXfo1fY/7sC+zAyHCf8Zaw4UjfMTNKeqC8jndRU/Q
	j7fhHRj1NB5oWLCn1pxxrzPBbwFzI2MplmjCHgu9RKMIPhI1wx3qbxDV4g9jM8a2U13PMQZVwKf
	pzZRAlQA4NSi13XsTKKss5GkNspOm0ID56LHCRDGcXEr/wsVN2lpMi4ShyfXOa+fml0FervGlEd
	r95uKFo2UcXjJoDf/h83RKk0ycBKnB8xCGOlBKRpcDQVepumP+yozCuL6+NxE/iivtilsSzCHfn
	CnLdKQz8rhLiLdcD9jJ1auJvC4MKTmU73yQQ93HMcEwoPVpea+lIilNPnd156tAfmO3mwUElwsP
	mYuMlpaBvqsK16RWBPtS/kEKlyg4UnePh7BGRZWQJ7msrw3W/A7ioTqa9MVJPE8NPD8mtRqEjg7
	73j/8eqsoNRoyivP
X-Received: by 2002:a17:907:608f:b0:c4c:a409:5aa3 with SMTP id a640c23a62f3a-c50963879c9mr11899066b.17.1794508399520;
        Thu, 12 Nov 2026 10:33:19 -0800 (PST)
Received: from krava ([173.38.220.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b68dbbsm5890066b.61.2026.11.12.10.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:33:19 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Nov 2026 19:33:16 +0100
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Alan Maguire <almagui@kernel.org>,
	x86@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 01/13] static_call: Index code text reservation lookups
Message-ID: <avYGbCrfomowKKiH@krava>
References: <20261109194916.1089703-1-jolsa@kernel.org>
 <20261109194916.1089703-2-jolsa@kernel.org>
 <20261112083413.GE2668804@noisy.programming.kicks-ass.net>
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
In-Reply-To: <20261112083413.GE2668804@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 09:34:13AM +0100, Peter Zijlstra wrote:
> On Mon, Nov 09, 2026 at 08:49:04PM +0100, Jiri Olsa wrote:
> 
> > +static int static_call_site_index_cmp(const void *a, const void *b, const void *priv)
> > +{
> > +	const struct static_call_site *base = priv;
> > +	unsigned int ia = *(u32 *)a;
> > +	unsigned int ib = *(u32 *)b;
> > +	unsigned long ca = (unsigned long)static_call_addr(base + ia);
> > +	unsigned long cb = (unsigned long)static_call_addr(base + ib);
> > +
> > +	return cmp_int(ca, cb);
> > +}
> > +
> > +static struct static_call_site_index *
> > +static_call_site_index_alloc(struct static_call_site *start,
> > +			     struct static_call_site *stop)
> > +{
> > +	struct static_call_site_index *index;
> > +	unsigned int nr = stop - start;
> > +	unsigned int i;
> > +
> > +	if (!nr)
> > +		return NULL;
> > +
> > +	index = kvmalloc_flex(*index, entries, nr, GFP_KERNEL);
> > +	if (!index)
> > +		return NULL;
> > +
> > +	index->nr = nr;
> > +	index->base = start;
> > +	for (i = 0; i < nr; i++)
> > +		index->entries[i] = i;
> > +
> > +	sort_r(index->entries, nr, sizeof(index->entries[0]),
> > +	       static_call_site_index_cmp, NULL, start);
> > +
> > +	return index;
> > +}
> > +
> > +static int
> > +static_call_site_index_text_reserved(struct static_call_site_index *index,
> > +				     void *start, void *end, bool init)
> > +{
> > +	unsigned int low = 0, high = index->nr, i;
> > +
> > +	/* Find the first site after @start. */
> > +	while (low < high) {
> > +		unsigned int mid = low + (high - low) / 2;
> > +		void *addr = static_call_addr(index->base + index->entries[mid]);
> > +
> > +		if (addr <= start)
> > +			low = mid + 1;
> > +		else
> > +			high = mid;
> > +	}
> > +
> > +	/* The preceding site may overlap @start. */
> > +	if (low)
> > +		low--;
> > +
> > +	for (i = low; i < index->nr; i++) {
> > +		struct static_call_site *site = index->base + index->entries[i];
> > +		void *addr = static_call_addr(site);
> > +
> > +		/* Later sites cannot overlap once this address is past @end. */
> > +		if (addr > end)
> > +			break;
> > +		if ((init || !static_call_is_init(site)) &&
> > +		    addr_conflict(site, start, end))
> > +			return 1;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> FWIW, we do have bsearch() as well.

yes, but bsearch() returns exact match, but we need to find first entry
after start even when no entry matches it... I'm not sure how to do that
with bsearch

jirka
