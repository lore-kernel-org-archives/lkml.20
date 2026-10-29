Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300056;
	b=pgS0G+3x/25L9rIliw4PJ7Of/WrBgTkH2DXV/I7OA6La8/hvSwqCQTpuHydjBhtd/8/J
	 CEVYzbazenDCQ66ztKcxFLqUd5sWKfaxIgC5WeP0+QD5NtzMsHO9fNVX4MIjnQvR9qM5d
	 DKLcQahAO29lMDItUS6mZMgb/65SXd3bgjkCm9ci7FULPJ6dfWNq9S1lR/hwj3fbGsGb8
	 Tgh6LsdV2fB2O1dPZuCS/jjbS4VIzuQKBQkI6/90PD7COxDk7pHGg9f1XTDwoyJMvBd+T
	 mDCJxARSaTcfDYy0Y5jdevzO9KovP/HnOuupdzOmXKS4f5jeCfBuEJNKEolUMqC2Lew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
	b=xxWqhQLV/riP0cJqYfc8rV0sWlTi3JoYKvYZfvi1gCMGxC+McYHA72DvDynLs0gwyMxK
	 0F7sZfUjBmGFxzC6pADzpx3kllYI4oZvtujw//otQhrWZHceI71+VDhNzz80haibuGXO+
	 0fqoiFezUvirVlBXUF37O0cgbJjY4OFhrQuTdARx6LFubc8pPg9K7MrX4WjY/JIDD7AlM
	 TwO/DbF+rgx/MtfMwEOi1iqzPEbJx+qMGMLQWSKdeHq+jziP7eVjTncOIPNN7xD/ly3ZI
	 WkXYsvzyS+tqlmX95bzmW7cUVFbeb9AnqdK7DI102DeBp1LJfqIyYeC0340Qlc+hfGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVxQMUgD;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E60606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVxQMUgD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23255345e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300054; x=1793904854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
        b=nVxQMUgDsSBKdfqHwndufB1CvnMaDscm0aybzlJcUd08ItQqqoFWqs8bhmvozifhyj
         MOOyLKlHXyXFn1RXP/XeFopfBrmC3pypD7Jb2erN5UQWD+T+2woO/pSUF0iiwIKyKhzW
         EgM8obTJmBD2ofAzBIUw6SRipwXSYR5GMkvnVLaui5+ovnG0tNXPJ5Qf/L62Oqitom1l
         XFcp8fIPkJmy5Y0J/0FL4WOsfUf2VxJkcPArXUrY62X2dvPrnIxl2jRzAYsf/UprbmHq
         b7qVutm7cFiGhpOjvNjulEC2ViGZR/neVi12osoRV24MxI/S4s1Vlji1/LO/sucaSlDA
         0IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300054; x=1793904854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2f9yjDtn4qVGwfpxSmxApio2CtMwg4OAoVcrGo4ihI=;
        b=hbXx6e5NDrQFFkMyAuTm7UdvcSocmgWaStZJz5bz5uBaoeKusU26wms1GkPiMIginK
         NwBW2mxsA5Mhitki9Vb2xR5H3VY4P5eGrxSULgw7eS3HGGq37KpOl0YMsl/91QaSpZrU
         DFpNXkdd+P2ExKQMjQKCHyBlhghu5gVEH+ZWDdsGJ3STrAVqxVI87t04A1oa4lPKHsG0
         890h5XX6Wv9QO4gN4GWgVP0Epfp4kOwHhvHj3hXOm4fTtUuD+vA2qKvoTDOnGepUcyzq
         u4wBfPR497g5T6vNb0rJNassRa1v92QdWRu57AK4Yxi8wcY9s6x5Fyw2f2RXfbHHKHW1
         ZbqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXC4YyDNEZHtiuOtCFG+y8ejxdknRRR8ko6PIcXojog/BLBYgfHmChElJd1puOAh8Vb13E/JCyvT0Z5qE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI47U4PEZ3ZhrtaPxGKNRuGKef1a0NRjvNt1wjVt4nrxxFx+kF1
	TeEHW3tkOLdBA4BOySxRz8dXInQsxraoNUk+fTUYy735zNW/m+HKYtI9
X-Gm-Gg: AYBFou1y89Tg4dRa22Tbj8DQExyW/SKUPkFj/z/LVrIxKG71wMOV9yKTwdY7Zg7PT3/
	r+N04NxwX3snPOoKrp8cgYl/cIskSaKe9Otqk6HMLITexKcFcnVs3tIPSB4b6dqbgk/gefzUNKr
	2ktAzk6CyWZHDzA4lc7/lInv2RsBYx1M+tnyrrGTsmEDbJ2+pUCyoFYqbxIHo1ZF4ZbtMq02z2C
	Dp8RY94j+xMJzhGBhHzc+tuc8d0tKPFUVuT1tT2dkPk6PNHaqnPv7WrRmEm/Z4uQfDp6mo2U6Ai
	R3ExWPW8dbRm9FMLJzqvCQNc1aOhxJa2Dhka4ybfh6O3K98gL3z8wyRd/86Q1g7p0V7rjQPbBcF
	/9hvP5YH08mJs4EqZmbACgwaRqwbq7+Y7GeGEHJExw6l57LjMeEVn+uYL3aQTP1E1tjsAiItnhk
	m6fGIroPP9ydhRVKoWH7KtPyvkP9fqVuYYLp7P45a5RQY5xM2kJgJJePoVz7NNVur5A6kIr/ErE
	CaF2uwRYKma5CFuhDljkFLceoFodbiAYa851tp7hTZMPhRYCB/lx9y+LduNyBeM5EBBtjx8QSun
	Z1fUhuaF5t1/r/dsaZWfZE9fu+DPckO1uISjfwYppnpYXHkjZbmSP4oX7elqdygEotew5Zj42NG
	+VrmGJshILLNPlI2WUiZ8wxHIAAaqeW++SE/ow08c3c6IH2ihAFUJSMxs0+ByzKCYIVj4Jv5Mq2
	sR0eWQhdON5/sh
X-Received: by 2002:a05:600c:8b78:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a9672fa52cmr143011705e9.27.1793300054062;
        Thu, 29 Oct 2026 11:54:14 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm79436125e9.2.2026.10.29.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:54:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:54:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Odin Mirdamadi <odin.mirdamadi@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fb_tinylcd: fix alignment checkpatch
 warning
Message-ID: <auOWUsL9nt8d6T39@stanley.mountain>
References: <20261029182244.173276-1-odin.mirdamadi@gmail.com>
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
In-Reply-To: <20261029182244.173276-1-odin.mirdamadi@gmail.com>

On Thu, Oct 29, 2026 at 09:52:44PM +0330, Odin Mirdamadi wrote:
> Fix a coding style checkpatch warning where multi-line function argument
> alignment did not match the opening parenthesis.
> 
> Signed-off-by: Odin Mirdamadi <odin.mirdamadi@gmail.com>
> ---

The original was more readable.  Search lore for the function name
before sending a patch like this because maybe we have considered it
before.

regards,
dan carpenter

