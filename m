Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794537715;
	b=OYexV8t9VN4Md0hkXhbtUy7LNmHJdkoK5g5HZh2cbOaHx47kdeSHvEzRVbtNBB9/ka7t
	 zd082xUS5Pm1XadYHwQ6BsMU5jFeBVwS+ieQNxx6QL7Eu5H83Tqdt/e3HrbW6EO3dcynP
	 XNVZIBk9Q6ZYFqbAUkzNK75mYM08E4Km00sfkJPGQrMkvXHyr5Ftt8TIonG6RKI7ViBvP
	 pZMqqfzI275RTQBMh9I4CFtRUwOs3RSWG07Wq5vlocrRpImHDjU78jpaY4kBjJo/joBaf
	 TwZvenATjhds7/mGLV4nH/BrnKWV5I+b+iSmGxghJ96zyew/fhlcod79VoFr4bcgV0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jAKaL6ziK4SU3uYWDKIwk2j64mElGB9GfkW4ERNhraA=;
	b=W50x3HO6JxtHQwPV2hHBRbaJxDhgo1C0/6YWMG21jL8gl34rfxEjxZpDWHAqgFR5foWt
	 pMV2tWmwTdztenBqsq7aFTIfTtowhzqZCFo+meFv6k3q3pDHLXSzecNL86tTiT80wKj+d
	 UFjFxIiRM2BacopodXmhea5mxw3gNg/n0XIDt3m6z4AMZN74PacXYHd8/DHEBwIuQkMDo
	 B/m3ijqPB7v1NkP4Bumpf7dFste3ASYGZpc/oKuGDN3ufmehh90hQhOe4G9owgdKprBmA
	 1jJ969gNXywe8957a35UkRuWBYEtUX75X4UVRV8Hcn3XImr+R8RM9C1GqEhb8/sNq0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XHLr4Ebq;
	arc=fail smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72E60A381E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F72E60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=XHLr4Ebq
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2eb18f4da15so2890025ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794537714; cv=none;
        d=google.com; s=arc-20260327;
        b=gDunNxQU3X+4DDT+w+O/eLvAGkKfXqWAEDwdU3JJzzH61K3+i56LIGqpve3dN6YbBz
         FW/sbQA6/oDpJBlSsHq8DITJyTPKG3nLblmTYVELjayyyHlShT6Xbwuuj8gkGQ52oTKP
         zGf8arBNB8EFIePtTzUk8QHkIzdZBxAxK5qBU8TwVYFMh9EVVYAetU576RuB79Pbhah8
         k0yI55Q8l6XVcbOlerKC0dFHBZeUUwBdFKGg56yOcI7Gc5reLZoafPAQfaZfcWT7ofGZ
         C/Vhim2k1Ny6COfLVphajMBvLwtrOtV+NmrziW/y2sHwKHy7njVg7FRxIe596TB5FHEY
         xbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAKaL6ziK4SU3uYWDKIwk2j64mElGB9GfkW4ERNhraA=;
        fh=0fAyyWsWhpBIHdMrCtlIacRdWssbRKA85BpPHVZe6to=;
        b=SBX8c/1DEZ1b9u2reQiYhLpLaGY4Qd21gtm2P0YcFCmmH8DBqBGMRnQKLvfXiBxxfh
         69W1dZMRHJQQv384KXaxyRiEC8xRMsJ1M7da8HBz0zC8GD6vGDE3F/4ukSWO8azhQuGZ
         tEWOHuuh91UtnvJP+DBI7LYEk6Y+IzVFWV4dQnQbcaGKDM+NHcSBWsRMgYY/Z79ZcVbz
         5c6g9F6w6mF7CCef2Et8gl9kJ1VhwSAISi2r+A0iavENKiq5jMdtTxodYQWFUMkpVCki
         rrJMYV2fP8wUhfaPuK0rHmFTxJz68o/sa9YuVLiVXJcmNsLBMUPaF55erFL9G0TYjsy1
         +iXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794537714; x=1795142514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAKaL6ziK4SU3uYWDKIwk2j64mElGB9GfkW4ERNhraA=;
        b=XHLr4Ebq5HLkuLIfnhLPMx5ugv3Xsm/b9CrFFdTNc381Y+3R1DG4UnRb4SMJPUQX/n
         ngfxcKauznwrSl+fiVyaM3bmGu310q4x/AW/f3Lc1H3erul5CeL3GkUWaKn1XIzycPHJ
         /AuCnAKHKKJm2CvanqMb5+0vOCUszWF6CrEtpPEplUMnkh91rwbKa9ydV64YPao7WsjL
         SFpGXGF2hfax3ktt0+wm6KLqAKWnlYXyAi4lW1tH5XZfmWzxV87bVyx0dLaLu+5DcBTq
         26XqL/EzUksAUVuk8gtZa5J5uFcJwdPTdamZ50XBjhuQzM5fBCo9EFZzKbEa9ANC05eT
         SfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537714; x=1795142514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAKaL6ziK4SU3uYWDKIwk2j64mElGB9GfkW4ERNhraA=;
        b=Gze7h2Pg1Tqrk3R0XVqODmAqmfm5TnpMWqgJK4Pt2jivrx9jfWOL84gOkyRjw2jXmb
         rBHdPjpCP6HZOt+Pl6D4Q7S38Vay5vxFiU89QDfR0YcdVag4UP5ny3TTUT12z2hu+Tgt
         w/KLnnQCzXSxcyR98wYq3+CWDBvK1TZOgl+3jmnSa/MbBzbl9AL1yToaSMXRJ2N1S0YR
         0EzHlM6NrMt1T4GUxH+Y7UMkMqAyHpNmIgXjuNpgvxH/QCceJE9ci3zK/PVNny87LrC4
         qvz9xI00zDT0BXoLyH8/IWaDMsoPu1ambUAEXoj1awJ9v52H03IiOSqOq9BDnmZ4MM13
         40UQ==
