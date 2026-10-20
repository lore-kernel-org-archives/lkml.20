Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500109;
	b=iqdu7XazNBbwEhe6iOEH5vdqMEtJOEluoFSLKWgK5cfSpUdSMKwIq08Jn3uMDIX3qU09
	 /rluPXgeYRTtIPgyEy07D9bDH+3q+dLb1rqRhT00L3eq1Hn7ioClqFUh4odkl2D2NsUBH
	 OD2/SI4tvQaTqjJNDr/2R3r+uoX23b6GG27TDe6Z66+8/ujLH+1Ti7tQar6Zz+e4W3sRE
	 WSypvBfGSy1A3IukuZUHdzN9OygL9us2xKQy/0I5z+jgOlMe9kQuTSQxxIbwmonDR8YPB
	 A/ItlTFs/DyK7qVknqqu3IgQCvi2h8gBDVdECD01C+9296Ve1Wa35ZR5UfQiOjrMsXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p8bm92MLAfprF56KAcVBwuAIjjS+4yuOAO1OmW0MjWA=;
	b=Fi5+alJKxml7x0ceO3iVspBL3o0vfWAyUiDiAPW2Q+kCUqCGOBxoW+XXlVf6tFQMOZ1d
	 eAdJ937fZm4YSF8VSbz8plsViJBkNq6drZBXp79jwB84/Ir+k3h1A94DYPwzyolYr9Khf
	 82Lo76qlq5hFfd4reC4wr8XiNH7SH3/i9nMchqcsDlBkAlaVOjXqhD4+gHWj2/xGBrSwZ
	 Oft/kLdzPYhIPrJ5xq2kgRxSaiXhcn7krWCMncF1/hoRT3F+Mxo+pgjnkkkFeysJzeHCG
	 RT8vw5HOaVCs8HPSgmTelF+ZeWk696tUP0pGYoO01nJCmygqyc3IP2bs273iXKkr+2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zbzo2ESK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4BB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD4BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zbzo2ESK
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3db57938so2731381e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500107; cv=none;
        d=google.com; s=arc-20260327;
        b=JlOlW7CODkuuBLs3ptroHuts7buvbQm2+pqlc/yesWUZ6LAAfmb3eC4YcnH00kdpRi
         Ugoy4aWkAm0Epn8FCwemnhEKFq244jpzZkv/HVFXzvE1WR8By5vekEOR0tD4GDT8ylLm
         omqe6Z6hMrFOSOQ6MMme5zGSf9xYZNQtXyfKHlnukrz7SamsK9OrV8j8dMNVRtNIjFq7
         R5qpomcqGUUgzAAXH9d8iuUjHPp+sBgsW7C4hhTP3kQiUVvGjaWaA2QWEK9ps+g70sWY
         gML0W/PJngt1eOF+9z3bjnStRl3/FxS2sjahjuejB+w8IAiU0O/wElUS8xb3nPFKNshY
         MFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8bm92MLAfprF56KAcVBwuAIjjS+4yuOAO1OmW0MjWA=;
        fh=lbNwiAh7B4cpYjFhNladpQ4ewebo/7rj0xXVxY2XyyE=;
        b=OwDu80hEUnMvhmh2ih2RaUDxyPWwzLjsMg6s8pbfLoa8ng5CorpIrbsaFHPkL6ML99
         yaSjFJmhEFSXwFkY5VvMHvsbuC2JT338Nyn8jvedGXqBvpkemCluUWyl2iXW9IgAEJe5
         IKBfxJh4zQtGfR+mWftC3fWCV/P7vLs20vP5uTy1TxdK89p0LXjWkvcF+lHcBKR5aBGf
         RRFiLnp/Efzg29w9VvzwTdWDzvNfUHc7R6GGCFBdG/kcVkB3nAEVtsaTyiXMCWzJWU2H
         AjN8u0p4OL8VOp9TF4K3jYWsNeRqCW/a3b5VVs9CiKMVXoz1GX+Du2nwjD2skEpB1BFM
         Kezg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500107; x=1793104907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8bm92MLAfprF56KAcVBwuAIjjS+4yuOAO1OmW0MjWA=;
        b=Zbzo2ESKVI13KKBJi4R3Vt+HuHspiVmMhWJcCtF6UjuHx1st9FaC2Pn5iZzFcHEHZ2
         rjROeJUPOULjcKSdLlUADa0u5VT6OvEhVF16ebwfSTU7rAtVJdxaHy+gKtcclYx7ghef
         ngICxKuM0/iAU79w825/tAVen/jh6saJ7OyzSv/n1lJruZYpkk5W2ZrFlyVDKxMQ9XRT
         i8P/nHiCBZi5pWVj0hXo/K0+MBjMVPg0dkVA3JBVCW1hBfzgLPxez/eWlbm9hNRz0+g4
         robn5zAgjGaECSMfD4AU4TpNYqowaD+nG1QthTJljSF9UVsavb2Se1w1wepIQyCxKvkn
         E0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500107; x=1793104907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8bm92MLAfprF56KAcVBwuAIjjS+4yuOAO1OmW0MjWA=;
        b=bnxf8Kmybn17ehz53651f7T3sdQcc9VWWLhs44XPRNWv9DtjTf/p+3tRf57lYRxmA5
         oPUeOKEbEVKWq9di2hStnhdc3QyhZjgsrN2nQXBAFGqhJ0G/IoW6X+u2eDhBl9F3gzRr
         Stu0+bxRHdFYNWYzUMfq64x0HarH6oZ+B1ThRdWkMZTV01zkZ9U5VDsXp8YfLklF7LPT
         D6i9x1lvRde25pQuuizcBiQgjfzeya3PlcIDWwfjqjgjgVk2fy5GR0aQD6g/mxE/t8ZJ
         +sVZouU5RnMZvGWm+eKQ5Iz3AsS4VcTe40ThMs9x1LJMKOrQxngeuhWtaA4pfbgtH4IX
         GTag==
