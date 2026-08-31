Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD36E41379A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788220713; cv=pass; b=dh8IUgbFyOYAGsFV7F2CXAhLIl/23VHhi1mdBkN6zWc6va5IGTp5mHRwpcQHzz35HXln+IGWXrr/zLgDgQTF0D+9oe3SUjPUKuUQYUZOFXeXcPpD2cMD2LYxiUlWveUp0Mw88X+mlx9sWR7NEuXiUOb0HyXlRdjaAkSYeNUAcaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788220713; c=relaxed/simple;
	bh=gq8M4lNwSzXC6zL/jcxwOPlAL4IOPPEKifg4VKRpULg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zd9BxkF53kyRDCAKszGCKdpNTbDNHZWK8aVri5VDVALaT+w1VBoxSNPlVD5SD6IHsCsAyLkzykXEhByM7CwG+++rpD7btMpZxkCg92UnjEK8lup/qjcZaljBKwbMES+waNgjuhmhYTBECpmyc9quDPD2XIIRWVuB42lZyMGgniw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjWdzUtT; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjWdzUtT"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso625938a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788220711; cv=none;
        d=google.com; s=arc-20260327;
        b=Zu4sb5yw4MnuVnBP6WXtxbSUpldTPFoA1eHE49eshDUzF/Nk8UPQSdkiWWzfIjbCpo
         SJ3OffTJTouY3XU0Tf97N9QJ5cjX/hfLWFE7e7xAdxZ1zNOdcVlSBRxzeAy5phXg3dS5
         RaeRF298BQPm5gfFiG966rnVYht47LlR0O7UTWrRpVvPEZrsJoCsa1kPknmYP8hIr1o7
         WybGfQnmOE2RH2xuZgWQVjNiJjYNz/NQ+qVk6yjrgykTTDylp8PxdK/copPbbXGubJZw
         t7yd7dv79WnS+zkF/KjWOfF+5B3C3B2185yTrp9jGMrksWuTbClgVmXVOH0Ca480Rdg/
         CTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        fh=JQPl4iEUpM0l08sdNubBHmUouJTc3UJC77fUQvSW4Gk=;
        b=IQ3z3xSV3EO6gTzONl5udehIugbbCw5D358c7xoBNWLrLU7rAft4oZwapbDv560IFe
         U3Ykw9NR+6Q+l+eJmLelV3H4E6Ap1Kbkg9KYXMWMhJafUUK8Wvw6nAlF7nu5tx4xhEuz
         tzNUysLdtaOp4GXNTKPHUrndn880CJHUIpDahYu/N/8yXls1muVhxozKQC4uefhQQ+1f
         ZGW1WL/NTYacktlGvlekRINSOyKzGN9E9B8ABWc7vnw+yEKkHaPDh2XpTvTsM6iqToAP
         Y0+q86jjhXnUP2S9PuwHO6/QgJWutzy6wchDaE1JzMHKFcNjANhpM/Nu7kT6v2PMSWkB
         2WyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788220711; x=1788825511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        b=mjWdzUtTGwNwcVPEGWfSzmUm5dwJ7/FCxyTBpFBkTPlQIKuiWpst1XSdY0zFMcQZ4H
         IFjTpKTPsDlDxEB1xrMcGDLMpUJUl+c74bM9Sd+r+HUYwNL4ss+8MB9RPBhKdoY+uEYM
         MXN2oS3LONJKL8A92xRS+2S4s3f2fQn8nmBaXB9jLIbdVQ+uYoJq+3Mu/0n934AXLi7f
         Bzy7yKJuTDY6uBcRMicvImulPIomAP/xljUNYNk0GHzjK78xs4lNFipQ3R/uDOdMeoe+
         C7hsj7R+yg0b8sQLzJUNT+o0kHsauYX9TkRTZrJFU+dV3I6Mg+tCteZtNEDATyfQI+c1
         5jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788220711; x=1788825511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFkDjzBSEP5ruc3j0hthDGHVj2a68n2Lpt3bgktnp8E=;
        b=heroXcGqcLrAE0Jbi/8TLOun5BaUnzjRM8y39Uzck9l9msXl792NTpmf5vtlcuz/d9
         Cb5d3hsg8s3Yb84nXmNyBjiw1reFEeRdpf9rBVILRb9Wo7TNOXwbIieYtCJHxkYs4zz5
         vUuy6WI9Spfc/qb72dbdjEp0K+BmhP3EHOvYj8I1cdlfoOeHxERk3gKqyLiU/OpYwlB3
         89hN8Ctbfv8sznd4BAwOszl8V1xDI1oraJbuUVtALRQBragH75fX6aFulkSNsZmPpR7e
         76y6bqVjE+jvjHtWcIODk3jfLK3lmqcODvllprMe/zOVUt9Ef/nI+fDBZxY3cFVYnbNM
         ZtxA==
