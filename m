Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792949894;
	b=jgve4e1iriAA9bs+ccPB1Sl8cJTmk7ZysLjLp5Ak2a8pOdRjZDe6+EA7KVKlkWIQKBPf
	 nQry73CcZzRxpdfZFtBHvW9T7N68oPJUT/dVFS3g9hcnNOHeO6uJPBY/kfQQM0pWPuIEI
	 j+yy4Z0/Xk8TwmpxA9ExtmRAwwd0DvR+hdi1Koh3Y+lMSDNOrdqmaCKIQQ7AOxpwLcJIl
	 tHVpCUt8NF8d0lvH0rbCjx2TVNcW8/VZdtZ6aOK9xkDRu4DF2aD2+/1+z28d6TOstoeUK
	 3/gwZHVJmyh4wy5DvAt4cn7B0qAkUMXT3hIzz0LVo5YLtzHs2L/USK4G7IJ4v+fSvkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
	b=a5+e6mGTowcaDz+n50nCGKd8XNUXB+r7iOcXUfKvrz65tPPJdczOjKrKqziLPJ7m08lF
	 pnyu7sj/w2NFLOkn57mVEyudnDGJaDXntEH6c7u60GE3aONw6Aej2IZ24k/yujdq1Xlcw
	 mToJ51Hytk84ERt/2VDkXt7jSdr93dG6hvp8oZ+jyeBVfuVuzlMp7IBahjvtt1GykmI4h
	 aYqOodHYoeiiP/KJdckGKWLuXLijePk8l5Vgxetd+Jj62uzD40VWwHywpb/YR+vneFOAO
	 taBK65Ut1cstILmhdGwd/SYuOQmRmb0dJgW5mtRJ6vA8vYr7YK6/qyBSWTdZNmcvDcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nIkPcrj4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1E606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nIkPcrj4
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso1380282137.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792949893; cv=none;
        d=google.com; s=arc-20260327;
        b=jZZw4S4SiMYKCKapWeeD6jki9Z8fuTmLTGEmzWaiA7F2DYTPF/K1SPQ/Ev//QAZHiY
         qytkwbJCjNbVkFT4r4xlbNpelZTK1r1OXjDfk/EA+b/Z153Rww2tAX5mKt8+wG8Muu+r
         fFqfaOM3nWVn64NFNtnyEG65f8QnOdqLEs7uaCFO+xLOPJiaLgbEHYB2FeHXF6aguzRB
         bltRHTdRnnRJNXaqmfK79mGQIczOtzC/9YGLp9aGECXQnTesWOTL56fV1PEHcAr5224w
         W1ez3k1FUsuDNCdQwaRBjScPV9BWB2+Rl5IQYBEa8F2FJiYsLXDFAVwg9OK9ubFxyobc
         2VGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        fh=RQJGZn2xhIeZ3MeykGPB+xDIIIR7ioFxzDKMPLBj7VY=;
        b=NxiyeRSi4MiSYnxHZ+OHkaFvH1uzaQysU+ZTym7FwNrJiPUxYiMN5wqNQLqNzpQgP1
         BotL+y1MHKo2QMYajQyt9mE94/dFHmST4T6mg+sd64eujlJ8idgwmQ2Ueh1GWcgLvdY4
         Bcs1qdu+Tnd9GfyKLhVxAr9tHOyXhObrAodESKkvK5Uf8xWom3uSHdgmsdAmQrCUb9f9
         uorlZwNT3jmMZy3/RqKx+3ECjMB5tGBw8WjYlhgmVUV4GQSW9R869X5uzD7MZLIhljlO
         bOtSOk63+Xymy4mxRMZcWRaSpjf0KNMt2fK/VkbUYhWh0R8QmXpt9kixUpDV4UXNJgFB
         AeXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949893; x=1793554693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=nIkPcrj4adrfpAUrnBjpXJhXo/oI3cDEOj8KZyAVt8jj+1EStmwZqQx6GSUr11keuw
         w87YVz9pZMNT+G+C1BdlQnlBHofrKt1dh4OOzzwiKPq71UzNF+gAcValpDFmvoB7lG8G
         nmBVsbkZc3GW7xmnz2JnQCeo4huxSWLe3l9ead1ZSSoGlt80L5FzQomyf4dzsYjT/gUB
         9XpTqLaQv5GCGA1NfIwCYuxaQ6d8ANH3T28JrOdK4QsmRTtjeytvJHDrtiTQfRxvWNX1
         LR41TNA2Ed4NX5bRprt64EWmwRD+zEUUvdkH6Ro6UX+A8eaE+uCMUFZZkL9piVK9nvUq
         JNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949893; x=1793554693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnZXVXFJcjscxnrsOc4diI+ORhtNKVuKMIKyqdM2PuM=;
        b=qW48FXwP76nQKOIkjVWv6MMRIyZJ/hDmJkR/fYwC+ORjgISeHczBv12+QyfKm3VS37
         yIrNYKTeIdZQdlDjIssQ4gSBkADah37xO/OBUM6FjkR1bHi/ENP5jtHXJpYKlmqYSZM7
         VeCRogZndgywJjAc07oQAGkMxxEWlVV1sziAAkonoC/X+EW+HY+QukQjJAxZlAHpd6pS
         9OCAN/YCQFmyZcSs2C9DDja/F0dvT+GexmT+/dVf54xnHQ4631hkYiVwy/ydA4gFe9MH
         RwWDt0mRiPC43/Q7v8QvTwJrVC+Aq7XaE4K53GoPhF4m9ssZmZbPHNi5lnwC2+Zdf0oD
         f0RQ==
