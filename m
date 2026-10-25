Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792924601;
	b=jdGISWOBCkFpa1NEGFCPR4OR9xPH6/Q1Gl5zxVIz4WoI6Yt+i4/ldCTCRVhkgtJKWE24
	 oRfYv9C4CKsBZ3tOfUCw08j6nzVKnEgIGyE96o35vXJcuExByqFrUdE4rPk9QOhpToTO7
	 EcDBznTEr/rsdEdu5K7wYsnD+6fsW42hr6RQQZU9QA3QzSIbQ+pZTg/98VOmeQ5aqz4Uq
	 eA3w05so2UbCXKVcwMP9o0G5r2Z8NntIWxUrfrDqwW+OGygjvPGm9SFoXlNRKNdYmvGr8
	 FdLjLFIpmYNlJs09rZfZYmwuDE49uudQRBvT+kGcEFiPodYxqfLtaPT5YuJASPcTy+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792924601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=24txbqcyguXG46xJluEhBf0wsoM68TC1uArTVqKrpRo=;
	b=5AtoansVCsDLcVdjzXDUveS+hu76RXTrtUQ9r9B7MOhB2BliBw00jUQKer7c9pwgaS6l
	 MiJCP22ecTRa64UeEAWdrnoTf69ZAQEa1HtU7sN4+KBpFBsfhpgwUReEqqc8zwliLWGVH
	 Lm0GF045kAlMl0wMMi/P4XkV7+bi/4WM1rD8BXN1HafZe8m4OBH1RwDmgUqPGH2Ov5iYC
	 gr56ldfmjuk3wOY+38R30kSr4WX2/gzdePPixbG3mUovvZx0/SP+8lP/+lACvzqMRuyAv
	 fvdTSceN33MmFlnFwDQWdlaj2QEN2mnG61Q1b7uQyb6Ppmv7vsq/zDES8YS/tlsAiFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=PBdOQ+cu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1961606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1961606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=PBdOQ+cu
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso5518498a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792924599; cv=none;
        d=google.com; s=arc-20260327;
        b=KeuINTCSSKdnh8Eg5ZQcRYkz+PmYMT6HpGtk7pW1iO+Ww2Zof2RVpdeYRIleNT5bO4
         GvQLzpIhIAlUthxYi/JBTzUA4aFu/QiU7JK7X8er6dlmzcybYC3JGnxxiGgPxzOFVAVv
         V2uiXFguIbwmPcdvHRbjdrA8MWR8zx1JcN+CzzX7gMsFBrvydXaZCKDm9o5gjEEuWysp
         VAweff/hqETzh6aSjK5kzwdrBoXxeCHgsebyi2sVGMUcskU9xAJJt30xRk2iDVrIY/iq
         n/7zmZdQVA/3ARTdj++icJrcl7AoRBakmfy4W0GCfTwqungCuOu+VaP1xBdCsQ6mLnVm
         ZBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24txbqcyguXG46xJluEhBf0wsoM68TC1uArTVqKrpRo=;
        fh=QZO+o4UwgXvzZi7qLhNN88OzsxrW5yf695tKXLVIlT0=;
        b=DGnRlPpuBtBhs8zlThxcdOEhbEIjswivhwFJ97FRztd3evNNpi+svfVuDu8Yl4goU4
         PYaB9ivl0TCgkN1pRHziRklPHtbmsbw7bfZ/xttzkDa8rA6HZSsyKtNs7X19ePOlytLb
         KV8LQoseAN/QMuKAdTcF6j7XkiBgfh5dzPP/b+aoZ4Kd9QFOy8TuRNJkNW5O8EP4vh37
         QqLZACZlT8CfevSsqEHWgXiXLpvU3j93xXTQERqTq2Xt5flYH5VYrZ4+Ym0LlryL4Itl
         xXqbH/yaVymzXSM0ZVKm38X3fqzLwVtcBPcaP1ZFkdApHpRDI9EPqew7C6MaEGhtgTdn
         esgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1792924599; x=1793529399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24txbqcyguXG46xJluEhBf0wsoM68TC1uArTVqKrpRo=;
        b=PBdOQ+cuopQLFrQPiwFLE9BaP3lrPDoKCzZ0k7UZNxz7TapvWizxnrb1pQMf3MLpNB
         8vXXl87IA+j0lRceZejRrgpr+hw71oYY/jbNkCZE718SlqUFVcy7WuSRZM1X6UNCBFyy
         1VYTVJbxkcKtrn0IltcXLElcS2ZiVJaWQ2JH3b2fNQuG5Iuz08zNxkxDOIQ2nCcrab1v
         e+KbfHo2YGYRJr+UjV3SsaqMsoeuNaP+3d4hEenW7jD218gSPjmi1nBML5Xa7io+m/M9
         0Gnj+/5vYuKGGEsuLmJbmRFWEJZF2pc96BJORCAiLDhvQk8gUPDag/hjtmnmtXo3045I
         OQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792924599; x=1793529399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24txbqcyguXG46xJluEhBf0wsoM68TC1uArTVqKrpRo=;
        b=yUBq+ki4+Y5AmJ0RnRWxURKXjmkjLjJPHw1OlHdM57/WxqvS8Gg9aVYIkAO/p19Ukj
         O1wq4XcHVxpt009EqnYASbp+sCGxdSZmrFZiEYr+ufWYQ2tGAnGd54kSll9XBUCsSNYx
         NTwm4D6RoqFECF19Lklp1L68X7ER0lA8CceQxjuhQ0Qa4Gch5KKlzAXEpuhLOmPG8zQS
         W65Khp3IIOOzNeT2WlftYW5AQ3Wphj3u2fRRndSSrrY7hmjI8vg+8mrN8UfYcoMtjx2F
         U2aO6147KdxFwFWlYKVXz0xUUSowJqd7kAwAtCDmDmpJElBNDQup6Uzi0dCI6ihjsNpU
         pPrg==
