Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792493384;
	b=teGxlUdLYpozkGgN2Yf1vWPZCnDv9q9E8GdDYS9NdquzrY3TElNiVWUX9mZwAepCYhaQ
	 k8jmS5PAFahgy3a4YRjYCgJujyEO0j4+9z+oU/d/K8fTf6MJF7sH1THLZTQe6k9q9mHAI
	 4g2RXbxxorv3IvLLj1vrTMocfNkb6y7nIY5ffdjzncBj7ZLcYQ9w5LDpxdeBhozVDb4PI
	 s0QYobD0wupfEJT+BD0ZSismibTsjnVQDRemBSuCEtcaJ9yEHqtw8yu6rgjWyQOr+cgLE
	 mK74nYLe2x7ngoQO9vnPtKxuKliYBLE1Jv2rernbw1sUqiZ9oRiQlEqGjy0Nx9JErpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
	b=MOhLERmswSgQVeURk2UTxbDY6uZPd73prakR1k/pSdfia3FCP8ZD9nk8llLRaIXAcNns
	 o0YvOovO43PJKsJphU4DA+QtvsqRhFYBRTL5bAY5viqZX3Ms0hbdVWEzN5QcrhMMm5thn
	 6OIdxoO34BiTTEB7PrH6eQMA7gjyd2gj7bq/sX5PSWFQrcsfB6QOBozry/AwulGLwV1Bt
	 A/qzaI3XK+9qTz4C6HY+olaN7fs7g3gEp+zaow2tnaekMD72iCwvvBitdwXQlLq9EdgTu
	 jBFRGJJEkdV6MrgkFTVmXJtGQA1qEVWAJBkGa4GbIzGPfwCtqJSmp2jh06dw561rrqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPpX3wnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80744606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80744606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TPpX3wnG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so4829255e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493383; cv=none;
        d=google.com; s=arc-20260327;
        b=aGsz+NP6Z3HMa2zz0PK4sIlW73a6YNSzguo9JNCKtBoVIBA3jbEi7AECtZkcp/NzbD
         u/tvFLz+N4/q7p/blJcJrqPvUWb/yYMK9yptc++KjeqYmvkWzrOD55lA3IwIA3XI/ybK
         IR0hdbqYTjblv4cME06ODgosavqX8kSonb7zq0LjwdUAL+m1tIPWLysBJh6S4FXccTWl
         EuqleR8XCgdaiTUISJAxkzisgDWOQZk1VCfQVthApPEJz1jPhLimvnMr1LLD9+ydmpE6
         6kD6bk9fphXg0g7wk/pdkwwF8a+yXTBux1K8XWBjKZJOWnfxlqlu/wPSuybbhmtwgENm
         0ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        fh=DorDbeL5aVZHeqoHSgSVbp0bQH5M+X5ETAzTsM6mT+E=;
        b=B4sZGseWbka1xoPmK2Ps5Qg/qifBm6QX1MinvvZeXCOx407POe9+1RmMBIG0ybawQF
         PakS8NEhzHZCafyvUvDgQ0z690JbawJnajSB0SaeavvvgskBw7sEnf0NWAyvf2fTbPp9
         02wwpiLwsg9kHO4BeQbhcVDLKxRit9SCjmlNdpYC+qIULW1fUrcAiwGvvw+ejuVLzrq/
         S9dFILtOE/dSEwkr+8Q++OFSuzs+VviINcrMfaAcvQdGgghrC1BGcaXeKEx5qa++yUsT
         WlLUj6B5ZFmmmfPN21OZVkr/DiBz1BiXtbfA4BrEFEcd9Ia7ZHBlZyAtJ1joZxcfrnDv
         ObSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493383; x=1793098183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        b=TPpX3wnGOQahTvPAnK4i+JyMtHVrDR7xB/ESQEn0GoaTeyr2uJOBhZTChKBSNtqOER
         axyxhisG3PqQBrVJfLr7QITFq4C9TqSb0pW0KeX8gAaroLBxl2rUQyy82Xi7RY+lgagN
         s/Qt1CaXs5KtqdKfsiTWmgPaVHUwAZ5TIVDUMm70Oj68PXNJj4FKbWKK97povLrVTD/e
         5oSPp/z6eOuu8ZUWen1h2kTW4Iw56CiMm6gdZXT9vR/N9zF9xmQu9nO2dlpHXCaChdcq
         rOC13SLEBU855JgZJIcQyNkWuHeOW1bNQSh+wuSALXsvbCWZEqe0Em6nyqbzv9jE6qUm
         Lj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493383; x=1793098183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ERjj3b6jlFN0zemFoMz78y4i9w1Q1w2xDGBIcTZIVk=;
        b=XrknJk11XPG0Mo6oyNu6CJrHMppsWYdTg2YJqsdoHgy7ppR4gLJi9ZKilLafUzYbX/
         8JvMn7l3k2oMlULKDcDBthMUVx4VMVwti4CLLLzQsPTVV03kNOpXL4A+kh232QVathXn
         S4vwd29T5RuodcQxVPL2+Dewf2NkHlqa7SnHhls1zwnV4r8RHM70thissdb4yfBsfyBi
         xJNNOQyAbaZNflkaAn5tljY44NJeRAlMEjRl/YWINSG6ekVwn5wKI9TUK/xegxYYUTFl
         Eka/n00t7qUmHN5RnaX3BRdt0b1sVlz6r6/QxrLCoKtR6BXb0lxUmQXfLCMLiOCneYBx
         krOA==
