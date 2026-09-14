Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489F48A2A0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399602; cv=none; b=NJGiKL0Ra0zaTtN6RzUaXmkTlOjmBMi//Kpy0KLV1uNPAZ0wGiyKakGwDgYp2FCHpVgLKxHdErTAdTjEEh75j7W3cE8w1kOQ1RVqMtZK9SQzmQ5V2BUlnmyYKALqrvcboE/ChQNvsPyOvmJ3inK0OZUPSJec/Q7p6YJCJ8/uQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399602; c=relaxed/simple;
	bh=A+WJXH8LEWEmVEvHuluPt5ZSvK79HhNgL+/k4aL7GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJdR+4xyUq97KRXMKHgA5YqbMFX9GaLofJLCxf/Phkf9NIVQQmgX84p0xuaO8MceOAQ0bIvikMJzTandYAdB14JQ+WT1ZyCCpWcNthdax5+i4p2jHcEmChHeuEag2TWq7U7kV1M0K7rMt2VIsioBQVoAAyyIQ5Kzgw7YqEeDE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5rh4SYV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5rh4SYV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so23624065ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399599; x=1790004399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=D5rh4SYVfQYCkRVFKzGdB1L9V1OLhlOhCKclHkp+fpx02F4njrQeeIvyX4IjvkCoeN
         49UqSrnQcp10IlD0Xs4cpRY32d+DNCyFuq3RxJtRPQP5MY6wEZBAvX3hovhbeve12R7v
         yHHPP4vATJstE3HPnmqdMD/Df0viOU2smgRrg2FX5vjTT4B3RZIoyS4Y4m/2wtPgnNqv
         N+bJCFePE20bR6N2mPA5+hVEUi1AIFuTvS4g9sPD+tr7nsIKE1VUlz6MzXEILC7vrKgE
         iLhfMRVKMeoiAgUXinhCIck8ovROQigpouBcTItAOSRivEo99eVxvhBsC0v0wYbNk44g
         UOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399599; x=1790004399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSZQy8BrbphsTuB3PP3GNkS6dKaTus6BUKVlBhlcQXk=;
        b=DotmJ6sa0y9vuqwpneBvvr+x/FtMR90W5RK0nplKdZZv/jjhPIe7uLX4ethwY9tf7j
         PkxEQRES9hyy+LEx75slUYJa0zy45zsWA5uKsro9AAhofwJGPUx64bBpDEfXp7Mlfg7C
         Si4F0SCq/xiuOgyAQaxuHGULF5n65PdA8RAc5IZ1EEEKwZe3ipNgklwwr1Xhf0mzTxPS
         aUgfsguCHQfF3ADiFhOjxA+fQ1pQaT3Uy8CugHgpY9JhihZBYiEHzDFdB5TiDTc1oi1B
         g1jFy8JUchZeMcjjaMlsYmZwj/3VeUHpDnAL4NI56nafA1rb+QKfKn5H3DAJzJiy94PL
         b37A==
X-Forwarded-Encrypted: i=1; AKwUvBwC1Xt6rL1gfikOjSY54jjrvL7CV4wD+m0Jr7lxL2OJZuiEBQcT8rKH3jYj4SzFwwCYLepP/GMuV6GRgfA=@vger.kernel.org
X-Gm-Message-State: AFuF++kJF6lu51F0RB28/xyck30MKDPYfVWSlzikbsUiw/6DEgVKtXlr
	RiZxkCdmuxoeWx8mOuPlrVH903cXIhPECAlGXwxp9Bu0bD8jOIZrR7gz
X-Gm-Gg: AYBFou2EyCE2STW8XymRm4LfV9ZH4q0f3Gfj4u7FUdvHWW+NkUdF+xsSMyX9Mx7xDiM
	DBqk7ozj/ZKgqJhXvMybI7e/rUfX7jWlurqb05AUpQrzOeixsvvG/JeuSpPlBcqbgeiCzNvJkue
	FgzmFEn8GPSmx82Hfbn0dnXen3jERF+HaUMUWbEzpPM0cVjoS+PhgzPqxMIg0n3o+S6R+pwkc6L
	tEdOeWFtfhTnJ4UjvopmbQPxMLZv2rFQMRm9eL1Cn1RhoMc1YQ/IFiJaircQxtBA1d0BWhablh7
	tnk1i4LPc7qXlRVT0ShUXQd4+hIc/l2iFcIFe0ZJUTQ5xRmKuwnaR2CKXwPaw66mCCSiJXjDjUd
	tP2WY8a9U1S1WtY8Cax336TSyAXFHuE1sVfEqT7B2IcYeBaF08jmDGgMwWeVGbnk1aVqx9N+0vA
	BJxule8PywAXZphuvM/nPmwoazTbFCHnfe4LA04SCXd6xnWmuTOPfNra7usNa3fsP5GSYXmXZtV
	dEDWQoNj3wh
X-Received: by 2002:a17:903:35c6:b0:2db:73fc:b57f with SMTP id d9443c01a7336-2dd6c6c0cc0mr59735695ad.10.1789399599255;
        Mon, 14 Sep 2026 08:26:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm51211505ad.66.2026.09.14.08.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <35ea8534-5446-40fc-b1a7-72a115bc40b6@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-1-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:53PM +0800, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
