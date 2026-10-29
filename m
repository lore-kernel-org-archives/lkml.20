Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313037;
	b=qkdkdGGaP/JXbi1jZqyMXlC1bAtKBCe09WvHLViQy3iCY4PDHq+oALedTHNxboptJs3K
	 oUuKmtgpodoZLmW38u/G5hYFoKLYwdXAYsjvx5l/Ys9FPeufcKl4OcFqEpwujkkney6Yx
	 hNfi2miwPawykCG/UnL0E4+TR3NXbGO2tYyQBzpo1jJm0naXVzbb3zwptrb7ZF8vePwJN
	 duJdecH3tcsp9neZ71X0iCRJAcEqtARL3z6r7bP0zfGVBrx+/ru8rVMwtpXaPbZWdlQd6
	 bEau8dRGUkwsyDoaWY9X7G0DqKeyptzSm8JGqsiMPN8rfvS0szdPKXXBtiBsIWkH1Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
	b=be23xnF2xnOZyaD41SfRpI+YhUUPWdtgGUmJU0mHJGwbK6dp2Ot8wBejgxkiX84IZl15
	 7uLAZHPXXP9hsIfFwhye3WGfhygrAEfxnozU+ibDhykTCp0YcYbkqU2gHtdLIsruCLvIf
	 kww581IS2aBcnQHmJ4oqSU+KJBussXsKROqINRGgZowQ3xh0HeHeLfP39zyIBx9iyZWia
	 EaNZTq+oibGww5+KCqNHkdnnk03JrlBPPjtlJvMnouUVRm4YnECI3NiN26hKpOn3xdi30
	 OlBIuXu1ewtU50Oyx0TTf5tVNkLD6GzxTm/uQ3ACNaDAQovrRtQFOIFFAMk14/LoGXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7pPrL8E;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B581606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B581606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7pPrL8E
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so194838c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313036; x=1793917836; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
        b=L7pPrL8EEFgeiEVXzTHbv9xSTZF45Y8UW+YkiZZZb5AzKUBfVQ9wXFtpSo14fUsVGY
         ZRJJXpYxJa2SrVd4LH5AlZaA7iSE6+C0UmUABUX4BfMgZtbLHSlud9ElnKwkKt3mC6ez
         q04hvGP46yVhEcQfXFbc8jepoQQNenhjPhvFXmTXHxVQ6ZRsNsNFjL31a9752fnsx5Xs
         x6RE61zO++ScNkkyZZBelSEeHLGHiBMnYlRN4aOd2MQcoLZ9ans3r2NieV/MYbB/S2vt
         XeTprG7GWae92hFwSuyx1LiAbOj7Old7zMVXOiRvqt25+ZgI3GoWracTpd78j5PkNTmS
         Vm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313036; x=1793917836;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=raAFDgbKNrzXejiq1hnLYOYiZSgol4DkfmEbVso6mO4=;
        b=I8dcGIT2UmQlnsd7sGbIq7GJSPnoCZBq7fmJogA5KAQvuyBQBOWVzAYdLepKOBVacg
         hb557ZjZ4DQ70PEsjGrzA8Xaz7iLOmQZ/7O9BEwhM2CUVLpEwkOF675ue1HFEJygpcss
         3dLGfwfNO1PQE4Cut0G3J428q2WQWjjtz/eQxwIChRo6ykKK9BE56xy1v16t+PT+2BHe
         /PQCWbpuszP6Uwvd7n6GG4Zcy5aSo+kO3MHdrBOmn9fgJCYtUYtOmDtoUbfOqtkEIX+1
         S73sGd7Zt0D1mF+xIOspx6iYnVmrYzLSzhcg4F843LOybNQHu3kq9KrmT7WHblZfxULG
         BqAw==
X-Forwarded-Encrypted: i=1; AKwUvByecsbnFWNfo7D7lR/Sf58yA5S4INr7abtx5PjquBJ5AHRN8AnQZ46dSRz7eC8+NotZXt6j1G9NtGHV0nY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrYfwZjot0egOShpWkNRPG/mGOTibkij2paRBmVZWsPJFyRb/V
	vUIKMmtyWZY5lgNl25AbvFnuvHKAammBTNLVFSu2ieWhpniQ/+4ckAqd
