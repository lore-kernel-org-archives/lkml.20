Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2937D12E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529273; cv=none; b=FTq30L22wwckx7riw/8o2okGTxs1VilT0c0a8nrEA2HwleRJHv6wpGKPLZzuECNXL1SxEkCis0dyClv7SXpFh56PBLDMbeXWTYnI9wcuhWBlDt0k8DAoOEaLW7t3C3r2j5KIc1q4QZLKBHSEOyz/Dx4XDcPS6sO68XQVT8J4LWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529273; c=relaxed/simple;
	bh=Qs5uzyjG9RdBU+G1ftodW+2KjlDgKg9y9jWORxby16c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHelIXGZGNQtFHarbVgLowkr234JXTGkcmEVBylQtPcdV1ujjde03bDo0bcPR7MlehMXyrgswW9pYKJJGKK1GslH8UqyF5mJrEvSH3xdd2S6jS4u/cr1ioofEFQ70ylJY4Hh6ck5OmFHa/w6d+lj315ievEZUWCfVPbk2ANko+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TccyCH2b; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TccyCH2b"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cefaso40508485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789529270; x=1790134070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LpcV4akiuPw6ooaHeQwzYvlzeYD38qF2Fr1gPzg9K6U=;
        b=TccyCH2b+HTFCUvw7XYCTiSqJoKjy78OB3IOlHLAKWHyKPzdgddewwsosYrAOH1dk+
         2tdDKcrP1cuSPAaaeY4dNr/+2hdx0AzXgPH/gzbs42MJ+JI/ITknp23xFhcTzlEOa+wM
         QXdiz8cLtirm6zzui66Hwmd6zPfiaABEQUJm0GuqJGy6fYPG3qVd6qWKG0bHECvGvO2Z
         f2Gi2IAu7+0bre4Vt5FTJVI5vGUlfv/SjfyEsFW0ft3k6RVALHRJLfHyQ09QpZ1w65bM
         IHdaZ52pvu+evgGrQ1kbGYGSPWpnSujYzOzXhFe2FsFrqG8NQI3EBBqRUPcvwBOrdzgm
         5jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529270; x=1790134070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpcV4akiuPw6ooaHeQwzYvlzeYD38qF2Fr1gPzg9K6U=;
        b=IpiXfRcxIDVr5j+cZaB/Ybga0EahhbN4ytAHQ+G2vEc/O7DX4ZhUWhwFKeTDGvqs67
         Cb5A4qCw3NG8k6FAQWo7gBK6mC5Rxf9ISE/mljA16ugkNkScwRFt5Ei4+cNGbG2AH+Pb
         hMp6rJywQYVfLWPlu/Uauebm1vzNYZKHnguSFub6aSRxxl1Yp1E5fgRYl1e2BPwJqhPR
         K04ZArqQwp6xPmt3El+rKiTzj70Ms36k0nkhzEmsPg9eUTDNWd2IQfOJfi6bNNrvX7tl
         anReQQa12tpHg4RGHLTpPBFqVIOB+8kjUSa/nsPh8zDu4DAEfrHEkjEyZwAHIUIfB/OL
         pz4w==
X-Forwarded-Encrypted: i=1; AKwUvBzU5Xhm5XKUT+vAfm0vEnUKHKQGj3PzODo408I9Do+vTlzhVbHNhBQygyK5kswk/FLCEBE88yREeuqUyt8=@vger.kernel.org
X-Gm-Message-State: AFuF++mfp+w7tAEgHjzCxUZ43B806AH/K4U0Wbpidq2Npn+aMerEz+FI
	4S/Oxbf3QUsWosO1B0SotN6mz3A65Kwh+9LqjAMn5DjPYIUtorZwr8U6VWcON+HpQRY=
X-Gm-Gg: AYBFou3jYs2KI4g6m3FTht19iyesv2kv3XQ/9le/Thb7cLRhfP9dkpRj7yNaT0LE4xH
	dcSbQUeUIrxJtoStchUR3jrFBQWAotfDsbh85TNOMdu2As8/mKze4SIOpC+JNWIisByjVC0nyoI
	Uiw430XvWfqTvtai+RPAgGPW6Mr32uvfMWHUA6UjkU+JgsHm4bUUsfx41huSxMCYN4IqJ2LGqk4
	0AvSBwcRcH4aOIxkc8MTy79hegdo3M3KpZ3pHtQbgudBQs2AnEkKQyP8ES0R5tedmwW5cHt4TDZ
	VoAm+L5/N+T47KIRcyILkzUrLiFmhr4xJYlD/jMosTnUnwe7F8OqlqxzqiATEpIqFMnK9nQZvnc
	s/nxNL1B3HZ6NK3NxUYWYKuCvfHq7qqd52YS647RAPky+WQXt9kPzKCCknK/4NTHT5wrFdpGiVv
	EVL4WCXLLNobGpjMnAHWQbaINvYRA5J7s/z78nY/yYs/KOgjpdnUk323bI90clXOJfeUpgp+55b
	It69VMypbQzY9svkGVWx+s4j1JJk11DYQllKqzqig4tlVBGpNy/W58=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr153460185a.5.1789529270091;
        Tue, 15 Sep 2026 20:27:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d19df1sm115328585a.45.2026.09.15.20.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:27:49 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:27:47 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	liam@infradead.org, ljs@kernel.org, david@kernel.org, vbabka@kernel.org, 
	jannh@google.com, sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [RESEND PATCH] mm/madvise: use folio_trylock() in the
 cold/pageout PMD split
Message-ID: <aqoKLlzgsMc7VwJ3@gourry-fedora-PF4VCD3F>
References: <20260912110540.3203010-1-gourry@gourry.net>
 <20260915184633.e2d8cf719e5eed186d087a8a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915184633.e2d8cf719e5eed186d087a8a@linux-foundation.org>

On Tue, Sep 15, 2026 at 06:46:33PM -0700, Andrew Morton wrote:
> > 
> > On failure the walker returns 0 and nothing retries.  The PMD path becomes
> > best effort when the folio lock is held elsewhere - same as the PTE path.
> 
> Can this result in more EAGAINs being returned to userspace?
>

I don't see where this can result in more EAGAIN, at least from the
madvise side.  The race is the same, we're just giving up and saying
"I tried, doesn't matter if i succeeded".

> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -419,9 +419,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> >  		if (next - addr != HPAGE_PMD_SIZE) {
> >  			int err;
> >  
> > +			if (!folio_trylock(folio))
> > +				goto huge_unlock;
> >  			folio_get(folio);
> >  			spin_unlock(ptl);
> > -			folio_lock(folio);
> >  			err = split_folio(folio);
> >  			folio_unlock(folio);
> >  			folio_put(folio);
> 
> Sashiko shares my reaction, "dear god, why does that function exist".
>
> 	https://sashiko.dev/#/patchset/20260912110540.3203010-1-gourry@gourry.net
> 
> Like the entire function, that random mix of "goto foo" with "return
> whatever" needs to die.
> 
> Anyway, please check it out while you're on a roll.

I've been trying to shore up the sashiko garbage first in a backportable
manner before doing a full restructure.

I would hate to rewrite this just to carry bugs forward, and clearly the
code isn't even remotely correct as-is.

The remaining issue on that link is the memory leak patch you already
looked at.

It's taken a bit to generate positive tests for these bugs and go
through validation, but I think we are finally at the end of the
nasty part and can actually get to cleaning this up.

~Gregory
