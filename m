Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489249;
	b=qgaFzQOdXQQ2alD0aKJE2hlA/VFmZ1pABuF4AR4iqbooFvH8YaCaGvw+UEa2ogYOdx22
	 d6wqubHYx2cUpHFSBuHXCt247B3jqDLFFkuY/MRt78xCS4e3PFPj/SUd99PzQU/7auNJD
	 m1U6Y4yqy5gCq5eY3fPs8Kg6D1ImzBNAJ7H6/Omdp0fS4kqde9lt9Li390LdtRBhChOSs
	 Xx8aUflPrm8HPb0i6lWTTi8jsmGQdNJFJ2ASRM/AGKPsqD9SAhho/Wx2EAkzhcteM/t7w
	 mm4jmc157wtILU0Z5lNv9tDorNREjGN8fRDQU1+Z4xn266JeVIpjbg4Kz2rJHFgH+cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
	b=bZp2fmjmkHYGe3athSdh5kZhE67LqWkqszwMa2NoVX7b1PGcSVh4mPj1yv7iI33oBz8y
	 0rSdOQUVP+G40YMIuxgDQbXXRIWperAEQExUDY3w5YYzPKUVDe5W3YIGvnUU2dG6FlRKw
	 0wjbVADANW3chnAnxF5ODEgyiVFGWehoh8Z8dQhpnTS3D2Mg34QlF3zGJxxg+XMDH8aRm
	 ziEtCeZOgSCINcBDh/XgFXZc0x6gKPVfTt1EWMUCNjqwhahuWMBUUiRfYEb2w+/g7DdmS
	 3EBAG60+MRTZ6nASlk8zvkM2YWPT5fm8muB0ZBgjJtHatHTXmdPRdfMowoOCZa/OyXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="JdZ/2jAP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1084606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1084606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JdZ/2jAP
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so17289895e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792489247; cv=none;
        d=google.com; s=arc-20260327;
        b=Xe2++GfAxnhC0NJ3fQeZcED+a+dbbA1w6EQVrlzGIF7rw7TOCMpbf91G6LjG8qvJYy
         yFg/fYZ35N6uzcInggAmEseSIh1vZhfbGTDBbEngZ8KS/9en6JifIf9vPJXKXIdwPyTB
         b2JGqgKA0+MMoHZjQzxPEQtCmAnQdcwlclRUSrhUoseOnKYnHrKxeoc5laMmOizKylga
         1o7UtNpr5GB0bg3lm2MffXZV6xtAb4ykurbVNS+WS2J0fznRdVDfwbi9V+ZBHXRnlBJB
         1dfWXxeYtgrorJAUpY0x+U1jfAe7ki+OtMzXBGHQf0CISIdIn3327S+6breDDW3mPTKS
         7d3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        fh=jxAFxEoSzl7WyBBaLukHpdxhXAGZDJswnLcwQ0Qce04=;
        b=QsyHWATKQe3AWwziGnhBxaD17mFkXTmv1APH6AokoPt39ffPdEPVtFIxswYbkNVBq3
         ppT+Tp9KVJVdu3I2ffUZ20ADaOhHG5LzACabaEp6ZmEOtEXqIWvhuj3bFxN/xXzVyb3L
         Jffs35emeNc5mFFWe7QxlOO+mvydnjuMkKskLExDkfsRp4ICIRiIOkWq5JtHNpWtvEhj
         BDrZb+frYagdXQkT0/3QcXsq68NosheZcfotf9hczkF+lYO331UH202Ts2N5bGiq0pFU
         +d7Y6Ax9G/OA51moUxZe1WiCPo32ntVHc5aDVJWQtH1q7t7A+QaVT+dZ6TiHWWZuXDLi
         wm+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792489247; x=1793094047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        b=JdZ/2jAP+8BYHe/JBBQVzEq4wKIcv0a6p78C+asHqZYQRSvePa22k/7548l6kyNME2
         11W8fLcdqBLkgFEKVrxEbf9izMCvlcIjOCmQ/07gtJXkOumbY15usdo+s9Ao16gRsXbm
         ZijYIP+I5KRr6gW6Qz7VxRn2As6TBfxF4lPDbjZmsooWwoVk8neMqxdF1R62eqiEfki+
         NcmIcAgZ7cxs/Ygm9JjCHmJHHxP7SHXdAsXJcWq2LBzPRpT7ualPlUrcARyaGhy17c4v
         ZCae9xW7jwKpn4Pgzm7kXNlO8iwKOtQf2PMXoA2+z3VHfuRzWY9jN14gZ2AdCuC7NWrk
         N7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489247; x=1793094047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGDzBe9wSfOot1JNH8CfshOMHkOZ/rP5xat4GkGedRw=;
        b=m6QgMBRhQSfqW7PQ2QYDeWekUi20SfaaAtuR9n/f6pFyx9Qbw86s3KrfbHFaX7ClzZ
         G4/y039WSsEEuYinCbJRQHJwKoT2x6b+nmIcVuqEuqVXXM79g2HCApBygtQoHwX7nF+y
         giePo6qPsHHh6NLzT6pmkFcOLmBosSEEE+xDMwd/0FnCmcbg/ntS9FtwKU5CmpRn/Nju
         OrsX1qx6n5JW48Z+rWWLbZdMTxFRxy5O2sDpw1Cl17mQITWf/F79DoYKvdtmcKMWpXks
         94xircJyqMwo6PQ4/DHsza2C5ldURWoixyS0LipKyRn9PQwF1t3R2tZ1HSt5S5E6if/8
         hLyQ==
