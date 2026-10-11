Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC154705F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681967; cv=pass; b=cezYymMwDaiwNkGQC7u1axJ4eMal6xwsY8hcm2gH3vhGHOOe6xB8wTTTFZQ7UmJ2ZoBL+gUvW1tRFzvxhZTQd5QpvCfbvwFytIdtrx0KP+lslz52GvyDJmkkCCHqCMpnRzCz9sofh6ustTW9eLeScQONmmeJmvFsYuianOupeQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681967; c=relaxed/simple;
	bh=4AOaTpaQq8Voh+cFkgg8oIDZlCp2f1Lf+Q3dWmXSF0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo3NSQoChLSz/ANzIVGpxNlhl6BlsaaVK7N8eu+u8/T4uWmXm832OkkV+1dwhq6eDjx3l6rX+jkv8AbmW6x2jVzGeIxTMS7lgLpEA5XgujGwLbi70WOjNkvFgO3sKCPTkU3Syy9PVYKwdGgsR4k6eMz7sxa36+kUKC6VEtYXNSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sladewatkins.com; spf=pass smtp.mailfrom=sladewatkins.com; dkim=pass (2048-bit key) header.d=sladewatkins.com header.i=@sladewatkins.com header.b=PPEEsLtD; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sladewatkins.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sladewatkins.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sladewatkins.com header.i=@sladewatkins.com header.b="PPEEsLtD"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66fca0709caso606160d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791681965; cv=none;
        d=google.com; s=arc-20260327;
        b=Hn717owHDSH4Hnq0F71xOA8mL11Ci059IzIT37yWvjMYZ7dtmKc11mXR0/za0cPGtC
         8yEFSrYhspetijV20OLknoxLklaT/SqFcLEclrxtN6Arixa8B4cEOU9GJcnsdW/CVqwH
         x92fj7qlOEbD1tCuPIbPvv2CRhBRIEOMzui0tkbW9JaBYRUPzTzgSIgQVKocQWS0TELq
         qNe+wSmVn6i9Jcr3THkYJ1iOtv48WwhWp9FOiNfgVfjl1lQC0tNBnHJNLOmSBTQAbR7y
         JmYdnI0qthAXOyO2kDzL/QapJ0FqhWHJzBNguH5VON9v7WZ6eF6s1usIH1gp8voCZL8L
         BWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9yH2y3goTIlD1nGF+P4iDsFdwyaI9RVJU1CXJC3Tro=;
        fh=UwzeX8MAgCqmz8h/ro+yBUMMMe1YazaIu7hfYiYoBN0=;
        b=GMuatGJeeQSEaOO6K/mbDkRm1tQ0T5Khf4NUbggpcdu5rNVbVGofnR96dvGU+egMxB
         kWUnZfJU++6VAg/Y0SeV7I7ILz+Hwd76OcgJf5NrgVVN6AHsU2hxJlogmTtzfLxZMLSh
         M+q1IWbzobGFwlyCx/H/NquTBzOtF2s8wXIiHIDMTcUoMN6I5cupGqEhH7xE7B/YKqmE
         UnazwmIdEQpYF6uZzwkctavOe3bqXoNI8uMsXl40LTNN+XJalTtcVq5fdn5dzLm9TZuv
         HN2rIJynYltnAtEMk9JzsXwLD1U/NjtpAmTT5hpD7aXhvxtLs8RslqJSzX5U8qOvtrx7
         wOIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sladewatkins.com; s=google; t=1791681965; x=1792286765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9yH2y3goTIlD1nGF+P4iDsFdwyaI9RVJU1CXJC3Tro=;
        b=PPEEsLtDEYS1NxjCSgifjcobz2w2XdEVyzCziATjOsK9KoMWGiaeJNjZEl6OFFnB72
         jTOY1r/T3ZUGVve+WE6eTjle03pWL9prtucEQdRcnj5nrCs1MWQgVF2ZV45wfy5uQW4e
         APRLU1LW7ly35vjkJUnEjXsee4WEvO8g8zGi81biHckJHLJhdo2L+bNUwsx0ivEzBQBB
         x18MLZNe9j/sleqa0pM7SO6ezp35HjK2MEwTyAcsVX6mCkGxGUU0Xq8h93cTwGSKkwwY
         rHuQogj9GsK0UI2LoiQfWOxsLx5T4/LbPOIpF94Skph90SVxAoh0r7duPo5OV2jSADNy
         osXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681965; x=1792286765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9yH2y3goTIlD1nGF+P4iDsFdwyaI9RVJU1CXJC3Tro=;
        b=2OA1NmcJz87qy/52aGBuABwYkxYLuGs1o8zv4/rFV3P8IimPmJUdiEkLwpAADi63T6
         Gax+ucx2BZSv0l0vTZ/9hX9PgrgQcOXrH8YhXJm5/PCWzlJ3RWDi/t2yiAPK8q/74qbT
         TmD8xIfTbzO1a61xipt9hdQlwyQtBCEdIZ0JgeFbt/Tnnq7ZzT0ywWJN3wFwNzYTYVia
         eN5QrVlB/V2EYuI8xTGvJcE8nAVo+Gavc+Lm7dCcZDCas7uvTD9s/hjgO0TsIcPn+Srx
         sZh7s7Ll8S0Lo4Xtn15b8cHMmBWhKCK/FQHtYpyD8tlAF/CIDE+rmWKTWlw98UWCh6Hz
         8gwA==
