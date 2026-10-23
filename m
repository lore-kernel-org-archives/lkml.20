Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767908;
	b=TKrm+spvN5Vh0uHHoRYE2jSKX3g1IUgo8t2AzhNObCtZwEXN0SzluMCMVpz4YCTEn3No
	 TqArI7RhEZk0rJZE98CE2KLmkHK/MGWvqwLMPqDllT2jlG6WwCVqLq1+ydCaEEnfBBDuI
	 zIBeEwS+zdQRFz/BJ6Y3dgaJz1p5PP7qC8WKBbC9lMIjNoxWMMC1EwUvWLh1QxAtv8V+y
	 px/GS7vJDpvX2uCIVcQo5wX0WacQIx1Rw836cRd4LKjg6yrEYSBVivHy3eaUGQb40ACTt
	 eMtrSOer0uPvnU5IAi2IHNqCgUxnO+ml9JS3KgBa1qmTY0FE55MIdhsZ8lGyoRvdAdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AVt62T+eZv2jUWbbskvSmL3IjPCv9lgdm+h7Tjv1RW4=;
	b=W055t5PZBTwIU5Rk3DogpOIAD52pD4AlMdryIU3cuHfaW9S7ogFk8taD6hrHccjh6+OF
	 IRQ9kmP76nCy5Weskdzf+7oxiq71PaSebOsfWeRpKd94b/4GicAKjL8jEQzkc5dLKI0yT
	 brV8W4vKOQ8kaW0oh1FFmW7d4fXp1UAoElXYlPiSfTypheJbIGwfh6X1VN9JQOxc7/Wmv
	 UHQx/quY0/J6UFDnD8M30SjUf+ZPLcGVk7CVqUl7yMEvVG8fsyoFRLuncIk+LvA6s4RMm
	 tr8WyBjWIjo2CGwauxFEICYut65DR3hY2cX4/y+eovLM76iq2bmrJiaw7JiMh1smS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g0nqwTKx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E38606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E38606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g0nqwTKx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1547102f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792767906; x=1793372706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AVt62T+eZv2jUWbbskvSmL3IjPCv9lgdm+h7Tjv1RW4=;
        b=g0nqwTKxnPLqnr2peWhk7l1UWp+rmlHPHVaBp8pdyO4L1geV3RHiKaC+RA31xrws51
         CRX5ztHnaP3EWw2i4/3gD+bRJ3JK67pDHYZ6e1xOHq7pSsemgchdIYeL99yhk448Wuh1
         YTlUrXr/DLejeq72jRo6GhmNC4VJUbto7U1Ry3UHE1zR3PA/dOTrnIB9xFEDLnO8Qf4S
         pUyAHe97jgS3DWPFPocLrPWhmpT0ZrM5re07TOedcoByuHBMcNkOQ4MdFiLq5wGY2D6t
         f6ya1XuYSJTi0IhkkHF5nxS3k9DyUoREmctXAxoLAHLHB8b2/ja4LO0OcsLKgfqzt5DN
         /PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767906; x=1793372706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVt62T+eZv2jUWbbskvSmL3IjPCv9lgdm+h7Tjv1RW4=;
        b=C1xqNiKvabTla1Je6Fpi95Rfp8iCq20V3L/+hx6ROkbqlJS/5Wf44lakhfOZiCo1os
         166mxHYKzWaApMVW8j+w/xYPhUrLODqkTEKtMc8ftue09ULIiE4pRR4GTeR841LGUdzf
         6oXhkBxF8DWSElxEk9WyqcUScmqhpXzhEIQVKY4SBIZzF9hNJWJF6pfR8J0QEX4lLILv
         joUyj/gZjT2gIbSozDv8tACCttoKnxQ/jqv3sZ2Vv8Ts20Vq3k1L4l5CSk3m6Gjfb+bs
         rjbBx27DuQaDNNExPPg/3M5iLPikr1xK3JeqLwXPp/Zgn2edmi7s+vwTVG7qZxafz3Gk
         Ddfg==
X-Forwarded-Encrypted: i=1; AKwUvBxEYZCXrRMTHqli18PpUhvhDUX1BZhxGU2w+QGw/5sOgtKk1bJahrRUPPian4OQWlBKbsBxSpd8YnfwvgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0B464eMo5XS+D9Q7TlMFCdo6wxLN2UVnYbbb7HAM5YGObfYbN
	TfceeG5nnyuR2GdmKgbySa5F7t2DBKlwqvlgjbdVhzmjX5OBTOWdkSf/dPft/QwNPik=
