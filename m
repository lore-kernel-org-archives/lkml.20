Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EB41684B0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888661; cv=none; b=NNI/pe/dCx3jjNB5XkT1Q4nyQCxOKEMLFiNIYs18KqpBbS/NsI763id5QTgKg5DOwMmtCNz6zXM3WxwPNYQCWHWFd11CcP5J2Io1OgF712S9kKjt+QPUlWEwcUlKKhDqH0GNhaKHPTMZRg6c+uBb+9yEN3NLuOwaWJB2WPLx7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888661; c=relaxed/simple;
	bh=t3/BktzD8QeyR5fLd2I95qTxyoZYsk53gEhenK4JWlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCFy6b4OGuMB0ZRgxoZOmwXVGk1ob3G4z6/y8dF5hfXMi35gAwGAVKBj3NvpLDlqRTVDVRaq86fn10vkTwxM5UWKHCQqJRif/XKhHtlW4/SnH5L0rJWVxlmAaA/sSJ8lwgQcRnv6UnKeGp8vpMLNh3i1d8OLsn5z7yvKXSLkhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJU3L/vN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJU3L/vN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2239535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888658; x=1788493458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whpn/jQ/ZPICmR96kW9h0JyF+OMKrcXAKh09CTAM9Tk=;
        b=QJU3L/vNIw2uxxo/CyuDI5E/6ygVz3nMYRwBEpTH/evjM4cR0EJesMg+K1VqaKBeBe
         9CwG+kj3xPtjG8Tio5qzmO3wvOISxMk0ndqK29wrtaXmbYYjvl/p31jebnfetqfc9WUp
         TtVPPzby4CheaFJ4qktAn/FPV12U3kPeoCf5zrsEDP2TiTw+ZIwNRgV9+0pzDESRfFlK
         +/FqjpFoeKWYC8tOz2NYgda9yu4ey3RvqRFZMvkxqOlGppWMGP23ARKGORBMxh0h3CF3
         fZMjtyrm074QUKcIgwEQTC+butgO+sh/l1XSU5Epd8xlX8yNjoYtCbqlDEYvMnrvjXEM
         Rxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888658; x=1788493458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whpn/jQ/ZPICmR96kW9h0JyF+OMKrcXAKh09CTAM9Tk=;
        b=BVFFzcxh2F/QaYI/ifiFKeRDyzA52jeRTd+nq70djvWIKyMH2G2VRBJ4UNdz6m3RPz
         M8RwHyPp1ZrGrjg66lOtil1mD5pBRncNgfCEWKpB3m62upT6z7PM0qc9JrZdbi90A7uP
         LMkjCWfN+kHI6zn81/tLOxRGR2rFWSyrY66H/bthh21TyIBy0iQgXi8pDMGTuOHRUplY
         fhtltGWRUCrxOh+hDixIMdKquTDKnTqiJHAysvCNzxtPWyPRjyc9CCIwNpHi6fVw/etT
         oOVklzpAgkqA+r3zHphOVq4OcSvZXHjENoz7PL2gsbSqQlldNEh8PKDnKVTG34PBAemt
         r1ug==
X-Forwarded-Encrypted: i=1; AHgh+RpUjlXkj2/Afh6TfEKWrmOm0KYc1C8/GrXEIlFZ6nhKrxUe4DQQEv5oV0FXMd0AYau9v+cPs9UGTehWJVk=@vger.kernel.org
X-Gm-Message-State: AFuF++kHkOxNOWdPGZs5C7yOiv44BOq+pMmdsq+BvteOcIvNv0gv1Lyt
	Q5VIYVjg8emNel4tfbvlZSHjFCAZFdiACDghxNoH31n2h+J9aLSzpheDDaQQScjp
X-Gm-Gg: AR+sD115zJXG4zPlcFT47AQf8fp0UkD1A7JuwFKgc7ziHaWjWFH+D/LSJZOX0h/iNlc
	7zdQoIPk966BiLB17uTVu78rffc850CBT2xeKHWYbClhI1mO8KMo8TFJO1uqtYUB/TPcsWsQWCM
	aravO6YjgY775bxr8wT6hqyN/lvUJ/vEzTjQq465yziQJJ4TCV6KETazHai35jBnlW6HZfZOIZ4
	tGkV/RY2Cj7tLytt2nzmzD5VzXht010nELrWEgV/BF7g+vwaGEdk/NefqCrUMfCjGn7uOcuGjL0
	f6+n1zq4VcpyC5gD95WQCWBYW9BewwX+m6pHxImy9rDQTPM/Euyus3NErAB0CDOn1+F17gtUkC4
	xE+aX0oR4HT5zB0tBgBQdRV7D8TONjJkLHl2ow2PBRDOyJdGp9U5Pa1WLEgIIcuyzivkAt0T1Wh
	9VfnpVk82y0ajhl3Wh6RTtyrb9OQszd/9L596zoG5PAIDRQkWucEkocWxYTFmYtj4boaY4vZs2G
	hSZHhBFSZMQxRj0Um0ra/kRYQONYmSEzWr6kr2yeKzssMeT0Ukdh6chfsdLRFhg3Ig83uIn+SDa
	ThnRH7h74C16cfmy
X-Received: by 2002:a05:600c:a03:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49b91c5096dmr41739775e9.15.1787888658041;
        Thu, 27 Aug 2026 20:44:18 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-077-007-099-087.77.7.pool.telefonica.de. [77.7.99.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm17275445e9.10.2026.08.27.20.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:44:17 -0700 (PDT)
Date: Fri, 28 Aug 2026 05:43:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Walk page tables with interrupts disabled in
 show_pte()
Message-ID: <apEDnrEbpvXq-mTe@gmail.com>
References: <20260815211316.974-1-kmehltretter@gmail.com>
 <apBKADD1xiGWzHCB@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apBKADD1xiGWzHCB@willie-the-truck>

On Thu, Aug 27, 2026 at 03:30:24PM +0100, Will Deacon wrote:
> > @@ -151,6 +152,8 @@ static void show_pte(unsigned long addr)
> >  		return;
> >  	}
> >  
> > +	guard(irqsave)();
> > +
> >  	pr_alert("%s pgtable: %luk pages, %llu-bit VAs, pgdp=%016lx\n",
> >  		 mm == &init_mm ? "swapper" : "user", PAGE_SIZE / SZ_1K,
> >  		 vabits_actual, mm_to_pgd_phys(mm));
> 
> Curious, but why did you add the guard before the print?

Good point. No need to cover the print, I'll move it below in v2.

Thanks,
Karl
