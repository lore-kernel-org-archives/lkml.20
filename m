Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587895;
	b=0hksE7khAE/wNlmVWI1SOMeVcHW4DrU7hFvHc8rQTnOLa5mXfi9D1gOxKIQ+3eIPeJVp
	 VXR7qkUQwZ5R08QU+4ZtpUDTKg3zgkduTeAdrPHgAv9+tzLzVoJNLTqMls/7oeIuR2pvi
	 5Z7KfIuV5mKIiVCWWNcnRT9sB5ZFx3oMvf47B26AIP+x1R+0zSE/zNFkP1nFBTD3xdpMj
	 j1WOY3vIJRXIgNiJgkw0LnK2VvLC8G1VUsv9p/iEciQRxKSYjaTbsqkWckmc5SSLXf/pf
	 pQoDoJEmiQ5GSyUX4ky/RBMufDxqU0CeLBqC3samC4xh5dgcAaIV8tNMs9ELxiexukg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZBtOs8SUuvYS9eK9oBm2MAuuDuF7zij1f4x3ajNRRgw=;
	b=3AxaynFEKIqyMRLY8w/Exi1ywOqbZNvKH/7PJWPX1L9YnpZRuhTkWVLxXKm2qiYA6sWI
	 W2dnXvV4bM5Vt9F1q6bIrO4sZ5/qNZ5uS4q/1XQsEbEfSyubJ4zKOuiTQDHLCR4thsKxo
	 AoBUoORq9VCOrWHokogcmRoswfJ42uspBPMGLisGyrOvvkjVu1mXAvmciYZ6/3SkF2VKA
	 /RxH8DDN1HXXzR37hOxkuIvkYnJHJfe6DcWg+WpXAQfqj8GItAyXtraSu3z46QdSgpOop
	 GyP0yS0C0NywI3MmzqgAbdHKvIktZPUSxWFAskiWuA7njFAiz8JyTcgBoahQAx655cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="XI/sgWPq";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01484606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01484606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XI/sgWPq
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so299513166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794587893; x=1795192693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBtOs8SUuvYS9eK9oBm2MAuuDuF7zij1f4x3ajNRRgw=;
        b=XI/sgWPqHbvaIZhTDwyYZNjUMym/RZxGPxbTeMcQWx7qLmn0k7JpZrzz91nymKqvkc
         r1T5Y6LdJI+UWGUKcI6xkm4yvF60raEDFBAU063eiZuqIOol9bYq/+8IWDOHP72H1+nz
         I2J09sD2qnq5n0Pkt2Id89FpM7fnevLP9w1sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587893; x=1795192693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBtOs8SUuvYS9eK9oBm2MAuuDuF7zij1f4x3ajNRRgw=;
        b=Z9TcLUM1VWAKBY2ZomfSmGwl2ElhqC2ICy2M4KV5m7Y9MRWFs2U9bggUsLzSML6UAn
         Wwyp2UJgpf+qtGpAswVDfnU4lo+aSXkWSdkhDsnQ/jVOkghoAeGZWIbL72WVoOMIiz1M
         +h/2Bl5yBAsjuyLGxrbydHKpq0rLZipMZ8CQqvP+49wzQzCUXea8C17kTHh1Lp3L18A5
         dL9oYkSRiIiVG+MgTAumYn1zRhQUpRKTLrEk0PCVBxC1cKJSoN1AZehuNbTRu7GgiCyh
         jxwoNDJW45ASfNO5ZHkYR4iZU4sQKrCwikG936uvadlf5RsMBRdufyDX3TD42S0BCmDJ
         bnkQ==
X-Forwarded-Encrypted: i=1; AL+hErFc1D/HUCuHACi5dYUd4tNxdd6QHU17E0qP0iSLT1Ec1Br60uSpLfO5+6zr9s9XDb1wNqMgUtxZrwqdFak=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A5Q0UMtTCZoupbCI0pwFdHZpL+pW7sDTAwWV02+zlCVeQAjHo
	Epsw2kPMpgOSWQFq8jhy5F5Letj0Fd42TSR0eu1G9eE4VLUxfTSCfCEP8xGxvEe1y3OFGBwN/Tf
	YOqf/5Ehe
