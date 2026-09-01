Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF930F7FA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268458; cv=pass; b=J1YI6M/59Ucu9B3u+Nsj7vfNOzQwR+ZSEgc4EBCa2uXzlL57AOZKkblHwk5mmzjB4Ug63MLca28AK+pvrBcs/8GsFbFs4QntJ/0wL1bMGxHlFRo5hZw9d2lhquz3XDu/VQZbEan8fUc1xrGIMrspZrzby76J/vPpdVqHkFlHqbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268458; c=relaxed/simple;
	bh=2pR1VkxS/gjIq/SnugPqlvDTfD4YGBwZDpqDNXMin6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucGv+8oaoWJ/pv1r8ZiVZUvEJA0LgHNlX3p+5cd7Y6SWRnBhcc9G6XhlaEcc0VadIrIqu+Zav2UT6w0eW66mvOc+KGCKCupoOxnEYt9bxAAxYnuFth2CwquUHDDfBQuBpBMb6ooFkL8S+EzZtL5LDosDpER3RfJvX+AsifI/DAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=SAv8J9AI; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="SAv8J9AI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c160420289bso610366766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788268454; cv=none;
        d=google.com; s=arc-20260327;
        b=D5Z8Hix2nYLwFxnjXtJMJO+fKuQamEQQ9MjtVeDsCzgG8PjBlmoCVurJcOdmJuaK/J
         BAy+TvkQh47XiXqlVGhTvJi5TfqpiBQEt65QJ9X4lGpxsZNGjzTcKoAFW7pLj3MEBv+8
         Ob2lEKVr0fMiKhp7Y0eY5nwRQT89iGrddYvzG887uSA1HnnqTyMpxx6nTrOG1Pb0b9wQ
         brzjL6oM6lBv6dhfZWzpp45USoZHjBRlLT2VA/t/KK4lh601yiNrTmPndJQ0oybZ5n/Y
         4mY2s4nfZZQ10jakT67szM7JYWUSKB0HQLcprciiieVSji2/0xkJOlohih+DV797qNp9
         RYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCiwbEfdLnNOg8Pb0k1gzGYTQSSgjciG29caWlJK8d0=;
        fh=kGTyr1RyVcMysOUjhkioWSSCyYCFshUle2NZqj3MEQA=;
        b=EsoU3D2CAzwo+yjg+UTSSgImQZ6s9WkrWWUKY2UCED+P6NvmoZgh74gYl/UiNwayN/
         XuU5aajGvp3ZYMbDGRq7/k9sC/rwhVPNtVM1rBZ5OEBRHOAOj9c05on1W71+WZ+zWUz1
         Gl2m89U7I8/xhnK5rZjHcWkcHHPlhOL5Dse7YYf61gCbWEibKikYg3Ivm1S4MU7G8DWv
         9XyLIyz8rNl8TTfmVuOdDZTKu5UfrPj+CWaVFzYbJADYFmnU4sRMAI6cGKJ1/gfker2H
         UvQZlRAljq/HZ6kYSbpdtnfxvu6V6TG5NdVgnyLhk+9IgvuocLv9AV+S9flOjwVw06it
         ZCgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1788268454; x=1788873254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCiwbEfdLnNOg8Pb0k1gzGYTQSSgjciG29caWlJK8d0=;
        b=SAv8J9AI1obQLGknoDRqULqqEKkqvYLtJaf2AKqQMbcsuQriNtWj8Qzp/XkEAwogtf
         wyNsGuejfwqHZoCCqweEk6E255DCABAIT+hh3YBhLNpagYeM6WlMdC+bnkGdxuTINmdb
         1VT1pXyfB6GK/rKjw3ARrHinIZThHTlgzm+vHeqJCJZGVjMipjEPUGc7C35lVU6PykB4
         3if4RRwclE/XqbiUSyqcHxCEWaOR0Or8fa9juw/4B2WhGYDtsa6xhOPfqOvhntUSKKKq
         0jqDL/1zDwoJUNXfJMrl/9nJ96mknCxAMCEExvBH+3X8qSWMjgnfq/3qnO9hCN2DUjBC
         Nlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268454; x=1788873254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCiwbEfdLnNOg8Pb0k1gzGYTQSSgjciG29caWlJK8d0=;
        b=HBd+fMO+Pf7yQRQnEe1TtG6G41oiAgRVADeEyRXrWA/UXvxdopx67wC1VvUjTL7jc/
         ohZDkEiz2wk0l8XA77sT2bRkrTcGktQp1KNYxNanI/mHUk0DPxqJMaP07xj1JaXzSF5N
         giuF9ORXHlwIQJt3LqW5+3+u5Q/TCqEPA+9xMg9bD3Xz0CiqRW9skzojgcB9Cu3gDO90
         LCSZ/rDudxfv+auAxh4sUd1A0SK3ZatEn82SvddJxCyW7aXJ2vUFM2PFX6wRGqjBB4iC
         PdqPiulwMQdqa1vzMGYRkCUh8BuWw/Bmiu+XM0oSbHA+OPRGVfjpXBiAGCJSDYQHYaAL
         W+8w==
X-Forwarded-Encrypted: i=1; AHgh+RoX7bBbeUczoWksoWgZ0TAqxaw1lLA/NEzDclXp0+Vo5xH9FKBcZnqoaTmKeDqHEAZs0Ir6DqTnJSBZ4r8=@vger.kernel.org
X-Gm-Message-State: AFuF++lxK1ixmr7lKFj9ehNe9WvTBQbmjnPiDlktqC3y2nZW3U1WqL6K
	LCkPgru8lKXL/kpglPwWdVqOVzLYoUw+QA2DlouyJ+4MAjFwhbabUc5Ufehwnyt7mvc/dGDXm/v
	y9G8/7peiTIbRjiuVnZYdFyIOksZT7aA1HAS6Bg6VWw==
X-Gm-Gg: AR+sD11iictgIBd9O+nij1MftCFvi1eUFD4D2TnE8CtaiFKU0wvd9PStg9WNB9KOds6
	LaBPP4pIe2AwwLej7/19ztgySkFvJPvCHfYJVFiKir1Yet7QT64v5zFWxfxGLIPV6uKndcCCYFs
	2pSMs7dAKTtgmBF2CGQ3oz7q9S3Yk53T3SvkyGdzBjBnYTT01zAMmLP2Ud4N23eiMWWPr4H6HLV
	sMlHgLIHzZjPMiIxI/5YFhkqYrcsMIgZYdHEIUlL3Cun+edoOg/kHi6Yeev3e3LpA0trLFmZOoo
	OepCCPFkTXj+6O/a9Q1XEhymcFqAylasZwaEq6aRvpeNKA==
X-Received: by 2002:a17:906:2b0f:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c25b3cfe381mr399035766b.16.1788268454386; Tue, 01 Sep 2026
 06:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831133359.055927882@linuxfoundation.org>
In-Reply-To: <20260831133359.055927882@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Tue, 1 Sep 2026 22:13:57 +0900
X-Gm-Features: AcwNN1X02qBeBEsTRRDLyB_dlk0yVey98jPZ4G08FqdXCZNm1CnWmiScI8Li-c8
Message-ID: <CAKL4bV45SrCWVaZcbxQtqn-eWKx02v3yiaPXHxPp7sYiekmxiA@mail.gmail.com>
Subject: Re: [PATCH 7.2 00/71] 7.2.3-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Mon, Aug 31, 2026 at 11:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.3 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 02 Sep 2026 13:32:19 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.3-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.3-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.3-rc1rv-g6f58b86f6270
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Tue Sep  1 21:07:05 JST 2026

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
