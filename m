Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793940362;
	b=tr3vOUwpAOxOFJ1axeNWANGE/K98N7gNbdF25sVT5+PqWQoV5KDMFuIW5xCtEE++Yu9Z
	 3MIn4TBWie90YeE1VDFJ/x5EGBasF1492iECYJEt0WgUyWk0vd9PLmKdX/Evw/B4+wRQL
	 MoD1Im3WmP5eW3M9C0ZB6AMijgX29Z+4Y0KKIETGascL4rIeeN10cYsUDUdSBNGjlrdcQ
	 YShwq82sbObYAvMqfI78Q6k2c9stzHBx5lVI22cUUCV/9LB+wEO7HdjYhJr80GGKbKL6b
	 ULiR/RHh+j0ahj0Ndt2CT6BxvHoFhDX9r+jw75Strj67GCquIbU3bUqz1AmJS4BWaFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793940362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
	b=0E/qpa/KSUsvUJ+5QUfKc5P6IppSLVbmpJPGs/BECYBJG0tN2SeScyNnOTQBQFqnJKe9
	 7/aHyCrZp6A9QE1TELQchN6whTrZR/MbA6R+YngeSvnk0kvVGaZ5jNGyJlQKrbj1AEN6V
	 tmqZ+j4Z/AuZFBIEDazJJr9aMnh3qXoCg5p4ktNapaqu6FWJ7WYbfqsMFgcdS3sgeHQTb
	 nm23mkyevOzgqLdFF858BHskVjQcHS8zmTHDkkiwMGIrglL2g1xxOCNZB3s+gkQxqRTaW
	 d9n/nTg4vcbKJuCsqIHhUyW7qU6tR7J2p6m0aA+1+bVvQyi5fjwdfjdUF5TPLdqdjMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4nz4rQm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B1606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD6B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4nz4rQm
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ace304021eso1317091fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793940360; cv=none;
        d=google.com; s=arc-20260327;
        b=B4XM1j8q8jXERMn+cCR1mE67JF6PMpnWDNJzhBhM7M8tUqLjhBtZSeAsDcdl0DpPfD
         P88Ja6DVKV1I6/NNlCTzjt4Te35DNY7n1XPA0WpZF89h9U5Aoag4HT69KlMbByk1DR/i
         YUp/uuee8hj5sOq3TrnKpwuujNvVhgQ0DR5gSN5Dk+L5SM35e5AeVb7j0KS39hUTwG3x
         vzzclddSe0vEQAXAEy1hGgPSQ0Wp/x+26IEKlBUM7T1Ckv0U0t6TEpVWdI4m2eXT6vly
         VYcYM2W58g5ETtCZGqoyX3TFkhAZN3JmNBzsXr04jW0ekpDt9BZEekfGDFdcNV9WTZth
         1b6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        fh=2NrU9xU54vjeRLGbKeWKAhqlglkaitDjIPbzyfTwQ8g=;
        b=pQQ4yqS512YYQ4XCnyO6PKvuiSCslfLOMDBo/j7VAvJPR8/6rmQHBBmpctgiQyp1ho
         n682v8z6btOMazpobKKl0XK9yaG41LBwDsZtc1GvIt3Vu2MKEeCaDqObyYVv2raXkPzB
         dfKYVe4M331eISvVRwhipYvsfr6kZYdteGabkCT66oh+FuStTfqJoUbhjWjz5K1wFZ0N
         hxonvV2Xv2lUUvV4uwcyfQxiPUgcFkbGKTOffTo1wDvNMLVQd/MEQLuoN1MNNKeZ7Ojd
         yVicTbqfcDrzYOaB74blqOQHWaG6aIcYvHTPim/DjxXfQi9hJp3q49lE08CigNtf2csE
         InLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793940360; x=1794545160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        b=r4nz4rQmMEmdI+MeJ0v5dvEjAm7suMwqYOYkYTE3y/uivVXfMfZ355UkXIH1yRCHFJ
         bWv2evfWZgKiKCLqC9dUesRS8Q31fz9yCXOhBK47pntlJr5L4l8rVP91CAwI2BqJoDvC
         0e7sUjk8S8Gdv22S1IX5PmWEbwsxmATL97yW6eAb9f7YG/Zkns3gVePP5d4CwF5HGTBf
         qq0c09izJ38PswxQzOPlbpodJWw3V4iASsNMJtagGD1fGBmORraEP5KvW30wJQscYEdU
         dy7iyyolzzzBs82a/rrJ+IHTqNBN+BsbLDSzwDEAMxOgRoRwAv0UfDfRFoYjunJwJeTJ
         OCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793940360; x=1794545160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAmTl1mFszTmCgkQzVKUXgQBnb0rwXdvZNudweFnsr4=;
        b=Gin1sSqljYFptl7swsJBaP/tH2qVU1oo7pA+JmVOmFAtX67vZ4AU7t6kJ6xFxuPEWZ
         FpMXwuzqtyVez60KXArHaW7h3/2DTmGvWElt9X5cnkAhB1nXTEUCpOAN71cK+jSb6uVO
         K7e3skbz2h+MLs/TkR2hJol/FVPCxd5w7Mr+Lhsjl/RLa9ltHvIXmROBQAcWhTHzTn1H
         Q3MbD2kbRlXtq0rDNm1zsCjIt28ON2I69yECkkziBSGhwernaKl+mE7nbzrDfeeawHrb
         mAifHLQfQ4zXEJHZ0Udv3zGnSkw3NASIgMfunQWDk8zXAcoNnqw0XxYOFrLM9Nkc6DqR
         drjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3T4N9z0oJj+YIl5z/4o9VOy5afgNm3qg0LPMscbOAsxWYkFnwbonooMTjNd+p2ZGafRefi6VVwBOQAtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8793oCwTufSRVhGTbNtjuuz8NNwbVIvMI1E1CGqWxzUPAX6xfd
	W9ms7fLcyK3ugR0ySqwgheNcqrdJ3AJtqhTj3AkCLL5EtPkgHSTfinIiEqxyTMnw4FZZLeHxyvS
	XDWlOjI+C7UkUos0S2JPwP7NoHDmn2mA=
