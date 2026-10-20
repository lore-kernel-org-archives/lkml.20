Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792519477;
	b=WkrpAms2U+5tE07K8SujwuV1ibsDKP9WzDScUz2i+GF2iXeqJDkVPcFhQjqkB/QIZGRo
	 AQBijI3NtwaE0CkdKUXq9IkNGalPgMeFq94LdebDvsvsoTXw374yh8kDHbx06n4lsMvzM
	 HOW4OXTd8I29ELD9CQVTWF5pNl1p4EEiCkJ/l8yUIECF+cbxXuhKQsC5kvUzW8zu1Dtay
	 1ZiwayPilykzPRNhhcnNP6LxXXjbgRmafvTYrRG4/a3399j/Ws0FgOcezUlkVHANTvgMM
	 hAB+fLh6w/6CFfa/PDOAVJfzIZczCRl32iufazHcxObh2+1IcGY5MtqYy8nlDnqh9XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
	b=EUAECv83U3nDJBIXKUTymy5AWd+xmi18/PzsQWvejUuoOareOqibClOqKmlXf/sADtcG
	 bCANgwtD9K3AeQff1SGUNXHC6sku+8MTAfgT1/R+fa0ULeeZgwYX5q8tC3QO/Dz/KWHC9
	 6M4z/ps+yGe+glY+SFjss4Joa0zv7l3P3SiLt8SBaO8h5UdBHU5PkyKtownSYv1blaBuB
	 KklXGwzMOQcu+gbo3kdTyxRCee1dW3HI1WglN7MAc/cUFkLQ3ZoxQiJzZgAgt9fnxcmCK
	 aJ+4RY9AGfGRM6QrZMR3zAHv/iEp/k9sWzh9GPudfQtusJK3PHJnsIIB1upek+666Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej6hAinx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A253F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ej6hAinx
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34c522572bfso370192eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792519476; cv=none;
        d=google.com; s=arc-20260327;
        b=OWROz5iteBMeDQT4iMTAJHCR8bWwfTLvrFQQuhhUDPEs1d67CZtrGdWT7qr8nCffVF
         y+fYoRe8GQjisKe+qiO0Y4ip8ZSi4ZtHqmWr/eP0+myhlHgbFwpHqePG6tG3Eqkwu+Vt
         17N9mZRhxeR3yANZHX0d4BkV9R5oTvxvRcbuXmeSMUDuAt9wBZopCAIEAiYOvGzFFY1m
         Sf/2JWhNj5XZyEFASC641/8XENjDnwjLB/bcBNmp6ZXawx+sYYKBrGn0wNhc/GeQ2FOR
         IqzcOQy7QiFVOeJu4qcrLOfw5y1MDsColv+ngF7IFRJ+X3YiBRmt4JnYdTmcM7ycCu70
         fAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        fh=3/XsBnysr7gfEEIQYbDCLDgFzOq3+i9RitmcA4wzA+g=;
        b=Z0Fkxvi6usRxCtYaw4lIB2T3cgXGxirECllo7n168Nx+Tw0Km4JYUvCSAJQFyL6oxl
         yBrKZ15E2HNYFzOsnYsB8EFNtDvQy2XwmmxL6h/QqHzRkirdFd6uYCdkXSvSD5Kj4fg8
         Q9AJSjIeEn9fExp9v6eXqPIjqjWrwSkhdgxeKyOsyXb8qVWsokJR3PNsRlp3jrJ7MlnA
         xX7x3JE+7CqptV5zaJ22oAgOtpB6wh/R/8qxlOb+F3GO9dnq17AEb8zgpJ+ci7WqFLd7
         pnToJm1CyU3eatKgDbG4VHeY0NvE6miGvxS04w1x9ytfmmjofbeQBromZLDMm4oi5RRF
         hY4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519476; x=1793124276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        b=ej6hAinxfCnGBlLhraj2kIFUbg+MSlyvMke4duznBwZ8W3fpjYEJ0At6qpWQ8ewsqk
         A2dwgfA0/V3EHRo3fMyb/1P3bgRcM0LAW8+xN+iur2L1w1zKzRVwg1omL36fgqWHyCzN
         gRsR5Z6rHqJ6yD6sKbT5h1CrbnhFgRT+49DAEu3w293A03roUXbrgx2WLUgH4P68Gwva
         wpHC+VzjuZSxb/y6EmH97P4QrKvN3/65uLDN5In4sJJUbE6mwpk2FPibr95/Z6jLKYmw
         RVxvRNZuUbPnabwaazLy2ZFqlyDIGzAtu/Glms5k09dFLMtkKFGFjjEuTQGoE8dgzE5v
         fbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519476; x=1793124276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkOSxYOcLHPXGNYa7jA4h5BWgn2pB/uT8aTkA+ryHZw=;
        b=qNuP/WeSJl61mJNJP3rW01ybkJIwPYKnXqRADYPa/K4FXeHfkudSsx6QUMzlwpCd5K
         A4zXN0D7HTiCL8VdfK9roeNMjAa6e5oWHgfGP9DYO8TfI35v2nyp9CKLAThlwRVWKmAx
         AqNfXQ7yaA8LdDpL8+mPtsyNIGWWX77NTTAlR+DccMNi725G8z91Pc3TrAP5ZVqqjxPu
         6o1AmoImWzm7/g9hoswiJNIY2Rj05dvdZCVmpclHCU96uTFDXgUbqjMTuOwcN7aPZruu
         1THO6nmw8w+Ma3S/UI/PH8FrNVzMYObhOuU9Mw/mVFVsqWcn0g2a7MmxlNyYtiqxymJA
         pcmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvGe9988msbO8TK8Y/TRfcB+4nJna4/rPL9s6+c2Ep5dCKLYgJPr9eogOkJkwGQT4DHnPZtYcm9w2hVjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTqGlnfJl5aqSjm5ZQX7yYqXGt0fJhQR2VXTNhm9HM9e+K/5R0
	mo1jQ+JOrOpRcko04qANBnDA+wfVhEneEOVjc0+xS47mrXvPkp6CaibXsvpWP5bPwC5LaJcpuqr
	wcHBRJTzfuYq4T66ROHArdG+wn+8LD7k=
