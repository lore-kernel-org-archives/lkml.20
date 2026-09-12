Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC638398F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230474; cv=none; b=CnSHlL8c+z8QzbHOZKjh1jF6dLcgk2DfgljAJmThtt4exlip24uzpsS0amnTlSNapOTYoeimvtrrSXkqWosFDYJiVk7001/oEKkZ+qb1PPk8NeQBoWbCf7drrRITWbQzzUgD7CLoBxClmigjJOjCBn2iYOIEwy+nsuQVnuxHvQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230474; c=relaxed/simple;
	bh=SB+7ZypI2a/DHX9aPHHGLY95kw1SSDbas/xPaFVh4bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwck1NVGVlGp74Jt3NhvVWokQieRunXY0SsKgkVuEYlrq4kvTBtMxh20MMc5KiCHGBGv0FS4rfL4AjvYSzyk+9S/m/RRfvYVr63WX9lRuYCyVbNpLq1lZji/z81HusYPemst4O3hxXJdNYcKd3VO0z5Ovc9xiS2zAZ5keRgMsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=fXBL9xkO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fXBL9xkO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca94bso2538715e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789230470; x=1789835270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLwPFVSH6fenxtAVKVtDZP5Su/rpOuHfnYhbGoS9nnQ=;
        b=fXBL9xkO4jZy1f4XIa58x20MJVNE2mGboeZSwUQv/AjD3VqWBzuyea8Xnj3l7WZ4eX
         vKeI4iwW54VI7CYHiQM9gsCvDSCgxvcv3yayt5Q0uuFcFtKmnFhUg8qmzee5LCbJCxM6
         0MFAfVCiB6NLY0oD9UQumIW38KsixAvzd5VEDwhqTJNedqjZ8LNqQva9pLZoLzbSSKVV
         /gcNrS4G57LhVe2MjjSmaAvO+KkMcZHVEVV/miFZvuvNP2WJ5UXgCmpB9jl6Uv4Wk+9R
         WdyTlsIrUVX4NUD8sjYQph8wPo1UWDo4B4XfxHMLdqpkJM8Yb67Ir1loOYvYNlxBjp5e
         NGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789230470; x=1789835270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLwPFVSH6fenxtAVKVtDZP5Su/rpOuHfnYhbGoS9nnQ=;
        b=g7LYyVtlEXq1K7pxnhwBNG7hDt+dPjH5KJrlnQFht3rN5dm3osObDHxL9lSNH8Rq2b
         6uCQZuimU9srA1Dn8QImVxvOn5JoIfUONEKcczXo1agsmp+376D34Bp4pBYAqemF/93V
         pN/1wwVAsE1pym3IHLuoUcERrySaoRbDJeOl909CsvcHS6cpzSPmgrFOa4XgeYxmrlFz
         e+y1rA5NElUWlMZJm0v2l77ZM+YXxUKJAOVI2AEwT25DIZ+Y+n7+QEPut9qKkOARgmf6
         +nEML7jejR4l8alWK6WZcMEG6XVT+GOY7n/6VBnM6GfRbRGx2Ze7XbWOWqyov40Sa40R
         c+bA==
X-Forwarded-Encrypted: i=1; AKwUvBwDAV6QJoPxxlhlPmuGyUwwRLNyIFKANugY7BI4Z0a+B+NaJ6Rd3kmRFTaclKdA1z4s8BZIVnV7MKjXBIk=@vger.kernel.org
X-Gm-Message-State: AFuF++lQye0CYa2muUgiwAgoyyf0zLLXdSgFyXMaz7RTBFbxer4UfivW
	sWHKMv8V/L2kNdnqNc8v6MfI3ODQKzgU0eTXPCgTvyd6gmQ71i/nJFL9EnHT
X-Gm-Gg: AYBFou1cszocbL5Spv6DXMPE6QGdORIp6fUnVk9KcOzPtACGd0KRTDNZKaUK0F1rT26
	ohX11xuz0KmxJ6IVlPSiq54wgUOKst5o+9RdYJjFVGFBfNdxlV21F4UqjRzAnBfDIOwL8IabbSc
	HGZa314QRmYgcvQtV/NqJPZCEjLvulsmbXy0f837YkcsSc7z9+LiGMg5m5eroOUCB+HiQmslv6Z
	o9lb+1nP7uCk13QJZUTeMwGdOVl+HNHk43HjrEedf2eb8Ai48NABHOh6S9o99VfmWcJfHZIvrMR
	SMTMVgEuLlY+CIMP7eLiByvWSh3HsAbFeBn47ilSSN9Fp6wcEzVstpVe2nk+DpT97Cp7Nb27VA9
	+z3kDh0wGEf4iYk5OqzM+GM0aNIb9SP3/eXopzQAQ8Yl++b1ufUsIMb3l8KF+YVql7BHKrb3Qo3
	ScWTZqKcBL2l9WiSE/EkLF6CMYy8w0U7idvYukX3m5nzYD8MUGrGih6u2om+/lNHbsWhNVxfjUz
	QFzDzXQvQ+V4gmTKFtqx+VmTLpEOdENFEpZrVx0FhoV5nXPJU0=
X-Received: by 2002:a05:600c:a04:b0:49e:63cd:31fb with SMTP id 5b1f17b1804b1-49e6caa2662mr32416415e9.9.1789230469857;
        Sat, 12 Sep 2026 09:27:49 -0700 (PDT)
Received: from [192.168.1.3] (p5b2ac4da.dip0.t-ipconnect.de. [91.42.196.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm183298795e9.10.2026.09.12.09.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 09:27:49 -0700 (PDT)
Message-ID: <473b0515-41b9-45cd-823c-11c759a7ada4@googlemail.com>
Date: Sat, 12 Sep 2026 18:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 6.12 0000/1376] 6.12.110-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 achill@achill.org, sr@sladewatkins.com
References: <20260912065607.535295758@linuxfoundation.org>
Content-Language: de-DE
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <20260912065607.535295758@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.09.2026 um 08:40 schrieb Greg Kroah-Hartman:
> This is the start of the stable review cycle for the 6.12.110 release.
> There are 1376 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Builds, boots and seems to work on my 2-socket Ivy Bridge Xeon E5-2697v2 server.
However, I see the following dmesg warnings in this rc1:

[    2.357525] Driver 'sr' needs updating - please use bus_type methods
...
[   82.818407] Driver 'ses' needs updating - please use bus_type methods

These warnings are not present when booting into 6.12.109. I don't know if they are significant or not.


Tested-by: Peter Schneider <pschneider1968@googlemail.com>


Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
