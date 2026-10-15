Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25C542ED9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080940; cv=pass; b=jnvqr7nKHyVtCj+bZh9592nfqN5YNL1zDhlgHmfMFzQmgmlYugnJb0DzM16MVHmn2Xp3+PbtByQqUt4/DF9zMUVTRgwVWUwGsF8UKW2EQskjKRo6z+UTVUdCFDhq+LewyGSD3FEjyPjqRvOSuvzbfJVdwk1p53/a+7lOwmrhe2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080940; c=relaxed/simple;
	bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0bPOtdl+1TiBtdCkDR1LY/iSv6ebuTWs1QJbYgydiwIHMoaypbK7qNHBPZPsIaEErYHaTpwvYelZMYHksEJ/Zr8fcjaXI0yoHF2yohNRZGIAXseeOhPefupW8YIEIbtz937tnRUvL14vKaskp8fKFnFBryyniySEtzIt0dJWR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XutVYcfh; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XutVYcfh"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35159e0092aso638603eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792080929; cv=none;
        d=google.com; s=arc-20260327;
        b=KfrXl8PoR2j8LFG3R5leJM6pRzyS+ia1vmzHGyr/SRJo0EXWxBPXXOC/6Vyly2SsO4
         z7Wpod0pqG5w1mMcwmSfq4FoglKrtN6IhDKsGiWFRluj3OsKDpkKtgCILaBp4RBv+skH
         eqvhHgkEoq2kb1rHHg5x6FJYqs2EPtQd5lNv/3HkiNaJDJot2YnXTOljP2lRr+x5U43A
         f8skkmLfJ957Xa8YSdpplMH8QQt3hI146//U4aKoFsfKf2PG5vSBhYeSO+ovOnLakP+1
         dQHSBH2cQbXav88yQn7qqOkSLL2xOVr+fMYQ6WAVFdKMQlBz1U1otv4JszNNB+mc4HaI
         RaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        fh=Bnu74TydktDmf5DQuSzg733OESd6zc9aa5NT4eaA8Hk=;
        b=MHHuBAeVlwgxhQwCmDxPCbDG5Khym8XzEgoDhfTldCHo0avss3NPJFIus6KxI9on4V
         68YK2fB4tYgKjPyu2WW4I4TCU6rNAnfxqDgoZHnGlbgPdgD24kQn5/E4MxzeiEwsU4IF
         CsFpUIN5bhkhp8UnrLGy6RDQbaqcUMzlKvYna0mM/F/n3A+pTCdLsnpvgBBPfCtkzNxe
         5KoOjDxTEa235WIktgRqkcpDWYC1kACZReXZLcRlXaPCuGzSIGlQhAd3NONyD+jbdWly
         AfXZNRGrVscyPp7bqH1xLBhfZBckheR6qF/Gojfng+Awwcj8gAfWzGft0QNm25+rky2u
         2J9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792080929; x=1792685729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=XutVYcfhfuIwYt7oz3fIbtmTfgpStJjx0N7LF92toIkgvtGcj2MmD5s/cVeJiTxigI
         LV+Fyr3gB5C6KJ/2BkH+cV2QBADoqzCXxAmJGt1H2E7qzljiCj+T9pzzVWPKXWcTQey9
         SIomRRuCS/L+IZvkJRCM+9kgl/OyB8TGUeC0WzP5sNjFobcjxGSGT++Yd/ljP4ZVuCzk
         6iulHb5Wha2Ih86swcKayujTnHVNmYMWixdP1Coo6LvkJ5hM2U5tcLDG6iQeFvIPB+sX
         HLz06BZ8XKlGRVhsDLCkzENGM7IGpoyud+xiLOu4KoFxA5sxTfeTHMsBrODtFe9hRXLQ
         DVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080929; x=1792685729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5AcZOU+pdoePF3JVJGwstAOUQkYC3WUg5uKVwxeFqQ=;
        b=y2tRnxROLwNioktbknMeuV8smnrddC5Lx5Mm8sglmQT9hFoxBsrVElNWyfx/LDAro0
         wGLAreRNmEYgN/kMbS8GCZhnQ4/BIKNl1Ci9Zz2z93Ef5uuq8wgk6pnyuCczFVMRbVFi
         398qpADgzz/N3RMrLItwpnDlS3xDe2jzkkuGoXfmlGtnwla9VKgXmsw12jOKXOtM63CF
         wmSdIWfmS1GQ3GQa3UUCSW/ipe3/2czdBRRJwSP/uxRH/np8xReN2HiyhFCJ2T9emc40
         bb0fYj71OQ1tCj0H7bv1nqhGrrDOQHCkLxwLFH7v/+GLU6AH/9ITPYyUbm/cNkL9tDD5
         o9Rw==
