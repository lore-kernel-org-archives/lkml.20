Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793881098;
	b=OdU8HM36by4eO3dVQC9IEcr8APvHbKaQMZfsPs5g8mNtPOIlc/7+qPe1zjlebxs3im27
	 83J6ajhorZjLAJ/iInMHgeAa04cGsD2/8G8GudJGFmRirsnhWga0PZC0RYWxjXz5w4tTi
	 s8IrUu/q2Clw6jwxuwtfn2YWogFQqtaQhX19D7vIMq2cM5iPXJM2VyU1o8LQXeT4/eH1M
	 0jyZOCcUDXD/7D5nFqlQ3beNbITB86HG+SNP+qwlmAczeu8zSYMY2datjDBPODDVtf1+4
	 n+e+IsWNTn8MjIYbVOADAIcTFANPceMv1hvQ6ASr/4pHbFYTDMfBhoJGkXi4vWnyarA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eefMXQAgx8LZwf0Fx8BRlWFmLt9F1+J29m11Vy9njI0=;
	b=WoN9tQFSM6ivAVJfeMSnwvjHz4VyKdjuZZn3l6s+BRfZcktS7oNrOgV1EI++JwnfLY5L
	 37ztqXfs9P6eB5DHoKDD+HtcATZQDc8licOPfH9N+GhXwGO7wr8c5anYaS2Ppda5zBIKr
	 xJIiB+wwYs1pfJTslExhq0gIOaLFQQLY2LPAjol3XdbLV0bby9IOhXa1hCeazT/g6oVcN
	 Yjer3kl2CR+o3HJ+KxHpDGNrdqeeVT9j+m+ndjkHvifAW4xuId7Jd/mygoAsLQy7KUPIx
	 KIsjcnHqtoyVYIWpayBpuYl4SvTDyvHgEn+Mqd8rPUH7nqRxpIR8hwBUphovIO3Lkaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=I8vsUZP0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F9A6082BCA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F9A6082BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=I8vsUZP0
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so280053766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793881096; cv=none;
        d=google.com; s=arc-20260327;
        b=hYtdrFRCQXK7xnFveyUIxhHnYgZ0eAPW74EHt3mhNvx2zNAfaLsHcOmVjOgdjvh+Mb
         Nyk5A5pX+ZkdLk+YcgqBhG/T0Abg40yYIc8JWoTUuccVdkz+BqqFHcqhC/cSctabt6/s
         xxUsWov9/AT8mEiusp+r8gpgkzr+aPfhdPyBPtSizD3ZkFA5A6VlTULegTkiXNcW+ESu
         6SAMFnX1zPqIFoBEXbMFO0QR1qhNv//7iD1Yd5z5ifMwU7DoikNVPduetNRS2lwra2IN
         f+r6ZqH0t16qj/CXcoeimc1J5MPC21epALgzSaYHntj8jDDpuLj2UfeKRY2KcQIcnqX0
         TDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eefMXQAgx8LZwf0Fx8BRlWFmLt9F1+J29m11Vy9njI0=;
        fh=qZgPGsuy5MV6IK6z/YVGEyXmbTLmXR5A6wn/CD2GlEk=;
        b=TQ81bdkLaRzHynW8fZ3jQs3B8sN1pkZed+PrvDjWvzgcdm1nwWMia8aF209l4KC3IM
         Fuv1eHFQhcq9x1ql2hthzqkSMDRYXvAWl7L5poNOKvRr60iTxzmjzMbO4P1d1yTr6sbM
         7oPL9RnUYhkcv8cgeGWkVmHWsP+CYxAuoitjIoysjP7ZfWe2zrlo5Z5F0KbdnWzs0tRM
         6ckyK20A5029Fkz2A7QourrNZlBLg34VQfwUamzjuRhuj9GZcrZ/qJqHrW2WircF+x7P
         SMwGw/iPs01nW6QmvHsT1mYyaxVGejcoyExZFE9/0uW0ruOQKetGtx3YS81Y6BrMmvnx
         xjHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1793881096; x=1794485896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eefMXQAgx8LZwf0Fx8BRlWFmLt9F1+J29m11Vy9njI0=;
        b=I8vsUZP0H9GSmpiQduka/DtR8wsUcmq1RCpQijc6ZG39Xc8UMnTxn9qwdiMi/OkjGw
         LvStQ5IglRUyeX/2fOYxwPtWPD3y/AWIQRsqXlPUgDOGq8LTbckr77vyADGjwrpNe5nA
         lFebWqwJaf2jvPlvhZHOxf+k0zW09IoInLEEcp6YtAcyZGHRV63+iP25Y0GME0R67LZ+
         vlRX39VGczNVYr+M+fIDNjJNO/r33cIt5DYGj1DE9l57HsgC1UyB+PQAA3HYmcpHZRym
         7T5wRaTuva622derdAbl08OIct4f6MiUAPojxvuik4dn9/hNnuINABsjNKmv8ZTa2tv5
         eSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881096; x=1794485896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eefMXQAgx8LZwf0Fx8BRlWFmLt9F1+J29m11Vy9njI0=;
        b=xQ3RQjjZIOK9Q/W6ojaiQg0on1RfuPt3v6bO8Y6Ogy8Pdkpt3cqXTFME1lkufh+duD
         3LpW+FqWY+YGuZ0/hNekXfqv/TPUhPg2KTCXVIPOb6aSH9ZmOs7gJo0jUrtj/Jd38/4a
         XcwrVNjZjxa4voHZHEwtKeDJRIwtI2XeJK64xGVIJ7vgOW+v5G6RLElb4bRxda+cP1o9
         8cB/QX5apYHfWeNYF8gnxJuOEJiYzR5FrXzKiIk+Ij/r12okeLfphNfSsw51MjRRIgKy
         ExPLaDnhygbgXAU1Cz64oC0ZqblOGUfWhXmOO99H6gbPmVvhf8oZS0HiMbKy6Xd6KO7h
         Wzdg==
