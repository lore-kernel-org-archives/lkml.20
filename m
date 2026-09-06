Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92D71D6DA9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699667; cv=pass; b=Hzu3YdCRoPR5HEvtfN5dy/ZWaMTenPFOTUAwcRi0/VOZy9tqTcgst69Y8GWuUrQtZZsKwj6Jr3kaweLuBMEUVGNEqMrKnB/tpJUzSrPoj7LmUBpxvKye34IsD1i4nr5vVCpd71Zos5g7nYzeBMMukhbCXHMPI+2pSokRlGKM40Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699667; c=relaxed/simple;
	bh=rVneJs+WJWOJwXvR6OJmUMWmzSpYIv5KEdi9g19xTLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElSe36t3fktcwhvzo8OjZ7Q2UR83rkYwiACzcNIDv/Onj0PO0jdpDuAcHwh3Iiv6RZELuzaQn0dEW7D8iB1v44VHdUzhCBsqVo+dURAGToLsjfR29PD5CrbAq+xacbQwJUEsHWRI/3JMp6ul4JI5x6L3ZeEOySENkg+L/vzjYDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4Kmi2cl; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4Kmi2cl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9edso144065a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788699665; cv=none;
        d=google.com; s=arc-20260327;
        b=B3fBIZ/UAqib/THdyUkcReVRMR5HUE/iv7ua2ZvPVw2iMY4dvW2mJsnGiaB+vK9+tO
         IzvpZmlYinecTUJYd472shlYNVC3f38nytryaH77Fmo6uPouUC0lk8pkIydJFre+QLx0
         fqKWkPh6cwE+vFL2Nfa0QR2+Ra9maQWLG8X+dqCkbIO2uX2AYsEnI3BrRG29awC+lTHH
         gIVEvQgtDAkzTTZeCOkIVbYkAj6hrmLoDcIivIwlxgZyqtGYYNBNNwtpdpUn3GRmO97q
         FazqSMRqzOHJGgtuRKKhMdFQtSrwiBMvyRd+3NavVJA/R5Wz37rRltAKGxA2FZTFTpVr
         zvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        fh=RdqWTDg0U+67ni5D8l3IewlTefk9LVVvsxWzYRRnV80=;
        b=HZJj10uFe5QwPhgHk8kWZUNJZDU/jLEa0Fm4crNwQDPQOYtohyUhfWbyZxi2M08MR9
         5NbxhsRmKiMOXQK2/WG5T8cQ4XSm0+AeO3LwGHBVfHGyr45Neru8lPL70G132hmGB3GU
         7wrij36ahvItUPs+e5IKMmTHxTXStSduWO6gTj/KKx2gXpLlK6iMw15bPguQ66YUMvcS
         gN+mLWX/dDvgLgvbQ+3rZQ6l+0E+tHWnNDLDxkcYjy3T888T3hsMbUcJ3ZgP1tjIw498
         P54UnyUOp16HBtFMm8O3UukrvpF11N/8njGInCps/zFabyMEoU9wUtxwp3DJ7U66ka36
         gK2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788699665; x=1789304465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        b=m4Kmi2clIJmAJFY+MQVEF+zCgOsPnL/Ua7tYfyguzIXCjP35suvoOBkEdUntxSAQiR
         YAeSGEtfuOd6vgv9TsL+077cdupS0QQEN2rhLBHIOYNEMEUSOVX/Ut3Du5n1MrUH9EvM
         Vtr8M/PXtM6DX/NgFVC/q67R5nKlug9sGxei7goIjOeUGhpUDBLOpx6FAHB2tYc584wo
         sAx3OpbSO5cFKWqu26GX1BltluKMjd3lSWXcJ9Y6ryRGgURbLVhMcZWJ+hU7Pjsa26kP
         r7Zd3fTEjWWWY4RrE5zR/JfSkvLGLf7du7om3aMK0xLzLqqEiy/lgAlO0/DS6idiTZze
         Dv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699665; x=1789304465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        b=gjb4RIAY38eyyNbxejeSt831dbVBw5BEhQwTfe31GA0Kld6AVekC7OTn2vhsWf6UVI
         YdKMSSBTc31ofnLIPWgvbCJ8FAOncljk17pdHEzO4XvI9SKTlZ1PVM+cgDklXJ7DuUwU
         0Y64V6RW+4ey7NDsbl6OG/9v0gHUka7vRac68tt1a30tmvu4R8AkJaIWpJww8sPuNr4O
         nfNynJUhrCCSqQxw9M1yjOZBWAeCBaUxg4U0wfDcyPt/mvqc8cwO6sw3s2LOn5HHtWRr
         q9ZQp/pJVZevc6RTRh9Zq7ih86tSjt6diiLqVU+6U7EtoAq+pekzfLtLeTXFx30YLAqY
         C65A==
X-Forwarded-Encrypted: i=1; AKwUvByotHN9x0wvcJMbf1bxjSpKIK41Gd7gaiNDXlH5CLZMCYacdJE3tZSmYqngjaIPyXJp++4hADZN5+WXlHU=@vger.kernel.org
X-Gm-Message-State: AFuF++noeSl6Y52sEsxcjGOk/3QzM9Q8twMBwHlB2K6gZrnJQwR3rGgr
	daA7eTL1kWWKeIDcS4rMw6mKBdfGfO+CeJeWYDNNnGckkEd5OpZ6HalnJT1PHksCZCtX2cbmw/Q
	F7KUcSHYu/xXt4238ENyD9J8RVxviIAc=
X-Gm-Gg: AYBFou20uxZU0h479Pce1SYCIFd033RpGUSwdBCW/lX1ztM5NEGQI9iHNuslSgaUXCN
	ilse0iJFrBQBuLvGrkJvztBr2FYLIqt1z8Cx0QvdJB95p+LSt3fe6Z4bpvUAqki2MRnCCHrbGHi
	5s8b/mWkEgKM3ttHjFPqmxcL7pqOf/7Uin3Ar9nSQXGP+E0L5P2oRalaoY91LXYl4N2+TNgUwCP
	TydFDxSJp4YBw2eG9pVRmhksBTZML6rd/oDuiw2SCVzrLo6yEG0zcYN+SFl/PmpDdve3xbrSYtU
	lEqEHVMoJkfO2cBCptdKeLQb9/6pmaPfwdgm968ilsdCGyY9My91cYACseNkSfGCR7ebJf2WvII
	kNfmw0XOYBLg7MRaMulS5oHB3LEnczBtk/jFBV5bSTr/5vUlMgaLGX2KbXcsVE9ES7h5/Tko=
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr10362858a91.3.1788699665053; Sun, 06 Sep 2026
 06:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
 <DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net>
In-Reply-To: <DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 15:00:51 +0200
X-Gm-Features: AcwNN1V5mxKY1nCNtgFC4yCkUEO9yjGCf_R1y2SS7Sv5q6x2ZaYouPFvz1i7fco
Message-ID: <CANiq72kx-YPPEruOFdu-Dp7GX+8=Et6svG+sQtqEmmF7kpnVyQ@mail.gmail.com>
Subject: Re: [PATCH] rust: num: document why Integer is sealed
To: Gary Guo <gary@garyguo.net>
Cc: git@younes.io, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 2:46=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>     #[sealed] // so that unsafe code can rely on correctnes
>
> would serve the purpose. Miguel, any thoughts?

Yeah, we could at least mention something about the seal in the `//
SAFETY` comments that actually rely on it, even if it is just adding
"The trait is sealed." or maybe a bit more.

Cheers,
Miguel
