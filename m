Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794167971;
	b=mUqfaPuQXYrFJf9Z1CT9x9y0l3g106VdF5I1J91CBBjyNwsnjg5alou4ikdna65bM1PK
	 AuBl31fRiuttxE+4yompS8L7uY63uAnYulxfFpmZqKPuUKhvlkqqwyoXvVUj5z1xJYyGq
	 xa3UgC6Sa8diseGpVwgbcrtFr5zzF977Ie5Kh3RkOG1AXCvCdICc3T5K3LNY+PW5Yeafg
	 VMK2rRI2hrSwiG9QMVDqHtQyMzOFgIZ0oAfSvOrLZakJI+Fu0jZ0Ux/wCZ1aAWc/xHcdm
	 MV1feko3Eu79IvVdedUECVajGokonFhQa34sbZzhuGajN4EGcmAe8WQGYSHNlxgGAXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
	b=iKJlCn1zaZhkn5/HCPzfLtAGKF+r7kJBzNnQmpODo2vHWpjXfYql9nErhXudohIYTsIe
	 q6nlMlHBR5gG0s1SWWZDAY9tlZkaVcLiJMXGh4iqMXa5nga8xwkXyaGkFnPPkvaSEV141
	 O2CzF/YTnXw//KAP1xyliO0hJFj1tpZRcQVTjwv4K6liwfrmj6UZ16tHo/d6rlM0hAr7v
	 nZY2wAv6N/MjhQ2KwlZaPO+c3d9mhgktle8uydPtQR20BbzusuF8jNUFtJTCf/Se7eglx
	 SBq9kKR/s5pnzXTvET5fZbRt1bdxS7ZsuNaen1UEJVhBx7VHnb7bsbKHu4ybC/yTRpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D3A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bb5afa736so22966eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794167970; cv=none;
        d=google.com; s=arc-20260327;
        b=PU/Fq2qVyFqbVbpHQquutxFGcYOO8cUCX+oThulHFSLnncX0cnIvuzKwBJwxjlyDik
         pX4/+XeP8LN+7On+5MWZGTH05tBEBmBZ7Ol19JHjIMein/N110oU08Ezd9wNL2MECJSq
         xZl0JkhNCzvkx/DQ9aZuqW9b5QthiQwRjGItbBj6IkMB6di0l3w0WBcrx1BUyJj6ctTt
         cvpuKk23k2bx0Y3QyioKZKspZVmYlN138PE3/hXwCjgiJ9wkoxGzX9Wyg8jO967H1qVU
         ZGxwgkSmY5L7HmOEGfEu1BiVgKdq2ck5OGnjJ/YCUxkzldwQzsbHG/PshurtrkGOWapF
         E43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        fh=6+SYO4U5Y2n8IeSMOHl4MbmazgZVb4JDGrDGO/dA748=;
        b=LawnWDApITOaQxLuyGINZh1Tpt4EuIp5AVkXeMQnKxUAkqUavZsLJfsN7JamdXO0Tp
         eBuKupr5jtueoSUW6xIMWKgymPDA34d2cWEKUEHI74XQlHrMsZmKWd0W5IA6w6uHxowF
         mJU4ibSBnvdDXE4R1/OZupvCvKbl4Xb0DXf3NkwhBzc6UtA0M0DOaWvQApYNXz0miC8R
         +m+tRgfy6QZdPDz8mb1qvnigsbljaJsFocawPOhzRQgcjSuaP3GodWOWe6X/tmPeR6ZL
         NVP+dkTqeD5KTNcCcNIkB6aM0D/tlqMRnLA0KsKa7Gg+eyMNwpQNfmKGWzDvRxQ69Pit
         yBZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794167970; x=1794772770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=MHU9Z+w9qtdjHnQktt3JQr8/UeWV072k1RPmYbRJRMs889bomwOl8dJxgVXlbfP/nc
         pCsfloYtrk1Kpfju5tKaC3PkKbAqtnSS7A1yjrADrdRkoG1x/h8wLQGMyNELJ6hQUvPz
         IuVjLBdZjlHkTadxck1FYnqucF3+wO8nLJzyPdvJJ//wP7b/K6Yr+3w5V8mhkSdne1GN
         1NIM6l7Kt+pq5n2UyPY8SWwIYK5CU78kzR93oSeptbvhyOhdqJ0/SM2fW6ObFqOZbTUl
         Qd+W3QFW9p9VrUCKviV32t9I0dI6Qpzu6Uvav1PowSd/RU0rI7lra/eoDnLYqXWHYivi
         wSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167970; x=1794772770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=a9zZBqd/I2iLD654CijOjyRI8YuPtFlB3iWA/yHKP0q1reC7eY6lrPRbvqVn1qBVtT
         KCDxaORuHPMPP+zvRPkEiA8IYQzu63INfeDE3KE76KGUSq7Hv/nJlv9UM1+XZ7zA+dIn
         DYTwhqx44gOZa0+xjbKTsVFfs3Ilcb8t7fHwtLIAs1PrVoCSDKjR2L0/6eyVl8kdkHSR
         iNRSIbxLWCF42hMjHxreZ/7sqQB5NhDxIvLcXQES0ZNGBTn+4jVsHExc3/Mg6c6t3n2B
         k749HuHPe2wkTusVYzM7wCiK2VSBy0ZOctxm710ZnzEyV97Kjim45Ok5nIv8dcDUX9iC
         0nWQ==
