Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DC3932F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976717; cv=pass; b=FjdtUIN4V1zjvITii38R3k9S7JJePnyhHz5Vq8oXWK44QjeO5zRdCE1Fq9wfR/EcSidUj2VnTHk6v+7far9+XR8iR+yyPCWczib3OZSQj+nRObCF//yrB7d4cf29wzWlUDxlokh0oc8bCQRNIj/4sVJ5qOyenlaJD1azV0QO1dE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976717; c=relaxed/simple;
	bh=JRXhqW59z21YiMqvUCuekToa2vzhPkgw74fnfba6haM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnLZXGloVTfj6Bb93/xQZ8msH9Nf3EUatVSuZZhbXoBl8Ujnx8xP4q17R8gP+34ASec6GYgTbqfRw8qe0GH6uv2jifcPYXcGGUODbN1vEVYJi1SNIZMd7D2VQYl1xE2cwRWSswtkciURUBPFKA0ELcVoCti3pnQBdjHaQ1dhd5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ThkbCVCu; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ThkbCVCu"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso322401cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788976715; cv=none;
        d=google.com; s=arc-20260327;
        b=P1/n3FpLEZs0alIWXY5X0wbJ6HbLoqQ/qa9i3MKtM78MGh5BUD/HNj8C0cV4a4kaKO
         T4eNmgKdPXILmWlDrsqNeeHptQiL3eByo6HAQk/H3SEo/Kgh9apl7iWezLNNwfLtSsZE
         wiVa5u//OXNqlrl9hi/+kM8R/wJFPrbucuhHIqxOlvTFmkW4wmbZy7vKsWDKke33Not5
         z6IFnMsULqAYQt6cGW0f1yxHIA56XiqbRZkWh7Ue+k/ohzU1jf4UUTcSuyQLZRR9bOl0
         2S5C128R75muGrnYNlLhW3nJyx5y8fQE+PJIR59Nchk8V/priO4jVRCU+kKZycqKkAlW
         mzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VtyfnipbLRML4sk/n+Uiphvnw4FabEDfuHO2cvdrWcQ=;
        fh=68dufd3AVV3rCZC9hmiiKfdTHzYwdwAaasUyIkxqIJU=;
        b=RbH43P8tE05o7D0Wu2xJQiLoIWxpSrpkptBjD5O24nO5z6QHPKiANI0M1uqpB67Zfi
         V8no73/MhN2loQRhwS7FG8aZxcMZ9BpuKY1s9Ro/Vy9qBLrSty0FyycrLOA6to+4rEZg
         eiLzUUfiB43dZOnxabkMto6JqHY513rFB/xOYJMZFUnciCUByiPVCNbKR+VPLvgLBD6s
         KhMLETRSBIgSBl6nRnQtvJuHFn1BgndkHW44U8F/iURUhcCWmBw6S5Jiogoq4jBhBpQi
         Y4ITxQaCC1anoQThdBXoufbpgkfv94W6bVD84aL5QNtE983QNu9rWMHoe5dZ5rfsZ97L
         Bt7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788976715; x=1789581515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtyfnipbLRML4sk/n+Uiphvnw4FabEDfuHO2cvdrWcQ=;
        b=ThkbCVCuWFTqWEAFPKaEE+z9jHFEaru/IsdvRYRqILaJ+TT9G3myLaKsd79a+Q/9Ml
         e4NpdWpvg5jR+2mTd9bT5OP0jGrwD13+3WDnvAwlTLQxGlY1rOJcgesAASrCFXjmIr2G
         pPkqLJfnynbwV0OsGjtNcFBFe3kHwauUsjEVLI06/Ic4Z6D6IV1lq4C/KmO4Sv/7ztnw
         KzhBYKFZggtqzO9dmox4dZ8yZC9J1Km9U6cP62HWqjB9808T1WajpD7mYmdwBuVs5JlT
         ADMp8MrHsxvbBTt61a+CBXOApJMI3Xope+djFyxmCmvaTBedRuNN5KhJJQpqtbF9kX9i
         kQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976715; x=1789581515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtyfnipbLRML4sk/n+Uiphvnw4FabEDfuHO2cvdrWcQ=;
        b=Ps3Pjsgm34yUro8myIfLNQVli7nQzfQXGh/tckFW3ltYsJnUazGGZR5XBnc1k1RopQ
         vsEx7d8gf50XhGags7d4y/aeYcrB92aNW1E2B+ftiZsFxhkdnraJXxiPZZ3E1paUv8st
         6/ydLaqJpRTrjRLajonuGpMkNbIE4foTzM1k+5tn4u24xiqJ9u9jdW2jOUYTw9YU9R3/
         q0Xgi3Onej+p9VP9mvrCyK9Cwzjs+FGQXg61I238Q3khpTkIKrPL2+oHY/0sxv+1ihw6
         2RAA3wywKri9m7sWEoNB6nM68btwk+23lHlagSSUZObXnm/76CEVCS5JQaFShJokUn6V
         ysow==
