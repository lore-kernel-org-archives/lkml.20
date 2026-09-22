Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3A4A5C45
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057297; cv=pass; b=ag2y8numfpwkuiJoUpUMy3LR6XAv+lKkF7Ms8rQ5vKXSZo8XdyiBr7WZbbWmQfcTuZpBe1f0L6autKR/6CtG8J+RASrpb0l/9fibtgA8hFVSVGVAG5rJEJcwMvwJ9GVN2PIGdlaPd0W5GyAeGTijvIDtkyO5pcRLQo/0s+K+CPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057297; c=relaxed/simple;
	bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsbtSUnRS4UdVyTbXehjUtg8yoNT7RZ0xmHDkvl3KOCwm4ollKCjCmZa7GnutmhK6t3B45p85tcHfX/SBTNIgK0+Ajgyb/VqN8TpGzPICXKjCntNnw/SNf7jr9rt328CrHW8XEYRLff+gHgyz4LL1rIJL2P/zEcKJxvNQqduq40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n7o66xOh; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n7o66xOh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so2619453f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790057294; cv=none;
        d=google.com; s=arc-20260327;
        b=jpaRG6CfWMeIw60HFwb/YWzqXK6FtSnU+J/rrrEbVoADNJ3TfW7yBTppRA4ALJKGqd
         b4dLUUiv1PtmXX8gmBsm3ryCiJ7Ift6kvyBASCdxzdsomSvSDJ6sz/RUr0MVtX6/4RKl
         z7vuAA4poPPhAVAYJS/1yghTF0fGqVOJJHWmEbpEGHih0dKo18mG+2prPxA+CjnQWr0C
         BWNDaysC2H25lMxA95ayysERQGEsLlVgqDUY1IPRd7dZt/V9K9G6nX2DYCCbbU4/bbr2
         oEbr0GcJ3D850KTsfopqSl2CrpGeI1GQs25eYnfeJedwkvuEt0TN9mTLCibJbav/a9JP
         hZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        fh=VAZUprE69jNJbAgOLxY9NnqrnLIU8rzlsFEcfvpQHIk=;
        b=mrSpdQT4t2twwTuhoTONn/HVoAvNA5bDmq3CFigHX2RQwQMsNK4dLisJNhR5fDdhWe
         hBkPiKJQe8Ch4SIqEQ3/kCZGpXVSltHp+GDiqkZXhDwBYBxH9DMHrcfS0EPIkjPwW//a
         VsxwMRTQkPnQY6O7kLNqws36oo8nYh71EnGhD6MEBIsZ6PS4Z/03qoSG02Wa5n1EvTIi
         sTqRGLBu+oyjB16Cl0/gzltX2Qfe/v53AsaClZVdKLIZxaB8m4OSBtW8MwLNKmyzhmO2
         jcOibzCxXZNM2XPtR38n1sUajCqifEu9WZ3YraYav40KpzuAZyGUVOpYFFN8Ie76xcPj
         WwUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790057294; x=1790662094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        b=n7o66xOh2geGJFF7Egtfk005j/bjOKadlFXEBURGCGMidFQslP4iu9WgkJvRvumiDs
         RakR2ENIuIL0rYsQwTvD1C29WM7j6xRC51h4uF57CJK7q5dAe9E0QvQpvcOz54lAmXNl
         KSg6ePpcIUht32HnH2+OH9kMqhtg3IoISWotL9EkGvmcDa8NyC1d1izUPcn19HUGACWv
         AVW3PD6cfY4T2iqSxf3RGTFU2J9ZLdl9VqLoJ259LzMuzEQ4HpChQeXLEGX606SCGcOC
         gbhkwSlvP9Tcpv6lVQsHUzdMa8mW1f8MnLWnaJa0gIV6goBVkIkkZTmcMGeUsuxnm/hU
         5tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057294; x=1790662094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU4+cJqD/nNdngY9jcwbIF3YP9+U3EvgKauYeL8nv3Y=;
        b=vvlVtR6XP6ftVsfy0yHzKVp0P96BrC+6vpLrDbQkAFLg5EYK5eE2+TVdgQYrvTYalL
         eXBIt65Et9an8TGfN9xbc1IY3WItc/qY7h/G2FwaUD8DnrkH0LYFfoFd3xQR1XbeXvZ1
         uY7SzABV/lOA1Je0iYd8c1kLHiopBk3aTwJOjWKacdyRVr7fgLUerKUBtgUyXS0DHbIX
         tl7HOMCICuwcVfn8ccaAeNMpBstd+vTaVDPWZ+CSUqhktqAN0zlm1TUAut0VSEBHMPjI
         LuNyfHFPAVCwucFlNEjU7FQcNxfs+6QVsdMQy7ffiBk4ZmjvH3Rp/89sMmoKmgfhU2mO
         GzXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx09XSd36uw/Ip1xe+8FJcOSHtmOegZveF1mSyAxZNxk72FLMzDEC+yrVa1VtY2y4Gi/e83yWTYFa2R+Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++mJbqP85hOfZ1CV3/l+zFl8LcfrBsCqrZL70XOX4Vek9EzaUAyR
	Ilj21LE+mzigm//M5Gvi4f7ry1x5YJhH2BEf9KtLNPQqL1YKL7543unZx/bb5wvR3szpd6DikiF
	YG8ZLDJmRPpgyOwakvU7nJFbQu4jniBp/uAL+YNn6
X-Gm-Gg: AYBFou0YGObXE17Zfxw4szCntPhYCVsJeG0MY8fJVi5MuqWsRYwxsnm9fnsn0CCRSpY
	gWYvn56qY3dFH9/omQW2kcZ4h+JHaggCi9xhyJsF+WOC6mimklEIvItk3Tzk6O1inCKArzDnc1z
	8yVc6UbkIOEB1XfbE3dhT319pq4OcIJMcS2/bm5STReUNJGso8ZHXcnTrtyLw9uahZ3Uhjj+Jtq
	/Q6xLDkLFXGZln6nwQCvL1epmSksMZrLW/Lx5qNnGRmH0fVVr4gsDEqTOYmSSFkLajy4BTsE+kp
	/h4uuuFJAn+JLTEGXbQzJEVa+iL5JA+bAcNi/JfP4oaPrMylNpx5SPe2PRFn4rWPNkppHLxMdnp
	LSl2tta2ZtcV4fAwZNjBgfISFC8L1FHw=
X-Received: by 2002:a05:6000:220e:b0:486:ecc3:2d1a with SMTP id
 ffacd0b85a97d-4871e269d01mr19262668f8f.31.1790057293398; Mon, 21 Sep 2026
 23:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
In-Reply-To: <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Sep 2026 08:07:59 +0200
X-Gm-Features: AcwNN1UppsBdP80xwxwz1vqmCSvIj2SXiUZijx9yJ0g1QECx8Yr30-wQ14vxhbg
Message-ID: <CAH5fLgiCrx=XkMETY8eCMTXwpCJiJRGRkdujR5WqQfd=GVrkUQ@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 4:31=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me> =
wrote:
>
>
>
>
> Hello, are there any updates for this?
>
> Also, I wanted to ask is it fine if I keep fixing stuff pointed out by sa=
shiko for now ? (I.e pre-existing issues pointed out by it in other's patch=
es or should I ask the original authors of it first ?)

You already added my Reviewed-by, and I'm ok with the patch, so for
now we're just waiting for netdev to pick it up.

You're welcome to patch things pointed out by sashiko if they're real
issues. But note that sashiko can make mistakes, so if you're not sure
that something is a bug, it may be better to ask first.

Alice
