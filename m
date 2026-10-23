Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768951;
	b=O+OXrNm4AHKYjGCKZ75iXTkx7UPR4ejwKZm41024bcb5nFUn/jgmGKwnJcn/GMmi8XD2
	 HDP+827h1H3hViUdra014CXPbapgeb5wUYnBozRBuEPAM0YCqY5YTrwWLqkbF/vZUO4/I
	 qPfOR2qRZwfpTBbkJw8n9snRzdw1ZoLby8OzUS1xhXsJMVfUk/kvdGuotClSn+17objhD
	 06KlR2rN7ocax0xRg0TW79QaYOMSKbZqcYvCfJFGVULPyYnKmzkYs2gKB23B2Lbbwlfsh
	 h28T0+TqNJWD+42pHY4maCRKWfTCsO60McT99ItLncO4s/cPIIYzhPACXD4ORX2CjNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=av85Zp26ndUGMa6UB2PtA2xcF2e8NOyOI1+Wh1hLZwk=;
	b=G6bb4/R/Wc2jOI3fuf7xPLfAX3bxa24ZzgS4HMOIgf6N8Swpqkl99TSYZiwtUUYWAsDF
	 Ihvpl9A0BmC2pSAobJp9woQ0tCcKqEp9R0s/hX4w/hHt2fCZ0wiz/wOymScHNUBQN8RFV
	 ig/6hn8exT2omEYHTatafTZM49d2VprVc6fjQ/TwV8cp5WFVWvvALmOKrDY+zY29PvLL6
	 9eF1JvmNgbnZIpLeMkINKf+170bsyqnSu5l5g8lmBCype40HfPViEWkic1Nyu1yqYdX1U
	 UOvNmO+CwvTjo7Ox+nqIz+JPVQ9b4cbBU8BaTWHt94I8gX5Rf5iNf3v+FNxATvx9vEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=if4f9+BC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=if4f9+BC
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso1391609a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768949; cv=none;
        d=google.com; s=arc-20260327;
        b=sV/avzb4IJOtCHz9q3WTFpdlNuD/oGge0r6pw3QQCGbwbmSkPJ313HBMi5t7/HS+51
         7itjri8M2nNQIAVznrI6s0p0Z8dwW8aeCywo2x6uZ0rtLae5Ibc4n5C/FW2B2IODHJ4r
         L1JWyfWuuIDFzutKQ2x+JECNukolxMM7VuevtPziwiimPL4C1dt8n5r3iNYYozC3C5yJ
         77jxMbIJfe6YhXBFAa6qR9hB0avlj8156qwJaz94Nk2OneUNoIyr6zd6W6/vkY12FunO
         /lVQItXWQfdusXNDj02CGpb7xEuj3qQZB9Xjh1kHtxVGFyW+MRPsMzqC5mT/Gn6vjDjO
         02iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=av85Zp26ndUGMa6UB2PtA2xcF2e8NOyOI1+Wh1hLZwk=;
        fh=+s1mP6YyVPww07yyiX7IsTm6Pf2gpWW2wLzXB0Pm9qw=;
        b=KBmaOuwMcNcvdvCBRMmqT0k6O9TatEer7GViIcmk1hs2cEvxdtp6vdnYDu/9qOdMP9
         EY9fTwJFJVBizOx5YLoAXAKP5kpOCparmUJyaTvraZHIP9EdI0aCe2D8rIJluCz/RklX
         84dJ4AUZboRk6IKkYy+5aRwiZtG6IbRnzAqmBZVUXjXeGl//9H+rmuWKpESDcTJLRlXE
         l5XzH9EnIPseBt8ARnSaJsodEB6nnmXP5pmeU/8kmwmgSszsTUPgysokhM67rvk5lQUs
         XxLp4po6LoYOm2iG/1vCooGrXGtkteAN2jtG8Rkg+FYW00ePoA/y94WVMtr0xlIfFFXk
         YwiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792768949; x=1793373749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=av85Zp26ndUGMa6UB2PtA2xcF2e8NOyOI1+Wh1hLZwk=;
        b=if4f9+BCfnfQWb18ZLZ22Fhe2xvqVpgpiMhZLIlHNz65Pz6/vVtkXzm5xTFBw1+dEz
         0JbcNVLeC7T7pOjvIHKGyTgqZG14H4Q71Jdvv8sAm1DTWGDFOf0KwWx6T9wWOsKiYb+t
         gQrxfV2mK0uFmE5TdEp4BtzxXcxgW0p9DG01RvtHjSDRiJeYCw2Erd1zgM42nFRz7ufh
         mFpve0IYOYmnwDa+l0N+iQ8A3QuwnT3r/S6635yUrCWmpyFYF+2sMH4NGtT8Z5g5lckb
         drUkVAM3O6c9n+uC58HYEHO0rDFCjwRDP8qd6rRblemKgCAGQ38b7YFIUm1NRPDhOjEe
         IG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768949; x=1793373749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=av85Zp26ndUGMa6UB2PtA2xcF2e8NOyOI1+Wh1hLZwk=;
        b=wx3nAJSDcjwHhE9Ne6Qa3G6INuuFSClL21GVhqq9CZBL8C9ULtnVJmsGyctNKijQt8
         Hn5s8+MMWHWQSmNdcTT7V9PvVyq7UCU1CKSlH6sDELd8/vP+wJtC8vYJQF7MPAjxCJUb
         QRJctcXFUvVBLpTZcMaUQ69PXNi05uwvvBAh2FW4KGD4xkAjC1mTO1RCzZ1UaBtmFSM+
         ZiMEpoS352cudhwBL5y5kMRcyTeNabK8Tqbt9fkUO4A1d5MnKpgD7y8iCRYuED51NV69
         9simqwYRd1Y4TcftetyfTUQuY+3T4y7R1HU79s2HzBxK9PeRmcLy8CIqlhQaVa+W8b69
         FOwg==
