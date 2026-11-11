Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392739;
	b=Tq51zoHISyxLgy3m6puwV7esvKzTkHD3U/LDFawHDMmOvSlZw9IvBRGcQzxiJpCm30Vn
	 VMYT+12MHy/90ogJ9YkMueuf21W7eSXRPldCoQxSx2O2VvfSAoIhxKPTlj5Ht6hfnjYtu
	 FF/SYcnkeJjRvLDrgk6pD5QRlAz77QyW0sWPdIBGOD0AIeMWUtM9fcW5c1vu4btYuMl2C
	 g8WuamFcA0+AH9Vv3a+ksXdpBeE/F0ufMHVhq0tkRq1ML1ud4PJCXSk2yh07niL6VS3DV
	 nj6cooa2TXucGWqkjt1x0XYGTrh+ezQzUlgWI8TzIjFufff4SaY2CVKOOc/LpQRLiPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
	b=ocQWEGBsSXm/TkDL4KksMMPMqkqlsGhKywBV2WW4JWU84ObBJ1aDqqgo8Id5SAJk5CVG
	 mDdGVwNwTvuLi78N+Ejzr/djxCWtmgmj8TyxA/6TYYzhelq/MzcTpLepYALSolqzVhoiu
	 M+3Bc2R3TsRQ1DFhT4i9242lyIiQvk9mAccxVHpXHbHABm5HekcEFxKhF+dfnUvggq7x+
	 CD6UybtPrL9OimW/Em9itD831oYWj4DaBi9h/3NFF+ZkkCgCaRF6TlNSirxCA73/nEIM5
	 K7HvdH7SiBSJ6WzeRDygCspx0BV4qOP0DQfQH3VHolZK0j/nTYXCb6565QaBgU3XD3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73193606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73193606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mb3uhiUC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so17416965e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794392738; x=1794997538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=Mb3uhiUCOo+9OL8nkk0DPqlbHMU+U3YfPJtQRGohaqBLQ8OevIfv8dsETu4ueSqwRn
         NFUTwQnpCyUxKUDcsxzqJiYueO55nV4pkpQgYg9LUK5WPus9n/ERdDgHae8RQ7j2Dw+4
         fM3ibr2Y6ts1e/OTqbgJiTQW3L8WDSaeJuxScEHyWMzPN+bGBiq2tlQqZ+g6LQEpKD58
         mnmah5jGdWJ/FHCGptkaUokAM2nmjVjDMlQqXY1Y0+QNVEBolaI9RZeQ+wAs3afJIVDJ
         0j7wdyVZa4FS6RKopL2kvM92RArS1Tu/5W/MXYkBtd4iocmh7ndrHYxmSyr8Mi6yyFzr
         +H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392738; x=1794997538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCGh2v7nU1b/qpgNrVkksi8LEcAJjTlz9SScJQHog1U=;
        b=rSbx0jhNtb+2Fc47WQ0N8lLTvN2upByWsjCY2RtHhoBc0duCWXNus6pR7zaLOKz/uQ
         x8ldSGkzyX2LXUbG7dDrexBBD2Z/avxgalAjoxUdajwbbbzzqj6di5GIaAsOt2fQnQyG
         3vo+tZGZ/RHg0+i2IHsxdPsjrZCKf+h7+jrBfv4sklVEd5nugVT3oa45XVhxEap38fhf
         kIEYeSTsh8FrIsQJZuqGYOEFqu+ToHZg+JlTSrxV0+8qvBqqKxXqUjhJfY4k/NNaXs1f
         G6TwYx8ceyz0j+g6THO+KNA/VvWr7+faJCxhAjcRWn/LuWJm18kogjKRM0Tmm90oyheT
         /JqA==
X-Forwarded-Encrypted: i=1; AL+hErH0UPiIct23ySSi6TrDWlzTM4bRjcTt/eUxzsKOj757CNfq3moa3A4CAFYz7GCqsrrXLThM7EInzezaLzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Mzr9aRDHbTpOyHIB3sFgFxX1HJ/IiiAp5rPUvV8DZcvF9aJX
	tTdZli3UrPf2YckdtnDrBr7xR4KeZsPkTHrivoRp55lM2dGKmq6zAULF
X-Gm-Gg: AYBFou2K4kLbhrGdqkx/pe2ZZxlXc6WRV8FxGd+8xqpr0CeYbkLGjQvtFYZgKcXwx9k
	24vSOzMNqC7X7TWxlqJ+szW3NNfuQqr4VWzxfDGdNrp9xSxDaTsTSnYyqenJrv7hp9EYgL4wZxu
	vEa9WoKJHbpU1NsKSmPodiW2cAMf7wZlk0EdJkDiKxJAJeFLGBDqb4CmXais3LcMxt2ZntpHhJ1
	9fogud2DlGewVfpJnPJ6eIagURhciOZrmAxjpwirPGEl944r9Si2lpYiXNRwscUCbPOXPjk/iLb
	74iLmBDCWVn9JMc7/MlBHYe7yr9OE+0IzfPljUzXr8rxoocOqmn8Y7QhrJMoaWnG3h8/ojP96MO
	rsLArjy6OLJuA66J14NQam+ApEya2TRkLPH89HuIOi7NXVenYT16+m1ipUSXD7qd/CR1RueWh8b
	xEVacORTsu2Pu1kZ2C95SqcB1+4Ycln8mKLHL6gOE6UNRNws+zj2owEC1gCncQVKQcbMHu07/eK
	P7mlWNlWJJtyknoiAPOdmF3XyOwufbNWrJcTIzj9al9EENbujhvLcv+zzgmL1rZC+6GnDYz7LFd
	Yu6AS0MNStUNytnK7tGweq3ExYFTdzmu4WetwZ/W0ARzxab9q+nSckZrvnr1fkZikD8=
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr41235955e9.29.1794392737707;
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm8610917f8f.14.2026.11.11.02.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:25:37 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/5] stddef: Add const_cast()
Message-ID: <20261111102535.434c2eee@pumpkin>
In-Reply-To: <2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<2bf5cf7baad87b5b7b7f833df390596a033fd6f6.1794323750.git.alx@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:33:40 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> This macro serves to cast const away without risking unwanted
> conversions due to mistakes in the cast.
> 
> It's similar to C++'s const_cast(), but it is more restrictive: it can
> only cast away 'const', and not arbitrary qualifiers.
> 
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/stddef.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index e1851c50c89b..d79a81406b78 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -194,4 +194,16 @@ enum {
>  #define TRAILING_OVERLAP(TYPE, NAME, FAM, MEMBERS)				\
>  	__TRAILING_OVERLAP(TYPE, NAME, FAM, /* no attrs */, MEMBERS)
>  
> +/**
> + * const_cast() - Drop const in the left-most derivation of a pointer
> + *
> + * @T: Type for the cast.
> + * @p: Pointer to be casted.
> + *
> + * If @p is of type const @T, then it is casted to @T.
> + * Otherwise, @p is returned without any casts.
> + * This avoids mistakes that change anything other than 'const' in a cast.
> + */
> +#define const_cast(T, p)  _Generic(p, const T: (T) (p), default: (p))

Should it be de_const_cast(), or just de_const().
It is a shame you need to specify the type, but why not:
	_Generic(p, T: p, const T: (T)(p))
so that you get a compile time error from the _Generic() if the type
is wrong.

David


> +
>  #endif

