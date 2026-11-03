Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734329;
	b=YH0lfmaXp6pVc0sax+TLndl3sQ3+yQjfOfc09S0DSiVGZmsTfLAQ/OhtoAjKwkcVEHvx
	 oYZEO0Y+XwzCMyeZ8erscT5+j46X6JYxPG6rHTPBiudIEHEBoXRRKL4m8L2CfKEdZVUAd
	 QFktss5wP8U+Hx5VNS7I3xrWqkxlr1Ft4mO5kQwBEpj16+xIEMt39rcajn8rNgdWZatgy
	 T0VXkBo+XAsvmV4zxhD1FSyS4P86I4lkpSMsMP7CwcIR+sQgfoBzAO3MhBKykqvYjzVcZ
	 GVajlDS+ITKF8rq52IPxDMa2EjG8S7g6NmK9W1jWVF1MDjA3vhYC9WRlHDUN3d8EHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/eFZ903JDMQF4LwplGCwsYJNc74gwJQIrdxnW1b6B2E=;
	b=TY18EX+oPU0EZYQMyxO7ZitUML5JmjumceNir3+WTHFszMwS8x19IFBq6SufoGhDemeV
	 52+QaJoK3O91IOogOngI+xp8dheGlg2zRN+SkIztkCyjQPRLcW2gJBH41iwjQCREGysKp
	 cO+BKaXDh9edm/U7XUlY7nZYo7jU8heGxNMa6RxiWYzy6gYvB+8qWTEdoYDPigUhzYPSy
	 zo64p+T7qwtZCU21feGajuGAkg/5eskHl1Pea6PXzFWqINGkQU4/tH/DZaB4crGgU+iwk
	 GjOsmpYGiFtacG0d0fVxlBJmr3tMFgz67KmbFHDbl0PT28JyyTnomTkR3k90snllU4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HsnC7Dv6;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E2606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0E2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HsnC7Dv6
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cb6dc850c7so1155871137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793734328; x=1794339128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/eFZ903JDMQF4LwplGCwsYJNc74gwJQIrdxnW1b6B2E=;
        b=HsnC7Dv6rc4w9ws+TKm/m377rphZnE+oAeNZKkKElT68JV3uonPNOFCKzS0ifQO/4R
         ex0bUYk1bypeBnm6fm8UoNkA2q53BMCMbzR54FfUOkUYN67C3hsDkCxLtScWEkTM54Fr
         osOe7lwPraqa1uxF0uHVGuIWujBP88g4szt/iq/3+V0F/QxF7wT6kjvgGfB301zqnO4S
         kaGa9zDZS0HXdnXus/i+F3/RZv+jSoSTw+GOi6wbTqxH5M5N5kI9HpqQeY16T7a6um4+
         44UtyHiRj9rUmhKFMrK1ZbVb985toyZfusSYnxXM/oVSp5z/m9qWHLKWgpfEVP8HV621
         //Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734328; x=1794339128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eFZ903JDMQF4LwplGCwsYJNc74gwJQIrdxnW1b6B2E=;
        b=ub88BalB1xqT1KvuglKNKRSjUUP5UqszGWwtJRbtO45LtEm/VlPjx3y0y5v4oR++O0
         3beovq767Bltf0zB8PxUParTKLgHPsI4VjeeGFAxY2FQtIgdgyfV5OBtEzTvyVHqRxTg
         JUCgPWNJVco4LO+LthUD7NEazVbP1blqgPR2XIkg0C+x8y31moiTuPYUwNqLWc1bgqjF
         +S41wewiGaKQ8IhbZQLz8FAC8iJ4qrnWbWHmB6/YoSWlXsm9CH/2REFk80GU2MMlFPFu
         4JAaC1YLaTLUQ3np1mkneBmHpCvmj2327qTm45ETBYjcN+vXxjC1v7EfaU/A2jJEUi3N
         6mWA==
X-Forwarded-Encrypted: i=1; AKwUvByOYIJ1Eacy7euP46GFqv4SbUCpdOiwp0hcvhFyvvG6KHeMaGi5FL37qgv7t+fY6GcESrABQsAMxUa5/aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lYe54rj/Lv0FjAjvX23RrKXlhmwyfYy209+/pmt5RnMruKwtS
	FlSIqgDl3O0BKDNs2BJVQnCDCitsgqTIyQUrmZprlQ7PG1hMqL/eDI/mkfY9Ra/Apng=
X-Gm-Gg: AYBFou2JLzezjTZ7adMaA4O82PmPGJJMzsr266oqRHKbXShVh+6BlUSoF2+HYLjtSOt
	KD4M9jFWZCm9W8JMizS92+kN0BwOkfOL9ZATz5Dobwocc78iI9TE1rMwqrPAd2J5iP330pvj4Em
	qFdBZFdzuKigBJDBbS+ptYDbuPZEXaK5tGVU6ffI7JRKOywYzjKrSfQicBruqi+djEr1YA6wuFy
	zdPdvlLT2C2F9pxKY5QSg54byB8axgfrVcHO4O2AfszCC2x8pbPdA2xg7Pr6wYjXWxxj9bccNcV
	dQCCxcpz8AL38fZb1fLgNHyjSiiTVEToV0SB5EuCxecWaQ7pGPuxNA3bQUDWk5K+bcRrUPnvlXP
	H4W0sXSZTiIXE6dwrpzc6SjhF2EUwUTay0B3pb1Bar9uCwAs+CmUSDcN/WNYj6HjVQE1G2N7eHA
	XiBF0Yt4oXgtEDfEusx4b6ghdLX5PAm3YM5epuqJojj8kU2e0v0mk020ZMstUfsq0Zee1iM5k64
	WBYeRaRyvbXuflNWhen2dJhjnD84zI3uaUsT0XMpxh2jrkW3h2OxM/cz0IWbY7v3FFTvlrUquAc
	5KtjS21ZKoZGQxllW6glnJHq9INbZfKLsWHx8ejlJYHYxeJn/CBNwTcHgZePEZQpEBiix2LKztM
	2RjlD1ykxTPMbozlzDzbZVbiApnpf8ZM=
X-Received: by 2002:a05:6102:50a1:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d07269b10cmr5503016137.34.1793734327741;
        Tue, 03 Nov 2026 11:32:07 -0800 (PST)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fdaf4efsm33576137.5.2026.11.03.11.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:32:07 -0800 (PST)
Date: Tue, 3 Nov 2026 14:32:06 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] liveupdate: check for duplicate session before growing
 block set
Message-ID: <auo2qqZIbElECcw0@google.com>
References: <20261103153928.716753-1-christian.aurichzm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103153928.716753-1-christian.aurichzm@gmail.com>

On 11-03 12:39, Christian Aurich Zanettini Martins wrote:
> luo_session_insert() grows the outgoing block set before checking for a
> duplicate session name. On -EEXIST the new block stays in the set.
> 
> If the session count is an exact multiple of the per-block capacity (51
> with 4K pages), that block stays empty. It is serialized with count 0,
> which kho_block_set_restore() rejects in the next kernel:
> 
>   luo: Block contains invalid entry count: 0
>   Kernel panic - not syncing: The incoming tree failed to initialize properly [-EINVAL], disabling live update
> 
> Check for the duplicate before growing the block set, as
> luo_preserve_file() does with the token.
> 
> Fixes: 2a441a14c2c0 ("liveupdate: Remove limit on the number of sessions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
> ---
> 
> Notes:
>     Tested in QEMU: create N sessions, retry "sess-0" to get -EEXIST, then
>     kexec and retrieve them. Unpatched, the second kernel panics for N=51
>     and N=102; patched, N=1, 51, 52, 102 and 153 all come back.
> 
>     Based on v7.4-rc1.
> 
>  kernel/liveupdate/luo_session.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index f48e9a4185f9..74bc66929f4b 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -176,16 +176,6 @@ static int luo_session_insert(struct luo_session_header *sh,
>  
>  	guard(rwsem_write)(&sh->rwsem);
>  
> -	/*
> -	 * For outgoing we should make sure there is room in serialization array
> -	 * for new session.
> -	 */
> -	if (sh == &luo_session_global.outgoing) {
> -		err = kho_block_set_grow(&sh->block_set, sh->count + 1);
> -		if (err)
> -			return err;
> -	}
> -
>  	/*
>  	 * For small number of sessions this loop won't hurt performance
>  	 * but if we ever start using a lot of sessions, this might
> @@ -196,6 +186,17 @@ static int luo_session_insert(struct luo_session_header *sh,
>  		if (!strncmp(it->name, session->name, sizeof(it->name)))
>  			return -EEXIST;
>  	}
> +
> +	/*
> +	 * For outgoing we should make sure there is room in serialization array
> +	 * for new session.
> +	 */
> +	if (sh == &luo_session_global.outgoing) {
> +		err = kho_block_set_grow(&sh->block_set, sh->count + 1);
> +		if (err)
> +			return err;
> +	}
> +

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 
