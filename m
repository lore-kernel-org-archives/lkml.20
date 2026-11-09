Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794199758;
	b=yA21MjHqn2hav+SaA34k0lytRHsH3d/K7W9HqTE0kpXxcbg+M2Tcf5fyn+xg6xw2q5NL
	 02IBLC1pg1nHtB5Bgz1WxFRxpcucoIPiOTB2VGsuhHYvtLWyxicWERCDpnon/HAJ9X6Pd
	 5RR1RQLbFkR68Mn689EKEPSYNSfVsd7rz56yJHg2TTlVXpcsMrO5ybXCAzSxvc+MhkLHF
	 fhqSvJh6iYhYlY1syZAv4TYJ4Lnoj0FIo3zkJ8mT/shtis44DpUdT+JtkbQgMKUzGRhxk
	 EE6D/p5i1GiNwTHoCGm/90Z7mFxbDmpxJMIzYaFXzJCbHeEWH8oGqCWTEyrA/mijf6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6qh+M+jpnQ8dORj/K5TuZQk/eepHuhg+WvLWRiWifFg=;
	b=JBam5maTu8p64b41qV/PkRhaDUDNHZc0dgRjI+byQY+v4Ejh6h2JCdrdHJ61j7Z1IBK/
	 z9G95/poHD/BlJR5PvSta/a6jRkff7DzWNrzp1a41xVXLygJEUxFUPfSnVbHL87Dm7urn
	 JuHY7d5dxOPpLC5r8uFwTS0iGtruAW1FdcQuK2vbKdRuJkyTNneIXH84pYc5XelnM8gKY
	 P9rAo23sB7hSozlWUr2V/Gpag5Qn6RrSfz/0GhyrJ5UJ89bQ/v7F6jHFoFnQZoF+3Xo3L
	 HjfKk1KlkQklBjQ9K03fLEabbkRhmRdu2USXHbwzw356+ToN2n+emtASgft212qeHUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIFEAlZP;
	arc=fail smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F03606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WIFEAlZP
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533861a59b8so5780531cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199757; cv=none;
        d=google.com; s=arc-20260327;
        b=L81hjmp+vnq/V42Ft62c14GmbXLMXdwf602pdCQagacsgkls1G93L+sAFxljL0EiM2
         +uqpSdJuABmf90mxhF+4uFUirUBPWb6xtLc0DIXeMK4wmEJMadXXgApDa7uPRZVlO7P6
         r3dvd4ODQHHDWPKNXnD2C50xZKUXMhigXsqocIY9gYdWTT+vw06M0izQbZ0b3+cKJ66r
         CUy1X1uw6NI4hyo8eM1yokx7/X5/GxSdPqOhEMRLP6BRdYPQYbPCHx/E8md4eyjjYsQ+
         4AWZ0V3YIrkO1jKokLkVx3cXP/pUc/hpRs9SCmPtylk7yUWTrYeT4yDtspkAUwfFcIDo
         myWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qh+M+jpnQ8dORj/K5TuZQk/eepHuhg+WvLWRiWifFg=;
        fh=nHKveE0Mrpjp+7HX06NHyXcV/ekRF9jbPhX/GaZOGxI=;
        b=HzSaA2s6CV7sdN0QJnPSQFm3Dx1MM8hMDmeN2fyQEJLm2EW6xUYGT4qMvnAoFjz5yg
         DUuoPX6i6EWxsXuo4S0h8RMzhmJgLd7YWfigNi64KrpZN7DlzxZ6G+SQGkhC+K6ZZOeo
         JgiTjJQmmI8nDliLbg+BPQIMBKWu0pFcpYyiQ0ez09tFhF59wk99NUgUi49ScTQzZ74N
         ey+a0p9e7TlsCiY1sNc6pBvGUvNjWcN1yJldLUXJNT35QZwPMS8FD/96hcRXV/dClHwz
         c/15uVQyP89U1idzsnGg19Bs+QYqFJ0ijZ+9tZf5zROdooDzJmqG0huT/70h1yop4Dmc
         fgVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199757; x=1794804557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qh+M+jpnQ8dORj/K5TuZQk/eepHuhg+WvLWRiWifFg=;
        b=WIFEAlZPT/yB5Oz5a2tIOkfYfS6W5IeyYoDv/9rrBzcnsfeHM1v522q0gatejSDQ3J
         3ihvBCncpCxtNWrwjOWgx7cWE/3Pf0Yg9TPN38UVzTlhHeAO/WGn8lxG7Z2v74iOt3da
         jYs828J42md7Osr6k+KZ9Tqt2W+93vdsPS8MSBaLrqrlpaXVmMd6M1PyJ3Y4IIiC0e+G
         sj82Mp9XQIJEYV8iaii5vBNwu3wb4XmNrxP77qgfjEa+KEqyI4cz2AIAzMg/MLPIljqJ
         SwfnU1sIpZKlvyXqbAmFik18qlLRYQNP2yv7v+lhSD8cSQc0qSrlnztcHfNUj9RHaiK8
         E6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199757; x=1794804557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qh+M+jpnQ8dORj/K5TuZQk/eepHuhg+WvLWRiWifFg=;
        b=cAWNY+Zts07cNCA+vvNmDFleC2eAJEkeWF7LXrlqy3SZvU8xbyKVTWx0FxK/547QSh
         cKJRC9NaXY2m3kXSOBhuZO0m5VL40k2DgV0Ti5vzt4Np0r/58y9e5wz8OrVL2n7tcurl
         +rieuzzOZXOSoLmzzRrbUEPxapKq3FBc0WQ6N7+5Vnh4xxJa9OML3l+N7dOIOQca1Qox
         fO1mwGC4Rrd0mRxlB+790Re26nFpROx8GzQBMI4VwiiIWxzCaC48ZPo8s3KPaNn2Pz13
         yq+14cKb5K8j7JQQKvtGueuiWTmBD3OJlCc18rkv4kUr4zqtyUkYl1hfaokcechklrqP
         HufQ==