X-Forwarded-Encrypted: i=1; AKwUvBzzxr+xqWltnqejE8dlRSyifo9e/peYdqFAaoNUGTZWZQhcNWTncJtkPBngToxrVgONACoemt4gQetdcIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVkJCkx1qKy2oehl/BUfg5JLaEttoYC/isnx7+haba/IBEx3au
	rBRK/fkAm8xAF6nbAKDzETaG4zMPF1D4+i0Jgy0j+3nZ8Ge3a9vp7JrnnapmkZPBMMl+3TRsDJ5
	0mChKoUQusvfOEYcQ1dPszngz2ctLzkk=
X-Gm-Gg: AYBFou1U3Vjm1uZgi5Al3RFglpIJkJRImRf9TsEGQnr3LeNKjYSXQiApyJNjWLfaP6e
	ywdd+MNsobCzlyxYHelSdyo6/Pz7NfA+6BTDTWXL+GXIUSWEmpXsqN90yxnq1KKZz2ofdNKmSD7
	Br22gjlUwXT9Cr1tKf1dvrZGD604D0xXNvjY2JyYW1X1RPfU9SzLiaByMwWAt+y2TvY96Zl/3LL
	72XS2QroC6Kqsv7BF2aosAgte39ZpxKRfW19ecWMWhCZLUYeYatXBveoVWmSLD+HGG0U15bjvcx
	i7kZJI+CXM7X6ZowEvQEW4cTcvrD9HxBoMkdNELhRadL0jrdIU8AG3k8pH0bCpL+OblXiZMXuj4
	dh4Om/gHKd4izEaHGGlHcHtVMOSL/V14idDlwp3+VurLut4aj4BQIX4Whzp1z06PlAt69f0OmYh
	U0347+nx5G5rOoIemt8xHP4KljeLzEFzl82NNxqVwFiqJGS4OL4g781rfY5ZRysBPi+vCZv3z/K
	DfA44aIBwoJtlf+FTIA+IB8swjPrw==
