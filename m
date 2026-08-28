Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7293D5C38
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906642; cv=pass; b=Qw0IFMVFw4Z440gqH0Sqnj/PCcl8ck06I3b8ClBwniiWPSzvNyX9vNfj+ArZQtZqFTpp7sWKB+rVZRuo2gAKgu7P2Rppj5E7PsfSBKWEVTM/Rvl6FhEjg7fhbJpFyh1bICJ5V8JJVj5MldNDiJDKBMm4+T+8O3vzUI9U3ZDBMZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906642; c=relaxed/simple;
	bh=+SsljDUXUlaGkl/5WsILjVk/5Y4d+UkaNdguJIKngg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDbHWGaVeS4dQpKSBwpaSMpJCkoa6TkiwYT5WbFEHuDl9FghgO/JfQj0y1882MnFrUXnOywltJgdlNyV/XCEpVpysk6NYt4f1xTq0OJUwWYUqIxlUKd0F9IL/5RvI1+pXFSWhqm7vKIQ6qMCtHTNJhE/tmTSweH+UvA0fDeZRFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJxqxCUi; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJxqxCUi"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a2b4743936so6333471fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787906639; cv=none;
        d=google.com; s=arc-20260327;
        b=TiiMkldSPq0EcNjsTXu1b38nvdYwEb+2z+kbZFH9zfgRL/a26LcGqpdAEDq74cC5SJ
         oPXJpLw3vGDuA+SwVIolU01YFUA9xRpRwQ4tnvv/uLQf1cg3zMLCL11XAMh9QdgR32tD
         UgNns+0RO6nJdDiHa6Ge05ZH2eJFdIeeGgm6mUcO/2dDkI8PnvWZjsO9rUS6lEHsiUQd
         SgU9LHMQZB4NAf4Xx6oeI6F7xEySEISGDTVFdyVTkMeoRvls6iwmyn+O//p8QzYPKZ74
         3+7Z2e9DOZ4xX/0V2qjJ6siN2JHM5wrr8x4X9qHzgSm4dqpZ0DFnivSrY99vsQxYh8iw
         KT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhsiaAmVjzmzESFqvr2tri1C/08hg86tA9bCn5YqmwM=;
        fh=Ed1ld0SU5jpmAy1Z1ZHTr3quHAsgEtW8/jRKOUhT3DQ=;
        b=EjfvIPaIzgXS0y+Ktqcw31FeQbX+gryS8OUxc01+8xZGWkGw46Zv7JPTgdBRvhTPd7
         Nhy4+BhgZzvS4crcih5du5IYLgZx5Y6vieRFiIinQ+wH+auDt9cj0O9PLOCaALjV6BX+
         9WCcyFTaXlwwTqT4jUxP0DxW5ghHBa684//lXcdBWgeRVfRalSPh/DDsX2WkR78B4luS
         uqrPPoHESDF05xQCmPSHz8a4uHB+mQZSTDy862GD6CnJB3OYnMAksp4D1d2UTxRaEdwX
         oYo2r/DK5ftahBBhZ/3wQeVk2li8Om7d5K056rH9i+21yQnLyE+0+wMDWKNYwkdeVzop
         +lTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906639; x=1788511439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zhsiaAmVjzmzESFqvr2tri1C/08hg86tA9bCn5YqmwM=;
        b=MJxqxCUiRoJIE5Qatenl7pu69VjGL37LU8XrEU8F6S/bD0N2wn1waEbQLvyrzb9rRC
         7KMvT8HwQsyojBBkZPlA8syUGjBMjQiCFbjrPtLZeTurdP+BDaM6iVt0PsWhYgfFg8Ud
         zbIAqTEL4CMMT58wkfToDMXGBdk/SE+Ab4dueSgNewMThW3kSkQ3Bj84+llUOidpbFkb
         6CNbbmoTOgMEZzFN/l1kfZXTZL/v/mwUCXfK3aPrex2wtFRO1CgIHD3MDHzjh6GHDwKC
         Fjroq0/52tN56RVCXSnljT5P3s3HdsM8X70lZxyTeFimyvHqYzI+0GQGXbnckG7WwiAz
         g6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906639; x=1788511439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhsiaAmVjzmzESFqvr2tri1C/08hg86tA9bCn5YqmwM=;
        b=T9B94oP4vkrlGe/aTF25FCoaGexEkqulLiztQg44LOrHGKyosoxc8SyTAITe7H24g0
         40MgczlfnwEVWLCZbalU/nBgLqJJBw01pOTMqbW4QTaVdyxmw5J90ABUNkz+Aszx4wX3
         5NwqDniHZqTT5m8IeU61S9AeDEF0gi4cRH3vIakbBMd4ejpc4C6be8LhXbyvYBv65gEF
         nfwszWn+6N5fWZy9rIDDp6pz6YHqQuCDimfzkjmVKCMElqajW+gDuX55b1VB5TY3f/uc
         kdtc+AIE1wb2LsKBDlvh0ibKcht8UFxfrCjwg2d8K2vzXVFRYT2u3Psli1UCQOaeRSVy
         KXNg==
X-Forwarded-Encrypted: i=1; AHgh+RrYgJWzhRzuh402egYy9ygAHMONiZ7O5kEKqSV3monH8LYZufaNqnx8hYSBm+e1vTV1Dwktmxm/ioBj/rI=@vger.kernel.org
X-Gm-Message-State: AFuF++kQRw7Lu2ge0B38yoLlWv4tLCXC/fNZdrLeqdrpVA2sSSqNoZUX
	gawBfg3eB7txBoz7tbkP8OQRBZwABErBMLLNrDB+VoGsURvf6ZqNFxZcUHFKfJMqhLIIvfNKQHY
	Ep8uhOFa8nkRBkRgggVO9ug4hPRnRMbg=
X-Gm-Gg: AR+sD12MjvcXzHyMQ1PuTC+RjAV6ojInyqchFIwwdmIFlPTXTpb88EQNeOZLT0smkRQ
	qNjiclh1Zu2Zw1cjqqmrrz9Bi5upVxrKS9GgbkfpV76ZZfxcTwZHBxuDd7mrl33I6CG7RDtARvs
	s94vox2cak+kcOLMqFyR12suOIU70CF7xqUtKYvJQLg6IHN6SMD8lY2zcKijbjrqWamdHEEV1GP
	JmgLKsBJ4n0VBERnFBRIVgZu4BitSjr/9U4J2y58vZ3FhxG8KEJsntawOU9vNL/ORJPBVtWU4AS
	pWEYz5zQB4Tnz1WKiQEX/OF0zxjHCCdIRLSVWtffpgvctRemUHzfatd/QBgp9KFcnCF1wm8ENmv
	jmsM=
X-Received: by 2002:a2e:bc0a:0:b0:3a1:94fc:e1cf with SMTP id
 38308e7fff4ca-3a301b26568mr8446061fa.10.1787906638442; Fri, 28 Aug 2026
 01:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825132541.986300899@linuxfoundation.org>
In-Reply-To: <20260825132541.986300899@linuxfoundation.org>
From: Dileep malepu <dileep.debian@gmail.com>
Date: Fri, 28 Aug 2026 14:13:44 +0530
X-Gm-Features: AcwNN1UhUoRQqGS--MuKqVVwHa7REQ0stzNan3AFZ6MJrTOOBIX7BijorBSHvPw
Message-ID: <CAC-m1rq1FSDpRMR4+hYrg0KnJVuiE4R6ggPyCKGfFKu8OqFdKQ@mail.gmail.com>
Subject: Re: [PATCH 7.1 000/101] 7.1.11-rc1 review
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

On Tue, Aug 25, 2026 at 7:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.1.11 release.
> There are 101 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 27 Aug 2026 13:25:02 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.1.11-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>
> -------------
Build and Boot Report  7.1.11-rc1

I built and tested Linux kernel version 7.1.11-rc1 using the default
configurations
on both x86_64 and arm64 architectures in a virtualized environment.

The kernel compiled successfully on both architectures and booted
without issues.
I did not observe any regressions or new warnings in dmesg during boot.

Kernel version: 7.1.11-rc1
Configurations tested: x86_64_defconfig, defconfig
Architectures tested: x86_64, arm64
Kernel source: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
-stable-rc.git
Commit: 822f846a60fc16f7c944c77d54276d8932b2c4e0

Tested-by: Dileep Malepu <dileep.debian@gmail.com>

Best regards,
Dileep Malepu.
