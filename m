Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487E34A79D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824602; cv=pass; b=uhwp3mCXtz/4oe2LPt4LFMqv0WBokXoV2feo5c1PpfdpwlpNK+t/hXrHeZIognYugPqGNDz7vTpnDMLbHEy7h846+hHq08j70Jkz+ghhoNUAShkC7onGf14zT+8JBJ9P0APPqxdoEpHSqwwgYB6X6Z2MDBHU5ihHoGnJLlfMJwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824602; c=relaxed/simple;
	bh=bp+y/xqf7Ay1nNogINVSSczJwWAzJ9Xme8eB2Onekgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny214MeSprMU6Vw3UIsvOXKm1jgTezGGPgA+nHCMTvL+sZiKUxH6f6okO9LZ3Djrp+XNtv6PeQsgQCBLnT/mb06ZtltfAErPXLfdK+i3neyP7PQFcyp4ZdTVrnQC50EbAe7KjmYWx1+pRMqVBDsPm8E9ktQufwVEcVGai/mIkGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=stellman-greene-com.20251104.gappssmtp.com header.i=@stellman-greene-com.20251104.gappssmtp.com header.b=t4OpW+x9; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20251104.gappssmtp.com header.i=@stellman-greene-com.20251104.gappssmtp.com header.b="t4OpW+x9"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cc39e06bdso48832196d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788824598; cv=none;
        d=google.com; s=arc-20260327;
        b=GvS9KWhf8n1CLJgPEM5zuw5Ba84AmZki4yASOPRnyTW/m4sByl8BQ9Bc734EvavCLa
         /J6k9oTRsu7fu6V1k7GQ1jrn/F0FU49uJ8k+H3L07ojGCn8dexoArDrgrMe3GFBOgHBk
         XHoeZzSpJtI9VStqTgSvWePIdeAiXk4Gjg65p+07Jx76UMJ+IW4QmjvTm1CVbk49x159
         qCZcfskcyFuxHIyvdPxuab5G7Orqxwo/EtyH+L5fXA95FjeHLqd2CWPZPxVRmNqw3VWf
         PVNajNGztvFIi0b5ikx2t9tMYdSSA23yATji5v6IPRG7AMKnD3Yx8ZvQRgz68H7Z9z7k
         igMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDvQvRYKsjAddeL6GV3BdKG9dlLviBRCTvmRDdqMCts=;
        fh=fTQ2zLkoRi70q4bldvsYECLj4y6KQEyv0BOcjzDoqnw=;
        b=QODyyP6k9DnWIc9lKTdqYXqhA9uAIFE9yGLP2F5RQigli9GpctYrmC7JHfg1SGqVAb
         /DlmE4uTHNEVvTP9RtBZt/4L94Mc+96jntLeEwUXh/js5D3x5keCP2dXl+qYQtQrdJhp
         NJsN7IJcMWc57W9xOTRRQcFl5+7DhCVnFPl1Q9lpYpjB7pkQ85+6ZwjNRNVqnnV/iKbX
         5eRRVjVS14WBIDDu23/GjLrsyqn+RsO4P2VOmsa92yPuKUPM3cV7hphyLYCfhxcTRPWu
         MM00YBHVhorzRPsrHVIjFXuOOxo6g1seu1PtfpxaAnMTCwe1/rEAFndHdPqRg3Zrrhrm
         3pWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20251104.gappssmtp.com; s=20251104; t=1788824598; x=1789429398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WDvQvRYKsjAddeL6GV3BdKG9dlLviBRCTvmRDdqMCts=;
        b=t4OpW+x97niY0xGrCeoPrg3RLYCS/kAWI/TBstPgpeY8eWGQj9m9z3yRvpQIaa3tNI
         8c1iLMmme6Um5FXVpF3zznPnNRVGvK+QxWsUH+pAsqBSj46mxQwXzNJRnIysXsajZapC
         73rYDtqktukEbkpj7LQACdusCSGGZusWz0RXmcueQgCZK7+WizG+ojt7Ow8kguTX7n0S
         rpKJ+gNAgtKYRiQeyrdPESZnkPmsjkA0L6j7QyxmTHg6fcU6BSzHsotloGVrK4kna74p
         Br+/t0ZXpp/7u0kXQx8oA7NYlGObob1k+QQ6RzQ4nxZMK5vIs5UVj6Y4WAhkRqAGkY/t
         nOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788824598; x=1789429398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WDvQvRYKsjAddeL6GV3BdKG9dlLviBRCTvmRDdqMCts=;
        b=g2RcjIqzFpPUQf87BBNNV4KOr+tmj37b4tBdiOg54UizW7z6FtE8YAMV1vMGVSv7QI
         ewg+RbhIwCOCVJmuA4XWGAsqZJiHlE/u/09u5lJ9dyVs1Xw3Y/nLULlyatV5q9mV8uHk
         3vCo66p94P5GU9IVgm0p7ZhVxhNEY/0ZL6UemMSgsfG9x4nJ8SkzftX56fGvwRTTa6yW
         UjyvuZhSHryqfRlL5bsz/hdqlNj3mkSpTc4NSURkRFvijUrR2kGhYO2rWdcrSVhylo/V
         WJciw92V0tUx2bmcyHbCfU/ca5cKNRNU7aWG0Znzs3+UxbvIlddGzZP+oHnynnCt4JAN
         ao5w==
