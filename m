Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE024E77F6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731841; cv=pass; b=RsQgY6eBVTJ66pKqqME7drRLZJSz7PjAclEEqBFyja8ZyXDpei8sQovSKSubDYapyNeiz6fImL/1neo5h/uBrQCMU3Xg8KwlDdUcg/DLx0epArlDFMDVccZskBVmA0/yzsPbDkTjYoPZ/wsfN58oSgtYtjIGEE7MnaWzdHh4qgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731841; c=relaxed/simple;
	bh=7YChWHA/9zL79y+NcFgTh/UhwmYRTNb0NTKwCE5ZPiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtpj5siN/JFwUWVhr4GY0mSzODKO5RM08azOn8Huf8xvIoq17dxsUuwt4PDVqzjTpvX/cNRmLKUYjWLVL8L8HnmpStEULfndGYy/Dt6GTqF0lnR10Z2jBDC5ltUewlVEaq9Yio4qNOe7CnbAVcKn4FdFnpAQwEsbMEElIfPq8xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=s59GE/IM; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="s59GE/IM"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso81288366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731837; cv=none;
        d=google.com; s=arc-20260327;
        b=mdKlLdLXWGnwB+vK6B7+iM3ZX8xapXeeGHvrM02wVxsEAxyItKz1ySGgxtNYIKDTOq
         Y3PCo10v+9j4QDSbVwXNUnRm+Mn59BiTWKrnfQ6o40QSk8XBtl8XmU08xEjzaPdgygmJ
         WNztq/okKKzVhcZJfISGBMfv141SuLGZt28tDaL0W+extsQCAsBVKGRY9WcG8XQC7DDl
         idAs5jUuXJ88ZGU2egcLwzRQdrT0JX58euAYq30kkHzgOouQtOTMPLxL7+28+t1TL129
         KtHQ1gJImvALquxxJwKlWvStzlCunEQBm1N+SU0HwqMc1DsAMSZrbNXB4s56YXiTmzUe
         Dk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA6vCQLul8Tx4ZGiErd+xrb4iMlZVj0qj1da7dMX2dc=;
        fh=HIPJc/5Pi2zc9z9Qx3JQ9G/EEjK62mqBy23mwekUwyA=;
        b=hd5Uj7tmWus1JHd1yrRuhYvRJy+zXvalyfX/NV8A45cI0LdIrTNP1kQIeP8wgJHFQV
         FLdDg7+ElswBO7g/h5KR6HWI0kpgFRx8a4IbCf6i5fZqXrCjC6OLnn8ncunfv1m8e8vW
         B/KxrtSF4m4bItymbJ/j8X0ugnzs980lH8jw4vLu+kR5vXtDAVhsd9YsfdDLjOB4dxwk
         MgDv3SzebY17TtljvkkKuPbw1YGUkmQZQf8IBt6xuESqYFGiX++Lxam8ITRzxdfNJYUr
         HDHMe9TP3iljPXsTXCLR0UN3+oApvr8hG5u9+suQ/iI5MmsLzlXBhyoCdGzWaSOUILcm
         At5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1789731837; x=1790336637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA6vCQLul8Tx4ZGiErd+xrb4iMlZVj0qj1da7dMX2dc=;
        b=s59GE/IMjZMml4lH3UIQsPnVnyW1/VfJi1460mzb18VOnjlX0b3Tvf3HBnOfdQa2yR
         iKTONSyNujv65B54HMS9koiMwvsDFPh3K2OorV0YKTxFJgVH8vamlxpeKCRVjHZPI8X5
         Ly5M9HMZlu3fuWt6hY5cw3fbiQqBHdh0HXRvJkqGDP6/QNeZGhK8v21cAuS4sfXLiP5+
         HkDCEhsOPtjAH/zMS65kGZHXn/Fow+mYtF/GwBwcYduTG7cQRMtY0yGFpZIInuGQCGhY
         c/JRj9PoUwFC5OW3e76C/mf6hC+exiFaLiH5k/i30pM4Ro5GWaXr9R60jL95JXGgydRj
         j9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731837; x=1790336637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA6vCQLul8Tx4ZGiErd+xrb4iMlZVj0qj1da7dMX2dc=;
        b=0exJb2463o88AuxYYoKou7OlXSArB6+ELAMG+ZyABp0XoeQTseBok9bPUGkT//+Ze2
         3j02sQ1zl6zwi3w+blYCO6+a5zw9uZGNl7Z7uIhBgji/KJr5BpMYy1vj4DC0nn8bHm64
         Qg0wEcQoNqcS590ecvNdHhy5ZK+WcXoxwj09wN9CcMjCJnfirP2DYjJ1nkqJD0OC3W7B
         blHeeyYv1xERxEhnBQ89pEp9/84m/PTumoegUAkojGcteB2m7aBrQL1f8bJWhRbQm569
         1cPc39p31qLjRwueXsToH00NIVnPFs9nsyg1FIjmNoBJbYG6Fj5qm9joqWoD82Ta/UfV
         rM9w==
X-Forwarded-Encrypted: i=1; AKwUvByscCOwbFSQXV4QFtS9p0/lt3y8Y0FNahSBS6HZSXLUT+m6goLcRQVKBncja4CzdT65qLg2o02bPMCGIoo=@vger.kernel.org
X-Gm-Message-State: AFuF++l9xvB9pqom8gEFw0vTt+UyzoxLTIh4CkFCPh6R+cGSOx6ko3HN
	0bqtTImL2l3KozREZlp+quIBYXauylPpFZm4qrQNoyDASd52erTi798bQWzLN0JoTUQOS8FvLkV
	tkZIZKptMFoPdKnUMYN9tq422pKu08oAPpCFMqRO4rw==
X-Gm-Gg: AYBFou2ZrD/N2oKD6lguzS9bYcSigUB1jfcgxk4sTA7Je1YUSiiBt4ShWuPkqzUFdu0
	1QcjqDtoXaLzm7YzDVlztCXQwwq/rjK8Dg7lDvWvgFSqDWkX5YoIgawAepzNcVQ9e7pdPl6CmbA
	ugXzmo3fBNS7zVgHlXsCbOP1K727DHGrd3ae+xCcNqG4qiNwW2203K1b5T0E7Q9cQ1sSxF9Ru26
	RJKuez3+4fBXjIF30qCFKoPuTiUrqdSxIPt7Eo+okGqgFAAcspMCZ5xi8LX13rq4/ir+nKprtwy
	/3NSu4dx6vTkSSW+TzI2uZJue6pAWT4rcQ9SiOrEa8r8aKftvYoAECxEPQ==
X-Received: by 2002:a17:906:9f96:b0:c29:dd71:7521 with SMTP id
 a640c23a62f3a-c2a159ad211mr257665166b.13.1789731837170; Fri, 18 Sep 2026
 04:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917151350.597953846@linuxfoundation.org>
In-Reply-To: <20260917151350.597953846@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 18 Sep 2026 20:43:40 +0900
X-Gm-Features: AcwNN1V6GXuA7B8FEhCBQCqFU7EygjeCV0Wpnd9XyhRDhPC2vNktE2fyei7DI0M
Message-ID: <CAKL4bV7ZN6mZMySE5tAwDwPEAYaXu5Bx3dQc-gieRheB8vGJXA@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/733] 7.2.7-rc1 review
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

On Fri, Sep 18, 2026 at 12:35=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.7 release.
> There are 733 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 19 Sep 2026 15:12:28 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.7-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.7-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.7-rc1rv-gb4c9ab9b68c7
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Fri Sep 18 19:56:17 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