X-Forwarded-Encrypted: i=1; AKwUvBwfQsHMF6cnWt9IU3zamqwTPRvAxCr2bmMxualcdMS0tYdaauVrl4tivKwr6myw7OcQXF7nVfHVmXr7h/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbMOGUJWbnTDTtZVh1UgEK4L3vQci4S5MrvlUxnsx+IqaaQoyV
	crGNg/m53gJ6v0b8A2hVSPjo6X3Atph55xqn/xoc3QDs7kD/nSQTcDkEeklTKubxWV04RW9WI3T
	jcjqOZuoK0WIjkJFM9s5Hwgdu3yjcy0TG97WEiqjwT4dAEIgcXehb1YJAGzBHLw+V9UoS969CBC
	aS9JhF9bVMp+cBcqZLPAT5nBDRoua30aUGi/s=
X-Gm-Gg: AYBFou1Pyu00+JF69AIXT9PayCs6zHg/NhcKykfmA7tlnu3oQQjPh9vWJ2muNs7Vexl
	NFdj/bHnIAE3G5cmPemq37Q7kvK4p3TmGLfBtzMzRLGErL0YDksMlY7p3dIdQ7gaPQS+/H0uxOF
	da+RaYjP3Hra1daEL+VJJfKcWyZMBtmU3MwH7nlXFBW+f94rrf8cUoLbxN/cIf3SEaATxE+gqZS
	ry3aCHo07VZZu1elA5LWUfRoDiFWsr1j9oVv/5gr0mXWct3vx7cID8hkXAEgMv54C83TY3G7Cds
	D8fqHLyg0KiCWCb0KJPiDtbevgUYawpZWqhU7B08MY6+/U9S8gKcdy7dDG8FEV7n2B7u6Lj31LH
	Xn+cJ6hizy0A=
X-Received: by 2002:a05:690e:150d:b0:674:a7b:a07e with SMTP id
 956f58d0204a3-679362715a8mr1849655d50.29.1791681964629; Sat, 10 Oct 2026
 18:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140946.008206689@linuxfoundation.org>
In-Reply-To: <20261009140946.008206689@linuxfoundation.org>
From: Slade Watkins <sr@sladewatkins.com>
Date: Sat, 10 Oct 2026 21:25:53 -0400
X-Gm-Features: AclHuK-mPjRKtEOxbIaB0PCNQlzkgcurHHS9ajfoSxGLwQ46ONA1zvOrJKTSiuM
Message-ID: <CAMC4fzKGfW=zuJYCYjh-i5Z7_1568SSB4k=HGWP2ObLfzsJyug@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rogueport-AntispamServ: glowwhale.rogueportmedia.com
X-Rogueport-AntispamVer: Reporting (SpamAssassin 4.0.2-sladew)

On Fri, Oct 9, 2026 at 10:14=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.10 release.
> There are 428 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 11 Oct 2026 14:08:23 +0000.
> Anything received after that time might be too late.

Hi Greg,

7.2.10-rc1 built and run on my aarch64 test system. No errors or regression=
s.

Tested-by: Slade Watkins <sr@sladewatkins.com>

Cheers,
Slade