X-Received: by 2002:a05:6402:4013:b0:6ac:c618:8e76 with SMTP id
 4fb4d7f45d1cf-6b432ba7d36mr3480494a12.16.1792768948492; Fri, 23 Oct 2026
 08:22:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-submit-serial-8250-dma-cancel-v1-v2-0-088ea51e3891@gmail.com>
 <20261022-submit-serial-8250-dma-cancel-v1-v2-4-088ea51e3891@gmail.com> <atsbGvUUeDYHT_md@ashevche-desk.local>
In-Reply-To: <atsbGvUUeDYHT_md@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 09:22:15 -0600
X-Gm-Features: AclHuK8v1XMEvp8YYnWRFsgQWMFzv3p-d4aRESxsit9lpkg6CefqucWf5mz5hTw
Message-ID: <CADvTj4roE-PoN3j+d_FaBZ=nxy5XkJk8_ghYH9bTx0CDoUNq_A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 2:30=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 22, 2026 at 06:34:05PM -0600, James Hilliard wrote:
> > The RX timeout path pauses a transfer, copies its data and terminates i=
t
> > asynchronously. Clearing rx_running at that point lets another receive
> > reuse the buffer and cookie while the old callback is still waiting for
> > the port lock. Inspecting the new cookie cannot distinguish that callba=
ck
> > from the completion of a new transfer.
> >
> > Reserve the receive buffer until a worker has drained the canceled
> > callbacks. Deliver the paused data before allowing the interrupt handle=
r
> > to drain the FIFO through PIO. Normal retirement only releases ownershi=
p;
> > leave subsequent receive handling to the UART interrupt instead of read=
ing
> > LSR and restarting DMA from the worker.
> >
> > Reject new flush work during shutdown, including late Intel MID DMA
> > timeouts. Serialize those timeout callers with the port lock. Stop and
> > drain retirement work before freeing the channels and buffer.
> >
> > Check pause failures before accessing the buffer. A successful pause is
> > the quiescence guarantee, even when a provider still reports IN_PROGRES=
S.
> > On pause, status or termination failure, mask receive interrupts and le=
t
> > the worker stop DMA before handing the FIFO to PIO. Preserve stop_rx() =
and
> > shutdown while restoring deferred interrupts, and hold a runtime PM
> > reference around worker register accesses. Keep RX on PIO until reopen.
> >
> > Abort the DesignWare idle sequence when RX cannot be stopped. Preserve =
its
> > empty-FIFO timeout workaround during PIO recovery. If the provider stil=
l
> > cannot terminate the channel in process context, retain its buffer and
> > leave receive interrupts masked.
>
> ...
>
> > struct uart_8250_dma {
>
> >       bool                    shutting_down;
> >       bool                    tx_terminating;
> >       bool                    tx_flushed;
> > +     bool                    rx_terminating;
> > +     bool                    rx_err;
>
> If they are protected by the same lock, we may actually move to bitfields=
.
> Example:
>
>         unsigned int            rx_err:1;
>
> > +     /* Receive interrupt enables deferred during RX DMA recovery. */
> > +     u8                      rx_ier;
> >  };
>
> ...
>
> >  static void dma_rx_complete(void *param)
> >  {
> >       struct uart_8250_port *p =3D param;
> >       struct uart_8250_dma *dma =3D p->dma;
> > +     struct dma_tx_state state;
> > +     enum dma_status status;
> >       unsigned long flags;
> >
> >       uart_port_lock_irqsave(&p->port, &flags);
> > -     if (dma->shutting_down)
> > +     if (dma->shutting_down || dma->rx_terminating)
> >               goto out;
>
> Again repeating the same idiom you have in previous patch.
>
> > -     if (dma->rx_running)
> > -             __dma_rx_complete(p);
> > +     if (dma->rx_running) {
> > +             status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cooki=
e, &state);
> > +             if (status =3D=3D DMA_ERROR) {
> > +                     serial8250_rx_dma_recover(p);
> > +                     goto out;
> > +             }
> > +             if (status !=3D DMA_COMPLETE)
> > +                     goto out;
> > +             serial8250_rx_dma_copy(p, &state);
> > +             dma->rx_running =3D 0;
> > +     }
> >
> >       /*
> > -      * Cannot be combined with the previous check because __dma_rx_co=
mplete()
> > -      * changes dma->rx_running.
> > +      * The completed transfer no longer owns the receive buffer.
> >        */
> > -     if (!dma->rx_running && (serial_lsr_in(p) & UART_LSR_DR))
> > +     if (!dma->rx_running && (p->ier & UART_IER_RDI) &&
> > +         (serial_lsr_in(p) & UART_LSR_DR))
>
> This has a side-effect. Earlier we do read LSR_DR, but now only if _RDI i=
s set.
> Would it be problematic?

