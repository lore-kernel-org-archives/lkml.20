Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AE48987D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399528; cv=none; b=Kky5DpnHmoV6BHY5YpYDQwhWFvOWHwMQprjgsoa2yQcmAneKyKpJKkZ2SZzhSYSKVz4JoLo+FgvkyFwkEO7d8lYZOKxvByVrjjQ1iDZXQ61qQAPSa7cyxov5BWWZAU8LWixN5TpQMC6yuWk7FQyNbLkuGpDpp8cmXv411m0QK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399528; c=relaxed/simple;
	bh=JsitQ5yVI+ckuRgULmGEejyoQ0v5+5wEkvo1/eyVDEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIar3WUOcnt2NEzalYLaY4Dvfh+lZ1zMFd3XoROkN9tEnjR6t2axTCkwxuybc5KmMFHyirtVaJ5ij/uoWnz3OUw+AvQGL6HoZCMPFFYtjHIa7OirbmfWEqlIvCV59yQvxcVuMcQSfy95iNgn9Wst67NFZFKh2/q/kY+qBsss6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjfML91l; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjfML91l"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so24359955ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399526; x=1790004326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0s36K6HWM9MRnuF5ojiV/2hv+/EMX34xY9X2Gy3IYkc=;
        b=DjfML91lu7QMpFp95iqueao6kc/0i6ioIFsfKFa61M11kl0qWLyMmu6tXcsyLt9iMc
         AhRa1zaU5Ua5m3NtX6TqJTWuVdWNe04pjqQ1QjyAx+5lxUKgt/s5tjXZTId6W3/s2cgS
         UtwpX5OQqIFEhiiMKd2g+x7h8uV476Wleu3RoxYkubZOXX1Ur6TNa04/oHsSrUkiA3mf
         A90Ux2j9ZejofE6wme3ULwOfd0teehROeksHG8aq0GiZTGd6JLt21ry596dKaXqRfR7Y
         1T9mar/l/xUktAwYr6b+cbV1JjD7zncX5U6NGl+QpBcGWCoo618Wlb+dLTblVDaPkJPk
         WEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399526; x=1790004326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0s36K6HWM9MRnuF5ojiV/2hv+/EMX34xY9X2Gy3IYkc=;
        b=aBTeAfMH0FeOyRATM4H3HH3oA6VBliRODh+/KWKQMY6Ss6HINUslrfemUA/KH3KkJ1
         3bUpr8LdqVg1uYEH023xrmTWKZaFfXt/wf3IFkPF0JiemTSOc7nyYpUUij6UG9XX/NrS
         m6D2NvqxYYjd1TTCRIs5k3Y5Vx5eOpQipouEFs5WrbFuSupRfiGD4IN3SZoS3nB3SCrV
         ri1vz9B+ejLSAZEMUY/cyG6lDrs4AwzUktsj4psL796Moh6wCRwSq5J3DwvbLjzDlegK
         Dn8Zxdi8nboq0h2BQKdU10dmg3/QVz+717GHBWJV27GQslowD1IrX16WS+dOXJ/y4CUB
         GjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO/75IJEiSS13k+Sgg2klacRHLj9qfEzMMEjw8mrNU7mhba1RjmIkdHXiFK4dLFd7hWqfZ46q/cAJ5UTo=@vger.kernel.org
X-Gm-Message-State: AFuF++lKu1rxbaQGlbto8VTqR547YlURrYo/b1PNtcKvtP7fCfrfTvpU
	dMsyIeyjaUmWymPeLWSd0dYmRFHk6QYFN8OlIyuObKBA4sScxhl3wrVvp3O0PI4f
X-Gm-Gg: AYBFou3mTKN3utVU4xS94oUa08OoxbyCMz7DePK2TF+q8Y5bm8TYhE80AlzXC2YxTfh
	y+5FQfgxONbAy1mqLX/cNeONWz4wxNshhHHDOITNf5hldol5dhP4dJmJv3eLe47YT1RNGa9E/YE
	HvVShf0BW3omWSVnx7nwU50VBIzdOkNpDjccskYQXvS6Who4D6CAUuPd9ujMAYQCiW6RfEednqS
	I8LoY6xL3Fm74ual3ysFM3kpt2HUIqDN9CcVeFxeQW+haVmbh5D1HPzgTPbaR8BU/Y10p4KffWM
	6nASGCbhWpn+fs9K01Uai88iMim9M75zqyF56/McPmjM47vG5tja2AnNquoSWgmoS76V7EE9EW1
	dUVZK0/Q4C0/BExfePMNU3+j5T35FZIn4HTOZbJ2RxkjxAp+S6EvpvhGo9Ho796gQq3CEehSaeO
	NJxBVQ85UlfYlgLm4vXjXynPJRTi+HzQclCiwao5CQSPK31RCeczWzCU+0zrH0Fhqneoc/1XFBj
	z3Xjdd6OePB
X-Received: by 2002:a17:902:f541:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd6c73381dmr58285075ad.16.1789399525652;
        Mon, 14 Sep 2026 08:25:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb4024sm50932585ad.33.2026.09.14.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:25:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:25:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
Message-ID: <53810ee8-8b5c-41ed-8644-ba23fd69bb81@roeck-us.net>
References: <20260914104136.1797979-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914104136.1797979-1-congnt264@gmail.com>

On Mon, Sep 14, 2026 at 05:41:36PM +0700, Cong Nguyen wrote:
> fan_alarm_irq_handler() always schedules alarm_work but returns IRQ_NONE,
> so the kernel treats every alarm interrupt as unhandled. On a shared
> line that risks the whole line being disabled as spurious.
> 
> v1 just fixed that, but it was still IRQF_SHARED, and always returning
> IRQ_HANDLED there defeats spurious-interrupt detection for the line --
> if the interrupt ever fires without a real event, nothing catches it,
> and a fault could spin the CPU in the handler.
> 
> Sashiko flagged this in v1, and Guenter confirmed: this interrupt must
> not be shared. So v2 drops IRQF_SHARED too.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260901160931.DD3811F00A3D@smtp.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
