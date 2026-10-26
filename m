Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793012114;
	b=2GdrLpxMgnoz8igCNGsczzu/2yL/hUWxYjaro4+kSaAmPr8RCun9DySV0WZ13YLDcCQn
	 0OyalFQ9+xhZxit2RY4lXRw3UUuICikWN860fwuxO+Ald5/sYOns4RcNr7xzAaW/Q7Sxj
	 jR0FAzKfqZQKeNhfmN/GdODEYzsXBmTxzNL7DnjZc6epa+avWemwuntk5igLAqlTfoEr1
	 zhpbv9XScxk21iKkAA0a6pIxQOdci6R9V6rTOvLZUWaPt9giF01i+fqOoqWP9n8oeZ5q6
	 0D9TP2dQ9qGrx0OuiifrtFfB+VF3N0ElrWY0dBTaPxiJP39VwnduCd689aArsiYGGyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DV6c1D/6Qzh64saIkUPZG84ARZMJ/aLNg7R2bPrZljs=;
	b=goYdReQsUam6EHqvbxWXcfQXnRIUCF++Trzu1VcW01/iObXuBHCSzDZb+qyBiuiKBg7H
	 Ls7/T4lhjfdc7pEnhUYRuBvn/6gLIpPOpjbsNtko/FADmtvbjm+YuIkCEO3qW9P1fFoCX
	 hLUFstH2WT+5Vd10VADuIXf/16JNcrcmoYyOKtkKEAx9aS/PSJdxBVuKTT7vmUVI/N5zB
	 0QzpEcq8H/HCgkd6K2yzf/WAdteV+4qz6ozR37KWwy7OuGUraRiyXkiY1iDyGr0vKM0ko
	 O5RIqN+YNqDiNYa36jMtbCWaZDKnG8D0Qb7r0C/IxPVSHDnPigluvhyE4a/p81VBN9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=gO9QxkbU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AE5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=gO9QxkbU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso323482966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012113; cv=none;
        d=google.com; s=arc-20260327;
        b=ADlLKOrpRLVmqn1ckul/WVPaqY/WxI5/DeWIr/Om4ZzqWIrFYysvzHZtmVkiUyW0oz
         rNbuOWQ818/G7uoZ3nTAO5G5oTB5Ej6kJNp+F+KZeVnSeS//8BKLG8r4MehdJQKW80a9
         BxS0qm8pVaegMZkIuFF0ILOdUccL0AJRg7NS3x5INhDGNmnwX7peby9K6X0f6lOLWSWA
         uoJuM9HsqWRx14a395dZyn4nSoTIniquiBSpDBwNhvQDfF3/F2ry17LdFgcbdsynQMO+
         DesPU3b0wnap0BJM5Z+bKzAKq3bgWpkNDK6klBfFtwcvMjRZDMxwodCA8TKRhlmsRs1F
         UzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DV6c1D/6Qzh64saIkUPZG84ARZMJ/aLNg7R2bPrZljs=;
        fh=RfKVYEDU8PashZjtLtALyVDZR7hP6OzbRSeFwmYotf0=;
        b=C9tZjcgnVwNZq+Lrm0PTQo0rKZbG1X6OiJ9z+cToOR9oJYBruyfnRlLZRZfw1I2zv1
         r0IiLC5AvpnzyFO7eZNsK08jn+hbdJGQIsqTbCiC+RZKxSbyCYJVd19SlRZZPqtdqMIe
         4LE0FLRu4NlwKGgtvVynUHenOXbyfObArNUiN/fLMk1Y4SHYpGW2GSJ7nk8+Mbgpt1RR
         jtriK56qM+DT7Z2nHQ7psBMLTdKse3X7qIJ2EHgSb+RgW7vX7eZTru0zgU/7IbZONShi
         RnDnLLntk/HUZh7IFPDTskXpjeGgLHjOWz3D172FQZA0esowXYDSegFwRzSoyEHFnCCS
         tjAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1793012113; x=1793616913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DV6c1D/6Qzh64saIkUPZG84ARZMJ/aLNg7R2bPrZljs=;
        b=gO9QxkbUjDQdYzGYuh/z9FIpy587E9986cHZUbsQ95sEOS5Uqbh+txOIwSh9raHGUh
         SwSOSn++ihpEdc7jl3oP+iVComGWMmLfmEiYYRjifbC1jJ3fusu4a5qKSjsefqvrHjSZ
         3wOxpMrV92IaKDVoow2enrr1x1szTpjWj7hMlHV3b35F868CUWpjVLB7F4twuynEJzom
         FzXHuLFID7sUphr3+6jf4rKR7gzfn672s+PGRezC657WH8ApJ64qI1HzRhc6IfyytqfT
         iXaJaLmjn1kxFlVC4E336PekeYq1+sHJ62gfAapcc0kJ8Ydg9fGdhIqpMe35nE12awj4
         RECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012113; x=1793616913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DV6c1D/6Qzh64saIkUPZG84ARZMJ/aLNg7R2bPrZljs=;
        b=a5PxBduDbmW/dynegWpux45TZIL1l+LMnx63uBGqpR9Kdmz6DiWs8wZyc4j72OxlkI
         9nnzn6SCuxMAF/MJBVpsz9Mk9YzbHx5slFIzDncwS/HYIrp8Akl9kLtCB9weBPtJSWpd
         PkBiHw/IgXxZt6mz3fUaBDoQEQNDst41/ApPA30cjMIG6mEk6LemhlTm2PE7BhMboP2+
         4JjbuYdMxG/Erpcmu5tFSH07fcpw8IIFxyaqZlFdxPXyGoyxNgCn0aeXroNWIojXxc7D
         j7gaYhetFiDLGVIL+omzy1wBxbQh0K+1Xb6fZr9cC9RNG7tdQ9wMcmw/2ZMfcwfu6YR2
         whTA==