X-Gm-Gg: AYBFou2udSux3W/ojivwXsecsZNmMqfKqX+nG2Q6t6DqNb7TanCFgD8p+amUugxzNQz
	8mNneKfQ4Wr1UlvHhlla86kgMYDF+bkooH4MDT9/A1+MDqOtrZql0G3UsVOlt/rQazQFD6f3dum
	4ytqdry/2DfSr24pnRu/UK9eezFMxahjVyDLFqdQpdiF9gGS2ZfZPvA4aAQnwRbsKeux7bwv9Mv
	E9K8yaX2fkbAruxHKB5lai1i+jMhz3k2sBaP0cJ0vTuvXOM72EkKccH4ZNio8ESqeF/ysmxqF/k
	sYm10j1/WO/KKTOKiOWLldgbQJdwYO9DHLE7/z21PzoBl9UVDm7iNskQvX2fGZTkbxLMflCgxVy
	WuoDPBESpIac/2VQko8OY2Jry+pJreDx4G20laZEGyEHlJssMFP+DbfKYD82cJxX+F396EtOQt1
	A07Y1PEfeIUZ99qBTaaHbyR8pGHbq9XaCz9CPgmyXZHbCLp9Zan5eKcJv0eD+5AHYYnQXt9bc17
	Bw7tDJA/njwBHZyPzEw995vwUOqRTSFnuOMT5FW3umtgV2ccAChCHmsCyujgPZqL9VhK+qFvqIz
	HfQ=
X-Received: by 2002:a05:600d:8652:10b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4a2526bd7e6mr10768065e9.0.1792767906491;
        Fri, 23 Oct 2026 08:05:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064ef6esm10175585e9.10.2026.10.23.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:05:06 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:05:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Harry Hsu <x90613@gmail.com>, jpoimboe@kernel.org,
	joe.lawrence@redhat.com, jikos@kernel.org,
	live-patching@vger.kernel.org, shuah@kernel.org, song@kernel.org,
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] livepatch: Clear relocations when
 klp_apply_object_relocs() fails
Message-ID: <att3oHvCpVDjDt-h@pathway.suse.cz>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-5-pmladek@suse.com>
 <alpine.LSU.2.21.2609181554590.21788@pobox.suse.cz>
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
In-Reply-To: <alpine.LSU.2.21.2609181554590.21788@pobox.suse.cz>

On Fri 2026-09-18 15:59:59, Miroslav Benes wrote:
> On Tue, 8 Sep 2026, Petr Mladek wrote:
> 
> > When a module is loaded, klp_module_coming() updates all enabled
> > livepatches. If an error occurs, it delegates cleanup to
> > klp_cleanup_module_patches_limited(). However, this cleanup loop skips
> > the partially updated patch, leaving any changes made prior to failure
> > unreverted.
> > 
> > One unhandled failure path occurs inside klp_apply_object_relocs(). On
> > architectures like x86_64, apply_relocate_add() performs a verification
> > step using memcmp() to check that memory contains the expected relocated
> > or zeroed value. If relocations left behind by a failed patch are not
> > cleared, subsequent patch operations or reloads can fail this validation.
> > 
> > Introduce klp_write_object_relocs_limited() to unwind and clear only the
> > relocations that were successfully applied before klp_write_object_relocs()
> > encountered an error.
> > 
> > There is no need to clear relocations for other objects in the failing
> > patch because klp_module_coming() operates strictly on the specific
> > module being loaded.
> 
> Hm, I spent some quite time on that and I am not sure if I deciphered 
> everything correctly.
> 
> It seems to me that all error handling in those paths you are mentioning 
> above is correct and the only problematic thing is that 
> klp_apply_object_relocs() in klp_init_object_loaded() returns ret 
> immediately which leaves partially applied relocations in case of an 
> error. Following calls in klp_init_object_loaded() go through err: label 
> where klp_free_object_loaded() is called which should be fine.
> 
> Is it correct?
> 
> Wouldn't be better to be somehow consistent and clean up right in the 
> error path of klp_apply_object_relocs() call in klp_init_object_loaded() 
> similarly to what is already there. After all we want to clean the object.

In fact, this is exactly what klp_write_object_relocs_limited() does.
The new _limited() variant of the function is used just in two
locations:

   1. It implements the original klp_write_object_relocs() where
      it is called "unlimited".

   2. It is used recursively in its own error path.

I did this trick to avoid code duplication in the error path.

I agree that is is not obvious. I should mention it in the commit
message. And probably even add a comment into the code.

Or would you prefer another solution, please?

Best Regards,
Petr