X-Forwarded-Encrypted: i=1; AKwUvBwqVASG4/l0p6QlH4yo7yGBWkz8mU6GR3npFGZ48eD6QCkzwdIOeHUElGDVV3t/w1/MBIB/l/Z1Jam4LfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nYaq8XtucguNLGzixZY1smcIWXDh/W/u4iE+bRmclD7k0rChQR
	x+hGoXXs1BIL4uKZ5IYKeRxzZF8zQOBtpouRw+z1s88a+xqiOCHY/yc6MEGRs7oeQUevmbz8D1u
	2FJ3y116wc2kL7Nv/28UFNfHYOPg8lUWfnL2LrUP/
X-Gm-Gg: AYBFou2oKTulPmp4/4qebN/2DsQA6+yEYjm64e7RkLtqlbTrlyDiHA32fn5NorhHF8M
	BcSuglXXh7kIWr5Xh0xQKI7dvHq25OV3wWzeb82F+ysdWLK8+o/zvKegFFL7atY7ap8M9V2qSkR
	TEQE7McAHXNUn2sY1wS+MhB/DFTtbXYQavaip8+n6jbIZDzUOz5efUJDbKlskihW+MXFSBaNybO
	tGjFBrtsISfBPJdUREXX5xgW22cb+uwMP38/71Io9tpB1KgA2A1NBuaTGtAd1xo1mxuAdXpyP7V
	/WmhEO8WL0rWneSOMqEBhahQtHjt/o6MTQm+eyj+RS+JRFNMqQ/ht+Rr3w==
X-Received: by 2002:ac8:5902:0:b0:52f:6e06:89ac with SMTP id
 d75a77b69052e-530a5f960b4mr16181111cf.13.1788976714583; Wed, 09 Sep 2026
 10:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-5-surenb@google.com>
 <19e428e5-d8bc-4abb-b052-e23442464cba@kernel.org>
In-Reply-To: <19e428e5-d8bc-4abb-b052-e23442464cba@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Sep 2026 10:58:23 -0700
X-Gm-Features: AcwNN1WVxGfkg-5L9FLh7hjIInMIQxAx4dVdpUE-xaU-wRib3CwQ8jMs5cxEvbE
Message-ID: <CAJuCfpF-xeED3zVL9YyCwrTUxcYXw4s6gVcCYY8p7rx_09mgLg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] proc/task_mmu: read proc/pid/smaps_rollup under
 per-vma lock
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:23=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
>
> > -     vma_start =3D vma->vm_start;
> > -     do {
> > -             smap_gather_stats(priv, vma, &mss, vma->vm_start);
> > -             last_vma_end =3D vma->vm_end;
> > +     if (!IS_ERR(vma) && vma !=3D get_gate_vma(lock_ctx->mm))
> > +             vma_start =3D vma->vm_start;
> > +
> > +     while (vma) {
> > +             if (IS_ERR(vma)) {
> > +                     ret =3D PTR_ERR(vma);
> > +                     goto out_unlock;
> > +             }
> > +
>
> Can we add a comment whey we break (and not e.g., continue) whenw e hit t=
he gate
> VMA?
>
> (I seriously don't kmow ... should I know? :) )

The way m_next() is implemented, the gate VMA always placed at the end
of the address space, so the next VMA will be NULL and we can break
once we see the gate. But now that I'm looking closer into this code,
reading smaps_rollup file does not invoke m_next(), so we should never
encounter a gate VMA (it's not in the maple tree, so for_each_vma()
should never return it). I think I can remove the special handling for
that case.

Thanks for the question, David! It made me realize we can simplify this fur=
ther.

>
> > +             if (vma =3D=3D get_gate_vma(lock_ctx->mm))
> > +                     break;
> >
> >               /*
> > -              * Release mmap_lock temporarily if someone wants to
> > -              * access it for write request.
> > +              * If after retaking the lock, already reported VMA grew =
or
> > +              * merged with the next one, smap_gather_stats() will gat=
her
> > +              * stats for the remaining portion by starting at last_vm=
a_end.
> >                */
> > -             if (mmap_lock_is_contended(mm)) {
> > -                     vma_iter_invalidate(&vmi);
> > -                     unlock_ctx_mm(&priv->lock_ctx);
> > -                     ret =3D lock_ctx_mm(&priv->lock_ctx);
> > -                     if (ret) {
> > -                             release_task_mempolicy(priv);
> > -                             goto out_put_mm;
> > -                     }
> > +             smap_gather_stats(priv, vma, &mss, last_vma_end);
> > +             last_vma_end =3D vma->vm_end;
>
> I skimmed over the remaining bits, hoping the VMA lock experts will revie=
w in
> detail :)

Thanks! I'll wait another day and if there are no more comments, I
will post the next version.

>
> --
> Cheers,
>
> David
>