X-Forwarded-Encrypted: i=1; AKwUvBz5jAmohnpK5XUcZKRwYIH9U9GMbvJJ6pVAYvvlcQpAcxsYS7mlG3nXSHiIRO0aDSnCnBV8HaBt1r4FyX8=@vger.kernel.org
X-Gm-Message-State: AFuF++kWWMD5TIiEHvxlIEJTkG8o3Qajkxy0OxU/tOyk0k7biGR5mtFM
	NxMiRnPpsS9cVchETdIxzdOQgi6G9FRFWPUFXvbVl2Nj+i+bhsV8S8HCkZp3UkrjuLoJGVMM8He
	vgkSdk0+Ku7EsoE8LRuKuszWDkJAyrw8=
X-Gm-Gg: AYBFou2r6Qcat/wFrJyw7K7U+AqlSGkqdGY4uRFUqcUdnK53q/04xDxBtItrpoE5FbK
	zhugnwGwoRIABAIJCLlw667EUDeFjIr5a95R9N+ypQ80E5lCeR5ObOCkByCmhMTpg1Hp7D9Wm41
	pcy8aMsfdMAy0UabvNuNVhikXKh3BMUiW09OedruxUTGhT0QRBkPDlM/CfVmW+NaxwxN9v20/1N
	Qvjih9ju7WNPDHxD/4DKCsq/aciqiCSo/2SzLfikrtJOhvEeAiQvJCo+MIHVPOIushFPWioHXYi
	K2TCFXBs5LGx6IL23CCRKjGNH9sgQtUSYFQh2F6ntoFyldf2paN99B95QWRbOm2dK7wqzDyUzEe
	/OyomZesPtguT4oiyWxBtkELmDwffbtzyrPqMrHF1VUrQAD05JF7E7Y93abCB
X-Received: by 2002:a17:903:1106:b0:2d7:1a3f:8db5 with SMTP id
 d9443c01a7336-2d74e0c729bmr248017115ad.4.1788220710754; Mon, 31 Aug 2026
 16:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org>
In-Reply-To: <20260828155033.2101924-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 01:58:16 +0200
X-Gm-Features: AcwNN1WkufYBu2lKjhjtsnzCR1i2Pt93ridfbTIxD8I8LgL21h06FCEx5PaoO90
Message-ID: <CANiq72nKwM5n5vKWAmSiMEtUpsL=rAKpwuSa7bxM-CSVT7+N+w@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> In Rust 1.100.0, `Infallible` will become an alias of `!`. The let
> binding in `stack_pin_init` will thus become unreachable and produce a
> "unreachable expression" warning for subsequent match, and thus will fail
> `-Dwarnings` build. For this macro, all we need to know is that the error
> type is uninhabited, so replace this with a irrefutable pattern instead.
>
> Reported-by: Mohamad Alsadhan <mo@sdhn.cc>
> Closes: https://github.com/Rust-for-Linux/pin-init/pull/171
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

For stable, we will need a custom backport without
`feature(min_exhaustive_patterns)` (we could in principle enable that
one since it is available in Rust 1.77.0, but for stable I would avoid
it), so I wrote this tag:

    Cc: stable@vger.kernel.org # Needed in 7.1.y and later (for 6.12.y
and 6.18.y a custom one is needed).

    [ The error looks like (dummy reproducer):

          error: unreachable expression
             --> rust/kernel/sync.rs:177:5
              |
          177 |     pin_init::stack_pin_init!(let num =3D 42u32);
              |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
              |     |
              |     unreachable expression
              |     any code following this expression is unreachable
              |
              =3D note: `-D unreachable-code` implied by `-D warnings`
              =3D help: to override `-D warnings` add `#[allow(unreachable_=
code)]`
              =3D note: this error originates in the macro
`pin_init::stack_pin_init` (in Nightly builds, run with -Z
macro-backtrace for more info)

        - Miguel ]

    [ Reworded for typos. - Miguel ]

Cheers,
Miguel