X-Forwarded-Encrypted: i=1; AKwUvBwzr4VQLSrFIGJCDr/STeT/dhol8a714lpRpRbrsDKmRHE/fmeULGH9moyqAG92x67GrLnFYJ6Y93bXtBA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5I945Z6AfhHJKITLj2LHT10692Er8VW7HVWJIejNyUc6BRNtW
	bUMCGkoQHjeqw0Qa0LtlwBHwWiveYOxV70aIF79xqavRjNtm2He6MuT6QW2vE/rocyZOG9tB+tl
	acj2wHoqtPIfsmksWPWfwQyO3kh/CArpMK1yOs0Q=
X-Gm-Gg: AYBFou1K61kAtw1v1LVkc7tLzYpLSrJCt90EFX27wpQpG5VyT+EDBSyvAKVzlPxbOIw
	h4OhzDAVzbtYl2xbaZ0Dx7OQ0IojA3nlEO9yjFXaB/Z8fJauuwbqjP7W7Js6VUffqZvYmrryi48
	8BhsDHA4ui1mMAE+p04ACTG7Nx1UotQpf9Ag0BbOZ+ENfb3+WzowvWxelU2aS2dz8+Ca/jisVIs
	qOPIzHJzKWEiwjyWXVoZ2nolOazqGuyo+bhqYnjzcGsDMnJaX9d9Jn5NdDFd+GX/f/pHHtp2LVo
	BGT5zwO/Uk40luHze5LhlQwA1undVusaZ4T5RbmRyGFaA/ElhoHW548J++9jtIQ9+hI=
X-Received: by 2002:a05:6512:694:b0:5be:41a1:d2c3 with SMTP id
 2adb3069b0e04-5be50a71b65mr2918162e87.49.1792500106374; Tue, 20 Oct 2026
 05:41:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910105359.12915-1-syedtayyabfarooq08@gmail.com>
