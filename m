Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF449E5F1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997613; cv=none; b=jqxwXhq30NEJOfkoT29Q5OlVZiyf5F7i8KgHSP9WiYJGq3zNv+sS6wGJk9/My02/k1X+lSwjU0DsrFOrJsl9iYM1pbJAAtrW1DNd2JLS8uVSKZjHfGiZAYl3lBNnrPKGQNDws5/2tTuzWUly09LdI1ROUTY6ZJkrOkJKd1xeQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997613; c=relaxed/simple;
	bh=A9wcNuC9U23eMCWltny9C1/4A+hHO9hclqKdjl3fFpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFH6bPcRKM3vXTAyWbW/83qW6UiDU5AXcHP9OfS3UdJyxkfHEd0h7LmDAHBkvjkvz0t78Afcp5cNqxMMk+f1IppenkwUXZlMbzcKimWQfN1uYkObH2g2E92hwy2gwMJcUIxZD1K4Y3yvzJ6DHADJZ5zakzWs6noO9iYR2DhGd54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iycBymeK; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iycBymeK"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so447329866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997609; x=1790602409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTnU8avJKar63dWMEB037hHMHXQ/IELuodQg6fpsYos=;
        b=iycBymeKIXtl8mOdnKsW7v/neMtweuNvg3dzhms+C+QuPIYxg8rAW4wHgbLk6pSJzE
         e55O1MmjR5q7zOTnBPZs9aHLa+rm93z4IV8J1PD3kc3s946H3VaGKFprpjBtzUrAKExx
         xlSEimk0Jm64u0UwQ5mVQNlxq2EdZ3efIgixcbGJWmfywahZ2CRGaX+UJ0Ueq8/4ux3l
         516bjD4xE3fm1Ldjw0QZO7ObpYra/b98SCKR/ku1A8G5LKB7H2nRL2t6K2qOD4sIEf9H
         eDs4XymsI75Gx10mxgaBOEXg42X/k1Q+ejRaGxyG0coEij3s2tCC1YD77rA0UdvjFpvh
         1H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997609; x=1790602409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTnU8avJKar63dWMEB037hHMHXQ/IELuodQg6fpsYos=;
        b=ma2QfqpEr0nQg7OGw6h/1z+XCj63lnfkt/Uy47a6LCkkW8DASMZKxLNAPFDXytrs77
         3mkogCe9rg3/rLeEKWuBXZqIke+Q3DQgThBz528YAV9e3QZ9wRzzcySrWT/1et91SknZ
         SKz9OqrRqjVfZ23N3YsGjBpV/yoS++HqnpAtMf20TOYYOKXlALUhoxxtQ+aPbZW/AsFV
         RJuJ0UY7E07KV+cOOr9fmeeiYUDxcXHX918wGRzajMoOqjorusJlUfO/9S74kZO7ShIs
         tOOToQ3ueSEOVjztPytfXEfpx3Hv3WF0t7f2vhC+DEiEVbayq6j75QUkiTz6ifVMfw6v
         YqCA==
X-Forwarded-Encrypted: i=1; AKwUvBwlK+TYlUpZA0wcYWM7Dbb4CbLOpH7LalBuBKa0cD7sLKd9hyiuZjZqQP7k0Bywrmli+R3vCEpQcJiNEjc=@vger.kernel.org
X-Gm-Message-State: AFuF++nyZq0JN2qVz4N2WH3OaH+iOeCO/nk8UzYjwKuSbsSLFM9G6gwx
	JRwSSaGmx/CSmuaw34m4yIMBBX/DjVzygtBftf9QHwnB39ym9v87jWBA
X-Gm-Gg: AYBFou00Wh+98xshextE4BwFoLHolzHxnEl46GwuKKUDMQKkkrWekvVQeyrB631UoQt
	qw/0FDh2XRamKJYn8IFctGFJkLB7b2yPEoql2VDShNDzT4elRUplQF3Dmojs8RYqW6onD5pndIv
	zGtuTQLtGxJluZRrjTGf4eMeu+so2w51SIQl9FRO3Vfe+e5/5Zx/EyY+u7VyDrQ1RAju/N4PoH3
	irtTzZ0q00YK2EVQ34rGJG2pjjdrn65IwoIHKaXjFT6hLR1axCXNUv5F/XtkQNY/MFqPH5h95Jg
	YZ2+swOhANaYkjli2pA8BOR84/zuXBgaOou4BrGZq7yaFMXSS/0zaINL0r8R5rvKC9s88Ke/GlD
	1hixGHVHUpbFRmdQou2PgS8NHazsCnRHP65SRbel8vG86dw2pEzcotdKgm9sAR6T9/wmVT3lGOO
	nfAfraIE9W9v60WH1z7U6pyMjD1zVVw3boGGrXtWYtucP74kNVdkAsenXJYJCIAQ8/Y0LQzjYdd
	JqU5Q==
X-Received: by 2002:a17:906:c10b:b0:c26:19de:9139 with SMTP id a640c23a62f3a-c2a15cf8ea1mr1009022566b.44.1789997608820;
        Mon, 21 Sep 2026 06:33:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358e31fcsm300270166b.59.2026.09.21.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:33:27 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:33:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: ardb@kernel.org, ivan.hu@canonical.com, ilias.apalodimas@linaro.org,
	mingo@kernel.org, matt@codeblueprint.co.uk,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] efi/efi_test: bound capsule_count to what the int loop
 index can hold
Message-ID: <arEyIsRJKRa7seUh@stanley.mountain>
References: <20260919192410.272516-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919192410.272516-1-meatuni001@gmail.com>

On Sun, Sep 20, 2026 at 12:24:10AM +0500, Muhammad Bilal wrote:
> efi_runtime_query_capsulecaps() only rejects capsule_count == ULONG_MAX
> (to stop "capsule_count + 1" wrapping the kzalloc_objs() count to
> zero), but then walks the array with
> "for (i = 0; i < qcaps.capsule_count; i++)"
> using a plain int i against an unsigned long bound. A capsule_count
> between INT_MAX and ULONG_MAX - 1 lets i wrap through INT_MIN instead
> of ever reaching the loop bound, and capsules[i] with a negative i
> indexes before the allocation.
> 
> kzalloc_objs() would have to succeed at that size for the loop to be
> reached at all, which bounds this in practice, but the check should
> not rely on the allocator failing first. Reject any capsule_count
> that would not fit in the int index up front.

No, the it's fine to rely on kzalloc failure.  Don't bother trying
to silence this false positive.  Fix your checker instead.

> 
> Fixes: 092e72c9edab ("efi/efi_test: Prevent an Oops in efi_runtime_query_capsulecaps()")

Certainly, don't add a Fixes tag.

> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---

Regards,
dan carpenter


