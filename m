Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362876;
	b=U918GxIecuLHM65mvDuv6lii/cBMP0B7PPq6T63FppMX+jOG/7zye1Dyzb6JaZ1d4mXP
	 smvaaVZ8sleEKrRoUj3VBJT6dvoLeBGV6s0PABcSdxGiItPNNaR9OjQBtKPtvx3Nhdm4H
	 2firlVzuUqbYbTpJBLfJviYQLEfv1UEQZD/zU7Rp4inpq3ODV327bKiMXQIDwJTXh5Qpu
	 Awv9Z4sp1uAxyvllMc6/9+IIBwNA1rq6t7R0Nmd8rXtc5qXX4D8IONZvJ9OPoxGCZDAoe
	 Qgl9E6t1pblxTda+jdajh00lZSDgrzTWSUDJW8C9thT828aw39ApJfneXkUfbnDg1TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362876;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bs+aVi1+6hDy1HNy6v6dzYMiqPyVoyHt4w4ufaPFezs=;
	b=kar1TWOjbsuieBdaRiugo+stPiMAv/Ra7+4DvJ75dozq7lEQ8APVg3umFvnHvarts172
	 nGASKBDdS8bvfioeAhlS2BnLFmHeUL0fboZLa2MuNpGhmx1VyfDZVU+FRrUerhdhAbhvA
	 N2cnRhNVZtCNXJh7dyJRNHmGlRsM2+U46E8tC5KarUOyP7CP/0+2Bv1gRAIz5R5JrOhP4
	 SUIIDDO8I9JYrA8LSNvtmyVaa5+NhBmU2771Ne8abZIqzI8hy2g4rs/E5DWxXiAd0zL6p
	 y+vRESG/AAm2/IWoYL/ZACRM8ZnZua2u+b7IVwhks3PR0FvgAgR+PhXuh3ohiuW15fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShtsgSig;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06598606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShtsgSig
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E211F00A00
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794362875;
	bh=bs+aVi1+6hDy1HNy6v6dzYMiqPyVoyHt4w4ufaPFezs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ShtsgSigYIYS02Dgo3ulYttIR6NWLDZHXsS+qvuEfybQsNYFpMApFz42nPGouZlP+
	 pjIHBRIBjBgcAKZpeqgyvk2XANMh2uei0s7EbTlBt5GZaoprhHHvMpuhhJW7xW2wpQ
	 B1+AP8fzjmifGmgoTWoG56L25HdHLlw6PKCs57hPQOVxx08zgpjtBx+oxFKjlPIPem
	 d5md7EN2vVJKGaZyYwr2bR7wgfb6yqOdKBr0VPoz7vfbWTc9hukUT8Tc8XjSvSMi9U
	 DOt5i1Eoqid5UDTlPGd//SwVBMLr5wxW/8KUC23jzT/ghYgy2LEqDh+pHcle+9xuYe
	 CgbFYE1dzYerg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5913539a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzFysuQO+Abwf6YeohDTWQzIGOCcgvdmbIVQNr86StnR2fhhHs8F9cp/GicIqxgJvHxOPvsd4gSo6rGPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VPKcO+mBNwHhE1BsBmtwvo/7KWza4/6NBnC8t1wGoOPNUSfzE
	QKAtEI78wkxS7w1af9P1AgoMjXVmYEFA/EOhH9kqXZ+dkayqvuJ/Bw90jlniUBsSncLHTAT1ERy
	8ixuaRrAK5kdA5cNA6Kybq6NzSw00jbE=
X-Received: by 2002:a17:907:728f:b0:c50:5e10:71aa with SMTP id
 a640c23a62f3a-c5066afced2mr70360266b.14.1794362874533; Tue, 10 Nov 2026
 18:07:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109142429.1741882-1-wahidzk0091@gmail.com> <20261109173229.1921147-1-wahidzk0091@gmail.com>
In-Reply-To: <20261109173229.1921147-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 11 Nov 2026 11:07:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
X-Gm-Features: AclHuK8X-dE1jij8Odw14OGuXlOkUvdVf6LdzFcz6clCkOfLe7qi0UBLqneoZto
Message-ID: <CAKYAXd-n+zGBq4i7rfLyX+_Y6zEMLTCCqb2vAgcnmavqKxtiHA@mail.gmail.com>
Subject: Re: [PATCH v8] ntfs: convert a named $DATA stream safely when making
 room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: hyc.lee@gmail.com, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -4895,8 +4922,19 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
>         /* There is not enough space in the mft record to perform the resize. */
>
>         /* Make the attribute non-resident if possible. */
> -       err = ntfs_attr_make_non_resident(attr_ni,
> -                       le32_to_cpu(ctx->attr->data.resident.value_length));
> +       err = __ntfs_attr_make_non_resident(attr_ni,
> +                       le32_to_cpu(ctx->attr->data.resident.value_length), true);
> +       /*
> +        * A reader holding folio 0 waits for mrec_lock, which we hold. Do not
> +        * wait for it and do not look for room elsewhere either: the reader
> +        * keeps the folio until we drop the lock, so the attribute can neither
> +        * be converted nor written without waiting for it, and the loop below
> +        * would only convert other attributes for nothing.
> +        */
> +       if (err == -EAGAIN) {
> +               err = -ENOSPC;
Please explain why -EAGAIN should be changed to -ENOSPC.
Thanks.
> +               goto put_err_out;
> +       }
