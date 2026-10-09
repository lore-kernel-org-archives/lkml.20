Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B33C7692
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585237; cv=pass; b=meTekGa/yTAXpaLvEnGlMY0nHgx8txoY+nOV8Som6rLcGXHhR8zLiswTWIm4Y6sGhoakfkjm+WPk9hmb+JMThlKMEv0efrfLwLl561tPW7VWUNzpSxVM2g7hPORA+aca8lrvGdqARo5Q/zA9K3OQOVR6NzVEyHwmc4dpJhTeG0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585237; c=relaxed/simple;
	bh=9quX5CnvIgOd2bqETq3nY4+kaqua2/tRKQhSxS2Xq3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e07qca/v4+ALlCYDiBakZYG1sfiJJjyXhfiQy+hYj0A0iKajZcSUb2mihkH3B7K8hMzCgrm2+auiVvoXhBbnoWW4Tv9MBHw3PXG+s6D7EYsRomMOGjGo9W1fXyIFLiK2e6Q8NFZ4SEQtNJnlNQHZCZMCFTHyWTaM2jZ3EuDMo+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD/ymqd2; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD/ymqd2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso290883a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791585234; cv=none;
        d=google.com; s=arc-20260327;
        b=s1a39OOFh1iNEHRZKYJRSRbMEzp7+wAASkzAZfXJRz3lZ7hSWU9WhrhPOpsGYrYEO6
         27T3APnt/94YvwAol7WEuZFmxJdHKpjEUHhsyyAg3aMT2qwTvjk4U4BT+u81Jsg0QLye
         ETqjzEJxEkY03ujxfZKiqmMe1z2y2A8DcPWqgw4yfL7zLy1SYltl5U+KYrDXCJFhcJAw
         mcov8bCXh8a7Vay6Qns7EP1VGOxlFdKJi0Awu50nSoyQS+2ZJNA/0hkrYg7IenU2bii0
         avErZO59l8+FGOSiKEaivE2ur3Ssv4BmKKoCDGmHVxppCU9Tz4w9nW5efqPhT9c1ivZC
         MCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y2x5f8OW9Jzw5234KyE0CilJDEpfG7QLEYaTd+TOUYw=;
        fh=NP/jWiK4/evGD4vYz9xZiQRV+ibLKPA4rTljmWmRwog=;
        b=FgbVN8V2mmzJGXMI6f1ppZFESn6dbxFhcd855hMlp+mPNSgO2g36rEw4SpJd7ziQnm
         A/GIzr1jKAH2k5IRvBu59pMDfT6dfHR0LT+QaAmHb4/dH12gQzTfqXlo/rNmXY+HU4Cx
         SOUkGVSjag2BSWGIeEsOamocbQYTwniyzUzlsXNZ0pkRsldhws5fLD320R76qt8cxlGI
         /k9U/memITL4hD5QJb2x8xRe0HtXfL60iGljPPekcLMtiHIRs+Hgn/Zn4xOZrRPj92rh
         LdcE4ffuc098Ctx6cpDVnvvpHJnnHUVzLHI1BhbcY0U0tOno59HvnZwD/kBvUm8v91Bw
         uTfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791585234; x=1792190034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y2x5f8OW9Jzw5234KyE0CilJDEpfG7QLEYaTd+TOUYw=;
        b=TD/ymqd2VZsqvzs84kGAYMrXgiIsi0tA/PegsHu60frn/DOT1ctF+MiMGTsbyQcTYD
         kQLVASiSGlEMPvWB15cd5iUyNzTfQZlopj4Y7NmufQsK2RrX3CFxQYf52BKSHodzesEu
         fADYmaEg0us2ZEJ0fDS0jp6WlgwgxBHbZCIWMKicO/QiMbNSS4KWjQYZGbomk0PTNWQh
         s+MTM1qFHBgs7uBmGGHLKLRX6rbN1EEvAxcHMRxZ7f8bKEGht1J17tKRdFBi0Qi9SxpD
         vCu6OLUG/PcLRS/FPHqqBDsRK3k4F1BW8hvgfMjdX9M39G1RUrD7yIs3hqGq/Lmi4agJ
         tW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791585234; x=1792190034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2x5f8OW9Jzw5234KyE0CilJDEpfG7QLEYaTd+TOUYw=;
        b=v3DyU4C2ksfuTTf2Wcukg25UZpizaP/NpAsrfhtLDQeLpkybRlmq5CNy7AplPG6L4y
         +Ggg2bAu1bHMaAAOkRUlGWdp+tQRHrlNWMAAkMZMkqYxkmKvcj4FZyaFNlUuuqqGmmNa
         BCTqAks7pIdXclibkzhejsss/1dBgzVaXFfFeB5CE2KnWAjHItEA6vS2+SHnMR8gecEq
         WjhtGnKiM8JMP2I0413wDlsDAr6JUpFAg6ha1c9CErXFKeUqo7Auy1OETB/wR5ED0keK
         YXRZhe9+f8gqIH+cs21yQVFmA6CLIHR55D5dcaOmLoDfAhltH5JQ8BzJoMqK34w3nWkX
         7A9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwmV8BtxqVXbeoq7DdpD20Cj+/OchXaMGq6rCB2/SPd1pZdiIQ81PcRF6Y2scWxsOQNrCp+oNUaBzZ5vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK93tXNBnGTC2VeG8SvvuMHFNuTTkR4FvW7WPyMzY//ByRYQcEh
	rHm0CAji8HcbmxKP3vtt5sWI3pt4W2Cslh0G7ZmZEOXxvdco9cgsK8BDTYH3KNXpt/mhJ2XzuzO
	lyWdohNrg1GFjriEvDcY0ZeI0ERxcuNQ=
