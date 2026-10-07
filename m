Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DA4E56D0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401519; cv=pass; b=A7o9mvBf+VwH3xcTVR/JK1ZBsnh42rCC/Ztn0bAHYs3Od5vgYVUtbsjRXSNimVQ+e0FhpsREhtDO1MG0qUOod06GAyCG4QHElIT8k0bopQUK3gpCXiPxwXtzNE5trdRyJ6fSHnEq7CXzNK5CRRQvksUbEPgp3KkBdm5Ch9WrTD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401519; c=relaxed/simple;
	bh=6rSFxtUBaWG74aDAzotnkSg5siJL9vuaUhUFkXqPytk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEVyHtXkePmQFHat2ZAmmLqEmSyDCO4jeIRfZC8b5kjPWus6yJDkeqk7uvy4weH5ExxzB7CDRzHsFgw9I3CNmn4l00s6femG/bmoJrSgfv7FGiBNCRRyt7CAkflfCM8KwMFAmu/QMawP9GqTS/8tAngAqqfQsL9VBP28NCRE0rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0XlLgtR; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0XlLgtR"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c82d057971so2001759e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791401515; cv=none;
        d=google.com; s=arc-20260327;
        b=nZsXz9F/oXM2HDfhGyGXMnJurHpo6j3uMu7C3t5q46CRuDmGL8yO41w+0QYMQF0Y9Y
         urvdAAo5IBrcEXmwJghatbcqnZHa7NvZRtMROf/Q4sQi5Ko7MEjzdosgpLzocFBuT0oz
         AcUoP1wM5CdYRlhmXn782DLprEdptYIfGj2/zotTNeKgVyXNiMKt48a5VvhA+jEk+RJ/
         SRHX/3d2IVV5dGji2Po3Wo7RBIX4cLflquK441SUn9r2/4oRngT26WXQr7pLdUKt2PJJ
         gTaeUDSSqgeAnxCU94r8Z8OUNCpbjWP+ZGUeIuXdrkSL8PSM3CzDWnVvv5dQQCVLnoT2
         Ch9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        fh=8zPRky4f3BDUIc49Y+575xzGunOz4K0CpU6Ki6tnh4Q=;
        b=q+7wREJOaNCxX+Ro9XOE4STmFsKMOV5GWQR3o38RWlZviXNNya6hTYqumKVZ0QDdKK
         VqxyIW66jXdvfDS9C95KFgJQckRusWngKQrnX7x9t0XhwXWpdaaaaXBh/IXycgevwbks
         tqaf989yo9XK111fItcwLrbQpvAye7TyallfXwkqAcckNuaLeURvQBzTN01g8Jqc/8qJ
         v5Gh8K1lM9c7YwN8lLhGPiHaUhnrvajskBMy4HuR2oC1s6Ulwu9UFv1Id/um3j1ZxfbN
         GCAUJPaSWShPiE3IocVKhBQ8gLEuNzEtWT9UBJ924r5zmHd1k7XEVFbwWUmI0qti2so8
         xC8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791401515; x=1792006315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        b=Q0XlLgtRaHW1LeIn/EQ3F+pfiumTeMRQz8VsKL6pnBtreBq95UTNYVq6c9EuMqgvGA
         bi/1KSRycpY30jFGdM4NmxFbUsqpjElnarRqiyivWnvKh9slwS7X29OmQp9foIPkRxje
         NlhBm7hNO1wr4hmKuS6MMujab/mCuWRETru9osNQH9kivomf9PQ4wcJHpJSqb++EQnr6
         0GiDBIg6CWZzhJY/fACiMRn+UyZiklD/PdM4HWS3aDt+umxquL+iVdXiukgW+lrgsNd3
         4YSJ+EFtfa4PrIzCw8ZArtSaXi6CZ3aYmzyw20+JqJYob3oFXpZpqAjJrkMZiEaAzjPd
         Sapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791401515; x=1792006315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmazQOFb88cZY29BLbashgs+FNWCLfkAyMKJs7RtEhE=;
        b=jv3lj2YCnUn5+V4lC47gwfKqINhH7rHjsKhLWI26w3eD9c+I5x9YOMWHTiei1ijVMQ
         Y0023QNoJ75z2txVxv+fc2O78O+542dpbTRSq+htnzoB0i3lKRtrqi24N8/2sAXLlx3o
         CFO+GCpPT/dLUwqYlk9hN/h4xgu82uck+dQSJHJD5uxgza1GCAD6nGqmz+I+mJ3DFs5j
         TArBv4ibYIkfIvO6/vN6Cekfsp6InfDacNHLuWE7KuJE4RQ025Bm8cxad/eEcF/F5srJ
         EGcNs+xLZnDTc1PP3qlctC2FJRR0M6ok1PZFcsyXjvjAoVBak/OKW67mjgrht19Rr62Y
         /tqA==