X-Gm-Gg: AYBFou3ESpR9c8+A0Qwv6E+IDaoopn7To5akKE2WCOwf6mlgo8CSzWaKNbHUFZ7QSFg
	4x67TqNTDYEy10nzY3jufxKMWFTxKQmPrcPI5LrmmxST27+Dj8oresKbmg1Cvp1wypN55WV3bg1
	NBxyB9DjumxfqBfhsJTnldr6fPlTsg6Y6UPsU6f9jcA6I9nbUVtytpXOvVtxZXVzk7QI4OrI9Ks
	GpNaSNBb1WMLvAr6yJmcqtxUeRKHx0gS+0rniRtJ1QxcSAHKI5gqVtpLHBdWrF0tgvYh5PN2DYc
	Ld7LCL8aTcByooglpLcwCahiUwPJEJ8eMeOBLZOBNAJFwhdYNZTaoFy4X573S0ocaOkYAY2aD6y
	BZMtR5ScNUMdaHbtSQNJNovIFvSePOC7+bCoi6GmfUoTAm8su9AyaxrgH2I6az0Bf8edCfYqugl
	V1zQhDfQZmKrJsQIw2k9o62sHTFvFoijZObc8zzRduLEEfIVfjOx0pj3omFSufwBXinlfKYAC70
	bE6/r4Ct5s5AOSzjw2DtbWJJoixrauhfCDvKkZ9z4cmETAGGa8T3R378lRSdSrinOItfEIU/V5d
	O41jdhIu/NbhTzpM0TLmAD1gOQp3HYohV1q646WL4OqNk91QOtZXV2OwBhnd29Wz9hah/Q==
X-Received: by 2002:a17:907:6d06:b0:c2e:2944:d6cb with SMTP id a640c23a62f3a-c5096328166mr258566466b.13.1794587893247;
        Fri, 13 Nov 2026 08:38:13 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b9164bsm123156666b.82.2026.11.13.08.37.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:37:59 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so1404138f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEcqD/287EkdHKuX7vpCmaGMSID1Xq1VVOYchPyzH1uVRDWg4wAXHhedfcRHfoSZOqwK7aO1SQ0Irbk/94=@vger.kernel.org
X-Received: by 2002:a05:6000:4201:b0:48e:870:7791 with SMTP id
 ffacd0b85a97d-49c71e3d623mr7912453f8f.26.1794587878240; Fri, 13 Nov 2026
 08:37:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112154444.417-1-_@tawheed.cc>
In-Reply-To: <20261112154444.417-1-_@tawheed.cc>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Nov 2026 08:37:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMbAusUr0GpSaL3cRexqLt3mEkdk1OP96ZXtwT3rvSWQ@mail.gmail.com>
X-Gm-Features: AclHuK_-H1omPIi3kNtcH0DdX5XIsoE0vQ7Cu-PsOqPjOrjRqcY_iHAPS8_aqcw
Message-ID: <CAD=FV=VMbAusUr0GpSaL3cRexqLt3mEkdk1OP96ZXtwT3rvSWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add LGD LP129WT112684 panel
To: Tawheed Makhdoomi <_@tawheed.cc>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 7:44=E2=80=AFAM Tawheed Makhdoomi <_@tawheed.cc> wr=
ote:
>
> Add the LG Display LP129WT112684 12.9" 2880x1920 eDP panel, used in the
> Microsoft Surface Pro X (SQ1). It uses the same timings as the other
> LGD LP129WT* panel already in the table (0x06b2).
>
> Without this entry the panel is driven with conservative timings and
> probe hits the "Unknown panel" WARN.
>
> Panel ID: LGD 0x0555, EDID descriptors "LGD_DV1.0_" / "LP129WT112684".
>
> Signed-off-by: Tawheed Makhdoomi <_@tawheed.cc>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Please follow the example of other recent commits to this file and
include the EDID in the commit message. Also, when you say "It uses
the same timings as the other ..." does this mean "I have the
detasheet and verified that it uses the same timings" or does this
mean "I have no idea, so I picked what the nearby panels do". Please
be explicit about how you arrived at the timings in the commit
message.

-Doug
