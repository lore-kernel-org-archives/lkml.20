Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794296399;
	b=pRGaiLuBEgJ6ucSUWEFrRQJzc2irCHrpdMwtKCe4qNVBy85lGzwOt+N0FAW159iTgS4X
	 glefSnQ8cuv+vDtZHaOO2Zmf1BiMyCP4Thzp5NqpgTu1284e9gSaBmYjSbcN0e2kld+sq
	 srdqJrgMljIsQRar4l0aTY5Oc8mnjcyEIquQSdKUwTLKzLEZ5I5spL78P/x9HvHXmUuI6
	 23QC1Hjfp8EMI6kiALAdSU3k8u1vIMXmPCmKRO3AdgX8O6tA37lCUnDu/d+hK7N3mZwZr
	 Fd1SSr6Nam7nukAM+Gls90mD6HO1OzLeGzn1IVB6+yq9kunCoK55VGJ15eEZTN3EQGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
	b=IuTmm10RoXWPi8lbUjiKXtU6LOb7GcB7yd7TJtH1Tazq2RKevYiBUHHz/1IpSvaPCskG
	 gaGHPjIbMsC1bibyfvH0i3aFMbS0R2f87uK6M0XeZPfPbv74sYRFMBArF11WWgRoBo8Du
	 vvkGcyC2tMnErgcBlhx/2DfGubBTPNY+Oy3CPoti5ECYiq0XZA2MeEY5z7P0u82BrvGvY
	 bVO3f9Nqw8uoIUhEApoSkw6Cu+mYCMzaLUtRQac6rg9uWbxh6Op316OUYXknxZRiZVUjf
	 lQ7Xzb0xGirb7kmfzZD3/27zcdERK3aDqzM4H11i5Avg7QbO1ZfxVitALdd+EduR8fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=u+Vdq7qL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=u+Vdq7qL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4918c2d727fso847007f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:39:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794296397; cv=none;
        d=google.com; s=arc-20260327;
        b=Z3E84R0gZZ9+SRjsulWyqm4Bn2+cf9UZ+rcH1rI8yzEPC4X6ShQwWB9DMRspZ1tALe
         hX5P2Xr0j1gTN+n4dWqt4UXfptCVKTeXTWeNKxiGX0wBrjLmy/8qizXq6PZgQguSQRMR
         FEPV8PMPCgEGmfjPR18R65uTg5y6dFiFAtH1Zkte/lrQ0gX2QfGexBmVd8VLGS3WlBd0
         9S6oabmcVLlE9EV1VhIAORdyikhBq87xpC/pBRYyq4o12s9678uH+t+Hu3tm1A+/WnFt
         4CZf6trQKqW3YnDA5HGnhYn8ZU1xdrjjsKFjqYz+3Sbd/DZy8z2U3IF5m47+x8r5C/9t
         ZR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        fh=fMBXawvgd1pTyAxrPjCDeiZF8fX2zXDSk5UfAVuZ7T4=;
        b=HcByLeYJccVoBL5JMWUjSUz3XABLOMCTnrL8hJ8pxFfbK8zbmMiQI4UnEH5IeeFiwZ
         gn0EYD7pFLAk8JuBam1wS7Jcc1tNWK4nmJ5DP+851cbOyutlnYKriHX3/LFsuw6l+E7b
         pFQiOrxYdDxkB7NOqKb0kC7sMVitY8Gx4cPu/YrEXgy6AR+S/qPpG9OJrMHOxMuIjtJD
         +OJCsxtC0n3cJmJE6ruR0E55gCvrehZ2Bn9jsje8sdKfzOCzF+QqV6cnIIDiUtZnCkD7
         Yw0Nel9Nvnd1Oq9fch56eHAiWjm3olx9YdnBdp8l2ywovbvk4NIt1bHy016w1Ec/lqby
         q9/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794296397; x=1794901197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        b=u+Vdq7qL0HhDhPApVCqnbG2pYLt5Fge183ZkVaWQVSnbdmpOVv0UJkRGdy2+gER1RZ
         wfK7V2Qtw/8j8BuGMlqVdMxD88q165Mn4//TcBxX+9hX1a/3pBR0gUg5ojB7S1oKKTr0
         1N/hNr4MhrV9rjDKy2R1j/ML9u+UDg9Wsd5L6oo0/MRsa15uOJhRp63NQV0oF0BD5qCz
         uYXVAJOPHtUz6pEprEzScc6cvfADqo1mujKNj6svCltyb7EEHG4AouOvlvTfXSN9CJvH
         EYIsDqu4NISr8hiaggNYIFPHcya0oDoHMXotzYKmZMIeKpevKgK420l1Q2OoVZ60Zk/U
         H25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296397; x=1794901197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERnrn3wThP1DJNLbDKWT7d2OEC6GO11+OEarircH9n0=;
        b=bQ4qR7vB2sYuTlsBoYHY/ekaIXN3or/83wIi/6/MTFwKyMR4SjdXe5M8pL4eYLtxzz
         kwki0r3y7H/I8BlPF/D1ogHYRZLqtOeyeAv3n+alMJR/7tKEx+I6P4dpvQsINGIoY2nH
         45hXU8MscZTjLZ8i8/YOffRDINSX7MJnlVUFa9DIUzISQAvTozA6Mb5h8loVkus6l7sP
         Ti7pRnSbmG1p+b7Fv809JFL2sQIEDX1KB1o6Xh3XK01wl57907uHikXa7vaFcEmG83AC
         lhE8x3Fof01KIh/z19EVKAKoooPwn/H1193FbHal46pwRNpvVeR5MmEeHQ7K+QEcgw+8
         WG2A==
