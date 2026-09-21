Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324174AA402
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000167; cv=none; b=VV0jtMGf0dUz0AKcru99feNQ3eYZx78RDSlOZ4//jVEbvGz9V7hnhKPa+7+7ByEJwsXOHAqTMQW5AVOZ21d/0W6mxNFJBV9nkT0EisfsLNx5Yn1d2fIWx7sk8AWgnuhdEv0e9MrPukxHyZs6D0IqXhvCR5mm6xacNwUXaacugfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000167; c=relaxed/simple;
	bh=T9zxxSsw5iEbEUBAyeZAA2CKlzMZwcsqLDpDdJ0+Ya8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfSagAAF53KfasWxefqCLkferU2x8j8RtlZ2Jt30f9Tm0JMYX1CSS7gB+taqFsOetS2lQ0QEBjkELU6IHv+Nd4SLfg5FEnQfUjyy8u/7QeDxabm/YGij2vQms0Nn3fSDaDSY1Mf4HCbkD6UQwqoKJiLvQGZrqDSH8TZPfuP83fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9TyhaWP; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9TyhaWP"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so27475475ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790000162; x=1790604962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V/tkXdnY7RKXLTVajOjjU/kNAmpz6uVaBIo5SF3Fby8=;
        b=M9TyhaWPtlHF5kuSz0dy2Sra06tkkSBD9ewa/RaxrYWyJWV3pDDaX9V42IjWL7QWB3
         h3HyX/Cy0h87rdVWkRxLYHw1Lb+tVm3wHid912JAD1EaY+qf7jb/YWRkE7c4K+hpm1I4
         VApXScMV/PQ1VZR8pRNto2TOEPYc5yyvCsw5cHoq3FFiltfteEM7PvSe9WpixHwey8Nk
         Ou1Rz/oWboQ/s2vfapSo9qRsI/H1sqMnZC68JTC2P0fDytMJqtgnKzewXT5Tgqg0HTFw
         jKR3DA1eAM0ccXq2oD2j0GCutz01nt0EaRngScyQywiv18hnTUG04D395miO/Z/Fk/TD
         cm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000162; x=1790604962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/tkXdnY7RKXLTVajOjjU/kNAmpz6uVaBIo5SF3Fby8=;
        b=t4qnO59Eqm9m+qCMksWH8ObdxTknBX3w6TWEalQ1APN7QehB/9ZjdkBqEP0g1ZCBnm
         Z4lBh45JVrl1jstOoCMRXd59mCgpvJj+E1Yfsp67kGJm3bm4Y43xSyG5X++LEGXvBhxP
         sD0WeQQnbAhngAHmMYPyn25DlMEX8BmWXomCaQgBN9JPvFmWr+UOEJehTOrHgCkJQYoH
         8V+bEvQ6+HTULib7yFHBNz+QSBHytVgaaazZ3v8eacA36po32kvKeC8pIo8+pyPtX2As
         +Lun5bc3WPAVBMlyiN+EaLL6OBRala/+48BR0rq6uUct7pEra51nQYlPY2UYXGw6MsCl
         31FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE7XyVDDiDHRrI+M50Di99ffgaly5cg+Z3axc5d0YoiCoNbsfj3dAG6go8Re7cKA8e8iNe5lZgt5ZfrWM=@vger.kernel.org
X-Gm-Message-State: AFuF++mSVB8ld0nLKeDUkU38O5Oo2FGFdJzD4TEqasFU2yQZdX5zpWeG
	myNyf6pBslvQUKCJlDGgjwFqqMv0n/VtwieWb+yzEfPnGiGSbodVAkAa
X-Gm-Gg: AYBFou1z5juSBZrhCThnRtzSt2+OHZUD4TF1q7RJum5TVD1URx0aBjg3UUV/0fo/i4Z
	oaLnJWHRLy1pdh1TlJgrkmBx1ROLbP9BZyAnW8Phz+gZwP+9CVRyHTf+yT9iipe5mOTVgIAUgH/
	PJjSl3He3i6hvMU37teqUBqVJirbieuNNmrVjV6OOK0H4Z+gfMZwD5d7/zyCZThmweYgXxwiX2z
	o5wSO5U8csqWcAYWjfcPM4kgv1B08LOcGCAvSL4DWOiitKRAX5n6Me2Y7bh3fa19chQsJuo8pkW
	vV/R90FZXu6hdXhUx8aUQqSj4ZVTdH70PBoo4+JGwZiPhMbtIfvmzex4Yk96Igpu4GAlCzIfQvM
	5MOIHzbV3r4DoqYirqss8BVXG9z0dL8KKmtaZd9Rin5MN1xl+MBR9PJv1IsSC3nf/6kQhXstHKj
	cxrnCZtPHOGnMwtI07rnENWsPDyvJckVQ3DtajJ1J/sXmP+DNNDbMh63gsNCrx2YPWOQZ60p+5h
	IAPHk29u31t
X-Received: by 2002:a17:903:1b4e:b0:2d8:d4cc:be68 with SMTP id d9443c01a7336-2ddb1c15709mr147356975ad.21.1790000162187;
        Mon, 21 Sep 2026 07:16:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178900esm35337475ad.17.2026.09.21.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:16:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 07:16:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kean Ren <rh_king@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (spd5118) support write protected devices
Message-ID: <1274727e-b41a-443b-9955-ac8119417edc@roeck-us.net>
References: <20260920062230.2437291-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920062230.2437291-1-rh_king@163.com>

On Sun, Sep 20, 2026 at 02:22:24PM +0800, Kean Ren wrote:
> Some systems do not allow writes to SPD devices. On the i801 SMBus
> controller family this happens when the BIOS sets SPD Write Disable, in
> which case the controller refuses writes to addresses 0x50-0x57; other
> platforms may enforce the same in firmware. There is no way for the driver
> to query this.
> 
> spd5118 assumes that it can write to the device, which does not hold on
> such systems:
> 
>   - writes to the hwmon attributes always fail with -ENXIO
>   - the temperature sensor disable in spd5118_suspend() fails silently
>   - spd5118_resume() fails in regcache_sync(), and the system reports
> 
>   spd5118 0-0050: Failed to write b = 0: -6
>   spd5118 0-0050: PM: failed to resume async: error -6
> 
> Register 0xb in that message is the page selector register, which regmap
> writes back from its cache at the end of regcache_sync(). The write of the
> saved configuration register before that fails as well, but the cache code
> does not report that error.
> 
> Detect write protection once at probe time by writing the page selector
> register back with the value just read from it. This is a no-op on a device
> which accepts writes, and it fails if writes are blocked.
> 
> If writes are not possible, run the device read-only: drop the register
> cache so that regcache_sync() cannot attempt any write, skip the writes in
> the suspend and resume callbacks, and make the writable attributes read
> only. Alarm attributes are read only already; stop clearing a latched
> status from them, since that requires a write, and report the condition as
> the device presents it.
> 
> Reading the SPD NVRAM beyond the first page requires switching pages, which
> is itself a write. Restrict the 'eeprom' attribute to the page which can be
> read in that case, instead of returning errors for the accessible part.
> 

It doesn't add value to only return page 0 of NVMEM.

> The temperature sensor remains fully usable; only its configuration
> becomes read-only. Document that, and leave the shared regmap
> configuration alone by selecting a separate one without a register
> cache.
> 

I had thought about implementing read-only mode, but there is no guarantee
that the BIOS doesn't select a different page during a suspend/resume
cycle.  For that reason, the read-only mode can not be supported.
Sorry, I am not going to apply this patch.

Thanks,
Guenter