X-Forwarded-Encrypted: i=1; AKwUvByqnFSbe2wckCktK740hYhMi2wrhNyi42cMB0dgGWVWJzJxO/Y3Onlf4vw3COGggPzNYSJuXelHzhrNEAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Kmo7a9JeviA5x9kpzC4x6PqbOnqJqm3TIQPUcO712Wc/vLu7
	vR+nT7bgzEsXpr2yQnrxZK7EMWPXmKNks+ZjHz5Woq8v6gjdYcOBx21gXoym+Mo6ReNR1bJAOBJ
	CrfZafx83Dt/5ekNJ4IWSLAUgcj78uJ02ESNTXPx6
X-Gm-Gg: AYBFou2KBc53pt2HqY4mBy1MpQHgj0CgdD/scSFOv+s18RMmKQzDoSo6O62tycUgvi2
	+0bJ+ef8JxPjmm+NJgWKo+re8ZkF2kj8EQ9MhmK1S468z8jjL/BKthWW3UgP/cEqsu01P3tIg7m
	bJR/weCUX88A2bade9GJBfs2ZksQxrIG7hkvG5o4h1VFChx0lNlVJPDuohrxBB4/JLpAktzHO2Y
	G8hsK2fDwFyOsVQBJ2Cs9LdJ3vU40n+3iK4jt/xLFquNiKhMIFWmO2hRN/3YmZi2ZGQlrMKcfr8
	BImxTe8ZHhUg4HezZFOweUSF2b2cqkQbkSieYrx/ytT1hduREa6Kdzi1OR28+9wbOeCsQRVQ/ES
	/MKgHzXvrJXz7KN2K9zZL
X-Received: by 2002:a05:600c:c090:b0:4a1:702f:c736 with SMTP id
 5b1f17b1804b1-4a1d75af24bmr181205285e9.3.1792489245370; Tue, 20 Oct 2026
 02:40:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-fwctl-cfi-encoding-v1-1-ebb30d1500df@google.com>
 <20261020115534.1134f2b3@inno-dell> <CAH5fLgj6oCjVheVLYu+X=ptFA-+x4cznX1+bgWT3ayndiA6eiw@mail.gmail.com>
 <20261020120852.6d2ff11b@inno-dell>
In-Reply-To: <20261020120852.6d2ff11b@inno-dell>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 20 Oct 2026 11:40:33 +0200
X-Gm-Features: AclHuK9BrUjMuF23vOzcGkpwaIs37hezkcv9StlIIIkbNAypoyvDRfKJpnSfuq4
Message-ID: <CAH5fLggw3afkFQW-5NM9MqCqCtTPu-Na0GZYsx94MV1=P8YJ0Q@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 11:09=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> On Tue, 20 Oct 2026 11:04:43 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Tue, Oct 20, 2026 at 10:56=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wro=
te:
> > >
> > > On Tue, 20 Oct 2026 08:28:37 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > > Currently, VTable::fw_rpc_callback() takes scope as a u32,
> > > > whereas C calls fwctl_ops::fw_rpc with enum fwctl_rpc_scope. With
> > > > kCFI enabled, enum types are encoded distinctly from integers,
> > > > causing every fw_rpc indirect call into a Rust fwctl driver to
> > > > trip a CFI failure. Thus, generate fwctl_rpc_scope as a newtype
> > > > with a cfi_encoding attribute and use it in fw_rpc_callback().
> > > >
> > >
> > > Thanks for the fix. Looks good to me.
> > >
> > > Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> > >
> > > BTW: I saw this =E2=80=9Clru_status=E2=80=9D needs the same treatment=
, guess bindgen
> > > will someday automatically handle this?
> >
> > I believe lru_status is already handled.
> >
>
> Yes, lru_status is already handled.
>
> I meant that both lru_status and fwctl_rpc_scope need explicit entries
> in rust/bindgen_parameters. I was wondering whether there are plans for
> bindgen to generate the newtype and matching CFI encoding automatically
> for enums used in function-pointer signatures, so future additions
> wouldn't need the same manual setup.

That would be nice, but I'm not aware of anyone working on it.

Alice
