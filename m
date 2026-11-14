Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794647550;
	b=sgpRaIQLY1SALiLYo1hQEwzY3GKJfoPqmVOiTGVwU1vSHfLK84YWtVPqBdSnR5nmH48y
	 Zbr9s8fbGaDbX73Ar4Bja5TJgY2cMhWTURrVwJpVfrnfrzV3WUOeWVoth3rV/yMU49Rgz
	 64aCreuaW9MGsjCmZT4s0HMAD2MlFGqGn2/qX6IuGd5giVpR5eOJSBkcfO7gNuFtylRuQ
	 YWnMkMy9spADa8jHYFT5U5o8JkYb0m2Vx8vxhlgXFJyfxf4pLvP7Im2xWS6DGHt1RDb8d
	 Vw9AaSxS9t3ZT4suqwGnLJDoyB03q1SRprWEdobixwAGKE27BHZGOvS/Kvg/PmDaKgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
	b=OdYKwLKXRdQ96MubSi5jPYeQuoQVymVZIV/PiqsYt5bNCKXxbZZI2+L6JP00FORiLil/
	 SmNkeC1v5zaC/+SBUAEC8jQ/jBFr7Rml+Wg68oU2d5KLBp9eYbLd6SetVlq4zxt0bcWhX
	 2ww4MEIK+kIAjsuRlmT0DZCatxApd+B4eTd0WmNHsBdjYdtmCSsqdEV/QCR06kBMtPUk4
	 48C+VrakIqThKG+udm5eH/8sNJk77I6c06Xan4TBmoYHHecWGyjyYj2ygdY79CyokM/I0
	 Z19eb61DFwydjMWxcM0gzhqkmfoLvsx6hqGCnRnhtbNKn+hHIU7ZOmT5idNjDp0DRBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VsRytHHJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387A606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0387A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VsRytHHJ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2350255a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794647548; cv=none;
        d=google.com; s=arc-20260327;
        b=K56hLus+V7b/8jMryjKpD4Q5N6Kk26xWrgRuzKAbbf07YSGyta/vF6RRnaQuoJAi7v
         jdg91SFqbpccpFE2sEDUikRxv5nSBFeGuC/c86uq+kRJ5BkaE1pBXR+GRgAqZLYQE9RX
         wwGTy/TaDATLjeA1cy59f4zSj3rVm98kWHEaEtWpz0sL1LL1Lch3WEcykhyclLj+1lzH
         OVU6+PEotaRe9/WQbo5ib0S3hrfPpLysH30KhfT+gkgoS2mxkhG36+7sJ5rlR//qU9MW
         jY2U9rL9j9JtRg5o3u05cIuOM5GBfqfdmLhwXVP999MV2ldvH1yz6rgLKAWv8h/0oWnD
         rRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        fh=cNV81b6eIbfOIWsoFk2ulkdQKPR5BMnUu/mwcYde+7E=;
        b=EUqX3A0LYjjeqUJcafhafn+RkrweVCq6VVc1NEbLGHZk+nFXh+gtKMEFwlmPtZTszm
         WDtLafL9wwetXUVIA7tOH5w8L0vvBYYxAZmEzDCQ/Z4NflUaP1AKekrWg5y+5vjRtywa
         haJGb0RmdoN1tSWw9+sRoOFU9DNwGzJH9D53s3IaazLvWpqYj6fo6lusFKbnVYpNr8ow
         dCPwrG7I/mEI2V+M0p/h+Qbpmngdcj/2zUvf/yVmljBMiwoc34NLWaZNw6llVDzhYgR9
         fBq+VwuhwSBOpGQcMDJdxackq3gQ/URGY8JHdrPjnxejqvALjB8hRGmxVlmnFekSN4SF
         D3bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647548; x=1795252348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        b=VsRytHHJ1LkcaDM0kP+WJnISyg5+vPGuEt4cnUJF6XBrhQ7l/i0FGEVnErL1/vDHOg
         irYC72XreKzQ2gfakFrFDUQ+dyrwwvJDuoyV/c/pLoxEchuOn79u/5EGVXF/QOJz6ebB
         /svE+xmhY54oNQMP9e+UViOF28Mj3/azn6CVZ8v3chL5C89pELitLZq4KmTdE9v2exQW
         D14W/4SbMcoZGDcpnLKkcyL0Ya0AH44w+yMBgoTUIOa94GCuc8mgTA3bgvUd9GFSgYgL
         ZE32NcKHL2XjsGcZ/PKV8uonz70ybBssg09Rr+9VelC5GCqOQ3jJs+X6n4NUqUXkD0RG
         Tc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647548; x=1795252348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgvUfAbzidgQx/NVfNu92v+oDQg6bL1C3BnxS3Wh8CM=;
        b=Fhaqy79A5vtiwARqj19XIAnQ1IcBkN83olRwq2dpS+fuyG9TO91RMN5nxtevZTA6Rb
         7oLHA6bdfba1xjoALCezN8/jyTnhif4I1M992nyhFazFOTb4nNkwX0ZwLI7DuDlnoVbP
         lLm8dWaCS4UCWAPb49iq1a6mBKr0BRxQ2vkUMJDQUE4lRpmfmX6EkaxWOMlrNn5rXPKP
         gx+dMVliLpgqQezxLUhKKX2q72YAuZu3gRWEs9+vBPQkppHPFZQgTw3wlwoZldnBylxs
         lDTD7Sgt7pWEOQ0BfIwcHRVvNy+NU+7XGHs9k0Vn61dKpztJ5u7m+HfFCsZMXd42vRnN
         cw6A==
