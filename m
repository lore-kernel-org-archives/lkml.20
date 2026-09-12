Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA74372ECE
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248156; cv=pass; b=CXC8KS4zRYcDs/hhYMrZIjyhyDzLV+0K3ndfM8PFWGypYHsAcnGXx8+Xyt2MDBLpfAz7+7sL5IWL2gXT3m9cinmkCxRUg1FG8G5LQq3sHsx5hFBSxlJlb6XMGQtCKLSbRK1B/QQlr4WfNEg0acUxTi81Cb7pFc0iHAkUs60siIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248156; c=relaxed/simple;
	bh=K6b4Y85zB8F+BBk4idWUHIeZSzCGOJi00zwSBhhsVs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyzMNzFdM049fL9tJCpkuBmD9ffgDbl/iFCXLdLncj2qKiQzPsf7LsQ3P7NtBaEc6QKYkLKOHXu0bJo5MYpEY6RTljqIwsRenUxmZLZRzBlT3SXXHRDbi6/2ESZiL/tiPv9ESrVaXpGYVQE6T00rHXV62z45bZ3crFCY0h2bCCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=JfeUDq53; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="JfeUDq53"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so204910366b.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789248154; cv=none;
        d=google.com; s=arc-20260327;
        b=YsNfW+xjQT9oxww29WLkBhAUeZHQqG2EN1l+e8NHmBgNQGwMqYvn1Ii/zmLEhu8Ovo
         san0btuko1Xu16efNdQlpvN5BvLi+XQ3Mbbf9bzXA+zwGu5eam0GjXPfUBvAPtdGD9Jk
         Uws9AlEXJBOJftDPrmAN4GsmA2ZSMCmMfI+KnlcI4ZY6cJWLxnX93/XLXEb1xE5OA7YC
         xNtVQlwZy9necBw+QLpPEukbbD86zUW+bE58FIc0u/BqRIczUAEWVvHKzbA/tWHjRl8o
         QvdF0Fr+WiTLjLHLSdCIGQrKofQosp+ivR7eLNSe7iuu6YrtseMNRlHghSE3qykM5zhq
         ktVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4+uRYIalsrhw+jlcX18QMk7mu25CKrBRK7xynbg1dqE=;
        fh=TGX9M7dzYsGhaBXbhT/q2KWYiXGKlD+xU/XGNbpAuHg=;
        b=sdv+peNO1PhqSR0z8MtwmUlwoL+eyESzM5ga0r0MvvGwAac+drJ0ksur1XNqeQ7s1G
         rO6FJcg2Q01tYj4OG25ObNtPV/6nSjbftwQGcgbCiknKZ/73xgHUUov1emS6IbBgXeQu
         LoWsqB5KIq0DUY4E7fdRGs6YN0kaysMehftUpLfNsybQRvv6K61g02vw3HEJEBKXgWfQ
         WupZXqi+zH1+IEIYHV4XJAlsMAsS+dnPLI77GgfDMx5gAG8TLRl/0z6liuRlwQ5PKSbj
         I0i37vFqGMAXNLq9fKZLYO4sUnG5muIf2sZBbQ9JtBR5gp5Mp3LH+mBnq6WYOmhr/qjS
         d7qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1789248154; x=1789852954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4+uRYIalsrhw+jlcX18QMk7mu25CKrBRK7xynbg1dqE=;
        b=JfeUDq53jcdRKrQtu7bUXKjMkqNRBIw2Mepg5BfAFgnwbA0AyFAWkgIDpk7aDbBXl5
         57htJO/RZodMMddRa7PYLwqyuxoe2vn+6S40SErhnc66WyDdnRhtwHAODXuok/Q3N2W9
         2as7MRbhayh/YiGSjsfBECs4VFVEzPjb/ebv3w0Tymh+EdoeW6hB5L5TG9wKxCMS+TVq
         PwS5LL5YV3iGEHzAdZ+lq4QZmVfodSY9KsB3PYm6nXuk9P9WLO3D9OHOZkSI+TeBkEfA
         ZNjUlUnQcru8rE3uQoEeuS/Vhp740i6cqYzcUCRsKdrv1o/TmJmQAfKY0bbmGzjjdBCf
         SYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789248154; x=1789852954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+uRYIalsrhw+jlcX18QMk7mu25CKrBRK7xynbg1dqE=;
        b=IlaBvGpjZ0qsDOzRs96XmSho8J7R9B+e7Ztr44c5XBmFnEH6UYMlAunQ3fTrivbJIj
         72rO8Mm5HRq07V2+srxz6VmEhvWo8OgaR5k0k+EKpXWJa52eE5NwNKTbcrsClUeJTHJT
         vUDv0MR560fMKF2TFLF8xK8nFmdzbIU5eIadTGJYJ1JzFAnjhN9tEDsmsTtlB0GqR/Cb
         Ecg+TKkvY9gl5FJXGcRt5/iVhpUi7IvhfRb50LbiJpNmRD7LG2ubRi+oYQZ/cIvUtCZ4
         PORijkRUbkMdqPUN5mRMLVjdrMZx/rXKjNU8EgcBBuhZpnvE3ikLhNamw7OzWdz1Flrj
         QUFw==
