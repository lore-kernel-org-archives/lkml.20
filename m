Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EE912B143
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842939; cv=none; b=Ek+NwJq/C+cIA47TWt8DcIqGjP0AeHrs9aEod6sCMIzuK79qekret2SQT8QdYrjXvsIcbicrbQbfqehAMpuW7OhD3K0H9NfcJNlahn5pYa/30TNbMWuwAzIe+MKIUNlcIj1KO1zTXCseVljpKL76Yo/UWAFuUrQ4TmWlkEuvfsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842939; c=relaxed/simple;
	bh=oOCHTLFVKS2TkQuWSodeipJtYBIlhCkYg4CQC6hmFsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaexkTakOcMBP2tj7LgFTI0MarP1C/OBBpjMPTFZNne+zuZfcMQs4IA+6yJy0CpwysTsieW9eZBvfBgOscD+5YCzuqkRDhjsEZRqQrM/rf+IkCUia9ytr9EqDSqFPNlPNCqgDa/J/i4tIKlsyqrwzzWB5mYpImaIKJT3CUjzSjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=A6qMcR+l; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="A6qMcR+l"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-85a50f6a7f7so25699167b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1787842937; x=1788447737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Bf7BegkUo5SVTaJjTfnH0NRee4RexFhC+XH1o5griA=;
        b=A6qMcR+lDmYIG8K2QOnIbTx9f51jJWMh1NIDIeG8rFWhV7wlCY4M5HYuUKzUW3Z+bu
         VG683fJnIf1uBzM+kEHsJD3fu6rlfbgjN+Av7HKX2lHj1zUadhtJqqycqkShUR7VSYJK
         O1GHuZcW+6sLBsuvUCb9r6fknMFZhorHI7pz1PeKLYVdqyiVBPXYL05ZYMf/t6sgFfph
         iowrtKy5Be+PM+FtatNxJOc8HIExt4WXHn9/n7Y9HMHuxwSA7BFdjmuymm0Xp7d6VePj
         rkmP/StqF90abg3UYTKVBX27B85INzNYibLYhFxgH9ZORIY+nRdO/wHO3NTGeNSfYx5I
         iSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842937; x=1788447737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Bf7BegkUo5SVTaJjTfnH0NRee4RexFhC+XH1o5griA=;
        b=frg6+f857zQh3yNDevxn9gQNuOzY9mHLS58gCOTEYvmzabWmKTXjTsH3Nk9VEnmQvJ
         xXBSLHWHBCFjJm4bfFJT/WAJWcrRBxihO9H0uTjnwICcCTEa0BfvuqWZS+alDsOXdMDz
         E3advezCihrG1qN9fNoVVggeA1NSfOdH6Xss0B7iXuFRTvfIo9D3mQWSPKljmw0VXIAa
         oxh3OipuTxPywez59qJ2cKdUOhFRKkOdvnkguzrusTncxY/+RQ7veQjJ+/P1C0wD21UO
         vBtpPKUJJqI1B/SAnLioHrAq8hwA2dumRJlRIshtkyaQQJhV+sbGxXZ6/gxgkWfTEkZF
         JMLA==
X-Forwarded-Encrypted: i=1; AHgh+RrTAGBhToC1QvbW0V/SykwRlbcoQKsCAZ755V0jBrHI0rPEu68RofWQjG0ag28D6WCY66Llg50N4RUjp9E=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1qOnuD1TnTv2Bh1uMnYp7ufXpt3EYef775Hfzk6V3VYuY4hN
	7M9PMHyERM5uR7a9JNeYKUzRHbb6Baj9g8/tS3tWVQv8eb/yrRIi/Ys/m3vJK8G+tNE=
X-Gm-Gg: AR+sD13EJkSmT03KCqPt/ja2LSBxoBW9SeLB0pnjr8d1TKb0my0Z7p2y1Av0mS8du2x
	7U0ZsSGdaHePmkBLDUtnh+a4g6A5BNbOc1OiEWKpkmM0Pb/txF60gywcEbYVm6bwzO4rBEphyK8
	58i9uvlqKwY6x09idipdSH+Jy3LzLXlTuM0j9LD/YEEQV1goLKQvY9gEmQacXtBrO7at3BOCoBK
	RwnFgLArUl4CwJurb6TB4Fq8asDDUBG/UTJJ+aCSQ7BOmJTm+EYB2D5d4mlKqMUu1aQmGdBSFgw
	T9g97nysBiHNbAlzJHehq/mz5FR0mA25kVVvWx6dKk0P3aTc7WcGMxH0DvCD7mdm+XOfqhi2Sil
	vb+xY9GTPrjyze3V7cVk03VGI6kct778j4lbHELbhsQyaeMqqlrjyqxTMm9GNLA8g1r6q0hnN5i
	1oK1wsHH1V7q8XjHbXs/RMJB5BzI5+Ba4P6XG4W3BtBRaoJkae2Hrv+YcEwYaP
X-Received: by 2002:a05:690c:2702:b0:820:b89:52c6 with SMTP id 00721157ae682-8574172ffd2mr75025547b3.33.1787842934644;
        Thu, 27 Aug 2026 08:02:14 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85b626ec6ddsm11363877b3.46.2026.08.27.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:02:13 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:02:05 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, lance.yang@linux.dev, ziy@nvidia.com,
	hughd@google.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
	liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
	ryan.roberts@arm.com, balbirs@nvidia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Message-ID: <20260827150205.GC3004@cmpxchg.org>
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-2-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826162101.1314941-2-kirill@shutemov.name>

On Wed, Aug 26, 2026 at 05:20:57PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> deferred_split_isolate() probes each queued folio with folio_try_get().
> folio_try_get() failure is treated as a lost race with folio_put(): clear
> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
> the folio off the queue.
> 
> The folio_put() race is the most common case for !folio_try_get(), but
> it is not the only option. Another scenario is folio_ref_freeze().
> 
> A zero refcount in such cases does not mean the folio is going away.  It
> means "don't touch me" and current deferred_split_isolate() doesn't
> respect it. It can lead to unqueueing folios from the deferred list for
> no reason:
> 
>     CPU 0                            CPU 1
>     ---------------------------      ------------------------------
>     freeze a mapped folio            deferred_split_scan()
>       folio_ref_freeze()               folio_try_get() fails
>                                        folio_clear_partially_mapped()
>                                        NR_ANON_PARTIALLY_MAPPED--
>                                        folio off the queue
>     give up, put it back
>       folio_ref_unfreeze()
> 
> The folio is still partially mapped, but it is no longer a split candidate.
> Nothing queues it again until part of it is unmapped once more.
> 
> Skip the folio instead: whoever freezes the folio, owns it and owner is
> responsible for its fate. It also covers the folio_put() case:
> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
> 
> Reported-by: Lance Yang <lance.yang@linux.dev>
> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linux.dev/
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
