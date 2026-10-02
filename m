Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99301361DA7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977649; cv=none; b=b+BDVF0A7p4KPEfJ0GQvlOLkuTdqA6z+XxXHrMA+/Icv7aPqucOaLEFDA64zZJy86TY9RAFz7tW3Gjd+BcPY+BqGv/qOYtR8HqBzy8whPaHgFft0iBNi27pta3Siib8jDWAP6rG3GqkQW46Q2tqfglrbqd26BjjZFnnKLNsYsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977649; c=relaxed/simple;
	bh=WHajfgR9tG6mrg38UOvrjUWo2kKLnxI1mnH1hdEytnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5efLcZK0zkMr8D8lBLKWekFInPToIaIFXr3fJeQHm1IEKkznrMuVGo6wWTVsEy09Zgy31RthVHsKlph2xMB2ToY+09ip0WF0hyr1BfF+rBFddhVyforRT9TP73bd8UgMyekh4N5l6pI945DdAlmJqs5FNvrhOsZ1bNK7kLnuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFne6EOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFne6EOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFAA1F0089A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977648;
	bh=DJ7Y7Vy0oY9plMgKrN+3jXLLdo8McfBdorS6mW4mU24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EFne6EOGzzpEe+iHtI6mBCOpYzxDoduz4hyrOXyRyCJ9VNJDeyWqS64NaGSddvugG
	 Bei8GHH2PfBK2a437IelHELvu8yKqwZljSVS+EaTgbdNrni6q2ekoSfP9ydTYK3Nfb
	 DF81mAn/xdmOBumA/Nf4vuh1dRdF0U95cpwPpHTfZ7e17Bzed4ckQh6cNbmRvvLIes
	 6sYeQXH5tKhbsck6ARVepgoLJF3BGFLdfucLaaRZshdBtSmZ1QaiF0msckBFaeZipU
	 eDYntTGW5KkwtPbrNtwHl9PiNr/Xu4faw3ZvisSpQk7PBcwPatfpV2cj7zWN8+LzM2
	 NcSFHJJS+x80Q==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso2523801e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVQvCHWnvAA1HunWFL4B546fFmoBlrP8S5tJvLqeTXWjto4t4llV6FvBUoQIkQ3YHjh1PpmDk7NQKgB0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUsTPgojfVEnbNhHFiakyrEg39CVeyb3q5HOQltNeTVinzSS/0
	xILk0hr6uT5LEVJ/alTDklBSN1A9FbNJ6yUjna9kQlJGMWApa3FD/5lIP/I/LjWKYywDr5X9mAZ
	1w3Im481gJ5QYBamVOGX1MmdNU1HKg+M=
X-Received: by 2002:a05:6512:65d4:10b0:5ba:4329:1c6c with SMTP id
 2adb3069b0e04-5bb93812b49mr1362725e87.6.1790977647038; Fri, 02 Oct 2026
 14:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002124722.3545736-1-arnd@kernel.org>
In-Reply-To: <20261002124722.3545736-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Oct 2026 23:47:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJgSK7VJYsZuD0+xbDseO-yqN6+yjZx0Lnz2SoZmtCbQ@mail.gmail.com>
X-Gm-Features: AclHuK975eH7Gou6KTmmo7XIzaI7umcFILCAJvSAiCw4CphgQ2CvgjSPFWnmT7k
Message-ID: <CAD++jLnJgSK7VJYsZuD0+xbDseO-yqN6+yjZx0Lnz2SoZmtCbQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: fix missing CONFIG_OF dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Alex Soo <yuklin.soo@starfivetech.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:47=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The common driver portion requires CONFIG_OF, but the drivers
> selecting it do not, so we get random warnings:
>
> WARNING: unmet direct dependencies detected for PINCTRL_STARFIVE_JHB100
>   Depends on [n]: PINCTRL [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - PINCTRL_STARFIVE_JHB100_PER1 [=3Dy] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_PER2POK [=3Dy] && PINCTRL [=3Dy] && (ARCH_STA=
RFIVE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS1 [=3Dy] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   Selected by [m]:
>   - PINCTRL_STARFIVE_JHB100_PER0 [=3Dm] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS0 [=3Dm] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>
> Apparently the problem is selecting CONFIG_OF_GPIO, which is a mistake
> the newly added driver copied from others. This was recently cleaned up
> with commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
> on OF_GPIO"). Do the same here for consistency and to avoid the warning.
>
> Fixes: 9c4d0c8fc4c1 ("pinctrl: starfive: Add StarFive JHB100 sys0 control=
ler driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
