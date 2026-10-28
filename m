Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181021;
	b=jU7w/mHwG+gIL63+anuH8nIjOPgmMf8gyx1zAatwgoppUCJuJumDpGELEIjRlaRUH3rp
	 4d4hBd9wSm0Qw0fXy2eWUrBAcfXLbqxWs7QG4VTUV7I0TAI+/rLHQ5779S7UQr4wpe+Tq
	 1wzhn9sVVTVt0d78ziLFWUABk/KKbhpiiLEX1w+f+4IzF9ikcGeNaj80WTtmz2B2QRUD+
	 nOBY6SayCe+qbMrxPRe4B/LVbm7Gm3L7IQj78l66ACar72O0YYBgcW0OJjCUd16ljZeae
	 etglOBvC3CLDmx2+uIAY8WQ9YZbmMqXieL7qVzvU4FJ0NEzFlincv96nYPo8M8GmVYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=wHn0jlknkWCQZAN9Rgma5LUaaPzvBRpyqMOKqk8rwzHFihGS7YzOGqbbVF743zIOhMZE
	 FkXAyUZVNmfzongdVygfYH7DdIp8fjDBzHfdaMkf6S3bsLvYSwBabBg/uMF28OlUl89A6
	 ngQPdRALAfgWIyT/8KAq9ai8wnVbraSB/vkZoRkh9Q94/rR7CIxSo/qhKCxdtmHJvw7Et
	 ycpAYv08TdfWpy9YKVNvgfSu81R6d2dPh4neiu3Vq04h9rkegKv5hnsfyc+GZTM3UBJAq
	 UWFgJhZdTmLv19Mp6JyIA3wsNp477rk/bu3V9p+WlDxvy4tIcsQGw+dXcmfAZ7735oA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F79606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F79606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so286992466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181019; cv=none;
        d=google.com; s=arc-20260327;
        b=jlWyV7LoNlPjAFc2+tlf35WhBHmFimd/kk2F/aAvj7NdoBl2QSNifQgald4BBM6ubm
         iS6gpxbe6X8r4NTpxzrWWTMig2OK8xAqJicfjjdJgfpfduwch6gKx4nDTkgbK8UU+jEN
         n7GFkzvWZjaK2CjizWeujL0Zw0zKr+L6yVde6IZNuNQ8dEtYDl1ptOE6Yux04kF1phu7
         3mihNDVjXo+KAXk270Gtgpjbp7fr181FBEmd3HfVDAInOH4h0LfQRJRVhQhyMjfZm8Ri
         GnYKMLWIec8NwdCAhlmwPimWV1bu4Unf5JyVkFZY6ivGALRkt3BMtTBkiCuKXYEY4Kjy
         WpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=pPNBeQlme0Sfyo5KVWyS0vTpYnP39s30hjuwXXliPF4=;
        b=OFTldQxupF2a3Z0BmJBVqG0cGv9ZeI5jXYOYJ3OragnoTxUuNnxtRSXh3CRR1s5TXV
         9c2YHoMTAqLCnWBOv2nhlXMLbCBO8k/Ryn4EtcZNh5WsEvMfs0NuohuQpLzqJCpDAxdn
         PeodFLThtSdTNo6aTZRUTVzbWFzvmbniRmaBzNgySa30p2js6l/WZzmlt4DwKFfC0TBh
         2cWvF09HncgYXhOaD2WLOpNA7GMbtTmx8KwRAq3B3MwiFjGd9wQCsXu9Rhm4By1bALcN
         xXAU8WhNdkjsDs3MUfvHQRyt3e8nGaVp5hCEaztVYYyY4umbxNFlAySI49Z16WKloTa+
         A+Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181019; x=1793785819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=Po+tkBhHSAxqEHwLFlZ/dUO+MJX4kBmJcMJ72/CBTwKDm72BzNBiMEteALPgfbyNoP
         EzBjYCRyohCnJfUhTv7oF1MACYHopGGCSjOQ6AazrqyebZD9uRI6Ayr5dej4TDUM4dlt
         SXymOqJpD4azna2aSzuZrbEp4Lwg6lVAvMmnKhE8Jgl/LQsXxfn1L3AWnI0S+lFXopYE
         GOgNNvE45nthasHpbdgbf74OgLbSrrfaJWK7r2jXh+PEfaeIx1GrmaA8Q6XsabUHVALV
         5xyPXXcFo+JPCjrfzKLTnwjN4I5ZzTw08NB2P3kl8K8jQ2pAiA05GHlZledigQ/6uRPm
         L8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181019; x=1793785819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=dAvOev0chUuFtaSbqE/tF5FfT1ChUReM7S8qiOc/VsrxI5+57dw6Xqi7XcUsj2DeLa
         ByLgEXGZU/A37+Hg7ftvMS4XHLVqQe6NwaYcOBSiWCSsmkPlhqC5YJLI0ydUyEujyIYL
         6ynZ7ukzjXMDv2DA49su3GPlfp9jEM1A02FndZ8Su9SPJxye1kTs0GKAB+TvcDju3lhi
         sLyaMbVvS9kwGc7nEpxyU0aJFf+hmh5DBWLMiy0kxc0S+GPl8bbEwR+Nf1CXKHcIf5FC
         cHGEFR/SznBmCAsQzxoCc+ECnqzI8tEkDm1u5BaDoxnALuSn0OMTAaB1jasHrG8cUmC+
         4fGw==
