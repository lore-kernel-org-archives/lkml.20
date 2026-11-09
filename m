Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254591;
	b=wsshoBaC0r6hsr+h1mB7JAUKgR9LKrLnoCJfHkRm4o3k2ppfIncwRWUCj2jRGDCM6yjq
	 MKt/c0Ku/bgfRGbxizNWUcOKj3dl3dcv+6Iqxz9PjPNW8Rk7UgPkEx/UE75YxuKNNEoLA
	 4Y5zJ9HYxrT7/V4+6KBx6LA3IzuaY597YQdE4a1Nhwk3tVBqLDDQk04wvbqtS8nHfTevM
	 yIo2/S8M7q/8jbainARiKJ3sWbsdbqqobnIll42iIFdbhPD1Z4WHBHDZi4WTa1gh4/tQ8
	 qvqQuhZNCvMdMlCMKs0UnY4ipfK3xz2ec9KmfsVdY45dLKNNuHcuVQ1xtemGKgXUTRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
	b=i4mCm7+1nfmYVrHPJUhiobwg/k1crWOU+nQKsotWoZP2A3MaagtIPN2LPJRtHKcVI+Lf
	 iXTHnuOFq5BYETIm4/ngR7Sc4ng4ZyIh97K2732bI4gMSAT7yOg57yieO6nvfn5lZUo0W
	 vYzjcAqyG0lVYDCNbKQ1d/vYQJzbnNN/h3eIzUtm+OA2eTjKB6Kcawq/5b5rnJx4Ifke+
	 6IBOAzOUazhoyKKPMjd3MxXv9yU8lkPw1jegjtaj50rYHMqiAxTP7Y7iJxrxp7vfqclBf
	 4wMZTxGyuNsugbPnwJ3U/VgF9xbLIjfA50VMCDrPliJKs6ftOntjjY9yV/R05vX4gUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pauqGAB7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D76606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8D76606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pauqGAB7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1314765eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254590; cv=none;
        d=google.com; s=arc-20260327;
        b=fzOZt4D4oI5zuS1Vf3d8PGJ2UAusS+kbaaaEaAD2YLlSNNUldTykPOqTktJXKLjrnh
         xRZ5dwrhkhWC+lMmfPYCKrJJYzYdH5GCm44+1Ghy6Gpu0Ux574T6wFDHYTxGVAnuho90
         H1nGYgxtKvRQjkca1RH8wE/MtBRWzy7rn8vkekx9AmtvgfQcrZmr2GgD2JZ6FpDk6npw
         91VmcCVwpNiePOiM7AMTga6yZS5RH4Wzn1bDJ2X6KPKYEyjJd1AHDWsfyyfE67+NP0fM
         fgOsj+BdCADOKWI/6HlDByiWUW/hgyNJJTv1pYnD1wfoQ25hNF1b2/lJ6BiKGDXHo8PL
         JtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        fh=rdLkRCjNveIivd0ep6jnrBTLNTq/NRjE7sqnSRMQEqw=;
        b=YrK7r+g9Hf1OIy+ra+/wLlLPa953pjCgvWUYyoArzfWQXph9hmmfOWo8DCUs5S674q
         xKlaw5JNj6ypZUbCVV4aNZVaqrrpDSzXhQW1CuP3f82q22oUgHCEttbwPHxDEQbK2u4U
         xzlOIIaRDHR/qqVUSjxoTq8NnggdqdAn3P6rSG/WvAgjkuY1rFF9c1LheHFdOTMUPieU
         wLsUpe4/iin8a00yx9OLgjt9kDsTKGCPH+GdvbTKHQEAqbSKDpP7n8jgEfmIxqGp3ErM
         oQ5YE83l3EdQd+1ckuzQ6KlBNelFdpR3LPmFRB1qL9RhtbmnIcO0mUyhax9Z1HvxmkXt
         qrAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254590; x=1794859390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=pauqGAB7iW8WqVFpP3B78xmoTnLrN6p5ndZ9lzti28u0fMNqiPAIZl7tQjR35aBPtR
         n754fi3Oz9sOzHIdpeuKGNI8LLC3kVK6pFWXDDzeZtVj7Uq+tnlRGCqj8wqNSVCBzFvz
         lpTjdMT6vg8DVIRGjEQKQvpIet2iMpJvuEBW4TIcG228V5M7x5ujdnKOf3QNAQIRwupp
         e4nuPDscdY4/35v1c2t02P/1p1/wXoLCL7+M52Ff4BnPgvfrEsQEcM5tyK/xPt3pYySK
         39Qz+9JgtfvdOfP7vE4PkPQdCZHhbXxm25uhzZ0Qq55lMrk7YZP7gMGLxoA2p4ucI7R3
         iLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254590; x=1794859390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR3beDR8KYIb6sJCWpDOl5ru/CgbY92xumEMG9nL/kk=;
        b=mIZDW0cJqs7+UURO0FtEOOkR+Xr350kBPGWWRY0Yr6rz168bkbvf+KG3Mz8Il1mtJ7
         KnXKR09xG+rVwwHBxOYG9mS0rZraeNgQ4SYd92yOUmWCDJHRlp+JwensZsB8NyBILRse
         NIHNRz0KoEoBotYZJzN+XOo47zuAZuqAjpq4oJl2AG6crXY/uANvDtL+aYiF2r0ygwQG
         wIhV9CzDfUMLEfhKgPTPtaDPQqfcn1llJqOdUulGRza4qXmrEjcuE4RedBxBwzfIyhc3
         VjO1j1i/Z2ig5Mxrr5uBnN34+75qs5ESXCJISE9WeImN/xg9yhEBKjzHZSGzqcavjghL
         mjNg==
