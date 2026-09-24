Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F63E443AAB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250680; cv=pass; b=SywHkRhmUc1P3e9yOjj8gmFkRdR0lZbFpd/tSxZjnCrpzwas8leOVBg3SxYAAf7hiLKAHdP4eDly7AzepcIFuAXseY4VYUtuVjlhO0sVKJak6a3UqhSzy3i2BizKn5XlRzK2siXVV1YmSkY2e9XPH/rB9aX8kkC60XaBgiezcn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250680; c=relaxed/simple;
	bh=beqzQKKjoxSVK9Ait4o2AWQYoYHmh36alBr6u7mmw2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5RLLijg0sZQLTTfMxV0Z60qyyeC0ivyQU6yueYb1eMgOpP0kWJgR+qSwdyU47IuZGRa/0oxMgzn3CEksNM6sYS5jmTykTXiZQLfiyiGJyyKhQstNIuoXSIjNZ6+95uGiL2Y6js092FlcLNDgbxfNGlSph49VkrEYTcvTeKWwI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=DznRrfa7; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="DznRrfa7"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso313559766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790250676; cv=none;
        d=google.com; s=arc-20260327;
        b=qNOvgVdL+ix6DNn6sem+YpXbMfxk3IHBRwFJpCH6MBxXdVXRMyT5nRkjv/iMbjDc9L
         jC2enQtM0eQ6Njs2lkSgqY/YkmokD1TNy7taKkN6EdavRESP2+2ROZLuRbG8b9nzmGAn
         s/r+qOh5w+DY5BwpjqNG4HBzS5borCLFY8L4z7TkcFBUpjKpcTYZj+/6bCPjyYqTR+Uu
         4iXKIAr6swbc+dTcSV7nzsK/qxtBAxBbOkCrY7BK1th5Pc++Et8dI84D/eHdm+bSo9Lm
         qYYw/C/nq9Gu/YghRi+FHrSK1wNf6oNmBzxyYoHK9886PVe04+E/Di+XcP5uXKljUfy+
         9t8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=omFqe/7YRCaMs7Y6/oYqn8ZEqPS++HtW5gJ+iDHObDM=;
        fh=pXZZt0QrpBpcYvKlYFLQGclD5cmV2yJQgyg1AzyD74c=;
        b=L2PKeHbOety486bBzDfNaqVileYbJ9m7NQrKsPJtxxY99qovFMN++0tkNQ++d4wOAe
         dRY6KBJrVJrgO2AppA7zwWExaxxOC2D/cA6+0v8Cf926qC84SJWT5J+HlxTT4yTInZnv
         W8kaJAEjuh7EW96GfTZtn46LSX0bjizyt8huuEUeDL+XcqWkQrjv+8hQmFo5/1RTaf8o
         DH/31AlHqNb3Fx0co/zGZPdWp41antjzgR1QjgCGmVM4cG6v4d9Z1v3VxRu/tbwhI95K
         crNf/s+rYTaHe8UpE5e/MSWpDRumvMs1e5x6e0J8knH6kDI4aakclJ9jY3GrwILDVKB9
         fUCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1790250676; x=1790855476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=omFqe/7YRCaMs7Y6/oYqn8ZEqPS++HtW5gJ+iDHObDM=;
        b=DznRrfa7ItvCi/j0cWXpGUaxAND5iPx1l6/8I/B7W8ysFoKCzPEtyLjK23J0dp4Zqp
         ibdgZ4S4qHIRCrWG8ILW/bgfmMVTCmRNsdyBn+j1Qh5NESeQIZ2Kkfo5zJmdM3mhgl1C
         lg0RT7xbUJ778K6ex1fwNPAo3fHUUh4MIaqX1zo3eshPw81WEiUsG9qwM5gGRQ7f1che
         YjqbkIpaE0pqY7JHD14RUcQsysD8JFmgid+nbk3YAkPMhbD1bGuLclLTmHybGJw14njo
         oZA6eadjq0l1GbcM2bF350pRuy+0fcnoWm4xTx1mjPPG5/f4/nl5bBOmhgMNgVf9+xHb
         f5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250676; x=1790855476;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omFqe/7YRCaMs7Y6/oYqn8ZEqPS++HtW5gJ+iDHObDM=;
        b=2va9iD70lqayylElfPcDUXNWVy9JYUTHOwC+/Op4pwQP6hFzwUA7+d9jWmB0bTBHyv
         Nuk59ObWVoS8PYMvbA1tveUPj/yXdH+mgILll9uzUWM2OaWyQikfTm7kuRQdE4i3M0kx
         /nc37po5Hs7lWWdJY+A8EKGgLnSGpIduVz/Le7PLv8cTImSDPLfBKvbrK7F/Mhb6D2s7
         CtwNQkDKeQxz3QZ32H9BihCBHqzfVUPV/VX1c4ZQXCPspMG8rAzOcepcLWHlumzty9FO
         yQXdJthc5vzWHVKnp4phUx/wua+TQWLVvxUYbc19q4uRFW/wH/5AoVKG0FPKLRvey+Lv
         CXSg==
X-Forwarded-Encrypted: i=1; AKwUvByY4Y6ycQ7Tcz1HNSzOvZEfRQ2lSwTNhISluejDXrdB5beGxIRA/P2wOY+8RU2HD+XuZHgkwUh+T0TB/Rs=@vger.kernel.org
X-Gm-Message-State: AFuF++lkp1FxkRmUw576E5+HzoHJfis7Maio2tMJbbq/ZuK1iWWyDgRA
	lUL2slund4w2Qihhrd3JGzvY/w53BqTtlpZVhBOjxA0fTgzDck72iH0QG7snWrWsgmwbzp+1PeC
	SCNMqxLnmtvv0/T/T9lh3mE4qJOjdtFAsuScFFthq2Q==
X-Gm-Gg: AYBFou2FvcvLhYjFeg4TNmnJdgpc+35iDgBV571uRxeB0ulzl/2sNtE8aEsdPt74QOC
	lXVgYcQ3I4l9N7VrGfvCDH4lta8GZrs+XRiPMOfouHYra2XdN+BnrCYdq/xp4opkpk+L1mAAyVu
	1shOSYWg7t2H9smTT/R1GTt0Ka3CV9aJjSz2FcnxdKxyvqMgr8/6032krfxxA0rRlqrbyonhITu
	QIeTwi2nr/3hVe0nZ4VUeEbE7vqvHaesbJLJVZqKBYEi9jaJ+7MQmeGGDZ6Vv3zvmXwQy0F8Yxx
	jIYjHRd0e8hzG8OwGiIoKz7Xj6145g0BrbxPrB3yEKalHpTUp4Nhqwq6
X-Received: by 2002:a17:907:97cb:b0:c25:6230:dfcd with SMTP id
 a640c23a62f3a-c2ac239eb52mr194296566b.15.1790250675739; Thu, 24 Sep 2026
 04:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923140644.756254324@linuxfoundation.org>
In-Reply-To: <20260923140644.756254324@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 24 Sep 2026 20:50:58 +0900
X-Gm-Features: AclHuK-Phr3WDpb7SshIHOAYwI2RYTxswDPC0MCmKsbJLi96tShPIIuezgDdacA
Message-ID: <CAKL4bV7H-9F-JEM2ohs3G6GyC5Gi-C2sb0wJdixuObcE-bSuCQ@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/438] 7.2.8-rc1 review
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

On Thu, Sep 24, 2026 at 12:19=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.8 release.
> There are 438 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Sep 2026 14:05:46 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.8-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.8-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.8-rc1rv-g54e8ef17140e
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Sep 24 19:15:39 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
