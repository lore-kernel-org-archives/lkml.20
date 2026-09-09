Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8104434982
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985772; cv=none; b=Z46P5xnIBDYdQfPhRG4FHSkAMXSkzMI29Kx+lrObcFsFhiujSvxCOi+5Z4mF03nZTKA89xcNcz54CCF/5GRPPIz4Q1RLoY905iLj0xeiXfpYF2xuC4Sd7lZHrWA8ROa49wEJBdpq3IKOTXhxE0hkbsHzFq+2orU6i23PqIUCmoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985772; c=relaxed/simple;
	bh=z+0tLgyCRJJAjKpetPBYp4AGbyWgzkXH+IurDgPiS78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4VVvBwq1LL9zV7KQyo9KkjxuLxSxxhBJnITyzmtilyYvmD1j+h85fSzx4Ah9nzAGExvgxGiU1ZckBklKOIWIr9C734jQvN07dpmOBMyJMgJZWgjy3fgjts9BoHWSUsIIgkqEl6uPRRECVxyW8/5EEjHUebuWUMFZoPnSwGfpuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf870PZ2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf870PZ2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so1512859a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985764; x=1789590564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=Gf870PZ22XfKELmiVeXwwnlhYzjqtlrQXqQ9wBwHKGb8IHRo+KZeHFTaQ7GMirOi9y
         jLzq9swursocWRRd373GQMFM3dR8C9QAQyCzxnKydvS/g2Ja+424sJOuRwJbl97+4ELz
         Q8tJPE6kQJvgmWWXJUGgrsBurIykQorLwCTcvgP5VtAEIMxE3Kj8tL5PZCupavsKt2mO
         q635xqibpof/pRz2ktIHUgojQFOchFTx9fmMCHpnUL+gUWh5+g2cDyR2zniaDW5YQnAZ
         DXNFQ7ArNgz8OIGkOgxnsrITdLBT7TMz/Hgl5D5e258iPZ+Sc/TMqAq7YG/QKwSdwbaM
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985764; x=1789590564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=DhDFl+SOYGZhOSZoLojC7FUCTZjqrOB9uOIOhh7gc4uVXZkwO5NWdG/ifIDPlkYvYO
         8YEJfiADus69zB00hALgl2PKhzKvZA33NPsr9f5go1n/CCa/M0fVdSlpzn6qzsD3Drvs
         LqRoTKek1dkC/ANsD/l4B/3Po6kNTPMFrcXj/tLSV4yIHoLscyrKnY+cg8vqHYB222vN
         ng3wDc1NgrBST1RVvguGlFClCFjxJiUChffhF6qDNRUJQqO0bUkiUUQgXGATpKhBjalE
         4y3DN7Xdi6zLIusYV0P1ngAHlJInxElEXmGGDN9MG6ZrpN0whY4fv5oTSziuUHj7+0Va
         SnsA==
X-Forwarded-Encrypted: i=1; AKwUvByhKvwslkLnTxTZZ2XUOR9TV2um4xkQ2wjKlW7S5jOhGsBge7OZyapscpUZF0oSASjxa7Ev1XfYd24Zkxk=@vger.kernel.org
X-Gm-Message-State: AFuF++mSPepVHdrRHdHNQtKF+JYp9D4idj1aa4aaeQLHC89Kb2Ffe/hh
	cWN4qZMPb2qGMPrnJ+h5sTPmfZlppkD0d701nS8trnaz4H2bHnnQwdCn
X-Gm-Gg: AYBFou3vXHoX3MhOLFN3TeOSnlLkK2bn5aaxOPvlQCm9n4exzABq21QIWK6FlvNyOB6
	wYqgzuto3G98JzI1Fp7myWlqftx1PnlJC45u1JDiqHdg7U903h5PK9cqoMw6Djy7FuPDXjLnNph
	tQuFHtNFcaAp3w5Eeh4PkpKjaU9r6QEwUC3cqQZVNw0nUIYpwKycVdo0u6VKkEszRlUqaB4NsSX
	GvretSGOoif6ITPzteL6UY6QHFhE4kBElTx5cxiylALeWWV3Nfp/rRnbdG4fDFs3gh5QIXUknE4
	UsEl8v1+klhZiAYwh8lkZXd0Wp5vXOcXViWWM4do0pDZn+fiy9tox+GEQrzuE3GciVomXL/GxKp
	D4B9IvMvEIaWCQ0chsXGPxiuSjTeUf2uOlY82c3q6WRxjFsG3EoN0AYwelcj1XSs5gZ0s8KYrPt
	ulHN4c0XspFMs+UNfa6BdIOxD5pwvvZfS4F2mlOfzs0jds7tI0gK1Q4IU2gwubLqO7LFbGC+SVR
	WVN/ikaGy9Lx1m7EHIeMMw=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr10334634a91.23.1788985764524;
        Wed, 09 Sep 2026 13:29:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7740383asm1159237a91.7.2026.09.09.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:29:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360
Message-ID: <7e2e3c81-ac92-44ad-ad9f-19add2879be6@roeck-us.net>
References: <20260903004054.502171-1-lanzonza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903004054.502171-1-lanzonza@gmail.com>

On Wed, Sep 02, 2026 at 08:40:54PM -0400, Zac Lanzon wrote:
> Add the USB product ID of the base ASUS ROG RYUJIN III 360 (0b05:1aa2,
> USB product string "ROG RYUJIN III"). It uses the same status report
> layout and cooler duty channel as the RYUJIN III EXTREME, EVA and
> WHITE editions, so it can share rog_ryujin_iii_info.
> 
> Tested on a ROG RYUJIN III 360: coolant temperature, pump speed and
> internal fan speed report plausible values that track load, and the
> internal fan follows pwm2 (30% -> 870 RPM, 40% -> 1590 RPM).
> 
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