X-Gm-Gg: AYBFou1zwNV2JxGD/zF6o7iqkr1z8OIw5+5GC918pw0T2wck6sQIYy5aTlDo7GDN/gI
	f37965XiN8U+UoXsPBX9R98+M4eXTgnZu1jxuGU72eJ/m51KPRRPRZeUQ7f0chrg1rnDZYP36o4
	bQWuFI+45GUGcp8Ov3YSaex51L57Q/iL8+wCTQZj2dwzpK+VfvyBDf1MQbiNmanvw/3KPi1wNmO
	K7scGKFdT/M7eo0cihCBSQ96mDgU4U6CV4Y8NRUyQunlkKG6pGThUuV4VAlWMng1iLOcxtBqYjS
	KkeSpL7SO1tsLv7cJyNzVuIvpWGeYDTUsdjukDSfhH3qkYGbWpcWuw397blvpJ63CVX04gV6Lnd
	LDTa+ghxQzdKpQfK6cnJogn79AX2C+7eWD5FmLj0rVCr1UujmXO/8+A3s16ZW39JcgjQPYWUwcn
	6X3QGxCChMyBsJzX1TL9tSFraHyDQewf43LZnZ4cyH6QifMj+0uq4=
X-Received: by 2002:a05:693c:638e:20b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3674db5603dmr18223eec.2.1792519475702; Tue, 20 Oct 2026
 11:04:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdeNvRKFuQd2qHz@sirena.co.uk>
In-Reply-To: <atdeNvRKFuQd2qHz@sirena.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 20:04:21 +0200
X-Gm-Features: AclHuK8uicpeOQVDa7YyBrby-50eUveLy_yF6eUllgv4q-wP0heOlGOe9JdcgNk
Message-ID: <CANiq72nsZ3u8XfFGRL5nN9jvsMekrB-Rziy-N-XxKg7KAcap3g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the rust tree
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Today's linux-next merge of the char-misc tree got a conflict in:
>
>   drivers/android/binder/thread.rs
>
> between commit:
>
>   a12f22b2c9398 ("rust_binder: use pr_*_ratelimited! for printing")
>
> from the rust tree and commit:
>
>   985955d8e6b2b ("rust_binder: wake epoll on self-work queued to poll thr=
ead")
>
> from the char-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks fine, thanks!

Cheers,
Miguel