In-Reply-To: <20260910105359.12915-1-syedtayyabfarooq08@gmail.com>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Tue, 20 Oct 2026 17:41:33 +0500
X-Gm-Features: AclHuK__MO6wHI7OcpVN978QT4p9YiM32kUAU8tkBjxW8Bkn0HEWZTrXWo8Xppo
Message-ID: <CAKD4hN7z8Mf-EXJ9DUhDuxzbbEWShGM1aSQ2=5SQ=8F1wfVprw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

syzbot has tested this against the reported issue, and the test passed
successfully.

Best Regards,
Tayyab

On Thu, Sep 10, 2026 at 3:54=E2=80=AFPM Syed Tayyab Farooq
<syedtayyabfarooq08@gmail.com> wrote:
>
> syzbot reports a slab-use-after-free in tty_init_dev()/gs_close()
> involving struct gs_port. The port is allocated when a gadget serial
> function instance is created via configfs mkdir (gserial_alloc_line())
> and freed via a plain kfree() in gserial_free_port() when the instance
> is removed via configfs rmdir(). Nothing prevented a concurrent
> open("/dev/ttyGS*") from racing with rmdir: the tty core could still
> reach gs_open()/gs_close() and dereference the gs_port after it had
> already been freed, since the ports[] table entry these functions
> looked up was a bare pointer with no refcounting tied to the tty core.
>
> Fix this by giving struct gs_port proper tty_port-managed lifetime:
>
>  - Add gs_install()/gs_cleanup() tty_operations. gs_install() looks up
>    the port once under ports[idx].lock, takes a tty_port_get()
>    reference, and stores the result in tty->driver_data. gs_cleanup()
>    drops that reference when the tty_struct is released. This ties the
>    gs_port's minimum lifetime to the tty_struct using it, so it can no
>    longer be freed out from under an open tty.
>
>  - Give tty_port a destructor (gs_port_destruct()) that does the
>    kfree() that gserial_free_port() used to do directly, and
>    switch gserial_free_port() to tty_port_put() instead of an
>    unconditional kfree(). Also, tty_port_destroy is automatically called
>    when the reference reaches 0. The struct is now only actually freed on=
ce
>    its last reference (held by either the ports[] table or a live tty)
>    is dropped.
>
>  - Stop gs_open() from independently re-deriving the port from
>    ports[port_num].port and reassigning tty->driver_data. gs_install()
>    is now the single place that looks up and pins the port; gs_open()
>    re-deriving it separately could, on an unlucky race with the port
>    index being freed and reallocated, leave tty->port and
>    tty->driver_data pointing at two different gs_port instances, with
>    the one gs_close() uses left unprotected. gs_open() now just uses
>    the already-validated tty->driver_data, while still holding
>    ports[port_num].lock across the first-open kfifo allocation to
>    serialize concurrent first opens against each other (kfifo_alloc()
>    needs GFP_KERNEL, so it can't run under port_lock).
>
>  - In gs_close(), a tty's .close() can legitimately run against a port
>    whose port.count is still 0, e.g. when gs_open() fails and the tty
>    core unwinds via tty_release(). The previous code treated this as
>    an impossible state (WARN_ON(1)), which trips panic_on_warn on
>    syzbot and isn't actually a bug -- it's an expected outcome of a
>    failed open. Treat count =3D=3D 0 the same as any other "not the last
>    closer" case and return quietly instead of warning.
>
> Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dfe63e4d633540f230624
> Fixes: c1dca562be8a ("usb gadget: split out serial core")
> Assisted-by: Gemini:gemini-3.7-flash Gemini:gemini-3.1-pro-preview syzbot
> Assisted-by: Claude:sonnet-5-medium
> Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
> ---
> v2:
>  - Added Assisted-by tag.
>
>  drivers/usb/gadget/function/u_serial.c | 64 +++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index cdd1dfc666c4..9da860589861 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -603,6 +603,41 @@ static int gserial_wakeup_host(struct gserial *gser)
>
>  /* TTY Driver */
>
> +static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
> +{
> +       struct gs_port *port;
> +       struct tty_port *tport;
> +       int ret;
> +
> +       mutex_lock(&ports[tty->index].lock);
> +       port =3D ports[tty->index].port;
> +       if (!port) {
> +               mutex_unlock(&ports[tty->index].lock);
> +               return -ENODEV;
> +       }
> +
> +       tport =3D tty_port_get(&port->port);
> +       mutex_unlock(&ports[tty->index].lock);
> +
> +       if (!tport)
> +               return -ENODEV;
> +
> +       ret =3D tty_port_install(tport, driver, tty);
> +       if (ret) {
> +               tty_port_put(tport);
> +               return ret;
> +       }
> +
> +       tty->driver_data =3D port;
> +
> +       return 0;
> +}
> +
> +static void gs_cleanup(struct tty_struct *tty)
> +{
> +       tty_port_put(tty->port);
> +}
> +
>  /*
>   * gs_open sets up the link between a gs_port and its associated TTY.
>   * That link is broken *only* by TTY close(), and all driver methods
> @@ -615,7 +650,7 @@ static int gs_open(struct tty_struct *tty, struct fil=
e *file)
>         int             status =3D 0;
>
>         mutex_lock(&ports[port_num].lock);
> -       port =3D ports[port_num].port;
> +       port =3D tty->driver_data;
>         if (!port) {
>                 status =3D -ENODEV;
>                 goto out;
> @@ -648,7 +683,6 @@ static int gs_open(struct tty_struct *tty, struct fil=
e *file)
>         if (port->port.count++)
>                 goto exit_unlock_port;
>
> -       tty->driver_data =3D port;
>         port->port.tty =3D tty;
>
>         /* if connected, start the I/O stream */
> @@ -695,14 +729,16 @@ static void gs_close(struct tty_struct *tty, struct=
 file *file)
>         struct gs_port *port =3D tty->driver_data;
>         struct gserial  *gser;
>
> +       if (!port)
> +               return;
> +
>         spin_lock_irq(&port->port_lock);
>
>         if (port->port.count !=3D 1) {
>  raced_with_open:
> -               if (port->port.count =3D=3D 0)
> -                       WARN_ON(1);
> -               else
> +               if (port->port.count > 0)
>                         --port->port.count;
> +
>                 goto exit;
>         }
>
> @@ -911,6 +947,8 @@ static int gs_get_icount(struct tty_struct *tty,
>  static const struct tty_operations gs_tty_ops =3D {
>         .open =3D                 gs_open,
>         .close =3D                gs_close,
> +       .install =3D              gs_install,
> +       .cleanup =3D              gs_cleanup,
>         .write =3D                gs_write,
>         .put_char =3D             gs_put_char,
>         .flush_chars =3D          gs_flush_chars,
> @@ -1203,6 +1241,18 @@ static void gs_console_exit(struct gs_port *port)
>
>  #endif
>
> +static void gs_port_destruct(struct tty_port *tport)
> +{
> +       struct gs_port *port =3D container_of(tport, struct gs_port, port=
);
> +
> +       kfree(port);
> +}
> +
> +static const struct tty_port_operations gs_port_ops =3D {
> +       .destruct =3D gs_port_destruct,
> +};
> +
> +
>  static int
>  gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
>  {
> @@ -1222,6 +1272,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_lin=
e_coding *coding)
>         }
>
>         tty_port_init(&port->port);
> +       port->port.ops =3D &gs_port_ops;
>         spin_lock_init(&port->port_lock);
>         init_waitqueue_head(&port->drain_wait);
>         init_waitqueue_head(&port->close_wait);
> @@ -1258,8 +1309,7 @@ static void gserial_free_port(struct gs_port *port)
>         /* wait for old opens to finish */
>         wait_event(port->close_wait, gs_closed(port));
>         WARN_ON(port->port_usb !=3D NULL);
> -       tty_port_destroy(&port->port);
> -       kfree(port);
> +       tty_port_put(&port->port);
>  }
>
>  void gserial_free_line(unsigned char port_num)
> --
> 2.43.0
>
