Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1B51AECC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789381; cv=pass; b=fqGWS5ULiopV4sOh3HSFuJgvoPccaNn5i5mgK1gLgSKw4k+CeL85KKbjt6ukymnevXR8VJgr9bNaOvxsb0kU+1fSR3B9SiAxjK3cvDRpteQxShLtjTnxRR0KypvW0+xM6uVPegjW4COFBrL4Hv2MdnxxcANvjP7WUCGm2Ci6hOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789381; c=relaxed/simple;
	bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRMOipJ6Ca4aq8g3E0ujAAJBb5tvWlh2kb7vi+lC2BHKa3r4gXpBdxYxngak68IDNZxlDos0bCcSINvi7a1UqwHDTuH/fpSyoL9QBFyFC0lPx9OoMLq/gRdD8SsKQmPZuaAVXN2BPgz9L1lyeqizNOo4hWYTLMq9vur+EqAPnhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwNcCl2p; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwNcCl2p"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a78129ac98so417931fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790789377; cv=none;
        d=google.com; s=arc-20260327;
        b=bD7Ct2wnynKoxl6iI3XmLIG6bzy+HZG43d8S6DfNsPvo2HtgzrHPh4YIjn9/kOQu21
         8VwyMDg1ReylXdW+jB7f7N6WP32LOHV7k+Vl0Eb4z1ggoqRctJ+Wv+WopXMxJ0o2vUz2
         0Tbl7pQh7Hmv8AJ1SZsaxECWa0UnvE+rRHUapAp1ed+FoS3ic5bCLkB7N/PFxTt4J4I+
         DJCS8bZBwUxJdxEpiP3LGXvcWa9YZDKcqrAEzXh0TPvV3vIGsI1Wonn3OGc/PA4kO/Sk
         YDUcZM/h0AxHvrr2VF0FStKRf4brgFKVlzM7h24VvUq0pb5fkkxKGslUu5joIm+IKZ9r
         KxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        fh=VEC5tPHTPZP7ESbtS3K52pKqLE+NagxPHujoNUYzBBc=;
        b=gc2jTYE5tJC/MbNHBCbXgn06IL7wZy5C9hmbbbYC3YpkcUmrT5qiOF5PngQFuOVgAR
         4bGGwMhZDhh+dNGU4GaA17WuvgA4wiPyEbn7mgCRelrFAqn4DsdojSa5UTWhDu/bFk3e
         kdBl8R4F1FhbPhMdNE7RO2eyqIbSQGzw5qTtgMT7Z3ZEokRcCd3SeXUPVcV80F1og6Sp
         2B9hxn9gPSI0hjZnRabBlnHSruEzqduRXaI8+jvSyZSWBiPD0tL7X32egczdJgJvSjnR
         U8mwxz/qmg+p/5Z4DGtXrsjJRVslEqPBjj25HSBCM/CTNGqZ+yGseegMJByluPPMUYcQ
         /s7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789377; x=1791394177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        b=kwNcCl2pWWE/uXx3vAu1NP1AHobhUSSGWi7JHeV2s9xnMOLHbQnr9O621SD7YE0fFq
         U5DzVVIaNtVKeepX/9Wgq1flBGLdRALOV0goFmpmxL+MygA3K6gOpMB+ZsrBXfZV2rDH
         94mLmEqO2IkRjdEMQ1VWx5nf713YZ03Q0SrJsiF6F7v/v8YsriVDktQ/e5pPs1IIYqx6
         jJ9IojWYJ+wHvFNgF2401c3AiYkwqcGi8Kku+gn3H+4q2uFdPpWXwqP7Cx+OicBW2VEe
         Ls6IFGRIUjHWK6b7Jv0VekQm419WJCTojrdif3rZYIrO0taSEww9xF6Bi+dX+zE5AdPq
         aRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789377; x=1791394177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        b=w9KT1A28J5rWJCNPytKd5akl1CTtBMvPzlL6V995ZIejBPoYps3/7ySrWvV/xqj77p
         ZTysnjUprgiRpmgDBxVSjKXiHsJOsU31TNcUZyEpir1AUtAqBJVvZB0uPrruRqnduqmL
         upDGSwVD5pxO3o3R8kJHk+GFhJpu8C7NrZK5qJLv77U4Nh5RksyvLGav+o95Jw4xeuRU
         +4pcBqq//3pTK0hHdoH9PD/z7nTxWKF97CBAP6vjWhaDi6aOuK5QTrC20418p6abEMNL
         a+NIHzHsOePogqu2K79vGrH9cK1v0srtd5stLvsCTRw//BBePsaa4Q71S/iUw68qIKzy
         hnRw==
X-Forwarded-Encrypted: i=1; AKwUvBzUBYf4qtqkz8L+nb08LVWnV7CaDJm8YPZMD0CtjC8pmhdZ/IaTfZ8gnyadEE9fyxv5va8hoyG8d4Nc9X8=@vger.kernel.org
X-Gm-Message-State: AFq9FYISD7BlBss72FCMC8Ose+KLa3MY9y2ApNqU6ObbLymLpYzTO3ec
	5VXN4OE+2E/M3GiOaIejbBG6ZRggJHtbOgBYPkZ4B3iGn4N5ohEkgxBwE70sP+qDii3J0krk9V6
	bWHz8fA6A5va0phk4QS+ZlylKh45eOWo=
X-Gm-Gg: AYBFou20JHYE1nkgx2+MD4RpdILcbk22HRQrdvKXdfAa/gp37T3odh/WDkmm5BXzXc+
	krwxCW72AP13XmV0t/qwX6ofn8pmdVpJTvAEz+Pvyxp/QjDSMmvBUxN77THhfJQFFEnMIrTvXEu
	fV4dDqAcaL9JvCmGlmnSIw0BVj9mSN+K9K5NlOyjU2smYAV6BJ9AariECbIY/cx5OEV9hpc4MJL
	o5k59FRtF+TL60JqyoFvUo0x508Z7MGgVguA5WC3WwglixhAUQlaWsjKxD5frWvZ3UoCozI39as
	kKY4brvqs20VYlLapDBvrn1vrXXGgzs87nwRfGq+JkORYqNYv8ob3eXQbAW3HdViSI9fwHcXX7c
	9ZzFI81uxzbJXCIEozh4m572DhfubcJRhOvx/Wf/VDNK2KxTsKVIz/Hx5M4cyRCcuASuPgXOpmS
	1+ZK6uvhR355tBJJQ+GnfUPWlZ6P6P79GJ3s/1logJshHCFJHwtlE=
X-Received: by 2002:a05:6512:3041:b0:5b8:f276:ad76 with SMTP id
 2adb3069b0e04-5ba402c10a5mr849913e87.2.1790789377054; Wed, 30 Sep 2026
 10:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org> <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
 <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net> <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
In-Reply-To: <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 19:29:22 +0200
X-Gm-Features: AclHuK_Xq2p8rBQSUUCMyP69x91mRVAfhyvtd21Tz9BX7lsLm5p0ul0jSuGOdbQ
Message-ID: <CANiq72kCPcw-p1auuqvMJgHLq-hto11zgmY2jELBTH=mpZVr=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, in that case (plus what you mention above and the examples --
> thanks for those, by the way), I think it is fine either way.

Of course, please feel free to add:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