X-Forwarded-Encrypted: i=1; AKwUvBw5RFo8H+6ncGQEqB/f37KqXzbpvfAmf11qxsXHCWclub42RILmmkQobm/B0cKbgTGfQriRNpbOuxz2e4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKAxv4M2thyKoVi5LLJnzFgf3X699xo7WHhdf85wx2HUXftEX0
	6raR2vs1ApMmxydF6wlW4Tj9+6vVHagk85d9r/f67m1ZM9wGdl2jc+kmV2tpNlMl6JN0eckidDX
	tij+Pz7hGAdhtQDceUGxbbmkvhGB8DUc=
X-Gm-Gg: AYBFou1WkQ2Bpod5qR+Df1/6KbEVE9/kgQ2K1SdRAdoza+/JoQel6D9c58ZhTVo4aJF
	q/ET/IXUikC2UEa3AbMuiYXNNKXOoXWa97RTHSzRs1m1hCj56VDxzMcNLMMlJX/yI0iYI60C+aa
	HxDRRPF2T3RjHcU3fdzeluyIVX8CC+T7c8cIiFVs7X0vC2CkEYGoAi3MSIFu6PK18QUZW+sB/Do
	z8RFK1XUvuJgob0wHpuDCVJMr99d2tvg6T779zCLXfoJ272mHhwSILIm4ow9zF8fDTuLDpScYR+
	WYFkWvri0KzmcRfWGyxKpyjP2BJzxemZVk/MXsuiuI+m7+vKL0CQ/s/U/ByQVHgM5hOyvmNWtEB
	Awtnf1QMjOpfGUnOobv6OodqjBWcIv5De6xDVABHbbXVI9nq0QmdGyoHcOsc9IwLZ4HA3vp0Fmz
	JSXQYGNjqNqi9ZyzyA27Xq7xwUyZuwbKddOPzBoPX7prki
X-Received: by 2002:a05:6102:a4c:b0:7c8:3b8c:82b8 with SMTP id
 ada2fe7eead31-7ca38b6e963mr1119834137.17.1791401515148; Wed, 07 Oct 2026
 12:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org> <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
 <e7fea95d-1ce2-4c5a-891d-5e5899931329@lunn.ch> <CADvTj4pm8fbgGDiyXVHubnM93qOey7o18O+MDU68MSisXVvHtw@mail.gmail.com>
 <f304ee6d-bbc2-4f76-964a-998c3febb8dc@lunn.ch> <CADvTj4pniuLUzsHP_kv03rFUkUD87PD9yVZ=HnW0CsZX78OxLQ@mail.gmail.com>
 <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
In-Reply-To: <98a7f952-37cd-4886-acb2-e87743e51fba@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 7 Oct 2026 13:31:43 -0600
X-Gm-Features: AclHuK-r6Ggh8hcrYXS3hhyuBupmyUJCn-QYPzqWblWY-KLgPSt5UCA_gEavD14
Message-ID: <CADvTj4ozfxA3E13g5sV2tPogDk=S+VOyf_PAXZVQyaozoe3O0w@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 12:33=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 11:00:50AM -0600, James Hilliard wrote:
> > On Wed, Oct 7, 2026 at 6:46=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Tue, Oct 06, 2026 at 07:27:05PM -0600, James Hilliard wrote:
> > > > On Tue, Oct 6, 2026 at 6:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch>=
 wrote:
> > > > >
> > > > > On Tue, Oct 06, 2026 at 05:17:20PM -0600, James Hilliard wrote:
> > > > > > On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@ker=
nel.org> wrote:
> > > > > > >
> > > > > > > On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > > > > > > > Please do not repost the series just to address the above=
. Instead,
> > > > > > > > > reply to this email with the missing information, so that=
 reviewers
> > > > > > > > > can take it into account. If the series needs another rev=
ision for
> > > > > > > > > other reasons, please include the information in the comm=
it messages
> > > > > > > > > then.
> > > > > > >
> > > > > > > Please make sure you read this paragraph, to the end.
> > > > > >
> > > > > > How much detail should I be including?
> > > > >
> > > > > We want to decide should the patch go to net, because it is a rea=
l
> > > > > problem which bothers somebody. Or is it a theoretical problem wh=
ich
> > > > > will never happen, so we might want net-next, or maybe /dev/null.
> > > >
> > > > I mean, it's in an error handling pathway that could be hit if ther=
e's
> > > > an -ENOMEM error on an IRQ-action allocation.
> > >
> > > ENOMEM does not happen for small allocations.
> > >
> > > https://lwn.net/Articles/627419/
> > >
> > > So at first glance, this seems totally theoretical, it will never
> > > happen. So net-next, no need for a Fixes tag, etc.
> >
> > It looks like there might be a few other ways to hit this cleanup pathw=
ay,
> > not sure how plausible this is in practice however.
>
> So lets go for net-next. If anybody hits this for real, we can
> backport the change to stable.

Should I re-spin this on net-next with the fixes tag dropped? Or does
this apply as-is on net-next?

>
>          Andrew
