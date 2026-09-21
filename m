Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66C448E0FD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005900; cv=pass; b=fC1nF4zD40GA3MRCy/zizxjPjnYadFbu0b5IOAyb+Psn8DNpbSTHek1rZR0rephgwuJYxwNFPFTDZRbNkjIRfroXetHtIY7ctRkDdlOW2OlQjxKjTu+jH1FJTVi0NCYLUyT8yHAl6dTra0Ctn33DY37AKRjF1VCqjK98fWRm43c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005900; c=relaxed/simple;
	bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmQ4xGXBaZGF7+FuJ3e10+/FoUqezLOgKxhm6utbX4L2T/NuKG0DAdrwC4t2F0jdPfwsbWQxQPQ8+KTLtjlyVnJ6Je648+7VJfk9z2kW1z2zK7stbM4+AwENXnjXlpOuL3OqoLuPqlinCOwhiXSl4nsZpC+FfqHNFBRFtUlknBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F1/VK4Mg; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F1/VK4Mg"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1883509f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790005895; cv=none;
        d=google.com; s=arc-20260327;
        b=s8LLzcaRyQeBk+M301IVru2kXrJuDAl7R41Fc7gTD2bV5eejwBnDnyfPaWcRCukXib
         w5FgSj9JDrZTv3sTZLudZ5XuD2oghcIOkfm/IMU+7TxN0HcBkAGgpZ6G5IhhspAY+sam
         4KZ2zc+UqozfIaceiJ5pt4u8STh7aljaMW14lkO5Aor/PggwUCsu6dpWmzcooKn0kTTj
         eOCG+q01jqqcz66anXsC4RSu22kWAF129ZGTXYZogwHWOrlvfmK7X+ZqtqLpjTO1T94e
         C3GGELrbioD2+f7i0QEktcdNcjzXO93AQjG+6w4cdkXI2PqnOYJRR5dmV+yBeZqom15Q
         M2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        fh=6YyOFsQnTFDQcGfsF+150+yeFhUquEuGde62+Dzlpc0=;
        b=bGL3EY3f+iTD0doBucUkXZDS+wHWMIMtyBfTKwCv6MgZ1OqAxy0QM64j1g8PWHE1Uk
         ZO1v/o3DbHcMHp6lIP+dmdy3koz7BkfAqjrCBR91WdpB/0SCFcn0EmMqun08HVwBKb/v
         rewvwfLu98TUIQUZWh2iSFMaAfiPn1n+EiVykdx4vltGc32TZ0craB/+9lfJyXNBR/eO
         zwBPJaH1X0387KWTu+3+PGCaz1TN89eW0Ld9vYwjEhZGjN1aAAeMeD2vsY9TA4jqLcr1
         nXah+lFL5AFdzwKp3kIZhS6a+3KCpScj+ejkIyAtTndOfxkF3fytejTCQ1MK8hzfv4sa
         lH2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790005895; x=1790610695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=F1/VK4MgaZmDwKwdliXEQ2wCeHgpdPbdak60ZWI/JLhP4F/9ZV9xc2OldpG6QJJfdJ
         KTwTVCN4eV9go6x0QY/u+uAEJOPrtjy/wGkdp1SChfYn4OvsXm0K/XWASPIA57mK1qCk
         DRfMpYPjfFTM7+kQHIxeuCCXAdIdacDfl5KvoyhfgDEQMwYbM4M4kJJMsmwwE7za3KAq
         iZ4Bm0BYMuv5+hKWlCIL6YCL74ckJU9DsOwX/LMM323alQ2v2uVy3j0JfFQkSvVKH9vf
         9kkg4wyHowkQgDkPujDsI8vIJEk9MbHIEAzmzJtVi1a47gZ7MSF3l2PR/DpnTT5gKm2x
         iQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005895; x=1790610695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyrUFgqXfu0ofdHfm2SSMsMvSX7HuRFs747GQWLnSOI=;
        b=p4OubrRZqSFOfQtuF0yr5nYOpUOQxIx1aIN64+cY37R2/t9Swnen5dBThZKWmWeXMp
         UtvPaQSsX3NM3q8rYfHqmCVx1KDHYtLpLj4U83SZHsWIlMSM4QrIflBmpGU6C4MWlHgy
         M+vvdTrpuJyeWT/vLp/kJHT+SANoAoGOwA5+83WrKe2pAqg+VAdQh/GWFXodgNdw/2Ej
         JJwpfeYqzbE1jdE2mwVcztbGCn/CG31frFE22zYZ0dT1n4gJQNjVpXYwtWQ/Sg1X4NNm
         KDNRp6bIUl5FrQ/y1x+rYq69oE2uaip2D1RBjo8Az+l3vMp8M4SrCgQ6nxqyXMSJXqqh
         JfLg==
