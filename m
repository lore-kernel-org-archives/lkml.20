Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D66375F82
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788736230; cv=pass; b=OMqdAwwuPzG45uqu3i0H6zA0Rr2XMpAeFm7pXJxSl+uyfSKcdsbJTeG6cjDCt71nja5r52pM0NFcSusjcX18OnGFGTmxs6x63pEcIinMuJl6JaWH/s1QaYd48bcMtT3cnvrAXqhQht9++Zs0lSCeM2HKMW9MCnYolIvB1T0uh/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788736230; c=relaxed/simple;
	bh=Fjxrq1GKkJX8r8/5mRDVti7hvoYedIWEt85g8/eByOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhpvCGQw87eX+fJHjUMFBI2D59d3soPk6DosyKz/ElPbKqEZgdEFUC8tIpfMLo4ZZzYxXjBXjImRl6EyxQMX8MAoA624YFOzIiTDaUhNsXomPg3T/7tQ5cW2fra1gPA8toEoOoFI4D8RhcgFCpJqOn7yFi9MpRrHlF4drVefgE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ofaqqy0z; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ofaqqy0z"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39931869b4aso210702a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 16:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788736228; cv=none;
        d=google.com; s=arc-20260327;
        b=dBIe5wmhlj2QuskoUe8FXAlK3Pj7Q/1bxiebLsvSYskQ8fzOdqf7yPaBmG3YNN25qC
         AkT+yO/HCZD1sh4XJB+tXHa9pzOPKd5/T/L4rWLJQA0E0MX3pfM/GzYxAEZN1MvZoBs2
         o/cQs2yiA1JyT88huuhkdVpJd4oxUjxuZIq6PYDQl6cNMEknOj/XMwSlNGdZrNE4+AjG
         fjXBf4REIETDsXdc26ItR09bNzmV0T9zMl4AMlYk1DwAYdL1Cgm4ODhS7AczODHew3Sr
         +q6mvekVOiDG3UMVbaLWkT8EZgCjqXUVUbEDC0HcLDKJCbVRS9rnpR0zDCiMMra4o4tF
         PkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        fh=CpdVsJ3hLu8uJgisKq6gXVrg9p8DJ0J2ct+NjCAVzHM=;
        b=O3gQzXWvXPHB62D6rNZUm4LbNbsMM4//h7jvE+EqTGk6BmvExuYX/JYxxTZpdVyLLS
         BLyL9D1Dd8mQGo0Tc2b7f49sHo//603IxxDbuX3pmpUtkAkDbw3XMSJkRyfUmouXILCf
         hIufxEujNTVKQjpRay2K3RzaGG1POYtLqgQkXqlJR6JCT4OF9uqGLykVF1/Ik/0r+EgG
         UdJDsrg/1XaViXQc+ZXKZukdTq/jbDnTgglOu5tE15uwFFCcyZnioIBGU3+Jthg4VLhC
         sQQR/07Wt1FgLyMsNv2dF4G2+t/69Ku8WkZvuBLob2fa+tZhZtkyW4lkHokLhjZnTf1Y
         LFEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788736228; x=1789341028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        b=Ofaqqy0zcvCsH/zwFuTa6Zwn7JAqtFcScHWJGLf3fx9L7T24DPjrHJgyTDwlB7bu9Q
         hzqSYQ4v/HIk8qrXr0nOHE/UGGerP0jlRgZEFHWW+YCXPuEPhXX1LbfXLbOTgZJLaR7C
         gcpC5V2ts4Zv1z3uV7yRG7C2rL58TkoSLXmDNzcPR+ryUsfbtFccWiHEVuKfmHk6pT21
         uzwtrD9Rszt0EFvZRVEgZT1ZTU+fx4+us/Qvgq+aykGd4MC+8y2OmAvYc+6o2P+EgSWb
         vLhMe4NzKFcOxl7+DkOHeW4y/1nK8N3XpLbD3JSMUc59YiU1dn7XRvdiXWI4ESe0Hvtx
         PGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788736228; x=1789341028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59OMxQbrmPLZVc3H/IUZ2iNhcV4LVLLcoG5Axoww1Sg=;
        b=IIiBYRtHJAqa+VEW1T6E4p+w31cXOPMVxBt3laqv54Ak5LOlzbLbetNO8lmwhB6M/4
         +6cm0vH/B0cg44ER57LZgcoP/keiaBBtv8xA9dy6NiFyOPsIR7k8u1ql70789kjM5SN1
         pgpAvphdvJbr8AKBMZKI/dV0rGwX7C6AiTbLBInAzoi+yzu4Z0cuk+SqkON5vFeMwQfM
         oLYA722pKE55f2e+6REH77k1nK+8wuRtwjaSNZ1s0tMqYraDCx49tswdsqn5JOwUxhFy
         o++bgkqUN8e8lZtqBonZBQsnOsbsVoSTCXTEDXATGrWzTxmP4gcVTNe+VBspPTH6fyQn
         plEg==
