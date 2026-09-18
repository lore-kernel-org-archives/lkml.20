Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEB49B47C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743872; cv=none; b=UX430sKEyhhL2LBMtKhRJUHp2DX9kXsN2VowLT3cwIH3F9qhlUmryDLDLNJnbIuGBbgeSYQtzBdIFeoqD7f2C02iAAZVX04+Dr6dAcVPbYqMgx8YwvtFbgImM3God5jGXfiqiQbsC5f+v+239fBqqmbrQJnT95nQGEllgr6MEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743872; c=relaxed/simple;
	bh=hSYPaZd4QidUGUpkJDVqdSFkFz4HHsx9wagFErTa9e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcTxV2I2/9+aycAtp9vQfekNzknT7FBrUiCFW0m/yf52ML83QYlN9Xrv9T6+cbzv10XVJtWfnTjIMMyHMdfm/zv/ojl7Nen3FCeuL7XxKyZAOFgS6l4xJJkq59YAWukfdI0px6pEHkpgX4k2iphQ9G8XBf+gfTQOop9rGXtSNjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmrDfjbB; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmrDfjbB"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so7460295ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743871; x=1790348671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6oH5lMiBGio7Tl7op1uAmsvZkVfuae8o7zdbV+2icCs=;
        b=cmrDfjbB70iqh6q4unxNHbBj9Lz4keBtz1ja+QLJok8I6KZng7HhrPLxCpUeBBpOZJ
         asSMiso8120MdLzV8Nml8fh/s2hvmwyDNdogSq3b+HTtF53hNfIAfcrmUVgQ2o39+fDk
         af2/ra2mK5VsaIoePY1ynx9wEznrWh5w03feEnCauy3xwZ4xrSuYbavMsnwoxodIZEmT
         UxG/VgthQdEONWlwYCmEqgEyT7pi7WgyqtwkWYBLCvMg7EGFFBKVr1blqbIurwtdljmF
         8ugZTF/v8XVx4MKWUt+jVXNc6HgHgednG63rkXPiE0GKRIkZQkudutqYaxVecRmpY773
         bHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743871; x=1790348671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6oH5lMiBGio7Tl7op1uAmsvZkVfuae8o7zdbV+2icCs=;
        b=O0cMwx6hml7xLNhFOqJTNMCI9RmK4PRW2DlH2aui7lwNmBPqSsk0HeXwjPS+k8WvwH
         jkugYSDw8VPq4FvYTaI31BzLu9XnUBZ4gZvF966FisDT+n6Ek1vm3ONjypM5XjlT66Mg
         RAvPhpdJqkwkn0vqYLzD84nxFhGNIKbm/6bb3Dg7cehjh2/RCShwSHhzANGjnEpJGl2k
         uDgvi4c7s1z9s3cd7TojVIqY68cFWPN1toRgKrjOvUxOuEnnoxEup5yy4DG8aKC4R5N9
         brf4zr6Ntve/IegORUhJtde1c7Pq4TIcoXm7J3FLl7TQklrCV0JDDNr1JNYI0r2fuLRz
         qVKA==
X-Forwarded-Encrypted: i=1; AKwUvBzMziKnP/vjzyuh0ROjc6iM5n2GN4WpVhYX5eCUEmEwy0drSUzjy3X66V1BFeqHAKyoy5gHlVMNlngs9rs=@vger.kernel.org
X-Gm-Message-State: AFuF++nhFlpDmYDnWESxW156BrCCrLSYBRPL9cSQHkhUEPWkXC4wG4WJ
	o/9SkMZOYqT5uQsWtY4xjKeUqWyLpIqN+8py7rHaTWzI/KhFbWegZWLU
X-Gm-Gg: AYBFou1CBGPaAj3hs4oAuY7gQku0F9jJaCPZDf+7vmpH0UZVmHpyNie8nXT2EUFkTPC
	C65MkLjP8QkBmg1dDIJyOmtOlM78k4Cp2wumgrWsQi4rkwWVpmEMEEJIPoe8akN95t/b0lPwqZv
	8ekkqORqI8FEw9Ni6qDX3PqbKs1l0erEFvxYTdylPr0pHP7WDGYBHk7xjpkurrBUTBJX3f46d7M
	9FvfOpy5FmawQkpvdYhOYSjpwYv2/ZiWsgISS5TXO7sXl1VsbUptuc+bUS4KtN1eqy0eN/A+mwX
	mx5/x/Dyz5OsbE4UT8jYPa6gp7Rhtoq79d135lW9Vi1+VO4nzXDzca6VuftgF1PznKdda7vMnLx
	VhaUBiGfjBhpikqcR32krJ4ajTYI/cHRnjl5TbNf2mPk24QVKe9jpT2TK/6XKDm4JQZ37atoN7X
	3DCFluEsfJMjVyvaq4qVspzaCBHil+4RdAn6S7k661KTOMTxv+3hObHIKad9JSwCRyF2OCp1mvx
	9zkuMWtG9G2SBjicjrc5xk=
X-Received: by 2002:a17:902:f543:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ddb1b097f4mr62517815ad.12.1789743870738;
        Fri, 18 Sep 2026 08:04:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb757adaasm10060625ad.48.2026.09.18.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:04:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:04:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Ed Brindley <kernel@maidavale.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Denis Pauk <pauk.denis@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: asus_wmi_sensors: Fix info[] allocation type
Message-ID: <39707657-7ff4-41e2-b324-92fc571a746f@roeck-us.net>
References: <20260917211332.i.711-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211332.i.711-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:13:33PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "sensor_data->wmi.info[type]" is
> "const struct asus_wmi_sensor_info **", but the converted allocation
> type would be "const struct asus_wmi_sensor_info ***", as the size was
> taken from "*sensor_data->wmi.info", which is one level of indirection
> too many. Luckily both element types are pointers of the same size. Take
> the size from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/asus_wmi_sensors.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter
