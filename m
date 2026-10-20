Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792487099;
	b=1FNSkswaQfJFKXq6dxGNkJdyZUxIK3w04r1aUCvCfSqZTULjqi4bYZKrgEs3P+loMZxk
	 wno0aqFn+i0SihV+1fr+5Pb+ABQg3zglBD4TSmFLqYFAz/NRAxD78KFyo5Aex5VsPrpYx
	 Mx6IDrey+6OnFTy2ljWSeAEqyZxKJN8Uq/96IQpQ1/xPOUKxalQcUiIc/wgyeioKKyCzl
	 l+JthkmDiCgG0E3bkn7/TwVNBjbacAkAhr5n5sp5einjoXY+EaTSLht2cGZZO4iQHwroI
	 cEFzx5W838VFyn9r2/Jya/FZUU8bcra3Vf0kKl98kDF9QeVYTHWip4QQa9s8BHWRMkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
	b=KIwUmNMLfrnct/6NcWMuP1aUMfel03XZROTGQ4MvrbUJ3JYqchoqj0gIPz1XeYkXMA6M
	 7jb8Y+C79OMO47mJXNBFY/XloeJUHOpB2UtLudUHhXwn35b03cSDdbH5lg/U+ztKrYAbE
	 E58Fdsmj1jbVFUrPlv3xvrmAAZN0O42VITgJEf7sBojYrQEsxwQvjUpd5CX3b80xL33tC
	 s75T+sL/9tUL9vreuEvESq5Lh6M7S486W1hu6rPxkGU3s73cjQDU/Y10pA0eW496CC3Ci
	 Fxr7CFJvUGHGhpNKChsJcetV8oRpI0ugvL4SpJABd2f0lQGRHEi51qblKoT9y57yxAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KS1AFbh+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAA9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KS1AFbh+
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4091838a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792487097; cv=none;
        d=google.com; s=arc-20260327;
        b=sf5qlLVlqzNoFPLKyQruduO1LJX0w0YqEXVQzT2KfTAGWKL2rvYka/7zCk6gxJ1gZG
         6pT2vJYGlIc5OKJRZWH3qOQHECK6n/R04gXvdLPntVNflpQfkfm+7E5DKsUe6yI5R0wi
         z5jCr5dmEbPfv5Zi0T+x3jDt3pTk+sHHtXdE12GRo+oKtpsWCJYhGPcBa9v0bnK7WEnT
         qPAWU5hsHaBA4nhUcKynqsYupNsam0GPnfWS5rjjEvbW5vvBvdZTJ1L7JVeVpv7H0zNJ
         q1nd+b7ir9TcHWG/Sj+4pbWqx+UuSBGZf9vJJ8d8zBEP7Gdt+fK0SnUlDLvTQH6wbs50
         xGBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        fh=LFDxPQD0a912kwqKwNHljswo+jQsEPz2HlzxecNzpbY=;
        b=GRz0cX+CvAFZi35HHShYZPfmTfKkVaEe8UtAxMQinM0ZnJm1mQRRvOozt0Jtk1iQYH
         DZUlkMQisbkxOXBxLXARPt2vji8fn3h9mPvtjHGcru7Xl9BYxNvFEmzCGJ6mday2LA6M
         3yk9fF81tn59ef2YVhmg3Fp/57tSDbyg6uTfJlghiknKoAAc67PZDe4KaaGoP0Mx8bma
         KhzSiQDoUdCSLcv2IvMKqWjPhu6Xs/8uBe+wz0grjKzZdiI2XQBZD4LlWdYjF3wQ/cKf
         rCsLP3geL9tIC4ViWZrfMcczY1ql/120P92gQm7GmCCBvmvdFcGWk19F2rOH9D9jVKCb
         k/9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792487097; x=1793091897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        b=KS1AFbh+RUlnRyYczf9BUEUIZP2JMbRVV77kkceNuVzuBNDF7PZsCn0FqeVeq4C7G0
         UMjgLX0PzOuiah80ZL7AQFlVaEBqlUZGCQ3MNGOE0g4kmL8Kppj6zmf/W41FCBqZxzbN
         uPl8HfSZvhjSXeBajx81DGSmebBgDPSsYAmG3kqa2f7QQLqHcdR8psbIjSUdojuo567y
         1gwpytO0Jo/sjRQ2yyKVRMdcLxuYyMWuttYovpbSGiVGMxjIp1E9a49P6fGRgYs7Q9iR
         Bpzgl/rJXkitTaOBMHqBso7HYX0Wnyr++rNZkupjnbsoKZ0VwsEwLJOPV4J54utgkXix
         IicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487097; x=1793091897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EQskYS0D7RQlbdc42q06B8aUfDjbkE64g4Pl0A7js8=;
        b=Zxd1ZXlWhQwxuVZwSxYqM8MVXCVfcC6yvg+e+dq4woPQz0Op4yR9oUiKQdDyp9+l2g
         8iLLZpcavtfp5TbiYk3cjqFcB4s737ovuED39xGFj44XkZ9EDp68krZlYo8gltWksQ9T
         PvKrIu2EtXGziwUmfvgeD1qet25Ok8+tJqqKtgZdDLmu+cKVmUQ7Ohgchb8IBxNPCkbP
         1fYA5OPLgmKVFCZYkEfZ6t0mGbtrFfoCpR/DC4+fFtMjDL1oTOK5rJqmTpT346/rPRKy
         nxRARudhlN3fTtXN06ZQMBK1OWOa2xjARuRlhlM23yQ0JL0B8fW8S9hhJOmCHMEKNpNn
         E8wQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/kpzhX8ds7xWdrNMVS9oW3/EHsWnXWsTzJWWbqBzUeVjX5jjQWrvC24Hu5Miii7KTU1mRUcbUIGZ5+Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHSZh1aG4p7zdjR0FWHH/MIVowlhj8GPgEdaEG/IjaVeWIMLCt
	LRPd0n9VK5DBjkwvGobvGTNw7GOiM0OiNqEVnTBc+E02jBbmELi+Gnat0oBYDN25BuoE8tSDA2J
	pg30D4tJmp2jawj22xZ2+Lco0SjyITvSwNJ1eaXhq
