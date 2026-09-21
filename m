Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC234BF939
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006950; cv=pass; b=pdMndEPChm8flrvcu0sLS5U7RQ6081fxZ369o7qiVH2B78W6MH6cBUG6uRtZjQ+ryd0aTpsPc+lpyJcOsduxUN7gcPRRTzPjyrvUxPTdjoClu01r46zHSRd5EAclflDkzSxOY+7f82+jrVLWQhFmmWfAmNmuRt7uiVj6f2dsY4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006950; c=relaxed/simple;
	bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+HF1fXrmOjlJEdE8BnDILk3Jg8AJmIE0OLxw6VB+oclVhQ+IZMTD18L1pAcbs91oftI1MqP+tILSgLMJRFeBHGJTTx2XnY+eMjHHDbQ2Ng7OtXGW6AfKMvWkLUlIP4iD7xP0uxhbEZGdHFw4134hkSEbFa7RxGbD6oCW7l/gjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyZzq0iI; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyZzq0iI"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d04b1077so84460e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790006947; cv=none;
        d=google.com; s=arc-20260327;
        b=PJ6nzYDy0ms+NPAKrNRgbrh0SED6YjTRCMPLUvzVPodJkStVJvN7TwrSlZtUf9SG17
         HTdyIHNHoBMC+LfVWtNNHmjck3NshE4VeRDHc6ejVnYMbFG2LnQJOze2aPYsC0n9sZB7
         jEbom/oiAoAb2gPUSiT8v/XUS06T8gAaCrQzJLkCYXmtLlnoqw4TeIn1pn9U+lnbWZe3
         4Sdi1EYugpjiF45ayr8sTf97ZqE4HsJoEoqwYZPsfR1GtpV3XR8IzEWvfopvW3CLdp0Y
         vfd4kfsm7VyB2YXwbG4LomA5kwrjuB2Ylr1mYt2rweAkJbIyq7Vsa72h5HIc/fNNbVXs
         ukeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        fh=wB0NICfv+H5e8zyq/1N95x2X6TjBGUGtigZCdt4/78A=;
        b=r5K0vJ25UU+0jm42JTof47LecR2rANJCKDxI87iOS9v7NHTSRg11dZKaXjROywOQNh
         uU0+uiS6+5jnMEez2vn6Y/RAGg9Jy0huS3mCKh8LZBDHfz6lyUX9KDloyUyQYiTomeQK
         vmlR8woGqvQM9sw/jVc8eehB8DmutF6F3ndyJqjBk3E1sBaRn2+DZGCeLpy8r9AXstxH
         BupoLWrc1928brRo9V1xGGZkzMI+hpVMHksegwDRBII05gk7PeRsymjsnOhWbY0obbIB
         yIE/nzr2YAgaKuF+Pod5Opacicx+KITy5FI48PygcQfBtCR0qAupj+E/vhDD1JTxqTkr
         vB2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790006947; x=1790611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=HyZzq0iICYBObXLKZzkAbYdHutJgeMFWvA3srR1rgB9/G3D0DM4o72UNWCWsecRCUe
         +NL6bE5yfhrSDsN32oKwXFadspCpfpFLd1FVlcIvBLJ0Z7zpuKMJivUJvf7NL9x4W3aT
         n0SkrBqDJiMKlMJZ+9Vnx9t1OTZrqlzc6xcMW/Xupzv5oIDUAFLlltcbALfsGedOBKfi
         yx1qMu7wOJ7UgTqd4fu6TQxQ7AYVp7fK1aKSGdhsKFSWt7HGUX/4fU5HgWD0O0HZeGWR
         gO0jA3unzMgTiSzuVz/0MObUlTtmZ5KNhs5IHD6lr5HmeVx1e5ZkHgMBmKwANx4S8EXm
         2oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006947; x=1790611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIjc3MXIEI1WNzfDBHDw6Y+wt0nahAW6usfM1evUcdQ=;
        b=eI1QVIeXUOPWRPeo3O9rjL2kAy+F1gZShycyxCzFyHOKxtWlnASwjYHYo4KUc35hDC
         tfW2p77pLNoKlLnooadnLRspIpM2ebjs5UVkzfcflRKV8E26owXNyLloVE6j5G572Nxd
         Iji1ODSsvM+YO6kh7jH3ZSDFDXsHxs4LOOeK6YwWVLLTqkeIWtlS2s2ygcSfBQSS5vnY
         rDyqcyClh6JgXXkug3xuNLvt9akJ+uQC0dRVekyjXIf/c0AYNLzoKki5QnxtriZgPUrw
         rOdq/GLRmivRkQpNuxd/t4kZKnb0kpJJ/HiCmrtEcNxXWqXDWGIKS0NYAGQHp+Cn72xM
         Xhvg==
