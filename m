Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5A48424E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595229; cv=pass; b=aIKL09OILww+rtFz4sOavUemmG+No00A4NxEwUmnG1r2eAkxaYQKPYtmVfjf2dKzDfAXLeKAUME1J2zcapKJBMGHTiVsfhujWWg7wf9SIs7NfjHGt5d0TBchXLHv4bnmBg0sv67R2ucDW1Dy38cFc78ZzKUI+fl2h8MZfG/5bcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595229; c=relaxed/simple;
	bh=kqAE238eZJ1QWaBrodNLSxhvzuufzav8wwSyPhv7Xjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNk6d2++J1vcIhKCxKgw003qA2dj8mZ8AyqSukpkgTNLEU/NNrgbXxy8HRtBZ91UR7JNV79vkU96pY67XY+JKVBTC9MdoECaT7z6oMaRPnJBrWjIb5qIFJOPUMBBbt1fOj7otoPD4SHgiqaBDd2nHpobbyhzSanRrenY2zOYxtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYVGjf73; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYVGjf73"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so28351866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789595207; cv=none;
        d=google.com; s=arc-20260327;
        b=eX8THKEQhZ2iAUlA2gs+937YctudLsH7QEUUS4TMOR2uvzH6Vxzf3FIH42/IRIYXvj
         RVSjgFc8kqqut60DjweCOMxeuJaZ+ZjlNVnDNIKavi4uKYIMkzHHxrUZ9MrSLHChJ7q7
         SiyNcbBm4n3l1sVVq9XdconbqAOmn5f/BgrvQEYJevyL2o5YGZqXlHFMv+Mw4jabHd73
         8XpmoxhFClk/Bq4YXV8dLgacPwKsJYljjSyagHjPUEaGimQnRi233IaIXxU55uBzVJqJ
         D9tQwxIZ4bgwUl0c7DvIHPqBIC0EvxpWPu6Es5cHCwPlfTQ8ae9vBx/A+TeDfaRzS0jb
         npWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        fh=WzsV0/T4fSjx3knAU3rPoYpKOqPk9xb0US2SsbznXRY=;
        b=kJGUxavi9EA9jZ+91f1gFWYgX34HLxwIPw4zz3qRwXT364CmL9Pxs2PI6pmPlBtimE
         vVBJcZLLeqXUfBFs7zfvfshePLxRN5UHaKxD/qmj8ga769B36NVRUbNMZgEZftixxPYg
         xJrMgyGf9xlNQ3SL9bFd1YpIc5nElwjJnoD8Thg7Um9alhUxFRCq0EFznXYQeSeYSzep
         fEJgcF/T9/EXD+fiW5c3wXhCvsnYicETgXNoTLRPJFtSeQUuZHxzEAJI9e0Zj8ZKgH8u
         HitvXEBUqY14oWkPIr9d030+ScDBuV0HF7Mj32iesR+wzKM00kodErlgPLFxE3ENlO7D
         gJMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789595207; x=1790200007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        b=MYVGjf734wH/4j3Sq9bO0FdG7wKdNt55UYJovHMBv07Mzs+MvCunlLhBdyYn7ipBX2
         nCYONVkWjdRNxiBF5QwSiVQACDnO4DgqsSpiFXSZo2yTpcd38HVJEkoUYPdAfO7dqTCo
         oeRlcyk29cVOL/9monmak+kGjuTfHJsHGYhZIkIgN21cX+4EJpWO09C432CfnyFe9Wwy
         nDfroTqiipKy9ezQ4WRdJbkDA55At08JF/l8BIXpsPUgrD8kirYL4lRQPPps8NMA9ZY0
         KOh11fDcC6LTovGSvBIMNmB4WbrYTfhEnkCVWe75AQkq0c/kpsicD4UAZ98zK/igmkDO
         MAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595207; x=1790200007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vS+1dvzi7Y+x/KirADYaqDHW8NYqQEmTS40hoDTXeA=;
        b=noGrCaQGZ+jRsVPZgPBfetPbOhoqiQSq5AVOYwVVxA7VwIHABDTLQjVqkxbUwGyLbB
         pn1caYpAeHp6zUybY2kpadoTt+20JqRPgmSrG3JpOT5nSrZyb2FFkXeRniJwUzOKk7nd
         +X8nwXjYIjYOPG0/PeLlbyg6Na0kmtzsIG6hCLRfFohnBS4xNRrGfcB2ushOECUy0A3o
         rM25v21AzEZT/x4RaL7i9x1ehBSF237q3QQe5eBg/3sqjOikJhpH4Wrw95vC4DZPyHtb
         0+2xhg2vIAn8xmElgfooXMjSmWDC0PbXMNDrR2FXk2gmPtWAFisF4Q0OQiUmnyCTq19f
         QwFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0UC97xnrj0jCQPCF+hL0wX1vy9WKdiF719Rr4DoGRYvEFwqd90xz1BJrSrxj7pmNB3+okJYsE7DhZbvI=@vger.kernel.org
X-Gm-Message-State: AFuF++nIjORmhin6PGGVOua4YppRtF2k2//gbX0g9I0RMINFBxbAQDG1
	TUoWK6zUzpLgy6rfNrdTOhb6OVSofhHjV+mOixp3m/itWd5qxluASar0R3OF4HcxIuxBa3Uoboh
	Z9xgkwmokm9a0uJJ78GxhPJT1BZv6KZs=
X-Gm-Gg: AYBFou2k1Hkp9hf59o6OwMzKFkmi7+EXkYZ9wzfDTwng0PsZBD8SYBki3RIv3bsS1BL
	VchGGG/jLMhlknctsifnTsGT9EIkXoG5zLMzw8V8DZWd43lgM/l1eF3j5A8ZDU664ixQ0hJBBeg
	1jpAY0/i/SjJf+jPPsnkvM8tOadc4Aj0O5QtdPwQrGAQlLN+2r3ATj6xcJUamNPttc1TxXiRW3G
	6/HG+09EuKWoSuI7/zVGXDs03RQnEw/o00TV0R5hbeUNH/NxHGIj481bKuCgFTmwTzGBogZzWiW
	9ndIrT3dEqzlF9IkhFq2IOUu6O/ykAWhnLEtWxPDoXDK0pP7IG0SSVCMYROFfTzoK8eNBlQCDas
	qKoLoPJnyLbNXM62w8r2Uv5KuIWIDv4yJtiosblpaHtVrjqfxoC1Xwma6XpVavbgKyiTp6jHLLz
	eayQCFagKx0nHIQ7++G5ZjvlHgz2py0qQIDGKd099cHKbgBcaVaoacIW/djoSYn5eugA==
X-Received: by 2002:a17:907:3f2a:b0:c29:512a:4668 with SMTP id
 a640c23a62f3a-c29e52ff4dcmr289062966b.27.1789595207042; Wed, 16 Sep 2026
 14:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182405.12985-1-rosenp@gmail.com> <aqrowa1TFhIDA-17@SMW015318>
In-Reply-To: <aqrowa1TFhIDA-17@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 14:46:34 -0700
X-Gm-Features: AcwNN1WY6iX8qh2LELsgf9VLXlYNjHOD3KOzsSe5taIIH5KHhdz0g-vw5on_RnU
Message-ID: <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>, 
	Lennert Buytenhek <buytenh@marvell.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:06=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > Fix the ordering guarantees between descriptor memory writes and the
> > MMIO accesses that expose them to the engine. The descriptor pool is
> > allocated with dma_alloc_wc(), so writes sit in the CPU write buffers
> > and must be drained before the engine is allowed to read them.
> >
> > Program the next-descriptor pointer with writel() instead of
> > writel_relaxed(); the full accessor drains prior memory writes before
> > the MMIO write.
> >
> > In mv_xor_tx_submit() the appended chain link must be visible before th=
e
> > busy-status register is read. Use a full mb() so the engine cannot fetc=
h a
> > stale chain link and stall the channel after the CPU decides it is stil=
l
> > busy.
> >
> > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR engi=
ne")
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/mv_xor.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > index c4e0dce3ca64..0de2b1ad5c30 100644
> > --- a/drivers/dma/mv_xor.c
> > +++ b/drivers/dma/mv_xor.c
> > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_xor_=
chan *chan)
> >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> >                                       u32 next_desc_addr)
> >  {
> > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > +     /* writel drains descriptor writes to DRAM before the engine
> > +      * is pointed at them
> > +      */
> > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
>
> I remember this my comments before, should be v2 version?
>
> >  }
> >
> >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descriptor *t=
x)
> >               /* fix up the hardware chain */
> >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_tx.p=
hys);
> >
> > +             /* make the new link visible to the engine before we read
> > +              * the channel state, the device may fetch it at any poin=
t
> > +              */
> > +             mb();
> > +
>
> The first is readl_relaxed() in mv_chan_is_busy(), all io readl and write=
l
> is ordered.
>
> which part need mb() here?
It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
regular readl in v2.
>
> Frank
>
> >               /* if the channel is not busy */
> >               if (!mv_chan_is_busy(mv_chan)) {
> >                       u32 current_desc =3D mv_chan_get_current_desc(mv_=
chan);
> > --
> > 2.55.0
> >