X-Forwarded-Encrypted: i=1; AKwUvById0fqdJC8Ra+uucwGxEIT5f1yK8mI0+CSkQCiyuAOcwe3bkc64Jzuil34vCk0NzbSD9llL48panNNs7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0W18zQpe4nr3p+/wmG4B6IeabKFgwhP2iY1tm0x0i8rSoBoqJ
	lDW4/MepNUL7zq27xd34JDdakW2+s7LR9ivyQexy7kPg59zwnFKEiuTP0hrso+FIL7SPkcbOurd
	dSnOkhDuGYTQeU/MX6w/WiG8cLEZGG2I=
X-Gm-Gg: AYBFou2dCzjBRnht1m0ugKUpDazWqK8OKZPrqmWTfThFit+5mdqJn3kNKejKsiPZ4VF
	ZS7IMlFum2aCw/dZuXdQFM92V1qyQvDLLzDptuZzXdb1Wg4Twqp+3IhmqvCnNGHMtH/G079HKfM
	AZB4NBTzRUWryBcgKXq8n532ljz7DO4PE5jGvDRP8e4YRDpjGOfyWuczqVLDmdXSMle/E62vZnX
	hFv0j8wQ1OPrqXlUZ/RFY5zknuRcpuLJYbBGA7cQVHRH6kdhz5eqnQZybnZljcP+JLGgzqD6Xgz
	6X1MDs1JI0DbjzmD+YootHwLQr+64+0gzVhO15P2a3obJOvBdnmpNYRbhHIq0VbnirMEuGLOJ8a
	NntmiTdHu6GxlqLXDyNoyewsZnDy1HAtwPK97/wUyAPPPnkGzuvyhA/GUNXPT5XlzaHARgj3fwQ
	KPyWYFGiU4Bw3dVljFja6KljAXBkd1PI2s8QhR4KNK99eh4403FTT4M3GIN+4P7IyZx5BKwpFsm
	VTYGd9M2vwd0TTKV+Jj1QoWMSx+nrDsRxvzpyFoGJkXQXADCJU=
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr1213666137.14.1792949893405; Sun, 25 Oct 2026
 10:38:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
 <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
 <atseYvQUYvpMFEIM@ashevche-desk.local> <CADvTj4pRW9q6VyQ=nLi8q0mMF8LgccfO4eqAeqgzzgOkDno1dw@mail.gmail.com>
 <CAGb2v65LVm1GV2kV4bVO8YJd16tkubHOvXUtbJ3uuBw2O3TBsA@mail.gmail.com>
 <atywVnHU5NsP_gOP@ashevche-desk.local> <CAGb2v64P2rM0VnFh0NfNhi+3_xGPYkxt2j+2hmBMu5ZvugHRow@mail.gmail.com>
 <aty37_xHO-QRa7hQ@ashevche-desk.local> <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
