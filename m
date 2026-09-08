Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B244C4E2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902459; cv=pass; b=Ru7mE3Ry9i99k5KZMttDCxJvtQeIlFcmD3rDihePImeBFMZ2jkH+e5a+YgMGmM3Qb1UGZmbhysa4pTFLJj/XG9k32SnCwXo8pRGIU9jM4/xbEtz1T6u+4intQ5HrbJPbK+vH3qgnKTo7OzbJFnYez6vIt4cxaednnotCN9oMCy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902459; c=relaxed/simple;
	bh=UwTlE6O+arphbaF2nVtTqmf7C/u3HA0Dq9U1XFRrceA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgZmnuLQHshEX7OkEnUDNt6EVe9vM8Zg5nZq22F9/3quaEv/4VvnHTKlbA1li0Ucbqu58wQJ9mU90MMS4rgkapgqWccOOpTP3D/P413fPDctL/T84TeCxtsbID4ArmaIi6F7XseRvQqNtUBe6dZ2a9vIViHtNjYGF5bpMAtGEk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=chkGC6pW; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="chkGC6pW"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c80b099b4eso1311929e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788902457; cv=none;
        d=google.com; s=arc-20260327;
        b=pqncLKp67S8+1c3vLFLQJb+ypxtkfxAZ5euQUgm/y9FJPWHZV53SE64gw0+FCKxqje
         G6PmN4rKd+GiMR66D/ESzzW/iLWqDLCwowA5vo8vlITBpEl/j68/k/enTHcH0Js2gWpW
         /ezPzphqtrGR+G/F5e77XH8/YMZ+AkrHK95nSpTSXivvVJWloIX9+kcrwjFiNZ7dXXhL
         GyE4QlWs/1bGmU6Wu0TULAL6tGNuPjTiY7CYFXoYw9IOasgjInm4jKEC/5QspvlkKQBs
         e8OtTmCq8NMyek3F5NZCKHt8Ef4hIy8nbZGUKzfTUviCoM0oUVA0cqTbST0LgW4JXitC
         K7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        fh=jKcobZO9S+wppWG8PQ+BP2z/qnZMqQ75MXeJ/D2ITUc=;
        b=Ia0JjTMvMaMYO+TrI+r3hTushFpNppqO75u1ZuPD2BFBrgEmLGejcX19HEiysYSDhG
         y0UFHXjxkG28Y8O78O2YN+a0rzbVKbjGrhOpBM4VIHx3UF3Jbe5vjxnra3nq/UjaLqW/
         lk4W0c0HIyGrhZDW66BhZ/g5KvIASdrO/nyWuJpaJdpjgKv1814hqq7CtevVeP8Osabd
         dyYJILp9zseQaTVnyCGk/npCshK4wWTvOuSJXE5uXzAsYGEclz1BQ/UxdYPrBBfU/AGY
         Rh8gJt8CfvVjYoBXmMzUJNwhUTofhrpmM1Aw/Ro7UR7xqIkNvQTDtJiUfyVkZYZvGsuw
         1fmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1788902457; x=1789507257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=chkGC6pWt7XsBuicwTGvZb/dkx/NcyCtgeEmswWAbMVZ9Wll9RW3ig10nzdLrLwXEx
         4o0v7WfJh4PjiiLzm7DgvLGNF8bMTLi9GNEj0xnwOTU1e55Ba4hVXGrDYkNIiLWLzveL
         l7r7Sgxill0BlV7ORzT4lXCTgNjiZBcTYD+OdIg0oXRahbAaSY486p3Pwl/5GLXnBkth
         tJuQspngELzEkI+Y98YRpJjSfZTvmTPY6IlYUzQ5AZhJOoqTrJGskrVKLqy7xmyc/kVw
         SQKK8PFUl6mG+WAAGDnexS2/S/vlY9WP0QVNcdLp3ZnpAivY+A6DBbAmlFUWgZXqimu7
         F+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902457; x=1789507257;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvyjDZ06O/CEu+yLay8HNE7ZoTCVU0Mg4mkvXP43glw=;
        b=UgBj1tpQI9R0FJsG3JtrCrJ//Upna/fjRkF13hfVNaHs32rDw1xZk+xLHBSYgQpEI6
         bRYvnYF8xFDUbNF1D5g3aRoafMRRsJtsWf21VSuqUm7k+PItmnyUg49/Z8PL1sT+rijm
         C+/z+Pk7c0Qhv617Z+ARk/c/9FAIZnv1ax+joAvQQfTgOY9k7zkGwHjEdDoKavp5wE3e
         lmfu3wDDARROp/85uef5yUxFGHNVcdX35f9qV6pkANt7slYRJqlileAWUeeINGrNAPG+
         zYBvgZeIT09DPS3ms+rJi3uUMrmNtGY7hSfKZHHLpSxCMDSmJWM6NhqL5PtH2l/CYL6o
         H8/w==
