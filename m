Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF863E5ED1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037845; cv=pass; b=Kf94bsiazimM1ZTOs0WrNfn7J5dCeL4LikLUBqO7yMSq9ERiSSb/yLYQZ5HqcBNNXUlHJfnef7sF8VRiS9MqBzStUCFfFsm1E9xmlux/Bk317aW6/LmtuvD7ao9fvfFe8nvnHMRjjQ0n48Yi8gBjHQVyrtME50KIt2215H0w2nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037845; c=relaxed/simple;
	bh=G98wm182ByRQjNH5zsXThdRTx0J7xMSr1hsaIvb95Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWYauEfbl4+5+V8BFDv//XB8+Fx1vc0EXwC8kmmRbeLVSQI+Lc6c0KylbOX6OlZaOp+Z70WUNql+MaPMYD9NC+s9Kclxd3STTxCP6LvK35jRhn2+hKezeA8ZIm36DPe0A/abMMHUVsHMZqLUd5kbyQjAtRTdofmvJ9WfAvUQ95A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGXGpp8/; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGXGpp8/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso13379365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789037841; cv=none;
        d=google.com; s=arc-20260327;
        b=COfYms9xtvYHlKRbYI1P2DFNDWMeesR4m6Eyfoq9RGMB47tW3bs4kq/eTe9hDtWWOl
         e5Rj0Gl4y9aEpRJeH/b1IjdWNkhWugKZgW2/3LrlS499KZX/hoEpR+5VqN5mDE3w5Plz
         tzSBai3eVLQUUTjXnzSau7qvKuDsNa1/X1vbEHV0TS+BfePgXNrYjrUV0fzYyjm37FJO
         0ySw2sju4mtWvwv9t7NJUjhODT+jDKKi3W8hfHmnaaZb1ipw43j0I5OjgkWP3sjPHyC+
         9IeEiDKycqteE0ThmR3fVz+iCkaeGbiemHmnSpUpNq00pe958CzL8QbfcuPWc7GTLoEI
         z0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        fh=3KutE/WtIG3plVYSNCF5B3mXXJ0wnGVCIR7hitxZbJo=;
        b=cMWFcubtTZ9zshNGaEfOkMyMSvYMd+sOWbKX9ZONSvz1tZDT93PaGBtLPnfK7xCufl
         GZ5nk6bgRgEerRpJvBw2Z88+sbS549rWedMYARzKFkCn/H2OyDEe+2+xjr1fvVR63m7o
         yoU0DTHnQUMwjXNFc8rnd21LxLU+R1gUCvcdfNx6mV+2W88kJV2ShnFqgdKy9sJ9ouIC
         pqHNjAVfWygTKaV0a9dEKPIRcvNac4sXmt0BM2Sk6YFX14sd1paSoXB9mB14Ie2b+5W7
         kJDvQFh2AqKhHKTEX88dXGpvdhK2M5kbMDcYhDa0M+VJsraKYzCr+SIBFGPKiyGAmjsn
         5pVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037841; x=1789642641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        b=jGXGpp8/UdJzSiM3Vy5EJ8ovzGB/y0KliV6/IA4Wc0w05nrj+Cz16G4kQeJsQc1eXp
         XU9fod3KD2qrUN32ZGR3xblO2EfVHQz6LGwCFdH0Yc0CQEakeHCurfW7U5Np1vdnlLvd
         /Y3N9sQApu9P24YQrYkN2741W4Lu0QVwj/2csEMIbGVAkxdKbX52mNEtX/fMiGXDOZSP
         O3FvGLCgCZJ3wNTyuEy1qBy1ZaNluV9unTcTxxhIKZBM+0we+u+asD3TVMPbApli2sTF
         ZMSTK93KSsTNoWji3CgKDRTjlOurnYf8pQmcJeeZPrupiH+lkwzGTHfdmxtfGGr9LBpi
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037841; x=1789642641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqo1ROF5ElJGcJZJBe8UZKlFcnLYT8iWyrDB0Jbm0Bc=;
        b=Vrwb7rlurW7k3YGaB9FdYUhCXHoalzdiNOfuw1crOTtkqCozFblPKAmP4d6A1/Alxz
         j6xeS3wo43RmeWvhUcdA6NN0PgmiMrSP2yD+PZWnyRwF/ykRvRUfORyQNpsyhOJdvH51
         wPuoFdsuijN0ES3O7z8DQjfLKb2ZScTuAASJTgjslzO1SdUCq4tJgHuTjEg0DM6W6lln
         y5WxXT8h0aqTSozadAdcK3MrG+h3E4gN9n4568JwRPX+XQJlMqzzUuRsSJ70BP6lPQ2s
         kkysd5oeBEGojhkCkDkQlsCKQCD47t2suOgmYmILy6x2cPHzlLuLiyqlr1TF38QLFiXC
         ypsA==
X-Forwarded-Encrypted: i=1; AKwUvBxtbJ1cHQAa+eEEmwA217D3iNXEAL3kylmqoFbJ/yPxPKyHZfu4IJSr9iaErWgKhZAtsbZtr65INT6v6Vk=@vger.kernel.org
X-Gm-Message-State: AFuF++nk0VQB172qsWYqZ9Nri4PN3LUNTT/ODyBJWQspD5B0c4a7x0sS
	fu5II2zLPPZyGNkAtb9qXO1yj9tIgg/i9bQpGk3FIhQkadMdn7Nqa5yhszR6QFHMrpW7PQ6yqJs
	omfY8c26MlTj++SIW9TTXHArUZixQ0h0=
X-Gm-Gg: AYBFou33Wp7KWtKMPZ7YdspnuQnFwDQfyq35oKGA003wIwJd7c+KyCrm34SHjXAdfo5
	mJ3yVF3v9CP0/AKZJ8B8B02HMUry13YTB18ZA1+zEtsI2D535w5zl0y5WZhkFGziYMN1OJVQ/Y+
	ksS0bRjvgFIAhQNJq2ChNjDCB4bsSq+p8IYr8dRVCTqWdhzT69QivkZxXDkSZIC9+Sx7ywSYUTg
	Gao75Yuo/lRtgB0m2ialI++bus3jOi+7DOXIKXycuXAmzCZPducFPSC/x5iRDnTAk2kteBKpCmL
	ci1ZLT2kqmnrKV2wOqlqDICSCVzLkyGxIk7f57swE8ARKJmNDofo/gu9nkDhNRJk4QU=
X-Received: by 2002:a05:600c:4f44:b0:49d:e0c:e55e with SMTP id
 5b1f17b1804b1-49d25914e45mr64006245e9.23.1789037841326; Thu, 10 Sep 2026
 03:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com> <2026091034-slicing-same-692a@gregkh>
In-Reply-To: <2026091034-slicing-same-692a@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Thu, 10 Sep 2026 15:57:10 +0500
X-Gm-Features: AcwNN1UYDtkvMAOTQp5N6tgZWBENzlNjkY4td5DzUUFN3PGSmoQuBP93u4dW6oQ
Message-ID: <CAKD4hN5x9McTTAVKSK90VfcPTZZJmUAXwXyzY9m3RkZYnygJVQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Brownell <dbrownell@users.sourceforge.net>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching that. Yes to both. I have sent a Patch v2 with the
added assisted-by tag.

Best Regards,
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