X-Forwarded-Encrypted: i=1; AL+hErFKVAhStJo8YwtiNUTbEo6NFeQe7BPj8j6gC4qCgsga04pW4sAZ3GlF13TIUjKS5SfBTveMiWAh4i57laU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pScdbCZZoe8VkpFs13bDfrDchAGroobacwnFvnAZtvWp7j3FK
	Nq69ZmpKedtROnTaAww678wr9o9owSnmOSEtQqqGyrqOXEqp7fAJL/ZxG8rDn2vtQfcKIj/MFnn
	H9WxgCJaOEZnUni+MyeCm4xiMwZP6wEMblI0j986HkA==
X-Gm-Gg: AYBFou1xVbKBAa/yxTR4mAcYdbSkAy/oIBrcJ+QYenzUDjyMGdFVNpv2LU9B+5iGb4e
	TwSPelKcgoD7usjsCeFARH1slk54JSDZbDoNgjldzmC1jnV0g/RtAzBswUXXLp6YKmpjZ8RYZjj
	n6JjiIug+mkfnqsI1vaJi2EJLg9P6HB2nn8CWBoKX6zUocZc1rBydoTzR8MyZikg2p2LGzCabwP
	lJMHpLf0cWu6xJ+v+e8nQnfvMKPGHbKKVK/ugNcOM058efykB0mComNDvYAwspsZMJG0a5vbmkh
	bgGZ3nafRbDma0rUyy+4/LNNJ8wTwz5kiLj+GaI7Q/SOjUJLAABg+gGVX6wRDVYEjixbdUxuVM2
	2VviHIa6PRHIRNJ72aKqHuZCSST8pw7414xHnlOJsJBepoXHOoNElz9+t7JL5SBRbiTC+66nHC7
	yVJQpFTKCRxTP5RojZzT0e2B579yx+lGbOrLyvGqczbRXWQn2CvEHjXBU=
X-Received: by 2002:a05:6000:3c5:b0:48e:e98:8b64 with SMTP id
 ffacd0b85a97d-4982e82c23fmr2760008f8f.19.1794296396722; Mon, 09 Nov 2026
 23:39:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
 <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
 <DMM1ZNXOFC8Q.HXUWNWMD6LKE@linux.dev> <DMRCPRZVNPGZ.3HTEULWLQ76YL@linux.dev>
In-Reply-To: <DMRCPRZVNPGZ.3HTEULWLQ76YL@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 13:09:44 +0530
X-Gm-Features: AclHuK-Jx-abf7O_I5yc8hPnEgpzrmNOfkNJbf5mYeWeUvlFuYAELASCvt4ok7g
Message-ID: <CAAhSdy2B=THE=m0eLG=S3XiufV=j5amnnkH1b8ydDMOmHtuZZQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ work
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:57=E2=80=AFPM Troy Mitchell <troy.mitchell@linux=
.dev> wrote:
>
> On Wed Nov 4, 2026 at 9:59 AM +08, Troy Mitchell wrote:
> > On Tue Nov 3, 2026 at 11:52 PM +08, Anup Patel wrote:
> > > On Tue, Nov 3, 2026 at 1:34 PM Troy Mitchell <troy.mitchell@linux.dev=
> wrote:
> > > >
> > > > Remote IMSIC state updates are deferred to a timer on the target CP=
U.
> > > > If that CPU has stopped its local clockevent and is waiting for a
> > > > broadcast interrupt, enabling the broadcast IRQ can depend on deliv=
ery
> > > > of that same interrupt. This can stall timer delivery when the broa=
dcast
> > > > IRQ is unmasked or moved to another CPU, including during CPU hotpl=
ug.
> > > >
> > > > Queue hard IRQ work to synchronize remote state independently of ti=
mer
> > > > delivery. Keep synchronous updates on the local CPU and the timer r=
etry
> > > > for an unfinished vector move. Hard IRQ work also avoids depending =
on a
> > > > schedulable worker when PREEMPT_RT is enabled.
> > >
> > > Using timer retry for local CPU and IRQ work queue for remote CPUs lo=
oks
> > > strange. Why not use IRQ work queue even for local CPU ??
> > On the local CPU the sync runs synchronously, so there is nothing to
> > queue. The timer only retries an unfinished move, and by then the new
> > vector is already enabled, so it cannot stall on the broadcast IRQ.
> > Requeueing IRQ work from its own handler would just keep self-IPIing
> > until the old CPU catches up.
> >
> > I'll add more comments and modify the commit body.
> That was not the whole story. The retry cannot stall, but it can be
> late. The local CPU is usually the one entering idle and taking the
> broadcast IRQ, and the timer it arms on itself there is not programmed
> because its tick is already stopped. Nothing tells it when the old CPU
> is done, so the move only completes on its next interrupt. On K3 with
> deep idle I see move windows of up to 0.5s.
>
> So you are right that the timer should go, just not by requeueing on
> the local CPU. In v2 the old CPU will queue the IRQ work on the new CPU
> once it has released the old vector, and the retry timer will be
> removed. Move windows drop to about 100us. This will be a separate
> patch on top of this one.
>

Sounds good.

Regards,
Anup
