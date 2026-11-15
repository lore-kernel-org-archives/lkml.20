Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785282;
	b=LIs1XvINnPuIfw/7LQzmRYE+pRXnWugeS0KTFIVOy9mSy5/Ljm8YEw1TVHyhxfjQCnGI
	 d6ARhJgPu1IKv0qUoLJtFWE4cO83oEPQcwWhJPMb+4lvrpU/sL8RGswsvz2oFQhg9ujas
	 0I49m1YKluWMfn/jz0rVspTmVPu2p8MiiMp9lcWDtJ9UjPh8Atds2M1VS9hVVi065rQME
	 L7VbkliBRcZSSqg27vPpvPEGWlXGjVtpB8AYruNjPKmCacAIAGNHVGArU5SPCJXsettaD
	 H6ce8fHjEe5KdG+HRzRoya7LZXL9wJsw5L4hikxfWvTSxy4YPmgWJr0jzE5aOeYwuHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
	b=KkdfyTlBZPOrGUeWrDarFJxcNhO7WTvzSJgj8wEg6BDh9LxpvNbU2BB5cFuml27PzWI2
	 psGNYzMwzATdvDu/BIjEKQcnRoFeXezNaQue6O4PRxR4S0l89gpqz4XiE58qNSEIiTTJK
	 JdNSPwcsdJV02CerVXwE1QJgpN7Exd3ftRZ3xrdLDvw+jQAQE8fiflNGx1tcVvzWpO/Dx
	 q/53mopp2Sxr4KU8FbOs2TvmM9cGz2BOOeH5VQxbrtfYePhOsciJxcW1A1keNiYYQ8uGp
	 9o4I8vyEC27IUtyuWtIZcfAFfTzkoAQpKmYQZ4sTZECXQBmr2DmyoNH4KP8CietuhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHfTjm1v;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D9E606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D9E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHfTjm1v
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37f14feca60so551562eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785281; x=1795390081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
        b=uHfTjm1vA1E+yPk48DwVkwJaSYq/k198BXL0V4yP958CTy0daoxtkgjnRWJlsyO0zx
         RP1fFU5rWi/blmvh7O7tz1h4QfgEp/1DJo7Y07kc2CKpogNHLdQkzewbMDvdEznhhr+2
         TLL3zpwXBFFhz2yHsevVKxpQeNvJ8wGNkmLUJtqiF3E1BpB6/IJ0qEMeIlOkBdNymBnt
         SJ+dc5rLCkpJKmI+4JEhd3w8PB1RHGxHLl2f+YevAYDd15UMwx91O2dTkQk0ZCydDP9E
         9XcpIYN6uF8DRDB3WJ6nzc1tLe4LdCmGk0Mx71a27JVxBy4NLw/8IQ3mETuAv/BvyLtX
         DUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785281; x=1795390081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikuO6XZ63o6Rkdfbgx3+eT7WxPtGqnpZ8RiBFboTAg4=;
        b=on7D/liqnIVotJL6ApHZ69AOZS1hiTxMcNpz0TBHRd1+Bd/EnITKylczuIur+yyM+M
         gsin+EPnFMj//SRfsBG1Li0HEiM3xu0FAYuAtF1Xwqr7vXRmpvXhAeHhVC1oa2ECQuaG
         JvXqoVqeMkX19jHtErq+tq3EzIpfC2eAxZtYHAJddHZqinE3BVk+NjDBsC4Ug+Xeeuo+
         Ln6kc46Xlraz6V8pFb7l4AzSJHO1t9XmwNsWZbGYhUy6cjROKa4fG+ietZwTonmr/kLB
         VWkiGoJ6yBiMEFJbCgbPo6FIWJWrKKfzvU8mPNMQCRQ1pLijlQqKEZh0qdCd8fNxVgRJ
         JD/g==
