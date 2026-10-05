Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256C4D09EF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215296; cv=pass; b=WwOI9hp2CgbI+aOV1ozHfH743Ajla9ACNL46gz37c0wVD13zAOqfWClJfkCyNOaMFjlcAyU1xsZeiYf9PuTbBRYaPp7zF2ooi28yOB1i/aFIxRo8Hsy8M4upR32wvNSodGjlZnThZI+adE1v2wtSF02Pdq9ADvgPMNDUSjccSNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215296; c=relaxed/simple;
	bh=lCgO+hyv0qYkNrN0rdtOfeWSTqt0Q1A4GeKqAbSb+WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeB2nxINqbwfkc6CXoJhwbFIvDwNJJcRSIpZPW79GCfNoa4J/5XiNtWDKREmjLvFzYGDdrUrq4wVulZQjDwO6miholhLr7kec6ZpWLuCd69Me/SQNsDY3GeFqfSekB97fOw/Irkm8W7NkaMqYYaftuFypxZOOGEKaE+2a3oeZbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=SeIVELEl; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="SeIVELEl"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-823adac76e2so929574a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791215290; cv=none;
        d=google.com; s=arc-20260327;
        b=F9XpzBKr4r5w61xZ0nyflGSsWkyrUWYtu3JtuHe9jjY7FyCRNTATa7Mvipt1wOgNi2
         Va+FtOTZy7nCoqb/3Lub+qcPHOfKCo6kHCLD4ab+uyPIJ3jbKATO7sg0odN5Sk3FifAG
         7ILrhL9ueUAHbPGKysjE/t5ZZabSCbqVjLf4LQn8AXAJ4xZjrACMtvgIl6mHxxhIvtzY
         B/GdChDpYchOjtO4QYovykcG0gKRQeTToZo0aNuQyVlN3UUpD5ms9/9YdRlMC+yQH71C
         JvhfIv5TNDVhTVf+G+XBh/JGCL4dQ+xPn8mpX3ud38hPpuBpqPRKQANVp0GIKebbeozj
         1fHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT8ycgPPKiD3g7R22AfANrmwMssDgoHCOevjrATZjAU=;
        fh=/4ny1n7CDVvZPfArtKUqtCC3nLN7q/xICijkcomhlcs=;
        b=rEA+lRKQAD//+dh7bRPoKDusQMQuaF18UBgJI81tdfb0RhU/miunNB0bhnWOXk7JlS
         QxrWR4jMKvPtEYmfwRGbX2EvYJgthJlot6HKuy/+hJcNkn23mfjzoelhKaeLldjab8X+
         DeYDQ2uv40nSX8mnLrYp8m5vL+s1zHEh2MUNmaRBmjOclqenZQgv/2gitaxx6Ufnzd+o
         z00X1lULLsEpKGLJ6Gul09nscW4c2jGKJAVIgnAMH0cj4CDGoa5GGWeedIRaXVe+O4J/
         6GrO2FRTV2Hwzq3LYJmkyXyoK382agpcOYkmIbdQZIS3k6dO4Ct9Rd7IEAkVH7Id0MwX
         ul2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791215290; x=1791820090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MT8ycgPPKiD3g7R22AfANrmwMssDgoHCOevjrATZjAU=;
        b=SeIVELElWPNX3BhSmNmsQkJPhVTv5HVLRuMOp1+tVh1f+pSzRz5p3NfUJ7DdFHHSIu
         ZNzTpNfSO6ta0UCzjMV1BCmofjHl6sgfr8JfrtLAkgvXrW2U0307ir+A+JEke9ogSeiz
         QlSAmwz3A5N2rKExwu/BUoMTIHLKueoChDfyMQA2DkVwWvw5t89hel0Ur23HssrlO7q6
         La24Rn8L39Z1S8a+VYrrnrXRT1CNcIOO0loYlBBxMDQylAqtLJRrhFT+gpeSmICr0ZPq
         U07ZTzaZHMEJa3jz7KVVU4wgKMpu9qElzsPRR478fhj8825k0KpfKQv3QTLL7PKSuSyz
         tBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215290; x=1791820090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT8ycgPPKiD3g7R22AfANrmwMssDgoHCOevjrATZjAU=;
        b=AdeCSdKUJOufQtZ5L0J4NqkNa7buoxCnqSiOYeehFCRt3NmFa+oi61YmaWkR7HOuf1
         uFj7mR1OOxiW27vAW6UGtl06HgwPXjpmYkAFqbKN67vAyspuEYJhUx0LO7SkEywbv+OR
         EV4cdQu92aYBzdCN6V3M0/tFQ9gMyZgwyBai+5buIYJX7XB/D1KPGRRfZoj3TW7QKKCr
         +pmpM60lM1Uqt+epxGFFrlCifE8+gKBY+HLG/eiW8Ccy7N8oyavg4n/MVs82gdEswAJP
         9bTR7dogRaxdrhzf9aXIWis2eCC2xB2dPJjD76eWE1QXF9o2l7iWi1AqIiyrhlZbfKtE
         kR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJOP8+KHhTt9WOJoWhoeqfV0XFuBAhQUpx9mM61j0qX6Xey1S5INBn7yRFOjq0BWmd02SbWmgdvCv5vQM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksF9th1lO0qFlzM1lO27CgyngPTogNg8WrU9/3MID5OEQl+aTU
	AGqi4bxAnDzidlC9wlJ9iEpmAoXgdQhV7zkqUuWOZifQrwykECrvHLuTZPKPwwNNIDX035qgvV4
	YRRxwrtzbS1vQsuVIc/IYdAkbGPigcIly5vn8EIFZJg==
