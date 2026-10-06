Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404549C4A5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299154; cv=pass; b=AGGSmLnkyYKuAxKPif+vNi44/+0HsQ6ivXCcAOu2mGqqVlT0GNwO+CnK7u2VRazzK6QICbcEJ2RaSWo832q/SL2p+GecgLK/Iru1i7oV05svKNnZ6QLQfZ/ALPPpv6X/pEvMxiwE10751NpnusmysipImdEZ+o8h0q66Oed+pHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299154; c=relaxed/simple;
	bh=YVC2BPRipWA3F8RCf661MD2MDTtLmCEYdI0GMzOeaKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPbC06aWHTKVA5++mT6VyY4013jmyFGDjnb9AbYu8t7BCsOqTcGEHhSoCqPvkwNJIUgXFkR3imBk45U/6nkHBQ3r6y1R/eoWp1Z/ayfOTBAMbTBj8GK8rF6nspahSoJhVJIscjd8IsPTU4f0z9xhnFxl/OgzzDMPry5YDuQrlzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/VsMLBu; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/VsMLBu"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4f59e61f295so530630b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299152; cv=none;
        d=google.com; s=arc-20260327;
        b=nD2afrvO0TPYhyPL+QvHZzszgSt4FO+FFcylLjEE7hLrzcIZBrcpME77QNpI7RhkSd
         wLt+Xj1pIOTshZhV42jUF8c2XcEQC6nuOGVBOzblx3/S0hBSKihkBxn4fn+g2VWm1Aip
         BS4vOFihYzD5zJevmSiV/IKkUfPzu6TnmhcwY8ZJn+rWMcdllpYnibjI62JMxaCQRhZB
         6IlgwXsYVkBpL+42T4t6DiaOhMct1wDtoW+3/+SidjJDy0G/b+NJxxMbML2NUwaeeS3s
         Y1f+9tA8HihkQbhZmaSGb2RCwBN2+j3QcoxsYP09ia0dTb10o1icQEBzoPkJplpE+BPE
         0igQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qns0Ve5FBsD6x5ySVg9MVtsDTlkBXqWvb1Wkh64joq0=;
        fh=pTEF1jm147nVGQB9tp8T31d4WtJ5HVFGxHttm8vlw/o=;
        b=TA2uYzAPpWjAdcxqcRqlYvC3XeFZ7/kXumJBNfA4O/5Z+pj5ZKo+2KGLytPvdUolgf
         kZoQoMvSL3gMWQUl4UkVQzvffB2vp/rPjySfq/yk6fn45nXYL16zkFztGJVw8VJKcz8k
         BLLU4GkM+vo3dKjvA1kOpnh8S14yCG9FyADsBsiNT0CiyzQyxOBPgOxq/ROsZXycCOTG
         Rb8C6l6kL8SYYhKAsB76wNmvDBLmE+Muw0y3GYMT7unjM000W2EUCDM2xJIC6eV8XzkB
         nSZef+weWoY50ZZsZ2tquUA1yqfIDx2HCPeXzwxyAxIZdbN1iXL7Hu8qdUq+icaIGarE
         fbhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299152; x=1791903952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qns0Ve5FBsD6x5ySVg9MVtsDTlkBXqWvb1Wkh64joq0=;
        b=W/VsMLBuu09fpwBV4H9Pikx3dNMfX+I88zP14BxPCo6dFkD2sJLFeSLlfFofJ+DPiP
         X9uuNwNzq4makJrtTjWzaYFKTP7eF4TcCz1ofNsqNdVZa1WSK8Nx9pFdwp5q2bt0h911
         l02KnqNPR9FCvx2h9tsBIPeuYSVVV+A41/vGeUdgGo1szjTCZN6Pf5pzoFfJDCGFRLIZ
         yUIlAIFQ0HvMMoQQZNCog+lqaGf7AbBxaMs4bCkE0DPHtD5eHd8cB4zRehoqO4ZBMZ2N
         cIWEl9/wTcJ0bUoifJigtQAULp4wHi47CHgun+3+rP/2BvbDkffoGaFJwJxKY4DjgXmx
         ZYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299152; x=1791903952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qns0Ve5FBsD6x5ySVg9MVtsDTlkBXqWvb1Wkh64joq0=;
        b=Wsy7oHephNB3jIpenEx7BsG7T7CAB4mdRROCaok6ww43yb8hHLb0DO8H/uR/Wl2W2U
         fwBGDMavpd7CGZCLlOI/PzRqmb7OpzOfOkhvP0NHmt/UgLOdNCuGPjTEQOlGPXGADu4B
         xHvTwHnkBDH4rTJifxaNN3PAjFa87ZrLYMQ4kmZqWMLGswZsynu5S9Qgl3p4cK+UGDAo
         r2qbEH0pm/M0LsMrC6romk0psDhe+NoXJZZ/IipFm1WlcPU+A7nHCUC4seb892lUIObO
         KU8cr7DifRItpB1EBM5umnW+CZp2ZOhjpYi+Js0bjYq6Oy9LEo/Ceq7qix3f/zUHZYp1
         Z1Dg==