X-Gm-Gg: AYBFou3kHBUWcRab3XgCPUN+7QVd9Rts+HJ1NS3Q0wqCvvgfwtSLGWxQoWJLbcg8aQ3
	7G4estR4rZAbAQzSMYsvzZYhNDr3VC0HSjHbM1aG3ncLJPedmGRUhfRAi2khlegbJ8FuC9Baczi
	EX5Sjy1EGQGv2mfFbt1GkbccWezWlQYSnbjfRCCfi/0o/fKjV+KHShCYEGZFNc8c3OGB7qK0lPi
	Zd7UnjVjWP8dTIKRCRxBvc8O7YHSVANQWM7GjvNacZyWl5lvyEklle8XRgJqv5FM24A6eapTUFq
	uWTioLjXzZu8fYBjXdNW00uF+XON+Nd0NKh5sclB2U510AajAx1ZJ9FhMgYICZeADDCU/THkYBr
	D3Sz8aASHyg5qofwDYFLF2rdAnRBBB3r09jpi+m5Mp6vPmNVPF0VhA6LzoSviPKzBBnRLFmf5TG
	o3vnq1DiGx9DHo+oI1jnhMw9QXwjSPys8tIAxPtVLe9kh+V7a5iDjvxtsHydRJhHSXPuKYQzDqh
	amhm0XHgtAjRnIOYRhK/WCMcI0Rm0CcMXSSLrVU2p8cmfpIAyVWTPnZk2wl9iqmJsGc9LE8/g71
	XQyJVvDsg9QzAeRCDcmopPL8s24PRH607KpsKWGhrgENjKnVV847LiYC8aJVLKxOj5qhszQCcVl
	gs0kjZe3JryU=
X-Received: by 2002:a05:7022:5f02:b0:166:862b:9bcc with SMTP id a92af1059eb24-1ac5ac4caecmr596289c88.18.1793313036057;
        Thu, 29 Oct 2026 15:30:36 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cb2e:96f2:5ce4:2074? ([2620:10d:c090:500::4:5b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm1459038c88.14.2026.10.29.15.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:30:35 -0700 (PDT)
Message-ID: <9720ed1ff19dea17a1b379c02d7dd52ae886d807.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 01/12] bpf: Keep the 32-bit range across a
 sign extension that cannot change it
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 29 Oct 2026 15:30:30 -0700
In-Reply-To: <20261020161907.2115379-2-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-2-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:18 -0700, Vineet Gupta wrote:

...

> @@ -6192,6 +6193,27 @@ static void coerce_subreg_to_size_sx(struct bpf_re=
g_state *reg, int size)
>  	if (reg_umax(reg) < (1ULL << (num_bits - 1)))
>  		return;
> =20
> +	if (size =3D=3D 1) {
> +		field_smin =3D S8_MIN;
> +		field_smax =3D S8_MAX;
> +	} else {
> +		/* size =3D=3D 2 */
> +		field_smin =3D S16_MIN;
> +		field_smax =3D S16_MAX;
> +	}
> +
> +	/*
> +	 * The range already fits the field, so (sN)v =3D=3D v for every value =
the
> +	 * register can hold and the sign extension changes nothing. The test
> +	 * above misses this once the range straddles zero: it only looks at
> +	 * reg_umax(), which a negative smin makes huge.

The `if (reg_umax(reg) < (1ULL << (num_bits - 1))) return` check is no
longer necessary, the new check below subsumes it.
Please drop it, otherwise commit lgtm.

> +	 * This has to precede reg_step_reset() below: the extension is a noop,
> +	 * so the base/step line still holds and there is nothing to discard.
> +	 */
> +	if (reg_s32_min(reg) >=3D field_smin && reg_s32_max(reg) <=3D field_sma=
x)
> +		return;
> +
>  	/* See comment at reg_step_check_unsigned(). */
>  	reg_step_reset(reg);
> =20