In-Reply-To: <CAGb2v66jqrrix903k2OT-z0kV-9XWm6LpXmHQsCyLL5P6uXD7Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 11:38:00 -0600
X-Gm-Features: AclHuK9ADptacPxgJpmNc7NJsHyAAEhwuFjXIctIvJ_VhKssk-2-2xQxAyeIEHs
Message-ID: <CADvTj4p1vxCUsNk98Q=TRkvtZQ4LzXNY9V-2GT30aspRGUgrsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
To: wens@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 8:10=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, Oct 24, 2026 at 10:51=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:41:55PM +0900, Chen-Yu Tsai wrote:
> > > On Sat, Oct 24, 2026 at 10:19=E2=80=AFPM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sat, Oct 24, 2026 at 10:10:33PM +0900, Chen-Yu Tsai wrote:
> > > > > On Sat, Oct 24, 2026 at 12:12=E2=80=AFAM James Hilliard
> > > > > <james.hilliard1@gmail.com> wrote:
> > > > > > On Fri, Oct 23, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Oct 23, 2026 at 01:33:50AM -0600, James Hilliard wrot=
e:
> >
> > ...
> >
> > > > > > > >       /* Internal 8250 only */
> > > > > > > >       UART_PORT_AIROHA                =3D 124,
> > > > > > > >       UART_PORT_AIROHA_HS             =3D 125,
> > > > > > > > +     UART_PORT_DW_APB_256    =3D 126,
> > > > > > >
> > > > > > > Why? Besides the poorly chosen name, what prevents us from mo=
difying the
> > > > > > > corresponding parameters at probe time by leaving the one of =
the existing
> > > > > > > types?
> > > > > >
> > > > > > The new type was primarily a way to reuse the core's FIFO confi=
guration
> > > > > > table, including the RX trigger mapping. H616 uses thresholds o=
f 1, 64,
> > > > > > 128 and 254 bytes, whereas PORT_16550A maps the same FCR bits t=
o 1, 4, 8
> > > > > > and 14 bytes. Overriding only fifosize and tx_loadsz would leav=
e
> > > > > > rx_trig_bytes reporting and selecting the wrong thresholds.
> > > > > >
> > > > > > The core already has get_rxtrig/set_rxtrig callbacks, though. I=
'll rework
> > > > > > this to retain PORT_16550A, supply the H616 FIFO parameters dur=
ing setup,
> > > > > > and use those callbacks for the correct trigger mapping.
> > > > >
> > > > > Please consider just taking the FIFO size from the DT. On some ch=
ips
> > > > > not every UART has the same size FIFO, so we already need to deal=
 with
> > > > > it.
> > > > >
> > > > > Also, FIFO size is a standard UART DT property, though somehow no=
t included
> > > > > for dw-uart.
> > > >
> > > > FWIW, it supports all standard properties for UART.
> > > > Check what uart_read_port_properties() does.
> > >
> > > Ah, that's nice. I hacked up something [1] in the past to get it to
> > > work, but that was probably before you added the helper. I never got
> > > around to splitting up the commits and sending it out.
> >
> > Hmm... The helper is in the kernel for the past 2.5 years.
> > Maybe you rebased it and it lost original dates?
>
> I had been carrying the changes locally without committing them. I only
> committed them recently to back them up remotely. So yeah, the dates are
> not accurate.
>
> > But if it's not working, we need to address that, I believe it should w=
ork out
> > of the box, because the same function is used across dozen of serial dr=
ivers.
>
> The new helper probably works fine. I can rework my code to use the value=
s
> given by the helpers and give it a try sometime next week.

I've incorporated that approach into v3[0]. The H616 DTS supplies
fifo-size =3D <256>, and the driver uses the value populated by
uart_read_port_properties() for the transmit load and receive-trigger
mapping.

[0] https://lore.kernel.org/all/20261024-submit-h616-uart-fifo-v1-v3-4-286f=
c1b8c3c1@gmail.com/T/

>
> > It might be an issue in 8250_dw.c, but I can't tell for sure.
> >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/co=
mmit/?id=3De7e0741fa04f349ad9f94a4059e32467a30ef5d9
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