X-Forwarded-Encrypted: i=1; AKwUvBz9ZZZ8iStZXO89Rl4aG8OYxhBoFKyBsr5KI3pQXEO7QAur3BXhuCvzz8HX2eJ1Wh5EeJRP4Qpn8D+UB/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWnLjEpoEumRI3a/vQ2fIHBXo+6+AJ7FJVvm4OPOZlZ8SPKoC6
	DDDm7bW7aND900yJAUYbInhcjDEebdjS+oqISo4FQFrmBINzaENXrux6YrlnKUzHzklAWXExPbu
	3GHTHo31d9boJpEzagiQ4OEZxc8eh6JwbM2H/GUwqyw==
X-Gm-Gg: AYBFou1dgur1/ZSqAULn1JhBreGKSCm5BZpf+5iMCDCUUJmMfOciPtRFYSMf9dQZ7q7
	UUiuRsLa2EXFI6jon+XoVTa9RwmoYkd5r223FrMV8Za1X3uZt92BlJbiC19gHJdfk5aZzCMmA7d
	cL8LHlOsjZTViD0bFtbEDLsb4LUnf5PA6+I4FrkyoOOtvWlzEDMy3OgLTM5ufTcus+0wMLA+6E9
	WvV74TjlNE1sO2eqHDNyzrr3xhpjji+T8mbDmOwQpA3iK5J8BYD3x74OieHj6ytcNSWQKO2iTD5
	X5Q6/9I+Rx5IfQpTnW45BBX/3/wWWbi/57Tvsd+5OlZwX22bkZQvYtWyAWMIr3/+XSp34zYL/NS
	1esGs9kCId285LdfYN/Ci2CvIrzcm9RbfdLEbNi5EGzUtdAOCIFJmGel5PEgxEHQwuwJU99QwQO
	nzMW3k/Dt+8uFO2p4=
X-Received: by 2002:a17:907:868c:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c46bdd91e31mr719992566b.30.1793012112537; Mon, 26 Oct 2026
 03:55:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025125805.309934791@linuxfoundation.org>
In-Reply-To: <20261025125805.309934791@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Mon, 26 Oct 2026 19:54:55 +0900
X-Gm-Features: AclHuK8segfbyZOPLnD6APqICZs0xovJLP7DGUxjOh2pTrAodUPaMgSRzdULPng
Message-ID: <CAKL4bV68WauVRiggnG_WNr74+L=RHpaG2L=hr=D3TMn-Ht4YkA@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/231] 7.2.13-rc3 review
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

On Sun, Oct 25, 2026 at 9:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 231 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Tue, 27 Oct 2026 12:57:40 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.13-rc3.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.13-rc3 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.13-rc3rv-g638c94931487
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Mon Oct 26 19:31:51 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
