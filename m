Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793320349;
	b=PfCO++iSq45qvu7agV1LRoyhIpCq3eqMd0DuljEsKmF/K+MxRO/IgYBI/Zjf7DhCkQtV
	 plSLMB2u8h2/LDZ9uVp46dQOjqmKpLq4GkGUMtpRNbl2XAzWbGwsqCmy9hZaHiyIy9f4F
	 fqOnonQewxxXmUt+fGsKOZbR3tcBmSKmPBH/RxTXBTzNzt77zpZ7vV7IBfDIg8JFEwcoF
	 J/6eiseivrhPEB+S9RV9nMR1f5yoGdwwM2TfTVGbNEeZMBor9XMJREjoUDWkV2tqF/t92
	 oC7d7zCKEtw6r7jKnUs6duz/zBjrUTxAlDIwxm/UhCOD6+iUDO4BF2h14NDAMRzZtxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
	b=QgIgfp4/Q2azI0vxeO9QaipLRXf9kPANtnG6M1JI7dQkGe30VQJkIv7B8EX5L6lrtDXY
	 MD3WZ9NnuEwnDvBm6HXm64u9zDR98+/FKII7XQsUuDDwzwd9azqUOkgF/6XCq6Y/nfzMe
	 pC5VF2izo6M1C/X+F19jMsEFNeDi5ZmAlylsRCRQh9z60oNXS+AzE3+FPWH7ctXzY6NSv
	 /NiKgxdW8n2lDTr7yaUgPPKfYCWe1UmTR8svMjMHnRf9vpwPjsRrjKqLDLboVVD26E5Rw
	 YRUW6AaQnCycrhab3nIzdgpN3Ar+yCfixolEz/Japx2KCy2cN1NUHqiMxUk2laOIfbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZuSJnN3e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6409606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6409606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZuSJnN3e
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc013095d4so28730137.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320347; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+mbxKqHwcVGIzOUTR2BpNITIW/7VUcnYTBVaf+MT0HW0xZ/2T7EqSjL8MXV9OdmsB
         dzBokhVRQMeKmnRvNd4MtN7qNQDM3FBJ8f1uD6XnyhUNk9hcMIuIVQj149VBvj+P/Chb
         2MHoh5k6A9b1gRg6dqqoC1KNkxYMJz45qNxySrLlUuLiYntMeJSWfmirFYl0Ctc5iQcZ
         4poDlXxMtTmScsPriuOdyR1hecMbvsyyRFFKbcK7Fyz3Flkn9funOdW1/GpVzxIQkAIZ
         yRGVOzrhVqDlJdyFEmLODmA6El0LzeKAdCc83uqLDKzwO79E+qC8/cB56J+g4t9PRQj5
         L12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        fh=VI1ee3j5EYZ3fWaO/qcwI3OfYu+Bq9DnJdHXwbdQeUM=;
        b=oT/dsVp8zvwVHrpgZa3kDgwIYJHBK/cwk4q+JNrfY5YXTOs1w6jtwhVIdfGchPpOpI
         TkwXPy7Pdkg86q35o6Y3CDBGZsNKbEG4GyXrL/yAKUDHHg7umkTGeeFjOtxkOsswJ9KV
         7BaaSL64lZVUgDiPoQbj1HDaOOHdMoLnoZDgEBcQZSfZIeYT//rYAabZ23rosNVfeepD
         uCN0XBzhnOJEp4yO0Pwe9Mg4r5HHRE5spmZZEJ6wI9vu14xHwL0aVrVaCYPhXvFjHVdz
         o0u8kCaLRp5JXLU1B6xjpcTTickN5lE4CCeNB5Ov+CNkoubWRnnEiOJGiDdG5A3e64wS
         aIpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320347; x=1793925147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=ZuSJnN3eeK8cYiIA0V8HqZvLhIxTpXTX8h4ulnFY1m+XEtn01oDbgN24azAVUsNuNJ
         F1zNPKBwhThydq9i/RoT0BCaA9Rxc8pGMVWe3wJgKTg37iMX9baEdpCXq/3GGZQ5aP2k
         oXXjsM5x13hCNU/C9ll3AIehgoZiW1lIqUZjf4jwhfqLFyfQLVdta8GimYR/jJ32IIf+
         vosaYEJaBWCvf4eHIfcPakrXiS+yEhEjVTDUU9VbH5vDpuLBVKXZuujBOGEaL47ZmD/R
         +vPrZMmKds9hF+gre25JqWdkwJJZp5MkzLR89F5pyFjWMiojepCmYAKjBJkeXaA9mrnl
         J8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320347; x=1793925147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=pu/hUUzUwz0KnYdIHqDfo+/5gUsnWvGEnJpJ8R7ZZahn6PZhLq/r72rJp2gFobQOKb
         pru3qdGxhEelX5yhzZ7+tzq/n+XRv/c65h04w2dkZfM3cP5ZjGld+N5EC4lczX7Ev2Hp
         +r2nHmust1BljQn1t0HwiqNKArlLtjerAsVluvjJxVS1iR6REWjwR+iN81BZlCpQ8WZT
         vqI8ik8ltc24fwnqQ4qyx2Uhd/13VEtiiZTy0qdAzHkdY7oKxRWlwO3tFbSARltJ4VE+
         F9AEqBJOiSYpj67XX1OoTddJBxiifTWpIMlptGfntvNL5ve4gBXmG3nzrsYZHRimQYPU
         J5Wg==
