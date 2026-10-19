Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E3138422E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415123; cv=pass; b=qD7hAoQaOqt545VjqUcJiHQ8MMmC5sTL8glbRr9cAHoaVfibmO3Ql5CtAOpzFeDLv4zoSHqN024ChYMVrz9mc3x/YuOiUOvr7Q4UFRi/Rxsg9L3TYakXtPEU0wLPkOM5HxKp5f7Lu5c4+kq/G/4rRzQBNtBToJ4w1ImBEhgZrTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415123; c=relaxed/simple;
	bh=mysYr6A8Sr788QG2Uz+xMwHs9QNcHlODUZov9aP5+dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDAz4lUjmsk+EniCOTDVhSK12+Bs75IhmLKG5JBwRcnlTwl9yn3TYRC86qOoiMT1szpIlZlov9knTUov99NYOGYE7Rytw9kWMSqARdE1noF3fIqFc/QWeI/TVzSROAvrrfkWfbC2/EQB+YYZsdorfyMxVwgj9d60MJ7h0DRnzfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h06ZJxSy; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h06ZJxSy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-487049569b6so1063175f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792415120; cv=none;
        d=google.com; s=arc-20260327;
        b=rPpfoacIhN46qwQawHYmPdDNafLfHfoWVA1yXK8W6V1Fv4DiYAmcdtuXczDczFhB6E
         S2pIw8OkG/V6p1uyLgLNSPPkeuxx1uoLN02lt5fQDs/M5cvcHOU1j1NT+1yGILPcAOOQ
         6SdqeQ+V6VVkXXawHa6MnoiXkESActseNH6rweekmFOnmKjfX3XBx2eAiyw6hZTfvRZy
         GEdO/8F79YRYZq7PkvGoZow4IZW+4/ry0/vNYH7eAZIxAOoYZCOHfvGq1LVuivNiFz4I
         OuC+sXE7Y689+P9aHG7d6CvcnMpmntQIR46pwFcpRK35Reeti6GxhkvslSw2Wwts/6pU
         t81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        fh=PV+ltDb0CCWlr9sE53ntbt+BVG00rf4fl7v50RYnFyM=;
        b=QL8gWz/eolsKrBYyVzKCm48D8N3D/4GX2kLZNPUGl5Ve6is7x8lc9oMfnOhaWgnIHg
         iXnP5uWNfsBf+L0Ffx8iLirZJpHIn2fjs3I0jg2qKJxxJs7kiNo7Mc2j5b3c0DQdrQDU
         Moo2Rlgu8kHaz6tgpy/8qA+p/weLF2r5YI/RenueXdv4ywLyMKekYnk7fLGlFUfhi9QW
         Tx8/bcXdHdNq5yQR+9Tr+gg5oTEWacI7coVG1z4fx9DTuzUmrtH41GhCXIz8My3h7/su
         WO8CLQXPHy4UELogI9hXOZMmZFdvaf8XKFnq8CgvUCWKJMTZ9/DsLpfSryScvsj9gBvS
         hIEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792415120; x=1793019920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=h06ZJxSyJzHBkIkdcJrxbNDVG+79WZnYHCG7CZghSHyk3JuncPcIX0DSVEo2rZirWI
         RntnJqrfhocZDDvG3ouVtrToUHIOwWxe5uPTlGvA8bpmrthXIDs3h6cPB13yJoRQzi9f
         fW+ugKZE7rVU2oTunNnRhJ6rijSpb+J4erCw4AWiva4/Dz/PTsFyDoRQxGtEVHDy5iA5
         7Qia34acg7wD10Usz1LMGHCuDDSYWXVaX+UjtEgBxgHeSwaRfQJawzdio8Q2lZbvnl5O
         JVsZY9jRlggtPesKO6coon5Gs/JQlscflXNzt40MXIJySv+GYrU9WC8beZ+X3b1cQ4lC
         2a4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415120; x=1793019920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP568MdjFLUoc9cCkTY7fbjg57xRLci7XApvAwiXZXw=;
        b=OrFA1UHVg+p+ZXR+wxp7YuRnv0Ujr6AZwP1JqtimF9lsK/Gh8dzl96HbtZa5qDY0Dy
         5IQHU29PkWSCG3rGFsrbVip9U+hNi2dy4VI+KJvz+YEAOYqR+k1LmMySp8g+dzpgS0Wc
         I1byXEiU2zsRoL//LNAXj4vlTqxfJkUkJIlpMSC8XbaQyzN+IRSzoNfkSIGx9vHJGxZW
         Q4VT2sRpKtn0MMqzfdkLL74/OCi2GvUmL0/y6xlG6WB4baKRYlD6csnuNIhOpOE/RRpp
         8A+jp6/HnVOAOEqy+23plCw7jBPDtlIK67FYkzgtFA4WPgSIYAW+mITGFqW48bPSEpDF
         4ieQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbBtFMfD/g38pf4Lox516Afkp5l0Fev6LuqRF0v17TJQeZJeKT4eUgOWs3xDF0+E6uHvQuNODgYwzWaaE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvPLiU343GxSVzlxcl2HnlLFIar7OxTp0ZlW1msLU9V8cJcvZQ
	mUVYSiZrTj16uHhoWVVmnYmKvXfNRVJGgcZl4uqkM2JwAQTwwU6xcOHD09ybg+xgrBNcDgdpfi/
	vlKkV/0Y3SV7W3AjM8UenBr9yx/NfBqGwgYFvCl+M
