Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D748DB3A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397376; cv=pass; b=g8gAMhGgB6lE448UDmBgyj5Jl5lIm2QB22+eVoCAw9NmefBgQRCjSjmSwjs4EV5LKzKQih1AH/dzGFPDIMzHpHYU+0RpiDDVyVdkHlABMaINgoyqryTA8EU7wy/eOhjSYWWtcLtQGTQybtU8USIQOgymrbWCgseMJiYUxOjDUBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397376; c=relaxed/simple;
	bh=9D5TqnkicT2U7tRgx/dr8Iw0EFKZV2iKPc6zOXL2J2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCREJyMserS2DW7FswyAm+6UyxE1TJsBaw2IlyX2LWJjDrqtvIeDSf4l/tRFP2Aw/9M/tsDMSWsrE+32ba6vx7h0wX6dJHt2z4UI0ujDXrX+rbmB0a21UfCyY7SwSIm1OJ+2f64tIqh5KpE7+lHhfE1xrVfpq2Iq9W311lPRrEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=w3gwgMSs; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="w3gwgMSs"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c423b145922so140800166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792397372; cv=none;
        d=google.com; s=arc-20260327;
        b=DmDrQacOJW8i0ro9ousNmSgVf4qJycbmrnSkpznHekCG4hcoRPTG6ikwsS+oxXL5sT
         E3KZI5ro1wQ36mQYf4I5P+wppVv68RAd3vUDhgCV9FxhS52w0OR6Tooo02OKsbMWeLh7
         zJ2GJ9gNy7vcH1LCcUqTRtoRC9+WKQUjl61PKvdzxtpB8LdeLeZdoYNR+G0bCHD7+xki
         vBCAhqwv2wJuCRPrQiWBlcxr5zZvNwRTNW166+UQhahhk9ZVQysBbEJGs7ql6zDw2kMS
         SbRn5jYOA935SzyRIGPj28SkCroJwXbQa90/1ypl+n5rALwd6QlD9pcxRpSJnhr3tcVM
         iTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mKp2lGowX8peLqRZk7J7Wle27OZPi0eWO/3k4N8FozY=;
        fh=S0qGclqm1J3SCKzendCLKv/pP1AqdgZGvcfaF6tTxSs=;
        b=hxJEne4kuf4hFeuVzxWUJhc9RnCuvlRthozX37VrDpVEiW8fmc3AbblsieXcbj0v3f
         WXPQAzV3NFW0+IvWPauJSnOuKsh9FRJOmKwbM1W7VJ+hNivbrFFbE+B7y/3Ib+X2R800
         dw32Tbnq/XuyK/zY6Ua/HE6629HqjYVMJvr7AIOKJrlEzAoF+BQ4eXZ7z1HzvMjH1ffd
         tA1Gw3iARLmeyfPlqEn5hDij/NhjQ4iNdYHD8QEoMIY7s2pUBwbgjJLLjiXXul45+DeM
         RMqcS02iiKDRoGTVrJLAanJkilOS23jfn5rJJqt/t4UzyUE6lE1BbViZpiGKBmHK2fCN
         +kEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1792397372; x=1793002172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKp2lGowX8peLqRZk7J7Wle27OZPi0eWO/3k4N8FozY=;
        b=w3gwgMSsj2oO7WQIuCObip/gnS/PHQTlQNHnZVxOh5PenQSOtasjQhzXs2VHhaPY7L
         dkkfgURsTAnCbJ8+aa4Zhih9RiuMOSs2ePs8Ek31S6s5b1WDfneqV+YroxPFtH4rWtMB
         PLuRGx/hTDEqSc3/ndmBgYr2OylDpWiM1SpNyjKX1R6J2YnBAvtcpGMHhNqDjvZy1SF9
         KgUOy5ED/IJ5z0BtvKwkldp53FtZr5v9Cj8o936eBtoH44rksJ3V38L71yQpMJMo8m/S
         xZWR+x2aOTCja6WiwTIksxMM047i1FYyyiCLuV86G0GXekKDlt6BqxxYgV5deApwlMbU
         6p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397372; x=1793002172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKp2lGowX8peLqRZk7J7Wle27OZPi0eWO/3k4N8FozY=;
        b=YdLIvYsqfjYn9PXvwDaTUB6q3S2fvQQY0BsQBMliR26WHhcYp5fr4dVMDm0f4KP/u9
         vej2bEOynj/5SKc00rVvzktAH7YhEgIRcRRab49QD/i5/XPpZVaONOa5MRJSWIz0BM9z
         LQNLAOx3InFm9QYaBYskWA3PNc3/zdPr/k46sH751N4c4bRVqOUglEEj97L0IGTRN1Cf
         548aQNZp7ZTV8icDsaQR2OA28qz8xTtCodCxgH+F80/8he76ik8IWddjlucHCbNmI4cs
         D34wtxB9jN1Eqm+n/LE9aX+9UrWJx+owfVULgpDPm+owUQQL4mHGokxFGECgPcLZDYkZ
         tpVw==
