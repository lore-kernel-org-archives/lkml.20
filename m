Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B64E73DD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413328; cv=pass; b=f4bGVJFbOerDr8+USCKgN3FI7ym+aotUH/w7X4R006XuqIih/rgTQgDWv8PvHDiE/yS+i1hpw/lU3FzVfjt/Ht6705rd2yOvBBswzjY7bjbOCyt6ytDOITT5w3PKyV5emB4WueeEBEmQhewMtNC9iAVWTAqqvgxha5+0T+StBiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413328; c=relaxed/simple;
	bh=kHYzzrv0/FqkmbWY/rN/GxGNCP9TcRC3pY9kk8aXaeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InvHTvEkNhxScz7NKOXkFJyeKfe0kyhDNwe6p9tQeKkRwf4FMHiTkG8+ps1MmYJQFGwGhyf9r+Bw1x2e/3/wyNtGcDnJEqq7z7moqO0CkqI813icnNw1EZVQacmUyjXj7HKM1WyeKhDYce/fw/dj6v5aUdF4qfqPlL5u6U7agEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqWQ+m4S; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqWQ+m4S"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-355724d032fso231461eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792413316; cv=none;
        d=google.com; s=arc-20260327;
        b=Jm/T/x20pT7mVru82PQOEQSux3gIKFLaoKf0Bi1RuKTv4UIOz+m74wiOhuOdnMx0Xp
         Zz228DfU7qw1w4eMe/TM6CbWGT0FjSUDmN44gVS/3Oomr5oXYMtulD+v+Ca/+nNDsL06
         fw+ovLc+crJL3qJuZ6x/AWkwPgY/uu6egnNpA5UVAoN52eJmatYgReEX20FsehEBfQqH
         20Au6wqnWHteEV1HNnswgoj87tk7nbKagTfJEPYwSPCBKQT2v7NSt8kJIOQQXydSx4/U
         icMjZ4uHh/DF8agqKLDJvQlmxXq/JDAJumyHtbBsijAH9sUUPGbNe+jRcjKz5P5otBeX
         O7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        fh=bH2S5agBxYC3vLRnqi7tfa6N/zavZQVF/nOZBC/+gB0=;
        b=EfasUF41AsdMgILNrd92DsVpt9kZ5HRFZHU19GVKga0dA80scid7/YhqKL5VTMWDEW
         ulSsoO619KwmkxvvtkM7MkgOg23oBVP5Kd9ONmxZJma/d+U18lecf0ayka8EiWu8PhZ4
         46ZNhhcl9v1lb3d5/bzNCjzXxN3is93u67Pe+MR2k6k+TWqKBBtBFlEevP/akWMlveKw
         a8wWBq/ghojgSK8znayxK567w/BIrhCe46pY6bdAvsSnYVb91FzXu514IWC0FZs3WE5p
         Iimh8Ql1Vfts4tei0BS2MrwMnzprUutdamU167XRazXFq1sj8vRYk0vf7NqK1RHwUddf
         XWzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413316; x=1793018116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=PqWQ+m4SQXb5p1luT6Xo/1a5Zh9owOvO4Ow3l75XTih1nogRAv0NA7PQz4JCuFdADY
         NWHNut0xxXnMDFAIZhK6pytQPe/k72REb+3X3t6BBnQo14NKshg8sLFf9suqxA/GQVhr
         A+qLkiAhs92R/VUgPkNcyPY1iORN9KuNjg3agAcYF3HCHww6SFhgbm1G5Mn6zlefUQ8R
         7yubMiOdam74pa1AYQQVopKsxyM3okQ9qVKRfbrkYx9WteKzb9C9XKEjHTVqq3xttz32
         gE9rmn+pEgIMFUY+P6WVdfYOHzpOvCceBoRUNYSExVB0B2HiEzD7uqmGGpPQwBrFFAIO
         iHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413316; x=1793018116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=EgQiEuZ3pADDLcL7e4iHpY5ALlbpeYTiyqlaMfn37CuS5ZdeDayH8Yd1t4dyOGlQl8
         OGy/DqV7SGOhTbDjIbZOTg4jf8YyHrgYMyfXetCeg0l8ZVLo44jiovQ4EccK9mjTYbC9
         tBCGfxEzlxuu7YcWDNuXtT5NNwEp796p//ANxmXDEifkcCMQxhJBKOFAvpDvmL8Bq7OT
         2q8IeFHMg53JmgED2/MJ5LdE+Qi8eqzo8O0x5URG3WiriJqMHQle/o6w+gWKWGlnOat7
         KuCM0mdjz4WXOxmjuFYIZvczu9WDaH4aW12ubjE9mKRaUBkNc/MQSXdgjgVZcLAgipd2
         ptlA==
X-Forwarded-Encrypted: i=1; AKwUvBxUmJLu7UezYAwwfJ89UluN7MvV1pQfSxdwMx7setryzf2oNvSIS3+nE5TPguyBNylBiEhqOkfIRQ1BZ3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe6m/Wx6Yn5R7eZOmqcx5vePSAN+vZ6Y/O/d0AF++1wW14l2SY
	wMX+p5BsYCEJFt1nzoYrn2paVyzeKlY7U5yZwUsq11WBXnRoyth/BnTS49z5ryaNgApefGFaMKY
	lVYjY0iwk4FZBxDyu1waXEhHgikEbe2M=
X-Gm-Gg: AYBFou0xW158JwBdpNe2LA2K98zLqcCQVXhxqPDiSYkkiO6qDGj8T7eTxFW3flHVvNf
	SC/2QRL0Xa2AxRywoRAKY9OH6XYXYN2Skbwj3MiziK/mrrQP0u4Gc/95xyNqjMrhz8i1inDWoOn
	//N71HcViniXxmicCIx/U0762Bnq8QEiOAx1Q38GEthc4lOxyuoxGlFaP4meAyeFo0DiA5fI0ey
	VYaAliqPA1poveJealW9eRLapCLD9vgd9dwCHkulh+3C+g37u8tQ+0lvHczgLLFNDH1LigdxPSx
	+J6fPjSeuU/Kl/gXa2rFUrNGHYMI7zVAAtbjfp8mZx4ffASZ5Jmj/66tcve/WUTC+Xl5pQmsgkQ
	TerT5fxWRrj3a6gZKqJGlyQ/qpYbL+vgVM1lERn2zLTY1EhC//BjEOZQ9N3zy/YuyWk+cRylno0
	hBodGipriUIPb+7d8j3Q6sMVTEPWS9r7qFefdU1UnX//kUcUrh+dSK
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-3619ffc5b52mr18422794eec.1.1792413316441; Mon, 19 Oct 2026
 05:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org> <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
In-Reply-To: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:35:02 +0200
X-Gm-Features: AclHuK8NqyayzMi_L0qJx39DKhIVVz2vRnMPPzA4fngWVWW2n2x20pZjM2meo0E
Message-ID: <CANiq72kxe2f1cO+yypVW9LY4pAHO29wn+O3sUECvHXPnLu2hdA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

I added it to our usual live list in the "Nice to have" section:

  https://github.com/Rust-for-Linux/linux/issues/2

By the way, for the commit:

Link: https://github.com/rust-lang/rust/issues/45040

Cheers,
Miguel

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > `Io` trait is the primary way of interacting with a bunch of types, e.g=
.
> > `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is =
not
> > very discoverable.
> >
> > Use nightly feature to mark `Io` as a notable trait, so it is highlight=
ed
> > at the top of the rustdoc page.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel



--=20
Cheers,
Miguel
