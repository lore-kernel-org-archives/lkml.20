Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA932F7EE0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852168; cv=none; b=JXeed2WxSTn/AAk7wACINcPjhHZYXYrBQbuqjQ1kV6eaM7x/diiMQUr3xtmzpjnSLCF2Xqu6rCBX6h1OWipU3D/RpynMYhW3BOwpLqu466raaR26GLLXa0cGrIVPdFhtrhDkgq5MfFRO0YaNQqgZMUCXyFI3XHXd8+38X0HkBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852168; c=relaxed/simple;
	bh=5lz9a2eR7DX2zBjwG63Iv0aXfgNn41kdLdOuaCzbroI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/eAHO9c8Bev8rDWwk7ovzIrtw6Zcfdn+9rzWUsLhf6Sxf33VtXbtxzQupzqVnbibZ6XL0ztScpVewZ3XD1m0iCdPujRw0BdQXvk2lvxWkNZbb3GRCS/sUyUBOGtIzIjJ/0P/zZ95nNqSAdhK48EA1SQy+ZLFXxizN4bw71boXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMDyAjgb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMDyAjgb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso147032f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852165; x=1791456965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=fMDyAjgb3p/3ypjPCYxB41N1Ua0ctAOIoJrOtrJm4p701o5VX+jITqYo3zyJ05D5Ji
         IQ8eKIqfpxftBkpy6pBIPGVGof60rU+HuuVKQAgT2jHJIkbFXPaWoxHZ7zc2fwiYtTKv
         1Xq5/KyNc3HlbDa18hqkykADKxV7t8SVbqFgF6EuPOAxzze+3SmADvAMbNd+Ub2nVuAm
         s9oJySKdv52idit1rhAqqbDPGJiJh6SKM9XmbUX1JFTzlAwCsm8ZofxdOgzqqsJ5SoTX
         tIONRipWZHNtEvJYxoixbomIIHEOyeTXGrLQfOma7v5o7hqFgvGSDa8s8gG7k4uwOQ9z
         bNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852165; x=1791456965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=nDeTj9dQA1JBoTsf+UgJDP855F5T9DyOMdHTTobU7bOxtYpYH25wHLeiNmPDR/BoVf
         53gxC8LmbdgQTKHajyzB0Skhx9J6QJ0PWmu3S2UrTHanbqtATn3OZJF5J+WP8FuHSRHc
         8x1ROXhwqwUv6J9KBGWghcj7rYkVHeBQSBp9FNuM2vz2tKk0OYrFZPN7qJ0GQWfhWOx+
         e92pmrghaVF52nFC2FRZxC2AzafmTZ5JqGkrkw8Wi5d3nMbwDpNkN2KHyzkOGYiwWUC0
         fFG9QffGfVp6UWm8wp1EqisrNpcXJLZ7AxKCI676jOMsWTW0KF3Gqksmt7HdLOtCLYoW
         9IDw==
X-Forwarded-Encrypted: i=1; AKwUvBwpPjVvuzn/caHMsb2CxOiPN0nYmEqztS/rfxEjZYGixzPkHiYIdC3CSljJfdSaGNS9FV+hytnGrmAuslk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlpUuU1XxxUIBFozDoiDOCRXS74EzsgB9j67JmKP/DBZQmz0fW
	0I/6WNsYr9RC1SHVb6kxDG34gJAmro2Xzj+HvEbQzjOtrxSUAgWd0ftP
X-Gm-Gg: AYBFou3X5ywhwoJeILsTH2llR4Uz22hDDCJEeE3mpGVdAIssB3xX3wHHdDCB1BbnLj9
	ap43yCiLh+FV4gF9pKnd5bfve6rU7FMPSVZfY8gngZxfycENK4gKjf6o8J5zamPiIONHEVROxPt
	ForyUJDKdEMEqnlBMNFOeG+EtPB9u1Zdum02/u4D+AaZwKZaaXXXEv3k1RFNKWAXnwnytSod1IK
	oJ24b7Rkaeius8eNIXBtT8Yi7h9tFD5p5iGBqUyO6LAMOudj7YWHa44TSjrPB3svBxwzcJ8p6gq
	blSK0zcoE2H4ysW5X3eTdj14SrIlBPmZXb3RXoWgA9El+nJoXEne10PyDsFsHkQPTY76CWvcvsG
	ApAgMhYIJAhOM6X8ie7VTJLkr5ipLeIYdwCzeOejh3m9Xq3/fSUfDQFgFiu8ZErakfF42LQp4ta
	XSgjxfAjJ+aYnuZmUJFPhCPoAlm5vLZQZqOu8CnUR7Ld9zjQyKwi/YTuI2OM3oSK+aboSn
X-Received: by 2002:a05:6000:61e:b0:48b:f1f:8b12 with SMTP id ffacd0b85a97d-48b0f1f8dcbmr2108965f8f.9.1790852164632;
        Thu, 01 Oct 2026 03:56:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690c47dsm5579889f8f.15.2026.10.01.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:56:03 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:56:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
Message-ID: <ar48QGIJ76kQmG--@stanley.mountain>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
 <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
 <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>

On Wed, Sep 30, 2026 at 01:57:11PM +0200, Ginger wrote:
> > >>> Were any more of your contributions supported by advanced source code analysis tools?
> > >
> > > If you meant AI tools, then at this stage, no. For this patch, I have
> > > used AI tools to help phrase
> > > the patch better, but I did not use them for code analysis.
> > Will this information trigger further collateral evolution?
> >
> 
> The collateral evolution will only affect the experimental analyzer.
> It does not affect the submitted patch.

Please, don't use AI to write emails for you.  Our inboxes are already
full enough.

staticthinking.wordpress.com/2026/01/27/no-ai-slop/

regards,
dan carpenter
