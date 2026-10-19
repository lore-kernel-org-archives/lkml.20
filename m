Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792440272;
	b=bdkkcswRSZ+ISuYj6/dtOWnUNFpTAzVBTwcOdKPz0RI00cUE3mDbZGkc+5l+vv1rDtsK
	 xaP2yNoX3rxkUSZAM4+cYm1RNCDetM9vGyuEP1huEZYm1FDAnGcKkVzOv2ty2m9pb8Ftx
	 whuY/eKgkj+blHgmA2COw977kUvcKLntwv4ML1cg4+uFqociPZTt2RDUYm+bU5nevg9Nm
	 ctRNyR0vktg54T7UhoSIlJEBjhkOnbJoDmYnW4Mlwqe4eQen9QnZbWs3/4nG0Fdg6oNoi
	 rsCzcJlOj4h2K1xQLYIT52LKhvWPuQEJ+cIf/ofVIhjmFU0odVYW7vVA+xrO4BL5Wug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hQTMpw8zD5szBflWUqeHKLQyPwSukYsy+dAMyCP/6Lg=;
	b=xULu5jgKZFRPi+klJsPoQMi3n/cFO6pYp3EAVo6hMEjMjF4qnx5/clMdsj/11CGyra09
	 2oSIzAtHl7km828URgzvJiW9e/bgL4EKCycO4SvShHB4gws2C0qIHA3jHyYnR9ksjuVET
	 uKvvKsvtXNRNSUMdFbMS4+4HD9kWfOUuDoFe2hnOZ9+1tBXcDiqIVDHQNQ0G0DyItjtyB
	 8g490M/Ne3GcMN9OhkP0y3X6rHatBrX2uU55vSVuKopYivJlZ4uJ9FBQcXCO0cI4MlsIE
	 x0N4pH8fW9MmPPK5IEGfdZMqO2EPv5aK+GgIU0rl+JMRXWXYrebiMuB+QGJUQWdMNlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Kp8yjJ5s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA72A606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA72A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Kp8yjJ5s
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2055573c8cso311614166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792440270; cv=none;
        d=google.com; s=arc-20260327;
        b=RAq77wbJBhPJjOjMXzN+KtPg8HaE/ZEwyE2SE+XjG+vFrHXdNj1BZ76/CSXYwbC3Gl
         VM3FnMWyjW5zfzLX5IXaxdArd1ZzHIIp0Exo4dfRQ9BWcbUSAcvd4t6T1D4UgH0HuY8I
         T7Uuah5DuPfSqXivQV79AjeMM0ArWZMump8JQIdBHfWfszGdTaEKLI5X6gjwL+4okjLH
         ETdqvlI3fdeV9lI3nzPwphGyrOturLZLtj+TPOMKoyacpPB9kwCAa2EdaaLhfAC+pxQq
         Dz1izi0EYcgrbDvH9CJ5kzeyH3wCaglLj3t1F56V8CPzRE2cj6mHE2p0YRjVtBMfgF5R
         Vn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQTMpw8zD5szBflWUqeHKLQyPwSukYsy+dAMyCP/6Lg=;
        fh=rQw7KOuE7Wnkm1AAWNy04Dkk3JVcpeoRv7zXnHq7sHc=;
        b=FJQoS0B/RyiYBzEFR+HZfgmthErdz/dejv+awtQ/yKxi4VgB5jEqWAuZUP7suZqhcT
         j3XFEpmPFHiK5RNMlMgwRTm1OQJmGGzrhyahFNLj764durN0WZxyFRCvsBQQmDVBHPdm
         AuIFMFaN2a7tmMF+ub7U1p/13N5sf9e30J3Mcqxt8+x4pU3A5ofM+4B0CMaSJbaUJrGr
         +UUl86sd4KDjrKpvjHf2b5OuCeL2kTbERn1/0H0GB3N1w5yBi0HI2FJdsyrc6GBSOjPQ
         eq4nQgW/SfDqUP+QsfOl/aeUADvZTWxOS5fSQnLDSmDv3wgRnN8b5YQ3sWvHqvvxRiDw
         XzmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792440270; x=1793045070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hQTMpw8zD5szBflWUqeHKLQyPwSukYsy+dAMyCP/6Lg=;
        b=Kp8yjJ5sDuHWLcUfpMMXLuziUS0mADvUjFleeEia4HL8UtxY8lhj5mkChqbaP3fUxb
         UE/oFvIJiYqSp/g+L/MSoXcnTW6Y2+OPvkqzdJrLePYa4MB4RVAef1DsV0E1c2WJRPIo
         3MFrdei+08DViffq3JQBKIm118tgiCV6qCUbEm3VlcM29H1fzj/lDbv9t4xtZWeRkY77
         MKY//nmwCxCYMtTsLoJzdGL5BhcGWE0aIHufE1g3peHpHZ3AqNzi2zLBvbLNbprYiRTE
         7sJlUREUdqWb/DqyR8SG/zWEpnpaG2bOOO5m1e/pGfbEJrEuVtxK6V1i1Y/gF8I0FB91
         fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440270; x=1793045070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQTMpw8zD5szBflWUqeHKLQyPwSukYsy+dAMyCP/6Lg=;
        b=YSkBPQrkI1I3jbJy9R6B1F6Z7xWawwY+K+EA+et/ckwMvfoai6d+VlVjc1d5OxEnkp
         CkcPgYJdlvQy7x/wkzVDbxMT8OwgOTkHfjuIBDycY0m7Xg0xwigHwvJPcdM7Nkkge36g
         zB55cp9wGKVO/Hx7E9GHx4aShbP19seWb6od4PAt6aaWX4TqWna7VgmWdEP3syB4NjYj
         Yb/lCzhNe55BROVW0L9/jLz+ZKcxZLp4Ml53X/sszBJPXalV3FdZHyLfCV8ai6kYlq6r
         E/lWVMNVSI4tg//9r823VKWZQGk4DDbVRlPW6NICpeAkjYeW6zLyOwO+su0dVE5fS4GA
         vQCg==