X-Forwarded-Encrypted: i=1; AKwUvBwGp4CKvQl1egbIkHl7SB8sbn4fvADCIc9EpZm8HmzdeMSGJSDC0hJ6Zw0beeIUnuSTuIPAXhoHIijkQOU=@vger.kernel.org
X-Gm-Message-State: AFuF++n39W3WwHIppMmwf/hd5nkdnyswa9Mx3fO58KYA2GFUW4lJD5wf
	MKflOzBfBK0OFKT45TXfezDMJ+FgvxhIMraQnZ/Dq1uQpVUcaoMEVnSPO/bI4jDZrYwtpir7W7T
	Ug7vZtLer/SewZufRXqbcWqPQYrSuGcw=
X-Gm-Gg: AYBFou0r1Do1d8w1dikJCXaiFlWaEdYfjEAkgq5FbyeA4X4rpsF9dAjxzV12BCMYYSz
	wxXqZjzkaKEcU8OFesdFOLmLVvhT4wzdBTbHyIwj7DgQ+aXfYMOcV7ynrAEFTUZLfgoti0KSNl0
	Lo3u88ZxMjVKauYw+Eud1MY87Ggc2e9G+CLHaQGZB7EiD8oZ2eMVApewohTnv/EVVouMYViqsc8
	8jIUdxuKdaJ2+VPwtN0+8WC9hHdh8TyBXZdNu742UvCVR9lyJPSUkQiGEND4fYKkz+hiIqLxwk8
	uQgwBqCrxTA/vfU3FM1rluwnUy/Itcmi18SXPnLXvffymMAZTY25REQv9cxiv3dpvTTg1a/ng9d
	3ZzbjH8V2LOijjVaeg7ebfmvrhEpK7dckgDYvr/TZYTIU1A5yw6lD7CDJfmWa/xR3/LzcRRWSq8
	9UUs4kw7QmoaVzf9SAp5lp
X-Received: by 2002:a0c:f119:0:b0:90e:9690:2c96 with SMTP id
 6a1803df08f44-9103ef894e3mr258777306d6.23.1788824598131; Mon, 07 Sep 2026
 16:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904141318.30278-1-astellman@stellman-greene.com> <20260907174523-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260907174523-mutt-send-email-mst@kernel.org>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Mon, 7 Sep 2026 19:43:06 -0400
X-Gm-Features: AcwNN1Vr6aokeJ70RLTa0bKePsQdGSScAWJo8sHRhYeyU3-lbwbLscwa2SYbqZ4
Message-ID: <CAChPuV8M9EU1ji27Xfd66Vr9N=mV6Nsem-6CdWKi3tAwNUj_cA@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-pci: return IRQ_HANDLED after non-zero ISR
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowangio@gmail.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LLM was Claude Opus 5, agent was Quality Playbook
<https://github.com/andrewstellman/quality-playbook>, an open-source
code quality agent I maintain.

One request: unless your version is already queued, would you take a
corrected patch from me so the commit keeps my authorship? Having an
upstream Linux commit trace directly to a Quality Playbook finding
would mean a lot for the project.


On Mon, Sep 7, 2026 at 5:45=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Sep 04, 2026 at 10:13:18AM -0400, Andrew Stellman wrote:
> > vp_interrupt() reads the ISR before dispatching config-change and
> > vring handling. Reading the ISR also clears it, so once the read
> > returns non-zero the interrupt was from this device and has already
> > been consumed.
> >
> > Currently vp_interrupt() returns the result of vp_vring_interrupt().
> > For a config-change interrupt with no vring work, that can return
> > IRQ_NONE even though the ISR was non-zero and the interrupt was
> > handled.
> >
> > Call vp_vring_interrupt() for any queue work, but once the ISR is
> > non-zero return IRQ_HANDLED.
> >
> > Tested with QEMU virtio-blk-pci forced to INTx using vectors=3D0 and
> > pci=3Dnomsi. On an idle device, 200 config-change interrupts were
> > generated using QMP block_resize.
> >
> > Before this change, irq_handler_exit reported ret=3Dunhandled and
> > /proc/irq/11/spurious increased from 0 to 200 unhandled interrupts.
> > After this change, irq_handler_exit reported ret=3Dhandled and the
> > unhandled count remained at 0.
> >
> > The issue was found during an LLM-assisted Quality Playbook review.
> >
> > Fixes: 77cf524654a8 ("virtio_pci: split up vp_interrupt")
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Assisted-by: LLM
>
> tell us which llm and which agent pls
>
> > Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
> > ---
> > Changes from v2:
> > - Repost as a standalone patch in a new thread, per maintainer request.
> > - Add LLM-assistance disclosure.
> > - No code changes.
> >
> > Changes from v1:
> > - Return IRQ_HANDLED for any non-zero ISR, as suggested by Michael.
> > - Add Fixes and Suggested-by tags.
> > - Test the change with virtio-blk forced to legacy INTx under QEMU.
> >
> > Full red/green test logs and the tested v2 patch:
> > https://github.com/andrewstellman/quality-playbook/tree/11ba61d/evidenc=
e/virtio-pci-intx
> >
> >  drivers/virtio/virtio_pci_common.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio=
_pci_common.c
> > index 10371ecbc054..b90c174450b2 100644
> > --- a/drivers/virtio/virtio_pci_common.c
> > +++ b/drivers/virtio/virtio_pci_common.c
> > @@ -120,7 +120,9 @@ static irqreturn_t vp_interrupt(int irq, void *opaq=
ue)
> >       if (isr & VIRTIO_PCI_ISR_CONFIG)
> >               vp_config_changed(irq, opaque);
> >
> > -     return vp_vring_interrupt(irq, opaque);
> > +     vp_vring_interrupt(irq, opaque);
> > +
> > +     return IRQ_HANDLED;
> >  }
> >
> >  static int vp_request_msix_vectors(struct virtio_device *vdev, int nve=
ctors,
> > base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> >
> > --
> > 2.43.0
>
