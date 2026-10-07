Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47B4AAC51
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379521; cv=pass; b=FIg3Hqf94kDq05/B8ug5IG4Jtdt+BAPNskg9EylA8Rs1ujhtDyN6pbdsezilEFmwvCCJ+4R7fpfmUBel8PAtPPFh3c3sqy2rSLVz0ZCxJgU4ORhz20Hnf1XfEYKEH+w8yUJwZSvo9uQEBklXr7oKSj4idZgYGpGya9E+tbqISVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379521; c=relaxed/simple;
	bh=r4+e5uMoZNj7ZCkw8C4enM+dD5yuNoZmNknGMAbiFK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4IcgdYvJELgrGjmd1xuSUV0HWsLg2NHlVLAViCaPnyPrCKYFuk/iedbgHat48M8RTjpTxiUn0iGkNtLwf1TuoD4dLmYX+UYMoc+IBiDIkm6OoRW0ruvFPEO1oCimG2JpYSlPaIlRXg6prfqu4xDBb7iIBacNXRog+iM2pWzHfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XK+mHN/m; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XK+mHN/m"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so13117a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791379502; cv=none;
        d=google.com; s=arc-20260327;
        b=szI96KWhFRum4XUSmwCclQbSM4T9n4y1pPtJhQt8O8Ysn0eeC2PPjWmyxBGpN5rw9o
         RGnkospAeRoqOaveJ6syaMIo/db22P0+jUvSc/Vh11dMevu+wDuo6WtCwPsX6uN/OO6e
         eUu7dfxeNNExB3EsA84l2XKnJ04RmENAbeP3enu0nyIuvY+jl1D6zfaREqgOsVl0eLDj
         FRhXYypxINKiLKqwwhom4k2g3XyO7M510sbzKSA/w/hzBIbozk/KYzCOvfo75y9tHbOP
         1GvWRYzsEZbo4a1KiqPmufz50ZsVlvTCfzVgfN3Vrc7OQY7YeqxrsZ3h0a+CgjRC6DAC
         maNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s+dZR8dpXP94j/qSyFaGO59voLN46gwiqCeuh+llQbw=;
        fh=W2KqV6h8IwYCUskHzm6rho/BGhN1ODCRX/iV69kEHAQ=;
        b=B9zm4WTqW3Lg+dYMnCIPv4mmT61SzdhesRdXq733ScjhQAX7fOXq5UAP0X7+ahbWRu
         JPJ/iFahywrvYkJkmEDSAIEPplV8ys+3Aa9wKsqhWucsl7q5nAjOHSoUF0VFswlH3av5
         ppOD5N8gw9oJR+HcKl1FciUT6KaeXWqtU1NvoNhtpkYwem//6vVE59gQrMsDfLzvfNL6
         fFgrhaD4pJ7iui8sX5/400eZCwUqOLBfUw93Qey9tvmb511krwWgPV0eICZwO2ppStZr
         uDt9iIInQlgq7EjGpSMUS1gqIkjXZPWWlNrlBBHQpacxRhldGq3u0qIeQ1OCHU1BHdhD
         l/Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791379502; x=1791984302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s+dZR8dpXP94j/qSyFaGO59voLN46gwiqCeuh+llQbw=;
        b=XK+mHN/m7/8PWCczVBf6jI9GNg8P5wIcvPEWJiSQ39whhXyU16GXTZxtoHP4bZILwF
         fbzHnnyusPhBuPJ9aPzAptHzCjJiIWe6m+y7N14H953mreW1xMYqR3xO/W2B+VOvIf97
         q0d9cy36G0RfmdM35f/Y7jTmLS+9/HGIb3r1n8nWrmNBa3ossJ0ioKWjk+qynEmXPxML
         5JhIvkmtbXxt2eJhBiUJT4omnSlWdkqLc8sbShJDKATk0jtb99o3Umc5A17uTfjCgjRN
         vDNhBbZe6+FH3YtQUYuhVDLis/gSgDVmOLZ6E5NlYr9OZyeL5mI1xj8GdKLCjrG5hnB3
         xhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379502; x=1791984302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+dZR8dpXP94j/qSyFaGO59voLN46gwiqCeuh+llQbw=;
        b=y5iWWy9kK71Z6KrJYux0Qcuaq5LdTTpn9ZUfl4qhKjFo5JL8NWX8mGQCDi+5S9LEAg
         52MQDxyRdqGMty9OWsv+HG16RRTg6xOH2JAT6o+XAqtrrUdVCLFRgwgwUOGCX2Bo73yf
         6tmjKwtyLQ8/kuO15QFTPidUNvpGBzjlvKeB2pAw7egGkAHXt76yG3SpR9hDWcXGWnkE
         VnqXW0YelzbYRFQth2R3scGRCjHxXhqw3EURIYi3mSY5dRKqeXJonCwojSIHa1CwxQgO
         RDwczPBWYUE4TPhXYqq2veAT+j6Zi+D+shUgszdJ2AGLFOsgIsbcV38BDRQ4HtdllO6B
         z0AQ==
