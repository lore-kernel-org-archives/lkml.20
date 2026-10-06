Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1830D3D349E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328663; cv=pass; b=bDqMTOq/JrCua4XmXIIwJcljLFCVUgxD9oFyyYNPLFuYO4pMLjueHoJQGn7qF3FmgOoM2wXgipu++lyzBwSs/9Y5aX9a2O2JTFg1ONFxOw4DH1Fh4n5/9j5Nh8tD6iDHBopOpbfRGj/Qpj52lP4naz+4sbWpJDahuW8BsTLAcz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328663; c=relaxed/simple;
	bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7w5dDK4JGcwyA0kri0BWXrPf7XIRbsicG5+cWwTU2uSJiY/Lfz/6+K+76flBU/l84JzBqZEBEsvxs3zXPH7KjJ8+fTMkeeS3OjHAtEwTaTbyHoKaU3A91tc4tE75c0hmvlXOJvEFoFm4N0Xg3SP3EBAkJC6ACMxjoRIDbtx8xY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUxA90SC; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUxA90SC"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab99038afso711934137.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791328652; cv=none;
        d=google.com; s=arc-20260327;
        b=JlkU01pTWXk5yxvT37JDa8eoOFL+7+0j2WTQNA8YYsZMb1gNSGlBLV1jSuzRqjEUts
         J2VmabP3DmWF24GHsPl2SNtAdg5UHH0hW2kmT7dkseYlOEnei9JlFY5tnURJWQhMrN96
         U7JVqfilrzNWn+yiJdtxAyZ/hq+rklbDUmpX01Cmik6DAmtc3OjTGjVLte3gSM5X5ea9
         syHBsn1PLIaN07E6Jg7BmDkBHdmICQmrbANudIbbd/pMaZfS9OBaZB99jdJo76vlKFYc
         hR2d7a2/oFf7giWxzkHPtQ7acIlDOzhEkKIBRfGy0lJw+zKArd1dvOuvxF4XhX4u/bBN
         LM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        fh=xwh9/CUZuSoM4vApL4dTdurYuOkpNVfs+e7Yb9FFO+s=;
        b=SRZJ9az5v+nEJUXm1zTWUy1xNt06z5CSWdz8dmwnwTcinXajJHxps6UfMTsCmpWbmN
         Z7rlqHiAU6wPHgeTfn6KEsVi/0TMvYBULNE9nD5MznRhfFteQ0xqJ6fW9aNdQEVssHhg
         wwoD1J37r0yOOe4zJagEZVhiPt6mH6s8nlPFX0Mv7mVy4skMQznu2AJQbK4ykj2Px1yB
         jG1MXJVj+X4V0Cy6uBj9OJeXEEFfNWK2nlugdsJH2+lkmzbLhDWYaDDkNMy0ZvfbWcFf
         2/40V6Qwz9Y9bivr+ZbscmOpAEMPv9T1HUWzj6pPlvqyb3jJxHu66m/+dlwzw9CS93pM
         h/LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791328652; x=1791933452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        b=sUxA90SCMoClTosV4Pw5lirOdqazlu5pk5m7lBv/xwcpgYVh2dFz0uRczs4yLgWCzH
         ss10IAXPA6+etAnvj06Mf2vdguWyUE9um5An7PWWb5aQSCzu7r0clIAdgsvUHVc9ntvN
         08/xaG8wgNwPZiVv3Osf0F5jf6fLvHmJQYxzX1RECSdQXaetDsstxLDmy10f2oWgj7no
         rxikn/J6bm5W/plKndWDyvSuNf+vmP7i6TrP0vNZn5m/VxANNHhN+/UccA0rjMFWHePs
         CYx9qDjGqaxObixU9DNuNtfZ1zfVLTcmJEv0Hx/5gcIi4olNDwZ8npfff3ancPVYEAmk
         vhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328652; x=1791933452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aO34Wg+EhZ2MBBOCazylrMjmoEMFQZsqrQuOcpOxfGo=;
        b=1vts3z6hcTKBNHA2N+zf1Eb3z2W+/ft0Dm/P5zAvKXSQ8dZBxbbycMG7aDaSPDJpAt
         e8WtRcvC46C8Rkyn2wtK+mo4qEfL7nMrxiKzuTz2EDLa9tcFxLQQZz57bCeuQawtMyBO
         ywe7K4cCAiGdf0qgoVoywjc4tAJ+UUVpdXjdjJ+dApUglSa2AJ2gdSFhn1zQ2cJZj8WJ
         9w45kjRr8Hedheo3Cjs96qRDtxs4I9OHLFV+Kz52sFG/NDiuRZ4aSxruSd4gjO1MnRgz
         AvngJWmTRI38got32PpRImArvj7L70p1axxF3E9nkFUBhkxz85nbEJEIxSy5jnJlZQw3
         2sLw==
