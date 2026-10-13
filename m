Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4AD52CCF2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919186; cv=none; b=aVimSGnMyt6LKqEFOOeWXprf6xaVR4i+g70bKb9S6AWXcpvhlQBo5UWoQrP6tJI6uqH0IFaHGglN+WzcpsQtpZ1fnC+49fOwAgyriCFHR5o/+sRc7XzDQDfNGfHc/7a/OiZmzwvz1EKqBhI9+g+nJ7SvXoLjkkIDDSdmVFr5cJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919186; c=relaxed/simple;
	bh=Q0xoJoHTPOGkBU/ykGam9+aTXGu8sCVurjmTpYiGjKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnnZErwG1MYRhgLB9BGQAtx6IOFaxPYhs5Gj98OgTVi51PS/1poeoPApkdUjsrDVt44Q4jfkvBqH5gZNnpwv3mOVhSvBdvPF2RgMzaf2ni44p5x5rLgxM61K2wnYx+Zu/aQfueFqKBHfV7sCOqL/D4zmmUNvhfwcSa6y2oTB/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLfz6Jim; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLfz6Jim"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9178510f3bdso44743386d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791919183; x=1792523983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfgvs3MJEbW2BwnwAhjd9SKbBYEufXUXojUMotaCz9A=;
        b=aLfz6JimkR0Rtx927ja30vUnHJfI7IGnPW4knsNAOshj4zU4hnyk60MRNOHWTjXXO7
         tqrY7QbSEy4/LcqbQDykFZCnhB6v1PSDOpU+0JFKxhD++c4Y9sbb682qlPSPHQQXYmRf
         d1Pvctgl0vcEcywr17rZRRj6FoX3acFhm551uJW4QbTrQV6qPA1OFYFdGGGXBuLPwGxl
         lBxmKGCZRf+yMuuJQ8tUvBJEulwmxTsW6BsrsiK2Dy0RUvqVeTU0k6gHauupgDp9qa73
         eooOp4KR+BlAyRtYzg9KsIGT7nyYxl3V3afcXxO2fct6eBKumJ6mDlc/1abg8emOB8t3
         9eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919183; x=1792523983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfgvs3MJEbW2BwnwAhjd9SKbBYEufXUXojUMotaCz9A=;
        b=VVgb/Z+jcuozo34NaS1AESAIfru/91ASpE+xbIJPLxekB+bE8ZmcmZo4wzO6mfCgio
         giaDFNvYxnJGDYZBRGYi3uQ0JZoIj0NzHdwtmJV9mrf+fKDkDctmPqDXgVq9oWQBV+h3
         gvsrS4fXXZusLr8wZVAHHfV8p0Di8HaFCwrfk/PGVqSnseubjwe9ldrdgreXYsDkfWyN
         xcd+O0sr6XNyUteBgKFhpICkRHl5oO5i5YzNdCAhkwvr08EmaQQeDLthG7YjUK6ULv5g
         xoRkZlP/iuwI4m0k1baCR+/z6en6ZFElmwmZtnUSz7PUwETVeWVbUTDLDwMt1RWXCkDg
         8Rig==
X-Forwarded-Encrypted: i=1; AKwUvByc5K/F/VsgZ6SzDzOhYa7sZTWbfBhFtZtFToMyMAdVoSXsmhq32K3G3SsLL3AX13LMbyX1vj4W7fpkiQw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzWt6Tp2HScCAHpClfpEUXBYC+SJVZqz0lpJtc4nC8H4NksJyx
	HmRijZser9KXycqVQzYR+z7hJuT7+Rls5BN5PzOGw3ZSUmNFq7cshXbC
X-Gm-Gg: AYBFou06TbVL461trNP+IFT5AQnuW/7AFE1s1Q3z/1yG9glkD8ZfMSNr3+NOUoNh7o/
	DU6X8qpDNotThQad3FDUhZEFEzyJPHOBl+t0BzK/OJBcR2xAgvS7sgpSg926gbfG0QepSWMwzmr
	/hDOXgLI/UyPt3nKRP6M+R96rgdfQfLqGNd1+IuKTpgZLhBJy20mYpLHIX9l+4Ii2LC1JVGISMV
	HuE2GJe4fy3JSLXfpMGzT1MeAtrjNlgL5iIMYgNrpP/C5uccBBA1Nz5gGF6mbi9oZNL45YoV4ot
	oAsI5IR2GAtLKPMeYhgSdfCkXzwbMTn8Nvff78FMPkS23RvyN2tisZ6uhEodsvbT7XZwu+XUfke
	B0vxPY6YlHzKjfjwN+RtLSKVHevRwfUYjoIYG4Ya0OFzbUNP5ddGA1jpSrZW7OGmAIVWU1rFjwZ
	najLDU12SMTTK1g+hghEcm9M1ue8V+EtwJA1WDxdoxYYrz4NdhCGDeXa5DT9cIT92v8R++200jo
	hd6sd39bw1z6UcRemKhVBT3
X-Received: by 2002:a05:620a:6606:b0:93e:bcbf:4ad with SMTP id af79cd13be357-93ebd24d7acmr2270223785a.33.1791919183457;
        Tue, 13 Oct 2026 12:19:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5009b87sm305039785a.11.2026.10.13.12.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:19:42 -0700 (PDT)
Message-ID: <0b797c37-afae-479b-b84e-68bcd8369f4d@gmail.com>
Date: Tue, 13 Oct 2026 12:19:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.18 000/621] 6.18.57-rc1 review
To: Pavel Machek <pavel@nabladev.com>,
 Brett A C Sheffield <bacs@librecast.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261013112920.855194808@linuxfoundation.org>
 <as4kGIjqjrKzu0O0@auntie.librecast.net> <as4ubep0jWRi-b2G@duo.ucw.cz>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <as4ubep0jWRi-b2G@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 06:13, Pavel Machek wrote:
> On Tue 2026-10-13 12:29:12, Brett A C Sheffield wrote:
>> On 2026-10-13 13:29, Greg Kroah-Hartman wrote:
>>> This is the start of the stable review cycle for the 6.18.57 release.
>>> There are 621 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Thu, 15 Oct 2026 11:28:22 +0000.
>>> Anything received after that time might be too late.
>>
>> Build failing on amd64:
>>
>> /usr/x86_64-pc-linux-gnu/binutils-bin/2.47/ld: vmlinux.o: in function `gss_krb5_get_mic_v2':
>> (.text+0xfc2762): undefined reference to `crypto_krb5_get_mic'
>> /usr/x86_64-pc-linux-gnu/binutils-bin/2.47/ld: vmlinux.o: in function `gss_krb5_verify_mic_v2':
>> (.text+0xfc293a): undefined reference to `crypto_krb5_verify_mic'
>> /usr/x86_64-pc-linux-gnu/binutils-bin/2.47/ld: vmlinux.o: in function `gss_krb5_aead_encrypt':
>> (.text+0xfc47a1): undefined reference to `crypto_krb5_encrypt'
>> /usr/x86_64-pc-linux-gnu/binutils-bin/2.47/ld: vmlinux.o: in function `gss_krb5_aead_decrypt':
>> (.text+0xfc48f8): undefined reference to `crypto_krb5_decrypt'
>> make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
>> make[1]: *** [/usr/src/linux-stable-rc/Makefile:1272: vmlinux] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>>
> 
> We see same problem here:
> 
> https://gitlab.com/cip-project/cip-testing/linux-stable-rc-ci/-/jobs/17139116508

And here as well.
-- 
Florian
