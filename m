Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007006;
	b=HeYel71Px/OUj6JybVFumI3Jrmoo7MFep84Iokt97euQMsp3xlJhG2K6p1CnrgchcZPJ
	 qZDKy56gLqiuphHNPM9tbinrCa9Y66cSU/v5Rw6NY/Qq/YZHb02seQNdvCAZpTwettxyv
	 Jtd4MW+yBOsb7e8tfEccAUzaHyNKv92BOFf2uQfviwZ6u70dQuK4sOjB3b3leVpewgUZh
	 VZwMJD+4hXGDCgC9BmBfzuCs6JkwKVN0JwG3+Tios8IQ1byCrlt2ZZRUBmwdYz8CJEzFH
	 WvWYTK/Z96sUPGO+cLFM2iW4pJtSgjMermHvaP0NRVEHKj65Q3P6VfnOdfJmwS7z1Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hTY8VQIlE+Xjvg0Xp6QPO+Pn1Af1VD1rvxxNkn+l+OU=;
	b=IoSBB0xo8l6ODVkbA3FzL6spXmcESnBOSZ60dVpHAPfaM5W9d3w9AQQbyAjnegjCkwio
	 kDd/uLshNbArY3DkSyaCrBv8iVh3xO2f4qa1CwPmcBjSyTpQ1MSlVq+pCtGgwS1qz9Hqn
	 ewPnnCdkigbbqU70NNsz4WuFOciDPGh8J+v3VK4dG4CzyZr8kNayKGgXRnAgM5hn9Go+E
	 ABJ/uZzGjY11WLL8ziyBCAS5d/4w3Ks92089dKqLAG0nLM8TGJIgBASPnKiE9CC6x42j4
	 Wn9VZCFk++Z3xCrzmekDoUhCWsxUM3Wtk3nj853yuowSrNcVfr467W+rpN5Nn4nWCTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KNKoMm9G;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A31606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KNKoMm9G
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae378e2f41so76836a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007006; x=1793611806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTY8VQIlE+Xjvg0Xp6QPO+Pn1Af1VD1rvxxNkn+l+OU=;
        b=KNKoMm9GdSSemJHKGLoeohsnsg0ixA1NMl64D/Xh2c7FKtHknla26gWCSEmX9kY9mD
         /5tGTEQzM3p/ghxQr+uvSi8Th/3GD0RtT13QB4v82UaFH888dXuqagcAZ7+ZVxilF/u7
         s9bT1ENlFk0Fbtgn47cjpG35UYUFmaxuNtVJFpRD2MMIDhADhgOabr++4ZUMmdkTcc3I
         9gxV6AVOn7enmTZbjY/dMVthzsgFL9CWbYpIjIYMczFdk4NAx2eR8SNxDNZUToaORbXU
         nT5n6JWA32WiYsOJ9ElxiK1fMUSNYoOkmHv4s935Zkjp8UyqU0QVwWENLT++Nw1XY9Dn
         qlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007006; x=1793611806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hTY8VQIlE+Xjvg0Xp6QPO+Pn1Af1VD1rvxxNkn+l+OU=;
        b=DPu8cTS8RnQoLKA+/mDNLA1lnAAdKHppdnwBrzXtH9eO1ZIzIBMY4pNBrMg9CVr1jV
         mKIY5S9PmLWSd1/YPFlfZssfbE1fIjKv9Iglv4jCI1rrIcGWhVKkAcxJ+uGOd7+2fSQy
         eVSRIdosp6Lbq+tUsPGtKksSVcPYZDMNKAfLnTHGDdiXm0Me8g/IH3T27ae+mn93xFFz
         gbMM6CSfaXhlvb32I+F4/lqcRGOSdMmzQdzGXV8FGCC59HSNwqs0+KCfIkhml5beYHsC
         QyQlfvfKLT5AlMhhtu80Ef1W2E3vcI0Zi6Ji7EeGeSQYsrozYGJfHKU2vHpLiXKdOPx+
         O5CQ==