X-Forwarded-Encrypted: i=1; AKwUvBz2Q2dYOIsYBkGVVF2p4Srnkx7yckfslOPhUd4GYjqqOAgCtvvfu1MUONrJzIjQmvHQBEmxX+TV53eiABU=@vger.kernel.org
X-Gm-Message-State: AFuF++kWbjkv18HuY+fRGaXuMQM4n2DlLdTZTvK+elBqU7AvVqjRM4DR
	M9x9oRjOLiGsYX/cQLtE+6f2KVsPdF1Dt1+d3LKyUzhbeZ1k6qvwc2U1H32kARgTIDr9Szqmw1a
	FOWYrHtAZol7YeE4eKJLOnqAN/K8INSea61eJQyc0qQ==
X-Gm-Gg: AYBFou1wLuPDEmn1TnvgbbmI4N6ItJynBXwhS4In2jfs9U3vtfWn6wtpSDuOMpCfF6B
	56BickgaCegUqlmQSUCpCKun2y2NAawxVzwuymtBte7e+KS8LkR3m71O3QB51IZ0gAOLiaGvreE
	t71fL5M05Tog4CD2VcqUACRvsneAOXe8k2jO1/D/rTEuXRzPfzNfC0nqzGAio8R+1vAwJI+iGwy
	muro9tMta7IB8QDFFZTuZk9ZhKXoOUAbMRxhns21XiNfHiMMfQWnVL6nXPFgEJhkjuKkxpH0rMq
	v6SW4FJ+qdUQXd8ZoPraitp7v43N5L9j4wUkX3iaP+mt
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id
 71dfb90a1353d-5c7ed846723mr18349037e0c.8.1788902456679; Tue, 08 Sep 2026
 14:20:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
 <CAAgWFh2iPJzQ5PJfFpPBTdgZ=GFjy7Eoz5C0e1WwFMuOuyJSTQ@mail.gmail.com> <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
In-Reply-To: <DLA3DUADGEQX.1Z2G7Z4TYFK1@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 8 Sep 2026 17:20:30 -0400
X-Gm-Features: AcwNN1WUDXxoNO6V6IWGTSyf4m-_qnTdLZpGwBIrUYQYwOu9jMMSrLkSn7q6ieM
Message-ID: <CAAgWFh3FoAJND1wS6Wu_taUWPYGXpawEtKUiAwR3HpjcqXyWGA@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Sep 8, 2026 at 4:48 PM CEST, M Henning wrote:
> > On Thu, Sep 3, 2026 at 6:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> Because userspace otherwise has to figure out the architecture itself =
based on
> >> the chipid, while the kernel already did derive this information.
> >>
> >> There's many ways userspace could do this, and I don't want to incenti=
vise any
> >> of them.
> >>
> >> For instance, you previously showed how userspace derives the SM value=
 from the
> >> chipid with sm_for_chipset() in mesa with its own lookup table.
> >>
> >> Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.
> >>
> >>         fn is_turing(&self) -> bool {
> >>             self.sm() >=3D 73 && self.sm() < 80
> >>         }
> >>
> >>         fn is_ampere(&self) -> bool {
> >>             self.sm() >=3D 80 && self.sm() < 89
> >>         }
> >>
> >>         fn is_ada(&self) -> bool {
> >>             self.sm() =3D=3D 89
> >>         }
> >>
> >>         #[allow(dead_code)]
> >>         fn is_hopper(&self) -> bool {
> >>             self.sm() >=3D 90 && self.sm() < 100
> >>         }
> >>
> >>         fn is_blackwell_a(&self) -> bool {
> >>             self.sm() >=3D 100 && self.sm() < 110
> >>         }
> >>
> >>         fn is_blackwell_b(&self) -> bool {
> >>             self.sm() >=3D 120 && self.sm() < 130
> >>         }
> >>
> >>         fn is_blackwell(&self) -> bool {
> >>             self.is_blackwell_a() || self.is_blackwell_b()
> >>         }
> >>
> >> That's two unnecessary indirections for something the kernel already h=
as
> >> available.
> >
> > Userspace mostly uses sm id and engine id for feature checks, and I'd
> > like to keep it that way.
>
> Please note that I did not ask to change any of that in the context of
> chipset/architecture enums.
>
> What I said is that I don't want to incentivise userspace to derive the
> architecture of a chip on its own, given that the kernel already does thi=
s. (If
> it is never needed, that's fine too, then we don't need to export it. :)
>
> Of course, architecture and engine class id can't be used interchangeably=
. The
> engine class id is more fine grained. For instance, the engine class id i=
s
> different for GA100 compared to all other Ampere chips.
>
> At a quick glance the code above looked to me as if it doesn't care about=
 the
> engine class id, because the granularity is architecture granularity and =
not
> engine class id granularity. But at a second glance, I think you are actu=
ally
> deriving the engine class id and it just happens that the code does not n=
eed to
> consider e.g. AMPERE_A vs. AMPERE_B, which is why you don't have an
> is_ampere_{a,b}() accessor I suppose.
>
> That said, nova can easily export the engine class id information instead=
 of the
> architecture; the kernel will likely need the engine class id anyway. (Al=
though
> it depends a bit on the GSP-RM API, I think technically it could get away
> without the driver passing it in.)

I guess my point is that the entire compiler uses SMs everywhere. It
largely only knows what sm you're running. The is_blackwell()
functions are helper functions and are not typical of most checks in
the compiler. I don't consider this "two unnecessary indirections" and
I think the code you quoted is fine.
