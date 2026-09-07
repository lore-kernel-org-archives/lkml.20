Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5194CB8B7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787894; cv=pass; b=jdoCUOt3SG1VuIwR6qkxTHI/jI7tWl8+wDe/NT6bw8h5rPGLiRn2fSO6fkE0DLCfwKWNl60ntsnZu8Wc+Z2lGWzDQoxNKopVcASbPnIH++0LxjowmfcRocSOjUDdHJ3Tq6ykRmFRMkauKWheT+sD5m0oJZeFh8/biQ2PIEdXI0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787894; c=relaxed/simple;
	bh=D1wAsx4CR5aOXpjyMVJB7sUcHL24GlLysdFmwnbPMG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYZzrbd1o/T3PDF8EyV7Z7LurDTUUZ8m0Ap+zZR2uRYwh34i+nJWqeS4l4TRICqQCVeqD+zOAH8wDVU1CytcqRQfn5wnkQ+6DkwWf6CIRGKbVLhMm7pCvcvO9v80Sjl9AqIrYwks5CEy/e06XMjsNW1pwjkUoyamgKedSuA8QQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NIdr3zAl; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NIdr3zAl"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4499165f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787889; cv=none;
        d=google.com; s=arc-20260327;
        b=qxWxIREa8d+VmTNJIneOJO0NZpNmmQTX+ey+G67ez7SiSmEB3+cH8Fg1HPBo86/nlO
         SSrHfi+1QRIEAOYn7IH7dh1f/akK3ipxJxcMzh3f9vOEoISjJLj8+CdH1RJ5aFzygOhw
         lQTftpHVLpv7A3l5pyVFnCxto7OZBuAKN57qqDtSn3AYMc5bZc1uhL+nxdlYhTscWZpy
         l71SSoMp1j4t5SxItwXOm8fxrYWfmDYKLH+lJAtZH1V6MlTytTuJP2BCNfZ9vOzIsj1e
         TRk14dBTobwkLzbPX3WF6R7WoBWXLuDDdYxNA1b2rrbJjfStYNpn0ZgPr/eIFmp0aa9g
         F1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        fh=JbCBZ+jkT7nYs/dEoviY2Wje/eQbF2goucCSlIQ4VSc=;
        b=ioMZwDsWgaOlmGCn8AH5TXo8tGjfsCrq4j2vT7zNBfCfoyjZRwFUn2sK6Ve04vl7Nq
         9xr1PBUXHFOmixDIjGF2Q3D7mNnFtUbMBqjTr5ApfWKag9ygnUUJgvlKAb0kExO28CP6
         Bk4/ckuabNwc7aKulIzTUpbp1NpAD/Behmq46DUi5jp+YO9s66R19+tN9Zx3dX+r7q7x
         D0bpsDRWv8oZcyZSc/D019AMNCQQFeRA8RR7e78YZFanvuc1hU8daze2vvigt1zCj+XC
         Iin+TkoASqx8MSepFMF5VrUyAV+N/CKxjsQfgtRSZ883AjvzzYCuxYOVar6C3DO6fCoA
         +0lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788787889; x=1789392689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=NIdr3zAlo3mcJVZ2dOsGTkXVQo6l5bJk9h11ifhR8G9reIyHly7mUSVvibfZB87k3d
         Fx7Lik65jLFxC8URd9knurRBD0NgJ+NJHzhV2LQReayvmkTPU3S/s26EWw7od/1byId9
         +1HGyd1j8UcghfQIBp6uMmcAYUGuq+S7b78vJJjIR1rKsGWzzbHSTs7nVXrW+Z1mbG0j
         t8+hbqg6d9mPI3CWh2n6lkIqono0TArY2S4viwnddzIdV6PvAZWrAjRsFSmeWivtw3hW
         ZVJvra6EouwJXNFMsob1Jm2nEFk3NUn+V0DDo2hhryoPIEBCImkswBBIQQdwvzjR3RZD
         Pk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787889; x=1789392689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=qHFThoNCpBllvsL50+A2JvbnjfEklY5IXfqzMgYh7EDu/9+y1h2kSqkJsXtPro8lVG
         bdHJiOnWnflP4GyyxE+odqy9LkaUBVfoCRciEX99dESnmCi9SSsIqzM4mtZ5iIqbst+3
         65IRm2297afxsRPZvJzlCiKPJD+1MztLlQHmXP9LYkBEUbu8j3FgdTEQB/mixWRxpATZ
         A81lcuby6QNvXEiFOtTbInSF4onGCiwe2mCVU+9XktIehZArQTViDOmJZ/z8Zpv+k0FK
         LwikkJ192m3rxoUxhs8vuxZmO5BfGo1GfrCob2I9ha0qe0IEubkp8xPH/1RavF9jQjeo
         qi+A==
