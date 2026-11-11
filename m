Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393283;
	b=HVuZb4Yw4w0S1DG+F6Krd2ugAkpevgJfEZLnhpprlwqdFL9xvfjAP8JWtf8txYkXnlkV
	 B5p0Q86LSCRzHnRfHJR870u7V07MIGXl+dauumQwn6TNgnPd6wVHoXT4MOaXv3y4rlIhS
	 +AGlxaaF0yJVaB+RlPiVvIElhEjn5cPde5tW6l8V6sBfNTGTUkCSTzp2p6bqyV+xAREdf
	 UMlj8qfbSRz5GLdZDC3bAafUl2aBiFJIQg65m1k5TOwmXuCGnCrorEfgncPa4V/4pP8RF
	 dw9xj/OYEvVydrhqM6AV+Uh55tp9tPVye17KQ+3j949+6BcEX26ziQPBfOcPACXsfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
	b=cN7dqzoY0erPJ+tSFcT9yFfBR1ccJ3yvZdH3VcPOo6Z4cS9xfmNZQ3gq+tLqQCloLk0D
	 zNmf/NjPpu9sFtyFUqtvb6zeCJjP9X/0Dxl12k/VPxwX8P5aCYuEcdPtnPjZpijpJgxhk
	 mL/Ob0EduE0aUf7f2HChTNeUiwjTc9d0DFnN41+l7kewouFuVG5gOgiMYCCWypqhQkiOA
	 yGmJ8O0H9BaZlMgif/DwSDEf0e7KuNelYPeHcU2kWvYFYyRZesD+kuHdZRHjsET3dUW2+
	 xHKH12Za2n3vJ0tnIqj/NsUPpJiOL8JP2iNZEH99cyulwTSjNLEtoe0scRQ5okys93w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3CB606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3CB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wo4+YNlr
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so34066745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393281; x=1794998081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=Wo4+YNlrKrnltc3dTrFhFyp8o565rovrnVKvkcx3eVzs7mE3qiNP4os9f3zKzIUO7q
         Mo/E6HxBENrz/Twy6Hr0jn0S9RD9and66fqE4mLAn/XVoQ9oGhz/5FprThWZmcB1lSHC
         Xw3GiW0FU0e05EIYsy/TOTtxkzFOG4Rc7Et1sma46iXKPmLCVl1BoEbBdP3bAJIvboW5
         RDrss8nRI9XAY9vaYK8uPgGc9tmFypYAcAnxtmeiIEQdKL+6MGcergbBBIDQPsOYUs9v
         8reLcEbCJIqvaqTXvPspIf7k32+QOuydWVQAkHaiFp6OoRWnSK1pNXkuh2Jp185lV3Xr
         MWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393281; x=1794998081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0BstBB2s+mXG455PQXyfJhRhSXomdgOjXb5/JFNaGE=;
        b=NO5lzAKMCEv8RYcuyKbBzsvUtQSFPCpDZ5uP60bKQqivcZX9ndG3blR7lBovf3b1Qx
         C4yiCQNfBlXTlCrlH313vLFBxQ4QjCv9zuzPkufNGXum0sAnu9RQ4E6RJCQ9g8Hv7Mcu
         7co4JyjjgvbaiVWAXBjwcalL3IhDmGNsCe6FstIWzlp4+3p3nh/csf1khTWQSNev0MxM
         iC5E+R9ez9hu9G/fAc72xGdGKBprwtYun2iseqYxLxc7KXidLb/Iy7vg/0DV6gWBcn6s
         Bp4z6uPziWo1mlxVXsm7y/84j4B/kXPjwGZ5fOqN9eGH0RfXLgQsWfYjNwU+1lJHLv+4
         Mowg==
X-Forwarded-Encrypted: i=1; AL+hErHgHC50S519Z4SY1LJLOszSBHkz6UiypZ5rcuCMyjc4nVOx0oqzcOoUu8WGQH58OlLGV6jtk99Pvo2/mCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qCE6Mb6RvmFydkNJZpU7+wMQQvtg8ZfYEQTW+1yVI9m9HOeG+
	gjqHjkrpxlIHFpMzLgDfeANA3HdypAMVMDL5HjQnpROSLxdM8ela59xn
X-Gm-Gg: AYBFou10oVXMcP6wHvgcPoL+vl6mbbRQQ4kDr/XQ/kehR9RYuzCqoeJmUYDb5n3dQfT
	K6BjG78f8QnKrKuRvZH4s/nXoepAQluNfgwoRTyDj6TKBCjz7ao1Yp8PYQSsUGlC/Jm9E29xgp8
	UFxhwTL79fCQCjxCbo815c5YwMKv0oryBOpgLuSueGgM7IdvVQEH3hJ3MZiyu/qpKieYcNncZHm
	Y0NSN/kpjjxw4ATMna2SYnprqYaUX4hKKOrMHJpof7GF5OdtkO9wKou/aBgJEIH6vhFyLNpr6rd
	JjhmtvGducgLe+GDFrcWpLhkuW17AyCWABtFZhtfdMMNYFFH/CAZawrrfk6AG5PT9CaOBSDh9VW
	gXM0MPWxAJFnyqglD6De/dKSR5jzZzWIVeC1HjT0OdICSjFWPbvTrRw1Sdo+BWV4fBarGyxmKEz
	Hh/XXF1f56arSsYWbWaDqsVb9Y7bpsNt1paKXyzYSA3JsjEUHugpaBcaY/MfPTMJ8h54jfHoPqX
	WAJsLDwKfnfgLTE/MICGZ9SrAGAC8SsT75zyVw9ZpRkt9a4cZtfVODGydVyg8tO1wG3m7XvDYrT
	x9EO5WxJEBsRYiWa1NANrTijj1pXWZ3EAg76OQUHKcVYybZriF0pnJFZNdTshU/7d9k=
X-Received: by 2002:a05:600c:b86:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba09377b2amr30972055e9.10.1794393281331;
        Wed, 11 Nov 2026 02:34:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm157078915e9.2.2026.11.11.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:34:40 -0800 (PST)
Date: Wed, 11 Nov 2026 10:34:38 +0000
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
Subject: Re: [PATCH v3 5/5] string: Make strprefix() const-qualifier-generic
Message-ID: <20261111103438.2f822202@pumpkin>
In-Reply-To: <35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<35bf6672f84f07de3f40e8db9e7fcfd643894fec.1794323750.git.alx@kernel.org>
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

On Tue, 10 Nov 2026 16:33:56 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  include/linux/string.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 9e59f9697c9e..55ca4cb5122c 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -590,7 +590,9 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
>   * *  @s+strlen(@prefix) if @s starts with @prefix
>   * *  NULL if @s does not start with @prefix
>   */
> -static inline char *strprefix(const char *s, const char *prefix)
> +#define strprefix(s, pfx)  const_cast(CQChar_of(s) *, strprefix(s, pfx))

Isn't in enough to do:
#define strprefix(s, pfx) ((typeof(s))strprefix(s, pfx))

which correctly preserves all qualifiers.

David

> +
> +static inline char *(strprefix)(const char *s, const char *prefix)
>  {
>  	size_t len = strlen(prefix);
>  	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;

