Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714868;
	b=vn7U8ZdVh4xQMkwsLZCtOevtgkz16BkbwtDZstU8HB4bvhMzIK/HgB/vUQ0hy88Z1cVW
	 s168XWjUIOJBGUBsrXF8JEIJOdv6bs5nacYlM3DYX/umMfxyXKXrkTBYLvVsD3cm0MKv0
	 I2wccSKUcKmffKxulVh+7RUGXh2+daLIu6rw90zOgLO/T5BjaYWJn+GgxsN9AVfyK5v/1
	 WpLKR/9fnR0/BswxDXExFKJPnURXpOL54lwXpvKEXR7sS3eIQA52M0jPiRl2COtlSj14X
	 M/G7afA558PNw/3GTWkhEbDIr6R+Ayrurs37PcUmgUPIur7nrjYJZANvB+3GHtKJxMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ff3dJqAvXzLV6Jf16Tus2rrJ5Wh3fjFVBip1hlsQ8YQ=;
	b=0hvZpLcxOJd2ohZXGSfU0D7JsCXgMG38NLKiUbLl9Qcf4he0k/sd9Rr1JMDHCjDAqyyq
	 UP0W3/MyoAJ8FsqYh7mQD08IDGH3zcMD5B+yakgFpH23VdzenlfZdncS26kDb6JVEURm7
	 k5zGAeGgZEYICwCZ4eYKBHDnURuAc9JDH6jlGDb5vDY4jlREue8IEOmfh7GlIpMuzbo71
	 9tonDHraNO6ArqIkeXKOPDjooktw034CDNWgn4xCb5tK373NrV3ySTUnvZEzgrDuulkJk
	 caVUkpz6dnrtu1giJuoiGoUZppZ3QBlLOaqOQrEAM5D/DwD0rm7hXbo+ZbgQoNP9gZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjrhUmyl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F3B606D804
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F3B606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjrhUmyl
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso1517084a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714867; cv=none;
        d=google.com; s=arc-20260327;
        b=Xk3k4hnr6mLI8BwMjnKG5mSlbZjzU3gQDZrE3ERsMVg8C+kBoawUbFZVdpcBgY93zH
         +COP+MqVh1+ls4GAFW1JTcE3/KRxA3cVgCCx8dWoo4KyBTwtkv8741lap0RwepqjQXoM
         N7Yw1fWDHuYIqFKUb0SyWus35rSlylUwkAjxc6IohENx88TIFevPvVi3xTN+bV5ELt+8
         NLLX1MlmNF881oheMZCjTH9soYr5w0AY97IG22FWyLtabEEX83lNniWuGr7AH1NECng/
         HeFMIEy+lqI5Kc4N/K9n9tTvJNihGH56MnNa0LHBvQFp4aTEJpZ/XwowgYMSN1ylGoQA
         1fVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ff3dJqAvXzLV6Jf16Tus2rrJ5Wh3fjFVBip1hlsQ8YQ=;
        fh=+SB58Zn6jIy0BD2WAPOVPdY1DCPhmcUed+18q103Lb4=;
        b=MC8971aw2+WlhSadXdaLjUo7ZuLqLniZeVjc78FRn2810HFxCpFRD2wSTclLEhXnkh
         Y7X+E57FYumZ3rwgu6j3+izT9+HDk85PNUzQSCugqDd33Q/GcJG9ouMRCi1ovADP7uJA
         iIk055u8/vIvFezCZUATnl16ZyqLXqsXHMnEbe0GsDazyGz/cQ9j5piecgm9KwfI4yPY
         TK9V3sKkCKIaWQkHi8dF9CZtYgrv1KlXe8EtIdrQ5lwwG1b7WtDXGXQhs0XSmfWC9IKi
         ZHVtLCzjrGM2c8EJAEjyHr90qJphcVzv0DG1dVKzX+lSdhWIi5cx2HpIE433TYLjEmZ9
         Ck/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714867; x=1794319667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ff3dJqAvXzLV6Jf16Tus2rrJ5Wh3fjFVBip1hlsQ8YQ=;
        b=IjrhUmylo3IArRdOzsQ0pKYUWUHIRHFcyd/gn88ZI8ZpzXcUNvyo39MYXhLx6KsFRI
         B7rnJkJ3e7vRib8CUnMvC+ugEX8tvu4cvzIbgfV3Fd3JIPzdCzh3nQ6qG9CB6xsInCy3
         NqM56aEWkqTj5LHQxh8dTJUpy7c6vhmWIptp/CY7W0bADdNbFn6WVH5LWu9KmWFfWuUF
         w8NuJekHZ/vISm1ufPRrQGSbej1Y5sFaUUxlB+bZnLBThLj00UWhpVMjuIK3R13gzqjx
         zSoOO+vyF80hFJ1Nv3C624HSfHSlewuRoikqqEgiTDhea2b5q7R2/dtcimjQkpTJs6W7
         ET/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714867; x=1794319667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ff3dJqAvXzLV6Jf16Tus2rrJ5Wh3fjFVBip1hlsQ8YQ=;
        b=TEZtN+gUT1TTe0Ujr1bWyDBxe/Ul6we7dymOhpQhbVuMlEvIc0IWBJx6tx+2QsKoAT
         t3x2EosCLtDhTpYBxn/q2bbNg6K/Lsr7hJ+LrEJO7fhUI/ZYc89A5M5MpELNpcSqLSsJ
         iBqXWaBtUd41fE/XlnUJh5/1+BNilC740XdD39JGVUP2Xyy8v5WKn4gASnkJLkW/twVo
         8vQccqwoJw5NwSifUgxOMGdtDwiIcEKK+1BudhMXGi+TCzJBmBTUNJexgVpuZJTo3/dM
         iTkVIzGl1fiAamcFgwPQDzmfcDveyw7CqqbcfK9uyU0IAiJ6W49hRQItiQuDDK6E2pAd
         JWog==
