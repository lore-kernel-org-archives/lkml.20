Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C9560AB1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928197; cv=pass; b=Q3t4kfmqoj8G/BIN7DA5/DjJq4pFAD/eKyAg+v6f0r3k/m+NstsxJdLPhZ/Dl3q0aEad8o6xoRuqjZDyQaB2hcNsrOYnFkpNNIMGMBJq2snzT8+fnPJTq/N1m6Z5S5xey5NVMq9NkkYpJ3cssTAHUFERjiElnOAYIVbMQGbAgUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928197; c=relaxed/simple;
	bh=hioDiOlURo8xdbGjD/3syLKxQLmoLjjsZ6hoRskxKGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJAkhCwZzLfFR4WLGIDJ0xuP+Swz/e5iR957B0Ly+xeEops4qd3R9sAkko5+8+Zz2tFgLO9+Ge/DXBS5sAHYwGE+RuJ3YK1yX9PcL+q+Vkyt12KhpVjeQWHiFuo6QUmngXQu6FMiYeeMfY+8JQAIztCrw3eNkszEtf4WC9kCtxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3/OjAZ2; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3/OjAZ2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso444147a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791928194; cv=none;
        d=google.com; s=arc-20260327;
        b=HQ0T9wU1SpS7bCNJvewzqoXE5N4yYYrpNjVHlCSBhrcGWDOwMXLBPsKJBmX2NzeD44
         Sliel9jEWu+62TWOrHQD6axN7k5Jsfj8uDH7zoHSZ8WK9LCMrcfsfMyrJ403oYBxsNrb
         4A72aBq6dsBYm4Us0gqcRzrA4CYAsdTUATxiUE2iQDAi5dFekh7PwtxROHXn4v9SXOG4
         QuJxuFXOVX40V/wEx/VSU9EWxAhofPebA1LiLchPrW46iYtPPJXAmOV8o4cMBteaaSQH
         gPbZPs0GU7v9BggUMVhvhH5IPR0Ok29n0mrp6mpZhY+wvhTnMr1touc0tFRaFMOfuzOZ
         4TWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZPrQT2G0Mv3qvoWmFl/L9HCd8QbTElzi8/7c9AFh2A=;
        fh=Z/ikU0L7nF9wWg9zDg/GQMXTs79ICdsHr19F2YxDcKc=;
        b=d5uyc840tkW1c6sM9jtXecSkOSOkBu54dRZwgs8WdwEIuXKBkQEjqAbvdKOYZspiKw
         pcxQUjUPpe4PV4/CpFqBP2gcXMS2aLpT8MwWYQAyFLfB0jdMfzWyahClUJZw3q02EkNB
         y0WsLdnG0AGgLYVpvCDKIzxAOmad3tTfug21vi2rAAAB0lYOWXsqK290lgPR3hKk4ANF
         oAxsF7byZevjFStBoaZaIDUyEGe7r4sGvBUGDStJIzEJw8nKi5o5j19+8WaHtaH7jT1R
         IYvV+1emKpT0u/kxoBRyE9JSA9vHugTOkc8gjm1Z2V6iayik0UUY0Mo5KQuShbmnuJIx
         m8XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791928194; x=1792532994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZPrQT2G0Mv3qvoWmFl/L9HCd8QbTElzi8/7c9AFh2A=;
        b=j3/OjAZ2nl4PNfdvBJaIEKA+mtEOUNX8P7VSxSdCJLLB3MzVMECxJlnYgjTPI/5jG6
         IZaVysbD+iWra/+q8m4MJes9UopmcyB5p8NSmEkiBGgC0r5HAJsVEYzHzPAOw160ZOox
         KuUn30o/U8bghCHneid+szoLLs3o+EVMCmSRUTCfQi5t2Ah6jAwxTYGGGq5FVu7vv74j
         j5+jiyRPRPdnC37+SzQlv+UyQYXJ1NIbebJJJeLGESeEiyqShar0gOPQMtLJBKPjH/ZP
         F/1qKkfwpU6vRLKluukHB1ljWWwdgwJWOSSqQK6+jxSZ2lm6c49kJARPROD+wRdF/FTI
         UB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928194; x=1792532994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZPrQT2G0Mv3qvoWmFl/L9HCd8QbTElzi8/7c9AFh2A=;
        b=TTln6AgUBsC0W5GSm9vyDSNszh3XXQ5jU9fN5WQbgm006S9Kxs2lb0lplSj8KFETQF
         x8ZQKC3QKuRYd5Qf57TBGzELmoTT3F8cOY8XL9tKEoNB9Ok1Trd82iZ9uzniMX6OTakz
         R7ql8PVoePPkb0wHaLcAgMitbiX/2Ut+U6jYhlgd9fWimRkfssYwzOfQo33TpoxT8tub
         0JvTBkZRaZ5xfPkPHWKdHXNKPnbWY/WXLCZ+/JEITUyzvd9VyprVAnMcF2385PIicLH+
         WUv9PTzCva1CPzAKg0wTzGfHs+L1ExhUe9WriTu0mW9kpi1xXiwlVW1vreKj/iKP4a00
         dM3w==
X-Forwarded-Encrypted: i=1; AKwUvByzN+gm2Ay6eWRHvyKycv/R9Rm7e3whDRNGEteQLTR8RubaNLGFIv9qoJfQC0xc/ShbSXkkJu0pglwK0JE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8uUvCYBgwKmvI0vbRmcvzqRQWaGi+nxuNssWzrCclS1MyjDy7
	P3aqtD8GQHVJZ9khJdgf5c4/GPuU86fCbs9+sIWDmgCvh3QFGL3dkoywAJXJH+Bxlc5kS9QlBXQ
	zYY7kSajX8mfnfr0U8sTwTyw7+p26Sl8=
X-Gm-Gg: AYBFou3lpiI3Of+RsV+CFW3uWYrDzx4+A+A7e6UPSebtR+IK6183/O0Ou3+KJ4IgkG7
	vbqldVzcSZRr+9gpIuXrEwkdd+ykxdUH5nNwCInuGtSPPsao2EVwolp4ar1xs3yRelYpvtfaCvK
	IMQ/tNudkjopastxy8tSc7OMdRCJt5/F45Ro1o05k6GlipeB3J6hHg+fDuHjCoyrrkXJaH58SR1
	UyrUgW5w0COMrjZebWGwXBToeeQhkohzqo24+/pGWfGtfgXhz64b9dz2zVTjlC30jxXMRQDx145
	cNtKvxwTVMkUsJM/7zN2qHamJ+dCIT5mATVMVwurpYPb58Ce3mN0zEaFo20E9/3p6uGDZhRmBR/
	xwvW/cXhigsHsg16g0EX4BTsCzwuWA8OfpMHkr13x0Q==
X-Received: by 2002:a05:6402:4006:b0:6b1:c526:afcd with SMTP id
 4fb4d7f45d1cf-6b1c526bc10mr5749588a12.11.1791928193882; Tue, 13 Oct 2026
 14:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012184826.986050-1-linmag7@gmail.com> <20261012184826.986050-9-linmag7@gmail.com>
 <2026101313-plank-outlet-d3da@gregkh>
In-Reply-To: <2026101313-plank-outlet-d3da@gregkh>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 13 Oct 2026 23:49:40 +0200
X-Gm-Features: AclHuK9ealETNMhI5yAH6CuVcBjpteVRfkO1A49G7BEeIOYibyNYpBtxXrN7t70
Message-ID: <CA+=Fv5TuSDvXc0kXkTVHSver1znah2pbMofgrfMFmiyCZgHfGA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] hvc: add an M3000 firmware console backend
To: Greg KH <gregkh@linuxfoundation.org>
Cc: davem@davemloft.net, andreas@gaisler.com, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jirislaby@kernel.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, krzk@kernel.org, 
	oleg@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Oct 13, 2026 at 3:04=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Oct 12, 2026 at 08:48:09PM +0200, Magnus Lindholm wrote:
> > Provide hvc0 through the M3000 Open Firmware pseudo-console, validating
> > the firmware model and console endpoints before registering it. Keep
> > firmware buffers in locked kernel mappings and serialize their use in
> > atomic console contexts through the existing SPARC p1275 interface.
> >
> > Poll input while the TTY is open and synchronize close with timer
> > rearming. Return zero on no progress so HVC retries buffered TTY output
> > but drops stalled console chunks instead of spinning indefinitely.
> > A firmware call that does not return remains unbounded.
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> > ---
> >  MAINTAINERS                 |   6 ++
> >  drivers/tty/hvc/Kconfig     |  10 ++
> >  drivers/tty/hvc/Makefile    |   1 +
> >  drivers/tty/hvc/hvc_m3000.c | 202 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 219 insertions(+)
> >  create mode 100644 drivers/tty/hvc/hvc_m3000.c
>
> I'm guessing this will go through the sparc tree, so:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> thanks,
>
> greg k-h

Thanks for taking the time to review this patch,  I hope to
get the full series through the sparc tree. I'll pick up your
tag for a v4 which I'll send out asap.

Regards
Magnus
