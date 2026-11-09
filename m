Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794268447;
	b=Ze5g5Ebv3Ln/oZguNqIhNGtyzHR60poDJqT0LXC8J+kzk6O2Kje4W8AIFfQXM21gWzHx
	 DDC25IocIen3ChUYDr2c15hFZON5ZoMeks3etQUqVH8SQegbgg4InpL0PN7h90ZKdViK/
	 4gC2I4ts2uPXqULpXcJ7Zrh5fSoy/H06dNWw/rFLzj9yBsvoTSjhfkzjPlmJIJDVxabzb
	 oM5+GswKsknRqUrVmIVFBGOxQP6h0eoLLCsyEE9ZK8BsEcGkGFET3wNotLd69mMRK0K7w
	 xn+nigLeAU0dvSP4No6/6zR+RAQmZJUW4oGcTNaohqjJFiQ7rFLlEVsFS2x6wkzewGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
	b=E1efxqhXay1D6z2wBRIDt6p0X2iliuxFXUK+iC2ovKV47WI0xIW3w8V1b41i6q/JMwFe
	 a6nTTfZmqHplCQzPib/amKbJ0NbM4ReV784JJJibzyCq3SJr41nzZyEv7e43q0ws47Smn
	 fq+WfLg4cpzdjo9fsB6PbPKXTU1z+K6pYdH/iXJl/pRrKrCGjLLu8t90/7+CtFqRhjJ7Y
	 ZIy1RXZrlByIpGvplKlKsJOBNqIi0fzaR8KcohKq96xlbIZPv2NC8ZDrFTrdQyPO82vle
	 KJr13MpSZ0qUfW0bGd0WIvKVagfoa2WmoNIe2AaOOyqbUZwtyXryCuD63ZS6GzDXNyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D69/XcJY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780E606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1780E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D69/XcJY
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eb46044c4so18285006d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794268446; cv=none;
        d=google.com; s=arc-20260327;
        b=OM75s1nmnUDFKuzJ8TEZaYJgGkedAZVAynjlppDCBZyO/UdREnVSRnh33VtcrxjrNQ
         p6MnqyUnfLt6EipUDBGmnhm28/twxdtVOXrOYfhdXGr7+UthqaZzb9ilLMgH7Y2TAVKt
         mm8qDD7fHjz1JD4T+sffs4lu3RUuRkqR7GH8lJ/APzCh7A4I6vrdrDtlgebn6j8bOW/q
         ZaoZYODONnUyHLXdMGdc+f6jdyYYyQZ30qczXsUVNxNneyfSohMO4B4/GL0pkxJwGIAG
         WYjwyf9EhaiSNXy1GGn4N2YqiyVYtplRueh2ISCYBvtXzpMgxuyAq0Yf6mmXfTjQ63Ri
         uPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        fh=If40BKMIW7pXHOAJRG8RySnzzc3UnnXVhXD2WJvAPuE=;
        b=kXN/+m7YYU2i9gBsCoqu9HlUb30zvSUye05/d0IZm67lT/6MtEDU1tOw4pR0o70Jlk
         9E3YGYQa7gYxh6WlpvhM7B1Scw8pi1igRY+2IZRxmkLRc0YFDXu3wNeNXe5RpeQkSolm
         wNtXJGVFJnUsk+WP0T8YhixBx7nfHqeW2Bah8u5NBCvSLcM+/nfSnfx9HBJzSSVLMxva
         mRKyAfTxxPWQnRUeo/E0qiPLAy43gZ0kSmucu9Wmjw9xF3byt24Ip80LKQ2d7se8DIJr
         0goWTOeDnhCRmZDZPQc+QposlftCRA7uWRW0T1INd84vsYFB9bvaCuVYpFmv+JhiWbgZ
         kOwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268446; x=1794873246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        b=D69/XcJYRna2ggdafPB7ktqQ3YEVj8KMAA1PSxBhy7JMQasGyNJkTXjylGs/W5N7rZ
         GfCN8fZ9B1kUzO8p9RyKaziPW5x5qbUyhxAS1xvGTdJxgnSHTVzNzRRcYtE4SfU9zY8x
         oWucdhhtBQVNQ6cIgexBqjb1G7lfvztbyHJrzmRZvlZ9JeI8Qvz0B45/33f5ZNT4VyoO
         VFBCk8qwzlYBKb0trYnc+pU8g6jkAoiaSbKtbPNxoBGmVtRzu2SfKl/2Mq4YIgAYVOVz
         Svb3S8KywFgrO5hGvxmF9y46+vFMhEPDTcwhBukHDYBkU8kRwA1dW7aY18frr6rKYsWT
         zdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268446; x=1794873246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWVC88PKMv4iuuD7NHmHgbX9G6GHyYodYe06BrIUee0=;
        b=0l/OtOwmHaA3lqACStmxHtGerVff2s/kQo/UDUbufbP7B1R2/SL5S4DDJ1PiA5UmXh
         aaP3x8C0D+NmmGrMTeDlw2RglAG9jpy2knYpqG24ovhVLOBJXaznNtO4EMKcNOazD3fN
         +UPlPOjm9ANcSNgHIHmsNrhZbdDSSPWNxEZdBVnpibYSDxWiAYyFRN2J3GjhBZWjs7Qm
         zZrHOprzF0Q9jog0UUU34zYa6LcpvnWSkl5XrgfZ2E0mo2JGCXItAe7owZ0hCZwQijYF
         fOZZBQdb4DJYG6nX2FkqUOVOlMx5njUrFKAFOG3PDNIJZpliJ882esO9QF9w+a8xKZYK
         xlfA==
