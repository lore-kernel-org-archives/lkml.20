Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794522828;
	b=BgYPLOgQxlvpY3MbtsdB7y+t3nYswQh6BVg1q7zKU8IMm2vwDEKkMG/j54vhiXN9jQCt
	 Px5EPjplx1x/QTj54wVuOkpsYibtqrd05+g07taLawam4vu20w1cxrI+2wKR+zZxVeZOZ
	 qmKS7g1gG0AApGcrk1dBtc/SdF9CpyWM0D92h6qVjtw/5outIM1hsTETp5EqJMSySWEux
	 UaY1e1OB2ge0aIm493uD4ME86GlNhp6uzekYKJwqVYl6HEOlr37UwDjwRhxXJlgqHgNYP
	 CRPwxzGiSEbgzPB6plTqvXvAq4Koa1UJ/DJio/ulTILj8Vg4dMh1fsb9wBICoYiceUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pNEn1GU6+1iildeKPZ1PBLMTIFpNYF0T6jPgUs9CnGI=;
	b=5IU0IL5xrtDiRaoZgRjUq4dTyvNEIWq3LmwaIFy/ord+L8fw2n4uWGpzILNnDGgF1f2e
	 fv6lgVTXK/2nJNhDQauNPJocTEJf6xhHPrjJIuEccfS24xSkAuLB/owyxVtGpM5CFm+QE
	 Bq26ir4qX2DAKPk8lXukWG+40G67lMzmPNVYujZT6Sr/MpmKKJojWRNOnHCzQULtttj2V
	 cc0CuNUKWq6jO/ZjZqdbobUh+OyjRdYMAdLSSIMyJGysfpfoBI33rK++TjxDNuHwBX/1M
	 XkxwEq7QB+tN+QcErcrmXbWvNa9cFSwcb4cSy3QRLWd0TcJGuExntvszWx9so/wlM2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlPaxm9e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D181606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlPaxm9e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0AF1F000C7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522828;
	bh=pNEn1GU6+1iildeKPZ1PBLMTIFpNYF0T6jPgUs9CnGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QlPaxm9enbHbJLh+jwcI9fl8/fsMqRLsVjWQWtwsq3p7LieVb0xHryu0HOIxAESjf
	 4/hQimQiRJgjPlh8IpWPDnDJ9Po1bqhd/Bloig5NipOh/g1toBzygP9C7nVKhKogJD
	 Y1Djmch/2FFhnrGF9dDrR5nyaCpOLUxwcKiOp7lJy/ae1XxQto9yl3uVkc/kctdQvT
	 kOEJqr1PnPne8zaqKIv6zsA6CMTCenkWiwWMxC1EU+ZPEdb3AfuFYxyd46sWAjqw1H
	 8J3w85iFkGhvwITIhLpQdau0uvvmG8H+QbimfU1ZKhG+OAbFOoOTwpM08T0J+w688K
	 WnSuDwlYa2KGg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3fd91337baso38306966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:33:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEEDM8yKFpUU9RLn2MKeAIOjs0A9pMyAu3wk47YsNocA5gQTdIWQ54jm7G2oPPiwvK5LX+trsE8kBbaaPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRQWTPMDVi3DcKXWI8sEbfX9X859RepwOvP12Ga3oKNjXunAD
	0wSXdCG8kvfDF/+wEaGIcCS4MYC4cxDXc+tlog2HPnG7KBCu1awxBD8yYIDZW1mMA1R79oAfsOh
	dtYaVHjdo1oq6zRWsBg/3eAwXZDx1p68=
X-Received: by 2002:a17:906:c14e:b0:c34:83c0:b92b with SMTP id
 a640c23a62f3a-c509631747amr46327666b.23.1794522827158; Thu, 12 Nov 2026
 14:33:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112194744.47047-1-mike.michalo@gmail.com> <20261112205551.1668102-1-icb@fastmail.org>
In-Reply-To: <20261112205551.1668102-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 13 Nov 2026 07:33:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9DFfHMje35Ttag9dQiDsQmCd6QrAwC6SHF57PeE_ysFA@mail.gmail.com>
X-Gm-Features: AclHuK-vxVe_X6RT1ZSqcHueQtLc9XnzLHj6z1KurZyaylGVLEQUXucTCRZVtvM
Message-ID: <CAKYAXd9DFfHMje35Ttag9dQiDsQmCd6QrAwC6SHF57PeE_ysFA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: sign the last response of a compound that ends early
To: Ian Bridges <icb@fastmail.org>
Cc: mike.michalo@gmail.com, senozhatsky@chromium.org, tom@talpey.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 5:56=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> I tested this with the ksmbd code from ksmbd-for-next. I sent a signed
> compound of two ECHOs whose second NextCommand covers only that
> command, so the compound ends early. Before the patch, the first
> response carried a signature that did not verify and the second was
> not signed. With the patch, both responses are signed and verify. A
> normal signed compound gives the same result as before, and the
> connection keeps working in both cases. smbtorture gives the same
> results as without the patch, and KASAN reports nothing.
>
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
