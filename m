Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814043;
	b=wDAaTd6O22luNGJHavfzJz7R9yyjCdH0byF+6OghrRjZKCSAS1j5ih68g1tQYenEPqJa
	 Y1pQOAA7ouGkVpwzE2AH9jfiPlDRflU90JTPxkBINllvQl4d44C36x5sBwhK17FK5L/Cv
	 giD0BFFoSKpmXXOZsnxAmiH0SBBndI9AITWdaoYPwCFgN5i7nyFclYTppXfgJDam0JLCI
	 E+kz5xtcC3sSfZvTIeR1BinNWV8MLbtd99O/SeVDkHArzOmHOzKNXj5erA3ir31PWj59n
	 OKOtFBVrFzWQi1EsErXgj929/tBMqV7ywDL0jADKj1YXIVZ+CKBgy7xwXJPQebnQ2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YhtsBhvAospz3gnGs+ngXfQiCOJCp4pP7kl7qhf9OF0=;
	b=FUBfg99FG4kuthCP7Ix906NqZ5UlyXtGBQyzapXzdMRIbwnTmxPJEtxDYDmUrcSzwqqG
	 B+UAFAOKfF5j0PHdYPsZZ0nO0Fkg2jPoQXrHcuTDi8X/188iqTY79ad82eQEqQttSsE38
	 9CztHBXUgKFK/FW79OSS/7bbwSqVcsHUlOwSuBOmc/4xJnzX04Jp/dUu2rDw+jfLb2b2w
	 bPW2naa3egq6Ew/ITnzVZfE1V3Bsl1u3GQZzFXjuM2ay2D2cp4HGkT30UiWPpGh0TPsr2
	 ELZv2JbSJA2uXAlGCI1ltQ2ihl4NM3bZezkb1XmOvvB/52a+jNo+UMQCN51+U38al2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hCETnKBj;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10149606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10149606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hCETnKBj
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e64d52949so86176285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793814042; x=1794418842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhtsBhvAospz3gnGs+ngXfQiCOJCp4pP7kl7qhf9OF0=;
        b=hCETnKBjmqap4TuILlk1+y/t0ff88T9bZ+dOuwmLpwI6VzqQXi+7Ew1fUV0EIAA1Oe
         F8n5/Bs8WbP5ggdzMFDDPirWaPqIAx1iA/mDgvVJL7nQofjclhAmGbrh6dLRfzskNhB7
         ZczB48jwVorfxwOqKyEaj0deWOyd2jxm73M/SO+t68KSEg3LRDOS8txtRYEIGFQ/wO9F
         AFPz8T7X6Dkf0onwwvqIXu+u89B6aWxxrnvyvHPOMy6hW4tHhDs42P/YG+wJPPJAP7z5
         +htRw9gum7ooVb0W++2j2THOtF8fcc+b/xcGhtRsZffcGxHM6VTCl/yRyTyEigEerFK4
         CWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814042; x=1794418842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhtsBhvAospz3gnGs+ngXfQiCOJCp4pP7kl7qhf9OF0=;
        b=19CNvxxJ27/fv0F/6h6gMk+1i1JUwRDpazfiC5cWzzrGHorYMLFuP4ZuyFd07h13hH
         im1F7ftao/6E6OcwrWnELEwpzSYH3kCgXwQz2K5g8rqvuNgJJyxqDRXl+Hp7Zd7pCxCU
         08Od5DX1nS5THAcOQljSG8NGZaEoGU90Tkag04y9+7XKjXHZcfT8QTBAHJOgUQMY3jl3
         tOLOy9+lmkiQTcatfrIhBXNEBFP5Lw2DJ8tDnBp9eEq6LHfY6h+An8oIjECmNBqQTWgK
         GfUQx6LE+mlzhximfFZOGf5+buvjOMuZ4tCTauqlc+PNTcn2pyJa+43kKohUPLZSZ3w6
         qqEw==