X-Gm-Gg: AYBFou03LAsh2//3Ui8ShYb4Owbckg/zuTramkgvHJI5eY4KXhsjQB/iy+sOuf48cis
	tkMQ+WdzJhz7ujT4mqHxqrJPKZwfMC5r8BYBe4sZYLswZVOlVaw/FLq4hjkuoRFRCSTwRYJcZWq
	Z3rs26XjgRHB+XRVnI9jMoPoBZeop196CerOEG+pif3R98BuEQzPkLmmW6LvPJUY+FhTo6U7whj
	NgBZbZvZWtsOW5SYZ/4+AMrPZPQlAm+3dmJTLlquVCZ+/sfVGMyY5zJdO5XzJIumM9wB66CrBmr
	QAPZEQJXgAyO5wBegw6D5xO6EfjoLSRDC20XmAtwtv0/kMGwGSHp0ALydsRTOU7g71+smPxWEvX
	L2wZrf05ajFzNYxc+muR0R4tyh1ynRkU/tIBp6uH7InY+DdtP5vpcRoQCn3m8EBvUZuqK+9z6M4
	GeTbPZamyDpk+53KfYOL4DmBC5mh/iYLG/Bretq7GahPMMuIlX/cIz0gKdX0EeKntSzy0nAbmna
	4LB
X-Received: by 2002:a17:907:3f87:b0:c2e:2e1b:30e3 with SMTP id
 a640c23a62f3a-c31aa00e12fmr387733666b.21.1791585233913; Fri, 09 Oct 2026
 15:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007174449.671416-1-rosenp@gmail.com> <20261009164732.GG83879@horms.kernel.org>
 <CAKxU2N_=H=D0p=g0XBqFtJFHDpidO-5d7P1kKZxXEDX86BGnPw@mail.gmail.com>
In-Reply-To: <CAKxU2N_=H=D0p=g0XBqFtJFHDpidO-5d7P1kKZxXEDX86BGnPw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 15:33:42 -0700
X-Gm-Features: AclHuK--vcR19Q4c1HmMxBuosb_aBRVRtTK0Kor0FuyXWmfdeo3iVtKqvmIrSjw
Message-ID: <CAKxU2N8svLRziH_AYKMVdL0t-ndUfxSGO+=ftekFG0KQFsXVZQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ag71xx: align the IP header behind DSA tags
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Chris Snook <chris.snook@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:27=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> On Fri, Oct 9, 2026 at 9:47=E2=80=AFAM Simon Horman <horms@kernel.org> wr=
ote:
> >
> > On Wed, Oct 07, 2026 at 10:44:49AM -0700, Rosen Penev wrote:
> > > The receive buffer offset includes NET_IP_ALIGN to get the IP header
> > > aligned behind a 14 byte Ethernet header. Most ag71xx devices use DSA
> > > switches whose tag sits in front of the EtherType, which moves the IP
> > > header by another 2 bytes. Every access to the IP and TCP headers the=
n
> > > traps and gets emulated by the unaligned access handler, around 6 tim=
es
> > > per forwarded frame.
> > >
> > > Take the headroom needed by the DSA tagger into account when choosing
> > > the offset.
> > >
> > > TP-Link Archer C7 v2 (qca8k), median of 3 runs, Mbit/s:
> > >
> > >                        before   after
> > >   routed up               743     855
> > >   routed down             660     749
> > >   local receive           554     572
> > >
> > > The unaligned instruction counter no longer moves while forwarding.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >
> > Unfortunately this patch did not apply cleanly to net-next at the time =
it
> > was posted, so our CI did not run.
> It appears I was careless and sent it ahead of local commits. Will resend=
.
I see the issue

A different patch removes the comment:

For our NAPI weight bigger does *NOT* mean better - it means more

so git am fails but git apply works.
> >
> > Please rebase and repost.
> >
> > --
> > pw-bot: changes-requested