X-Forwarded-Encrypted: i=1; AL+hErHBHkT305TLol9479n/oANjF8TIx4uJCgnojkRIlEvjPwuW15FRfeJroKFAuD2XTS9/FdX4YC12ybY7TCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z87C4rMQGLY1liq69ucTGs++JO1MulEiADMMyiwl2YQu84KfGQy
	0ITOvcMcZGBI/ysmcJYDgZpIsDMzRO4XH0JFAVpUc4u3MUvBG1x/qgLCHFQ00VL/1t2BmESOY7J
	dCZh9xNq/Y5zAwsrMNu00ITz6lKX4v9S0tUnKv1bi
X-Gm-Gg: AYBFou1hPEQ7t/q0FWqzeXKZCFLANXpTs9aJxylrNigbIbG+7YFmNDE+qYZ17UBzEaN
	iEAigcNm42D7KYqszYTv3DihtdiyuRAGhRC6XdxvWUBEraFmtVUd9EvmT/Pc2Ldgniz1GKJ1y4k
	xhN/NrIS5S7tGeVLTrL7wzVwgwvo6fHWVtEUUpp7V8fBj3O2FwehdaIwGIBgJ8GabpTv7YyzagD
	HaU08AG+S7D2VNqu8KdfqjNIrTGYyo3JUD4yCLUEj5jPIxqVfmslngnAadxlzuQoZRIku3DPmus
	bL4n+8DJDzpT8d0cmZWlUMJp6mGaicN8oLzoeZI4EMbnO/YJaWf2Tour3C/V+LtuX3lGQqePY1l
	VIBe2doo28mzcvJpjP6/MfshY8+EUWCDTG++YPrarpkUlPkDOYxlD2u+O5mTQvie+Jf4v
X-Received: by 2002:a17:902:d58a:b0:2e9:9a19:c43 with SMTP id
 d9443c01a7336-2ee0dc92381mr10406915ad.15.1794537714397; Thu, 12 Nov 2026
 18:41:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <d85ece6e-27f9-4d9f-83af-4101bc76fef6@app.fastmail.com>
 <356db94e-f5d6-4fb2-839a-b97aef72256b@app.fastmail.com> <CAHC9VhR9sjunJRnM9gy-BkBZkapQTrr8a8FtmaK7JkAmUqTrLA@mail.gmail.com>
 <CAEf4BzZKmn6g0SK8OddjKFj_vAmZFvpZv32Hs_S+GHgT7VNfrg@mail.gmail.com>
 <9d6bdc31-e57c-4187-be78-29d82471f710@app.fastmail.com> <CAEf4Bzb+oYDqO20v4YbJ45wdtcGgJT3xVse822P+=oA7fpFAOA@mail.gmail.com>
In-Reply-To: <CAEf4Bzb+oYDqO20v4YbJ45wdtcGgJT3xVse822P+=oA7fpFAOA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 12 Nov 2026 21:41:41 -0500
X-Gm-Features: AclHuK_hptpm5wmZcDCZpYaTcjHynA9uzBvoUM-dSQMe8mTEMVFigRMkrd49BmM
Message-ID: <CAHC9VhRcT3rmdpeadwi2avhwvr7aEZYStZ3bbEEx1hm=wtBGhQ@mail.gmail.com>
Subject: Re: [BUG] bpf, lsm: new first argument in 7.4 inode hooks silently
 breaks BPF LSMs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, roblabla <linux@roblab.la>
Cc: Daan De Meyer <daan@amutable.com>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul.mabileau@harfanglab.fr, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:00=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> On Mon, Nov 9, 2026 at 7:08=E2=80=AFAM roblabla <linux@roblab.la> wrote:
> >
> > Hi,
> >
> > Thanks for the replies!
> >
> > > LSMs that need to provide a stable API must provide an abstraction
> > > layer between the LSM hook callbacks and their stable API.  The LSM
> > > framework is not responsible for the stability of individual LSM APIs=
.
> >
> > Understood, that lines up with my expectations. I think the biggest
> > thing here would not necessarily be stability guarantees, but rather to
> > make sure that the eBPFs fail to load when the compatibility is broken.
> > But that's probably a problem for the eBPF side, and not LSM, I assume.
> >
> > > So, in short, would it be possible to send a follow up to Daan's
> > > commit and move `struct mnt_idmap *idmap` to the end of LSM argument
> > > list?
> >
> > If this is possible, that'd be nice so that we avoid this breakage in
> > the short term, since the change isn't in a released kernel yet.
>
> can you please send a patch proposing that and we can continue
> discussion there? please cc me so I can follow along

Considering the original patch was submitted, reviewed, and merged
with the BPF LSM being the only user (none of the existing in-tree
LSMs use the idmap parameter at present), I'm a little surprised this
wasn't brought up earlier.

Beyond that, from a style perspective, I think I prefer the idmap at
the front of the parameter list in most (all?) of the hooks where it
was added.  I'm not interested in moving it at this point in time.

--=20
paul-moore.com
