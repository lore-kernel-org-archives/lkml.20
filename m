Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B56283FCE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531048; cv=pass; b=gZefH3q3hwd6UOjYPXT34N1Y/G5Hidi4uyqxc8UGtTGHA2sLVRa8P/0ithzwa28Ray6bdHpowjFXExxIr730Ixz7mowg3aL1mu+TEO8iCwKhGD7PldBi2EMVdoL5TVwdKlcXVWtB5+T1x+nq18pKXno9efFuNe9YZpcYWNCN/aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531048; c=relaxed/simple;
	bh=u0yf/ZsCjhLjq9G9BtB8G1f/03wIvVhVp8fs0jxsUYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDoOcE7GDcI/SY+Q42L1K9rvWVVCvKc6hX2WhqIaqYZCGOK7ENKL02beH3NiIL656Qb2MMtlpAW6X8jm6kUlAv2Vg9RbT4FTE3SRVJr6kO2f/m3i6MRD/SzAz9lmtkJGaEd/Cth3PCaBsSeVlyQImB0RRcs5vbF3xKUo2Bc1dlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQhJXuow; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQhJXuow"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso411742e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789531045; cv=none;
        d=google.com; s=arc-20260327;
        b=f7rH8dcwQyaYwlythkjhIOoU3Ns9Ce6msy5vKaHELWOXxe9PE8MmXZ8ON6PVD0e+7i
         eG2xvSNPUAiaYB+WATG1Ed1xd3m9Al8hN6V5x2VZ/ieaNZD9UW3hDx1Ja53z9FuLe8wZ
         BMUgF0BQhnzgzwa7cS8a9cw+Z63iWGDdG9Y5xqb1foANJN7m/n+QSsVn13ZHGOzD9MiN
         Uwx/u4lXrrXj8W9burGoQTfKXZO7D/eeJIHpaJm5jmAVJ929ebTlpfIv2w0sUSIcXSiX
         8a9jygT4c4vRlSoaoCBllXHqaUUBSkjsMOfII607V0Wtg0zu29plfJPU1lsf6fUVDxmG
         uduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        fh=Z4brc2pYf5XIa3UnAjUBKWgowNmSiUOoc/eGNmH3p6c=;
        b=JQedfVru5GvKsYA+obTiwFEpzgX1LsjOdMnpv5+irYjkVScDY6kzvUPY2wPvcR+M94
         hF3N1nvciALhVJnzYWZ/jzPMmP406z6aVo8HCkBsaxCVOYKjW0dTzky+tUmuqeRGXpla
         QrGAM0/7wd3xr36IC1w3PjeukqOZsJioEeFzRrlHULQPu5qMRtJMRdgdeJV1CgDgVqgv
         nutx3GITzkWjbRZHXy1yvFnb+iFYv3xz58EX6t/gi6CBDVHjoDwhLhlJMJH3BhdBRH3S
         Qd/5LNw0EvkP+bSiL5WYOt5IplCP4L6YWiR79kkPivQvbXPrkai3pRo4GIZpxpmOvP7d
         dxcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789531045; x=1790135845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        b=UQhJXuow2gEJAUlxNN5tb0PS9mtS6ye3NB14B+uYe0K9wvyOc+yXuPbDl+JqgAucve
         YdH+dnOHKQ3UukdAR2Hal3Q2ml0kQi8h7xyqdx3or8URpxD4TV5kpiAZddQ6w0FV20lJ
         5zFL77QUMdT535sfk8daBWPcbgpKWgm2A+hRSUFfH/gyGQWWqgj3UYvqOeobHMkQLvva
         8lKC7oOYseWDR6KtkB5TE5vyQ2RP6NozcOrKRu90qlipGLPrldK1U2QFXruVa8NhJbbt
         AzObR6GESHrWV00PkbhkMsr2aePyPNEOPMmZODh3NsxA2E4kxnun/Q04Irmjj4Jl5aCC
         DLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531045; x=1790135845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQDR48WjHEqsMRL2A1gJmeKRcqUr2W7BIowYB3PxMEA=;
        b=gExdEUm6pVUpM4Fr9T54WFG9EUZVMq7m8IN2lxdHW6h0WM+IALnpBu4Oj4qAc6XVVm
         GTkxRxG9G1RpNF5vnu7n2wbblEhgyi/3Vrob20s0K5iBAp/yrF/8QSmwTXWFXUVJ/EAj
         Kspv+pavN+KlpF5VZ81AVSI8d4noQZAsQCqrjVlYPfv/nNiCokkGJG14u0QgXIMtggvp
         fFSYlFU1m1ocSDC/WkCyDfPUasTk6n+51JdEcxgSsbFquJGoqL1pR2qMf1Il3LGOLYHo
         lNdmdP1lBAJdKQOYsUcWEeamn/B3y5NACfIV3TPen2gNmKJtimpsji5QgQ4pkxaTxZW5
         gJTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvwZVhwo75N64aLepMTg9bTtZaglShcEAL4wcnMQqMETHDKvIwNwvXarf+vnNyQHzdO+vWsKZr/CyQb+8=@vger.kernel.org
