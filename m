Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836970;
	b=jVgZDJ44iIUEDk2wPSn5mTil9VXvqe4nCr/liUk6mYv67IZuDfvFZQ++sh/A+uYu6daW
	 PaQEQ/mUtfogmdhjWHYCS3v97OmX5X35ifn3IUheMUWvePXJpg+Ql58p20lOS55iQyT0b
	 LdlMR8ZxSKwS+Zm5r8CPZmVrDKq89mNObdCKkAP0sxeQfmqkazPCnifH3+9DPaYp2H1Ur
	 ArTWKnZriBXC3tMIf2eb3gbwVi47y/WrW/EnX29kasLV4DTWOnGD8J9HQBNC3PCQJ7/PI
	 8xeNgn2Ruff4UTR/3dlHqPgT1nCNnanNus5pxd10e21mVcVQtpfUtn/FT1ZxHzmWCcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836970;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+WYItbgWNUMWjpGYQt2gkpzbizGfno1BHJ9swru4O+c=;
	b=K1dWVu7Q5YVnEjtVhOZ5D0Wlrrlt+0WuAEaZ94masH7D57/1USJDp7LgP6F4f8QTNXNH
	 KI9HQzW43bB797V0ml8u/oAsse88ojnAe+MpXtsrjd+HGxhHaeLX3EfYD0Rq8AMBtrq0x
	 nik8rsuwv5n3dvB1uIfshr+FaK6EHnVaCmKbG3RlZ6vhFejeVenLGy0KyX9JWm/gPaUBO
	 LJu7t6Otza+IqtUN4WjxGMMNeEp9iYwoN6cZ4eP5ruRsLyO3qiw0JgRWrRsZNRX/pjwcA
	 0n10oUt1qRwPFBR3GuZeiSBFHWpt6laBgiSnJ+Ti8hyVZyvgvUIgmmvzksxLBSq9MDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b="ycrgKk//";
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076C606A899
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0076C606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=ycrgKk//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+WYItbgWNUMWjpGYQt2gkpzbizGfno1BHJ9swru4O+c=; t=1794836969; x=1795700969; 
	b=ycrgKk///DNLwPgD8dzmJ4EK/AbjJkBTyDDiLKxhDtnFmJafNpwKhbtzHiM9ULyKMC9d1ceUZQk
	D3JcTZYM5288kFVF4ldlcGC15qCJpQ9Zozs3YW4792MgMOEeUCf+QzC9G5ejFc+idyH7lzAYIxRTY
	RX5+sEULA7xg1kz1RZt5p17b4tfcdPETtbRYeJzrLGptxGm5auqXyrcnfDZu7xMS+wvWzEOAxzR+m
	W0GmmsQ33VULOoHzsOhIjW7KyLEY0m5tnZUbYFRQiHewELk5KFpBA3FEkciDH31AJrOx5aBYTCnis
	0VY3hlhhY+pGJsVFrnJ1ys6urawxfRTAmlag==;
Received: from mail-dl1-f41.google.com ([74.125.82.41])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xSx5N-006WZv-0Z
	for linux-kernel@vger.kernel.org;
	Mon, 16 Nov 2026 08:49:29 -0500
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3b4944abeso881922c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:49:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGQAVxIurpaHSW/z2nZHrsK8+ikRWSGTIedpJGEcvYnIJCEIfe5fAWARf/ADqLHprl7ewG5XtXaqnuCHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n/Sg3bWUdgXTNKWwxot93cxcrXka33NSojwKx4zLVFeZ1dh1N
	0vG2jU0x/h+koEbMagy1WNuw8/8P3dtJayq0hir8FXvs14XJONovK5QphxtmMNNye27NN8FvCvx
	kPKyMU2jNFxQsPmijrtvEyM91Q4UElGQ=
X-Received: by 2002:a05:7022:3f0b:b0:1b5:58e:b544 with SMTP id
 a92af1059eb24-1b5058eb8a5mr9877186c88.18.1794836967970; Mon, 16 Nov 2026
 05:49:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017025420.792976-1-nickolai@csail.mit.edu> <87jymmuj2l.ffs@fw13>
In-Reply-To: <87jymmuj2l.ffs@fw13>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Mon, 16 Nov 2026 08:49:13 -0500
X-Gmail-Original-Message-ID: <CADGQE7FyCJHSnbQUomx6JBAtfCgKVK8y1DDDq+3c=Q2ZE1yXKA@mail.gmail.com>
X-Gm-Features: AclHuK-6Gz94YjtBLOaoLl17L7tRDphaLILnArMimOT--hoIDeNArMmThzyFi1g
Message-ID: <CADGQE7FyCJHSnbQUomx6JBAtfCgKVK8y1DDDq+3c=Q2ZE1yXKA@mail.gmail.com>
Subject: Re: [PATCH v1] genirq/msi: Fix the mapping race of wire to MSI interrupts
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:21=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> w=
rote:
> Something like the uncompiled below is less intrusive and avoids the
> subtle breakage.

Thank you, your version looks better than what I was proposing.  I'm
happy for you to take over this fix (your patch works and passes my
testing against v7.4-rc3), if that's easier for you.