X-Forwarded-Encrypted: i=1; AKwUvBwzUCosMHXq27qgvr4ciZdjbENt7XQ61KduNSaXrKzM/N4WPIQFhSjFv+/1AQpz5pZQ9Kocx7pv/vML+Mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEJsF505a6WEQKN6XMyyZnrDV5qnRWLc/UO7pBxVcLGcpbTX+a
	apPH5NhSmQ5/FteLIxrZNsy52gQE8Rz575NgiSfgoyht3WfWT4uyl1YXdqggBDy/rztxXreiWDR
	hxk+YJRb3toET8svB3YPrI3OvAGnPmxtJA2aW5uc=
X-Gm-Gg: AYBFou2tDvYU9iOHHnOIo9zOLTgFyxgFkP8Krd9WyHgbqDf59QH69BWgPQ0EdqR+6wK
	J0ACvwOrSlvOt5VAR6JCWCBWcJVuNwpgXebBhAPYGniW6XqaO226RNvZryHU5o8kC5703XSh+rv
	5htlwTozyeNddCB8zLYW0lrXILwVf/jP5Tym1r+z4Zq5jP0a5PNnYNjGUGyamIMZNf09UroQeWb
	JiuQ0wwaChwgCNnuSmQ9oxLjqt7trcooJ1XHg/PbBZcsaHW+W4w9C8EwCZ3mu3Q33d7cxOdpi5r
	ra+R72RD2K0w6kvhfRJelxvPQ87rfCjZWiA9207mQ5B7geNNZuEnWZ+lIvsEU7qt2/pe+x0xdNa
	BCw==
X-Received: by 2002:a05:600c:4e8a:b0:4a1:cedc:ab51 with SMTP id
 5b1f17b1804b1-4a1d76315d7mr240612575e9.35.1792493382711; Tue, 20 Oct 2026
 03:49:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com> <2026091034-slicing-same-692a@gregkh>
In-Reply-To: <2026091034-slicing-same-692a@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Tue, 20 Oct 2026 15:49:29 +0500
X-Gm-Features: AclHuK-mv7z6N1nztlZcm0gQ1fK6qCovt-jNOk4zF2MaRkNEXkkLjayfgXV9GsU
Message-ID: <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Brownell <dbrownell@users.sourceforge.net>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to follow up on this patch, if anyone has had a chance to review i=
t.

Thanks,
Tayyab

On Thu, Sep 10, 2026 at 1:38=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 10, 2026 at 01:17:19PM +0500, Syed Tayyab Farooq wrote:
> > syzbot reports a slab-use-after-free in tty_init_dev()/gs_close()
> > involving struct gs_port. The port is allocated when a gadget serial
> > function instance is created via configfs mkdir (gserial_alloc_line())
> > and freed via a plain kfree() in gserial_free_port() when the instance
> > is removed via configfs rmdir(). Nothing prevented a concurrent
> > open("/dev/ttyGS*") from racing with rmdir: the tty core could still
> > reach gs_open()/gs_close() and dereference the gs_port after it had
> > already been freed, since the ports[] table entry these functions
> > looked up was a bare pointer with no refcounting tied to the tty core.
> >
> > Fix this by giving struct gs_port proper tty_port-managed lifetime:
> >
> >  - Add gs_install()/gs_cleanup() tty_operations. gs_install() looks up
> >    the port once under ports[idx].lock, takes a tty_port_get()
> >    reference, and stores the result in tty->driver_data. gs_cleanup()
> >    drops that reference when the tty_struct is released. This ties the
> >    gs_port's minimum lifetime to the tty_struct using it, so it can no
> >    longer be freed out from under an open tty.
> >
> >  - Give tty_port a destructor (gs_port_destruct()) that does the
> >    kfree() that gserial_free_port() used to do directly, and
> >    switch gserial_free_port() to tty_port_put() instead of an
> >    unconditional kfree(). Also, tty_port_destroy is automatically calle=
d
> >    when the reference reaches 0. The struct is now only actually freed =
once
> >    its last reference (held by either the ports[] table or a live tty)
> >    is dropped.
> >
> >  - Stop gs_open() from independently re-deriving the port from
> >    ports[port_num].port and reassigning tty->driver_data. gs_install()
> >    is now the single place that looks up and pins the port; gs_open()
> >    re-deriving it separately could, on an unlucky race with the port
> >    index being freed and reallocated, leave tty->port and
> >    tty->driver_data pointing at two different gs_port instances, with
> >    the one gs_close() uses left unprotected. gs_open() now just uses
> >    the already-validated tty->driver_data, while still holding
> >    ports[port_num].lock across the first-open kfifo allocation to
> >    serialize concurrent first opens against each other (kfifo_alloc()
> >    needs GFP_KERNEL, so it can't run under port_lock).
> >
> >  - In gs_close(), a tty's .close() can legitimately run against a port
> >    whose port.count is still 0, e.g. when gs_open() fails and the tty
> >    core unwinds via tty_release(). The previous code treated this as
> >    an impossible state (WARN_ON(1)), which trips panic_on_warn on
> >    syzbot and isn't actually a bug -- it's an expected outcome of a
> >    failed open. Treat count =3D=3D 0 the same as any other "not the las=
t
> >    closer" case and return quietly instead of warning.
> >
> > Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dfe63e4d633540f230624
> > Fixes: c1dca562be8a ("usb gadget: split out serial core")
> > Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
> > ---
> >  drivers/usb/gadget/function/u_serial.c | 64 +++++++++++++++++++++++---
> >  1 file changed, 57 insertions(+), 7 deletions(-)
>
> Did you forget an Assisted-by: tag?  And did syzbot test this?
>
> thanks,
>
> greg k-h