X-Forwarded-Encrypted: i=1; AL+hErFYofZQdE3oBTb1E/HPWihGrgNNg83A7FROuVyS7xSbV8e31L1A7aPOhp6FotAQ4zk25rpNqEcaNGgcl6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o7W1g4OLb2ue169askF8DbzRQjs6PYED8JxsIQDeqcLIMUHMW
	NxEWYxMMkCAIv71AAeDgFmiGpIHzUerEWLuay5KmmMzu8jZSv92Rsl1Pnnl8JzvQkPWx3REMTUE
	x8Db1Eh6E5JQqBCb/KK90MI/f83abRF7zo2+0p7I=
X-Gm-Gg: AYBFou2NKWxuf2hm50uwNoAZNgn++weyWufvmkTRPx6J8EwEgqfdNjZ+ShXwBvH+964
	Ja3OFkZ3VHaJKFsZWL+y9yRB5Lny/yIqhm4rt63RWUZKmQM/Ol4qXWRCQISn4uwoFWH9WNYr9US
	CHujQ8lQ2kEuzj/KPr70CCQfbZc7xJtHui5sLXQ5o6Yb6IlC4PbBKuDFHsPyuFu39wrc39xnslt
	GecqpXICB4JjW1DUksEiLhU9zgpD7B3hyt96xIgWk92K3aWttR1jGP+mgY6DSw2orgaBBmBd6Ud
	7bItb7f2/FN/kiglbWWerfpYXej6OeR4i8aN+fUYhf3UoW2QOYPeY5Er1J3kxwzUDPFpG42UZ/F
	feaA1PVAl0NVINQrBllkE2q7AmgruTeFyniilC6BrNZ22TV8bDI/ODWRyyjnqwIFuzsoE
X-Received: by 2002:ac8:59c9:0:b0:536:5e62:4647 with SMTP id
 d75a77b69052e-552a52a25a0mr46615241cf.16.1794199756941; Sun, 08 Nov 2026
 20:49:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107153319.3765325-1-hj351016@gmail.com> <179419829985.488853.2152109703584398675@kernel.org>
In-Reply-To: <179419829985.488853.2152109703584398675@kernel.org>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 13:49:03 +0900
X-Gm-Features: AclHuK-ZD80kt-WbLxM6rTpYAny7wg66JVAuYp8w4OhVnAdIniUpTeJKn11a9DI
Message-ID: <CAGr5VtPvsfPW+1_eQmQJ0G9f-=1XskuA+vHdUHSeZpY55prnQw@mail.gmail.com>
Subject: Re: [PATCH] can: peak_usb: pcan_usb: cancel restart timer on stop to
 avoid use-after-free
To: netdev-bot+sashiko@kernel.org
Cc: mkl@pengutronix.de, linux-can@vger.kernel.org, mailhol.vincent@wanadoo.fr, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- this is correct. v1's dev_stop + timer_delete_sync does not
cover the re-arm: restart_timer is armed from the restart-command URB
completion (pcan_usb_restart_pending),
which is not anchored and can run after the delete, and neither
disconnect nor the adap_dev_free probe-error path calls dev_stop at
all.

v2 drops the dev_stop approach and adds a pcan_usb .dev_free that
timer_shutdown_sync()s restart_timer. dev_free() runs after
unregister_candev() and before free_candev(),
and shutdown (unlike delete) also prevents a late URB completion from
re-arming the timer. Respinning as a new thread.