X-Forwarded-Encrypted: i=1; AKwUvBxq4BdGG6B3KV1J6hPDGlKWWs5NaEQ66yOK6g+nLKKBzk/uupqT2J4P3w40tao2raRQK+L4SVsPi5T0vZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo1egDPJqlwsjvsEO9jorV9Scpkbvsa4ze2YacMe1yp85276F/
	GG3rkXXt5cXMILG/Ho6pE7z1wvAKqMNmRd0Esz3Fn7ZSYJddWlPt+zk3Leqd0DQvgZAIxbbuEkS
	nIFeglKSOGoBlgX+4GfzQRQcqSZ2U8H/3JqylLZ23kw==
X-Gm-Gg: AYBFou23JQMh04CN0gN534lVZqV7mG9P5H4vGv34earxCHEu1lxvERb6S9OlzQMeg/+
	8JuCWo547AS5d3XC8GEsncyL5M7J/ydPKAO3yRsHNmmhpMIgXa5ALcbL99vlWhNqnJ8FTEMeasP
	bMPu3hZzKgF+ix/aK+Nwz6m/dLWNYWbvMVJuzhnUgjPDaDhtDHLmo9kjg7qHir3t64B8hdZ+D3/
	3nTuw5O7rMzjYUBcyZBZvcxUJpl5CR3LVAkYIAfVNdrGG3Cytq978yzgZ6yVzfcDhIJnO8GfylJ
	JmBhzrhUFNK/yTBxQpzAnsaNeubcqCACGPmzgOeN8Vv8hv1L/Ivc8cIdaRGlY3EebplpizNHvLi
	BbULshATAprTwsPZ3NygCp88=
X-Received: by 2002:a17:906:ba89:b0:c34:1ed:54d9 with SMTP id
 a640c23a62f3a-c41999720a9mr416234266b.4.1792397371695; Mon, 19 Oct 2026
 01:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017155059.698368299@linuxfoundation.org>
In-Reply-To: <20261017155059.698368299@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Mon, 19 Oct 2026 17:09:12 +0900
X-Gm-Features: AclHuK8Huz6jdrYWmKBBEhptdxroSHGbHzeJx-piV8U8UsZA0jaDmMp3LdQ65vM
Message-ID: <CAKL4bV54AZWUbd0w4YvkbJt3VMEN6VmOz3HZAPHRZ6S3CWA_Vg@mail.gmail.com>
Subject: Re: [PATCH 7.2 00/10] 7.2.12-rc1 review
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

On Sun, Oct 18, 2026 at 12:54=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.12 release.
> There are 10 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 19 Oct 2026 15:50:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.12-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.2.12-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.12-rc1rv-g590446e5a2fe
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Mon Oct 19 16:42:14 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
