Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C449C4A5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299253; cv=pass; b=nonJQ1/geXziWRaTW/mJC4aSRbLp71BOVv3ken5NHlg7LX1Gmq+5QNtr76lTeUgSM2s/0p3KGsOSlXl5vfO0vzMQCIICgOcIdOW4yrP8eGgyDWvrzTTobbpsgiERGmSiDdlKFi6GLe+HGEPu4qmHFAvQcyVbvAGVDnmR4jeBIOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299253; c=relaxed/simple;
	bh=mvR8e6XwLGU4EOXD7ls+rbR/5w5VBav0d8Qk+350o88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0Cp/ggDEaQinjasAf95lqKQZEwJv8ltV3kXEBuGUzkup2oFnngwvrXBekcKExz95wtfdw57fVWy4vl9URbdzcNYF68X2B2UYcBTX7k/hkKklrPP1Mv9nQK53t9Lc5OOnzLOVrY8UVNjaeup2p3OX9gy533WJ5C9xp5v+Un7MOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIOMtZXN; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIOMtZXN"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso478890eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299250; cv=none;
        d=google.com; s=arc-20260327;
        b=MjC+n2sl8v6LmDKqT3I2zHeG1ObuHIUAzqQEjHl3ugWjDpMQONN2HEkkVKsIx+DyjP
         EwAX5ruTAFCPNeqc9xom3S9ln1wOIEpr2nEkl435PEnODjmhLFBDzKq2kbtgu4M30Jqi
         wgZVsUI/kqXgE+NsFV9IyDZA6AZljd1ic9+IFYVW3rm5e68fDap6zRBV32GtZCH2tmd/
         wFzTeIJtDbUhH1xmrfgDniEAeHHyvUFj+aY4AdkIaELVpY4wcr5Ca3+YonU6W8RSnuAs
         HdEC8FXVXigau++dCV8p0voUB3RdVVJwPklhwRn1ZvsFlgQSqOwCmNdG6L7OHjyyCiYJ
         Ls1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        fh=Ybao7zbLyuqpI1HPEkmu+RkDKY9CCZ6447nkXEdZAME=;
        b=eyRUfg4dLTtaxmCDa01ePnbI/UiqbWKaLWjOHKYhdGX0iGhebbcRRGF4ACDmUbnAiL
         A23izqM8SSdDZzldiUh1B8GHLfaXMYJzScj64tN7Ifbg/kwMm1iZ+0tzNDTzTSemm6z7
         iRpV7seuUFKirun49loFqJf4jLO4n2CJ2qCn2XZdRiuetNY6FaTxiYjrDf6rTMJEatIx
         kR0EhTZf8A97f7CvaPIon3arVgOKGBqcBBZJ1QHSEmaZ8UFI5IPtLRullE0grBztbSv3
         LWsOhEKmugYZkUtjQV86VisqPThJvUAsqu8zzel3adM6MT/op/pvEW3rrQC0SHQyyU3r
         s+NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299250; x=1791904050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        b=mIOMtZXNM4pVrPd/UT+YaCQnBBua9FMRL33Td9UWmuqz4jG/quOPv8lxNZB/mBb0kc
         V1MP/oTv2jmCKwGxaNpusCNHvbJfK2qnwUJgRubTveetXlBPA1RkF6fiNr6QTcL07Cwt
         fyubf4M19PNewX38Xt89bNFGrWE3F7ToIsJt6VAjL+T58Cw0gT7uOkO3BzcsgjICFKy+
         OMbqWabzzXE8W7hDVah1oYUZMlmoYL2FitvbU4Auu6uRA0f+LWhmBIuZYC+H1NLxjJdq
         KhzfpuXIvhKRRtciwHH/PoNSQj+eHd32rJZ18CO8uu7BXtyUmdnE8jEXuajdhrn9TgNZ
         D5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299250; x=1791904050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hunAm3sfdDLBt2CtfN5QW1dy32vmczfmYId9wuMqDN0=;
        b=MxgViN/BjR4crlEXcaWdREvxS7lQ2//t3louaFzV7DYLuIYUQv9GRNDvFmg2QomjDc
         HUrEbcGlkgKSP+matj3K/Uu1/Yl71r2HQaHSLPOtuYTlo2HW6FnTHJkfzXBWtR2dyCW0
         /YqUFTUALemmvNYko1Rpta+s3mhhKRtGF0WyrEX21Ln88e18B4dESm3LyRaKeQOUj1RN
         0yTjmvBSc6NIUVQ296Q36KgcpfoLggcwIqsm/1emCOjc4c2hIcG9E9wKoRW8qP+6/BC4
         M/xYvoYjLJZbnFNAgCC3VifNs5gqpNppIcGm1h+ane5MU2h/WJWZ0TFIr/E3xB1lL696
         kEjg==