X-Forwarded-Encrypted: i=1; AKwUvBz6Qh8lKjy8K2zy0tFjspsqY2TyKtKxM48Pkw4t+OXb2KJ+fxZxqFfjWz/Duzcz+15vzjq45WEt8u2D6vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99SaicUkX2n84BuSAduclX9RGVZ4NZviTFb9fqsTVDkOCEn9Md
	XAZPaJ77iRVj5ZsiBJSEQwWtXaId35NWbDuVKv3oepVcFs4V6tPofK9rOPhhm97yOmA=
X-Gm-Gg: AYBFou1/r8h5IkiN8Q+652oPue+lyL4d9VWQDyjaL0XCtmpvkjDyK2eTB6gCTd9uv9s
	kj5SQQsJEZ4LUvazvneeUMFWSgDiX3AVOLtUW8SrY0oNq6OgYQfoPe2aOKhEtOi4cjAt98tAERN
	9gP89BDO6HutLRwUNL3ozF45y149pcdsX8G5ZQII7+MF8Gg0YKZ1vsnx/TGHuvfVKmZ/824WLdF
	ujOs8WPvsOVIp/bOEoeGg56No9eVXuIMqAoYrfgkcM+C//Fb8iurssDdBDctuKTGv6l1+2jUOtW
	iak7e+fg4D7BFOSzKcd1ENHDREnS0dA0iHNAeHmfDHOXphTMkKIgNcicTp4Pq+nwz6eMHsOU9pQ
	0ue83cnIAgc2aZ8vaEZ8g10GPrcY4aDfVY2NojIA1QnQ7xhstw+ZKu080bK5fiSKO++i2LEfUsH
	o2m5SdUsLRlCkoD3kmDDLkD/S93nCNR1rzeeJOqTPy4Cwtl++VzWoQ/6S/MHIUGHqHs6Cb9iBaI
	KWOgAHWjFJQrWr6QDDwsBxVRs9340wOxcmadHpRbrsWHyPr2bgEmf8wweoitL3K/JmJ4FGmHpKy
	e+ct4yf4EyXAU7LxRy0vqsSIcSGyARpvPo/arWXXCB8Z8h8bf5XQvyXnoDMF/VOZ47jFgEPR6ZE
	eHtKrNGea4A==
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr2734997985a.47.1793814042031;
        Wed, 04 Nov 2026 09:40:42 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfb3aadsm24214876d6.8.2026.11.04.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:40:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOeyX-0000000GzI9-0S67;
	Wed, 04 Nov 2026 13:40:41 -0400
Date: Wed, 4 Nov 2026 13:40:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: 0z5a <dezhen.lu@student.uni-tuebingen.de>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH rdma-rc] RDMA/mlx5: Fix DevX umem page size truncation
 for pages >= 4G
Message-ID: <20261104174041.GY3889730@ziepe.ca>
References: <20261103142804.67210-1-dezhen.lu@student.uni-tuebingen.de>
 <20261104100747.GD478286@unreal>
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
In-Reply-To: <20261104100747.GD478286@unreal>

On Wed, Nov 04, 2026 at 12:07:47PM +0200, Leon Romanovsky wrote:

> Isn't this fix enough?
> https://patch.msgid.link/r/1-v1-88303e9e509f+f7-ib_umem_types_jgg@nvidia.com
> 15fe76e23615 ("RDMA/umem: Fix truncation for block sizes >= 4G")

No, the long AI generated commit message buried what the bug here is:

> > -static unsigned int devx_umem_find_best_pgsize(struct ib_umem *umem,
> > -					       unsigned long pgsz_bitmap)
> > +static unsigned long devx_umem_find_best_pgsize(struct ib_umem *umem,
> > +						unsigned long pgsz_bitmap)
> >  {

That 'int' is an integer truncation if the page size is > 4G. The
entire page size path from the core code has to be unsigned long if
the pgsz_bitmap is unsigned long.

Similar root cause of truncate, but different code.

Jason
