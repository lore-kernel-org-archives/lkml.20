Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F62C379C22
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183532; cv=pass; b=WHhczQ+EkuSw4o3/UtvT2w2ZUviN2vVZ4vvRD6YlNfkVO3j0ucj09rx66WLbsa/dCbGGd6ogUlCdEfQa7mbDVbnFVzElPJd+J0vBPM7iDsRZ5PEJYzll3Hy1iPWNbYwh6vd9AImJooXXJGuW1bBdxoyqrbRc6MoK4ltLyrBHxBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183532; c=relaxed/simple;
	bh=w7JWyGZgHnZCAXoncz6LsZsA5BNgjOZNNNQ+Gy3++CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+x3Gr8yqQiOACbQ237+oJNBBpr1YYpKzU4pvrv/88Uu0R9GfAWMjYiORipkQ/Z8WekD/GKu5wb96YcuTmYIrCSQevUcQJjbDkSjm5MdxCJTkFYwWyl75SewcCBNhNLXLo8eTHvgC5hTWSe65F3i0IbnprXFK1KX3J2+i3aIBS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oUDjoBO7; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oUDjoBO7"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1296a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792183529; cv=none;
        d=google.com; s=arc-20260327;
        b=D8hLpPEzPC92aPSaDYA6a4LIff3SElfhGpYkgWWjKr5o6kP9dNApeWc+ZUMZct+HsE
         je/uTlhnFdGxLQSm12QNGug1hrmCjqn1gvddAJJPNV0f1Sv4L5S4LUskxBspP1Arejrx
         HmIAVlr8jzSTNcFEH6xtDB70cutjbeFUsMpdmNOIT4H5xO9RWtSQwLnvNJTfdJInyjGS
         80j/uuUxByXYTUIr3g6hth5vUErXmMMgLkYdqQvVXpAGfXgatfg8xUdHAPwWbNgqbArF
         t70DSZjdCLA0bFJlJW5Sw0cBqToAFa7m9kWkskSrkA7k0GjJ6qQJ3rlmuvfg5+MlWFHL
         u7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03NCNpz5syFo1Xi0u7EMykw+dKPD9aN2iwbA6vJW+Ss=;
        fh=8LulxqctHKL44D8ZDHCmkm0Voc53oc0O5+08vrU1ydI=;
        b=jCxjOoAkh5vKTnhpIQj3HKNv0TfklYABT8Zn5Wy9qYLNv3nEILxBbKpWhUIevNAgsY
         udwmXQxiWy5hw4KxD96DRH745MEyKoQXbjl7rJ26RpMbyL5sk2/gP/w+6EmpYPsQTC5I
         +KF6scMHzRCryaCId3zpF66LP+/ZdFA+f7zKBsl7O5+wETCfDu9ClQJuGiM46ZdPVeLr
         qT5Z8GvN0kA35opP5n2+5wwdHqCOlzc0XYMREUgBOtjrGw87v8tY9iFsFsa3nNnxCLup
         ilbRS+8Tu9Tz5P9mOXhx0BBRCjFE1TkdfgQfEMX49A88L/CrxG7WpLSk08V88KRKEfoZ
         wX2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792183529; x=1792788329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=03NCNpz5syFo1Xi0u7EMykw+dKPD9aN2iwbA6vJW+Ss=;
        b=oUDjoBO7duICncwbCaZxWoozEseHLEJYmdaHso+GoltA9+8o98+95pXhv8Zf0bIOe3
         FfwyU7MjMh+I54Xuk+YlLhM2ORaBHZgOTIZ8MbrP4KR+WoCM2K3pwyd4GikDklWBlUhs
         +pr2UnUpW3H+XB6APm1dyz8stWF2q4egAkh9wMmm23fvOlEephPpcZOulpuJCE5WK0J7
         rDUBv4bWR8GGW0q6WRSFGwb16c89FtpHcCcPZyHEJDagom8MuE2hDPpTSBpgWKcIqQXL
         hndIFgPY5LiyXaQIY53zhaF7VCmRifcw2rbXWy7VnxsdnQM4U5dsmj5EZY1FIyI35GP4
         SlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183529; x=1792788329;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=03NCNpz5syFo1Xi0u7EMykw+dKPD9aN2iwbA6vJW+Ss=;
        b=CVBxUwChZMf/pCJ+2j3WX5Do9s6M/IxL6jounKrm6f49DPcvt+M1cP1IETJhdcLl6I
         ubXsb3odgkWexpNCEBHj8hkWOWC6hcJR7kuXsWxdo52sJIxW2IS1CxA/sAWd9vCkN8MH
         eW4uKp67iZkqCZtFviw+bnWhN75cZDY1DO48mU7f3IBOnk6+mjyqvg5asbLRiEdpa9Ja
         xjjt6+8XsG5J0T/kw+zmRdY6QhhbVw3SIWzgzQObKcL723W3kc4dX6LX/dsnHqOkKn4t
         PLsEYFq8CaFh6DJthRQq306Y7RDbP75VG6dLaNhEYPDBpT9w6TKEnqSuKgnsWQb4jU32
         dsqA==