X-Forwarded-Encrypted: i=1; AKwUvBx6+kbNIAx3mAtYDhkuYzja8QxV9u85AJ7lO1k2KKrAgPJBVIjFQVFLphcjD5WLgqNRLcmqACubDA/I03g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1iohmn+5yU0Jq9JiFjQXmJjOQtW6wnHUvQngxY+BM76ESRjBY
	NtNO9pCTDVw0gkLCKsmI4pxs8OBqlZcgLi3z6byUnb+S1Ta0VeeOjd89xvvOGUZODejgfOUGQ47
	+89rGo1FWaLPEN9nX9FDFeQnBW5JrLec=
X-Gm-Gg: AYBFou2E9AGj2CuPiRGRNVnVzJTO2NmNylj8hqpipbDxPNJWLxBnlB+g+tv7Zz2Iwje
	BWXUs+dkGb8ejxdWrinbBxBzjBF8QjGI5gRvucKEM5esJQIaGscLwCVahDwGXQCvjvVNRFlPhxy
	KBWAPQrOZF4eXLrkgkHTEhYp7AqVb9/T1miv1nYNDnoj4B6/mrkOYwTuf2Mt1IsVyt/aFQrDAmL
	jJ8/Z/csJkd0AOr+8Zr46ojctpsxH2BLVkTZVhxMr/6N08mTm6M8/W8qu7XeUT0+lLPiQOxJMSm
	WYTind4JCFWaQdAVXDK+TK1b6nWbbrX1H16UgLMFtjlUrsFmnsKkK4Nga0/LX5sQXB3AGxgvQ4T
	XfRYssD1wgiPelyjE9ixU6sXx8dNkvsTGxU6BIzEAYiKYhCTM7lZGTsQEBKpyGX/HrAXXOR8Zoh
	vXs8OoHtLYEG2DBM3OOHyGUo7VfIsfxUw8RHU3A5uKR9Ua4++Zft7MoMri
X-Received: by 2002:a05:6102:2924:b0:7ad:3ad3:997a with SMTP id
 ada2fe7eead31-7ca36e443a7mr124714137.5.1791328651645; Tue, 06 Oct 2026
 16:17:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-stmmac-irq-unwind-v2-1-194591c87460@gmail.com>
 <179127056620.2231598.8882282421523696709@kernel.org> <CADvTj4orth=RYtb78ND1rdiYh2yb6d+TjZt5ohK_-+1mnVpqfQ@mail.gmail.com>
 <20261006155214.63c5cb5b@kernel.org>
In-Reply-To: <20261006155214.63c5cb5b@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Oct 2026 17:17:20 -0600
X-Gm-Features: AclHuK95whFkQF1vfwc0DrtRzHj7zemriMM1hLHVnrlFjQ1KlVVaQcu7yNMv7bU
Message-ID: <CADvTj4obBNgR4w3BW4-gCU-=LUxesQdTRN=EdWTcx7VznFi4kA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Nicolai Buchwitz <nb@tipi-net.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 4:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Tue, 6 Oct 2026 01:14:52 -0600 James Hilliard wrote:
> > > Please do not repost the series just to address the above. Instead,
> > > reply to this email with the missing information, so that reviewers
> > > can take it into account. If the series needs another revision for
> > > other reasons, please include the information in the commit messages
> > > then.
>
> Please make sure you read this paragraph, to the end.

How much detail should I be including? I had previously been told to try
and keep commit message more terse[0] and this info didn't seem particularl=
y
useful.

Should I put this info below the --- separator so it doesn't end up in the
final commit or something like that?

[0] https://lore.kernel.org/all/CAD++jL=3D6Ov5BPK1naX6orzMsrJPm_g6SkdRaU6Ji=
+okXMFaZdQ@mail.gmail.com/
