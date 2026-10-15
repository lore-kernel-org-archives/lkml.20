Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E050C2B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059592; cv=pass; b=FJkZU4EMRilZH/SApEerhZqYa/fFdnLGbUwH4Hlo9GDUqo4NcL1LBf9EXnQK1uoOten4ow6aPifn0oXaS/QEY+2I4AHu96uxV+VLfzn86/ecrLsSHmg3y7msjJbOUtc12a9nigvaL+NXYp5LgQK6l0/vOP6PN5aOYoE1d08uMtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059592; c=relaxed/simple;
	bh=aLnGdcn8SVT+l8zY1DVp9E1OXpgrWCKYi41UBV9MLZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B24jK7wiiVFtx4EM7vKjtIgrQB0CsjDXLYft9IdbxRF1q1XbuLWXeNTnY0UlA6LI64fOPOWO/n9+7Yl8gysVFvo8J+1qYvB/0Wdx5ptnD1nbKxlMTfUnUacyW4smsQm1C0jCaUT8nz+AkXZIyGBVcdMl7DYkVWErZZw+P++FkUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=f4IMwvUu; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="f4IMwvUu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2055573c8cso649148466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792059587; cv=none;
        d=google.com; s=arc-20260327;
        b=eNEqYr53wrMjLLy4l+Xx9OCZC2RUptygAkRyZI7NFVtCz4C+WL9AiV730SbQD8Rwx4
         sbQTxrlxbJ8OFBmsaZekn0306YMmKrBEn4+cJa5XzYTurJDlKTyZk9cNeLj6cZw7gpt6
         5s+XkDB6cf89eczipLSX+GAD7i/hGsjmNEYeMt6f+YYaZlcsm8pXGOic13ei2RwoL+Xg
         Pvy9YJqLsAkelQC260M/B9BPqTc6Uz8AeIT8z1p9mqSmmVzNzMnez5cDk7cohKMewGMh
         m4T3q8p9XKP1Efc51ioYiogKRH9vM0RLqNj0WrI5eA2CFxXOfaDidJjUCoR5yvYjS/js
         B+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6G9qdhvcH8NEbAp7bRobDvF91lk/yeFcW7ZExqFVdy8=;
        fh=En9ITgaoId5Wsyq5DlSNDCO1qJui6zVe+cEuAi76F78=;
        b=APaBNmakYCU6VUS0NSAEbLx2RtN9BbsmfAxdjtytj/JQyoLfaX64TIprN5p8PfmRgX
         +nkfrAjnloyG7IWNlUZckEDb5xwsRpMbfkUi7FsO2dRnS7WhoqCbV2ROqVQV3Wnp+Gn6
         9eJ+sAfIRakZWIQrsTA5o0pLp5AOPebS5v2Tw/CfLnsama1HfjJZB6ym6nv8fphihJ3o
         GPZqP+asNEYNlhtRIEjS3zTyu56adaoWWtY6o50XQFnOynTcMmVmlO1qvAbu3EjdBOIn
         IKW5YfUqD3IA36IkEattVaV6AccfVZkaeYFOcRyRsiAzeSXI49UoRz4QfYS8hfS+JKV8
         xy8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1792059587; x=1792664387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6G9qdhvcH8NEbAp7bRobDvF91lk/yeFcW7ZExqFVdy8=;
        b=f4IMwvUuf/8qCqVgUvUO1o57ngZBTyEPVRoL94xwTW9f96mUx6Q9VZtUZj3H/ZAHoC
         cXPas5PR0DEoWZq+GQijbWj0orPNsLWRKV+h81m9R646aEBJ/KN6J+nu39mDe0TwQwmr
         RPSdUX3hAj876bcOeAhOWw9PBszBCzxP+pfHU5OwZ8sgrcs06nQl5F+y8m7sIB//ERxO
         az0VP3iweJ5Q1gclS3StAikiOjq4YvrR75JmrsYk26qWE16uf2+VlNl98R7y5kgvsCCK
         /rOorpEJHhL3I7kPTIvJdPONVdGkWywt1eaM2UbxVWO/AkzZY2YTqrlNbrpP71uBpl2c
         re0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059587; x=1792664387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6G9qdhvcH8NEbAp7bRobDvF91lk/yeFcW7ZExqFVdy8=;
        b=UkIKBbxFs/W6qXNvzOAnwBw+xclpyMXilNypZD+WihSh+oLgPlFm9xBQJdSQYSE+Fa
         oVdEWS6qwGXGU14TUlzPwUXPQTfMK7BL9Jvi0OBs68iRzd/ATk9ukigLHu90WPV00//F
         Ww7XrjMKf6TWwDOdNbLwqfRubLnpyAsR3TAW7GzyhYT4tqtUF5Xwz8yGdOY/+N+3INQ+
         Jk3E0ldDY+KVdhhrQ0E77vHF1as6Bf48rsuP3hZQJ2Mb3ukRwv9Y9FjvdDRAk5aKYCBJ
         Ywb51unu+K5KDoQXC0km/+EVe35Bf04p4aTBTXGDrLreBKGXKyekEszGamHTePsviznx
         VLsw==
X-Forwarded-Encrypted: i=1; AKwUvBwBSXBqhKk4p/7HRvokg8Cw0fktemCq0QLLgiyWZpLAUm67Z/B6KpFbDkddU8FsVIpZQ3AW3uRUXU8FJM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBjFbNgs/Sijs92pO9+deXN5DAxg1hXEE3HhUo8TQDPeGtfDvI
	kYUxn5OeXxy1nu2w638rnaRHtMIz5rZNqB6vlQHFx0kI2Wx7/qxplUu84Yk3K8UKWA7JHq3Vi7D
	Zbqt/vCM/DY17PL0ym7CaGzx3O84HS66GBgn/5A640w==
X-Gm-Gg: AYBFou0/aSbvIeAHrUiLWPGWajyfM1ZSyw5Zs0Eb+2pVddt/G8bxOM8Hc3A/s1ISGeb
	9uJ0MEMWdRf6MxdNy4lh/AVuBvDLrBBYvCxpRIMCw01qqITAU4txSRG0joAVj3iKoppTh1pIKtp
	94f3L8bMkYnUY0RKV+xYETIzgpk2J411F33Hnfhb7qnjbN7dtPtb45ysaV3rTr6bgBgYv6qYGJe
	EvuvCeglPOrrUv6QmAhl3RJo/AtluA46TVjysZ976D4TiWL/Lsb2Jfbtzi3T3T05qSXWwrBsgYA
	0C6JSIbN+PjoP4T16zkAXgTqaUaewefp9DsW65eDjxb6AyQwML/8iwoyubqp1bFPZQ==
X-Received: by 2002:a17:907:7fa0:b0:c29:4490:50d6 with SMTP id
 a640c23a62f3a-c31aa022de1mr1644018966b.47.1792059587420; Thu, 15 Oct 2026
 03:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014123758.782265692@linuxfoundation.org>
In-Reply-To: <20261014123758.782265692@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 15 Oct 2026 19:19:29 +0900
X-Gm-Features: AclHuK_fNn4KLGlruklVpvCw979MIpATa3NA0dr2zzs2gEVM47exlU8CVc0L7T4
Message-ID: <CAKL4bV4yy39e_UswA068F9favpRSmVbEUMqe0cQrFNPJ8EB2=A@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/284] 7.2.11-rc2 review
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

On Wed, Oct 14, 2026 at 9:58=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.11 release.
> There are 284 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 16 Oct 2026 12:37:26 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.11-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.11-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.11-rc2rv-g62eb344d00f7
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Oct 15 18:54:27 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
