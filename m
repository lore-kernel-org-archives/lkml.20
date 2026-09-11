Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3825771
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088319; cv=none; b=dZ+TS1VreWSYaC5Uolh+VDbyxxC3e5/TzKR976YYMtPM2C2yvUQd4cQxHg3DTRv8N61kh0Qj+uySDwgh/h6BlG+ON8U8qUeg1XpD+uFDRnxoxG/QGijeO9P0wpBRW7wUsjlI3cv30FJw0YHQo/RSY3IZLjgdvL5icUt0wuor03s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088319; c=relaxed/simple;
	bh=A265HADcB7R78V4B7WaaMJOPNRhCgF3KC+2zEGVJfuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvKgbIT0+damsNrsXFOIcSI15a+h1x2iIULjNPeMgf9mee2+a/m1n//QoYu9GV3X6/1n9/Ag1Uf46ZnVgal9L5+uJczExQHUciP69hq+diBh7M2D9IB3tqzG1URFb6cyhbT/TQTPl4PmFcyDw3Q3b5n80VjomY8NtJILzvxOe3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO+9+bOA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO+9+bOA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd020a2e44so3200385ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088317; x=1789693117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=AO+9+bOAKW+LuY+ctXvo42bX1umc8OwZPhpPtWQJnvdZ0j+Yov/S6HerXDbdEx+Ov4
         Cwf1+YqPvnnudxZFAm4+IP7raj0vJTnxryHHzpNeSeCqaJXHvo5inrydNSym4BXgxOuV
         c2iH1rdB+WyDcKtQpEGZAYa67hHfvN0DtkO0mROQNQGYnDpcaqWFDcXAjENzLBjSrycv
         pZOyMqYy/M8C0QQzcQYOIyRYj0hGHwuUPjeAZJOx29zwcAn8jLEJbH3Co8NdehdJ55Od
         bpN7f7KGHiCqqdNCAZRuGG+9gKd/ourcBvEO3xTP2eU1G5gk6vJQzmLqOu7xKiGQyonA
         1XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088317; x=1789693117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=BmdoSVzx+DRZtSTBNHp834Hko34V2nXgDQjcccTTEoWYi4HY7Cj0inOVi9D3w02bEQ
         9S7AftPbkeKQMo9v7+TIyPohU3Fz9sf6HH2TbCFnqezwO3FD5WmBNO+A00yDYryBQIQV
         Cl+zA/LSQtwJ0aBb+bJ3SM3js03LJkI1hE2hbIuzY1IxUV+zsU1DqprNXIL+pJIkysyb
         uMr4kE2jEAExMbOyUVXiutAcunglVVwt+NDPL/EHcZNLZashl+/+8cEwC48hb03DRmOX
         bDLjg6jTXb/ONXMTGxn4R2Oi/x6KTSr8RPwou1jqxHFT4Zm/BEF1EnFx8oCAYgzj8Wzo
         rgKQ==
X-Forwarded-Encrypted: i=1; AKwUvByzVvbBrrSzZ6b1mXSdM7bpSDd13uscNhPL/kCjqC7aJyGBVBbL6UwHmG00/QOzVIPaJY8KlfbZD5/+lPY=@vger.kernel.org
X-Gm-Message-State: AFuF++nsg2THmGfbj1VCZpQinB+J+H6VV0a1dsxu+lTSYGZ2cSgI3VSW
	00eU45rXZaXC0XA6WwoQWqUcKfMD5ffFq7Dn4n6HyxWWZtCiz5Po0MuA
X-Gm-Gg: AYBFou0PQ36uFDKjSNbHq0BWkU/1dOt4o1PRxbStN2RWnc4eqeSnkipj0dXEPblUjke
	Qyl0oEBRIYH5dGbNDxO8QRl3Lc3qDqRMCuORS3gKI+rPw9/G5nO7Zdt6j6lyE2oS1VMwjJYO4hj
	T//bD8CGQz/aztfD9Gq562728CehIDpSncZQWYaLW9RUNM63kuVfmhrq6mfP0/9UMFnJUXjFHhy
	KHlej2PpMup/VE/TCLHDI8M1IdkwCs1RRRvCcH4IWhhuqEErHceu2j7PT6NzRfCGp6NM5UH3ocw
	gppAKygMMH+S7LoInFf10PAIj0r55B/Tkc268ZQDilttinYguPG8jbC48x1sGAsi//sVxTpNmPX
	rIBkYBRdAlaa3SU9+LT9DCdBMXr8/uHCXN+eUNZPdG15RaFNfAg/hQkiYooDpt02gYRa8FVUifL
	fgy3sz+SebGF/+bgvcrFBFBG+DplxissXrZRdOaL1M+C1o8W6hatMuy2uhvBu8hoHvbA1aDJQJo
	lj16d2yaT9g
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr2180437a91.24.1789088317108;
        Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1919922c88.11.2026.09.10.17.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:58:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:58:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>

On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
