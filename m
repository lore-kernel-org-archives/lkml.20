Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C33B6360
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841448; cv=pass; b=RYqsSWP2MtV8MJj0E6yYmNNlmiH9gYd0d+JRbx/vZkZRXxcG1FIg4p98Hy3ln6g9dhoko1vACt432L8pfFSia0NtUL19SO/eTHv6VvlMsi5t/hyWFfM9DdreQXY1sfo798h/3VQ4rdhhPUlWyGNa2ZkVZvuAEkRVtqqIaEH0LIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841448; c=relaxed/simple;
	bh=4rQCMA0YD118aHw+hhFF9+PsdILXF6N9UmQsk1sUyMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqgaKh2WVIfHYWiZtJ0KT7Gz1o2rCmuA8RTtdoIHHhJ1We9R2YKVTUitx48D5oQewkxxReklCLII9f1RiFmCzLjkGCH3Zn8vGuUZNdNFKOVf4a/DjbonjZa5PqyTJIekO0jkhRxek5+zVgY59a6ec0oNY3K+CdVSlwYoLl+o364=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVoETAZL; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVoETAZL"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98c78660542so1033525241.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841446; cv=none;
        d=google.com; s=arc-20260327;
        b=Tgo3pneRd/qjlPaQGee1CIbfaUFm3y9fhfEBGmy10wrRzxi0Xw3cjYGhqJ9EC4wmNa
         XCaT4v6ci7nCx7ViHza6qnrHf99UoCk6i6Da1amNqls1GSZIONbsVe0GP4PJJZRkX/7i
         OLottJ3d0qZARiVigdM3WGSFoynR+H42ors0bEREXgE+3p+k8sAdxqUZpKq4irshjV6d
         qy9Y4muTDR+i4uPROb0U8F/fQFp1+LmZ9S4a7u/depp1luogDrYhG9qNgASwiD8QuVuo
         tDYYIFXnydL7HOcESgSNIAnDAoF5xaIwjeCOkSc32ndYhpZ5QBQbugcuBJIj2MmG1+Cu
         7QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        fh=/6I/+NylvuB4WF6FHN0Kh9dF0Ff1EqMNOybBL7E/AWo=;
        b=DWq5tLreREUic/DOQERiQ/URCWFxzBQ9oWFR50PiAZ4znHYJMYEd1Fgkx5kXHOarfL
         OEhkUnrKJJWo5trA5SmAE6PNzZ3GOK7LgaSvBzK9pklVop/VxeVo17kxeNyRFof6GssR
         Oh5bLSZF3zt/O+xyiqDmb3FvTs76uLLVqEMb6MEIAz8e7yxZ/Z0GSQkPrnTLdCdkQFur
         E7JAc8mFg72p3VedaM60IMAp1WoDWL8zyPYe6A0X/qC0ZGOUq7qwA62676Fmk9SFjQwa
         rXPD/PO2hxN7krbs8RyBdjJYLfCHSEnZBQ9qh0jdCBIx3ojKgOGgDhZdYhkKUbrIInwo
         TJzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841446; x=1792446246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=AVoETAZL7gSCTxtLGecnwJyb3IdeC7SraxprdR3BUyxzyt9spcJBsDt5JLT0dHOkzW
         DnFiaNpT4XSvB0YxXB0ScjDmdDXr23wwVNzSvLQwnD0nsxE+vVm1ZNln5Wggxn9I5QP3
         U9IuWRMQuOZlLBcy8wNhPW2etLpkFm1mrAkivIqf07M0GYrVIKkcs5OwXDMfhbngeZ68
         o8sqIYLMfA3ypYrM15eSRdGZQSFEcTZUp+6ud3JkDxjoDsS0yLi1bWjBqw30dnvvaMLf
         nch/z5dalphBEsKHcs7E0G1RPX/pIyYwyy0EjFfOFyz5u1ROTfOrw9IzIS/RwkFVE0zo
         qsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841446; x=1792446246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=yz+Ucdffxf2Npewp9WzyUI8GXUA4cbww692mtqBrONhmjGXQGDkBj5LXg+ZWuJRsZH
         gB2oIJKvnXCGUTk21XDxvYwZ3v2IRKxz3BHjslgBnOmHcXp/d1wNWiKNJEWgbv7tcdcq
         Ju/kUebZLTFZTMQDnlLptcwBopLQJIgjmgNhAAHov3ycXHawtSmFFLmAFFm9hM5IQZF6
         htp5GDLb0NdUDq/Pv+iggWNcjwhc+nMDqx/5ZobxyUyU1aAqQFpLqGKhlgcfDx60r9q0
         WUjcq+V50bDyXRZxk6fUnTqtRP0FWKTeMxInho+57tX0SOpWNiYIQ07yrju6eBUmVR21
         0qmw==
X-Forwarded-Encrypted: i=1; AKwUvBwLW9pUPvcvt884QJ43O1CZjWBNsBDP5M4agaEM3jT1Ilhx1KUOCxVxw+lAJ/ElMT1yYSt7FXUQJeV8Ba4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKobNZluSLyU/cDacyj2KHUVf9/AhhNmmsBAvNZqXCJGbUu8R8V
	EuX8Y3ACKmsrrzFB+xiiuuJX72n9KojHfjhVTKsAYiBT0KJfkQolXFVW0mTyhTV0e4Fea9A4zcw
	uDblaTr9FjRoBkVj7n0m9MKvnxNSwlWYpi5mv
