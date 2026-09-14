Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869F4825AD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399765; cv=none; b=EwBdYJnKSOCE5MXpYHXjsZyIufeUFy9yv9P4LhznyusEkaZ3zoxmNqnDFd7ZdxWJrFbQn5w2suZ4YrhN/Is5IW7X22UqmwmoN5Cid/k7H3fhBHmrKdRrfjnT+rMsQwB48tB7XEWOr293NxajZEK8C/3ASqBnwpAUBHTbxre7KZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399765; c=relaxed/simple;
	bh=8P1Uav40Y8kXsjX0HdETGS4JMl9Qk6D8B70bUav+hDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9dkOWBcNXnbYegiXmjSSCXBUDdhLSDcpDHBWDuXiykJdtX5UasLXIvfxDuzXbo0Vnl2H9gChgQWMhEXZBh2GWmtzQ+CXUWCFQFAN1ZwtpHIX2WQHsWMETk8WHGw1bvFnyxqjROqnFLspJbgYeaw4sqrv4CW2lWacYY2vxufuZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykh5rSQB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykh5rSQB"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3335708a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399763; x=1790004563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=Ykh5rSQBWJZoT05PgglIqa6HkClGzhc/Ykcj+r+T5KLH+kZnEfR9S9+5dFb1ImvUL1
         HMSMDrM/DXr7bnvf5OYateicGIAvQqkBLOUpQhfUc/TF3vxQ4qNU4zi2tRabUNnw1Rjg
         f4zv/jVJJN8FNYcxlMm3da/e9SbzXeP1XAluzseSnprHrbYnlcosy5UX3QzBPfEiG82b
         tqfaO5PHXxCJKbJtQV1vJlmUMJ+1EysFOojWbccC8qYsvltGdal3WYHZAQyrXLxAXjdV
         mRNiHEo+MKfkEA2OOPoTtdrbmiSwr5zZ5Oo9XSBYReCeCiwL+vBCaHPOnxbAsdHkP3pB
         n1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399763; x=1790004563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=UiJSBwClEYMeYcnIkN22qiJ4K9ILKOYYxGNDbNp2HGfPg+F7rHmyjtRbPQqabe0MBl
         KUJo34XyET0IugbY3aHrTerTgtM1PPNKhek3zEjDrP46Y7qB+piM7foeNJmQH81rzbfY
         6SE+9M+Umj4/LLX/SllBDlKngjtL+y8rNs4MKc1f8jYe7hXC2lNH0N1l+SOURj646XJw
         LzVNOqUERzuBZCXG8QIViA+BnToaN7A+S4QUna1CyphRI+GzOL3rBXSa0wmhqeTqjn7s
         Xgy4iTVyjIO3wqMtY0Yac76iBiKI3OhM5uJYx+hlyf1y0mWP/TgByc4TzToer1WYmhh8
         E/Tw==
X-Forwarded-Encrypted: i=1; AKwUvBxUTkxDlIBp4QaxFpcWv1UWUydq/3kFnpd/Ati6/AkqcKgBEA2LtuTdVs0p6BwuBB4xmmyL53Kvwdpsbn4=@vger.kernel.org
X-Gm-Message-State: AFuF++mnDay3t0WBywilwJPoLJ7JJ8HsYxUhSIiq98YHkIafdgAboU0t
	TgmSvanBwbGcGGYg8EmzI6gGtuEdoizylMd4HqVRvyKH9+eyHqC07Xb3
X-Gm-Gg: AYBFou0kOkt41joUOA4U8XvjvjmIPp4bvqcTIwrn+9km/4DOtlLO/AxYfJtdpr1VaFM
	0U3Zy51Nai2GtuZpC871W5jSTlK0aQDWbUhChsMU3sGsDlxKdd7gYZoOg0zsfUSDELivaXxz9k2
	ABD+SxRHNM4vMcAqZdEbIseXw8WG4nS/SyEqZYd4Pc4xOeKFfkuL6FAmQpJty+1Rj0gBC1tXFbA
	Kwgzgbl9Yf40bQhGil9Dir3BlmfTVIphOqBsfsQmTMOWXUVNp1VVo8cNduK13WnEpZLgGwKc7uM
	CYHZu5DK2mN/JWJTbziE2WW0FQDVcWI3kVn6NGR8DH1K2ocv8HqUBQ0B4qVkD45mO0H879b8o6B
	5y9scRlHMBfyiEMghsqtC5MREMSo34f4vOrz9FDBFWrDjPXUnE7V444DohM4e4isPaiDNd4JAS1
	p3fBEChwlb7owoYHUxUtkxLbKgZlyNiOwwexsXDenIyiX/20ZhdLY9OGNcJ/ikeH2O20Q+Nty0u
	bnvk2Zq71G5s9xplyE4tjQ=
X-Received: by 2002:a17:90b:5886:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39df253ee28mr4127241a91.22.1789399763401;
        Mon, 14 Sep 2026 08:29:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb6e82dbsm417472a91.0.2026.09.14.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:29:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:29:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Add support for ADPM12300
Message-ID: <4f87ffd5-fefb-4301-a550-28518bc2faf1@roeck-us.net>
References: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>

On Mon, Sep 14, 2026 at 03:45:17PM +0800, Alexis Czezar Torreno wrote:
> ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 3000W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
