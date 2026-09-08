Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403435C6AB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894766; cv=pass; b=fC61OeExqBao9S+/COdyLhPzL0CV79ni1ytFQNUqkkm3Kb4sYud3CQFkejrmfOvZLPqkAijgWHEFpRv7CtwnoYIUl8Ym5+pAv+YzuB9uF359P67TdFpMAut1PCj/a061TxK/K7xupYKlAEodv+3qnlxMEWAA290oQS7sKpDTt8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894766; c=relaxed/simple;
	bh=Awyb88fU8S07Q3+V4zaxtvR0OBcmDZX0DDFSSNqPUxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWScNZvoD5KRJ5HPvjnB4YBc/Q40sc4Q+7h6iSUTKrPzrfitUBcwagCIPjiJZ034nIoRulmqX9IrDTJonZziW7WUApaRvxd9dK8JwAti8S7XArBTgSNC0nVKfpOhsAuAbhROEhu88j3wjOfvOtnS2RdkNikku2A5rSjZ0N76F4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU3/aL10; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU3/aL10"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so6410456a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894763; cv=none;
        d=google.com; s=arc-20260327;
        b=SqlliBopXw2qrOi6XQ3LWnGQyz3pvsDexnVDhklCt0L1v+zrvohQav55/mNi/f+041
         18RaNeY/AoMW08urol9G22JCF8aa/CzyHuTeTqm9MBRq4ckzRbjRF6fqVX9knj4jYKVK
         lmUXuR9FWX2MQtWsI/UZtadprZhKh/Y7sXU6cju8x3IwVQxoshEkSaLIQL01FoD1loLO
         YzbqutDhoFuTVdUufLcDrdjbsC9KmqfirpZC+wmIygmVzCujAfNPZte2uJk7NwwXZvhW
         J1n2Z3gEY7ckK9tORJpkyciXexdoCCqCPgUR2ABWFGwNIsBG9srbDKDeshnc41gC2WzX
         5Dkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        fh=m+nWyYnrbnC4+JsvRnTXBBodMY7dQ5MLOYvlPd8+fOk=;
        b=ZiGeVuDC09tgseGYKCVZsSKYItMTy2IuPO5j9yxKcJZM/OQtzkcM6D5iVryX9HVjcN
         qBOMYOkgt5w3wHjgRQKqqJdid4u1mF1t83O9ZJrOFzIl+Uoe+EcuKjgurn4/+YpU1wVs
         vfo5HiMkwWDqOguycUL2ABZZ8fqVk5StMzlEGp9cIoREEp7dAfhs3cyqItg7Nn1mFgi8
         au90Uq7FdjyWqGQLWCF7XAq7oef5AQnMKfIKvZI64q9/vlCkpo6WtJ0HHOkq4hs/p8Qs
         KxdCQc5KFMCpcpg7+/t4UU174UdJJXGPNhBsR0nOx9y5Fh5blUysAip2Q0Y7WLfGko0n
         w1rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894763; x=1789499563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        b=eU3/aL10tVTFOTAjWoDwJYh9LJStkqjnAcnV+RHZVUrCrbvKpeNvd1/gNF7Mw0CaZI
         J2fFa2RVsHbhEbVwb2SRgmmLnuPp44gBQBvBcB4Yt/0MwsPJ/9//aVB5kQ4RzR9Ctme6
         eBw+oq6xV8N+EH8SP/Re7XxAiwZMWnSgUONgDue9LLI7R3itf6K7TjA5GS3SKKZgUXoH
         o4uAc80nyBjG4Ci3pAsj899O32TvQGP95HWJx2Y3a9kY+KHTzN0FWmse4TIWOBtrd7ZR
         iY76X+wYkXZLofOtebv3OTbVYj3WsppWYhBvTkdHsIizxtpTOEo45srCqC3c7xlJP8gv
         U3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894763; x=1789499563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTpduZF7+5E5805hBjETRwhIo89Y65bImr+ySr2fmTw=;
        b=fgJuD6ll7RvKh58T0ded2gS8WXFlO88BdoK6+FA2QRds97VtsQgd1oVcE6iHqyR4/R
         jljQ6rOALHa/+Yl/XonfzS3nalqs1hF/TVqr6kPQ9fpLuuewyzYkAxgPKNiZ48bC6wM1
         iLS9+pBcdoQKruBGFIdM/drnubhmKkBPx6ZW0Qlg+tNiwXcFkRgD+im4N2tBmz4yutTe
         loAq9jrPkbnNec0Cuf9KN/6dzi/WJbDE2NdnfU6OjKjuGM82pYyyBbwfNMVgyOl/D3kK
         /n8++YZ+0darZaUQ1tpTMLP33hJLDdiHQFo9iktSFzrOT3CPNNjGdXFmf0PzdskotXGK
         ecgg==
