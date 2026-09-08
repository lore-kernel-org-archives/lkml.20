Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13A369972
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884075; cv=none; b=nmJ0/skfUCQhpL6eQ2u2zZ1sHf3udKUjHU3RdqjPufvQWL6VjcSXnufegBfctwWLMmSUS1QacadKSRnzXhRHGtjL1/LzwMqpQDgNbRhnEwmMQ2P5XJQ8i+VUgyBUmJrJHkTSVY/OXNiDCizgpZwab54GRdd2Fa9xGGA40T6UmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884075; c=relaxed/simple;
	bh=6fdogJK2JW+g80xSNomr/zkCdaH+kk4rtk2qX3Bsoq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIoSQybTzM5oPHErpvuQAwPV9DV7RxrbkOCodqgcpKG3FUcuDax6OfY5N4amxm5VJne0J5W1BVSoodoFoN2nytFNnpMYXEMipIAO3pB6/Gm0ddaZT7TxpxGTxH13sbp48dxF9RwCxpdpGBPf5heX+yvGOVp/DmtfrBUhM5nMd1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrTxx2oa; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrTxx2oa"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso3312184b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884073; x=1789488873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kYluqoN8Fuh+7LLuMA7wseDABvUP683cA6tHb5BgQFk=;
        b=KrTxx2oanyT78oKqQtaJqOq6leoRG0ylgrNLS/VUPV6YUfrrwVKHYDIEv3rKBR9uKr
         5gjqMokxtjqeCLZW3fH/vVn/VLjYP/eYK398St8eMuNcS6/TWctQu6us4ijrLSMVtCA7
         gYGFTWk93nn5cVWg116llv4mptYvM6i/9B4qCLci0KMeZHf/BIuUJZaf6CqLktnFwfL3
         3NVbwOtnIBNdv/5HcD7aAAQPP2YguETt9F7RVtJqD5BfvWsrd8lnR8HvIkii/DZ2Zz62
         BoLkXWL/hF7HTJ6cXgUgt/CXdYdoX2cEcnHHHh1qUWrMj54rWuTdSO1iaxrPDNtCZDeB
         iAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884073; x=1789488873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYluqoN8Fuh+7LLuMA7wseDABvUP683cA6tHb5BgQFk=;
        b=SD9ixIZm67lL0UbhTjumUMDkWJ+s9yX70jxgrj7Sj8V+ocSU7ziBiR4tm+EttpErAs
         7bBwTFQ0coqjmz4v3CIIel11ejT7rkMMsRtdmtaZlcoeW3MK27WGxh/yxYjnmnii0ti9
         HSWofUUGIQnwwm6bx7WXpTjPUSkXAcALYnMayzJ1sNg1vDQnnn5uL8ylomiaZAJ9b5w1
         tVxFHyt1i0u4YfK1dr2H7wU9fRTJYe3fZ3v/4MkpbLX6WHKlNy9MqJhVIwY0i/Ol3RGf
         kNf4yOm8yDl0IPqsljosPWkI6v57OxRXHfKK7WEZZqXI307I4b1JXpWVfPuHs4a/w1wz
         l8Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxJO3HZ9V/OBB8gt3zkHa55JRRg8gfIEtQbELC3Co+DgvS6o9X7DGs5Q5ryz/G8qzwqVQMCJb/lBAvkByY=@vger.kernel.org
X-Gm-Message-State: AFuF++lGAWWE5YUeDNnc8Fs7UzrwMKTYAByusTUGEmoLyIMe+aZqjzkv
	1tdiraXflEHuM/ABnXKO0S0niXiUBa+GY1zwB5+SE6NK4axYJbSIBtS1FLSZfw==
X-Gm-Gg: AYBFou1cjpG1+A6FWV3dUDIJO6kUpdJaijNWTo+qnKapqsKaBoN6CC6StoW0ALrTTt+
	XDfOOUE+BmuhWSvPTNDooOufW56a0Xvo5+ftqoSppwYyU3Z6dsKGp/QXDK2Zx94oTGiIRGYb+AU
	auCheDJAwjsvZ516fLdx7gGenpsm0aRo6JhNfJxYldUG23s7o3ERH3THcUtKwMI2UWgySXM9iy6
	RzG+hxFqP++dFUKZESKP+UD2185EuQXabvEQSpZn3SxcSd2wfnQofIxYu9czV0G+BosTGn8Q8b7
	Z18II5ZXmc/i8bG46uBWIjc+lXexemIbkx9wiz8gpC6D6fhRIp7RD+pBWiFG+liDb5m4cbtevCC
	Pzp5jhuAAhGVLZzOykoK7rP0TptysRhM4THjOYWHDWwA05f0ilvYcRxMxMXrfSmCr4T2pQNOBpA
	6UofnqjntZlJQNOfFb/ifT8xalPmAXoefq6C6eLqEgkIifxX++q7P6FmBsJbW/IdtekPbHrA69G
	A==
X-Received: by 2002:a05:6a00:414e:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-86167f9bf45mr42410694b3a.6.1788884072488;
        Tue, 08 Sep 2026 09:14:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045df8sm5970593b3a.12.2026.09.08.09.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:14:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:14:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Massinissa Ghoul <massigh680@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (hih6130) Replace sprintf() with sysfs_emit()
Message-ID: <da0d60bd-a20b-4294-a180-fc960f2b38ca@roeck-us.net>
References: <20260907-hwmon-hih6130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-hwmon-hih6130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com>

On Mon, Sep 07, 2026 at 12:35:02AM +0200, Massinissa Ghoul wrote:
> From: Massinissa Ghoul <massigh680@gmail.com>
> 
> Use sysfs_emit() instead of sprintf() in the sysfs show functions
> hih6130_temperature_show() and hih6130_humidity_show() to use the
> preferred kernel interface for writing to sysfs buffers.
> 
> No functional change intended.
> 
> Note: Not runtime tested due to lack of hardware.
> 
> Signed-off-by: Massinissa Ghoul <massigh680@gmail.com>

Applied.

Thanks,
Guenter