X-Forwarded-Encrypted: i=1; AKwUvBzM3CwmDjUtUJy0lD2lrjVrlwag1sRiMsH82PalgcWFPwkuUo6UBnYUgy4pJQvZ/OvFHlOL8rMB12mlQZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOMeEQt7D2oCOytsJHrEX6+Qa3go09m9oTSFkEVe7lNTx7L9Qi
	lCZlODAbNM9zJ1Muxg5I82T6Pb9CgvjESLdVTmHrb7wGhKeVvSt7T0iwUnIrEY/wghqN45m4bN/
	jvhFpByrKa4u8EonzjmmPS1tdAUmrmvjHUZr+UQ1Z
X-Gm-Gg: AYBFou1KRA9afP+GxjeFdEz9d9wFhqIkE/ZiIKveKpWFDHaC1kqaH5BH02N6EG5XCuW
	VW9jKVQZ9tE9Yx0Vn+SojyrCJSIiIIFcKYjcR7MJ0Nc1S/YzlRSrl70jTPOB9UXQmCSkvQwU4I/
	KgTa4sD2Iff42Lev1ZNd3xvZoyDYdLSVoZCQEpTilmjOa34yCxkRCIqW6wask5Tkmx5EG0Nw7U3
	4VtWclu+Y8HZDoVYU5W75xZjCKaj2GccO+u5Gi0FjmLJfc0ib6qOm1O8bPEROMHFy5tdmCDaYfY
	YtopskAAPv12/CEZYhg58q8jySPHQLdUNt9/WZOrheUNf0OB9ZvGerVwrnrX/gnwvb7Zdna6qc0
	cupGCRlaToAswKzofhnuzPQ9g3+mAe3GFygUROCTOWENSyQ==
X-Received: by 2002:aa7:d651:0:b0:6a7:ef64:8a12 with SMTP id
 4fb4d7f45d1cf-6afdce59686mr112735a12.10.1791379501100; Wed, 07 Oct 2026
 06:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001112948.322463-1-jiayuan.chen@linux.dev>
 <20261001112948.322463-4-jiayuan.chen@linux.dev> <20261005171227.2014f26e@kernel.org>
 <8a8241c4-0e41-4ddd-aeef-b9ecb4f55d3a@linux.dev>
In-Reply-To: <8a8241c4-0e41-4ddd-aeef-b9ecb4f55d3a@linux.dev>
From: Neal Cardwell <ncardwell@google.com>
Date: Wed, 7 Oct 2026 09:24:36 -0400
X-Gm-Features: AclHuK_1-cUyFKx6jZtZU4vlXGTcJYuoZ3KG5mU-35Npv3ExhuQay5q_SWlPEsg
Message-ID: <CADVnQykSb=trXtxeC1zMDYH7naS_w0h7hkN=v2RSJqe3z0OyxQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] tcp_cubic: fix divide by zero and endless
 loop on bad module params
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:49=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
>
> On 10/6/26 8:12 AM, Jakub Kicinski wrote:
> > On Thu,  1 Oct 2026 19:29:43 +0800 Jiayuan Chen wrote:
> >> Subject: [PATCH net-next v2 3/3] tcp_cubic: fix divide by zero and end=
less loop on bad module params
> > if the LLM Medium severity complaint is true maybe also update
> > the subject? I thought there's an actual div by zero somewhere
> > but the commit msg seems to describe the inf loop
>
>
>
> Hi Kuba, sorry for the delay.
>
> The LLM is talking about (cwnd * beta_scale) wrapping, which needs
> cwnd >=3D 33M packets, way past the 1M limit this code documents. So
> the loop fix is fine.
>
> The div by zero is real: beta =3D=3D 1024 in "/ (BICTCP_BETA_SCALE - beta=
)"
> and bic_scale =3D=3D 0 in do_div(), both at init. The new range check in
> this patch rejects both, I just did not say "divide by zero" in the
> commit message.
>
> Want me to spell this out in the commit message? I can also add the
> READ_ONCE() Eric mentioned in the same respin.

Yes, please spell that out in the commit message, and please also add
the READ_ONCE() Eric mentioned in the same respin.

Thanks,
neal
