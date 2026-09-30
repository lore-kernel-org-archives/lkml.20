Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919F3AEF57
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759556; cv=pass; b=WqIMA8olB8YgZhppJkoncIBPCXfc3cR+KKgK1ciR59swlJpeRFsKwIzPvWLeiPJ34Ic3ub77Zv14eVAhO66b2XaQ6As+RL3epJ33171gswS7+0YhqGPHgnF6tY6jt4Uovpt0tDLtxXQRPFLd2v2ZuQvr9p/G/HyWLxsdUDPcuPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759556; c=relaxed/simple;
	bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWj3+DEwMCfs4aZLRN+y432eM59RxCF95An3szPYNBWWG+SxJa2qQWIGiFHgtj984i8wKVh70S7gZo+YCVd3XpqyCh9Y9wEK75cVkIxw1/byx8rl6FkhfkW1oPAtToRGYktVjcpzFHDze75LxFJK+n2HWaSAibU53wec4iiHMTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePB+gW4V; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePB+gW4V"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso716029eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759554; cv=none;
        d=google.com; s=arc-20260327;
        b=NLQUMxSFcQtAJ/ygih+XG06UswghGAARlUTKMnFjmlbLMpTY3/VOGbAviv0/UvsVBN
         Wo48hG1JKBR1+LVnPY7dAxWbVJHPwvsXk9A9LIP1tHoK5w7YmPPM/CwshfFABbBaCqRy
         /BCHAy01hqWWj0/Rnsn18QhkhX0YaO0tJNjWHI+DcLpoPQpNuAeOiDTUz4/2Ox4cnr2f
         O1fOsuFtAxyAR2njVzTrjjuGLyvOl6IIxCkJcCMfkZNwhgrzQGNsQ9WXuzw2EU/lOPNb
         gMtlvt0HtpLMBV45aNx7CD71leLRl1B7b30XQqzxzLhObvRRxRb2U320BtND7IJGBhvi
         CmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        fh=/OOj9/vsGg/T8bLUZsSijic1u2sPL0SIf6kcmYYbpMQ=;
        b=qM3mnE6T1KL+ND7jwP5MPurAnMRiwNWqV03cz3FSXdt12ary7OC1gXAbh9JqooBRbW
         N9QELrqodPMv47vKoF5AiovIV/yZD+r2xFsrIvjSZqeihkOinuQf65RJvkpsBabmWpDp
         OIQ6cDJJm0MCNl9Cfvz/KY11Tml5LjNRIU89pJ4N2bOlgbtQlgy0WMgB8GHsh7938JXS
         j4FkMR1Lf0rlPHyJ2xArw059qiDYtX5VcctPW7ScQeTEnWLMmq8TxakOcUAWp/DdFLv2
         K+M8O0HbgXf+Yk8o5xE0iOkD9uVg9NEsUDRTar+hFjLtnZwNmccmBLcadkamW3xq0f06
         zR2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759554; x=1791364354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=ePB+gW4VmymVXIUdACG+tYQ2vnxxqlK7nN9uqBBsCs9i+VP1InmWXdWKwAUBpgjTcL
         uzxqri21fLsOfHeRiXgw7q9rEl+RJkYkhDtqs+WWq7+8sZa1bION337dXRakxLR0yv9p
         AYdro6jk9YQj2DOLxZECEue5hsZvtJ3dj77+Ggk1ZVR21Xr7jSeWlp+lNmjO/FXSABdK
         DS+xh9UFdBVSUp4M2oMvnouvwbmrKwLgH3lJoQC/tr14cG3iVmx9jfZZE2dVp2KTDzKh
         fTmtn7/Cdj8uqV3tZcGpOttIgzPeMnXhPlzIrev89ebSmGFPgLmRXW0eDa9B4cMaz/nB
         AHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759554; x=1791364354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sCYKDjhxCoL+MufuJuPd+TE5a5HbHhTgY09VgieO1Q=;
        b=o9ayeoKI0yZl2CGHE5CWQTrpZzMqYxF324//idvSBwLhA8/2RpDlCkESvHRSDMcC0i
         Z/RlpPt3fSVXEnVlr8nrsbE2V3pT/EzchQw6sbjVQFmF7DE26n9Osil9xafSo9U1WDUy
         07oI6n4ouaKiOab82ykeke+rVUJiz7Ru8l7vnZAz3tdAnaik7SbOrHOZFf9OBYucQ78n
         uMKUKqLOXIHCkEddhBNLjpLTF2dTP8VAQqGjOJUbFP7eECXOXGUZanQklPTVBU5PvGpZ
         59GoQHePSUw6xu1FcoH28IWD0NG11bM1LZJ8fJKKO7KAZvVhyLqMC+6RFKgGQ0WqTCKi
         4fGg==
X-Forwarded-Encrypted: i=1; AKwUvBwWKflsveJXWU/sNT+Rss/Oq2Ii+A+P0g5CCvNKP+oebmqD103o87PTp0Xyl92TQU7JEUukosy32ZsoxZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw0Nl7dmSt3JhTf1w36XIYKtw15+IPXaC9sWUuL0tJsTR/amWo
	uM7RuVVsio87fRLNmRxSBcBrdCFfl2OB4CtWZdtVOeiwl5eax4nf3mVHlqyCqp78i3wyNUkKY9l
	anP7HuLYCOllPiKPkaBH23/5HufxBUEw=
X-Gm-Gg: AYBFou3BMUQEDu3zKEk8aIk/hycgy8p5gqcRZLjPWfVCNq7oK6TioucNlGfSYs8mBMF
	szFraufcEuB49YpIjnIpEoidzTsfPj4lRn2bVr3GMB+PKwdfRjwMz+LxeDPmYVAJ1W1t5TXlxSx
	bQkh5YcCHu+xmYfabYhcYhOoQJwUJc6eNY3oOOX0w29+iVcmoQj7m8XbicFwDG7J6aQhs6Q/RMK
	UwCTCOaVinV7jLOPgPEcCSHHYAFBAM6oARXa3PB7H1sMZjoJozHsIBn87Ycoq9uSmD0alJeoYjc
	mVy52MwNcm+XlyquS+KNbmbHyMVny+Gt8+tj6m5PIsW6U3/mcXw8d4c+Ds5TDLmQUPtB2szQ4EQ
	S29udjsug/8FHfbo/zqZ8oN9/DTx7tjpw82oHEmaxGHAlV2A4A2FsmmclxCa6Phq2/O3ALV1TKr
	IhgWFjKGdB5vIDrXmuvsq7xCvZQhlPUD/OSgXMxKTBvDmPKx0dAYQ4nMzcSMB/sA==
X-Received: by 2002:a05:7301:1503:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34cdbecb18fmr1744208eec.2.1790759554357; Wed, 30 Sep 2026
 02:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:21 +0200
X-Gm-Features: AclHuK-0KwyFg0Dwivk-_8qXi4qsCxM4xdJVFSz7hSpIH-HUHIS-SB0FCeiFTpk
Message-ID: <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add some more size constants, mirroring include/linux/sizes.h. This is
> useful for making `Alignment` implement `SizeConstants` in a following
> patch, because these are more common alignment values.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel
