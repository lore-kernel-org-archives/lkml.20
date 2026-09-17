Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9364B1CE0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688748; cv=pass; b=f/VfHMkMfxht9jqBoy/KEULneldKpYyaQQvS9RpzMMUqEJ69DIhjWK9+uHvhYmEfwWdn/bEpP1SUdun1NV8Jw2P9yhYpct6yCoJRFobCBwUZuPrWFD7S+ZQcSqOjMZ2zj0srOayWW/JQRJr4A2rE7ZuDQxuAwPI0HMt7wYBkyTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688748; c=relaxed/simple;
	bh=pE4rjGDF1bQbyBBb0Wy35uSEjHl+G4PyGMxkQjXjeRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYYZ5ZNE/6mI2lUlB832UqxLXIBs5hu//LtPpSCCbfGHdzPPTd3ZUMhUeOiwB2GtiBY54sMVlUqrdMR0cpPziq0OfNWojBbseLTsZL3im1VQ0MKl2BodGW0T+GWrVhsWF8WbCM0b5u8z5vpUdRr3by1XVnCypJ0EVxlI7nCPxVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C076HdeP; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C076HdeP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so24055566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789688743; cv=none;
        d=google.com; s=arc-20260327;
        b=HgP2opeFyFikfX1Ds6yL1AGYZWSIilicl20Egt+XZ9INeMFzkHA+M4zJIhaknEGDae
         2gjK06UfnBjXERHyLC9y4Jni/LNSMvR3jQdO4t6HR7AcXhsbCqwlSK+n0aI/CVChW43B
         k3fDrn1hHxMxXVurCbfJF3IDmdTZxAdkjvVgXEuYscmweFPzTMvCmShcvgUYySbnMZex
         Ymtlt/9ofw5i5X20NkGhHG7jCshB/T0XqEmLlapZ6TpUINPRbC4xRwOOvtfKGYmI3LRK
         4Aw3/YvEAB2lSIMcS7C4dE4RjEspL5GNaa3QIV9UEfNr6tcAZ0PU0RQZNgPJYXoNnbvt
         aUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        fh=yEseTJR+hwkua3TniTzT5c/uvdAmTMNurWBUFaKnNy4=;
        b=hO5IcKgrk2Tzfu901zxjTvfkUWzbxozJZ05RgNm/pewe7kWmHUOomcaHbQNRgpe3QR
         GK/X/UiTg9pxaO8az02eoMkYad/vLsFCOhswj5fGRAzlKEdrrT3QHKrhM/keEigNhEaG
         QWpBluGqsaQVySGyF0KiTUVWbFleVHZbQn0e0wOaHpUsk/TMcpy8DEWpEW+vKtK42omE
         rtptGdV1SiQUIX0p5Zz9ps6CDFC2lpiGaUEgPXPppIYqSxMkJS7Y3klT/MRSJorPllAr
         TrmWlKCYJA0yzys0MxGrmDUUU26CWq905vQiuxALf2CPnq1/SbjpnR7YsDpDSEByYLju
         0puQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789688743; x=1790293543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        b=C076HdePBPIHEZPZcWB41QMZCTaSXAdizom0yZ6C1fmKp+R6mXM+vcxSqyr8RL6VX2
         oF2FevOwyCJhYFkjYWKd4H0Bl9RFIFotRYREuMZ3aIpKXhozpCvEItsEfDllESaEBTYv
         XjzaY8TWbhla/u3shdNviwywlEfjooS9LWBKwU6QoifQy2nqhm+aIhZvyl5on9fGk9k2
         1OSY88/ifwaZ1Ho075KlYbJVk/W8hpCQNDZyc1Fn7rTOl8CD4KHhNyw7shkhs+FpP4y3
         y1Fdjtebzyql3/LcjWBFIhaqU5vIfo3Tq7Rs4QOM5ShHoeP7+w97NhPikoKoqRM709wH
         ndyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789688743; x=1790293543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRCvOsr2xS9Eb1jZjbj4vcoW3Fq5/gZdfVw4G7qLA0s=;
        b=LqytHDP7sugAMy6g8OJlE9fZzMOTzM8LF+K2/WXyBE3z+wp349wmKTkBGtfqER1mA4
         sFzORGR+eBXQAFJ5AnK78xA/d+ROtAtfbhtkyRmQLeaGHtOoO/7oZMWAowYA3RGSs7L9
         4wj+VXOUVPpWDRNr33gaEHS599d6y3ZuUpJ5UchOkxgEFKP276k+ywvZIj3XrNlwEW1X
         A/4y8mwyxM7GWUQZGaN9ACI/qQ2NtJxxNcE3hvcFx/4NJtA4IiImOdRI9AkekQNGGkq3
         6SyZ15/Wejx9MfwFBP7bfxC+67wP30dVboQTs0YGR6FO2E6noeP410xDiZg2kohXrbyI
         lUlA==
X-Forwarded-Encrypted: i=1; AKwUvBz6uT8eNkorSgTWGb3IyAomXSKiEfC3Q13kPeKgsokOLZTN8YLNrFSvThSyvwVIDvXvj7HG4S0VOJSKHLw=@vger.kernel.org
X-Gm-Message-State: AFuF++nQZWYInEsPBOEQOPB6tBcEkpX3t6do68+jbxrvxgU/LBMQdXS2
	BG4ALsLh5Ln6dx8CR0MGabAu6jbPJT5nUpuRjPWaCe6vv3xEYodg/lwZbqSi4YJod5OOP4AU+DY
	g1NRrpHU1in1JZjgQS5fJLxipa1v42B5UKRKS
X-Gm-Gg: AYBFou0job/IVnGMIyIzuoLoiCcjIdmVeokkhDyxNQzFwkuyb6lhoqvKW7zG+nydKA1
	Mltv/FWmQzWHtGTpGfEKgoCRr9VQTmhJwL5n3FdVeYHJB5oJ8pr9D5xXdhPTL3ibJUwl3acoT0d
	+iz2IOFomctiuNSEFQY5LuHmC+7JvIXGeNROXUmTKAzRiGo1ILp6IfTL37zFhRYJRqV58B+YFCK
	Dbfc9TFSj91cqrjwbRn1ZJQU6+aEQvyW3IUzXQNIgi9RaRXCv6zgwzzbVElX/b8TP+xIR6iDBS3
	zeEDWQpMbuMr/Zv3dj47bRe+B21Mbjd25VvKrFeSiPAKFHUw2ntqb4QhnXweXFyLsc1nkzJPyN7
	pdM8odbJ/JiTPSPnvrbTNkif4aNzi4z9DwyGpXGHenMHC5mzgaslzRIQQBbqnvl2FAiiFeaoGc5
	jgM2lZBI0Qm1ioac+Y3dCFkOs0XgM6h3b57Aoi9ZaRmO3HGUgPWygj2z7BXXRccDBlUfXi6MFpx
	tjR
X-Received: by 2002:a17:906:c10f:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c2a157c1e2amr70591466b.27.1789688743376; Thu, 17 Sep 2026
 16:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182405.12985-1-rosenp@gmail.com> <aqrowa1TFhIDA-17@SMW015318>
 <CAKxU2N-zLp3612KRsdmWKjm2hMBOikBZDBEqvpLOxpg44J4Fwg@mail.gmail.com> <aqsZMeDZShMpCVj_@SMW015318>
In-Reply-To: <aqsZMeDZShMpCVj_@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 16:45:31 -0700
X-Gm-Features: AcwNN1XwuyK7TTtG8HY8dqkkaXc2gXqb_ZtiR21TrmE9DTQIzZohBc4bNkcnUts
Message-ID: <CAKxU2N-KfzS3uXRE6GKy2FL2mgrfXwbHaZx21ynhrubnGkJcvQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: use writel() instead of relaxed variant
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Saeed Bishara <saeed@marvell.com>, 
	Lennert Buytenhek <buytenh@marvell.com>, Maciej Sosnowski <maciej.sosnowski@intel.com>, 
	Dan Williams <djbw@kernel.org>, Nicolas Pitre <nico@marvell.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:33=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 02:46:34PM -0700, Rosen Penev wrote:
> > On Wed, Sep 16, 2026 at 12:06=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Wed, Sep 16, 2026 at 11:24:05AM -0700, Rosen Penev wrote:
> > > > Fix the ordering guarantees between descriptor memory writes and th=
e
> > > > MMIO accesses that expose them to the engine. The descriptor pool i=
s
> > > > allocated with dma_alloc_wc(), so writes sit in the CPU write buffe=
rs
> > > > and must be drained before the engine is allowed to read them.
> > > >
> > > > Program the next-descriptor pointer with writel() instead of
> > > > writel_relaxed(); the full accessor drains prior memory writes befo=
re
> > > > the MMIO write.
> > > >
> > > > In mv_xor_tx_submit() the appended chain link must be visible befor=
e the
> > > > busy-status register is read. Use a full mb() so the engine cannot =
fetch a
> > > > stale chain link and stall the channel after the CPU decides it is =
still
> > > > busy.
> > > >
> > > > Fixes: ff7b04796d98 ("dmaengine: DMA engine driver for Marvell XOR =
engine")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/dma/mv_xor.c | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > > > index c4e0dce3ca64..0de2b1ad5c30 100644
> > > > --- a/drivers/dma/mv_xor.c
> > > > +++ b/drivers/dma/mv_xor.c
> > > > @@ -103,7 +103,10 @@ static u32 mv_chan_get_current_desc(struct mv_=
xor_chan *chan)
> > > >  static void mv_chan_set_next_descriptor(struct mv_xor_chan *chan,
> > > >                                       u32 next_desc_addr)
> > > >  {
> > > > -     writel_relaxed(next_desc_addr, XOR_NEXT_DESC(chan));
> > > > +     /* writel drains descriptor writes to DRAM before the engine
> > > > +      * is pointed at them
> > > > +      */
> > > > +     writel(next_desc_addr, XOR_NEXT_DESC(chan));
> > >
> > > I remember this my comments before, should be v2 version?
> > >
> > > >  }
> > > >
> > > >  static void mv_chan_unmask_interrupts(struct mv_xor_chan *chan)
> > > > @@ -410,6 +413,11 @@ mv_xor_tx_submit(struct dma_async_tx_descripto=
r *tx)
> > > >               /* fix up the hardware chain */
> > > >               mv_desc_set_next_desc(old_chain_tail, sw_desc->async_=
tx.phys);
> > > >
> > > > +             /* make the new link visible to the engine before we =
read
> > > > +              * the channel state, the device may fetch it at any =
point
> > > > +              */
> > > > +             mb();
> > > > +
> > >
> > > The first is readl_relaxed() in mv_chan_is_busy(), all io readl and w=
ritel
> > > is ordered.
> > >
> > > which part need mb() here?
> > It's to deal with readl_relaxed in mv_chan_is_busy. I'll change to
> > regular readl in v2.
>
> I just want to know which variable need read barrier() ?

Review says:

 #### Validity of mb() after mv_desc_set_next_desc()

  =E2=80=A2 Ordering the memory store (old_chain_tail->phy_next_desc) befor=
e
the MMIO register load (readl_relaxed(XOR_ACTIVATION) in
mv_xor.c:181-188) is necessary to prevent the
  CPU from seeing busy =3D=3D 1 while the link store is still in the CPU's
store buffer, followed by the hardware completing old_chain_tail,
reading a stale 0-pointer, and
  halting without the CPU restarting it.
  =E2=80=A2 Since readl_relaxed() does not order against prior memory store=
s,
and dma_wmb() / wmb() only order stores against stores, a mandatory
full barrier (mb()) is the
  appropriate barrier for ordering a normal/WC memory store before an MMIO =
read.
>
> Frank
>
> > >
> > > Frank
> > >
> > > >               /* if the channel is not busy */
> > > >               if (!mv_chan_is_busy(mv_chan)) {
> > > >                       u32 current_desc =3D mv_chan_get_current_desc=
(mv_chan);
> > > > --
> > > > 2.55.0
> > > >
