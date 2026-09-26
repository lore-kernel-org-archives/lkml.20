Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80A30D3FD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427944; cv=pass; b=RPO8bdPo3EO3YnuRPzd7w2ALsLW8xMSopOcQAkJzwyaZveFIXfqLJJd1NIPVG+PpGYRKBiSC9sZOuJz4AHgWms+i65MVVf/ScwGL2bRaKRJ8Phji2nMYr30ENg/ewxVT7gk6ME9iEOHXuM40/wR8nRn0+bS9RU7LtO9KE5Xrc6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427944; c=relaxed/simple;
	bh=3K1mfZhkgDFKMH7R9y8Ez2dUkmBN2l6z7mjcFIu/Lgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ0E4h66CHkyGNIT3ORHXY1cihDUWG6z5WwkJEqL1bVc/RKVnrjX/NRmE7DXV1EBBZoNBMxHzzHcvRYlNQ6QXboF2Vxm9FjCdd9vO4mIwbpF1PCCiUWhy1oNQR1ySrDYNguWoyIpv27pN48qaMeKQM+Jul0KwGZ2k9SJMji9WAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYFEs2Jw; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYFEs2Jw"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d47b5987so1602402e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790427941; cv=none;
        d=google.com; s=arc-20260327;
        b=jeMShlchVUbVvL9o63+LVfHJGd610m4roh9HQ0kkd0KNDqwfgJvmgzbYWJv9Z+NZjq
         3uCr3iU4V3RHOGKtQysoBqUu4iqy1fAjkd1c5Emw1EGA3zyADPLYX4Ff6SnKw6vtGqPq
         lSBIgqWeRYPCyB2mW4cKp6EuboHkGn/shzSuVb7T8IpgDU89aVbT3fjicHh/wt9S0cWa
         Eku+L7j8764cGf2OkWpxciqbe97yaurC5LzVy6ZQfeSv1DlkONof0fH8II2iq7LrjB0q
         p0D4/co5Im0dIDZ8HBB2HElJO9fIN17MBKe3hraFaf6b2JQuj/o+yXlXTmcuYOPPMw/q
         HX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vi7otOLbSF1iO51/yCWzfPAUbn2qv/rzgZ6612F0vc4=;
        fh=2JypUMFmZxCxQo9EPvUUKecFFQ70j4aQY9bGxRxS+Ss=;
        b=U521Gi/0fhCTXOvNnm9Rji9KTLgSnyyBcTvAMw9eKjpxCkt8AE4W0a3VAFDx2zYVGM
         XyE9P220ejFCT0rWGArFEhXxN3Jdzx+B2DKvsZDerEOLhpdre1vWPXboFElbJjZeqrJu
         Txlc8USGyRWyQ0kfjfpOGiA9olXEch+J3qxEoGCxLvk5ugRcFPVMfpb4YO2betdVGQGy
         dPhcRuj3nE/9o7Xss5Wn0DSZni9u48AnMfAu4lzcfXSSIE1WFh7ROzMOmmzzBWalRTdn
         P5KoXBXWs1DIzpjZoxsWgDiNU024Ou+d0eyVP+ZKAMrvy/AcnGXBS9ArlSMnRDig9jqO
         3JqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790427941; x=1791032741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vi7otOLbSF1iO51/yCWzfPAUbn2qv/rzgZ6612F0vc4=;
        b=VYFEs2JwG20+I9lXrUtN4rxmRThMzX6fOuftqf+R2Bocyu9afPaBx3k116t4FDir7u
         e45riB8ZX8JJ3uyca8AweDGqIg+OspDwANojWmpELtyC536f57DRAAOvgygNeVUwl5Tr
         8KvCfIJTrcw4wAMrg0mpGMIItufsJcmm47IV9nO3D355EDi1G1hAjSg5VWquGzbmq+aN
         ODpGveB6k43fMZUvJ/GeLSaL0lqr+aMXkPVujyPRul9+RlCxFcYgDIA3hCOQh1CUvAQ4
         B4CS1+9Iw+P7pdA7i4riEW59ZQIl+aX3BewuNWxY40LloJqdZTWXIloT8OhL//q75Q6E
         XIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427941; x=1791032741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi7otOLbSF1iO51/yCWzfPAUbn2qv/rzgZ6612F0vc4=;
        b=BJzP7wI4nJUeBXRZpIAnw8IGhkAQ+pYF/woLEBv0PnwXxe9jtEC6ZdtPJKLACHk0Sh
         diO9HMhyX0SUgbeeZ3RJur328EWNLHfl9MZrt3hFfkXdQGgj/qfcRCU60To1AhMs27PR
         e/ffd1l2fHpmwdiomKe0RaEHLOE4DOI+HdJGruReDwQzZzDUOHBSrwLu2tjRXPAsCZCK
         3iBGfBgiFfwAujqwWu/AXvobdFNt4HiATwibXcHrE2o1uhyXxam+/L1eGMoghir9MKIR
         Iv+2/Mk46QDjm70gZFFx9fU+QbNdRS6rZ1b4Mf9TiIzuVnGF3Kem8ul63XjynrEnsA2t
         rxzA==