X-Forwarded-Encrypted: i=1; AKwUvBzUdj9k0xJuMkndZWr8Z8aerNH2DoGQ9QK2HyxRT3e1n8TSskn5U0LumDIg9vbESN7eEdhYavCdmyldDk8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWpjuhEEQlkox3/Va74Su05pQ8xdl/u9O/gpKMMpXsz3IhAmwv
	ct9Km6+WakhYvcESx5bVk6r1a282eGbekbzvrAtdQRKSshcK2j20HRf+WMWYpWGdR0+HZz/M1gO
	/Qmw34hDhu5quAcl/hknK+evM8J/yQwQ=
X-Gm-Gg: AYBFou1ux/lYU2KqC1d3wrBFztpM25OcakyqI5grmEp+m0OxrRxlFHmoTJGox1WvvGv
	q2ZzKX+8wGXwjwFTVto93uO7MLiTUTBIKxFCzsi+NeHztbDaSxtrAPwn2G/wD+AHoNzMkYDbzIJ
	lSoCDSar3xsEYAcDQM04JWU7Sl19BFm1sJnmM5OmH+6T7tDT/XGowXakucjijdR/0WSKJ+dSwTT
	/HuyJ4w5S5prUSKJ+kQqb+my6cAI2eDaeLYTQltM5ZlrdbA4cCL4QhPghea+PuHZQp2vo2vLHX8
	DSz/mxFpaDAL8vAYJBI8mYSB0Y+jf136AGzwZfWKrqNphbcPwJwVIsAzayh77yDWrXauv4f9AM/
	K3G8X7zhbVVcRtC051PQU38Igb0L4/YYGSG3W+qFbil6+Yl1ExNCPJyA4uKbQ
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39b3d7d056fmr11080614a91.4.1788736228492; Sun, 06 Sep 2026
 16:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com>
In-Reply-To: <20260906215822.1201022-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 01:10:15 +0200
X-Gm-Features: AcwNN1VE9lAzlRGVnbfPGx5EagVVFyfn-8b1hQLu3mh_1rHNMQOtFDHOWeHKFuI
Message-ID: <CANiq72=5ccep_GNF+D2P=QatYLUe+uyvEE2z2i=wMVgLKeYnbQ@mail.gmail.com>
Subject: Re: [PATCH] rust: allow `clippy::as_underscore` in the generated bindings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 11:58=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> A CLIPPY=3D1 build emitted about 15000 `as _` conversion warnings, all of
> them in bindgen's generated output and none in hand-written code.
>
> bindgen 0.73 returns each bitfield read through a trailing `as _`, and
> 0.72 returns it through a transmute, which the lint ignores. The
> bindings and uapi crates allow `clippy::all` over the generated code.
> That group does not cover `clippy::as_underscore`, a restriction lint.
>
> The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
> cast, so upstream CI may not see these warnings yet.
>
> Allow `clippy::as_underscore` by name in the bindings and uapi crates.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied to `rust-fixes` so that we get it into linux-next since this
sort of thing can be quite annoying -- thanks!

    [ The lint messages look like:

        error: using `as _` conversion
             --> rust/bindings/bindings_generated.rs:18947:9
              |
        18947 |         self._bitfield_1.get_const::<0usize, 16u8>() as u32=
 as _
              |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^-
              |                                                            =
    |
              |
        help: consider giving the type explicitly: `u32`
              |
              =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.98.0/index.html#as_underscor=
e
              =3D note: `-D clippy::as-underscore` implied by `-D warnings`
              =3D help: to override `-D warnings` add
`#[allow(clippy::as_underscore)]`

        - Miguel ]

    [ Removed CI sentence. - Miguel ]

    Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Technically it is not needed in 6.12.y since the lint is not enabled,
but it doesn't hurt, may help downstream trees and may simplify future
backports.

Cheers,
Miguel