X-Forwarded-Encrypted: i=1; AKwUvBzmt24WWCZSQqRBsTozcblebNO3GqcevwUxZ3Ip/25ob9tUPtNqZA2MstXStyeLukCNxZ4sPC3QITnFK3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kX9maY6SC5HA9eCh8PLEePLZ+j+YPCzt6GvoUk3TqopCqGs1Rs
	fwjEzEOzqRowPiyIyg7b2/olqnjXyVZz7QV+awismgUQ04RB4ramGP22DKUboyrwsV7avIhKTj8
	m4hP2OTYy77Z+gOZPU/rN3gAeqHI6maA=
X-Gm-Gg: AYBFou1G5dS++Qk5pJHUVF0z/vx+DCIR72suIqCjat1hBKRlImxK1pm6v9tniSQdu8N
	KZw0fLGnWFEYszXPrUKGqz9bbWR5PRr7A7W9a4H4umk/f7WCu9ZWd+fcxAueIQPJFR+dvQ1Y2p5
	dDlVFCDTPHIH/rgB/vn6iMo2/F+GlzG1lywaJdpP1QqSUCBHaf3D27zn/U42ILZTdw3gNTrUpxK
	IQrWSp5J9DH8sl0ZGlC4Y5rxbGICleCzKugNH4kf+JBB+kg+7qab9KubZxEGZ+L8/q1mOgKHkUg
	4ukHfVJqnQgr3Dz/F2aqvXfcFngyLloaIt5c1kgRNENz9AxAYXGPRh6cBxgIOGc969v28Momb/D
	OAHffgDKRliF52NiFs0rgEBJ2kUziz4/2Y2YrrXmqCOnJ1oiSOisampyHnUbhFI9k74TIaeLb1U
	O9wIqyzOVO+PHjYeFCGgNES5iJUpaZJwGi1EyALKgLxrR9H/2BOw==
X-Received: by 2002:a05:6512:65d3:20b0:5b8:c6de:48f9 with SMTP id
 2adb3069b0e04-5b8c6de4cc7mr1586547e87.4.1790006946532; Mon, 21 Sep 2026
 09:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
 <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com> <arFPKcA1RCecTfMD@redhat.com> <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
In-Reply-To: <CAH5fLggOMBVi3DjQSmLtstnntgJQzDsQjEt15nRkiNi7EuLB8w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Sep 2026 18:08:46 +0200
X-Gm-Features: AcwNN1XQ73lDz4xpLQP5yNOyxGkJdAQw7Y0pwDB52hNn7bLVuCDQdmrVcz_Iz7g
Message-ID: <CANiq72koa5rBohoBg4zaawBUPuhBatGouBzqTWi8djxMaaLacQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz` constructors
To: Alice Ryhl <aliceryhl@google.com>
Cc: Brian Masney <bmasney@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, 
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

On Mon, Sep 21, 2026 at 5:51=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> My understanding is that the "default" way patches land is that the
> subsystem also takes Rust patches related to the subsystem, and that
> the rust tree is a fallback tree.

Indeed, the idea on how we suggest setting up the `MAINTAINERS`
entries is that, by default, maintainers keep control of both sides
(they are the experts, after all) and that, hopefully, they get more
involved on the Rust side etc.

It makes sense for reworking the subsystem, too, since it may happen
that a rework on the C side may need adjustments on the Rust side etc.

The file is already under "COMMON CLK FRAMEWORK", so in this instance
it seems fine.

Brian: in case you want it (but it wouldn't be needed!):

Acked-by: Miguel Ojeda <ojeda@kernel.org>

As Alexandre said, we may want to rework how these work (instead of
panicking), but documenting helps for now (and whether this counts as
a Fix or not is, I guess, up to what you usually do in your
subsystem).

I hope that helps!

Cheers,
Miguel
