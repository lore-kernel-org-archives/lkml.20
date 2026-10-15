Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874ED241695
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024163; cv=pass; b=uGTbnHjwtkVU9x+SIOix5mH4gCu+2qxlHjILsHmSIu963LxRrgs5ZmaKPchqAul7AZ6M9k5hyAT4VxMgF1aZv5EG0UkR01OKQb74XpqcTRM3FaosiGy2H/DPPatvsKNDEKVLbycMV6Tysuai8CwJHw8CTlV33z8+sz0QwaBJliU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024163; c=relaxed/simple;
	bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdiUde9x3ELSBmz7WIVAiP0RVVm3BBWU/gjl5KpWzSf8MrVh4Zoo0LFCiXkfLHBcJu1My8pz2lx4T6+VBdIthOTspqVIfAhp/emPUUZzlyYA4nU0ZyIxvx45W+jchtN074QOKSr1StkpN51WKS3EhkOon05h4EhX6hldK6GVPCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoIxLAUT; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoIxLAUT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c315a445752so710899966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792024160; cv=none;
        d=google.com; s=arc-20260327;
        b=ADD704wkllkh2PtJQh2ywz01Yt9nwAHXQC+9No2Ih9AODOR5emUt6Vw0svmtXc0IhS
         zLTOingk0KF1jffs/icZaDQQ1JRa+9GxVnv+Z2nnoE1pdZ7iQUGwJvXX+M4l9WP+NWsw
         7TZZGNZ0qNI2vSEj+RXhEXiybI0Z5BqSuc3ED28rfq7niSigiYVBb4vh5EOu++Eb12lD
         1FUovJpBkJfNvEW4S32nzGhzFjZZjiSYRj+DJ0r1lnnpAp8Yzz4KPWnpKE2Sk8eIZVy7
         Ha/T/E32LX+Z5dPCoqqPLmM6XJZZak04Q5V5U1SmOY/3pfE+uAtiV2wdeEC6o4pL7rYf
         4tfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        fh=JRi1HGVvUA0W+f+/GRZbiwKrYO6VRUpHq1POCSe+T4g=;
        b=ievik5AMxvKHsFXvHezAZXRypuzkz1tXopTKo8Fw71BZWs+2HSxKhfdQOHUiwvm5jA
         PeJ2fJ+4HI3UPEEgs4+vMDDTt/zChPdjNdAHNnYf4RIZxdai1puo7LTMLu9Ey5CWx9OG
         ynohmxdIlK21NL3SaEOwi/vTv3nP3h9t/CnwV6jKwzHQkoPRGiQMOdyFq+7V3vLYdYkv
         mF1c1jzemnGMmVoW4r/U4wvr401fTM6Iio4U3sSxDhCV0S6X+RYBg0j4DUBLSg7eDYKj
         433chPTLoRzfLhLt9QhsFHUg0BOe83Iz3gIUuKmRyyr2cUcM5fhm82Np3vbj+E8dSnW+
         Ka4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024160; x=1792628960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        b=CoIxLAUTyAxjjdN33ABnWUuSphNtKyTPPi+ECRRnscb2RgKgLcmkBg8l7VR1S0Nx43
         En5ftjHFmWxklKCSrSXRudFD/mH3xuNLD4h37T6EMlMci2d1zGfyzGJCsK7RIkE0uHGx
         S+/g9tF5A0yXpPEmq1zgd68UsDNSC8w/xJPglVkvTJiyEDOX8TrcZkmFi1McVaB41KzH
         DYBMZIFIWcig2EhbDzytrSnh6xKN8cc1GjwJAdtsxBGCrznKA00VKbo9YHCS1+27aE69
         MhEana15zzcoYYzX8urDoIHT2PuJcbgPMLBE3rMOhgDKTlrIjosEB5FwVytbK7Sqjnpx
         FqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024160; x=1792628960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        b=WnCK2z8y6lvpuWZXuDCumih/egOtmOFFbFMhprwzxCLk3cKcIfBeVF6uULzwMbKd4v
         Go2uTCMwPX73JxbUq74oPaZCx9ybajBLVhXW4/N0lQzsvGA/b9PmK6oDtIZJtjAMkehw
         ehktph+ho0PrlPkzjQNTMEYD+vXDMFzHXw02gfQl4Er+Ko1KR6Iwelc5T3dWs7g85/8A
         mDTuEzXuDNxUyNS8KNFnOrXTgTO1pwaxQVMxloDWZTwpXIW8TKRa1C7mR06m49YFpDH7
         CCc3iECBrutIc4O3pvMGdjMP6JVbrBQokDL/TXC3DT7ApCJtuaQNXZInmGU38/eFNRfy
         zlAw==