Also, in the same function, there are two other potential races. Let
me know if these seem important enough to fix, and if it's useful for
me to send a patch for them or if you want to take them over as well.

(1) A second mapping of an existing interrupt checks its trigger type
without desc->lock, while __irq_set_trigger() changes the type under
desc->lock in two steps. With CPU0's specifier asking for the same
type that CPU1 sets:

  CPU0: irq_create_fwspec_mapping()     CPU1: __irq_set_trigger()
                                        irqd_clear(..., IRQD_TRIGGER_MASK)
  type =3D=3D irq_get_trigger_type(virq)
    false, reads NONE
                                        irqd_set(..., flags)
  irq_get_trigger_type(virq) =3D=3D NONE
    false, reads flags
  "type mismatch", return 0

If CPU0 reads NONE in both checks, it calls irqd_set_trigger_type():
an unlocked read-modify-write of the state word that CPU1 writes under
desc->lock. This dates back to b62b2cf5759b and 1e2a7d78499e.

(2) A new wire to MSI interrupt can be requested while its creator
still writes its state without desc->lock:

  CPU0: maps the wire first             CPU1: second device, same wire
  __irq_domain_alloc_irqs()
    inserts virq, clears IRQ_NOREQUEST
                                        irq_create_fwspec_mapping()
                                          finds virq
  msi_init_virq()
    irqd_clr_can_reserve()
      loads state
                                        request_irq()
                                          irq_startup(), under desc->lock:
                                          clears DISABLED and MASKED,
                                          sets STARTED
      stores state

The interrupt ends up requested but disabled, so handle_fasteoi_irq()
never calls the handler. The irqd_set_trigger_type() at the end of
irq_create_fwspec_mapping() has the same problem.

One fix would be to do these checks and stores under desc->lock. I
reproduced (2) on QEMU riscv64 with two virtio-net-pci devices sharing
an INTx line and a test-only delay in CPU0's window. I reproduced the
"type mismatch" in (1) with a test module that calls
irq_modify_status() as CPU1, but I don't have a way to trigger it from
userspace.

Nickolai.

> ---
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 4fdcb6df5306..10b0ac97b040 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -938,6 +938,7 @@ unsigned int irq_create_fwspec_mapping(struct irq_fws=
pec *fwspec)
>
>         mutex_lock(&domain->root->mutex);
>
> +retry:
>         /*
>          * If we've already configured this interrupt,
>          * don't do it again, or hell will break loose.
> @@ -978,9 +979,17 @@ unsigned int irq_create_fwspec_mapping(struct irq_fw=
spec *fwspec)
>                         mutex_unlock(&domain->root->mutex);
>                         virq =3D msi_device_domain_alloc_wired(domain, hw=
irq, type);
>                         mutex_lock(&domain->root->mutex);
> -               } else
> +                       /*
> +                        * Handle the case where a concurrent mapping rac=
ed and
> +                        * allocated the interrupt after the mutex_unlock=
()
> +                        * above.
> +                        */
> +                       if (virq =3D=3D -EEXIST)
> +                               goto retry;
> +               } else {
>                         virq =3D irq_domain_alloc_irqs_locked(domain, -1,=
 1, NUMA_NO_NODE,
>                                                             fwspec, false=
, NULL);
> +               }
>                 if (virq <=3D 0) {
>                         virq =3D 0;
>                         goto out;
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index e1d85035dbc8..3fdad0063be6 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1572,6 +1572,12 @@ struct msi_map msi_domain_alloc_irq_at(struct devi=
ce *dev, unsigned int domid, u
>   * msi_desc::cookie so the underlying interrupt chip and domain code can
>   * retrieve it.
>   *
> + * The caller looks @hwirq up before invoking this function, but it cann=
ot
> + * hold the domain lock across the call. Allocations are serialized by t=
he
> + * MSI descriptor lock, so the lookup is repeated under it and a mapping
> + * which a concurrent caller created in the meantime is returned instead
> + * of a second one.
> + *
>   * Return: The Linux interrupt number (> 0) or an error code
>   */
>  int msi_device_domain_alloc_wired(struct irq_domain *domain, unsigned in=
t hwirq,
> @@ -1589,9 +1595,18 @@ int msi_device_domain_alloc_wired(struct irq_domai=
n *domain, unsigned int hwirq,
>
>         guard(msi_descs_lock)(dev);
>         if (WARN_ON_ONCE(msi_get_device_domain(dev, domid) !=3D domain))
> -               map.index =3D -EINVAL;
> -       else
> -               map =3D __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_IND=
EX, NULL, &icookie);
> +               return -EINVAL;
> +
> +       /*
> +        * A concurrent mapping might have allocated @hwirq already after=
 the
> +        * caller dropped the domain mutex. Re-evaluate under the MSI des=
criptor
> +        * lock, which is sufficient as it is the outermost lock for both
> +        * alloc() and free().
> +        */
> +       if (irq_find_mapping(domain, hwirq) > 0)
> +               return -EEXIST;
> +
> +       map =3D __msi_domain_alloc_irq_at(dev, domid, MSI_ANY_INDEX, NULL=
, &icookie);
>         return map.index >=3D 0 ? map.virq : map.index;
>  }
>
>
>
>
>
>
>
