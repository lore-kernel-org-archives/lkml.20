Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9547B403
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042068; cv=pass; b=dJWiMUEfBtODVZi3JSLc1/XRW5DIKiAwWkiJ1LA07T2R/5nfzoBhMWdMRZZT2OnmbeZaDwwwUJ+7uvjIehulSG7LrIgESa+wmdI10rGb3m9WAHwCKVNRJupiiNtHZYGFPlqahrjepdthGj9fqHpPu3j4l/HrPCW2DGiOZnrt5ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042068; c=relaxed/simple;
	bh=tSzuqoYB9TXawK7iVxpqBGLCSAEWlfbPZXo1ULqmVg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJUTSeY5uwVamPq2KhqNpiA9//jXrGlPcr6Z3v+72JQYb6e69om92XbIjdhGN4FQHHKyu0ltH70OxIKYXvWNGzW/ygapyU4uMjwkn88IV9s6tddlpiNGw3osTFKQ3PGhFowGi4bQ2EkCBjV62qTt1nt4YCaNwQLJGG80wA7O4Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEZJ7RxE; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEZJ7RxE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso1338061e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789042064; cv=none;
        d=google.com; s=arc-20260327;
        b=lG1SepGm4dAOKqmeDeHczpIPo/MfXBwybj2y+TUMRsJGrbkJNgMArtWiM9Ok2nLptz
         GjbUiIqDBzki5oo2lxeFG7++6ipMJKPgLNsOd0aPGPqdTkX5T5Mxjw3tIJCZbm+CF6oJ
         U1tPG1wQjSI27LmbRezCkdUJumrEXcEZyvL3r43H8zPBNVtiHfFR8AyAiV2mQs7gZUhz
         z5RAVGjQysJbh5m27chcwObJ24N7sR+wEmY2+x/VI0SvFNZ7Hhmzfj9ky8sdsdXPXU6o
         u63mnx4G860jGm21qUK0AEe2/rlA5cakLpqqhSy2D8EMUebYKxkl/x1lt05kJ0AsbZyB
         TjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nSVcwff+CVcVUGrv8pukezXki6t7yHP2l4nc4EnAh4=;
        fh=dYAxZ3LSjQXJNatObUKNZD9Inod1HswnuBENq+ggkFA=;
        b=R08NPhHnhkOPWXIpZadBalNjsAsW89locaCqEgpD4qiiUyynXJo2GvJ9dYooVTpWAA
         B/oUKKAixjucIImx5L7CRCPlnqSqW6bK99CaDVmU56Mf8qU9MXRkuU4NLjXNzwzTtbMl
         uKSEHgp/QD4iN9RPbNYi7LwVHkRm/AMmn5mo0YGe0xKdLUisQSKvqorvky5nIHjHZQTN
         olQSQLYjWSK/ZfmSbN68YuwxCUIFgJAv6bWjq/pj1RSefzzJ+tQwuLSifZIHvdtwy9F3
         0AGjluXBaBe0LxaiB0efWtTpjmfYkR1oRIAIuTpmabBcVv9etiGbH0mJJ8aQZW8hMhXf
         QvLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042064; x=1789646864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nSVcwff+CVcVUGrv8pukezXki6t7yHP2l4nc4EnAh4=;
        b=PEZJ7RxEjMNv/tPHD5CtnOhfntcTrmL2Y/VEpmM7XeGisRFdGXOSjK9e2PXN46eLzJ
         uMhJAIEcMhevU5NwZwWmI1vWLPoX+ayOyY1jWVXEUEBB7OrbD46D/vg6DJgN9aX1r23x
         ZNz7m90jpOX4bIkYCQuYXtJEVb2vLfheS4XDteLVELEPwVvu0v/uzevTRBoUHXInGjjR
         VFPcI9BFexevmZ4JXMxBuozraZrRnUSQSyzc4v0ZLQNYOSg/L/p/MRBBDUx4mTHr/iRm
         gM1gEWYHYQ2AdoDfjDhupZlyRrIMi4Fuzu5h2TiDchtPdcIYH5cOShNqybw6BDoN+gu0
         TQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042064; x=1789646864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nSVcwff+CVcVUGrv8pukezXki6t7yHP2l4nc4EnAh4=;
        b=dSvGzXdrrYTKX2otbtizKp7Hk8swCZMRIwXRbDTfyrusyIfFcxDMT+f8yg4mTT0Big
         wC9CJ7qij/7KU0kWHPDXgVLUePEuYzj9/4yrl9XJBgjdo86aUy+2HWsfnE2MMa1rZ3AF
         rhuvHpm1pALUCTaBAR8p73XkWZgkGQOZTf6XX0ezKVALGYsLvTD1djoEi38fc4zXa4PG
         Q9N2dtqOnwwJ0F9CUrJJKUisMrNUqg0i8cN53lZDOyM+Z0UMeLgKciuLdl/o3m4jAcCu
         ARSuatHS4Ot5TrJzWw4ZHovQX36rMJF+Gb5GtyQajvaEc+NEEanmeYb1dCO2JO7LI4cb
         031A==