X-Forwarded-Encrypted: i=1; AKwUvByJ29daUDD6Yf73gjSu9FXK5fEcltcH7PYlpuIXwaC8VtVPM6Tt/jwH41bHlmH6kQF1Ia6/dF7uWxk2N7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQXw9q1rAx0zu2h+e0uY3t+3EaRmlMAqYXXPxEmTcYwQwgdNZV
	6LtQGYpQJ3GNQQBPrMdGXAbGuLc49WgocSnveS4ozsgGNWRdmDoKJLZo2F6eIGMaq5oK9x4iW8y
	ASocQDFrGCibiu/c8WxJvWp/0gOJEv20=
X-Gm-Gg: AYBFou0FQC9mfycaEBNTM1lD3oxiCuTflXOAgS82oPT0/TxUfIgDZbTSuH+rsN4/aWm
	7aCLUtfEo/srcPm63MkdivSC3q3pL/CTh8+1G8bpVO2SCE68Qo6Kl3hEERILu/Wg/P0xwWbdhQ1
	n/NEe9GKdP+OrH31QDhISh8nddemd2CTIsuTH0ckPpzewE3lkw0Ddrjdwx5n38z77ufkD2wiJgm
	gnt7xsk24i79+AuVk54cFWpKfycKSHxPQcqs5aSNk5fF+osTs7C82yP96WeuEg/ozNa95ZCxOdl
	p0b5yzGIrUWevSxUOXgDC8IyoBiVV7/f+2RXUEOlx+uTMsmeWlaogsDroyivYcnnkmn2IAQLb87
	lqaP1OHDsmV+dcQttMBSDjknONG5TAs2jpO1SvnegWwieKhSlvjykd/FMEiKdu8M0ooIawfvIJJ
	tYoveFt07981trzqS0Ezaufrhal2fs556wBJ/0t+XiyEHvyr+q6Hwn5e9/4DSjj01T3Mtzjnzsi
	dIpN7pcql/Xg0rHwfhSiEzJE4yrxcg=
X-Received: by 2002:a05:6102:290c:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7d0723d710bmr492388137.0.1793320347401; Thu, 29 Oct 2026
 17:32:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <20261029222734.3086943-1-rrangel@chromium.org>