X-Gm-Message-State: AFuF++mwnXko8g75NzbnGTYg5QRsCEp+dtOS3p1o3AUw4ZJ1bdj0uBhT
	UhPP01k1EAnbvU4ui0Elh2BbvWqrWfPjDgyLLYzdKJm/gT79m7r1MovNTeAJIMPeXOhdAXNdNL7
	MLAWFtCXzjUco8W6+9DxQ3NilikdfOY4=
X-Gm-Gg: AYBFou28orAPh5t5oO17T9AYIyZjGUnaZnxWIFCb1/UHBXa6Eu2dGTghVZmcHXQ1455
	malZfKz3PVmjk/o7PbmL/RLFZz9Q/ajFhHv8vGntWm/VaGGPYuM0eGwVmC9xBGXr/GX2mwmT12X
	qiTf3Vp3Sd1aJ/LcebsWCfHfFjeWuVfQjIK1RkfxqXKq1eYLsBGKk5TdZB8Zu6mNNzIwxeDSVyB
	OGMyB81Hmbyvj6PycpmZ06A3c4PNWRC1yfaM+7FhMiq9Zcm8J5Evx+j7Vy55ugTBWW/VT/IPWlb
	wCEIQ6kBeHmmF6i16cV1M7TzC79s0zZRLarsuBAsWWV1fhP+HTY5m0c4uwkmpPmpq5Ik5PcFBVv
	V2DNnih0yKSYo+D3JYtn5zw==
X-Received: by 2002:a05:651c:150a:b0:3a6:5416:f854 with SMTP id
 38308e7fff4ca-3a65416f9a9mr10624311fa.20.1790427941145; Sat, 26 Sep 2026
 06:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924192224.3175-1-igorpetindev@gmail.com>
In-Reply-To: <20260924192224.3175-1-igorpetindev@gmail.com>
From: IgorpetinDev <igorpetindev@gmail.com>
Date: Sat, 26 Sep 2026 16:05:31 +0300
X-Gm-Features: AclHuK_ngvPeAqdZp_Mc6aSDyUBuGK7UyLzlz4V8m9b7vKesip4inNwP8GCbLcE
Message-ID: <CAG21Q81Fc1-0_ZX04tY9TUv61iQi9uYHj2Ew+vQgZjWczKbZ6Q@mail.gmail.com>
Subject: Re: [PATCH] serial: core: shut down initialized port on removal
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com, 
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
Note: syzbot did not actually provide a reproducer for this crash -
this patch is based on code analysis of the trace, not on hardware
testing. The pcl812 trigger from syzkaller is synthetic.

On a console port, tty_port_shutdown() skips ops->shutdown() because
port->console is true, so the IRQ is never released.
If the device is later unbound/removed, serial_core_remove_one_port()
frees uport->name via kfree(), but the IRQ is never freed.
Result: a stale irqaction pointing at freed memory in action->name,
even without anything else requesting that IRQ line.

