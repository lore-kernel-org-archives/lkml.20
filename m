Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E741C2AA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734922; cv=pass; b=kTuqwzWIaXxaJlbYibLWbWPqsHtj+wU7tP2gQMVheFvkNdoM8Ic2a67Nf8N8L5uX6UBdV0V1+7W21rpyWB2VR1fV1QtlX3gz9cqKH6gTDxu2xWwQnU3QLs+9bVv1KTj+TLqYXyGpEyceEgnSYSO0rM+LGWqXM989EZyerEQ108w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734922; c=relaxed/simple;
	bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=byqPHfXYcMB2PetpKLNzvjOXtaGa3NmXF52oZqQOuC8JalIoP7EwnSTZzuKrXulQwbyvMmYUjw/w6UW39JsoPurzS/kAr/C0GZLhiW7KD9JqiA4a+gDhV7kJheUVwp4wVsLAsF1ccc+pmTVvlACYNzpnNva9Zaoh6hDQlo4tnD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nt4n78Wc; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nt4n78Wc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so250826a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788734921; cv=none;
        d=google.com; s=arc-20260327;
        b=ErBtEw6sSaGF1RBE3tMnGt83kA/iLFko+qOFVvNCC7M5FUna8LrW5OGg4l5rQU+Os9
         +/+XKT2zBVzFYiXrXiOMdTc0wLEIpTu5wzPtC7tHMUxkaY7GiRtoVeR/9CX+SB3CCrIx
         bnLT+LOlUmFrHPb08As4mnO0oW0uV2/nTWTytEbxsihlIukY91VslaK1+iNCCQg1weuL
         SrUjxKgcDkC8Rf47TpZ7aniXoRIPV6TJYfYoB0Sp/G8fV7QKddIwQE1bEYtRsqJEgGPc
         UoxjyoheohZ7beJmqGQsMFJ6wyScJA5yHfwXz9h8H/QufqfUKWwXgcF1IiFRItO/f/61
         9mPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        fh=t/jwhiADPq3LgBYZxEOcH5R7iRdQnflJYyedCOoiG9s=;
        b=k9ZoExXAW7fNo6mnwV569ZHLfXuUnZeB0PjuR4nYri+JYDAIQ19T6CG6tva93GWM1P
         y9TwNpWRZVilB32lqVNw0zT8KGqs/v5FYnBMy50HDIUY4v33aEnLctVrgTFobtLgf1yW
         m14uk+uL6PQo2BkwVqmMztKhdi9Koaqqv0fXqAu/FU1sQihKdba0V1vYs1ivTq5OzX2f
         NWGDXi6om3se+n27q9vqZA/NeS/0WEUwSICnOKXRRCBMtoSlZHcsOlm9i9zT0ZZ7aB3W
         NqTNTI53/szJ6SVdu/75avlMlNElhiNvwspnO9tWs0qWcuAAgBoycrZRNMgr7eMTUEnU
         hCcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788734921; x=1789339721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        b=nt4n78Wckh4fQcIpf5Y/Eb8aqYWBiECWAI/phzUgL8AHrzzprVhxd492K+5dMxxrbA
         neWOETIMl5k9gxpGdkccXiBNNgDKrXhMK8JpmQ7Y/WDS7K9iiBaCmxPKjCPkcWXnzr9I
         YnsBm5wjR6gOzgdLuqjQFm0DUcN/7eUETvVjv9jjv9wCA2mHM7D+x4WMpkVmtHqoMWtP
         /Fe6L+BPVyl4I0wSmawhR7DgOyxxV79ifAJySE1RF0/rFYQ3R2Ko2f06TVgw2klnEIpP
         StUP9UBgMOJO8VlgrynBH+kFa0FlbOXoUnPoN3P4YodUoRp6jq7YnpmGAjKt80ZkzDsi
         C7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788734921; x=1789339721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkeGMZbNZ+oOAb5w3Su4GGZ0+Qo8jUQnPu7MPtxhGwE=;
        b=Jktm9EXYKD1KrMC7m0ARXvwqedoz5xR8q+0XAV9fexLsYNKpAzex09BHJmuqML8Y8Y
         JBFoS4XIQHN+Tx1DuKUZ8hOtubmPCQbCvyRPCAW9VqwakVQSuzA8cj7OMW2zAO4VohVm
         uuCdAJdWRLyaV74WZk9Kh4Mu+iXt9pvB11WPpmhOcdIG6znS0ngS3nCE9WQd49y9dnTn
         fYrm9q4KY61fbfxBz8abxmyklK6O8o9P0PNLcdOrznrG1dlixnrfMUN8eqnoylE+VFF3
         GcEVkdtBxZnremgW8SUsKPJWC0Z7dISL9yORLvweewXhrfwEVc/xlhsdQaGlErxc6UjL
         0gwA==
X-Forwarded-Encrypted: i=1; AKwUvBwlk0tCZrUfZddMz2yVgYymB35wQQVdBNVNgajBjCtaIc2VNxb0G9jCIYiBglrFwSPj0vdu3cESI2M17l8=@vger.kernel.org
X-Gm-Message-State: AFuF++n9gRC7Er5rGU02OOkD+Dn83tjcG1wqht5EsETjfOOzYzkXWFWc
	cGhlI28R5oLVolyvDKTA51hLhkru6dyOZgvdzDC/QqULJ9gXFcaF9PEhntppzEyv8lqUf3NO92I
	2ZD1pr66S5oFYTiSDGEa7UqFvV4C5KoGGnwck
X-Gm-Gg: AYBFou0Ys539f5sXgVEPeb0Ybx+beisa6oKqYaa/Q7wjZO+Sc6neaWJfPWvDjMt/Z/U
	82DHwcOAiMKsZdZ6T5QR87+N5HRxMUlFqgqTHfvaFSNGUByJgTwRJh2oPfTz3symmDC3qP8w2NB
	qsw593hSMyxiYElhJC9RGDhDjQ2q1v9DP963R5Gvs324D7tIc68Lo5Mig7Iax7aA35bq+Ba+JU+
	sqXAGswNzD0AkSK2UquBtPcmO3ggecESSLOkElTG/qgAH2zVr9p/BIJC9CMt+Ee2OSH3/Y34lz7
	Y4nYFonFatega6NjlK+Echti4Q66CFGekQhcFv0fj9m7MtEaJvGS5XvCzMHJZLkauFt9s3GOBVp
	GAluPMmgU8uXIkk+EIx/C4CG8hkvAaO7P692K2XoWMpPVCbXh4Ic/rDrbWKtPjNEKS9Dm8ls=
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id
 98e67ed59e1d1-39b3d86acf2mr11403642a91.5.1788734920700; Sun, 06 Sep 2026
 15:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906215822.1201022-1-jhubbard@nvidia.com>
In-Reply-To: <20260906215822.1201022-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 00:48:26 +0200
X-Gm-Features: AcwNN1XFuhjogPVE1Fbcq7HeHPZK1wuDdjtRKlEb-R9udRbJcc54SrcVTu5koIw
Message-ID: <CANiq72noJ-4Sx6Lj32yGWTm_pzmMkH1Ue37W1y2anzpmN9mMeA@mail.gmail.com>
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

Thanks! Looks good to me.

We have been getting 0.73.0 and 0.73.1 fixed for a correctness issue I
noticed and I didn't see these yet -- I definitely recommend avoiding
those versions for kernel builds.

Cheers,
Miguel