X-Gm-Gg: AYBFou1oVtHEk7zwmicltEGjSoKrPt4nt/i2q6WJJAFyK5gY4GbeljHoa4vOdLgCdh7
	eDr/TJXhaHYtygVT/VYUwb1Kmh8px5+HCMHv/6EZuQvLaU2bfygG5KDdD8sCAUcqOMwKkkV8JT5
	cgQjm4fs/UJAnTq4Z8uqJfZ4K5Nb1T6Ljn0aAoWP6Plb3S32zRYwq3XwWCrr1q+Do8+bLi8Gmdj
	COn6ljIgNx8+O0Cv+A0p1NhUEk46AJXvOU4rVwHzc76s8sUMgV4Kuk6qQXOFqb4LS9viLnGxelI
	Q/rJ7m/ks4xUDz3wTSHD48oxqS4cPOzk8/QSt5hq6GehrpbsdLDoeaok/UZuHE9kFEpksWjE41k
	J/RPdyIashqR6jFqqQFw=
X-Received: by 2002:a05:6820:150a:b0:6d9:ea50:f44a with SMTP id
 006d021491bc7-6df357418abmr8292012eaf.64.1791215290453; Mon, 05 Oct 2026
 08:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002102447.148835-1-bruno.produit@trailofbits.com> <179093698536.1402591.16703491801413392699@kernel.org>
In-Reply-To: <179093698536.1402591.16703491801413392699@kernel.org>
From: Bruno Produit <bruno.produit@trailofbits.com>
Date: Mon, 5 Oct 2026 17:47:59 +0200
X-Gm-Features: AclHuK_EjtDLkxbH3jFds8cqgFV0udpfcmHoFvOHa6Bnt_BLajOkWE2xSjD_Z3E
Message-ID: <CAN3w+PN2rf9eg2h3qK1yc4bkvDHNpuDpKoo5nBWUQG=gCQ3nyw@mail.gmail.com>
Subject: Re: [PATCH net v2] xfrm: espintcp: reserve partial message during allocation
To: netdev-bot+sinfo@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
	Kyle Zeng <kylebot@openai.com>, linux-kernel@vger.kernel.org, 
	Dominik Czarnota <dominik.czarnota@trailofbits.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, we triggered the issue locally (KASAN warning in this case) with a
poc that I can share. The (shortened) output of KASAN:

WARNING: at skb_splice_from_iter+0x380/0x7a0
   tcp_sendmsg_locked
   espintcp_sendskmsg_locked
   espintcp_sendmsg



On Fri, Oct 2, 2026 at 12:29=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
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