X-Forwarded-Encrypted: i=1; AL+hErGEi8rQsNzw0ClhkSVh/a9yVBmTlpFsEwfZ9ee4RqqIf2zlLIm4v1iR9K5SrSM57ixVECoUIMBuy7ArpJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fi+ZTM6FKdf4MqXdL9YtJ5Vy7a41KObhFxZjsQBzg/Ne88Z9z
	mmO5ZpF9TZnI7CfzqS/2KPiAeIWSENJW+qIaWEDXVLysl8Q/0ZxPcv1KkomDkmCA04rkE0s/aFS
	72Zu9p8oT139NQFeoUVufGL/s32ZGKWs=
X-Gm-Gg: AYBFou14wogt2yB9wERTIkHzNEYJatUaAl2yeo40aoacemKjDzJ0OPxPCxc6GFF1Z05
	/P1Mx5gitTmKVsxy5MP3IVwHH/izyxW2R/7Li0TQ8M3GAZI4/b4bu+7Fjkk7ae/cygVlqicJ6n1
	bX82Jw/jRpFyWW+qsIpxL5nKTFx2OPdNdGxqv4RWG+8MD63ElFIGvw3imCaFfUtlimmn14zRZYY
	1ef6DVDgfnHlgO+LuabGjZ/pH68iqjOAtiqGzUNMf/x2kKF+UR3Qg2OFqAa6GzexQ7gQjsBmUoq
	vRB27ydnufYrWFP0h83GKwPFue0lqzmUjAGItHx0a8EVyXJ8lPYldEc9W7VOoDRQYKoLIC41V3y
	twKz+5uSQQ0yY4uhoCL2mZF/yPtR5LiVJAUUXtsIgxl0DiOgfKVEaa1sYBMytTNjsIU2kC1XjkI
	byZ9OsRf3m0FJhbLYsThz+qKC39HBzOowJPVXE1QnR8rz5SC0PGtYFXMotSwZThyDec/g8yI3bF
	dlYZtuH+WiupwF89Kb8ygI=
X-Received: by 2002:a05:6214:3d9d:b0:91c:a3ff:854a with SMTP id
 6a1803df08f44-91eef7f42b6mr20524036d6.35.1794268445715; Mon, 09 Nov 2026
 15:54:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261103033349.908133-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 9 Nov 2026 20:53:54 -0300
X-Gm-Features: AclHuK-871HspvpoV86QNx327bOKK9xzf1CmfDYGKjbEkYRMjpZ2hf2T_CqMudE
Message-ID: <CAMAsx6fHbbhP21xRxYhzHRTwpqihrpFQ3HDB5KWpSdSWqBVG8g@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add init troubleshooting guide
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 3 de nov. de 2026 =C3=A0s 00:34, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:
>
> Translate the init troubleshooting guide into Brazilian Portuguese
> and link it from the pt_BR admin-guide index.
> Signed-off-by: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
> ---
> Changes in v2:
> - Add a commit-message body.
> - Match the punctuation in item 2 to the source.
> - Translate "painless" as "o mais simples poss=C3=ADvel".

Hi Gabriel,

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