X-Forwarded-Encrypted: i=1; AKwUvBzOgOpG6uBL1T9Yd0eO8SVL5Agyyon8S9SoiOG5sK4RUdwaOXuY87iP7vh810bghXGcEse+EQQk91BiFGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJdAOv2LsheSiXGQNXJxBJTyMIBHMgGF0ILEX3CSJ2cD63Ug9e
	f6mQ7IYMo4CfbajBIExFDfcKpU2QtYHxGXAyRt9a9sHzXuleicesY3SBp+BKI+PXGLX5G8LGmh2
	kJvvD+ckzjRpLymJO0h40gu0apOuLcGeZFY9HeiKmmg==
X-Gm-Gg: AYBFou36sK/P22rG4mc+MdX98N46UKRfaWYO8Zrz7zUir415w9OYIMG6axcnPSz+OUT
	aGu/1bDn4/WHwkwWsWYjjIaauwA1cm+G05HuoT+FQei1gQK1y3t60AUkSNclbBgOZofcJz85nvi
	Lb+RT+Cg5PZUvMiLZ8qdcIhHcUY2zelv2+hGwFy37bHJcVczAdgIFEO8N5FuFpkLA7z+6s6RXcf
	1XuY10MCu0dr8hIW5+534TF/M728Fdrmyw20r8i3vlRY7G1kzll99FIiPPFQiBHm7po9C1Z5V/a
	QHqobPPOenzXCLSsidJokZFQNqOmU4E8iRv/+Whzj7r+EXIK9T2EHZekfqqPqDtc5a5a5ve7mNz
	i61dAzSDHxlE/ORIWDXj9r0GeBlm6KqsnSOFLpwDoGG8XkVCs8/Vj8PzNYjvG+mrcpvaLcw==
X-Received: by 2002:a17:907:96a4:b0:c26:1cfd:4244 with SMTP id
 a640c23a62f3a-c46bdbf337bmr464489666b.11.1792924598905; Sun, 25 Oct 2026
 03:36:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024064731.125251200@linuxfoundation.org>
In-Reply-To: <20261024064731.125251200@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sun, 25 Oct 2026 19:36:22 +0900
X-Gm-Features: AclHuK_Ev7MJ0UlkIUNpIuHy-qSRb0ZmswNvaVNZebfMs2Yp7BHznY1L4EcdhRA
Message-ID: <CAKL4bV72vvEwMwvDXvgZWio85xJf_SF1-XsNJOtXYdXR9hN5ug@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/243] 7.2.13-rc2 review
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

On Sat, Oct 24, 2026 at 3:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.13 release.
> There are 243 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 26 Oct 2026 06:46:54 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.13-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.2.13-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.13-rc2rv-g7694d244b4f8
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Sun Oct 25 18:47:34 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
