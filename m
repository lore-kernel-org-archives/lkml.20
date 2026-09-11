Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1244BA1D1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162597; cv=none; b=sNcRwOivB6+rg6IQy0jHyiRoMSdV+9XWl6kfPC6e/ut6nWFg1vI67tDmcWm0A5/LZAbUs2wQYlCdeT5h8ctHBtPg1Psr5bJed/EdlkC0dv+bLLhNulBDABzIzrZ39ibtTIFQPb9k1+b30kyTtTLsSHC+Emmd0NWyCfnGa9EuxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162597; c=relaxed/simple;
	bh=SUiTHckpupA2Vw6P+vJ70ESxWaG0bfUVp4jLYBx9i3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnGC3GzDBjtucySZu4HadKalvpJvCyVHXkTJxQ4lWdkFM3CmqjLFTG4nj9Pv7OmZIOASSQL4+8d3F9pW6UPw1Oi3b/JUplSBYdeAs+GRAJfXzsF6b3pH2VeS6Xvk/cznh7XFqztCobTscWqUnJsBswHIU9tADg/YJUGpEkggRFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CP7b68Lw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP7b68Lw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so2518990a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162593; x=1789767393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAQK5OeklF/DWV0T96iTwyf4EXdJqbJCKpAuQ260Jy8=;
        b=CP7b68Lwz0lZMiJCKXojOECPwsid+PDrcCgP31nW95CaQB5XMMIZGrL+WiRjMFUtXR
         C1gMDtj+lqVM074ZA0iUrgCPmFydNGJDFFUrNztS4lbGyjthP/P74PysMRUY1ukwzxCM
         +1Dg5oOQ0qURCwZLeZ6Vj/X3GZ4Z8W2VgWFo8r0o79y1MvOnLKOxp0kvkfM8pv439hHh
         ts3MXePzZDKruG5SO9FpI/hYmIGi1GVBs51iKsVqztsplR5ODJuG5/HS62dbs/lKkTBQ
         W2oEjJoR6X0Uns0xyRM3xMQShpvrS4o5jGqCg87yndNnvQsCprR3GnbWKph26T8YtFNr
         JyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162593; x=1789767393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAQK5OeklF/DWV0T96iTwyf4EXdJqbJCKpAuQ260Jy8=;
        b=clD2s2Sfs/UTiRahaTQQQrtHr5gZNaAuK80Jb0CCDHjAuz0PwPSEq9cw5BcvQKjxVR
         +/feOvXGjg0IonNU8OdckzQVJOqqkEf7tMR7OYKz4x313l2vNVfBFB1hiZSThNoowSdJ
         sZYInZbsoGnjepf3yRsef0cMY7VussgaBlNPBZT+jARmedYke+385wXum+pwhoQxgO7b
         IR2gpuIaArJ66C94C+wI+wgHymTcSi+C6FWRutKORROGxjCZIpBcVELXekltNF8wcazm
         oYJ2+i3HTEMLnW7dIQT+GCiXD5AuE4g6BRNSl0l3QdfVGIjBIFPfA7w7ABjaUxP+eT+9
         bLdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz91ckkXUtpoFheCUI86iCde69x6ZNDQ4d1o+5DzAU3wH16QaKV8jJJ1eZSwRuQrsVkqD9rOz3znyz0glc=@vger.kernel.org
X-Gm-Message-State: AFuF++mQdj7IGfIJAbPJHiD2bwESfoadhI9uLPOrYVSC+w+rcXXF/7Hz
	smy2AG4XZ6gMCCgn5TW/prtUhubxiQXNUZLAmmhsyVnhn3x6tJl1rDKA
X-Gm-Gg: AYBFou2mmJ/1XTgMqMJOk74XaZUIcqo0NNnelV8OEwW75n9ADqfxu720k/jqSFeHh64
	jEOQA1ZJiN5MeKzrjYf5kWSk4gyMumSKKmHgOLZQr4C7vacYxDcOmrOXkI4Kr3VKQh4fyuzolnx
	jzgcOos4xAoVv2SOEl3r0cKdL2D9M2z8FGoYCKMTJNROAXr58K9VaLpmHNg6T9+B0ALNCtErF+p
	LRWkIXcEEboSlAKpnp6vRpb7st41mdEMeWSaq/KlS/oOmSS16xDgfJNWJuAkuuMxh3WAWzMzO56
	MKNYQk96JsykTgZUaiiWJa4z8eYc6szh6alIQsP6iUbPTVn5aB3dVl5Whz5xf1TavpyETYL5Iml
	y37tqz25DreL3Jdm5+HbQUhhggl2VnGHsjRDPWnIHNjIm52JlJjBaONRP49/pxm80UJ1CUsHYAF
	yfItGVEzDYIrpsPFwgXYT0Nu0k0YyRS3pduN9HM2Ek5Zgawd6on9VD2QVIiYj3PInJ4TqPxgfdh
	507UpYVowqL
X-Received: by 2002:a17:90b:384d:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39d9c22ccc1mr761107a91.21.1789162593165;
        Fri, 11 Sep 2026 14:36:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm6442721a91.16.2026.09.11.14.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:36:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 14:36:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com, samagazaryan@google.com,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com, corbet@lwn.net,
	skhan@linuxfoundation.org, Frank.Li@nxp.com,
	jorge.marques@analog.com, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org,
	dlechner@baylibre.com, andy@kernel.org, lorenzo@kernel.org,
	enelsonmoore@gmail.com, rppt@kernel.org, pratyush@kernel.org,
	giovanni.cabiddu@intel.com, gabewhigham@gmail.com,
	haren@linux.ibm.com, pasha.tatashin@soleen.com,
	jirislaby@kernel.org, adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com, jszhang@kernel.org, adrian.hunter@intel.com,
	akhilrajeev@nvidia.com, tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com, shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux@analog.com, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
Message-ID: <342236b8-11f0-44bc-b0f3-2f167a6f521b@roeck-us.net>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>

On Fri, Sep 11, 2026 at 02:09:33PM -0700, Meagan Lloyd wrote:
> Opt-in to driver_override sysfs functionality for I3C subsystem.
> 
> Update some I3C drivers that are assuming that if their .probe is
> invoked that the bus match function already checked the ID table. Go
> ahead and verify in .probe that i3c_device_match_id() returns a valid
> match before using the i3c_device_id pointer.
> 
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Assisted-by: Claude:claude-opus-4.8 copilot
> ---
>  drivers/hwmon/lm75.c                        |  7 ++++++-
>  drivers/hwmon/tmp108.c                      |  2 ++

Separate patches for each hwmon driver, please. Each patch should use the
standard prefix used in hwmon drivers.

Thanks,
Guenter