X-Forwarded-Encrypted: i=1; AKwUvByy8QKAnBAu+U3I3qYYoqdYIbeCrfkOyuLsbeCVSEtY56NC8qn+s/5Q6UUxizQF7TSFKJwMe3nklAFY1W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/StL82tmnQNdd21/Csh8wq1bvL4Bmo/rRMNu0Gps4u06QtoXui
	8GtGDauDqJWi8cvtCKO8oSGLVwoPp8H2FBTzhFM0a3CBaZ+XzdDbY4oc7POF9i3ZIP+EuKhVnYX
	jHecshS9Fv5W2z0VlB1RiajyVxrq2RHA=
X-Gm-Gg: AYBFou3r0aFdjh0ZXQvPM0E09khrEAZqGirSX58psbgbDx0/AH6BVLNslAhSEB0d9jo
	WhYdBjP+JMZJunNMF0OrCGCNQ1rLLyWnLVIUrs3QPerVsqd+REyfkzRCcS3uFeIA/rWr9+EumvL
	kMVO2bbP9+MKIykb0zC0ke0o5q/uG1ocD0cITZpGI0Ks3LvjtKhLR/l3ael65m9Iz7hME2x8pXZ
	8RWce5Ap98oLNCFIamwf/VsaxM3PBkn3JlTda5Ew8JTgkGkFjtoUKb9MDuDTUBL4XnEorqdFihX
	afEsXsjOXxKochu85wYXk8b3AuYdVkxYehJHWEX4D6RyyYH6AxbGj+HYx4RF/rtSMHMml//PLqP
	3dnk00fVTZgq8B7dyvX1rer3kXn6+WjIPkTsbMNp8cpI0nx5Ch7emXcF9/X7hekFC9PTqb+Y=
X-Received: by 2002:a05:6808:4feb:b0:55b:f890:c1d4 with SMTP id
 5614622812f47-5640dd9d633mr10549294b6e.29.1793714866562; Tue, 03 Nov 2026
 06:07:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103134705.867613-1-mmyangfl@gmail.com> <179371403595.488859.12039825341832560119@kernel.org>
In-Reply-To: <179371403595.488859.12039825341832560119@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Tue, 3 Nov 2026 22:07:10 +0800
X-Gm-Features: AclHuK-7jsvpM44334h9J14sjGqovuYQG5qPvLWnBWEdJcgZzhgWRX_ThjxspjE
Message-ID: <CAAXyoMOhZUCzawqorR6sOKcRd+J_h9QjNKRHd1Y9hLWKApY9KQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: dsa: motorcomm: Publish a consistent MIB sample
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:53=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Sequence related, cannot reliably reproduce.
