Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448937DE8D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130031; cv=pass; b=Pru0fvUhZPVOKP9anRHa/8cUCxEs+NYGB+2P3ivkevN4l86x10i109PiLNkKPekc9x+F/rQt8FLUqydHMEmJCwUt/jzYCQFvAyURy6Ck8Vv990PvlROk3iKISgMIEfFPr9tnTgzdft7HrtvNZ7Gi6AtNO5xM0xaDk4pivtR4KuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130031; c=relaxed/simple;
	bh=V2qdxgflwYbcUy4nEBTsHeRv63mxYIc5awkYH7z+8Go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFx6SSg1fjE2cDZm7/eGYYnvxFuFuxjjxRzwpMFvJWtseV06WE09rjJmguoqKsUt1uH+bPmIym2r10iVzG8aBebJgsJzAS5s4+Ib83GlnN0VrTXoWT0hmdM6wn5nXRydLMzjtm1sgWvasvp32srVQU3mbYOwyFKj9ZXV3IH58ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kC1lQ5fU; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kC1lQ5fU"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so54426966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790130027; cv=none;
        d=google.com; s=arc-20260327;
        b=A0PFJ21iLbNNf4EDH9Ckg9sUTMzmugnlMVh2FxzdLTuVUIpD7D1sIkMgG3P3OpGXuZ
         QwHBe3P6rIlFyP2o6x8Y11RgyO2VdpPIZ3iGtAmhKn0FBp73tvVbO4tT7IsiwWwzMh6U
         tyHphwQ8ULnUc+ddE+/Drf0w3XNc69kxMRcLiufBaREy0FAcxqWvynQHR4aTvMke1mZM
         KjeZCZbr/PDbHYp7eg7kmSEtYshGV7dQRQOcBfJU2ObTonqxWTz+Z8IzVlvirmyHXQbN
         QjisuKnQP+I3uQBEkcVG4FKiFMzPqtjqulD3bZ41O8b0xirsTvTavjucVcjcc59urUQi
         dHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        fh=BwNvklZ5UC/yJ0dZ3O9IdtflM57+PJo0GklPIFfc7xo=;
        b=P6dxBuaeA0J+HBAe4WWItUCy7UAOI2KJUbkLhyEE/RaC1KdWL29l5j2KCUWRocNSCg
         /a9VStbhKmNPJXkc9Fu3CvkyOIhmPhiWZlh9gzHSez0X9YlC/U3Y2coUBpZgNi0gl88V
         cUmSAxBc9xvZ2Ywe8xSQLCtlk3d1l30b3Rc8LK7O6HRlyMHYRXO1iIclGZSBH5Xo4s+Q
         ZV0FAuJGro2jdxAsx5+im5l9g4k40MHYGrpC4ggOQdNzYyBMmVNggvXbrhgx8naZG5K/
         5Poo2yp3OdQ53RDcPC0G0CNkPRJDGNVK87JyOf7wUV81bF9K0y0XDdIMsfC+IU4VyGQg
         ZM5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130027; x=1790734827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        b=kC1lQ5fUoN1Z9eUoZg0vjdTywC6mgm54WycyzmlcUSx040loyyEVjmQdIq6M1ZKpaK
         dUMrOKCK7T+iMCxyPNjRhQdm0r9bzIoemC86pOlfXC7G4pAzlaKOy28yLm3ToecLI8e+
         gKtFtvia+wtlm2I+4N6LSz7eJIMqmWqHduT5uEpwqiWll6qlifbmdeAHuDy9l+vVJRvj
         krCPMPnsMysttGKCMAa1bWl+7/VhuSwWx4Yqp6ev8w2Z4vOriRLGMC7ANOgNoCN1d9DQ
         mhEsJou57CB5APdmTMDbSD03uJvoVr8E6fhhVq++hbinQM41WYTCzcFR8011/oI1FqyV
         Cm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130027; x=1790734827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHAMnnqxx/cbG2yYwp/DFcqdHQsSMkbzmwZSk/C58dk=;
        b=qbKfETj4qomW2BoZD4/yMcJ6JfVpejXpIElOPc0lakyjqPwIkNLmIbpbAQOKF4S4jI
         HHBHZsiEjUcdY4AcUpE3o7St20qV23KCFEoGEwNAmd+lyUKKadFqbT0vKSFvS3u8tn2t
         /5yhjSCovEAKsAzT9JvGFpNNQTcPr6FncX/m0A/YeJQ7H16YugHLDgrd/aaw5JTtk4Rd
         hrgZyJvtgBMJyGFp30F7Ze7l/HpaSQK6bQtsO+dn/SEM+1s3ndFL78G4e0niHlM/BArU
         5hQeHxZrm4RaDxM4VPkB2zjNUk745+/G7zBmk10buq+gGMX5MBpGV6zbsTVKLSThcn6J
         h+1A==