X-Forwarded-Encrypted: i=1; AL+hErFVD346arqiGD6L+MhxxpAIF+ViNkvZ8wlp6XTKTsUKjSw4xsHelXo9k/8ANTuxU9tmFd8vXPO7RoLF0+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RXFgHbTmBcm6h0aoKpV0rcG4eWnFEtOMfvsh+6OuYg6li5qH7
	VBtotvlsz3H7HOZLugXbGxhQxlD4Ut4fURzaJ9auoQfWnXAqcUy1nkRwL685YRSrZpZefd7FUW/
	T0uLs18tCuHor/WzfDLQenM+kghAc3VE=
X-Gm-Gg: AYBFou2ZetUtQQPy+QAzrdV4bv84vs0gO67Ev0ux3d0NajcSJx1lS6uwXjTn5OlQcwO
	0OqSI7FzuHoae6LdfIk8scZ50Hrmf0qParMqQXB3Z0STIGMZmxHW0MDImZw7qckD7TjB7yvG8jJ
	AV47+qzx8CeVTH+vKtRGCSXK2qAPzHYNm0ocHYO8g5EvDAEII5JJ4WrOs8tfcLvYKTJANayu8C2
	+uNehyksDxPLQsHGnLA11fSihgtRyebcg+TYwLvdbOdzy3vm1Bs4+ALZzQZgcbrlUr09QAm17rj
	imKdWuEEE76CubJ8kCtpYnLTzPLbKaWF7tatwtpJKjp9g1LWVpcf88IFu523wdebQFK90DtQPjt
	iO6VopKikkeevCF2bE4C524UaBwo+oPOxm1+Yijcqh1eZ1v2nklXE/uc49w2xpOgwOXLBS3uud2
	Vw9bJ4zwNQXnoV1s5c+ELG/fqulTtzSQ==
X-Received: by 2002:a05:693c:6407:b0:36f:65b6:d137 with SMTP id
 5a478bee46e88-3751f45ff37mr398564eec.24.1794254589952; Mon, 09 Nov 2026
 12:03:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109184654.462128-1-robh@kernel.org>
In-Reply-To: <20261109184654.462128-1-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:02:58 +0200
X-Gm-Features: AclHuK8Ot5ZO4cc4X4se4NcLqN__nckTkG3zWRI4jvXOHVz-rvBOJ38JU8eIc74
Message-ID: <CAPVz0n0qTnbERGguriGSn3r+R1UnLAo2hFSenC7ZC1S7a7yF8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: max77620: Add gpio-hog nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:47=
 Rob Herring (Arm) <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Some Maxim max77620 users define gpio-hog nodes, so add support for them =
in
> the schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/maxim,max77620.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml b/=
Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> index ac063c2bab73..99014b792a74 100644
> --- a/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> +++ b/Documentation/devicetree/bindings/mfd/maxim,max77620.yaml
> @@ -165,6 +165,13 @@ properties:
>    regulators:
>      $ref: /schemas/regulator/maxim,max77620-regulator.yaml
>
> +patternProperties:
> +  "^(.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    required:
> +      - gpio-hog
> +
>  allOf:
>    - if:
>        properties:
> --
> 2.53.0
>

Thanks!

Acked-by: Svyatoslav Ryhel <clamor95@gmail.com>