X-Forwarded-Encrypted: i=1; AL+hErEqPiTRQDze6Grrh+sqSOk93OYBQeiYjCiiiiC95iW90btwNI8AFfj/9Y3y/gwyU94g9CzJPpT8izQ/QUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HWYVkoVEIWOm08PIil726d0Y6MeeR6NKkgY+nJUl/RxjclXOv
	fpvs2YVvGYbrrDTRivEBncB21mFNL2C+NZtLCuT5LziwK7eYBeHHQ1w8JEmTwgnY5LHNvQMMbgF
	paHD43VWjWli0vo8Vex5MEzUbyie4Nc4=
X-Gm-Gg: AYBFou3jDoxCPwn/Z2juG+7fOd9CztC8qnrTX8wFd644un7vjbGqxcr6u14RatBL8uO
	PlQwfUBSOxAXPjLPckVnNmtLH5UsEUjzCaKeHY+rF4sBRsx/14SNjxGOxqlNs5SAp7Qe41jZRqx
	rvGv5iq5GfoIeZqFrN5jsMuOM84CAMJsyUgpwnqkPzZL6b83miXV7EBwO7VqvQLU7aAnc2b5j5H
	0uW8KHfaOAUDMeIcBkK1N9OAjacSmDWys6SLnRnJWUnzePFeQtDHBbv0aK9nFjlaHaiqCcJzntx
	02a+aozVeF44Uzb0eD8vbD6TyBQlpqjOmQeGJb+6Ouxfok08i6ezrnKVn31TjTsR0uWvgM93cAk
	vt40bodAQn4DxH6KMBuAqwFcC85xvT+nv2PJ1Po9zzg/HuLYZ5DjLIYZcssvn46S/CVYuKEE92y
	nCVcLZ3KAaEVvMUcuYmkiDtLk=
X-Received: by 2002:a05:6402:42c8:b0:6b5:8695:f838 with SMTP id
 4fb4d7f45d1cf-6b7c0d1d417mr3702075a12.39.1794647548158; Sat, 14 Nov 2026
 01:12:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112200359.32685-3-blum@kernel.org>
In-Reply-To: <20261112200359.32685-3-blum@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 14 Nov 2026 10:12:16 +0100
X-Gm-Features: AclHuK_X_2RAfyvHpGYI64sNg_uq1lOE1NFIFDEcQpfru7cJQ_uLwDj87Ufzn3E
Message-ID: <CA+=Fv5TGev0uJp3s-Uvnqk+b+AxYEQzuwr8nymO2y-1J=frROg@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha/serial: Use generic BASE_BAUD in asm/serial.h
To: Thorsten Blum <blum@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Thu, Nov 12, 2026 at 9:04=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Include asm-generic/serial.h and use the generic BASE_BAUD definition
> instead of redefining it.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/alpha/include/asm/serial.h | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/arch/alpha/include/asm/serial.h b/arch/alpha/include/asm/ser=
ial.h
> index 91115447319c..205e61ef2975 100644
> --- a/arch/alpha/include/asm/serial.h
> +++ b/arch/alpha/include/asm/serial.h
> @@ -3,15 +3,7 @@
>   * include/asm-alpha/serial.h
>   */
>
> -
> -/*
> - * This assumes you have a 1.8432 MHz clock for your UART.
> - *
> - * It'd be nice if someone built a serial card with a 24.576 MHz
> - * clock, since the 16550A is capable of handling a top speed of 1.5
> - * megabits/second; but this requires the faster clock.
> - */
> -#define BASE_BAUD ( 1843200 / 16 )
> +#include <asm-generic/serial.h>
>
>  /* Standard COM flags (except for COM4, because of the 8514 problem) */
>  #ifdef CONFIG_SERIAL_8250_DETECT_IRQ

Nice cleanup, looks right to me. Thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
