Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97155C333
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062400; cv=pass; b=e+CCT8uuJutLllZK87lK+3CGLyUBlq1EfDIsITxU44WobKpnUoIvoIAh2pIBfbcgaUsbL15Kx69Qx0cwTxnjY95PXG1HO9BZkTXWNRn96y4z/3Pw7y7QLdI990om00hh2kpwtExFb8LkNscsRPowDU543XAScDgVXgknx7KXQ4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062400; c=relaxed/simple;
	bh=Vrzrlw6NEH45X35QxpA1RjfO7FaaCToWOrz+oHjjRrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrjL34UDA6oNH2Spmxbk512V0ppB6BVYovW54adh3+SP8bx+KQb9ywEeTtFUB9XnUTbbmZI06qj5lkEUaAwe//gRqZHeN/O7TrRUI6ErtYZhnfx36jUTu/poMD4C1CX+Har6gfU/ifitqFxo5WrZRaG+24Vy+GtxGq8I5n3QqVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h06Vlcwe; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h06Vlcwe"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66d20c35ffbso1039499d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789062387; cv=none;
        d=google.com; s=arc-20260327;
        b=lwnUis4K8QDJmEk+sYfPz/UOuZ+yskar9ujyHFi0eb+xNf58nHZgRSoBQI3KR/QV8L
         Iw+Gc5K1Mwc+16WQEKJpPwnt/BbHoPJCbHYSVvB6m1UlsK+9qGwuuj/qC8A+zbhJlUQw
         x5rp+AFEfgXgOAx/G11a30V6oUNcsE1mOk2XYGLnJm2OTNJO6yxyN1GlwhwZiGY/nPx/
         hPfn+7t/3lW+JZQ0KJ3o6Lw3hEbwFqJGezpsEo1YKrFA4s8dB0Uu0ZLYvLs22j/sV3E1
         Je9RKkm34pjG83zf6DNQzT4cz7hdwlvEd3KxIhVXsgFBdeSkZSy9IGVcyoO+p8JfcLJR
         9Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        fh=M6vnYr30atwXoEK3rvAMqJ860bRgMXCz/7YLPUo3Ur4=;
        b=odYF3nJ1zXVFcYwODafWzYqCAaWecN8mmf05RLjGDc+xAgIYm6lFqfiMEUdZn7gwks
         0Mn6jqVZzi3HSwFtWnNYkdQs0XJe6H72mCvO+u4B2mq/yKGNcjTKeKi2mu0oWjoEdgok
         oq/9v92UZHwmnG7f6E3glY8rJZLUx69WSIP/R752kRmeptNzmG+eLx8e255/XdPlkRsW
         89acBxChwD+Fd/sKzPcLs20dBA0CWMFl9IEnU3j6jBOXtEYGCIdOp/DJRLVu4WoGU9/7
         YxVByca+gTwxCV/rc6PTG8qTGQoJSZgsLnyhe0uqxq5U+nlW2VjzjgeVMev7EAqMUl72
         enVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789062387; x=1789667187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        b=h06VlcwemGDL3kiY2x5x+cJVYMWT60Ap76jj8I+zLTnmlvVfKDMPq/j1+DkiNwkmA6
         X5ZBjI+zFNcmvYNWbtppC2DSZa38aSf13fWubtC1WUCXpltkpTvQPHQwD8+qHg5QpWQQ
         wGr5KKtpjo6L8aOjZQ0JHzYzcYr/V0tDo65m9cB6iDRyuRpyQ3Bg0/cqwYTXTTCmVWFt
         HO6SJtnNHuTNTw1CEI9tGwGxnyLI9EjJSYtb5zD4/2jXe/+Rzvd8B54ws+IAD7O0eRoL
         Rbn8UP9Z1/DfhQLuTemqnAgEKIdBROIA7gbmjJD9KO41imFtF6QHkgGS0v/KbPLvR1KC
         yzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062387; x=1789667187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4TZTvFeGPOKvIslE4wHXvMYV9kBCW5S/2L+GB2DcDc=;
        b=tEyAUdH9OzWz7z0rTfW0kU9uoD0ZmiP6Iv7IwXFMC/4c+wRZX0oD7kap7qVT6ILbxZ
         3RUwzLLHxphEsyJPV59R7JU64IEadbnd2agjK27I0pUHv3Z7zwtIjtL9flDBl029wSzf
         ayEGg4Ocst1xpg+S+jPT22FMMqf4yqsnterc52sgrGqLSYDygStQdwE9ZpM39SH1c1po
         aM7R6af/i0Y0u4ZQ7+rk0ZnRVv4lF7s8xevR47TqC8uZXOxLUkZXL87zMAbjmXKALkIu
         jjKl//Th0MLBB6p/YV42evaH9fbbMLqVWgTRaadT+MlPjnqz3y/kHa84zPpvAA74jfzb
         UaMg==
X-Gm-Message-State: AFuF++ljVl6YgpVyi7Zkfj95Jd5FUiFfdNAtqe3bj1xyaqK+r/0Jj6KD
	FFU6DnoduwmxtexeehF0QHsnSYSdoETmkcxpbl8gRM7Z3dC8hm3jw0zsjde+7oqLV4vynEsGoGf
	lYejbqrB++M+pPDDHk0W5yGr4wkSIKJc=