X-Forwarded-Encrypted: i=1; AKwUvBzjHOZ5psTQedDqqHnh00BkxKYQaqVliZb/MqzScn3Q7HTrWUVaYa26Hg4b6ZLQjVhZs6gr9AxEcsY5XTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lqi6R1osek7/q6qbkiwykHRs3bxn8NU/9+YPSGb3r1I1RoUtSW
	rS8n492ZBgWJjO/FGarlhJUuHN3SprXsB/g1sDw6t7ubRB06FDr7DK232bDKhuduLIrVT3pH64Z
	Ml91tyHIeIf8jEcteaTnrtDBU+gH1zQ==
X-Gm-Gg: AYBFou0RYKVG4d233i5oyghZSuOGM+JgZO5HOn4u3yK4UPtC14o+79oibzhEQgkM/PO
	C0C90+HEIjegvTvK9brzBnZt0qV/QgfiKx+ieLPuC9klaezOzHdsGt9/jvugn2sKD2fIPvL3Lu9
	NC1R5BfNI8yw8dWdFxLpX/fJszOMyH2Z8KeWOG6l9aO5xzM0ZXHHpZ/g8rgwh4dP/VWIRWer9cB
	/fc/yEOiFcDOzBqpml1KTVekvrn76bNKMXrzeg9jIVRmbA1e9W+B+SU3EQEy5QLnyUCRXCOCIYX
	TA/S0Fk3DGRN6kJcY+8kQ8uD5em6wbf+gEtB6Mw5Cgo7MzYOIqIZHY0WjDrV2a+LcdwHCn6tlb8
	UnCFV/jqA6YnZ4e6gCHYvZT69HxP5nRBg3xEWBr37ImgWkyuva/eA0k+4EdMbN0kkNizp
X-Received: by 2002:a17:907:6d09:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c2aae1554b1mr81202366b.30.1790130026893; Tue, 22 Sep 2026
 19:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921224130.492681-1-mhun512@gmail.com> <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
In-Reply-To: <e66371e0-5e8b-4e31-b8ad-223ef399b056@linuxfoundation.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Tue, 22 Sep 2026 22:20:14 -0400
X-Gm-Features: AclHuK9JeOGZvLyT-fIJ19lQTdK6P8bGVHIqzJ81pyWe_31NSzPoIRlvRkF1ljg
Message-ID: <CAGEsz8HAeXPmJ0nb0P2Ejd_=d7vspAwaf-ZefXEecez_11bwkQ@mail.gmail.com>
Subject: Re: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ijae Kim <ae878000@gmail.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. On an x86_64 QEMU guest running v7.2 with KASAN and
DEBUG_OBJECTS_TIMERS, the harness binds usbip-vudc.0, sends
USBIP_CMD_SUBMIT while unbinding it, and repeats.

Without this change that hits the free-active timer warning and a
KASAN use-after-free in v_timer(). With timer_shutdown_sync(), the
same harness completed 4000 iterations with no KASAN, ODEBUG, or
WARNING. v2 does not change that timer fix.

thanks,

Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 5:47, S=
huah Khan <skhan@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 9/21/26 16:41, Myeonghun Pak wrote:
> > Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> > vudc_remove due to race condition") made v_stop_timer() delete the
> > transfer timer synchronously before vudc_remove() frees its containing
> > struct vudc.
> >
> > That does not close the race with the receive thread, which is stopped
> > later through usb_del_gadget_udc() and vudc_shutdown().  The thread
> > calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
> > v_kick_timer() deliberately calls mod_timer() when the transfer state i=
s
> > VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
> > therefore enqueue the timer again before the vudc is freed.
> >
> > timer_delete_sync() only drains the current timer instance and cannot
> > prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequen=
t
> > attempts to arm the timer no-ops.  The transfer state no longer needs t=
o
> > be updated, as it is freed along with the timer.
> >
> > On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
> > binding the device, submitting a request and unbinding it produced a
> > "free active timer_list" warning followed by a slab-use-after-free in
> > v_timer().  With this change the same harness completed 4000 iterations
> > cleanly.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
>
> Were you able to reproduce this problem to test and verify that this patc=
h
> fixes it?
>
> >
> > Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remov=
e due to race condition")
> > Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@16=
3.com/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/usb/usbip/vudc_transfer.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc=
_transfer.c
> > index d4ce85c4c6a2..4146b746a320 100644
> > --- a/drivers/usb/usbip/vudc_transfer.c
> > +++ b/drivers/usb/usbip/vudc_transfer.c
> > @@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
> >       spin_unlock_irqrestore(&udc->lock, flags);
> >   }
> >
> > -/* All timer functions are run with udc->lock held */
> > +/* v_start_timer() and v_kick_timer() are called with udc->lock held. =
*/
> >
> >   void v_init_timer(struct vudc *udc)
> >   {
> > @@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> >
> > -     /* Delete the timer synchronously before teardown frees udc. */
> >       dev_dbg(&udc->pdev->dev, "timer stop");
> > -     timer_delete_sync(&t->timer);
> > -     t->state =3D VUDC_TR_STOPPED;
> > +     timer_shutdown_sync(&t->timer);
> >   }
> >
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
>
> thanks,
> -- Shuah
>