X-Forwarded-Encrypted: i=1; AKwUvBx/ficDoyu2+QKLgq69toboRjbQOmU7aUVESPPCSAQBvuiB1lHI9hcCYfrWUPjzSjJBLgy85JoQTNFW+ig=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8utWPYCXSg+LL6Y7eu5qhLgJsAT2oWropmyEvqZYSlxwXuGRF
	patrzuH40IpfqTfuroThy8rR5uq56nD+D6fdlTiR/u64aDcPnaoqNR63vtKiATrJeVeTFlCN6r+
	wDp0/x6wsH+cppJ2PLEFF77HTUghU384=
X-Gm-Gg: AYBFou36O3bcOdMj2QDtsvCwe4v/bXn0pm7t3ksdCx97fzNKic/GV7cJA1zEZEW1kbR
	duqIT1jBb7tfLeY0pf/JR7LuhqvvyTiDRD341G6mnI+IxdbhMD5gn+cZLZ0kSvGk6x5xL6Ci6pY
	Y9VvJgPKKxg21wyPX84zCNX8lNJUtgn56euM2oEOW78l8TH51H51/WJWewuvjJijYzktDfg0Slm
	HdWFlayP1wBFCaKiwbmUzHxCvvHw4PVnyupyARGZDfUPDnuad6IaK6AzVSDm5HWLmY/Qv5UyluH
	W++HV7kKoY9yMr1e0XfZmkF47qxB0wPPyq/YtA56R704qW+s4KaOtbhHwDRgY8nYB9evl7veFh3
	RKO7UTUaPaQW753DBlBHaItiNMQn+GanFtEvUZ1OxykORcQtnnNaLrKPUpyNYdu4V3Nr8zMNJGl
	UOjZEaG69jLGzbLIro8T0kkECDN1tOS42llsEAbsmmAYf2eff3cJHZVETzXL/0Haw=
X-Received: by 2002:a05:693c:66d0:10b0:35c:492b:e310 with SMTP id
 5a478bee46e88-35c492be9f8mr17514341eec.0.1792080928498; Thu, 15 Oct 2026
 09:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net> <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
 <atDlfUEr-d_sRP7c@mit.edu>
In-Reply-To: <atDlfUEr-d_sRP7c@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 18:15:15 +0200
X-Gm-Features: AclHuK-PjnHmcyinHcDPK4Z6dnO9W7SGIPggSgvmNWFmm386jeOM2Bdrq8WVyuA
Message-ID: <CANiq72m+j4j86sCnKUzjjq8udcW+hgdrnTa28WUWfyFu9qHXDw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Theodore Tso <tytso@mit.edu>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	broonie@kernel.org, ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:43=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> I'm a bit confused why people are assuming that we would need to have
> copies of the same or similar content in Documentation/ and agents/.
> For agents are are *doing* somethiing --- for example, determining the
> correct commit for a Fixes: tag is not something I'd think would be relev=
ant for Documentations.

I am confused -- I am not saying we will have copies between
`Documentation/` and `agents/` of similar content.

I am saying that `SKILL.md` is necessarily Markdown (please see
Sasha's patch), but most of the actual text is in the `.rst` instead,
and that such a split is more complicated than a single Markdown file,
especially if we don't plan to do any processing on it (as you say, it
is mostly text).

(I do think certain skills may want to point the agent to some
`Documentation/` by file path; that is fine.)

Cheers,
Miguel