X-Gm-Message-State: AFuF++lIxHn5Jv0qb675ydzPfdxAvnQ2xNr5lolIizU3cScbqABKT91d
	BqgAiNnuYMAf3gl4y+ga/nmNDF6f+w3/71Zk1MuDV+xeyltwUQAjuDsvFNZ2lEHMNPYw2CeBHyt
	JxWwYgbF87gRFgmWNHCxuXDVMt7aZ14Y=
X-Gm-Gg: AYBFou3cATM9uMqeFl+CT/sLg6z0Cs8BwwtpP2i8NJ+leMZ1ZOnJ6wUqOGhBtYdYcS8
	6+U/kx9hcULbf+oc7NLgdO+tYnvnTBxMCPXm7lKCjHeXp+6maAKZMoIfafKcA8SbAH3PlNnpSqB
	rUqNkl5GbTIsyHiL8UyuB9PkaP+NU5XrE9geHqlxWv8HU8NaZoCrLC3Nd/IZz3S33o6hdz9nJd8
	20k5AkvHOU3URf/H32t3dMD16RTsqOUDgPUVaI4VxRZMpWWYW8G3GpH3DC13ETUscWj1/rj9/Io
	XiI9FkGdQLNQaNaw9nLXHiKki9Hv2D/V+u1vakiiF4tgBR6WDsOWoA==
X-Received: by 2002:ac2:51c3:0:b0:5b2:158e:9918 with SMTP id
 2adb3069b0e04-5b8b661e3b2mr186213e87.19.1789531044560; Tue, 15 Sep 2026
 20:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915065534.102249-1-maimon.sagi@gmail.com> <6acfc82e-7690-4759-90df-22b64a5441ba@lunn.ch>
In-Reply-To: <6acfc82e-7690-4759-90df-22b64a5441ba@lunn.ch>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Wed, 16 Sep 2026 06:56:58 +0300
X-Gm-Features: AcwNN1VE21f4CHLNHevQeu2epcwUcVn4gToPTCHI40hLednW88eNlo6h6UQyzGs
Message-ID: <CAMuE1bHKr_-cE7VpSMc_8nYGgaH9Y901XMqRLzvKYodn8CHiXA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: axienet: add a TX timeout handler to
 recover a lost DMA interrupt
To: andrew@lunn.ch
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 7:15=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Sep 15, 2026 at 09:55:34AM +0300, Sagi Maimon wrote:
> > axienet_dma_err_handler() is the driver's only reset path, and the only
> > two places that schedule it are axienet_tx_irq() and axienet_rx_irq(),
> > both on the XAXIDMA_IRQ_ERROR_MASK branch.  Every route into recovery
> > therefore depends on a DMA interrupt being delivered.
> >
> > If a completion interrupt is lost the queue stops making progress with
> > descriptors unreclaimed, and nothing ever schedules the reset: the erro=
r
> > branch cannot run because no interrupt arrives, and NAPI is not polled
> > because it is only scheduled from those same handlers.  The interface
> > stays wedged until the driver is unloaded.
> >
> > Add an .ndo_tx_timeout handler so the netdev watchdog provides a route
> > into the existing reset path that does not depend on the interrupt that
> > was lost.  The handler only queues the work; axienet_dma_err_handler()
> > then performs the reset in process context, as it already does for the
> > error-interrupt case.
> >
> > .ndo_tx_timeout is added to axienet_netdev_ops alone.  On the dmaengine
> > path lp->dma_err_task is never initialised - INIT_WORK() for it lives i=
n
> > axienet_init_legacy_dma() - so scheduling it there would be a bug, and
> > watchdog_timeo is set in the same branch for that reason.
> >
> > Tested on a Xilinx AXI Ethernet MAC by clearing PCI_MSIX_FLAGS_ENABLE
> > underneath a running interface to drop completion interrupts: without
> > this patch the TX queue stalls permanently, with it the watchdog fires
> > and the interface resumes passing traffic.
>
> Have you seen the hardware wedge without faking it by clearing
> PCI_MSIX_FLAGS_ENABLE?
>
>         Andrew

No, I haven't seen a naturally occurring lost completion interrupt.
The scenario was reproduced via fault injection by disabling MSI-X delivery=
.

I do see occasional hangs on my development platform,
but those are caused by an unrelated FPGA bug that clears BAR0 and
PCI_COMMAND at runtime.
In that case the watchdog fires and recovery is attempted, but reset
cannot succeed because the MMIO window is no longer accessible.
I don't consider that relevant evidence for this patch.

My rationale is primarily structural.
axienet_dma_err_handler() is the driver's only reset path,and it is
currently reachable only from axienet_tx_irq() and axienet_rx_irq()
on the XAXIDMA_IRQ_ERROR_MASK path.
If a completion interrupt is never delivered, NAPI is never scheduled,
descriptors are never reclaimed, and there is no recovery path back
into the driver.

The watchdog provides an independent route into the existing reset
logic that does not itself depend on the interrupt that went missing.

I'm happy to reword the commit message to make it clear that the
validation was performed via fault injection rather than from an
observed field failure.
If you feel that scenario alone does not justify the additional code,
I can drop the patch.

Thanks,
Sagi