X-Forwarded-Encrypted: i=1; AKwUvBzs4a6+Az7Lbi0mYqlS5uPRocPT0wwCmwuH2uGmuyG0T2i1g6hE3fGnop9Q8JuiGa96MLM9K/CbN80ZHZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIK6nOvMO5tcjgqyWzUjn90UVe+2KDXYgvp6RTqlbLah5+eSMd
	cVua73BCaaPla8d2wqeBG+ELtnmRjbW6qSJMMcRHF9/wZrjyvH9STIxAT5uCOQyir97Sx4cM1ZO
	J19KS5GZ4JIpXScj0s/t47olbST2MW2mE5QHyDkzQ
X-Gm-Gg: AYBFou1HYxWynJqPBEf8/jKYwOxh487I1dV3maS6OEi3kQ+xEvyFt+M9jDh12Dq+D3X
	ABAt0OEgBFYVqCd71U6KHdYbQU68s7yCO0m6n+U+7ANNuD87r4Z6aGRShFZVWMB+hxpw1MiXPCT
	VNzWuVbFarPt+mxi4nMeIY042c98lyHNwH/C/hpZs28E1ffbjM3mGKi+1np4971izYxamzQ/xMz
	eWG+RzAOSNJkxQW6SVGxokiaPAUT9lAX5nbZkLf8eOL2K7U/pOEkXa6F+wm7iek7m+bVSyUakLn
	Rnbmux0d7lPdBUkO4ySZ0KcZvIZurZI/oEzOKlWXHeeOh45oBYY2awSib4JCqj2XjLYiXStm+jE
	aStlLmhuCznzLwRkNDMw6t+erGnRnh5R11Iubx1sARcXuDxB0Edh1hPswp63U4Zwtuwe3LfRgMa
	54gF/RO7hItqcUsBFm+1js
X-Received: by 2002:aa7:cd52:0:b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b3ad90b370mr2852a12.7.1792183528706; Fri, 16 Oct 2026 13:45:28
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012114213.1757207-1-mclapinski@google.com> <atKGTn7PqaDaednD@google.com>
In-Reply-To: <atKGTn7PqaDaednD@google.com>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Fri, 16 Oct 2026 22:45:17 +0200
X-Gm-Features: AclHuK9TobvuzpulXhszilDKlYekt3FFZzWTrchifXJqQVbqZiZZYgBDRTMbwuQ
Message-ID: <CAAi7L5eqd0WzxiRY-fj3fB1=zOhYdTJnpR3OGgX27tYLe-SPmQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] PCI/DOE: Poll briefly for a response before sleeping
To: David Matlack <dmatlack@google.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:17=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
> On 2026-10-12 01:42 PM, Michal Clapinski wrote:
> > doe_statemachine_work() waits for a response by sleeping
> > PCI_DOE_POLL_INTERVAL (PCI_DOE_TIMEOUT / 128) between status reads,
> > which is 7 ms at HZ=3D1000 and 4 ms at HZ=3D250. Exchanges are served f=
rom
> > the device's local mailbox logic and typically complete within tens of
> > microseconds, so nearly all of that sleep is wasted. Every DOE-capable
> > endpoint pays it once per supported feature during enumeration.
> >
> > Poll with usleep_range(20, 50) for the first ~2 ms before falling back
> > to the jiffies-based wait. On an Intel Emerald Rapids system, time spen=
t
> > in pci_device_add() for a DOE-capable endpoint drops from 41.8 ms to
> > 14.0 ms.
>
> Does any of this remaining time come from pci_doe_abort()? I see that is
> also called during mailbox creation and has the same call to
> pci_doe_wait(). If so, maybe the poll logic can be shared.

Yes, but I'm not sure if the poll logic can be shared without making
the code worse rather than better. I'll look into that.

Also, I'm planning on skipping pci_doe_abort for preserved devices so
it was less of a priority for me.

> >
> > Signed-off-by: Michal Clapinski <mclapinski@google.com>
> > ---
> > I was asked if I can do this with interrupts instead. I don't see a way
> > to do that during device enumeration that won't collide with the
> > drivers.
> > ---
> >  drivers/pci/doe.c | 28 +++++++++++++++++++++++-----
> >  1 file changed, 23 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pci/doe.c b/drivers/pci/doe.c
> > index 6b5d9ba8e969..5e93d78a1a97 100644
> > --- a/drivers/pci/doe.c
> > +++ b/drivers/pci/doe.c
> > @@ -27,6 +27,9 @@
> >  /* Timeout of 1 second from 6.30.2 Operation, PCI Spec r6.0 */
> >  #define PCI_DOE_TIMEOUT HZ
> >  #define PCI_DOE_POLL_INTERVAL        (PCI_DOE_TIMEOUT / 128)
>
> It would be nice to also fix the HZ=3D100 issue, in a separate patch
> within the same series, since you are updating this code.

Okay, will do in v2.

> > +#define PCI_DOE_POLL_FAST_MIN_US     20
> > +#define PCI_DOE_POLL_FAST_MAX_US     50
> > +#define PCI_DOE_POLL_FAST_TRIES              40
> >
> >  #define PCI_DOE_FLAG_CANCEL  0
> >  #define PCI_DOE_FLAG_DEAD    1
> > @@ -487,7 +490,7 @@ static void doe_statemachine_work(struct work_struc=
t *work)
> >       int offset =3D doe_mb->cap_offset;
> >       unsigned long timeout_jiffies;
> >       u32 val;
> > -     int rc;
> > +     int rc, tries =3D 0;
> >
> >       if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
> >               signal_task_complete(task, -EIO);
> > @@ -525,10 +528,25 @@ static void doe_statemachine_work(struct work_str=
uct *work)
> >                       signal_task_abort(task, -EIO);
> >                       return;
> >               }
> > -             rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
> > -             if (rc) {
> > -                     signal_task_abort(task, rc);
> > -                     return;
> > +             /*
> > +              * Exchanges are served from the device's local mailbox
> > +              * logic and usually complete in tens of microseconds, fa=
r
> > +              * below the jiffies granularity of PCI_DOE_POLL_INTERVAL=
.
> > +              * Poll for up to ~2 ms before falling back to it.
> > +              */
>
> If tens of microsecond is the norm then is polling for up to 2ms
> overkill?

I guess. I can do more precise measurements and tweak this value;
however, I can only speak for the device I have on hand, so generally
I prefer overkilling it.

> > +             if (tries++ < PCI_DOE_POLL_FAST_TRIES) {
> > +                     if (test_bit(PCI_DOE_FLAG_CANCEL, &doe_mb->flags)=
) {
> > +                             signal_task_abort(task, -EIO);
> > +                             return;
> > +                     }
> > +                     usleep_range(PCI_DOE_POLL_FAST_MIN_US,
> > +                                  PCI_DOE_POLL_FAST_MAX_US);
> > +             } else {
> > +                     rc =3D pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL=
);
> > +                     if (rc) {
> > +                             signal_task_abort(task, rc);
> > +                             return;
> > +                     }
> >               }
> >               goto retry_resp;
> >       }
> > --
> > 2.56.0.385.gd3acb90ef8-goog
> >