sashiko-bot also pointed out a data race on port->console =3D false
outside the mutex - separate issue, but relevant.

If the underlying problem looks real to you, I'd rather withdraw this
patch, put together an actual reproducer (unbind a console port, check
for the stale irqaction), fix the locking properly, and send a v2.

thanks, igor

On Thu, Sep 24, 2026 at 10:22=E2=80=AFPM Igor Putko <igorpetindev@gmail.com=
> wrote:
>
> When a serial port configured as a console is opened and subsequently
> closed, tty_port_shutdown() skips invoking port->ops->shutdown() because
> port->console is true. As a result, tty_port_initialized() remains true
> and the port's interrupt handler stays registered in the irq subsystem.
>
> If the underlying device is later unbound or removed (e.g. via sysfs
> unbind), serial_core_remove_one_port() unregisters the console, frees
> uport->name with kfree(), and clears state->uart_port without ever
> shutting down the port or freeing its IRQ. Consequently, the irqaction
> remains linked in the genirq descriptor with action->name pointing to
> freed memory.
>
> When another device later requests the same IRQ line, __setup_irq()
> encounters the stale action, detects a flags mismatch, and attempts to
> print old->name in pr_err(), triggering a KASAN use-after-free read:
>
>   BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648
>   BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:73=
0
>   Read of size 1 at addr ffff88802643b8a0 by task syz.0.818/8415
>   Call Trace:
>    <TASK>
>    string_nocheck lib/vsprintf.c:648
>    string+0x471/0x4d0 lib/vsprintf.c:730
>    vsnprintf+0x422/0x1300 lib/vsprintf.c:2949
>    vprintk_store+0x3b3/0xbe0 kernel/printk/printk.c:2307
>    vprintk_emit+0x139/0x6b0 kernel/printk/printk.c:2455
>    _printk+0xcf/0x110 kernel/printk/printk.c:2504
>    __setup_irq.cold+0x3be/0x3f1 kernel/irq/manage.c:1821
>    request_threaded_irq+0x261/0x3e0 kernel/irq/manage.c:2184
>    pcl812_attach+0x1b62/0x2300 drivers/comedi/drivers/pcl812.c:1174
>    ...
>
> Fix this by clearing port->console after unregistering the console and
> calling uart_shutdown(NULL, state) under port->mutex if the port remains
> initialized, ensuring the interrupt and hardware resources are freed
> before kfree(uport->name).
>
> Reported-by: syzbot+843bf2f48f4d12e6682e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D843bf2f48f4d12e6682e
> Fixes: 761ed4a94582 ("tty: serial_core: convert uart_close to use tty_por=
t_close")
> Fixes: f7048b15900f ("tty: serial_core: Add name field to uart_port struc=
t")
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
>  drivers/tty/serial/serial_core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial=
_core.c
> index 95774b0f1484..030735da6b8c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -3210,8 +3210,15 @@ static void serial_core_remove_one_port(struct uar=
t_driver *drv,
>         /*
>          * If the port is used as a console, unregister it
>          */
> -       if (uart_console(uport))
> +       if (uart_console(uport)) {
>                 unregister_console(uport->cons);
> +               port->console =3D false;
> +       }
> +
> +       guard(mutex)(&port->mutex);
> +
> +       if (tty_port_initialized(port))
> +               uart_shutdown(NULL, state);
>
>         /*
>          * Free the port IO and memory resources, if any.
> @@ -3227,7 +3234,6 @@ static void serial_core_remove_one_port(struct uart=
_driver *drv,
>         uport->type =3D PORT_UNKNOWN;
>         uport->port_dev =3D NULL;
>
> -       guard(mutex)(&port->mutex);
>         WARN_ON(atomic_dec_return(&state->refcount) < 0);
>         wait_event(state->remove_wait, !atomic_read(&state->refcount));
>         state->uart_port =3D NULL;
> --
> 2.47.3
>
