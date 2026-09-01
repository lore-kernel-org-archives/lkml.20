Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE33DAAAE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303849; cv=none; b=VYMaTLel60qUXduQZuK3zP5D02bqCr6j7c1TlFriqgx3nk+pBeORs1C8ey1sV1JvFQvHV5LY3V0EWbGUgvfchHkHKe9o/v8Umm1UD+5OWQTfvlf7HmpsmYn9A1avTosKzva5REVQofvA9uGpNg/BgWoAjGmNXjBCVMeASV45QQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303849; c=relaxed/simple;
	bh=NrgEfLLLs86SYcFbRusP2j20eQNadGH9mCddnX8FlMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIFrIwM2GPLDS5mupZCCOh58AYbxXdwaRvGHZqPSrbKkkDi5BXvZWbjX95PT79QgSOxJUGL6FHsSs1TFGYOAWHvU2nf9/o4oRFQRDG8myyYz//qiRk7KH4m2Pe4aBXfWzVPrgyHYpzwCWh1umqvyhVldtYpiIEOjuhvj3m5v2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjXQZd7l; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjXQZd7l"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso335530b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303847; x=1788908647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tH/J1WzaA/WseOsHRQAfR0s8ObxokYagjZKCtRr3PoU=;
        b=MjXQZd7lmaTha9N+bobO9UblmmF209c1spdRT6X/yk1OfbAyZAs70pn3BCZN1OLqv/
         saDH/VvR5YDsRobK0lSkWXtTSbSsSTeMjYMDZnp1ta0whCLB3q3HAHg+KojBzHwHtK6S
         HKwPKdVFxGgGzpvvSu53EEh7mJYV/4IFzunPE/I3Qbv9qVxw5z9PUouexQAW7SmuqdRC
         NkHQ1SjlJLA/8Or0rNaPBJSwkyHN0eD8/ppz6lmkr1X/S7qBhiIRm8K/Xu1cZGtWS9n/
         A4tgjyJ85nYlrE4xowWorYmI1Ndsb/XPxu+TYapguR8/qapkIsBjqaRs207uZ5uT34kC
         /l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303847; x=1788908647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH/J1WzaA/WseOsHRQAfR0s8ObxokYagjZKCtRr3PoU=;
        b=mx0tNW3Advwtm2W3zPgCoqiM5fZF1WVVDCQjZtvp1fbw8dpAShqRNEyQ0+F1PkxIu/
         58Jyiv3AqmW7Vk9ExbsJOfTbeCAEy6645loTFEgcZRAPQ13JoYxPSqWFj9vziLJaey4T
         zcSd0Zb14trtYpT1bHqEWQtn88UtJPxlnMYPW23ILYaXPbJmFtfkEYwRAEkI9F++XT9L
         UY4+fPKxCGnG6M0/8m760BJkmDfhuTGGivG49EaBxdH/P7iOq/OJNpmJtsOZbHWGacYn
         XGgAjSwIkovOlhAUsK7I7cfL0yMlCtEwTKcyy47wMCbra+0c1EBrWPrBU2KIL9YskzE8
         y86Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2aomBQwBbhaK+kxfT9gCRrsBQM9KaAFb6IPAf8nSuoJ3QClQDdVu8I2/p/kR63VwGMnAgUun0wg8ONxo=@vger.kernel.org
X-Gm-Message-State: AFuF++nU1IY6mpqk4h2P3AcRQlTORf3n5vaLbGQi9LrpRN3BIj9HpZWl
	ADNcv58pQD9wZy3morCZ+1lDE1a4/+6tnFjF4rlccIgzuX6nUR8rNaKH
X-Gm-Gg: AYBFou10a8QcH+gXcoRKRKUs44VH9hNlIQqJ0kOHxcJZFqILrcaSgec0ASVCFemR9oL
	GIu3qmfZ+01+rMZOcsnoXq1Nz1sa2sqeI/eoPn+KubXaJhh8r3HF5E6HAZVRXHOYoI4Y0+XMIIf
	ZRKgQ8Yd1eXoM53Hr1xeY8Y744Kry6cUp+VXJRo3RGwMk/4jfS4/mJl4TKAbf65KUtyQmcWm6fP
	FbOrN1eJ4HCt0FAsHp/YxJuhuQWmkMqrV7/SK6FUMtldakI6oqRb3/zvCkBkztJWyKf32lSG9Lo
	w0FvNZRnuQ6zCksJ6j6thEb1VoXJrQFRpy8jH4cXGaum0nF+BkfoX6EUAm2PA9WC/r1lLmR+xua
	N8aU4FaBwvAls26XzNKkVTnFvgycyuXVmZs3dYHWOnWI+DD+xc6x+2cceMEyGXLEFfLcgpZbGfI
	iUDm0IsFjwEK/lww/KM/j80mP71cVx1uhR+S0yo39OZ+hLBK0fHpgC7rX17JdklUKhW3Func13q
	Q==
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr518948a91.1.1788303847194;
        Tue, 01 Sep 2026 16:04:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f0eecsm1137385eec.9.2026.09.01.16.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:04:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:04:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: Re: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit
 addressing is enabled
Message-ID: <b2174e73-79ad-4462-93d0-2e69582636b1@roeck-us.net>
References: <20260901200142.495319-1-W_Armin@gmx.de>
 <20260901200142.495319-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901200142.495319-2-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 10:01:42PM +0200, Armin Wolf wrote:
> Support for 16-bit addressing was removed when support for i3c
> was added to the driver. Switching between 8-bit and 16-bit addressing
> might confuse the system firmware, so we are forced to bail out if
> 16-bit addressing was configured during boot.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