X-Forwarded-Encrypted: i=1; AKwUvBwgZcvfDkNESiXXDuWYDSfW17G2PkNpclFQHiOMQgm8T+lFZtQ1UZBT8om3K+t9IQTwQrT0lS3cegy1RTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC1LXlM1y3cJFD0QiwOhYAdq+rXxymDnOPBoLZ0DQ6PX0rTdOv
	W+u4XbeOAtFVrI/ALBBWAxvkaMA0vxRnWUrPRfhZBS+QIh8xq6Op/+6DGWaYOvDMdCnFYiN4q5q
	HQ3uHvC9mKMOYYU2mHqS6ux2IdvncZm0=
X-Gm-Gg: AYBFou3FxLL8SLZqbU0RunQusgbIX+ocVAZZHHp4rRZIeW2oIwPCR2ww35TIB+ZGUXC
	7GnqsLmn48q2mChKrS9ZgRjqLwgfg841+NFMtJmOmeFZGbFPMlIlgdoPpw7dQH3DwZl+6fVPr2X
	pAlrvRH7CzHasuDU2T17btTgwe0lAYw2ATTRAcK8c4Mg9qxg3VqCUcG8z2o2YnPI+ZIJitvqdZG
	lO4V4LV196A5o+ZufjSHOxiYH3YGNCW7DrC7yA7RycfK8LXtX+L/u5lse2O8732zcSF17GUdoH+
	xyuk9iFsUshG/ec9rLJoWySn5aX+UbnYgsv2nE0kw3GYkswT/E7cuj2RCx8cxz7SqoSFhsc0Ubd
	8WYMmpsgrdl0MgkLiZ4ASYxH7orLhirIrNf0xzZbdKBzyj3hiVI8ew/mAqkpwGh8DvdCwLP2fii
	nnw/oRXwLTaUrckj2fyXXzmbgoQ3FTMJt6DcPFdsdfMuo+EGCtaUT7AqQlI44+tudx8zS53LZoi
	z0oyXofI2zFxaAEoeNWIQKfD+yhOuvRDaAotUdCSPXkOCo=
X-Received: by 2002:a17:907:86a9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49a739f8dfmr484567766b.14.1793181019107; Wed, 28 Oct 2026
 02:50:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:43 +0200
X-Gm-Features: AclHuK92we6zl1A1tCfKfYVeuXltUG4Bsfa-fRzr4orRkDVhJuYkTUAxt0MOtcM
Message-ID: <CAHp75VfR2i_PPZwSG2UPaxShU5L=FsSdEAT+0iUMDKAfugbRsQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
