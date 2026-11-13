Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794609127;
	b=fNcQnzFOIYZ5sJMnpqO7R0Sib0BbMh9s6qN2hZ8z6H6E+bMS+ex9krqT+MENRtr7Peu2
	 bZkHZ9wd/robuKlH3u5ZF+S9C03s9tNkO2R5NTrh086CwzMvEpz/rv3d+4JcZzzTlCkYm
	 /isVLWqSEXZMnV9p1C2JsUCXDx37tOuAws4Q6aJ99UN79SWdlrJG+Knk0TqTIfRxQo0tt
	 NGUE90tDeBn6ppUJ8muY6KpIk5VqmIEUwzskbyUvZugkJSuC+ZUGwQrepunjpUd8wj1op
	 xkBoPtg1RC35B8cqA02EvhaeSfH6RQqoBlQUtwc6/v892aq7EYOLGGyMMxq2kCoWQUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=onj0EjD6Aez/x0pUU0g9Id70lDTi0FHuQrAvFaAFFFo=;
	b=oYKbdQ91baUKfw4btL1yWGzb7EhehZKUPMo24+gDwlTjLjwBrn++b76ki8S+1NRoGg0y
	 JFc4iJnrh00j3BIRauQrXgJyluV7qXezM+8ke1xMJJ8cJG8YoNBBYZcVuvw2+qf7DBX3o
	 PpNr62QF153lhqpzHZrlomeJAEvwIW1xLo8a1HRqRHf6N1dxaKgqCe67LvVzEpjxFGYwl
	 B4wxkvhr3MFyQ6JsMHXHMvDv7lKP0cL4hCn8ZHS90PZD6P+gkFqVC8PA/jj57TQU9VL7P
	 z83ONc4L6ihOzV76+nLQNd2e2UNXDjyZcMjmOk2X5tmQTdf7MAs/Dvl2Br3IdBJQILQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=nkiC0DWD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45B606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C45B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=nkiC0DWD
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50933bdf4bso372213366b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794609123; cv=none;
        d=google.com; s=arc-20260327;
        b=NU/jItC9r73y7jpMZnKJKZrYAOvKniDPcbX0moTq+uyoudqA0YF0c+4WAWgkk9vtWN
         Vfxep6ce7m2pJrQC5kDTcr5kZFVsRJvSrXVuW4NY3gELEMVY9fJmWNZbpX8FScQxF/lp
         nfd4fnZyrvh37SSd91SVcJbFSiwh6VW18EPBREEJDTVt4B5lJPPyyt/k36zcNTue9CIE
         4TX1jjy3uUBnQWREsBiy4l1LZZuL8MP+An1rWEo2XTv08AfqPAdACWoKxxM1KJ/IPpoP
         9ezy6PIG7+u8yWlI5vQ8dgkMs0lbl+Im1yl0n8tHFOG9CZXVZ/06BSG3XYJXTsFCcfGW
         fIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=onj0EjD6Aez/x0pUU0g9Id70lDTi0FHuQrAvFaAFFFo=;
        fh=W4M1tnBaZOE8Uftwxe4SSOHQxgKuK1RQX/pp6TG8ggE=;
        b=hh1f9eI1wRYpUFeU/pRteG+lGNCHHLWujf3TJFmutBx5PF+/l10fAwcYReinAafneN
         PGACNf9rrUHJZhyiwM6aOf2KFS9rEcVs+ywzm52YZZz6ZuB360ltfgcFEaMYtW8dIBea
         s/Q1/gv+7OTcM19ODPeq9U2NXZ5zIRJpAAMTWwNXr8+AKCvcgjI3akuTiKFPYhXQCAIV
         lgjtIM1jLl5r+td4gO1fPUytR7HbNwtK4JiOnSHaGkvL8a6TNP6nsgP3FRtb2UMp5NS/
         AgRMDHZ9VKpbLnu48wC1XOA6uQY54LLuUI46B6LUSlc0Q6TIUFA73b5b6pK6OuAUNtAp
         16og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1794609123; x=1795213923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=onj0EjD6Aez/x0pUU0g9Id70lDTi0FHuQrAvFaAFFFo=;
        b=nkiC0DWDrptfLXBkeBp2grrrXnGx5j3vPzOVDRF6StKxui4FECzRIvlJZpTiS2c7YI
         xoJ/gfUWGpGP4IFckYurno+JAqCv+5ixngFokB6IucB0DYHEjaRa4dDMFTHKyk9EUWcO
         eMJgeJRtflKyzWlYZdEE/Ot5vE9l8PFfirZAmSDJwB51LP0Ww2Id0Pxy10RXCQXDSd9/
         Cptf+Gy7W+7T4+b0zkf3A0f5uESJCRuBO1Bf7k7f8hbDNkj/F1ay91POTM6sn2qFoJP8
         RWjLjqpNlZM1/KX2Kgh0xzBQHv4HV0oij1m5NtqXVd9bvQEbvC7P844ka31l0UXFAUH3
         aJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609123; x=1795213923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onj0EjD6Aez/x0pUU0g9Id70lDTi0FHuQrAvFaAFFFo=;
        b=cTdBKSPf9qlWnjdJqX4DulDsnnIWlH8b+7N33Ckxu/lLQWpUvI4uJFLh+nwkHYVSz8
         pea9L9n0yUqgETVIXVJoGtHrdJmk/E0BGxPwT7Gn991CwKk8Y/Z8PsPidzOWLVE9QbBe
         Ht1q8zvr3WV4RNQgNnYuAn0sOo6T54YYsBWsl84o6i5H2fF/YWWcEmKtqbvFlPJtpJm/
         lsn22n3dxd99N+zXQaJKB8E7qnA2l0X+xOtmrZJmgAdPv1ObSUuzysTaDbjUaUj2N7Pu
         p58Bcg3Gpv/u/BNHEK7ZYQ/zECyfDmXs9hLBvbNsseIgS4pq+g1VPsVs2qWFauvxLFQQ
         EFBw==