X-Gm-Gg: AYBFou37mA0rUKNoFQT78C+q6tFN0MlFGXpXh2IG6SQzjkP4pdzKMXEQz+h0VFqfhth
	lgr+a91w721z31enAa87r1zsJSWOVu0hWsQ22XmZ6+DWSfh+zUAWbZjc1MJZVdAK8ZIwOkGOWSN
	1GLGKWRpmJUfUCO5mIcoxbFacR4L8Ka+xcasZo8UpvA3A91HdZXYN0HoHRi7f0TVfaNhECMx9c8
	sahh5GeY9A7eKPlGNOhdFhat1Pqjki5XYMit1dMKfI1SB3VXXSigwI1+HTtIJ4GRvEDuttI7Cmo
	6j6DSnVplFaBea0qJTF5RcyeC+ggCXY0qxZ5ACsFv2YE8rpZYLSrPua1y5E8Ywi8Ec+xVnwCzjU
	UhVLZAK143SQCPUOhMVAXrxouNet0iXL2aFQU5nBfvx1+6jZUaBVWct212dGPjPHSBwbsMABcbG
	o2s7VeIpOVXbUbsyBH3ZuNrx+Dcyq8
X-Received: by 2002:a05:651c:1586:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3acf3a11265mr2431841fa.4.1793940359472; Thu, 05 Nov 2026
 20:45:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179378589227.74015.8259496684787732118@gmail.com> <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
In-Reply-To: <bklsnrvgleshngfc6vpc5kzb3feaxbl4qmaoti7swky2yqpnse@eyboedx6duxf>
From: zhang san <shunsheng1218@gmail.com>
Date: Fri, 6 Nov 2026 12:45:48 +0800
X-Gm-Features: AclHuK8pLeYzRFlaA3gG_ANlZlnRkZ-nxT_X8cLPPBq_jpT8Aiwzj23SeaOxxsY
Message-ID: <CAGTEBTaFvEK5Tr2fH=WiLA9+x-S4VnuMuhk3cJz8cOc71nx3sQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM port
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: badhri@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux@roeck-us.net, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Thanks for the review.

You are right that tcpci_remove() clears TCPC_ALERT_MASK before
unregistering the TCPM port. However, this prevents subsequent chip
alerts; it does not synchronize with a threaded IRQ handler that was
already woken or running before the mask write.

In particular, tcpci_irq() can call tcpm_cc_change(), which queues
event_work on port->wq. Meanwhile, tcpm_unregister_port() destroys that
worker. An in-flight IRQ thread can therefore reach
kthread_queue_work() after the worker has been destroyed.

We reproduced this ordering on a KASAN-enabled 7.4-rc1 kernel using a
simulated I2C TCPCI device. A kprobe paused the real threaded handler
immediately before kthread_queue_work() while another CPU unbound the
device.

Without the patch, TCPM worker teardown completed before the handler
resumed, and KASAN reported a slab-use-after-free in
kthread_queue_work().

With the patch, devm_free_irq() waited for the handler to finish before
tcpci_unregister_port() destroyed the worker, and the same test produced
no KASAN report.

This is an injection-assisted reproduction, not a measurement of how
often the race occurs on physical hardware. It demonstrates that
masking the chip alert does not by itself exclude an already in-flight
threaded handler.

I would be happy to provide further details of the interleaving or test
setup if useful.

Best regards,
Yaohan Li


Xu Yang <xu.yang_2@oss.nxp.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=94 10:19=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 04, 2026 at 05:51:32PM +0800, Yaohan Li wrote:
> > tcpci_remove() unregisters the TCPM port before the managed threaded
> > IRQ has been released. The IRQ handler can still queue work on the
> > TCPM port worker after unregister has destroyed that worker, causing
> > a use-after-free.
>
> The ALERT_MASK is set to 0 and chip interrupts are masked before unregist=
er
> the port. I assume no IRQ should be fired again after port is unregisterd=
.
>
> >
> > Free and synchronize the managed IRQ before calling
> > tcpci_unregister_port(). This ensures no new alert callback can
> > queue work after the TCPM worker has been torn down.
> >
> > A KASAN test using a simulated I2C TCPCI device reproduced the
> > race while unregistering the port. The corresponding teardown
> > sequence produced no report after the change.
>
> Can you describe how the race happens?
>
> Thanks,
> Xu Yang
>
> >
> > Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
> > Assisted-by: ZCode:GLM-4
> > Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index 6717ac914c6a6..580dd5256d0a3 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -993,6 +993,15 @@ static void tcpci_remove(struct i2c_client *client=
)
> >       if (err < 0)
> >               dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", =
ERR_PTR(err));
> >
> > +     /*
> > +      * The port's kthread worker is freed by tcpci_unregister_port()
> > +      * below, and the threaded IRQ handler queues work on it without
> > +      * any port-registered check. Free the IRQ (which also waits for
> > +      * an in-flight handler) before the port is unregistered: the dev=
m
> > +      * cleanup would only run after .remove() has returned.
> > +      */
> > +     devm_free_irq(&client->dev, client->irq, chip);
> > +
> >       tcpci_unregister_port(chip->tcpci);
> >  }
> >
> > --
> > 2.34.1
> >