pw-bot: cr

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:25, <=
netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix leaves the use-after-free reachable, because
>   restart_timer can be armed again after pcan_usb_stop() has deleted it.
>
> --
>
> can: peak_usb: pcan_usb: cancel restart timer on stop to avoid use-after-=
free
>
> This adds a dev_stop callback to the PCAN-USB adapter. The callback calls
> timer_delete_sync() on pdev->restart_timer, so the timer is drained in
> peak_usb_ndo_stop(). The aim is to stop pcan_usb_restart() from running
> on a freed struct pcan_usb after free_candev().
>
> > diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/=
usb/peak_usb/pcan_usb.c
> > index 8fd058c328564..4c131958b5aa6 100644
> > --- a/drivers/net/can/usb/peak_usb/pcan_usb.c
> > +++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
> > @@ -882,6 +882,14 @@ static int pcan_usb_start(struct peak_usb_device *=
dev)
> >       return pcan_usb_set_ext_vcc(dev, 0);
> >  }
> >
> > +static int pcan_usb_stop(struct peak_usb_device *dev)
> > +{
> > +     struct pcan_usb *pdev =3D container_of(dev, struct pcan_usb, dev)=
;
> > +
> > +     timer_delete_sync(&pdev->restart_timer);
>
> [Severity: High]
> Can restart_timer be armed again after this delete?
>
> The timer is armed by the restart URB completion, not by the timer
> callback. The completion calls mod_timer() every time and never checks
> urb->status:
>
> drivers/net/can/usb/peak_usb/pcan_usb.c:pcan_usb_restart_pending() {
>         ...
>         mod_timer(&pdev->restart_timer,
>                         jiffies + msecs_to_jiffies(PCAN_USB_STARTUP_TIMEO=
UT));
>         ...
> }
>
> pcan_usb_restart_async() submits that URB without anchoring it to
> dev->rx_submitted or dev->tx_submitted:
>
>         usb_fill_bulk_urb(urb, dev->udev,
>                         usb_sndbulkpipe(dev->udev, PCAN_USB_EP_CMDOUT),
>                         buf, PCAN_USB_CMD_LEN,
>                         pcan_usb_restart_pending, pdev);
>
>         return usb_submit_urb(urb, GFP_ATOMIC);
>
> So peak_usb_unlink_all_urbs() never kills it.
>
> Suppose a bus-off auto-restart, or a manual restart through netlink, has
> this URB in flight when the interface is brought down. The path is
> peak_usb_set_mode(CAN_MODE_START) -> peak_usb_restart() ->
> pcan_usb_restart_async(). peak_usb_ndo_stop() then runs as follows:
>
>   close_candev()
>     cancels only the restart work
>   peak_usb_unlink_all_urbs()
>     kills only rx_submitted and tx_submitted
>   dev->adapter->dev_stop()
>     timer is not pending yet, so nothing is deleted
>   dev->adapter->dev_set_bus(dev, 0)
>     synchronous usb_bulk_msg() on PCAN_USB_EP_CMDOUT
>
> Bulk URBs on one endpoint complete in order. Would the queued restart URB
> then complete and call mod_timer() after pcan_usb_stop() has returned?
>
> Next, suppose the device is unplugged, unbound, or the module is removed
> within PCAN_USB_STARTUP_TIMEOUT. peak_usb_disconnect() calls
> unregister_candev() on an interface that is already down, so ndo_stop
> and dev_stop do not run again. pcan_usb sets no .dev_free, so nothing
> stops the timer before free_candev():
>
> drivers/net/can/usb/peak_usb/pcan_usb_core.c:peak_usb_disconnect() {
>         ...
>                 unregister_candev(netdev);
>
>                 kfree(dev->cmd_buf);
>                 dev->next_siblings =3D NULL;
>                 if (dev->adapter->dev_free)
>                         dev->adapter->dev_free(dev);
>
>                 free_candev(netdev);
>         ...
> }
>
> pcan_usb_restart() -> peak_usb_restart_complete() would then write
> dev->can.state and call netif_wake_queue() on freed memory.
>
> No disconnect is needed for a related problem. Wouldn't the late timer
> still move a stopped interface from CAN_STATE_STOPPED to
> CAN_STATE_ERROR_ACTIVE and wake its queue after ndo_stop?
>
> The commit message says:
>
>   pcan_usb_restart() does not re-arm the timer, so a single
>   timer_delete_sync() drains it.
>
> That holds for the callback. Does it cover the case here, though, where
> the timer is armed by the asynchronous URB completion?
>
> Would a pcan_usb .dev_free callback that calls timer_shutdown_sync()
> work instead? peak_usb_disconnect() calls it after unregister_candev()
> and before free_candev(). By then, usb_unbind_interface() has already
> flushed the endpoint URBs with usb_disable_interface(), because the
> driver has no soft_unbind.
>
> Another option is to anchor the restart URB and kill it before dev_stop
> deletes the timer.
>
> The probe error paths in peak_usb_create_dev() also reach free_candev()
> with no restart_timer teardown for pcan_usb. These are the adap_dev_free
> and lbl_unregister_candev labels. Would the dev_free approach cover those
> paths too?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261107153319.3765325-1-hj351016%40gmail.com