In-Reply-To: <20261029222734.3086943-1-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 18:32:16 -0600
X-Gm-Features: AclHuK-iYJ6lzjlFUVN3seH1Gc5KBaAl343rbNN_d-8c384kErq2Nw5ubYUVG3Q
Message-ID: <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:27=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> Hi James,
>
> Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirm=
ing
> that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
> (__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking al=
l
> look resolved in v8.
>
> On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending work=
er
> retry loop:
>
> > +     ret =3D dmaengine_pause(dma->rxchan);
> > +     status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &stat=
e);
> > +     if (status =3D=3D DMA_ERROR) {
> > +             ret =3D -EIO;
> > +             goto recover;
> > +     }
> > +     if (ret && status !=3D DMA_COMPLETE) {
> > +             dma->rx_pause_pending =3D true;
> > +             serial8250_out_IER(p, p->ier);
> > +             return ret;
> > +     }
> ...
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     if (dma->rx_pause_pending && !dma->rx_terminating=
)
> > +                             serial8250_rx_dma_try_flush(p);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             usleep_range(1000, 2000);
> > +     }
>
> This cleanly resolves the race where a full 4 KB transfer completed in
> hardware just before dmaengine_pause() ran while its DMA completion hardi=
rq
> was still pending (once serial8250_rx_dma_flush_work() drops port->lock a=
nd
> sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE)=
.
>
> However, what happens if dmaengine_pause() fails on a *partial* RX transf=
er
> (0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the re=
mote
> peer stopped sending and is waiting for a reply?

With a persistent pause failure and an incomplete transfer, the
worker keeps retrying. RX remains masked and the runtime PM reference
is held until the condition resolves or shutdown takes over. There
is no receive-progress guarantee if the peer remains idle and pause
continues to fail.

> (In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress)=
 on
> Receive at lines 67-70, which forces the remote peer to always keep
> transmitting until count =3D=3D Capacity and CompleteInHw fires.)

That fairness assumption cannot establish progress for an idle peer.
The broader local RX lifecycle model includes permanent partial-
transfer pause failure, but checks ownership safety and close
progress, not eventual reception. Passing those checks does not
establish recovery from a permanently failing pause operation.

>
> When the peer is idle after sending a partial burst (< 4096 bytes):
> 1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
>    (neither DMA_COMPLETE nor DMA_ERROR).
> 2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
>    -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
>    serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
>    usleep_range(1000, 2000):
>    - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wak=
es a
>      system_percpu_wq worker 500-1000 times per second until the port is =
closed.
>    - RX interrupts remain masked in hardware (`rx_pause_pending =3D=3D tr=
ue`), the
>      partial bytes are never flushed, and the port never falls back to PI=
O.
>    - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_=
flush()
>      while rx_pause_pending is true, causing dw8250_set_divisor() and
>      dw8250_check_lcr() to silently abort baud-rate and LCR updates.
>
> Since the only reason to retry pause/status is to let an already-pending =
DMA
> completion hardirq run after port->lock (and local IRQs) are released, co=
uld
> we bound the retry loop in serial8250_rx_dma_flush_work() to a small numb=
er of
> iterations (e.g. 5 retries)?

A failed pause with an incomplete cookie does not distinguish a
persistent hardware fault from completion that has not yet been
published. A fixed retry limit does not resolve that ambiguity.

Terminating after the limit may discard received data, including a
completed buffer whose completion is still unpublished. Successful
termination would make subsequent buffer reuse safe, but would not
recover those bytes. This would therefore be a potentially lossy
error-recovery policy rather than a lossless timeout flush.

> If rx_pause_pending is still unresolved after the
> retry budget expires, calling serial8250_rx_dma_recover(p) under port->lo=
ck
> will set `dma->rx_err =3D true` and `dma->rx_terminating =3D true`, letti=
ng the
> worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), an=
d
> switch cleanly to PIO.

That requires termination to succeed and callbacks to be drained.
If termination fails, the channel may still access the FIFO, so PIO
must remain excluded.

The recovery requirements depend on why the provider cannot pause.

>
> We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
> `Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul
