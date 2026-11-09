Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254378;
	b=Ec3Oi72Z83wAaectaxlNZRnZfQGe1wuEunukGcKaott16cZrDjr/7I4SvNT6QOqyW6BQ
	 K3K4rnUnI4yzacC6V/TKPufLqGdTFejMq+SmXL7dcmmpaHjl7WY11BMqABgNVBN7TOxDg
	 kTJ24gtdYYchgRuRbejhYVTup6WLRQBTYvTPkmXaukFc7C492xFOh8qn2cAnzfbVjCEpv
	 ur2fr315t5mSPerNjKORXZkmQtL8TdKF1azDxoDmk+PT+D66399SlU3/hOU4JdzmBgbcC
	 s641hfBXtnH5Z6Ps5qTP7yFjgysKuaM0hTQbvkrL77ZeQc20QnuNvtuqoBMrl4/Vu0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A3d8Z5wEIvDErSrT35kmctdWIj7cgR5OdqtBoCuGlWM=;
	b=c1K4FoLlfbac0Al8Mbr29cfrxCRI5S0F4cCU0CF+BpfPgYGykImOwSZCvrPkWyzRWSQU
	 mQFc85dUOXdI4JED0tbKSMv6y++ZS+taauvNUq4ANjDmnj/fpO4jzfVJ+JXtVesCKcNjx
	 Z9fK7erv3QEY0/CfvS84s7vpn+/IiKhSBiGAf0ZlasSXiGm1Ae3+7yOPfdk5A9ZGLGwRN
	 2bPSirlfm4IV9OAzXkJgKFI9eiYHxiwZaNVb75lRk15mdgCIMihLUUxYuDxTY/dtIj0dn
	 JRqeNut8cGgol2fT2niXFDQEEq4OPuFt6ejJr3DP+eip0MKcfYKLjP1NG6yWwvYY5Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4bI2sCs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A76606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A76606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4bI2sCs
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1af971cd9f9so45249c88.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254377; cv=none;
        d=google.com; s=arc-20260327;
        b=QRQsK1UlvjSRHwmT5D75oJC8wiOlyFfRQzdKIpI+0oFUP9rKM0GebILNYbvGrvkeay
         vBzZxGUNJAcu8MUD9iMJZwREMAqhKs0fOvnbY9hWrX7xEm6QK9NwgKPeCROzkEo79o6b
         jxYATi/I7GdkcEDrfngMan7X9U9XP6cFOEghzaDxEHrAxMP7kmiC/ygkkIPy6FHDqKuE
         HKREtUlyb2SC6DHjtn/dHp7PBC7EcEz30n0REWW6W+1TIf/SmAorYucGlsP6PuoRqJxY
         Y1IsDztt1gmLIQW+Y7FEsXHJQ4eJY3TF/KLoEVuEKrXmr1r9S6PDu+y+v0nZdZ6WsutP
         MPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3d8Z5wEIvDErSrT35kmctdWIj7cgR5OdqtBoCuGlWM=;
        fh=m1/nArCpRDqAaoRlUMzWm8AdWjcPngH1bfShwqcEaqs=;
        b=M32v4Z5yXKqaeo8N6ijwUn9VAuRIKZOQtlcBS8dwqsd3gLrhzlknmyI/d25Evpwskh
         EEWdesPMewR6fidVejyj6YaymtWJ3C0Zwf1E91pbr5ezCdUkAGMzWh9fpJvAoEpETu8X
         w86aQcmP9xhFJPOOlssx4FLaeGEpR7fq3i+yURPiZ/tZtFwiPuDfLdtE2UTCJP5iDyyL
         2vxWUZZXKtpDxp0Kh9f82XjJvRVoKq1J6cSx2e1m4fNbaJO/oNL1oFCardVcP2vQ6j9K
         8lCPr3KSoqcCrLjiPgjDmfJIYuYqk3HsML2hndRyyY+R5PR+PKBrUGU+VtIPeGiIO1zB
         NlFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254377; x=1794859177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3d8Z5wEIvDErSrT35kmctdWIj7cgR5OdqtBoCuGlWM=;
        b=n4bI2sCsOGSCbcMHBlvY9Wedrt3x/hIUBeP06Xxn/2Ff2L6tpbcjRZQYgsLz2Gld87
         40WfROq0ffL+oVWVn+FnXAwg+I8qWw1Xfssi6SKd69jRP4OtAvPSmFz+fCi6+TrnWypr
         XUW1HWvKbTevu4gm7Zeo9h1VZLTFdE1kfbXrerOpWnSSY12mjdcevq31bYL1eNKI8DED
         PS5Q9s6swxEnmPsez9aRFbqio2so4n/G9n02vn7p11xfYfahVBQCrZHlegQpDIIfWSeh
         KgXhGO9tNAxAej2rFaPlyP0sd0jBKw6fCg/Wl5XqHqiY3cOG0mpbko99yoRjl4gfaXTP
         VWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254377; x=1794859177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3d8Z5wEIvDErSrT35kmctdWIj7cgR5OdqtBoCuGlWM=;
        b=hj9n7qJoe7zqNfCGWMwUvgmxfO9eBtL31XBZWTQgvP7UpooFYPcG2CvuQ3LAEbbcvn
         fPXSfNdwLrzdfFmTyMatX1kMk7OnRs3E5ajkTYSNec36JbEYl3U98JswomFLX644uTX3
         KKMv7+XLV54r0x6yqjOYxHwOx2aNLvbpVuDjBoEbCOoFXPXddfKC5QgnOIkssljnEyYS
         xSy2o2NKFxCB+SaC3TTmg7d4K7Bp14r3EpzsCnvb5lETDZdXaW2kB0I3rcnBzajrs8hJ
         ATRGcdPBbFhX3x4WWm8ZYGYe4uiw8B7mx+Y+hE0DfKjSgsBz5Wi+dj+tp52j+uB2ZUje
         YwbQ==
X-Forwarded-Encrypted: i=1; AL+hErEP3sPlIM30f3kULYcUEI4cFD9v3hG8EsUvQEPU82XL2QGbZgAOXwJT3yrZcF9JyHr45rJkoVsqQVQljyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s2qwKaoHbx2yQRAfuXMGhwTvBMRfBYGOwdjct+1V+XOEK5QyO
	73qBrbB5/uOfXz+QS8QiDv/XFrjUBRprcP0RAjn1L9X9aBAtZ0ZgdRiFJ/GPlYybW5Tud2wDhrV
	u+BWAM+GMmCsHNnuDYjqTQtydU+DOrPA=
X-Gm-Gg: AYBFou3xfKFhqCz7MWy68e7LSVbsnYfJTqz37kYUBZTo1eUD/I70mrvUqUeNPGof4dC
	xqQCEtHW37fVj8F0MMEqQVYZ+eELICXwdDE9WGc6hpmwBycBdmWMDMEiVFZkCRf1ONUzGDoZ5D2
	xGyhwzbXdeJU5or0jRG6N/s0yMCY8WTla22rhtF9YcVe/LBcKdvZyn91M2HAkImAoLrsev8lTAM
	eKkJ/WVmTdVIOYagldNnt5ZqWS8XN5qF16+ZzQtY3QAhNSfGflmZOV5ALYPU4ADS2c9YJ8C5WXc
	DUCe66Wgx/XJKNLzGR33r6fta4cx90TMtPaLXeYl7/GACYs3W5CMgpsKuymdR4GWtnE7kUR9rsC
	zIsKQa4ApuVzlCxc9nZ1U+TPfGu8FzK1TwjOSd1lr7Bt/ldPMKsGR9Xr3vUItL1toM162ndS0ka
	FRYcnZ4ucs9tjIxaZTXrzDa7wGJFEsPYeC9ftGaV9omZ9PXvHjIB0wRvRSDdY=
X-Received: by 2002:a05:7022:ea86:b0:127:def:dd72 with SMTP id
 a92af1059eb24-1b3b6025be0mr804293c88.2.1794254376807; Mon, 09 Nov 2026
 11:59:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_PjiWHEDzS5DJgB1wS72_tHp4Ju5Wwr0R0N5EK-i9fXfQ@mail.gmail.com>
 <20261104200201.8358-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261104200201.8358-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2026 14:59:25 -0500
X-Gm-Features: AclHuK_reFfmn-t9QmheX2wZpEISvfvcfsRiQmEay-P-EKxxO4O4ghKC0Fq689Q
Message-ID: <CADnq5_Po302dyx5FA9u3A8os_Q-HsA74nk2qeDadcGe97zodbQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, harry.wentland@amd.com, 
	linux-kernel@vger.kernel.org, simona@ffwll.ch, siqueira@igalia.com, 
	sunpeng.li@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:02=E2=80=AFPM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > What's the reason for this change?
>
> This is the code that fixes the SMU boot issue, that we discussed eariler=
:
>
> https://lore.kernel.org/all/20261103160553.1431-1-atharvatiwarilinuxdev@g=
mail.com/
>
> Its confirmed to be 0x4F1 as OCLP enables it, and with OCLP and no patche=
s it booted fine.
>
> I plan to add 5K support to efi libstub or something in the future, hence=
 the TODO, so we
> get 5K in simpledrm and get rid of this not good looking quirk.

That sounds like a separate logical change from the rest of the patch.
If changing the order of the init sequence fixes the SMU UCLK issue,
that should be a separate patch from the changes to enable the 5K
display.  That said, I'm not really keen on this change.  Can you dig
further and figure out what the actual issue is?  There are now 3
separate slightly different fixes for this for people with various
Macs:
1. Enabling UCLK DPM in late init
2. Using the UCLK states from the UMC DPM table
3. Changing the init order for specific Mac models

Alex
