Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DDB4EF134
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164546; cv=pass; b=JYpIBO00/9OK4ylKwJLv3NTpiDipnYrYeiRFE3TzuOOYhL8Rf60jFN1FSJLmHU4l/hFtlAHMrJOwxFtYSF7tfNDHQWwJYDaHCQVwUwELthyj6aOZIuSrTJCVnQUl55mhKRlNuqS/nxr0Hzc9vrzFexFmkOkIch74z1f2/xqeyHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164546; c=relaxed/simple;
	bh=nm2A3E+U5TTONx7bskhFhE5Ow4/TVEhF235l9tbEgwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E42wYIQY6KIxTrtv6N+UTr1pQ0epfwSooeB9hxvYULeh5qbO1WGa3Rffm8Ic6UdRiudkcWqXmkDTf7zV777e59puyuU+Ik+cdjKocokwRn7bk4in9GqG7fhgwa5ZtXAoTbeiuJ640zwHkPKmb4SWjc/XNarVJisos3J4ZMZogP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=V858jvEu; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="V858jvEu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so692239f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164523; cv=none;
        d=google.com; s=arc-20260327;
        b=rJ9deZZuVPJX0Bk9RDMqatT1lMnsryhfQsI/1fgFZxR0o63r64qmcOnjs+nhRiArSM
         O+eoUBH5Ohf5psI+KkxobbGNN4ThbO+AMnH2urCicUBDULY4ASnQ6kbDvqQZqHDtv155
         QPUVzbcZ0DrvGtoF/FS29fNGeqVZ7mKUEq6iITgyy6aW3+F0/UcOFDJl8W6gyF92Vsim
         mrGLiGjS7QSku7gVQmQeSlwtyYKIZhTboLlrNoQod7w3GEwl6hSIXzu4KZ4gYbkCg8p4
         9kMPzB4c80hRobLrj06v6+qK9/9bb2RqVP2GTOGdvsxnOMYHuN0hpRnalwQy/lkoooP5
         tUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        fh=JybjFV1hV/TJG25e/hB0wfHfhTERdGImEFR/TL/A3t0=;
        b=EbPhtMopA/Ui/F6P3RnijJ4T/Xab/inTN2YeK+ldQ5H9B5rd+8KwSUJFGm8nbNcspU
         9J1SoRNSC6wCS6opXrvMcUtqh7xkmCTVF4jSFZ2xBDwb6or01AYPkEo1MJnskTOXFBbh
         kedaimZmHY0D/1HSr62uFnY/zURgyfGbH1nvcOxCAGfX9UsP1aW/81Mmvb7z+LjkjJD/
         rXbJaDCsD+1S/j3zPWygfkE2LREnH3p9l6KL3zAXrBrzLZJJM6XZumdz6cnoaZeCcd5u
         gXBDQvpYq8l3Yo/wCaI45pbLxTtQEQypx+G9S5T6Y8PFY3pkUURTogElSFmwVtqAtGmG
         MvAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790164523; x=1790769323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        b=V858jvEuxHVw7s/8PdGMnONcUvExIxZOSSQr+cYn5CfmMlrBc+anRAdWkT5cJlOwq+
         72YnoOYgKc+dssIZWhs/qcWy/Od8XX61XLCY9HopU6fzfsPV0uy4vVOt5U3S0sgI4reI
         g0iytY2kpJsA6sWQT37UAAUkJxdFeugPFkGHNVB9XIZmRsLcwQ1qGLldzZzkgDmv6ueV
         CskUijjA+IwZX+BCo8PUSibcVx9rhy1aUQptXPrKA8GMvOFXPVbfFA0+0w94wgh5rZh7
         zGZOeu8XvxyMbZMxNVNIWdD4fhdCWvZG+Hgl7SAZIVB0lzebsAS7qvB7E690tnskMLbv
         Wkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164523; x=1790769323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        b=GeIljT2kBZ4HYK3AQXyaoNZkDxAs6b99l/67tvE2rehLTsaxo8Xo5IzKLgPb9dm2Bb
         SRuGQe5szL4iBFl3pTN6AqMVTqb4lJ4EOlBR8irgkpYNKWyJF5gZJfKcG5QbXlYAMxhU
         ZNKF92CUCL6+f+HVahilz4KLVzohMDVou4D6oqQ8JRGii7YphtoOpMxfdL0cseLfpQT/
         coOiymjYh1b5ZAPS1tlyKtFng5JWR+FeREd+wXb9eumCEn0KFBpqkQAQfnGOe4L/WKsc
         aQfcaw7QJpHYlbsrZuw0sMw6BCinpHQ+j9sMRPZyBSL22hB916gozrvzzPbQkDrY9/e1
         KVAg==
X-Forwarded-Encrypted: i=1; AKwUvByxwCtHyACXSgZb4XjVQSrgtVG+UuQWSktmDsdCzEBHaCm61pGaLTC+OnFObkR32hyOBv1ZjEt5ehRYEJc=@vger.kernel.org
X-Gm-Message-State: AFuF++myIjhWgHTIgVXzpB2VqWu3fzVxiiO8L1uuw0lVN72MgQ6Po7Nn
	vpoNOy+akRUtCb4PXmoTqRA02N/VK39OXREPgHealip13DpLwxd05ttblGjKHU1+Qm5DyqGfjX3
	QzgwiAMowNamiQzbM7oxqz5P3oUpBi/0ig+P4nf0SqA==