X-Forwarded-Encrypted: i=1; AKwUvByELWgGDWkQpzaqFP7hdMDWzevdIdiTPDC/KtV6UVwr2wsw62q9LieCjgvcUfM1Yx3eXr9QnzH0nRcDWj0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntgxRzJY8bkmv7MkJkuHRoJJ3r8SsjC2FckgWa+JXSKoAQv6np
	bJG8VG0hFPJwfwOlOeC6gH8MZakcIqlsv79m77MYTLAqm9DFpwx/uzzT5YqEJzepvY4r52TuV1H
	RZYL4UFiHXavvhZoYu1HlOb9zRz48J0A=
X-Gm-Gg: AYBFou3peD5bzzZkRqLG1q9acP1+efmW68T4puZ0fbykuWlZ+kkixQ+DFp/BYiFUGKl
	EP+pBBRQ8FRWW5LKF3gNJxnVOmSi/stRvQCB/lXqzMtHfmfKn0oIQfporDx4W8UNDeWAQQ6X11P
	G5cTdhV6UpHbNz3ZOybbzRVxYjSblnk2PvdnobIUt/dGDOxW5ioey0DLcRC+D0ZLM8nXelbpH2l
	m+tdixQ08hKZa/QwT5i8FpUEjCfx5Zt4W0GnyqF6rhbLdFQTvV6LQRwAvRd2ZXkO+KZaLCxXOUQ
	m/N0yal1i0D0KThdubRUZLWhinwhgZNJ5GsqfdtysLOqGQw/B2LQaKptf/uemKUyyNJ828huhch
	/7vdWByg8h4Vgjg==
X-Received: by 2002:a05:6512:224b:b0:5b6:1a7c:fd8b with SMTP id
 2adb3069b0e04-5b61a7cfeebmr7039690e87.49.1789042063842; Thu, 10 Sep 2026
 05:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909134230.441546314@linuxfoundation.org>
In-Reply-To: <20260909134230.441546314@linuxfoundation.org>
From: Dileep malepu <dileep.debian@gmail.com>
Date: Thu, 10 Sep 2026 17:37:31 +0530
X-Gm-Features: AcwNN1VDrzOq3YTtrG0etUeC6fialLxE7RZyO0hylbbPOfOu-9j4MEH0Rj6kjX4
Message-ID: <CAC-m1rrWxAUSOw3H8jiztm5DbXFk--LopHmhyB040WA5ieAtMQ@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/556] 7.2.5-rc1 review
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

On Wed, Sep 9, 2026 at 7:48=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.5 release.
> There are 556 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 11 Sep 2026 13:40:31 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.5-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>
> -------------
tested Linux stable-rc 7.2.5-rc1 on both x86_64 and arm64.

The kernel built successfully and booted successfully under QEMU
on both architectures. I also checked the dmesg output after boot
and did not find any regressions.

Kernel version: 7.2.5-rc1
Configurations tested: x86_64_defconfig, defconfig
Architectures tested: x86_64, arm64
Kernel source: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
-stable-rc.git
Commit: e01c81012950bb7454e595765197025a0fcbc0d5

Tested-by: Dileep Malepu <dileep.debian@gmail.com>

Best regards,
Dileep Malepu.
