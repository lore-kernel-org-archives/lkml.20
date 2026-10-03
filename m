Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD033AD88
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063568; cv=none; b=YCdJJaBnna1nhcAUFoRps9TUjHhSLc51P2xntthqa+WHvme3/AKSF+HrOqADXFAC8kjCVH3YFbvu1612gMVAoz3kZ8OakO2ZoFKoEZCzr57zmH+6lqP/Hsd2GYmzw9MW+FxbwziCGCSaZ8MGZAuyiatjI0lKWQjNw1dU0dzMCcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063568; c=relaxed/simple;
	bh=rrdShUp79rxvWzIFVrFNBGJifqRB7StxCZ8XxmDN3bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm4ZoAqNxh3ebeOaffhTL/vO39JHTEkLXre+NRNbux6oaaYfsmnWR2TdbdBwo2bZlCmtfBWTuwLtwcmkD6DJyKb+oHJ0hxu6Oyg5T7WZHdB7pKG1EGplYJwldbp1kSQ40dvnXgosawSTuDChKUY1bj2WkMz0bFkD7uhwcuxXqM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itS99qB9; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itS99qB9"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5d42a0e3b81so217779e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791063566; x=1791668366; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PlYfS4hBMhyBFUeqYNN4qHPtrfiKeb7ZEk4GUiuPII=;
        b=itS99qB9zsLmOm6fpLinzUfGcUzhfqJ8/RaOPUsKfh97FUOwPNBxLyj1CNiQauqbgu
         Dsvmt68WrO+5jtlkk7sGV7+h1ysmKDN58TDjRFnpoyE76x+tuDd+G1nCvKuHZ06LKPK2
         Y+JYUp65KOPJxJGwdHjqbk4+48RK/z78himKjQk0IEFaw6b9sOQl/yDs/nLeUiSHE1UA
         6ld2yCobVS0CNiDYV2weeQWhXm78CTsin42DgV8TWqxlBthW5fQ7k34D0SIw+0sXxID1
         bF40n+RJGs5G5MUkS8gOEuWAekrmwX0zvIUDVQUq2CD3ZAJNCBqRdxPhrjwPhMiWKhJh
         5avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063566; x=1791668366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2PlYfS4hBMhyBFUeqYNN4qHPtrfiKeb7ZEk4GUiuPII=;
        b=tTKHFTijgLD+P48O8YGxA4n6NW+FQ4raEsrmeTBgDQ0mW2zjHYKRa5PPvU1RV+X5fv
         og063nqA8+V09oUzN8xgalZpNuRM146zFTBr02WuQtPuxpO+W9ffUvKDcg6RFuTvh64f
         s/vbcFnIJKQO4yn2++3TAZAdES5fplDU7B7rAuwvovZHK6KvDPzquZp3q+Rri+p5chal
         t3OwAgpSC7oaQnb2gnajyCGnWbZIZWVkm+l9zzcQgfM0/RKA6oOB4NHTJs8bdm2espCI
         M3l48pBW5dn5RkRZ7UM7AMGz/aSatU2QK+Q4po8ZPmY7c0vLW9StgMlib8YUPV6f4qWx
         zLGg==
X-Forwarded-Encrypted: i=1; AKwUvBzw9I1vLqXKK/8mvXyRWj6JNDEisGRAaDPpkMVDdMs0oJChSObliJMqYB0GmDUz4joHiVteCSAbb9uJZBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5rCSE4Hp0+NcAbQQH8JRY2ZlCDc3QFVnaL7tKxjpo5U/DeD4o
	UCmfF/CzLsSxLJRMAYamYniTx50wkWyD1vd6OU87lqfkIRkTE6nHwWqK
X-Gm-Gg: AYBFou2sa76hJ6ITNPRwCbQBreyHQDikJPm0UFnwUg8z38JzPDwLsW0pR/n7ah5+EEL
	snjkZuG2K7XE7d4kltAb2cXK2NNkKb5om17x/fP2W1sJa25DbF8kq5hd1nB58p6Vq/Sr+9PnIuU
	QpY7ip3WXA7gmKoCfu6tcMqB4F2S6XLTENh/ViEUZem7EQjAApE8yQpCR64ibSnaaXAtKMOPfPn
	L9kBFQDD1h2Q1LLCpBWAq2vtx6MK6T61Zs5MozzmdbMSGanJbD63qHDKGcSjD4KFmL1xQUnor0g
	LKzj0y5qSYuq2LT52CeKqs+qSIqfdKvEhVP7vLju9ifHouriVawj9f7ac69O/exK+f8/mCPTbvJ
	ptz+deaeezZkWN+rdl4k/wchS/t5+04GsmxwCnDu/KMI7W5l67VJCeONwP8Vz9+VSzf6nSk67iP
	XaeVcK4g+h5JfDqxyA91jsWIKK3OVp65b08eJ+k+WsaUaSWqKBgcdj0NjbZ60LuDvBQ2Haj8sWk
	9UMjHqlyzr7oLShlI1mOETTWysFVXmxow==
X-Received: by 2002:a05:6122:29cd:b0:5dc:e6a8:16f0 with SMTP id 71dfb90a1353d-5de69890df5mr867787e0c.4.1791063565685;
        Sat, 03 Oct 2026 14:39:25 -0700 (PDT)
Received: from archlinux ([181.63.25.200])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da5ce773ecsm8537315e0c.1.2026.10.03.14.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:39:25 -0700 (PDT)
Date: Sat, 3 Oct 2026 16:39:22 -0500
From: Carlos Casadiego <cdcp206@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Liviu Stan <liviu.stan@analog.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, arnd@arndb.de
Subject: Re: [PATCH v2] iio: temperature: ltc2983: pass leak detector type
 explicitly
Message-ID: <asFzGi6etTy1rseZ@archlinux>
References: <20261002-iio-ltc2983-fix-string-compare-v2-1-b0a5ba847790@gmail.com>
 <asFViTtGq3hQUrma@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asFViTtGq3hQUrma@ashevche-desk.local>

Thanks for the review.

Noted on ABSOLUTE_ZERO_MILLICELSIUS for a follow-up change.

Cc'ing Arnd as his patch overlaps with this one. I'll wait for the maintainers' preference on the two approaches.

Thanks,
Carlos

En Sat, Oct 03, 2026 at 10:20:41PM +0300, Andy Shevchenko escribió:
> On Fri, Oct 02, 2026 at 11:44:50AM -0500, Carlos Casadiego via B4 Relay wrote:
> 
> > __ltc2983_custom_sensor_new() uses propname both to select the firmware
> > property to read and to determine whether the custom sensor is a leak
> > detector.
> > 
> > Pass this information explicitly from the caller instead of deriving
> > the sensor type from the firmware property name. This keeps propname
> > limited to identifying the property and preserves the existing
> > conversion behavior.
> > 
> > As a side effect, this also avoids the -Wstring-compare warning reported
> > by the kernel test robot for callers where GCC can determine that the
> > property name cannot match "adi,custom-leak-detector".
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> ...
> 
> > -			if ((index % 2) != 0 && !strcmp(propname, "adi,custom-leak-detector"))
> > +			if ((index % 2) != 0 && is_leak_detector)
> >  				temp = temp * 1000000 + 273150000;
> 
> A side note for the further changes: We have ABSOLUTE_ZERO_MILLICELSIUS
> that can be used here.
> 
> ...
> 
> Since Arnd also submitted similar fix, it would be good to Cc him. And in
> general, if there is a clash with the patches addressing same issue, Cc all
> other authors.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