X-Forwarded-Encrypted: i=1; AKwUvByPBApfoU+s2i/Sq+qxMUYRRq63UGTtH7RGIl8O2ojNzCfzXGDz0nbIpb81YUiRq7CXJZDkE2yyU9o/TBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrHcFUPH0d/kX/cl6Y9MdfmmGTNTXmthr+SOyW3/28hSyhU1ya
	9ALjEA/q2ItPtsVZ3VlZqtuGU/1YqfARhNG0bsipgEBhiuuJD7S0jiY4LecR6SLW3W9CPuwcsji
	lpPofDz4Dp0vG2Iak1uS0h71EwebdR62+0ps7JN2F
X-Gm-Gg: AYBFou3MydxinBPwyTS3CNsX3x/wLFE3T+V3RBWyePzLOl1xIk6CLQaDSGKaFwp0N7R
	9OmsTYtgMcTUfHNMsRqOskJn1pAE/MCOBRGC/YebCwssIsP/dXWQpjQ/M1BFwly43+EptNIFKHf
	wYfPU7+kFF6X+Hfxa2IczN+osGId+mtHw8kkh31QexhYc2SiZtqqpQM79gHUXUMnnIyGQxXKOZO
	Sj6dMBLL030zqQCaMMl4LeSZsy8Hpr+Bed6DRKSpQyNE4NO3gX0Jdxs+d0t/FFSrMrLF7+1U5rY
	EjQsoeJ5Mq6R6RY2O9OlaTKoaQu79egFfeqYtZeJG0OWRefY+ciT0LGSoGeUbTyV0Gx2FqjcJ4x
	y+V9wT1ORgTmorO7juuk0ofleBiI/F+3XHjkaGA==
X-Received: by 2002:a17:907:c50a:b0:c2e:61e:f4fd with SMTP id
 a640c23a62f3a-c419a93fe03mr613738966b.5.1792440269617; Mon, 19 Oct 2026
 13:04:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012114213.1757207-1-mclapinski@google.com>
 <atKGTn7PqaDaednD@google.com> <CAAi7L5eqd0WzxiRY-fj3fB1=zOhYdTJnpR3OGgX27tYLe-SPmQ@mail.gmail.com>
In-Reply-To: <CAAi7L5eqd0WzxiRY-fj3fB1=zOhYdTJnpR3OGgX27tYLe-SPmQ@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 19 Oct 2026 13:04:01 -0700
X-Gm-Features: AclHuK_QdMDA5Fu_vMSJQvkQhclAigr8I0alQpzs7JjxBDCU-JiFgxcvCjL7XwU
Message-ID: <CALzav=fY0CGYhcKhHMOjt4gWR47JLr_c9EnGOXaZaz9e7OAjPA@mail.gmail.com>
Subject: Re: [PATCH RESEND] PCI/DOE: Poll briefly for a response before sleeping
To: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:45=E2=80=AFPM Micha=C5=82 C=C5=82api=C5=84ski <mc=
lapinski@google.com> wrote:
>
> On Fri, Oct 16, 2026 at 10:17=E2=80=AFPM David Matlack <dmatlack@google.c=
om> wrote:
> >
> > On 2026-10-12 01:42 PM, Michal Clapinski wrote:
> > > doe_statemachine_work() waits for a response by sleeping
> > > PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
> > > which is 7 ms at HZ=3D1000 and 4 ms at HZ=3D250. Exchanges are served=
 from