X-Forwarded-Encrypted: i=1; AKwUvBw+n+ZdlZV2aOeY3ZEVp3N9N0NWRKpuXj5xd6Qxx8wVw4z0fkrqRwIr4Xm9zP5Dm77TPgiLSLPD6+E+myg=@vger.kernel.org
X-Gm-Message-State: AFuF++nlxlBBME6HCLD9xcKOQ6m1Rgp7w/+aTCEo2VzkP/yVphVGo54T
	NmeyMQTrz/CMJK02dOH18sMiMI+TmIHvwjW25sPxAjoyuQHE7IETQD/aHSPO6dY1puygHADfzmK
	Es8vWm8GQZHh+0gXP01kgD53Ozul7op+351zFEjUB
X-Gm-Gg: AYBFou0MK6JxpVII8MsQfG4U9wn/mBnPDcyUOnOA6pu/bhdldGppvq4PaejaxTJsaZS
	cGFypBji5kUWauFZsKXoy/3pFBSaIhhlKZdyzqDNdxNHPw1rU82hmrv1tYRKXgwHeA/a6yDrJeu
	qTAKBdDbXOCFv3za+BqK0a2yoDI475+GVcQT4haYhI8XUo5TWPMYx5/IP1r+jPwEHqBjlzCFz8D
	8zQ9BmhMaFS914o1AZFCNrMBIEuhsr4aWQ43p517FhNo+Qii6fZqxYUiT7S88f/yLdGTIe8hdFu
	is6TsV/h/6cYJLm50TTSOzRuR2uG98rpPK3KmosSXW0YqR5uWDULZCzunJ5TKg0QTmttH3L9aCC
	+gIfAnYOveLm7FXJz1BZc15QcSIcnzwsr/OkqQhkcAg==
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id
 ffacd0b85a97d-485870902eamr40614985f8f.21.1788787888668; Mon, 07 Sep 2026
 06:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 15:31:16 +0200
X-Gm-Features: AcwNN1Umd_wQEAUZHPYxidNRM70dkjd7WtcOMgQxK1KjbblodnsY1lRpQ3kHiGM
Message-ID: <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> >>
> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> >> +        // SAFETY: We just successfully allocated a page, so we no=
w have ownership of the newly
> >> >> +        // allocated page. We transfer that ownership to the new `=
Owned<Page>` object.
> >> >> +        // Since `Page` is transparent, we can cast the pointer di=
rectly.
> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >
> >> > This doesn't satisfy the safety requirements of Owned::from_raw()
> >> > because the page may be used with vm_insert_page(), which increments=
 its
> >> > refcount and causes it to be shared the vma system, and this occurs
> >> > before Page::release() is called.
> >>
> >> I suppose the existing vm_insert_page() abstraction we have is already
> >> problematic, because it uses `&Page`?
> >>
> >> Maybe we want to change the API to use `ARef<Page>` so it already has =
to be
> >> shared? Conceptually it takes a reference count from a `&Page`, which =
isn't
> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARe=
f<Page>`
> >> to be able to do that op.
> >
> > Honestly, the problem is the safety requirements of Owned::from_raw().
> > Pages have a "special" main reference, and free_page() does more than
> > put_page(). It even does something when the refcount does not hit
> > zero.
> >
> > The correct behavior for Page is to allow the user to hold one
> > Owned<Page> whose drop calls free_page(), *plus* any number of
> > ARef<Page> references that invoke put_page() on drop. This way, the
> > owned page controls the special drop codepath.
>
> This does not mesh well with the model of `Owned` behaving like
> `UniqueArc` to `ARef` behaving like an `Arc`.

It's a different case, I agree.

> Please help me understand; with page having a main ref and an auxiliary
> refcount, if we model that with a single `Owned<Page>` and a number of
> `ARef<Page>`, what would happen in the case where the main ref (`Owned`)
> is dropped first? Is this legal?

Yes, it's legal.

> My intuition here would be to follow Garry's suggestion and have
> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this is not
> an option?

That would be the wrong ownership semantics. The C side increments the
refcount rather than take ownership of a passed-in refcount, so the
correct argument type is &Page.

Now, for the use-case in Binder I believe we could switch to
put_page(), as we don't need the extra stuff from free_page(), in
which case we only want ARef<Page> and do not require Owned support.
But as long as we are calling free_page(), it needs to not be
clonable.

Alice