X-Forwarded-Encrypted: i=1; AL+hErHintHOZsgXe1+3mCWahbZiVyzU+zoYBoxSLhV5WvKU+gXRIbv+U7K+yj3W2/YEGe10eJ1Uynhgus3E9Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lRs8mSVS4tMqslB61h34dmDb6prwO2FF9mVmFdXrOZ18fT5X5
	aLwFhLp94dM15HsU5cLJrwlLXT62h2lRprWwFByhZEarW2DsjTEZs2QdzAjaglqY1ppNV53Em5J
	irLdlB9LYvzW+qn4X4GqomKQCIfD2+hh+vpfEnhF/bw==
X-Gm-Gg: AYBFou3dijyvclFeChbE+7ReygkTlQuuZ9K4VWtg/HpAANeYmpmbCqvJ0dJR+7XiLQF
	J+WaEUD5pXMO09hzCSCFIWhzJhe+NuuMWVTFb0+okQ83wZonCCBqFiJl5Ok8AjJIPsR/jk/SwIn
	BLmA+2z0V0TGhJ1aZRIBzQnv2ZzjIn4Sr4O9wyV5jCm63yshJfThZtKfNYKrqgYVB1aBzrXUEPR
	3q75jsY9Thmb2OmKFcbfuLs/eawrWhb/BhnAgk12mKmVEft2bgzrgg0CpDglJ/K/++5Q8hhNoSC
	Kzxsh/y+vndXTjTzBdC5umVZxrFhQreRUVbC2TngA5yAnNQaZcCaQyylfwTluBseseoTaVV+S04
	TH8FWYPOxM39yYIkSluD/WaRdq+BB3rcyNg81
X-Received: by 2002:a17:907:6d20:b0:c3e:d0ca:d30a with SMTP id
 a640c23a62f3a-c50963163d1mr368073766b.4.1794609122655; Fri, 13 Nov 2026
 14:32:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113153753.358973689@linuxfoundation.org>
In-Reply-To: <20261113153753.358973689@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sat, 14 Nov 2026 07:31:46 +0900
X-Gm-Features: AclHuK_KdfyMzEueRu1lFvcw1syUDZJwtEIuIcU0NsNDTyLYCMdVVceVeCzKY8I
Message-ID: <CAKL4bV6ENVk-ScbP=5MKkzvSUA2vkqa5aF38GG7XX5EC+zV5_w@mail.gmail.com>
Subject: Re: [PATCH 7.3 000/507] 7.3.5-rc1 review
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

On Sat, Nov 14, 2026 at 3:29=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.5 release.
> There are 507 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 15 Nov 2026 15:36:17 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.5-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.3.5-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.3.5-rc1rv-g2a640ccd9d0b
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Sat Nov 14 06:49:53 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