> > > the device's local mailbox logic and typically complete within tens o=
f
> > > microseconds, so nearly all of that sleep is wasted. Every DOE-capabl=
e
> > > endpoint pays it once per supported feature during enumeration.
> > >
> > > Poll with usleep_range(20, 50) for the first ~2 ms before falling bac=
k
> > > to the jiffies-based wait. On an Intel Emerald Rapids system, time sp=
ent
> > > in pci_device_add() for a DOE-capable endpoint drops from 41.8 ms to
> > > 14.0 ms.
> >
> > Does any of this remaining time come from pci_doe_abort()? I see that i=
s
> > also called during mailbox creation and has the same call to
> > pci_doe_wait(). If so, maybe the poll logic can be shared.
>
> Yes, but I'm not sure if the poll logic can be shared without making
> the code worse rather than better. I'll look into that.
>
> Also, I'm planning on skipping pci_doe_abort for preserved devices so
> it was less of a priority for me.

I don't think that will be effective. A Live Update may have any
number of preserved and non-preserved devices. We should try to find
solutions that work for both types whenever possible. The less places
we need to sprinkle pci_liveupdate_is_incoming() the better.

>
> > >
> > > Signed-off-by: Michal Clapinski <mclapinski@google.com>
> > > ---
> > > I was asked if I can do this with interrupts instead. I don't see a w=
ay
> > > to do that during device enumeration that won't collide with the
> > > drivers.
> > > ---
> > >  drivers/pci/doe.c | 28 +++++++++++++++++++++++-----
> > >  1 file changed, 23 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
> > > index 6b5d9ba8e969..5e93d78a1a97 100644
> > > --- a/drivers/pci/doe.c
> > > +++ b/drivers/pci/doe.c
> > > @@ -27,6 +27,9 @@
> > >  /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
> > >  #define PCI_DOE_TIMEOUT HZ
> > >  #define PCI_DOE_POLL_INTERVAL        (PCI_DOE_TIMEOUT / 128)
> >
> > It would be nice to also fix the HZ=3D100 issue, in a separate patch
> > within the same series, since you are updating this code.
>
> Okay, will do in v2.
>
> > > +#define PCI_DOE_POLL_FAST_MIN_US     20
> > > +#define PCI_DOE_POLL_FAST_MAX_US     50
> > > +#define PCI_DOE_POLL_FAST_TRIES              40
> > >
> > >  #define PCI_DOE_FLAG_CANCEL  0
> > >  #define PCI_DOE_FLAG_DEAD    1
> > > @@ -487,7 +490,7 @@ static void doe_statemachine_work(struct work_str=
uct *work)
> > >       int offset =3D doe_mb->cap_offset;
> > >       unsigned long timeout_jiffies;
> > >       u32 val;
> > > -     int rc;
> > > +     int rc, tries =3D 0;
> > >
> > >       if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
> > >               signal_task_complete(task, -EIO);
> > > @@ -525,10 +528,25 @@ static void doe_statemachine_work(struct work_s=
truct *work)
> > >                       signal_task_abort(task, -EIO);
> > >                       return;
> > >               }
> > > -             rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
> > > -             if (rc) {
> > > -                     signal_task_abort(task, rc);
> > > -                     return;
> > > +             /*
> > > +              * Exchanges are served from the device's local mailbox
> > > +              * logic and usually complete in tens of microseconds, =
far
> > > +              * below the jiffies granularity of PCI_DOE_POLL_INTERV=
AL.
> > > +              * Poll for up to ~2 ms before falling back to it.
> > > +              */
> >
> > If tens of microsecond is the norm then is polling for up to 2ms
> > overkill?
>
> I guess. I can do more precise measurements and tweak this value;
> however, I can only speak for the device I have on hand, so generally
> I prefer overkilling it.
>
> > > +             if (tries++ < PCI_DOE_POLL_FAST_TRIES) {
> > > +                     if (test_bit(PCI_DOE_FLAG_CANCEL, &doe_mb->flag=
s)) {
> > > +                             signal_task_abort(task, -EIO);
> > > +                             return;
> > > +                     }
> > > +                     usleep_range(PCI_DOE_POLL_FAST_MIN_US,
> > > +                                  PCI_DOE_POLL_FAST_MAX_US);
> > > +             } else {
> > > +                     rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERV=
AL);
> > > +                     if (rc) {
> > > +                             signal_task_abort(task, rc);
> > > +                             return;
> > > +                     }
> > >               }
> > >               goto retry_resp;
> > >       }
> > > --
> > > 2.56.0.385.gd3acb90ef8-goog
> > >
