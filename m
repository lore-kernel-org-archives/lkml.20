Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662505;
	b=fjEGxEag3DuytJ5i8Gws9fdrb2fZlwiKlE9bOv/ag/6VHeah6jBMa1L3N9BonkZ4lvjK
	 jOhsU26hv4sj5lFIDVUt49NnpG0oJ8G/Cw2gbfbBSUmwuKyxqM99SRY9m8113PGa5mTWM
	 QmF1X6H2J7CSOR2eM8xIN2SMZsXp2JZbJwIXcu0qiHxMuL1K5lStra1XSCsfFTgVkvBVH
	 VXz5F1R8uZXaFf3c5tC/s7hnahrCnpLusOQrPBSp6vCv7bX+2fZNL0qZsn/jDJy2BajrQ
	 suUI3T36jEyUJaBn90swWzp77v/sZlQm3pol/8Lp6MCwkR+FWDBkvMnT+mex1y6lBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UVRUaSOjqCFAss6x/sSZJpZicPnalYrh3/VGGyvKMmg=;
	b=T1BplLhzxqw5PcXvnrJ9YaxIx+0TorYz9aVpsTbIOJIxqTH/EUvEkEMMBHs7FDrLd4oT
	 3AnJ4hql+8f9M+kjE5pH5TgkbvvtM1Wia+lejOOWDmuGPU4URRrKRVapgOQ+i/f0txV5N
	 K37uo9YYICieCoww+sDRVOwYssWe4raAEJjrY0U12uyA5fHjvvEbAd19qVAZglYMVk2cb
	 NkFR/SbD3bkfhUFw9HIPl0fehYrJy0U0pNEAI77XjWrZPp/WZ5A1N7c8NlWUiFgAmjBu8
	 4hQxBF27ol63LzY7pZuMbTY/BJqNmGo/fH4hErIUunpR5u2v3tPKVyEVR6fqHmeykWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=laVkdmFd;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88175606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88175606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=laVkdmFd
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4919a880834so924751f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794662504; x=1795267304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UVRUaSOjqCFAss6x/sSZJpZicPnalYrh3/VGGyvKMmg=;
        b=laVkdmFdYVHDJbi5ZsLuqUhO8F1svJWqlGwWVYXwyErWftMsvQE/Q4w7pJCY4lmacz
         b+7RQkmnG7xUYwFIp8FlSMgsostkpCFRo4SrcOPCfWR5abwvrJ58hk8fLZhL23iger2q
         3ddGV9es31M1fAnBQRIk+rjwHumrNmDz+bibn/e/qU746oSfkwcmJp/BOBkL5teXQDZ1
         qygK9qspDl2VDg5g7YdT3PlZYXe3SISzkI5+4uGyFbpFLHZ+uAgTUZ2lwolmKVbTEv0x
         i0W/Zeqf9DkUOwUP0e9/g7Fc5EBvvjFWAcXa5yHhc4ZNGfvE8L35an7fD9vNTQFfEqiC
         wAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662504; x=1795267304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVRUaSOjqCFAss6x/sSZJpZicPnalYrh3/VGGyvKMmg=;
        b=MShg7uKxq41SovATeWyuUC0CbempPF7qxAOh0U62YrU9wXgqiC0l9ml2F4anGD/4nY
         GY6w6IgEj330pJ/RfDpnT/gaQQLnRxBOr9qPvXZj3Cu/4UHxFoScvvQyiXqRh3opFbO7
         3ASQDS8lXqT5Oz043vgSGLzEXzaoDdmMGfej1G8pt71kqolt/MUORTxuiroGe4ZUaq0G
         vuECZ7sUkX+7S/XCZncZmsjYvPrBXDpSimiWW5Q6xEERtBCVGu/rtor0CHHiHKouGHQO
         M3HhxB+njKYmC04eS+5uSOjlN+8UvGtqcohtSzRUfwfcgu6KoWOH2LyHCa9dsP821mUn
         F+0g==
X-Forwarded-Encrypted: i=1; AL+hErGZo4+rYHp9aO24VAcGtBUkdE2adqCWEHswzq4gJhngq3bolnBBQ9t6T5LTUCl4BrnY1lmnloeHwDxVxhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C14VxGwV8Q+pL+/PWhelq8OEu82cuv/ZAYlINPvFqnlFtg7gG
	8rgrc6Rc2bSrWth30rE4NyxFZit5lvAs+XaYs4GnD6+rvoqL17/kYJwFlleWpO5ptQ==