X-Forwarded-Encrypted: i=1; AKwUvBxmpu6Js6xnSQiuYqgX3QIws3ddRCslKkxnCj1oenl4wwsMs2XEH2cTxa3Gt3X+b8dU2YTJyEWGNOGFE4A=@vger.kernel.org
X-Gm-Message-State: AFuF++kc63JuyfxhSRmdaCDDeoht2XdniuidPvdMA9G/t25feJUuqSF3
	6e0G8KgvKACa+qQ4VSfxsA/3freIn5dhoRUI3P0c9PJnJ611KiYV0F/2so88DpO+wAl037g4ywz
	Oa7wNl1YtiOPocBzyfdaYRfbe4MrEYGbQ7nFX
X-Gm-Gg: AYBFou3Zf7F0nIBKUk33cq6D+vUEWGy9OcoRu3bWdlL8oH1CdpecY9IvyMgyJJ5Q7Kb
	i4eQJuhEr3gQD2FNPbl3oTeYbBlSsSlplCBsGpH5fVfeR8Q9u2ucNtgmG+rvsTYISc+jPbjk7S6
	AxbK4Y3KlZBdgp41aG49D+gieH2vr//VCIl+YMenNmECz63BGb4K1nmd7juw6i3CT0lVHQUI+3D
	AyPSUDfChCmbTMYOO0Xj+5xHu8WPZ0jq3437GAYSO2ISMcGvWVfNF5SkFeW1G/91fs3O+EVyF8k
	AC6BJDjTUdJx1AMWEl95LZc5RPkFADERLhHf8qi2NE73kX/cDXvEWR9QloJJwCVlS6oj+Ooy4qJ
	IP2CLApyn/YyZNbKvM6lVcamoaXyR/m7sP5G14vJLXkQjGDr9cTCyWfVrYIIsjrEM9+WJNNWyeC
	8HBuEfqUh5XazF7Lsn0msHZ7+zjFz3ZoO+dtbeAdM4cUwuRzFQE4GqxWk=
X-Received: by 2002:a05:6402:24d6:b0:6a7:ee55:dcca with SMTP id
 4fb4d7f45d1cf-6a7ee55de92mr8094766a12.25.1788894762554; Tue, 08 Sep 2026
 12:12:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908060111.41244-1-rosenp@gmail.com> <87h5k0ulrs.fsf@bootlin.com>
In-Reply-To: <87h5k0ulrs.fsf@bootlin.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 8 Sep 2026 12:12:31 -0700
X-Gm-Features: AcwNN1Us1izf2ljyq5QVn61BBp3Tn2wyNhDInrJ2Ii_Yz4lsyPudsCZvl0GhLIo
Message-ID: <CAKxU2N_+jdT80OHrkaiiE687frsrxrEhub90nmkoFM=0fvvJFQ@mail.gmail.com>
Subject: Re: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:37=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 07/09/2026 at 23:01:11 -07, Rosen Penev <rosenp@gmail.com> wrote:
>
> > Allocate the shared fsl_ifc_nand_ctrl structure against the controller
> > device, which outlives all NAND child devices, so it is freed
> > automatically.  This drops the manual kfree() and the broken chip
> > counter that was decremented in remove() but never incremented
> > anywhere, leaking the structure and leaving the freed pointer in
> > ctrl->nand on re-probe.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: rebase.
> >  drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw=
/fsl_ifc_nand.c
> > index a88ac2cfaccd..4c2d95461c2e 100644
> > --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> > @@ -50,7 +50,6 @@ struct fsl_ifc_nand_ctrl {
> >       unsigned int index;     /* Pointer to next byte to 'read'       *=
/
> >       unsigned int oob;       /* Non zero if operating on OOB data    *=
/
> >       unsigned int eccread;   /* Non zero for a full-page ECC read    *=
/
> > -     unsigned int counter;   /* counter for the initializations      *=
/
> >       unsigned int max_bitflips;  /* Saved during READ0 cmd           *=
/
> >  };
> >
> > @@ -1033,15 +1032,13 @@ static int fsl_ifc_nand_probe(struct platform_d=
evice *dev)
> >
> >       mutex_lock(&fsl_ifc_nand_mutex);
> >       if (!fsl_ifc_ctrl_dev->nand) {
> > -             ifc_nand_ctrl =3D kzalloc_obj(*ifc_nand_ctrl);
> > +             ifc_nand_ctrl =3D devm_kzalloc(fsl_ifc_ctrl_dev->dev, siz=
eof(*ifc_nand_ctrl),
> > +                                          GFP_KERNEL);
>
> This is a global object. I don't get why it's global. But it seems not
> relevant to tie with ctrl_dev->dev (see Sashiko report). Can you please
> go one step further in this cleanup?
The problem is, that global comes from drivers/memory/fsl_ifc.c . Note
the forward declaration in fsl_ifc_nand.c

I haven't had luck getting anything merged there.
>
> Thanks,
> Miqu=C3=A8l