X-Forwarded-Encrypted: i=1; AKwUvBzuEZyTAcqxbu5YTyDaWS+tMtZnMhLJjwCmcTU4fKI+Wq65MXxwMy2ZJ70N+OAL+CXQO6AeBootQRCKQBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8vjY2YRmjByJgn/wEuLZTbpvb4Gg++hLM78GNRoBsAKXUub2F
	AOPEZ3N5cdfOcDp6wRFVxcXU8NtaspMhDGnrgcfiHCL0h0BBzhKVUxpEPX/TS5QH6Nu/wy6lNGK
	SBKtCIq5GsdNNOeI+A5uKZGDstcDATrnlGKgfJZ44Nxg9l/DAiUofhZ0=
X-Gm-Gg: AYBFou1SD6QNvYuMU5B5sFJs31mGd1fCC0SLy+5BW1XWMSyprPfyJXRVBwHOr6la9iP
	OmAoal6DAo2vJXK4fMxXjWQI+PpypCsybifDGJC9/2R9OfERDKAaZnwI4Gusuyk+SIf27WS8GIX
	Jl/BYcjQLjXGDe8x3p8fToTH7m+EKd1fd9Eqdcs6FL4hNssr5R8+DAJ2qj8o1MbSYfnWMBPAgMU
	1jeT2T5iDcGuHi4pmIPSFIyhUGHe9I8UCen0h49EtL6gveVb9v/I7PYoGmcVbR/nznLeOhZ6UWl
	ZQ2m7z9S7U+XLipBqCpqpa0+8ndCOxziBdLRGi3CMO0yJ6iAmf5D26Ia
X-Received: by 2002:a17:907:1c82:b0:c29:6291:e38a with SMTP id
 a640c23a62f3a-c29665acdfbmr1025781366b.1.1789248153717; Sat, 12 Sep 2026
 14:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912065648.999753832@linuxfoundation.org>
In-Reply-To: <20260912065648.999753832@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sun, 13 Sep 2026 06:22:17 +0900
X-Gm-Features: AcwNN1XKQfCG5_IOzoP0tn84TLT5vhownt9emT4x-a22NExaXwsm-snsvHub1FI
Message-ID: <CAKL4bV4_Pdw=pFU5RcCTpNuWmbYNeEB1jkCtwuaVNWJcMSfBsw@mail.gmail.com>
Subject: Re: [PATCH 7.2 0000/1815] 7.2.6-rc1 review
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

On Sat, Sep 12, 2026 at 4:07=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.6 release.
> There are 1815 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 14 Sep 2026 06:54:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.6-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.2.6-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.6-rc1rv-g048ea6124e84
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Sun Sep 13 05:45:30 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
