Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A831E824
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857358; cv=pass; b=dGc4tYNXkSCEfYdUSZnhgGB8gKiWpw4zKm8ITJ9sKwnMw/E4KOqwurQQzaNuoiCx+yuufoEEpMKqsmjYY8+0qUOnfnqbdrnyS9GtNWH3PCcwSsAva9vZdTAL8wVO3a8Y7Zy1F15APPLCY+UBR3a0SBrHV/B9x7bzN1KG54xx1to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857358; c=relaxed/simple;
	bh=5MZo0uMLkAcHNoAjZEUVtpUF8aIbDuyDpkqwL/p8XWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBICZB4MbljloDo63dyru4w47i8SDU7J5CneKfOTH41eQGE23i41x604yIP2izfVVPaHVxsHSbLUBEcN8pzy06IKHAPQjyUzQkwStGTJ2PE3h57cX7cejLFn5quhsgEyAPwXi5sMjB7WVwJWF/Qer5aTGCQOUfflhPEA8U1m1YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=GGZrES1A; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="GGZrES1A"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af85996a92so213459a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790857355; cv=none;
        d=google.com; s=arc-20260327;
        b=MvWXSblFpglQhEAzx9i66yXLC1CA6A0PepnQjJP7uZjnCBFUYfUlXkcRa4Ar5QXFY3
         nFs9rcmx2uHsf7tc5nOob/o2jRx4hmUS40fSyAdG4a4lLeHpD22TQoiSwJbKfZwioxV9
         2F/BikIp+mfG/g32THMzM+2JJ50ICsFS+ivywSdQKdq5TqSk86I5F6oP5gd2zbZkuZ4N
         qQvh+KpzLj9agZyKPdaOU8OSZsSTK9qmVRY2K6ws+YB4XLq84oU8/N5isJZ5XMYz1jMk
         GXIMKgh8iqKgV9dxyqGTt2Ycg4ds9IVWcNhiBGM0EqRU6M3Ja3btLJW+sA0XQPaVeizg
         DfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=be9cOIj4BNOmbbuy02A5g3aPL+QaTK1UPmL/Hb75rMM=;
        fh=X+wa3jm/YhfGrfsPL9Yj31g+UpT8e698AmKFAa9roog=;
        b=ZcDhVVpJYDr71A/MfI3GDeIue3nc4D7mhRJom21XwvMasTivxSlYqc6zeB343PLWMR
         YCCVSCZYV/ykdST6mNBbt6OtS0Kz5SgcwZoYNpytAIjPd3HaKkqXeBkBC1a2CFfOS523
         hrtJq38bSAoXcbMOpktA9wD78/KV5lvJrOEzrNTOKI7Ar2W7shncJl5ak3GMtFQVOEWr
         FzBG580VZTILPZIH/oJb5idd8sRWEhrDJ7zJFtoPRM2XxmVBk+PGt2C3mQSvGUNp3Lgr
         fxwp4GfBlJrMd9nSHSBYgTcg+uTJgAYio3zLu0UUHqfTjHkdD0trLEtezAFqsF/xAqg6
         bxgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1790857355; x=1791462155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=be9cOIj4BNOmbbuy02A5g3aPL+QaTK1UPmL/Hb75rMM=;
        b=GGZrES1ALdikbo7RktLSixs5ZyblqZYJp4qHTPRbmycw4Czd2bOvCG680jLtVaJRVs
         OUNhHU/2m5YmK48LeZ9YygYGPhMCoKw7DqzosWswbI7fi8cfGaNxa6R7txOZJBAQCHg8
         tQA8lIw1aCUfV8LmbNPQ5rdmpB2nUtXOowchStkPuCjMcPVWVd2HukrLlR6diqlp9LIY
         35PIs0kSCyH6UIJWQTTHtVYP0rOmZz8Agu/1BQlZEn32eeSorQPNOpioxpH8lGPRQrFW
         qw3Vn1BVdQR1vwCguZucb86vkA6RQ9/AgrPTnmTpgPewF8bXtQ3Xi7z5vnKQ7H1+cMaa
         runw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857355; x=1791462155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=be9cOIj4BNOmbbuy02A5g3aPL+QaTK1UPmL/Hb75rMM=;
        b=FLCT5TDacCwE1b8s7KlBsyZKuwUVszaT8vyvHyjkb5f/DlK9jenxhimI9fUsFRgJG5
         1k9k+Q8WtTaF8OeZC63fI30V1t0CoBKzSSdg7kk55mAvW9oDTQ6vuIf3OgK4tEsY36c0
         8bO6qS0WdBRElNU4LG7ysdIAJBOMPIbzXZJEAQfGntWj/vR/49VOY9EdxL9UQiAqdUsi
         to8fWsGHKVWKK3tTolPIEk9XIY1LnITmUkkxUUgo/Kb1DNfm2TMF0VnUBvl1spXi/KVS
         Y6UC2j/3JRuXpFAaD99D97k11jz6qqdrttDhwFPwiuJOTw2XvyB733N0zV781fd9RfQ+
         MD9w==
X-Forwarded-Encrypted: i=1; AKwUvBwOqKGVnSL+woBBbIuvZXZ+YEhpICbvn89eqgnRvY0vQS/GdotGLFxM24xDcIlpY+4IKlhIiAZNA0Fixrc=@vger.kernel.org
X-Gm-Message-State: AFuF++mEdiTF/UOqycQDqdPC5QtcRmUFYyBxf0RgT7NA+jIQwJ/IDc72
	3BgcVoaesJnFeQ3I0cRNUISVevWjLNigb+zKTmpBD1X7yqsXZrSKoMa+lT2STMdvMuN4UoE0W/M
	kUCZPF10YrOfP0X8HxZSNbmBXbuEqpe27dV/LdEgUGw==
X-Gm-Gg: AYBFou0y478nDG4iRtqJKZUIi2XKsYxiNYn0KicAGDekQvgNcR9Wz6xjrzbFbLLwFcg
	Qwnipr4MSAD1QXTRnJTFxtT82qtUXHvAhOja8bDHHloAQMSsX8NQnb9oRVhHcuOZ7seQUGsAvyg
	iCNqyn0O59yfWe/DHjuRUGlSJOti3cmf2T+pOM1zU0OqtZiainNKXZf1v796EcvUNRVyLbJ1j+9
	MrjfLvBJZzWU1+Igl8FGJCOx96KGW9ljyJHP47VDnovyNxq7l9ve8TlHoQWnXmTVAZ0UqxLxrfv
	MTOFIPHexMe4WtLZhaEAIrZIuBO+UUDMg6gzecYRnyZTYcR40kaQuP71BYSNWS5oig==
X-Received: by 2002:a17:907:6d11:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c2e337bdea7mr263545766b.0.1790857354896; Thu, 01 Oct 2026
 05:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930152346.024115587@linuxfoundation.org>
In-Reply-To: <20260930152346.024115587@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 1 Oct 2026 21:22:18 +0900
X-Gm-Features: AclHuK-sbcaaYjsuOzxj2bOVAT_AE9dB5VOsaeOyAhBrmdCFSdt1ZFzdcdgvrb8
Message-ID: <CAKL4bV61LvdiYKD0EXR1tMOcsLufHJiecdCPnUtt524DpJSFfw@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/457] 7.2.9-rc1 review
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

On Thu, Oct 1, 2026 at 3:18=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.9 release.
> There are 457 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 02 Oct 2026 15:23:04 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.9-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.9-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.9-rc1rv-g815c1e68a78f
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Thu Oct  1 19:40:07 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