X-Forwarded-Encrypted: i=1; AKwUvByyGi+QjDwBn3ijiycXtF0+02rEaHsyKjtSXPvAR/NnNwE4YNFSLApWHn79g+CWQhJz5LwYxnycHTWOWi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgEUeBABc7fKfIjth0Dxp0/JD7IOfdAF66do54mdhhtD4mZbMP
	O84RI3GX1eG29VhT3S06sd/D1AbbY5ChqgWpwR48vpHj+9RcpBbpOjbx
X-Gm-Gg: AYBFou3uKkO+rv/EkvCWqcr4/Is3QcAd1V4t29mw1LPznS1UovHjFehnjICxMWiGNIu
	x9T/7xFns6PvJh7/mVLRUaV2i+a6aAdFxB3pLv0lU0ZTqoiSzD59HeeRK9OUYGnwHJ7OV3M/rNg
	oWGfpFSExfVY/Upp3f7JX3y6pd43jmb7FM98ia+Ehmfznhw29k39JauHFeS4wAXS8e2zuPljO6d
	1SCoKwhYWRiS5w00O0aNaKUodQ8zT9HCEbjrHcfcJAThW6ZpeG8b5Ut/+fu2OuSrxbhU/HyHJWJ
	4rg5IwykEOLkDAXzWPpNpJoDg9p504tFSjdfjsBfZHvQ19sYNcpC2h9mZp+h12hdwsgWt2JRrBM
	qD2CrzqbUkjG0chg3yelimFhWPv/lUDbfgx208rVzGxvJTBQ6G+eBCv9RKK1O5mVASGIGO44fUN
	6YB8k8ck+KuPsy0GLqCDQ4SYfsyS6I2e0nfqQx4U4TwMME/HQ00cLw3PIrAMZYejtc8Wnxof/c/
	0ae1WbxKx+VkhpywIfHsnUgb2M+81+1fpuPFPxTjtBPB7i2ECtoJyWtumZS7TDi4aCnrUZrp57m
	CzM5iR0=
X-Received: by 2002:a17:90b:1c8f:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3adeaae6ab1mr5668619a91.12.1793007005446;
        Mon, 26 Oct 2026 02:30:05 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm5436708a91.2.2026.10.26.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:30:04 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: harry@kernel.org
Cc: akpm@linux-foundation.org,
	cl@gentwo.org,
	hao.li@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	vbabka@kernel.org,
	wangqing7171@gmail.com
Subject: Re: [PATCH] mm/slab: only require the requested size when refilling
Date: Mon, 26 Oct 2026 17:29:57 +0800
Message-Id: <20261026092957.2305785-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <attrLy_Q-53FnjhL@thinkstation>
References: <attrLy_Q-53FnjhL@thinkstation>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 23 Oct 2026 at 22:22, Harry Yoo <harry@kernel.org> wrote:
> On Fri, Oct 23, 2026 at 05:44:01PM +0800, Qing Wang wrote:
> > kmem_cache_prefill_sheaf() and kmem_cache_refill_sheaf() only guarantee
> > @size objects, but for standard capacity sheaves
> > __prefill_sheaf_pfmemalloc() uses refill_sheaf(), which actually fills
> > the sheaf up to s->sheaf_capacity.
> >
> > The call thus fails with -ENOMEM > whenever the sheaf cannot be filled
> > completely, even when @size objects were already obtained.
> 
> This is extremely rare condition to happen, and so...

Yes, I went to measure the number of times of
kmem_cache_prefill_sheaf() and kmem_cache_refill_sheaf() in qemu. It's also
very low.

> 
> > This leads to needless flushing of the partially
> > filled sheaf in kmem_cache_prefill_sheaf(),
> 
> It doesn't make much sense to micro-optimize slab in low or out of
> memory situations.

I agree with you. Because it's so rare.

Thanks for your careful review.

--
Best regards,
Qing