X-Forwarded-Encrypted: i=1; AL+hErGL5bPrFOLBymd0SgjbavFQpoAsNGGOEa9VlyRdsZe9lzskJPeGL+W2YIxqPBr0r9PPTsuYhcAJFostlpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQr8LVORnQLcW+JtbBHFEZALBbe/PJSIvuWy46oMpeVmN6PV8
	1YISlEC8MMjVD5O3XgydOwv72NNWNhvZ8qkZ6XE3Glgmtm/RdgX2Nzes
X-Gm-Gg: AYBFou01NEy4tMDVD1eh/S3hn+GLkkoaX747uEL0lpMDWPugY9Gz/z40dZbsOpszeN8
	c3qR9ICfF8JkDfg7khaZPUbVyYNeO1LsP83a1/sAK5/5+wm4hW7S08J6TnTzHyLAt/AN1bD+dH4
	Zq0oQjArVbPYHXTZw8Ry7qGsCYsKYqZ9x2XNCm8HE2006SjmPugr9URzM39tkLK2N0cF1NsARca
	v/2dtkvfhVYKxQEh1ZGh68C0Wwvrx0LC6AQx76CX7I+64USu2wjXQd/ILa7zAaAgoczP6P5tGhQ
	PboY1+N8GCjBWmL+zaiepFeDmzym4SIg6ox1Fe//bjKhoxY4/5uG6O9RDNa4MexmweVamwXDx/k
	TzNNXyJRvEkw0r0YRs7axJW72DBF/KtsqkZnNJZkGhKTDRFKBVe5I5iuqst7W99Y86V1kJBeZx8
	jrpU48RoiGLHB0YwqpSQHyK4Lj8F3Qm7cft/0D6pcpqkbjdeAj6sF7s9u26h+pLt/i0tR044Qlw
	6u874r8pz5eo0EWqASNiGDZ2E3z2GqMJWsnoA8BlICmbOuIDi9zh/II2umeYQP7O6Q1J+dEdC1o
	Xoz6UU6JvIu5Rog0fhaj9KP0NHo=
X-Received: by 2002:a05:7301:db0b:b0:36f:4354:608 with SMTP id 5a478bee46e88-37967cdd5e9mr8607588eec.37.1794785281144;
        Sun, 15 Nov 2026 15:28:01 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31852284eec.24.2026.11.15.15.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:27:59 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ED86F41FFB1B; Mon, 16 Nov 2026 06:27:56 +0700 (WIB)
Date: Mon, 16 Nov 2026 06:27:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: doc-guide: improve language
Message-ID: <avo_9xmBYyPpAUZ0@archie.me>
References: <20261115210423.1089716-2-manuelebnerli@mailbox.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o/YRrtN8oc6+tiqd"
Content-Disposition: inline
In-Reply-To: <20261115210423.1089716-2-manuelebnerli@mailbox.org>

--o/YRrtN8oc6+tiqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:04:23PM +0100, Manuel Ebner wrote:
>  This guide is for contributors who would like to improve that situation.
>  Kernel documentation improvements can be made by developers at a variety=
 of
> -skill levels; they are a relatively easy way to learn the kernel process=
 in
> -general and find a place in the community.  The bulk of what follows is =
the
> -documentation maintainer's list of tasks that most urgently need to be
> -done.
> +skill levels; they are a relatively easy way to learn the kernel contrib=
ution
> +process in general and find a place in the community.  The bulk of what
> +follows is the documentation maintainer's list of tasks that most urgent=
ly
> +need to be done.

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--o/YRrtN8oc6+tiqd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavo/9wAKCRD2uYlJVVFO
o6zmAQCPre4O/d+K/W4Ct4ePFRlSQMdksLea2MbK0amcmxtUFgEA/nNdQdORodlB
wMnhF5aBDNXUXEEmrONy7SRfB1m9swo=
=A9RD
-----END PGP SIGNATURE-----

--o/YRrtN8oc6+tiqd--