X-Gm-Gg: AYBFou0D1szbaOUEBFXU1BzasBYHfZf25QznkLJAv45YHCFPusuy7UrM15pFliVxy/R
	E0BLHeAD5WCgQJ7Hts/7IcQdXxbWlcbsxJgDXuvc0HKPUj1rEjNKu/0ne3w2ezmJT5XeoEhixkR
	PQsGQj7/3cBSwfj3WQDv/ciSdIw+qGigoDuoQoq/hh8EtaoPD/g761rA/X4jqb/4oyT3hcGKlKs
	JC0tyYVzZvx5og1qnu7U0j3fj7+5fN7LVxGOZyxGckVkX2m0e1MqPeHWwl6/lpzfkhAomeXY44C
	fk90/0Nt0Mwk0C8uq49HpScOAg5VIt/nG9THnf6NESgeFe3LmYNFkmMtdAFYp6DmX0arNT4aOVE
	dzHoOqb3tcpvCKuCjRhfHekmbQzxmjXfd51twZRBbhzlc+zrV6dh2
X-Received: by 2002:a05:6000:4025:b0:485:8c17:9764 with SMTP id
 ffacd0b85a97d-48e07fad8c4mr14437246f8f.38.1792415118156; Mon, 19 Oct 2026
 06:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com>
 <20261005133857.1572243-3-beata.michalska@arm.com> <20261016121230.3724323-2-aliceryhl@google.com>
 <atYKvHQm9qJ9wY-e@arm.com>
In-Reply-To: <atYKvHQm9qJ9wY-e@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Oct 2026 15:04:43 +0200
X-Gm-Features: AclHuK_TBh9nrF6wdCskikKjrKbXbBPQNYzprNDJUvoT1849kJ0giuue1RmdKZk
Message-ID: <CAH5fLgjcqHJs-mVsmUVwatyap7BOKU+k6LiAPFkqOcqC3soB3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:19=E2=80=AFPM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Fri, Oct 16, 2026 at 12:12:30PM +0000, Alice Ryhl wrote:
> > On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> > > @@ -223,6 +225,14 @@ pub trait Driver {
> > >      /// The table of ACPI device ids supported by the driver.
> > >      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Non=
e;
> > >
> > > +    /// Provides driver's PM callbacks, if any.
> > > +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapte=
r<Self>>>
> > > +    where
> > > +        Self: Sized,
> > > +    {
> > > +        None
> > > +    }
> >
> > Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated c=
onstant
> > `const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>=
>> =3D None;`
> > to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?
> >
> It can, as long as no one would mind making the Driver trait sized.

That seems fine to me

Alice