X-Gm-Gg: AYBFou3JPchymEleGv6aT7tqMW0n7djytk8W50lfOnNJmK6mw+ZwYmvUAp0NzPumX/P
	XKlACLicp+95KLc+ZNDShQI0KMKWiLHBGWyDh8HhsKU0OeO0J7M7yHZO5gOBGYbv9Fi0x/lBo6Z
	q0utkE90Lzd2r/BYHkbpI9pygyRapNxL4/XWtGEP6amhDYEYuWhcH2vDzZxYpMUgFHkXUYGGhu+
	tENSHM0CXcFFFxf+mOnIl/QWGEJ9eedlstfNP3bM1CYmrr8mibGgLwexR3QNt4JaVADTH9NZ4ve
	pinlMUP3EhDE+DmTsY3ZvTRUCnkKgL1GB3SgAwoZqe3sG0dfax9dvtUqCRQ96jtxUzJLq3ZNXUq
	gnR5UG3PQh9q8nSIfVUpfUUCo7qhiuTHBQs7fsKCRS2Vit7cGkdW523ouaarI7c1PP9Qtkuc5dS
	aZLrtoNTXbylk/V12iEMcyZXuXhCu66SzAbCx4hMPqty5DpM47M9OIJ77l5gOsge/70bsTVK0MG
	xEarpFFjeuDEh7jtkgkoaMt5yhWb7OO8CwXaxY7PLeXWrxykn/W1BWXJ34rP2Mx3GD7sO8QiBNs
	j40Xz4k5AI7wII/ZPFNupmUgN2zwl2GVKAMfJF+yMgk+oNGwmA2PsBoJG5wQS9rc6A==
X-Received: by 2002:a05:6000:4712:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-49c73164e84mr11262565f8f.53.1794662503294;
        Sat, 14 Nov 2026 05:21:43 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2cd05sm9811080f8f.31.2026.11.14.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:21:42 -0800 (PST)
Date: Sat, 14 Nov 2026 13:21:39 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Joe Perches <joe@perches.com>
Cc: apw@canonical.com, akpm@linux-foundation.org, elver@google.com,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
Message-ID: <avhgY9t0KVkDfEZw@google.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
 <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
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
In-Reply-To: <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>

On Thu, Nov 12, 2026 at 07:32:14PM -0800, Joe Perches wrote:
> On Thu, 2026-11-12 at 15:12 +0000, Vincent Donnefort wrote:
> > Checkpatch doesn't know about the context analysis attributes and
> > misparses annotated declarations (e.g. mistaking __guarded_by() fields
> > for extern prototype). Add them to the known attributes list.
> 
> Nak.
> 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -526,6 +526,25 @@ our $InitAttributeData = qr{$InitAttributePrefix(?:initdata\b)};
> >  our $InitAttributeConst = qr{$InitAttributePrefix(?:initconst\b)};
> >  our $InitAttributeInit = qr{$InitAttributePrefix(?:init\b)};
> >  our $InitAttribute = qr{$InitAttributeData|$InitAttributeConst|$InitAttributeInit};
> > +our $ContextAnalysis = qr{
> 
> Are all of these from include/linux/compiler-context-analysis.h ?

Correct, except __rcu_guarded, which I can drop.

> 
> > +			__guarded_by\b|
> 
> __guarded_by takes an argument so it should be
> 
> 			__guarded_by\s*\(.*\)
> 
> like the __aligned use below in $Attribute
> 
> > +			__pt_guarded_by\b|
> 
> And all the rest of these entries that take arguments need to add
> that same '\s*\(.*\)'
> 
> and it'll be fragile besides, multiline uses likely won't work,
> any use that has another internal () pair won't work, etc...

How about matching one internal () pair?

__guarded_by\s*\(
	(?:
		[^()]++ |
		\([^()]*+\)
	)*+
\)

This would at least cover all existing declarations.

-- 
Vincent

> 
> > +			__rcu_guarded\b|
> > +			__must_hold\b|
> > +			__must_hold_shared\b|
> > +			__must_not_hold\b|
> > +			__acquires\b|
> > +			__acquires_shared\b|
> > +			__cond_acquires\b|
> > +			__cond_acquires_shared\b|
> > +			__releases\b|
> > +			__releases_shared\b|
> > +			__cond_releases\b|
> > +			__no_context_analysis\b|
> > +			__context_unsafe\b|
> > +			__acquires_ret\b|
> > +			__acquires_shared_ret\b
> > +		}x;
> >  
> >  # Notes to $Attribute:
> >  # We need \b after 'init' otherwise 'initconst' will cause a false positive in a check
> > @@ -551,6 +570,7 @@ our $Attribute	= qr{
> >  			__ro_after_init|
> >  			__kprobes|
> >  			$InitAttribute|
> > +			$ContextAnalysis|
> >  			__aligned\s*\(.*\)|
> >  			____cacheline_aligned|
> >  			____cacheline_aligned_in_smp|
> > 
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