X-Forwarded-Encrypted: i=1; AKwUvBxa0nBbOIfoq/thKrf2G1qeddLLoAxo6TwyY/IrSuhjRxUDTog0hshl1iGxAMLrnZ5hpBNXLVWe5egWA2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK791iuj4uaI4FCHnx/EtbPbXuMMJYEdDQJTkEZrAU8NheoM5HU
	H8B7uEuiYnqfswug/19Mvhwzu14Cqt5lSce9bf5044tZzj9KKZ8XvPVd8VAGkaKu556GXkj4y4y
	xr+ldK7mQ7ulPWSKHN94aRAsDHa2D8w==
X-Gm-Gg: AYBFou14Ys21muDvszf9LN8nnbv6gQgCTtSqvsvoiA8Q4JYgRs68G/8PiUiUUh8Bewk
	k0X05Vf0L1Je7iC6ytU7+RpIMvfyvWhK72WbLSukwDrH3nnRPHMcp1R7ABtaRk0HqZQ2iR/EIK2
	9fcV5cH/KMxRLkDEfnHBu0yjoyqOU5LwHWYQ37IgvRZOJwrsQDoYN4mGzwg7rPXwuKNrzUt9kVx
	AIZySYao4BLOHfGvJEE6zCIIchgJYULP59z3nWSHS5ZCz199enjKr9mjG8uOWA1/CL7SU/gt0lT
	KWlDfeoYNjP+QNAQlm0p774X0BMNjj5vCXKINgvhrqyYhalvMO7/sAOxb+6HnIZa7T5WChNNQR4
	dUkHyzv7Aj04ZvUuhlig1Gw1xjoi1paoFjXV6qmroRwosgVP5R8HtK4YJkCcD5mjgweaE
X-Received: by 2002:a17:906:4fc9:b0:c35:d261:636e with SMTP id
 a640c23a62f3a-c3667073d72mr666787166b.18.1792024159565; Wed, 14 Oct 2026
 17:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011160034.93d011b386c2-1-mhun512@gmail.com> <6bb8cb0b-e614-4d7b-9b61-fdea34c2f793@kernel.org>
In-Reply-To: <6bb8cb0b-e614-4d7b-9b61-fdea34c2f793@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 14 Oct 2026 20:29:07 -0400
X-Gm-Features: AclHuK90IW_k2_E5rv1a20GLSR4ciHBFo7t509iO_4hXs2Kz5cZZT7wv7oXQqQU
Message-ID: <CAGEsz8FAq11cB=7GOvMGmoWQLZSSuaGoFUNhuKzMogMJ7nqHfg@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra: Shut down Tegra210 EMC timers before teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was found using a static analysis tool currently under
development, which we plan to release publicly in the future.

I will clarify the wording in the next revision.


Best regards,
Myeonghun Pak

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:58, =
Krzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 11/10/2026 22:00, Myeonghun Pak wrote:
> > The training and refresh timers can outlive the EMC state on removal
> > or probe failure after clock attachment, causing use-after-free.
> >
> > Shut down both timers before detaching the clock provider and releasing
> > the timing tables to wait for callbacks and prevent rearming. Initializ=
e
> > them before clock attachment, since set_rate() can start training.
> >
> > This issue was found by static analysis.
>
> You are expected to name the tool or be silent. Reading code by LLM is
> not static analysis. It's statistical guessing, nothing to do with
> static analysis.
>
> Best regards,
> Krzysztof