X-Forwarded-Encrypted: i=1; AKwUvBztugXUBHIndOoLv0b8cHx2lf8/sgL+cMbQBq6LE/zT2mBrS13fd2cuzkPtqsXz97yMIOs1tcGg0hmu9oA=@vger.kernel.org
X-Gm-Message-State: AFuF++nNPogTbMDaphhx+BzQzHPrsnzhYaTI5a63kyGy4ZH5dUG1IcHS
	espQsg+N8kew5og8in1eG8yuXBFVFNKC3i4unNBunTnzG/ArJtrlQmfzOK06lGPBuLt0n1GDg4N
	BH7EVUtOsltFfBYNjFDgnhf6eqAOiRwo=
X-Gm-Gg: AYBFou3q7M2P9evKBy2e4ipKUtG2FrIkFHvlpY0jbqxE9Z4wgekHnVf+7OewbP81yr6
	GEgr85uQJJ7XL+c2QaRxXvyHsx8BWEfW1yh5brupx7fEfiK+OqCRNbekv6Tu0JetkqC18HIKsPw
	wAdJoAS0/N74wjeTxSn/SnUOvRPRMX4uj/N1gCU4lGMV2rDHMzFpp2O+IvPvRyMI5oxOgKuiDnC
	oi+welAGfKcAClwH0Mf/Ft2/rRIUGTPaLyQU0pryPcX5eH8CrrmPEWjliNVBixUzFg8ZvLn0qIM
	ErhruWB+aM/ZBmyPgPCayjgRnXWOKbBEY8+hvRORWqK+O/Xrp9kYVowts9IZgath0rGizh7Vbtf
	wdH3Wrq7bAYv+kg==
X-Received: by 2002:a05:6808:50ab:b0:4d3:6be7:c5e9 with SMTP id
 5614622812f47-4fb4027254amr1772058b6e.24.1791299151962; Tue, 06 Oct 2026
 08:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908201302.1085862-1-georgeandrout13@gmail.com>
In-Reply-To: <20260908201302.1085862-1-georgeandrout13@gmail.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 6 Oct 2026 11:05:41 -0400
X-Gm-Features: AclHuK9mg9m2V3zh65-8EB7fiSKLtEon174Uu5eNM3MZudNsRjd_XcYbP47AEBs
Message-ID: <CAESH5ofE5dYAvJKZC4tF9dB-_w4V7LmhPmnetAGkq=E4Hw2uBA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:13=E2=80=AFPM Georgios Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> `next_bit()` and `next_zero_bit()` use `bitmap_assert!()` to check
> that `start` is less than `self.len()`, which panics when
> `CONFIG_RUST_BITMAP_HARDENED` is enabled. However, neither function
> has a `# Panics` section, and both document that `None` is returned
> for exactly the input that triggers the panic.
>
> Update the documentation of `next_bit()` and `next_zero_bit()` to add
> the missing `# Panics` sections, add the missing blank doc comment line
> before `Returns` in `next_zero_bit()`, and simplify the wording.
>
> Fixes: 11eca92a2cae ("rust: add bitmap API.")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1252
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> ---
> Changes in v3:
> - Use Closes: instead of Link:, and add Fixes:, following feedback from
>   Alexandre Courbot and Miguel Ojeda.
> - Link to v2: https://lore.kernel.org/rust-for-linux/20260828133543.22590=
29-1-georgeandrout13@gmail.com/
>
> Changes in v2:
> - Simplify doc wording following feedback from Alice Ryhl.
> - Remove extra empty line between Link: and Signed-off-by:.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20260827150719.10914=
5-1-georgeandrout13@gmail.com/
> ---
>  rust/kernel/bitmap.rs | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index b27e0ec80d64..b51c8a96f1a8 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
>
>      /// Finds next set bit, starting from `start`.
>      ///
> -    /// Returns `None` if `start` is greater or equal to `self.nbits`.
> +    /// Returns `None` if no bits are set on or after the given index. T=
he
> +    /// index `start` must be in bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` i=
s
> +    /// out of bounds.
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
> +    /// Returns `None` if no bits are zero on or after the given index. =
The
> +    /// index `start` must be in bounds.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `CONFIG_RUST_BITMAP_HARDENED` is enabled and `start` i=
s
> +    /// out of bounds.
>      #[inline]
>      pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>          bitmap_assert!(
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
