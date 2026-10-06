Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E5377AAC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317915; cv=pass; b=bg+tKmkEVEPggxb1zpcyII2VfPVQ2WHCiH27Yx/NhmRgWRhfOI1pSQbpWy5qC4yTLcRc41bAUvY925kC2Ie220Yjhikb4a+K6M3p/HmIwWtBki7jRmlvO+jpLdnu5kH45Uyi+kV/7KM8kKitNNK0q0BQXDbV0k6XuRhYelpbuQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317915; c=relaxed/simple;
	bh=BK00ZnsjwSE3rrqFWgg6BqhBupuehgDHjlJRfgelxBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgjbf5I+tdnRHN/MOzqvaJPQbyYk3kq6EBc2yNVZxlB9ansLkI5sZ0shHGb4NZ+zqTlmZzT+YA0cGbX0NdjznCoWDzJLMxi3ih9FPWUoy8RpzLJhTMMJAhqbLf6aNr0oP3KJciINYLHxe8jS8doqVp7WHud+O8EAMdNumBaaM6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXsNrqHL; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXsNrqHL"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f58dce2ad9so785114b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791317913; cv=none;
        d=google.com; s=arc-20260327;
        b=PSS/Uk1OKdUpmR2/RuMavcDvE2unzpnXNzEmYCfVzGJ4ssnyeCtBTjjQARHxXamloX
         +VM2rl+O71dZt6+wBv7HSwc/87V0T5b2EP4+q9DpBy5I0VIKk/ZmHe4s7MgzZveOsQj7
         2gHeB7EweM6VH3p3axfWpgT8HRR5mf4FLQkcAn9E4Tv4XQqfV8qVN84DIbheMxU3vK+q
         twsZFeNKb/1BxahPdLIv+tGetjb12M3rXeoA6nYhlNV/esYdcbkdgy+AWlpu+kuyz4zc
         wuuRgCX5nJZEhtbMdGaD7ZrkA4gNHwasXjclX7loiCMm2CFF1eLV2BqbRAUmpTOK6tdy
         XFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        fh=TPNE5X60sjHO6FpzKJgnYOiDrU1XU+igKH+kwGbfEl8=;
        b=NBlPtzBixUpW/Fd/6bOEDjlwQStOcS1S1DG9ntJSRngOTu2rwBPvFbcgT5Aqk8OHSy
         YlLlsMc1hta3HW8wCXa/0nYUMElVsNnDl0di5ctfoZVveTKABQ65OSKwvKBgK45vyA0S
         HsuG72LqpXiJK5YGppNu4fdAuZTLZCBDwq/yqvTIVewF/L+G5vQWR6T6z/wJ955hK0ww
         1l3t0vSkiSdWqT/RFz13XWBdaIFdW+m8AVTXm9LaqVXX9XVEO7H5H9J1/AswK8uob8r9
         BRiNx2ZrN192HbW5m2Gvm39E0kTHTzq5tal9v8uoHofvzuElO26uWKAP2JWjUbB1WEGI
         D0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317913; x=1791922713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        b=EXsNrqHLEdxE2FTiUY5G8quk30QbyG/rW64eitVU4VsTj3pVoMspWijqVvlp97Eb4P
         3J7YmVrTcSIcX55u7RicXPGZDcLXs8kOoDfxiIFAOxZ2muKv9g4/DizTK1AaoOHAW4jW
         WhOjuxNIu4gFdxyEGm97YI4cml04HgpEnGxLzRUVkrbf/Bp8o5EFKSGasKuH+SChu5FU
         m53ZpLVcmgUVO/VLrQdP6w1VbEGFR0DDiG92lA6ebfANbrqT1eGx89YvJ3xtaqlWgl/x
         60vml9R4RmiYyJAyZa4at047nVrxstCc9Zp+eWIWV0r1o31TEpB62WpCZP28mnZmJ+1z
         2fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317913; x=1791922713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        b=wacWW8tyknrgOZRiMFI4jHCgoHiCapDEMesG3ZgNza/iJPSSQKFkYtYwerfbGDzAX1
         1HUkw35DXThIR7HHzMrNQBEKjgtYIJ0hRJFJne5sjqlivjA9lU3logDcohtHCdDRa9ma
         k+lcVzWn7wtFkHIvhEsKSNPWOln9OJp6t8FZIZswYvs5bzKTSwv427sCi+HIgxqmbmDS
         3WNN1T5HkmkneEFDgkar7Fx58iUvGfYs/iqtr2BQUUw6YTTZ2RRWCpmBGOauecmrJsF/
         FqvSCh3mx2MggDZx/FIcDjsUGyk+WSOVqrKr+PBidObC01rNyCUarNTNb6pTNeKzXeyG
         lT6g==
X-Forwarded-Encrypted: i=1; AKwUvBz5XFQ0p6kfUJfOj0ik0Wkl1S/O7/em1RhQN60+8hcLi2erjxRskSE1exr7cJKY1nY7HFd+NJgHNIwqEfI=@vger.kernel.org
X-Gm-Message-State: AFuF++knsb8nod7IuXjr/NTlCDcN7BzxUaNKYNuC5KXznCUHH89XJtvx
	YK1GQEBo3DbIwZFlWoCeUJ8gey3s3bVNLGGJIvyO91BV+F+E7e9HvGMqu80og7qlk7pa0+zr9kp
	E1yMSjDzcV0DCn2ZSOMjgho9gvpRl8HI=
X-Gm-Gg: AYBFou32QV5pFK9Z3MQS4XqAr0d5ospEhknlOLuIh9UgDA0fJIXSkgn91ECYoq0uMVx
	cPP4oAGmjtij1s9uUOI12ig0gAnlMYDF4a7e9AGkkhQeFPWd4DzFI98XDGHdz6KVAyLiqKH7nFy
	Xi8CQHwk7jgRBCarq+A3+vjaAn87sj/k1t+GG8Fm67r2NL6oFjUFih9mVjj7AgMldHeIwQsSId1
	aEnid4apHb6bYgf/I1AiUEDwMAejYKKlgFHuAbRIUn1DaMabJ42x8KkNmoQfEu89q8E62CQYAIe
	UPvLag9+saYonKYvwwYF0N3ML/7In5FIq+vIJgc/AB9RbeKOfO1yh4Vqi3X8jevjOHIi78bjrkK
	z51z+4exrqVYbsA==
X-Received: by 2002:a05:6808:2387:b0:4d6:9283:1df2 with SMTP id
 5614622812f47-4fc46f919ffmr310232b6e.61.1791317912873; Tue, 06 Oct 2026
 13:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006191009.143707-1-miguelcorderopamphile@gmail.com>
In-Reply-To: <20261006191009.143707-1-miguelcorderopamphile@gmail.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 6 Oct 2026 16:18:22 -0400
X-Gm-Features: AclHuK_D1Ft8dS8r4Q5saUVZyksw6dF2Gg3tGCiBGgGW45JIdFNVxXA19lWW69g
Message-ID: <CAESH5ocS7C8utN+jcRt0EqBmHOFhYJpshv5p+cTorbewV8TEag@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: document `next_bit()`/`next_zero_bit()` panics
To: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:10=E2=80=AFPM Miguel Cordero Pamphile
<miguelcorderopamphile@gmail.com> wrote:
>
> `Bitmap::next_bit()` and `Bitmap::next_zero_bit()` panic when
> CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is greater than or
> equal to `self.len()`, but their documentation did not mention it and
> stated instead that `None` would be returned for that input.
>
> Add the missing `# Panics` sections and clarify when `None` is returned,
> matching the existing documentation of `set_bit()` and friends.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1252
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Signed-off-by: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
> ---
>  rust/kernel/bitmap.rs | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index b27e0ec80..5da8b12fb 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
>
>      /// Finds next set bit, starting from `start`.
>      ///
> -    /// Returns `None` if `start` is greater or equal to `self.nbits`.
> +    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is gre=
ater than
> +    /// or equal to `self.len()`, returns `None`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is =
greater than
> +    /// or equal to `self.len()`.
>      #[inline]
>      pub fn next_bit(&self, start: usize) -> Option<usize> {
>          bitmap_assert!(
> @@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize=
> {
>      }
>
>      /// Finds next zero bit, starting from `start`.
> -    /// Returns `None` if `start` is greater than or equal to `self.len(=
)`.
> +    ///
> +    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is gre=
ater than
> +    /// or equal to `self.len()`, returns `None`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is =
greater than
> +    /// or equal to `self.len()`.
>      #[inline]
>      pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>          bitmap_assert!(
> --
> 2.50.1
>

This duplicates the patch I originally posted on August 27 and
subsequently sent as v3 on September 8. That patch was picked up into
bitmap-for-next earlier today, October 6.

Best,
Georgios
