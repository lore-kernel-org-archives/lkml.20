Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745901;
	b=UvZY5KKBEr8O4Iw2k+Xb9nMqwW1Gu+58lw+4LdQzDdMW+GULKqxymB0+wq3lb87GpqQL
	 v/hNpOr1RSxesNWpZtlSb2+12t3H/py3M4dndMiop6u95Uw9waMGgCXfKU8/VpojXzVcD
	 3lmypa86aFgH5q4BBS+sUOgBhX62mjiDXjaHQ5xVCbqzUouvxbRvRpf5AHIaooPEPoNOI
	 fR+Je2dXXBtq9HiLF5takmElxJeCS+40qh9EhsFHkgKoZ4xioHMKL+xBIhZ5X1AO/pywG
	 ZyYOLLABMJbnL8+RWwknq0b8Ivq49bAgcCaetVX658dvVeSWeTHmD4h7LXxZ32z/jHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
	b=TvA7vFYvAEjnRJb2oBPlxqOn45efVIXB5WBR1EQSfWo3G27TS4tYOwhUy7LsY8a7VtbO
	 hNz/eaM0yAzQ6/M2diKxhY+xTh8La4ZMwEz7jzeNnpS9Tu5wXf9DoM1oaKis3fkxXKbDk
	 unoA9oNLHPY9URRji927dZejwVN8UuT0Cj4osjTXeZM1Pg4GnPkl2vUS74OFpmAJFfl/s
	 3ayeJhL9lYS1fumrUKR44+fWxPAajXcKVnwjZ/TB+fgHy3NqjeRRhrA8uWwJeCWWVT2Of
	 LCRW2EQjz+QjvRDZUBO1hSk4/7l57VUbSsen26u6eVY3i9+FFOojgHu2ZzOmDHGJPmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcEGuLYu;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2CE606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E2CE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcEGuLYu
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so563115e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745900; x=1794350700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
        b=FcEGuLYuLT7xw3Ov7jqEPTIlIYjjlyIq1CZZLINU3+V6Krs8+wlf3/bANjfKWYqXUu
         MM+DuEoZ+Ehl55ne6hItR79t/rj+/ljIOjoZ6SBzVFJ2zhXKeC+ACL4SuEmcXlcaNTDa
         ReQuBysyObsG9EOhS0vmiOSi/Al4UEv0WN4KmVv6TunbgBV8uY5pnRTH8C8GkZe88AmR
         3fLCvbtAJSvVIzMjRqF3o62jM+4hvwpZpp+clFIHo2vjMz7xZ6/q8Z6DLTUnh81kE3ZH
         KjA+b9EJB4jChB4iCS8SCPIXiw614FJu126KDPyewYkYRH28tAytaC/QoIVf2DT8foZf
         MGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745900; x=1794350700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
        b=UcbvrsrQpSasjupkoY38YCgnwipQwfvJzvVfWN7mprfC66Mo5XDdn0IwUZlRvb8c56
         KNa/bb3OjIY7/lQFM9r5OD+nlPTPmKoV90ZEG1uNE8jYah0f+OeV6R/LdUf5GssTjM/k
         hkslw62YsY2KrP0Z/4Fj+Tc+Ku2fGYNtlMk8SlTCON63GzPP7XhWZZjBN50yKtKmzfg3
         SZ4Y9CBi9cH2sDYSxvXWXjcn1QsTLW3pf8JZIr1TP/4YJqhokd21lTQNgxqkjhPniFj0
         IO4FeXSTfO+KdoScz3NWHBqoEBqRk2uSrrHfK9FkuN2KK1mAOQRS/3J4i14VzgQdh4Kn
         oh6A==
X-Forwarded-Encrypted: i=1; AKwUvBwcDplGastWdSp+XkNFSnuF7W6er/STtOEpKF/BR61/MXSQg4kS3DREVaijrCYP0tTZAyITCUViEZoV0Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H0T7tWHJrpLR04hLcvkwAmOJfZqNFhiNSRx0l1ODdwMfAyiKF
	F4fzt0e6j6qHlWsFQQCIeDX1i21zgSxMULinTD37jsHnbzVPmZxC+pcn
X-Gm-Gg: AYBFou04M30SDbmBABdsgzLWz26vOAq3/OIRlbRqdJPHpEbOl/i2JAaOstom/NIH5nV
	zfgZao8SwIHhVIkucZkL9WMdkDlDI83ifxdJujdMbmb7b4MphNZUGUDFekTxvuFS+8yj5ZipkSr
	xmTQ+B8HlMQ4RdbCLfBN16nJw1VUkVQkA6kiC55aaoX+nALHXzm1aM2egpxbgMupbEBsIRLiC1q
	X9jY7/5fm1lJpChl12S9G7++rDaJmQyc37U5EU7HqXa3n+7Y9RSjp3BoBWn8N5T2jHHj7gs/Wxf
	p+ObfYGRoE8YOMZ5puKwxQnnZM5l0MGdVcgMP7tGaGQ225EpKZ+72e/yPHuu+VlcgTHhzIqH0R9
	abJcnEg532eDo60NcO4JC5dzcZHpwXcwkLOqZqbIblw8M0zeD82MmDylS7fsRrvMHcOn8wtTHRl
	SAWsGckn5vQVa1iXZeAI4eZ977C5XK09haLqfR6DhrIi3MgVPaIRdoai82vYCfXO74GgvWns2Zu
	5ypuSCsDQfM3gFsq/zIjgqaMe1ZWxAzTwmQzJyOn6bY/xOjqmTnhb0VxIIqB2ooXFdmLD/K8Bi1
	mt+DibxIprEFK+uTsmF8em6QrD3k03LtuIjjMpB+EhAd4mla8urQkgOjc6FYC7LGnA==
X-Received: by 2002:a05:600c:1d16:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4ac151a8fd2mr337030225e9.2.1793745899679;
        Tue, 03 Nov 2026 14:44:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm10357445e9.5.2026.11.03.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:44:59 -0800 (PST)
Date: Tue, 3 Nov 2026 22:44:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rosalie Fang <rosaliefang@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Guan-Chun Wu <409411716@gms.tku.edu.tw>, Nathan
 Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Greg Thelen <gthelen@google.com>, Yi Zhu
 <chuyee@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in
 INIT_1()
Message-ID: <20261103224458.7fdaecd0@pumpkin>
In-Reply-To: <20261103163404.159582-1-rosaliefang@google.com>
References: <20261103163404.159582-1-rosaliefang@google.com>
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

On Tue,  3 Nov 2026 16:34:04 +0000
Rosalie Fang <rosaliefang@google.com> wrote:

> When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
> unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
> exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
> constant conversions in unevaluated ternary arms when initializing the
> s8 lookup tables:

Has that been reported as a compiler bug?

> 
>   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
>   (aka 'signed char') changes value from 131 to -125
>   [-Werror,-Wconstant-conversion]
>      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>         |                                              ~~~~~~~~~~^~~~
> 
> Explicitly cast the digit-branch expression to s8 to silence the
> warning.
> 
> Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> Assisted-by: LLM
> Signed-off-by: Rosalie Fang <rosaliefang@google.com>
> ---
>  lib/base64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/base64.c b/lib/base64.c
> index 325c7332b049..1489c048b1fd 100644
> --- a/lib/base64.c
> +++ b/lib/base64.c
> @@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
>  #define INIT_1(v, ch_62, ch_63) \
>  	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
>  		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
> -		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> +		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
>  		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1

It might save further trouble to put the (s8) cast on the entire RHS
expression.

David

>  
>  /*