X-Gm-Gg: AYBFou1MT/oE+1v60xFPWhNtPWnS+yReryQUSqP1aYHTjfecVwImYaozrkMpraDguYM
	YkimVL77plEznMYp/wcivcCqtA5m6ciLMYiVAGVeWK5HkNWeWL/SxGvO4D79Vae7lVbpspfcFNC
	2M5j4ZNtefs+EfQl+dy952XN+R9Gwz6z2a4bMjXDQGRvn503Pm3xxJ8UXebKssZuzbRi8b9yMrO
	pueaXxXeh/gXMoU9EmliGgANnCmdJyxHhjDXh2KoLH3DkEPTh8BZ6PZ5RjOJc7+fp1t1D+GtYMk
	8JD8fgmDc7z9ux9NaukLzWoRFx7D2bheFqcHsAtF+AQexhmYa9ApDHTXzA==
X-Received: by 2002:a05:690e:2630:b0:671:1256:56f2 with SMTP id
 956f58d0204a3-6712434a30cmr243759d50.0.1789062386241; Thu, 10 Sep 2026
 10:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910113325.717882-1-itai.handler@gmail.com> <8fcad389-8340-4ccb-8ef4-008d826115fa@sirena.org.uk>
In-Reply-To: <8fcad389-8340-4ccb-8ef4-008d826115fa@sirena.org.uk>
From: Itai Handler <itai.handler@gmail.com>
Date: Thu, 10 Sep 2026 20:46:13 +0300
X-Gm-Features: AcwNN1U3FFO8vc3TdnTHV2rTuiD4fh1DFByrqEjK3AblMQ21SxCX7JRhTKfW558
Message-ID: <CAFpOueQ-veAYVWAPTN6_0c9NXCEN24wzV4i2uVuNykWmBy6vfA@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-zynqmp-gqspi: stop the controller on shutdown
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-spi@vger.kernel.org, michal.simek@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> > +static void zynqmp_qspi_shutdown(struct platform_device *pdev)
> > +{
> > +     struct zynqmp_qspi *xqspi =3D platform_get_drvdata(pdev);
> > +     int ret;
> > +
> > +     /*
> > +      * Only a runtime suspended controller can be left alone: its clo=
cks
> > +      * are gated, so it cannot be mastering the bus, and its register=
s
> > +      * must not be accessed either.  Any other answer means it may be
> > +      * running and has to be stopped.  In particular, on a kernel bui=
lt
> > +      * without runtime PM this returns -EINVAL, and there the clocks
> > +      * enabled in probe() are never gated at all.
> > +      */
> > +     ret =3D pm_runtime_get_if_in_use(&pdev->dev);
> > +     if (!ret)
> > +             return;
> > +
> > +     zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);
>
> What ensures that nothing can start new transactions after this has
> run,

Nothing does, and that is a real hole in v1 - thanks.

Two things narrow it without closing it: device_shutdown() has already
called device_block_probing(), and it walks devices_kset backwards, so
the SPI slaves and the MTD stack above this controller are shut down
before the controller itself. Neither of those stops a late spi_sync()
from anywhere else.

I will fix it in v2 by quiescing through the core first, which is what
this driver's own ->suspend already does:

        ret =3D spi_controller_suspend(xqspi->ctlr);
        if (ret)
                dev_warn(&pdev->dev, "could not stop the queue: %d\n", ret)=
;

        ...
        zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);

spi_controller_suspend() answers both halves: spi_stop_queue() waits for
ctlr->queue to empty and ctlr->busy to clear, and __spi_mark_suspended()
makes every subsequent __spi_sync() return -ESHUTDOWN. It can sleep,
which is fine here - device_shutdown() runs in process context and
already holds device_lock() across the callback.

Unlike ->suspend, shutdown cannot abort on error. If the queue has not
drained after spi_stop_queue()'s ~5 s cap I still want to write
GQSPI_EN, because a controller left mastering the bus into memory the
next kernel is about to reuse is worse than a truncated transfer. So the
return value gets logged rather than propagated.

I did consider making ->shutdown just call the remove path, as
spi-fsl-dspi and spi-bcm2835 do, and it would quiesce correctly here
too since zynqmp_qspi_remove() calls spi_unregister_controller() first.
But it then disables runtime PM, drops both clocks and tears down the
controller and its children, which is a lot more teardown than the
shutdown path needs and none of it stops the hardware any harder.
spi_controller_suspend() is the part that actually answers your
question, so I would rather call just that.

> and if there's any operations in flight will the controller be OK with
> just being stopped like this?

With the quiesce above there should be no message in flight by the time
of the write. For the case where one still is (the -EBUSY path):

- Writing GQSPI_EN_OFST is the driver's existing stop primitive.
  zynqmp_qspi_remove() and zynqmp_qspi_suspend() both do exactly this
  write, so this is not a new way of stopping the hardware, just a new
  caller.

- No controller state has to survive. Whatever runs next reinitialises
  it from scratch: zynqmp_qspi_init_hw() clears the ISR and the DMA
  status, writes GQSPI_EN 0, resets the TX, RX and generic FIFOs, and
  writes GQSPI_QSPIDMA_DST_CTRL_RESET_VAL. A power cycle obviously does
  the same. So a controller stopped mid-operation is recovered by the
  next probe.

- The flash is the part that outlives the write, and stopping the
  controller does not make its state worse. A read is aborted when CS is
  dropped and the chip goes back to idle. A program or erase carries on
  inside the chip whatever the controller does, and the next kernel sees
  WIP and waits for it. Waiting for those belongs above this driver - I
  have a separate patch making spi_nor_shutdown() take the flash lock so
  the upper layer does not walk away from its own operation - and it is
  not something a controller ->shutdown can fix.

The failure this is aimed at is the opposite case, where the controller
is left running with nobody driving it: after a kexec without this patch
GQSPI_EN still reads 1 and QSPIDMA_DST_ADDR still points into the
previous kernel's memory, so the engine keeps writing there while the
new kernel is relocated and started.

I will send v2 with the spi_controller_suspend() call shortly.