X-Gm-Gg: AYBFou2P1vh20IbqGiNObdCK6AbdVioxOgpNeexnCQ3a5l0AHBdRV/squDyD0vKKtnq
	y/AEaFgaQlHUcPvognpdK2DsEfKCxcqfrY01jMRr/vJ+eTTueTk3FseDOKcg3LWyPVvJJfuhL2r
	Km9GZrrQ8/Xi6cp9r69dtndofr/gyAdYTi6/C80smJ6TNqCRLwELJra7Yeg1saR6vtnQeRimrco
	VnC4PzhJgq+zvDLVeTqjQK/jRnQckeewL81ln5uAOBe8jeFScLlUhgcm1J5YPHLwoUisC+Z0m7j
	E7Y7MbYg53yuhPohsUSHXj5c21/uBySEDAdQSgY0h8acbknABg/2hmizS4sdpncFSC2naNPJ0bF
	QsWxtHYemxGP9Cepv4Y4FYq5iXFMrWlXTuS6AGRTUeuDNMhbR1U2uEMVsgDrmUvsCYt+F+Jf3sn
	lFGpEdCSOe7bjMgbrifaswdWtJ2cbzIHSrYRMPEu1SXF8ntlxbixdV+R0=
X-Received: by 2002:a05:6102:5814:b0:79e:2b00:b4da with SMTP id
 ada2fe7eead31-7cb3a0059admr2967326137.6.1791841445569; Mon, 12 Oct 2026
 14:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com> <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
 <87pkxey725.fsf@bootlin.com>
In-Reply-To: <87pkxey725.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 15:43:54 -0600
X-Gm-Features: AclHuK9S8X-EJbG6Jz0l1nDWbI3paRApUkydjtgW5vHKMROEOTWMTqhZBvuvO68
Message-ID: <CADvTj4p-o=EQMq-6E1q2=NOmQbscAVGMUbwX+Wh4R0v5kbXe_w@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:53=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> commit log, I now disagree with the first part of:
> >> >>
> >> >> >The old handler can also complete the new wait or restore an obsol=
ete interrupt mask.
> >> >>
> >> >> "complete the new wait"? I don't see how a stale handler completes =
the
> >> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> >> register is cleared on timeout.
> >> >
> >> > The case I had in mind is an already-running handler on another CPU:
> >> >
> >> > CPU 0: Read st and ien for operation A.
> >> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >> >        then eventually reinitialize the completion for operation B.
> >> > CPU 0: Call complete() based on the saved st and ien from operation =
A.
> >>
> >> For this to fire, the hard IRQ handler on CPU0 would have to be stoppe=
d
> >> between reading st/ien and calling complete() long enough to span:
> >> - A's timeout
> >> - A's cleanup
> >> - B's wait being rearmed
> >> On this hardware, how is this reachable?
> >
> > CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests th=
is
> > IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
> > forced-threaded. A higher-priority task can preempt that IRQ thread
> > after it reads st/ien:
>
> That argument only appears in this reply. It is not in the commit log
> nor in the diff, both of which reason about a hard IRQ, no? I'll happily
> take the PREEMPT_RT case into account: in that configuration the case is
> reachable, but it reads as a justification added after the fact.

Yes, PREEMPT_RT was a later concrete explanation of how the race
could occur. I should have made that distinction explicit.

The original rationale for disable_irq() was to establish a clear
boundary between the old handler and timeout cleanup.

Simply masking the controller interrupts does not stop an already
running handler. A partial-event handler can subsequently restore
an obsolete remaining-event mask. A handler whose saved status
satisfies the wait can instead signal the completion after the
waiter has moved on.

disable_irq() prevents further IRQ dispatch and waits for existing
handling to finish. Cleanup can then mask and acknowledge the controller
events without the old handler modifying that state afterwards. The
register readback flushes those writes before re-enabling the IRQ.

This also keeps the additional synchronization on the timeout path,
without introducing a driver lock into every successful interrupt and
wait setup. The checks at the time established that the caller could
sleep, the handler did not require the NAND controller mutex held by
the caller, and the IRQ was not registered as shared.

Sashiko's report[0] was the starting point and mentioned both
synchronize_irq() and disable_irq(). The ordering above was the
reasoning for the implementation, rather than the suggestion alone.
It was not based on an RT priority-inheritance analysis or a measured
performance comparison with a spinlock.

[0] https://lore.kernel.org/all/20260909085434.C8F201F00A3A@smtp.kernel.org=
/

> Then, I'm curious to know how the AI justifies the use of disable_irq()
> as the RT-appropriate choice: doesn't it block without a timeout on the
> very IRQ thread the scenario relies on being starved (and gives no
> priority inheritance)?

Yes, it waits without a timeout and does not provide priority
inheritance. I would not present it as the better choice for bounded
RT recovery latency.

A spinlock_t-based implementation can provide priority inheritance on
RT, provided the handler holds it from the status/enable reads through
the register updates and complete(), with corresponding protection in
the waiter. That improves recovery under priority inversion, but adds
locking to normal interrupt handling and wait setup/cleanup.

There is a real limitation: if the IRQ thread remains starved, recovery
cannot finish, and other NAND operations can remain blocked behind the
controller lock. So the operation timeout does not bound the entire
cleanup. The argument for this implementation is the straightforward
handler-lifetime boundary and absence of additional normal-path
locking, not that error-path latency can never matter.

>
> Thanks,
> Miqu=C3=A8l