X-Gm-Gg: AYBFou0aUqbwOXlW7aI0CvbkzMLJEv+e/2VUw2E7bLqD+1Ikm5A1Ff3FZa0IlLIzWLU
	E8+oDuqtUEENmfeDFPNibKq8eGAnIgYIlf5gxQl3iKSz+sXDgZRzLYwPw1ahtjDXgMJABlOEL+G
	ID5UMdzbetEMR9KTE3Xz1vIawsofMMeKN7ZDdVVUarsWCnuR3eyNiG50exF6DcOMNxdO+dAExTg
	MCu+UXRUDNDoS1vO4yWQDDzXlZ9d7RF9krtMrTHwBkPB9KuI7eIJUXd9nuDdXtTtzax26O2jiRq
	/gbb8/Y17zj8ClTpZn+2qnKA94v03ibUzy4dMcMSK+CEovneeHW/vSX7LukR21dvTpk4SpHpAyE
	fGTBChLozuYGXZsWH1z4m8zGBizTjo01DO8qletTwVXtvI7l0C0NfaUwFw520ZfqYuBewgC28DT
	Ld/ZUl43AmhvIi
X-Received: by 2002:a05:6402:27d3:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6b3a8191bddmr6786581a12.32.1792487096676; Tue, 20 Oct 2026
 02:04:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com> <20261020115534.1134f2b3@inno-dell>
In-Reply-To: <20261020115534.1134f2b3@inno-dell>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Oct 2026 11:04:43 +0200
X-Gm-Features: AclHuK8s5pDVPA952Sda847MnmKxiPykXZ_GhxHRu1vfO-Km8lE5fIjR6TFHhMM
Message-ID: <CAH5fLgj6oCjVheVLYu+X=ptFA-+x4cznX1+bgWT3ayndiA6eiw@mail.gmail.com>
Subject: Re: [PATCH] rust: fwctl: declare cfi_encoding for fwctl_rpc_scope
To: Zhi Wang <zhiw@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Saeed Mahameed <saeedm@nvidia.com>, 
	Jonathan Cameron <jic23@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:56=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> On Tue, 20 Oct 2026 08:28:37 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Currently, VTable::fw_rpc_callback() takes scope as a u32, whereas C
> > calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With kCFI enabled,
> > enum types are encoded distinctly from integers, causing every fw_rpc
> > indirect call into a Rust fwctl driver to trip a CFI failure. Thus,
> > generate fwctl_rpc_scope as a newtype with a cfi_encoding attribute
> > and use it in fw_rpc_callback().
> >
>
> Thanks for the fix. Looks good to me.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>
> BTW: I saw this =E2=80=9Clru_status=E2=80=9D needs the same treatment, gu=
ess bindgen
> will someday automatically handle this?

I believe lru_status is already handled.

Alice