X-Forwarded-Encrypted: i=1; AL+hErGWGp6WqvsPVasjbIwu4gYPNzdM5/x17ox+r9RO9AD5p8X5/sTRhQB3tyXbrxUtvNskqJnG8oZW/GRGtkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z93kpW1YvzN/+6CuzggcuC6nIJC8To91277V3aSBOfyu9gkn4HA
	mW032+TuhSyh7inW5dJrfYuHFDvKP/MFleOE/IOJYzjX6fNkluXcAe5GjbLCc/6EbX7z0PTOiBa
	t6Cbi+i4TwQITzsiIxW0c7J+p+qgVdcE=
X-Gm-Gg: AYBFou1O2hz7AjQRpIZTBPQiAMEn2m9Bt3sdePYh92/OOYJXwqa47e0L+ZmwhhLnCCP
	sTtnUT9vZR5++oSBdtoZAfXoypfFdeSlJqRkyGu0Sn0gDx8zbIU5YkhbL+K0o7uv1/eFWhYjDRg
	PC+vJbrgkJusysPX0j0SU1wosxb7G7JqsjyWRSSmn8/OzNm8EXzmvWBDyEViyYlgXVsQ7tXx7TE
	8fvJQKAl4FPh+WItl+2UzcWs/zVRRhinxdu21UaJz0WuUXLyfFdReKOTM9XFK0lp+DBEH8DC68z
	iP3lqHcmctZUHMvucjNg6bGsSDjegaUBgsNbYwNJlswL1ojYTUHAl+mLIy6sq2CWuOX1Mikgxup
	jigitcSL4hdiGd+zzxO5VfjsaDzuv1SB2W0wIpgYzDchfPrM/J5xmw8DfkNsDRnBpSgWM7gf1V8
	SMXzeBEYklWh6dxwL7R2AuOz/4peB+B14ncBf43KXFtyTHqenS17/m7/KcApR2qni4JwuAagTHX
	ebgt7yW8osZOqXnnBnknecmCG19lIY7ZkcS
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id
 5a478bee46e88-3725024039amr6518267eec.0.1794167970321; Sun, 08 Nov 2026
 11:59:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Nov 2026 20:59:16 +0100
X-Gm-Features: AclHuK9jeLy5xXtIqSKPxHyksnUP7RPDUpLBrvvwrDuJgV1dxihT2q9FQbUKuo4
Message-ID: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> -    #[test]
>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> +    #[test]

Is this one done to match the other? If so, please mention it in the
commit message, and consider whether the last test in the file should
also be changed then.

(We could do it in a separate, previous commit, but that is nit :)

>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
> -
>          b.set_bit(2048);

Spurious change?

> +    #[should_panic]

It is great to have this, thanks! :)

Cheers,
Miguel