X-Forwarded-Encrypted: i=1; AKwUvBw2/WPTgIgVO8dSGq7sCr5eGV1WRscrjDjOoMOKyJjrsLH0r2Dn2bjm7gQXiX9cHWsIYL/zld8eCUqK4cY=@vger.kernel.org
X-Gm-Message-State: AFuF++k84FrwzD3H9uQ/8Boj4O9cuPlwLE4ZPJBzBJqB5wdWRgnf4OrH
	UlGbVQ8F7OBzBso6Ck/jE8JKKl2dLrQleRE2k3Vw6PLbyEC5DkT2GMsVn1xyrduclV9PdNHk9gc
	gurLftssf2BeCRTI3kcsRiM/Ek9hL9rURk+do//Od
X-Gm-Gg: AYBFou0FU3iH7QGyBFqviAx4c2UEO8Sj6QkdpOAid8Axem/JxCKaE4ot7NceG7ZDpV0
	/W31UKfSqNuxHnd+7ObglmgBFl7Afrh86Ax4Uj1pai8CoJfktTW19yciNTQWMwVFw7RbVMGv9gx
	Z9dJtxcs6HcLzp2pg+7qLKP2F2de6HweqvVnNzLWIpMqE4ktb1ZaBx1aVVpKfLgh0/sc3/0GQFi
	kJNEvPUjAmE2FfUl9l/uVxyj00Uc+0mrb3zMCxitT4JUVLI0m96GUwWA/TFUMqfp51QflkxlOX3
	ZLeI9Tdv0MSvxFxgBxL2QJO2L8beM3ivvAysJgKJZhC1KUpG82jWpUKZ+VC+7nkrdgAI/NAMXbP
	lhvh/BCF9+8VBFn8cu8xz
X-Received: by 2002:a05:600c:1382:b0:49d:1d7e:4085 with SMTP id
 5b1f17b1804b1-49fc5750e24mr144662275e9.22.1790005894477; Mon, 21 Sep 2026
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com>
In-Reply-To: <arFPKcA1RCecTfMD@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Sep 2026 17:51:22 +0200
X-Gm-Features: AcwNN1WhcitqwBWirpcIjWt4rgRy9zn3sgw8vKnw5ksshoQqpBgQkPX-PXAUSZs
Message-ID: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Brian Masney <bmasney@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:37=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> On Thu, Sep 17, 2026 at 07:10:42PM +0100, Alexandre Courbot wrote:
> > On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> > > `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> > > argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> > > checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> > > each panics once its argument exceeds `c_ulong::MAX` divided by that
> > > factor. None of the three documents this. The panic occurs only at
> > > runtime, when the argument is not a constant expression.
> > >
> > > Add the missing `# Panics` sections stating the bound for each unit.
> > >
> > > Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> > > Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> >
> > As we just discussed at Kangrejos we might want to harden these a bit,
> > but meanwhile documenting the behavior is indeed a good idea.
> >
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Acked-by: Brian Masney <bmasney@redhat.com>
>
> I assume this will go through the rust tree? If not, I'm happy to take
> it through the clk tree, assuming the rust devs are happy with this.

My understanding is that the "default" way patches land is that the
subsystem also takes Rust patches related to the subsystem, and that
the rust tree is a fallback tree.

Alice