X-Gm-Gg: AYBFou0JDIl2i13KQio4yFfmuWv3iqTq+zas5UAAjOYJc/IVZYKTZoBomvnsWhAHWT+
	ggvnAwLYgcItsxI7B5ZUD2N9/tyB2ig+a9aly9ZxvySBV/NB4eblk8y+F6nmo9HbRQ05mjtQ292
	nvZ9bezpPiSfLDDyPf/7y9/kbmslawG//zLXMn4BfjqWg4zHESuXa0vY9jwfviL3zb+nW10sosa
	CRMkOQo5yFq4ZzN97Z09ktPJ3B+LTSPlmD6XZUWPv9x/7RAC7C6pOo6wuLpWgMr4Zgh80C+Dnhd
	qos/XFSM09Y4k6aezy7yS5QxiGAbjp2KCEbUmmnwhRTcao3nqNJtGgJX6n73LNNhwoVofK+sOyn
	n8wvwIUS5Rv28vTP9UuywJ5hQcuV0lvdIih9mmdmulaEKY3neTFnM9iKhAr+wv2tGxmDiOTz1ph
	Yy
X-Received: by 2002:a05:6000:4023:b0:486:f17d:14dc with SMTP id
 ffacd0b85a97d-4886705f8fdmr4136204f8f.12.1790164523026; Wed, 23 Sep 2026
 04:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 17:25:11 +0530
X-Gm-Features: AclHuK_zLIl-mrpS78xV6vRgDB9dAAUf9QhniI9fOC93j9unzeVYyRI1tSChnzo
Message-ID: <CAAhSdy3o=JtEXnFANPdNn3E3XuKk2wUwXwrekQ+1ropJWnrYGA@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 8:30=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
> host IMSIC target into one contiguous MSI IOVA range. MSI message
> composition then uses the target CPU's position within that range.
>
> Build an S-mode IMSIC physical address array indexed by logical CPU.
> Require every possible CPU to have an initialized IMSIC page before
> publishing the array. This preserves physical address zero as a valid
> target and guarantees the array has num_possible_cpus() entries.
>
> The array size and each target's index can therefore be derived
> directly, without storing duplicate count or per-CPU index metadata.
>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
>  drivers/irqchip/irq-riscv-imsic-state.h |  1 +
>  2 files changed, 33 insertions(+)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index df38a7670a89..c7ebddd308ec 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwn=
ode_handle *fwnode,
>         return of_address_to_resource(to_of_node(fwnode), index, res);
>  }
>
> +static int __init imsic_init_smode_msi_pa(void)
> +{
> +       struct imsic_global_config *global =3D &imsic->global;
> +       phys_addr_t *smode_msi_pa;
> +       unsigned int cpu;
> +
> +       smode_msi_pa =3D kcalloc(num_possible_cpus(), sizeof(*smode_msi_p=
a), GFP_KERNEL);
> +       if (!smode_msi_pa)
> +               return -ENOMEM;
> +
> +       for_each_possible_cpu(cpu) {
> +               struct imsic_local_config *local =3D per_cpu_ptr(global->=
local, cpu);
> +
> +               if (!local->msi_va) {
> +                       kfree(smode_msi_pa);
> +                       return -ENODEV;
> +               }
> +
> +               smode_msi_pa[cpu] =3D local->msi_pa;
> +       }
> +
> +       imsic->smode_msi_pa =3D smode_msi_pa;
> +       return 0;
> +}
> +
>  static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
>                                      struct imsic_global_config *global,
>                                      u32 *nr_parent_irqs,
> @@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *f=
wnode, void *opaque)
>                 goto out_local_cleanup;
>         }
>
> +       rc =3D imsic_init_smode_msi_pa();
> +       if (rc) {
> +               pr_err("%pfwP: failed to initialize S-mode MSI addresses\=
n", fwnode);
> +               goto out_local_cleanup;
> +       }
> +
>         /* Initialize matrix allocator */
>         rc =3D imsic_matrix_init();
>         if (rc) {
> @@ -984,6 +1015,7 @@ int __init imsic_setup_state(struct fwnode_handle *f=
wnode, void *opaque)
>  out_free_local:
>         free_percpu(imsic->global.local);
>  out_free_priv:
> +       kfree(imsic->smode_msi_pa);
>         kfree(imsic);
>         imsic =3D NULL;
>         return rc;
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/ir=
q-riscv-imsic-state.h
> index c42ee180b305..11352f14e32d 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.h
> +++ b/drivers/irqchip/irq-riscv-imsic-state.h
> @@ -49,6 +49,7 @@ struct imsic_priv {
>
>         /* Global configuration common for all HARTs */
>         struct imsic_global_config              global;
> +       phys_addr_t                             *smode_msi_pa;

Please a comment over here about what this is for.

I also suggest renaming "smode_msi_pa" to "msi_pa_list" because
theoritically IMSIC driver can work for M-mode as well although
we have not tried it for M-mode.

Regards,
Anup