X-Forwarded-Encrypted: i=1; AKwUvBzxREdeVya9M/98pg8o8i2on7UZ8rXBctmo1rALPfL8tJdugbsjjsWnFqugMagACF1Gzn0E/dJBI0KBBH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9zRFskutAo+Abg1qTjdXRqB9oKpljczw4wHCl1RHHWHVaBXwN
	A50Iqkr9UpS3rTSEaLQMpRnhKPAdGiQC6so2gyCJT5A486blKVIQ9kbBeCMFcwB3E0nmH4RhpVP
	WPvQSt27ey7ZxBiUMIVX3I9zZCeUlgAMNChKQtimnSg==
X-Gm-Gg: AYBFou26hhBgFk1TH/nrq1X2HWeasQBydzcZJJcN7iY4ZXRgkpxtYGEzrdIhBIzo9XQ
	tfY6AJJkqkLJaAwE8CVGeGksjsZ4WF4wA8vlpZvWwm/Rm/oc/L0aeqklHJqOMUr2ke8CSasQyVT
	Tnx1be/u0O9tiJuFTWf4TdgHcjDKR6M+BOh3B7avu24MaNbKCa+6VOeuXcVpBeevAtgbZqoiSZr
	z5ZJvXcAdJg8tjyX1lKZzrO2APHvDKHHR6I8ty/U0k7Q/c6lLqwiysSe2JHI3xsnZFfOmCoP5Kp
	xj0bq/l/uOVa2YUpDyCnShiOBI0XccWDzMjhWCIP3TKF9hTIqFFvKzVcNR2ERqsewEdiUUJ+OpJ
	OyeWgqUP1OOhdDS2XNL6sxzO7FmYd4liN8Ig/
X-Received: by 2002:a17:907:6d29:b0:c33:dbe8:291c with SMTP id
 a640c23a62f3a-c4ca7a4dd2fmr1811633166b.20.1793881095505; Thu, 05 Nov 2026
 04:18:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104211038.406938024@linuxfoundation.org>
In-Reply-To: <20261104211038.406938024@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 5 Nov 2026 21:17:59 +0900
X-Gm-Features: AclHuK_xKzr1_jGZskftgS9tYbRvEAvyWrEkQDJw4-ZYm6nRuyK-hjQJVu5MVE8
Message-ID: <CAKL4bV6VGE1J3K45KsOfo40zsZEZav4rxSVGRR3Rs7Z2E94_UQ@mail.gmail.com>
Subject: Re: [PATCH 7.3 000/547] 7.3.2-rc1 review
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

On Thu, Nov 5, 2026 at 8:41=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.2 release.
> There are 547 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 06 Nov 2026 21:07:23 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.2-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.3.2-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.2-rc1rv-g75eaee7a6465
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Nov  5 20:31:07 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