The RDI check is intended to prevent a completion from restarting RX DMA
after stop_rx(). That only requires gating resubmission. I'll preserve
the previous LSR read when rx_running is clear, then check RDI before
submitting another transfer.

>
> >               p->dma->rx_dma(p);
> >  out:
> >       uart_port_unlock_irqrestore(&p->port, flags);
> >  }
>
> ...
>
> > +     dma->rx_terminating =3D false;
> > +     dma->rx_running =3D 0;
> > +     if (dma->shutting_down)
> > +             return;
>
> > +     if (dma->rx_err) {
>
> Perhaps
>
>         if (!dma->rx_err)
>                 return;
>
> ?
>
> > +             /* PIO may now drain the FIFO; stop_rx() can cancel these=
 enables. */
> > +             p->ier |=3D dma->rx_ier;
> > +             dma->rx_ier =3D 0;
> > +             serial_port_out(&p->port, UART_IER, p->ier);
> > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> > +     }
> > +}
>
> ...
>
> > +     /* Some providers still report IN_PROGRESS after a successful pau=
se. */
>
> Yeah, we need to address that. (I used to have some patches locally,
> but they were rebased uncountable number of times without looking at
> the result of those rebases, so it's probably rotten enough and may
> not be used anymore.)
>
> ...
>
> > -      * This problem has only been observed so far when not in DMA mod=
e
> > -      * so we limit the workaround only to non-DMA mode.
> > +      * Only read the FIFO when DMA no longer owns it, including PIO f=
allback
> > +      * after a DMA error.
>
> > -     if (!(quirks & DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ) && !up->dma &&=
 rx_timeout) {
> > +     if (!(quirks & DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ) &&
> > +         (!up->dma || !up->dma->rx_running) && rx_timeout) {
> >               status =3D serial_lsr_in(up);
>
> This is a good question. We need to have this be tested on the affected
> platforms.

My hardware tests used H616 with additional local UART and sun6i DMAengine
changes applied.

There is also a distinction the current condition misses: rx_running
remains set while callbacks are being retired, even after DMA has stopped
accessing the FIFO. I'll make the FIFO-ownership check explicit rather
than using buffer retirement as a proxy. The dummy read must remain
excluded while DMA can access the FIFO. That revised handling needs
targeted testing of the empty-FIFO timeout case.

I'll also apply the early-return and shared-helper cleanups. Before
packing the flags into bitfields, I'll check the worker accesses as well
as the port-locked paths.

>
> ...
>
> >       guard(serial8250_rpm)(up);
> >
> > +     if (up->dma)
> > +             up->dma->rx_ier =3D 0;
>
> Now we have a copy of IER in UART port and in DMA structure. Why do we ne=
ed
> both?

rx_ier records the receive-enable bits temporarily removed from up->ier
during recovery. Those interrupts must stay masked while DMA may still
access the FIFO, but recovery needs to distinguish that temporary mask
from an intentional stop_rx().

The separate saved enables make that distinction cumbersome, especially
when termios or RS485 changes IER during recovery. I'll rework this around
one desired-enable state and consistent application of the temporary
recovery mask, so the worker cannot restore an obsolete receive-enable
decision.

>
> >       up->ier &=3D ~(UART_IER_RLSI | UART_IER_RDI);
> >       serial_port_out(port, UART_IER, up->ier);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
