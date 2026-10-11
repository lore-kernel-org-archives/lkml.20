Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BBEC8D9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710059; cv=none; b=loQ0cQftDZbjloOPjq4LDoxNOjojO/Wk+j2vvmLRsniOIqObzUqlqdZJsZ63xX6Zr4RyraepKC0BKY3eZQCJHzi3ewRVGT8EBJU+fr26s+R1lXUwJzt3ET97SbE9pG6W2CXJhbbAdtCjQyoG974VR1Z2ZOEzlLjlFr06ifR/pV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710059; c=relaxed/simple;
	bh=fnspbfCcGV6mSBf+inHXyL2EwSxqPFcnpLeH6pQJXGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKFIRDU5UYyrAXKYwVfgl5cK7zOYEUTx/R9E4WVnxQ2DODsxIMPx/dQyOyPbWE1tERLgV5VLjaT50B8u/RUe8m3gUexj368g0+Sf8I7dWuSiCIQKrh7OO3/8RzmQSnHIl5R0/ZFaC4jMsy4TibaGDk7MvrsC/jK7EPeCD0O+kKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEPZmFdv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEPZmFdv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so1522367eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710058; x=1792314858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7FJI5dN/FyGY4mAC7187znWc+Enmok4bG9Rd/tePv0=;
        b=GEPZmFdvFJDaHfQhxwEi3zgBPWDkrqia5bP5tZ+UMSRuXmtZhGiye6dKXT6z4m3j9K
         ykjj7wb4noRZJOCUQawCujxwzKk9n52SziVlqB7w64fHK52zmB5x+sxYiR2D6oaiVuj7
         Xkv5wb27PJA/PEwKiq7Cd1Qcll+L8mt1EWbcUwvX5dwsAjqqs2jSLDmzHvLh8ykIr+iO
         ev/QJAHnsBK4WLzWlew+3RQJIKEpvwXzOeQ5rEXuF58s3ECNjHburhHrFDeetRcY7HDM
         nAuWFGEXNChxHlY7WPnAEZBpNOrVpnV1vfWAsWdY6IoJlaBCDCULrkyeSKl8CUV5+PVK
         CVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710058; x=1792314858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7FJI5dN/FyGY4mAC7187znWc+Enmok4bG9Rd/tePv0=;
        b=G1BIO3DNvbEJNGl3IR6UI2TT/9HFeDmPD/fm+nBU1ctD8FjRMQh0kzBg62pCGfJ18R
         KZuzuGc0auVQEIqLXbItIrTaCpLryuRxZ/a/8GgC9v4c26O/GQdrWvztsueCVDVNljXw
         KuOuY6qRan1kOKd0jVztOLjn3Qon9cgqF0Q/sztefu7/dt2UPItrwhrI/J6oxlfpFEfS
         vLE3KYxeU2J52USkcIc+epPMK/JZzBTdq4a9i8p8V1LarBX6YilUgxJa7WDPusHPw5kq
         tR9hQX9O7Gwtwpcci3wRaG8C1sZVyv6f8DFvc28zya1Znpft9s6zD+usNKEHQkLxdpTM
         xxkw==
X-Forwarded-Encrypted: i=1; AKwUvBxTWz7b2CQAJGo1heLEF6aZ0lTkhfkFn7oiln/mit4ZJo0s9rib47dOgi5rmjyej4kcjg8EWfS3crSUGqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7pMkgBQeTFOq01eSz7cqsArk7GVFHNEyjulgjTCVQAPuLC0j8
	TtfHAUe7OvHqPmzzibrdVlLSRT7UR9DB9PaF22Yyv/5/qMV1nzaGQO1izAcRww==
X-Gm-Gg: AYBFou1FvF5PR0ryOg+FOAiwUmplMKDpVCt7WwCEazgIY4WGDGRM7ZSxQK+LpchIr6Q
	0Dza0JP4H0KvzAAz9KBjzCfgzUCYQ2eTf/pxQHwWK34mekEk+csQRR75KfY/ImbwoxDe1oQhoj5
	XJmGwbX+4XWJUwqPukhtWbwxu2fqFMrNzwlqeun845q2Z3mB02HltzIAZT+rZmB1SqSzHiAdLS3
	N8+aYWCaib0acqRmM/mB6QQ56+VZjIN6DumEunG8CaPoZ8PX8mbmPdfD6mbRGEJBtIIFSXaJpbk
	z6A8EWfX7AWZnxiNMUNhUc90xB2ZuQIIAtxB3vW+EQ6dh0fV2pkUU9gFJlxbvL0RWDyvRYrViuF
	ETQRX1jUVZSoR+eW2z4C59KMIOIvX7g1BlECIIs3gC+h/h5oLEEyQkk7KiW2pkXbz1ol4KFRt9f
	BEU0zrHVa8q8raNJ0gMeJZfulC7MUx2k/qum40r0VS4vfxM5JneSTfgu1ffGrSELHPR9V3yIqmb
	dQAz1y+TNVSNPU=
X-Received: by 2002:a05:7300:ce94:b0:328:7033:9b8c with SMTP id 5a478bee46e88-3537e03331bmr9513887eec.6.1791710057560;
        Sun, 11 Oct 2026 02:14:17 -0700 (PDT)
Received: from kernel ([45.251.35.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm9822262eec.31.2026.10.11.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:14:17 -0700 (PDT)
Date: Sun, 11 Oct 2026 14:44:09 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: ebiggers@kernel.org, ardb@kernel.org, Jason@zx2c4.com,
	skhan@linuxfoundation.org, me@brighamcampbell.com,
	jkoolstra@xs4all.nl, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: sha1: use put_unaligned_be64() for length
 encoding
Message-ID: <astTYX3RBV44n2gX@kernel>
References: <20261011051524.6703-1-raizudeen.kerneldev@gmail.com>
 <454f2204-2c4b-43c0-8fd0-1eaa83186e69@hogyros.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <454f2204-2c4b-43c0-8fd0-1eaa83186e69@hogyros.de>

On Sun, Oct 11, 2026 at 03:10:44PM +0900, Simon Richter wrote:
> Hi,
> 
> On 10/11/26 14:15, Mohamad Raizudeen wrote:
> 
> > The rest of this file already uses the unaligned access helpers like
> > get_unaligned_be32() for reading input and put_unaligned_be32() for writing
> > the digest, for all structured buffer accesses. Replace both casts with
> > put_unaligned_be64() for consistency.
> 
> These aren't unaligned accesses, though.
> 
> > In hmac_sha1_final(), this also writes the full 64-bit length field
> > explicitly rather than writing only 32 bits and relying on a preceding
> > memset() to zero the upper 32 bits. The resulting bytes are identical,
> > nothing changes functionally.
> 
> These aren't unaligned either, and the size here is fixed (which is also why
> we don't need to handle the case where the size does not fit into the
> current block).
> 
> The get_unaligned and put_unaligned functions aren't used as convenience
> functions, but because the data might actually be unaligned, so we need to
> eat the cost of doing an unaligned access.
> 
>    Simon

Hi,

Well, you are right. My patch would have added unnecessary overhead on
strict alignment architectures.

Withdrawing this patch.

Thanks,
Mohamad Raizudeen