X-Forwarded-Encrypted: i=1; AKwUvByrfzrqxwPc/LsCzM95uafaCEg3WSEDAPN8Yc6pnVuRT6rF9O29veD7XNbmILEl/OsU5A9pfAfeU+o53K4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBJ44TCahwtV+pQoCtf0xI1E1+WkjPsSmiv8AVt3/bOnbXzlGf
	/2w8M1hAAckkKNolLx9wpNqkM3+zRmUp7dmbyHcpAFjlXcAu7mNq22Km8z0SeRiCfOhMGLR7DS+
	MQLueMRUj9wwh4m3szK4+feITzlGeaCE=
X-Gm-Gg: AYBFou2i3g4bkcOnskL/51DMV0ZiYhprmUXnw7wUKp7r0KG2iSDhTFk7MaylguaoZNw
	N6fKuw+ZfpHXwWwPUsckmWoLBZx6K6u+zCJiAOgCBm8i2PWUM2OV8Q+tDkRcCtfb9gsDk/KR4mN
	DJ+D3o00DW5NSozJjGasbOqxH687hs+XVVDA6TZIyB4doElkZXA6SpDvJsUwPIccK7Rh2mZHNMM
	Gvcvwd2ucTQvzAc0ODc5hw8OIfkhdinlNR+j2DUFk7wcBmZ+tEdpMD44J1gUC/a7fxRYM7DfDaS
	F6DORIpLV1N2+seV38sLTSYO2D0aHYxkPZldcMgJ/ZgZLVxPQQL3PZKLgEqMuQ3bbtmxqUJZ4Br
	8+FUBp3Q9WNzc6A==
X-Received: by 2002:a05:6820:81c9:b0:6b7:46fa:169a with SMTP id
 006d021491bc7-6e5552968bcmr1134418eaf.47.1791299249802; Tue, 06 Oct 2026
 08:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908203157.1271219-1-georgeandrout13@gmail.com>
In-Reply-To: <20260908203157.1271219-1-georgeandrout13@gmail.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 6 Oct 2026 11:07:19 -0400
X-Gm-Features: AclHuK_IJugFu9Uj9xCurjumWQdLggd0Ix3vurHFpmzAMJYObMwl7ozds_jSXoI
Message-ID: <CAESH5ofXxViFgEUOw8c3wLurgj1dzdA=j-5KaabdF1Uxzx=EuA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: id_pool: document panics in `find_unused_id` and `release_id`
To: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:32=E2=80=AFPM Georgios Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> `find_unused_id()` calls `Bitmap::next_zero_bit()` and `release_id()`
> calls `Bitmap::clear_bit()`, both of which panic when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled and the index is out of
> bounds. Neither `IdPool` method documents this.
>
> Add the missing `# Panics` sections and state the bounds requirement
> on `offset` and `id`.
>
> Fixes: 2cdae413cd3e ("rust: add dynamic ID pool abstraction for bitmap")
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> ---
> Changes in v2:
> - Use "within bounds" instead of "in bounds", following feedback from
>   Alexandre Courbot.
> - Add Fixes:, treating the documentation hole as a bug [1].
> - Link to v1: https://lore.kernel.org/rust-for-linux/20260829153442.20799=
-1-georgeandrout13@gmail.com/
>
> [1] https://lore.kernel.org/rust-for-linux/CANiq72mgZg-QBy4gwzHmD4gJm4wSc=
ktfpdDtyZt3Zijk83h2CA@mail.gmail.com/
> ---
>  rust/kernel/id_pool.rs | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 384753fe0e44..ae6960d7f638 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -224,7 +224,13 @@ pub fn grow(&mut self, mut resizer: PoolResizer) {
>      /// Finds an unused ID in the bitmap.
>      ///
>      /// Upon success, returns its index. Otherwise, returns [`None`]
> -    /// to indicate that a [`Self::grow_request`] is needed.
> +    /// to indicate that a [`Self::grow_request`] is needed. `offset` mu=
st be
> +    /// within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `offset` =
is out
> +    /// of bounds.
>      #[inline]
>      #[must_use]
>      pub fn find_unused_id(&mut self, offset: usize) -> Option<UnusedId<'=
_>> {
> @@ -236,6 +242,13 @@ pub fn find_unused_id(&mut self, offset: usize) -> O=
ption<UnusedId<'_>> {
>      }
>
>      /// Releases an ID.
> +    ///
> +    /// The `id` must be within bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `id` is o=
ut of
> +    /// bounds.
>      #[inline]
>      pub fn release_id(&mut self, id: usize) {
>          self.map.clear_bit(id);
>
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558
> --
> 2.47.3
>

Hi,

Just checking if there are any remaining concerns with this patch, or if
it can be picked up.

Thanks,
Georgios
