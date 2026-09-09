Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C0581225
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969237; cv=none; b=JsjCCBN6NPIhIsoikDNBcNuTs94wFsNENLj20XiSFDwVyU+6nlm/l+vbH+UgYPYi0ao/NENfknnzNucGVTuU6uoawftpG9Dn1V+mwEbvzzr8M/A2Wz2uyCksSMAqJk/XrgK3DlGDl5DrKYxx9xo+W2c12IrJrD7zj1kEd8IUj2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969237; c=relaxed/simple;
	bh=ji9WYJgPEsD0oObrb9vGLlirQa8xSklSxgsAtuPp4EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvyRR+cpngF4HjS35rskhQH7OOpkpWRh4TYpQgP8Qnzb5plYCmEVYkjVFZoJ+0JxOKQ1KxPNNPLQjE2o7P+c+kM+ZHOX009D3NLByNbiVcZYZGWz/BviYUQ1GCBIBE1SHAQXrAotBoHLucACLKxneaJauueuR4jJnq82vTNJco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nm5U8mIV; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nm5U8mIV"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1271636e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788969233; x=1789574033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=nm5U8mIVhCbOyjnUte5y/2lmAvtuRfXKo4E5C3JHR+IBKYa7yHYqvF9nBYirnREB66
         qe1LqDzt//iAPfjJ23Q0DqlGU9ahgS39zNL+i/wZspI992l5EPPJp11oqcLlS/mayhJq
         yKQBmDJc1eW7hcy0rVhEXZyn+z4nJtJ7krrW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969233; x=1789574033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+VNAcoJZM4aq0tQI6V+NRSLAdDW0QhBOB3oGupHtM=;
        b=iGz7NR7HBA5IaX7x8nfFoK481zSt5Dyyj9W2Po189stRDYQnipP/eeiHDGfwk6gn0e
         oAh/LyshchqcOS6WSER2UJBYW9oAlUkqVtyA44U57uIq82VtB44ls8DqT/ALC0GODdNi
         f+4RRwx6Vh1xjSK7EaGxLuYv/zidfqD14uKTd1eL4oLqZh97cKNmVdXaxQwSEd49vCQO
         iHJzb+5BK9PovaYnyBJv9z0TO5oygBlO2lR9tNKjByk0DWbGov0aYmvlZ48cIUY4TJCL
         VuoTWctwK+P7MqF2K0bZlSkiKGWyWhjCVzIWk/jQaG7Ys9sRRVZsxaHY5qQi+2dRjvdy
         ZhmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU7UtqpXQ57uJQuANzSZyZHOahJZyGAt7ObZzW3ZjtyYplXrgjwaKIAmIvrREiNLFYCGSdNms4gNwuwcM=@vger.kernel.org
X-Gm-Message-State: AFuF++nZT+TwcfK1D4/mFaW8obRLyKl0rQRx3MfCdfTfxitrgPJhVfPY
	NIqekPRtM9GoWwP45K4acyvyH3e0mPcM+ZTG7wuGMDMxtuX0M495aad0cTNY9/Y1iaJiSereMHn
	JrT8gfw==
X-Gm-Gg: AYBFou1cjn/8IhIoK4NSJbq1nvRYJpBooShyS5mVg4wJFJIlXz4yOR7kEPQc0UYhV8E
	iA0xtRVM76WzEPgP8APs39WKsgdg4JEqXnO1vWEregZUMrkoFwlFI/YxBVX20XYYhnnp5/DMYv0
	p64fz+LkX6YHsfmDq63QmECd4/aYcuE66Qp9qH5CFY/jUCVrYtl2HlbXXxTgO+seye+aRStfVQu
	VEpG4dY1jFlpzUR+8Fw1OMCpoYdtpalo/+FXGm99IGlcX7H18RHMXCNkItVMo8j2o7Oe+7InvTJ
	E3dTkRvmMMsFxBrA8qAi4RcYj3DZNf47JBOcEF3ywHkc2GHVpxI2JvO6kpI0SbHv9lWHT5xbkB7
	H3/AzTNyk8rObekbSIfxgvmPBtjXRYdkiUZ2mcwxJs+4L5ZXXhckzbBILsOrnzNR+6E/yrJpAS3
	O5XR4ta/cgWVTrvzRimiohRAaaBisKTcOtT3sgL7m0d9MUORIE/vf2RyEtA8xep63ZjJBvqxmlz
	xJyiuk5964u5lt1HuiwARDyDIo2wgdaZvJHaW0=
X-Received: by 2002:a05:6512:2c86:b0:5b4:a97e:a56e with SMTP id 2adb3069b0e04-5b763cdb7c6mr2800650e87.15.1788969233212;
        Wed, 09 Sep 2026 08:53:53 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b89954b649sm222804e87.19.2026.09.09.08.53.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:53:52 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d7eso10901471fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:53:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUMd4NM+2WVOO3j2rR/gUX5o+y34x5Bim99XR+ApeG98iasM5YW+sRfqRQIJjEicDO73Y4jxK36zNxzpo=@vger.kernel.org
X-Received: by 2002:a05:651c:a34a:b0:3a1:4f33:f60e with SMTP id
 38308e7fff4ca-3a49765d1ccmr16262451fa.8.1788969230181; Wed, 09 Sep 2026
 08:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid> <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
In-Reply-To: <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 08:53:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
X-Gm-Features: AcwNN1VMebMlHBDN2oamx6OSXko7kBI4Fg9_efqS3e1qWZ6X4QFSZyV1w6i5DKU
Message-ID: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Douglas,
>
> On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
> ....
> > +
> > +/**
> > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Acked=
 our msg.
> > + * @goog_mbox: The mailbox info.
> > + */
> > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog_m=
box)
> > +{
> > +       unsigned int reqs_completed;
> > +       int i;
> > +
> > +       /*
> > +        * ACK interrupt needs to be cleared before reading CLIENT_OUTS=
TANDING_MSG.
> > +        * Then if a "race" happens and another message gets Acked afte=
r we clear
> > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst tha=
t will
> > +        * happen is we'll get a followup interrupt that will show 0 re=
qs_completed.
> > +        */
> > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_IRQ=
_STATUS_OFFSET);
> > +
> > +       if (goog_mbox->queue_mode) {
> > +               u32 outstanding_msgs;
> > +
> > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_OU=
TSTANDING_MSG);
> > +               spin_lock(&goog_mbox->lock);
> > +
> > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs) =
{
> > +                       reqs_completed =3D goog_mbox->outstanding_msgs =
- outstanding_msgs;
> > +               } else {
> > +                       /*
> > +                        * The hardware's track of outstanding messages=
 should always
> > +                        * be less than or equal to the number of messa=
ges we queued.
> > +                        * If it thinks there are more messages outstan=
ding than we
> > +                        * queued, something is wrong. Assume nothing w=
as completed.
> > +                        */
> > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > +                                            "%pOFP: unexpected outstan=
ding msgs: %u -> %u\n",
> > +                                            goog_mbox->np, goog_mbox->=
outstanding_msgs,
> > +                                            outstanding_msgs);
> > +                       reqs_completed =3D 0;
> > +               }
> > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > +               spin_unlock(&goog_mbox->lock);
> > +
> > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_complet=
ed, outstanding_msgs);
> > +       } else {
> > +               reqs_completed =3D 1;
> > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > +       }
> > +
> > +       for (i =3D 0; i < reqs_completed; i++)
> > +               mbox_chan_txdone(&goog_mbox->chan, 0);
>
> The patchset doesn't say much about the clients but if the platform
> works like this, I have a strong feeling we can do without introducing
> mbox_controller.has_queue.
> Just use the msg_data[] ringbuffer -- we can avoid changing the core
> internals and you will still get ACK for each message.
> What are the clients going to be like?

I don't think we can get rid of `mbox_controller.has_queue`.
Specifically, the queue mode allows the mailbox controller to handle
multiple outstanding transactions simultaneously to reduce latency.
Imagine host (Linux) interrupt latency is 100us and we want to send 3
mailbox messages. Let's say queuing a mailbox message takes 10us.
We'll say that the remote interrupt latency is 50us. Timing would look
something like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000010: Client sends msg #2 and mbox controller initiates the xfer
0.000020: Client sends msg #3 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
0.000150: ACK IRQ arrives; mbox controller sends 3 txdone

...so all 3 messages are sent / ACKed in 150us.

Without letting the mailbox controller queue, we'd end up more like this:

0.000000: Client sends msg #1 and mbox controller initiates the xfer
0.000050: Remote gets IRQ, sees msg #1, ACKs it.
0.000150: ACK IRQ arrives; mbox controller sends txdone
0.000150: mbox core notes txdone and sends msg #2
0.000200: Remote gets IRQ, sees msg #2, ACKs it.
0.000300: ACK IRQ arrives; mbox controller sends txdone
0.000300: mbox core notes txdone and sends msg #3
0.000350: Remote gets IRQ, sees msg #3, ACKs it.
0.000450: ACK IRQ arrives; mbox controller sends txdone

Hopefully that clears up what the "has_queue" is about and why we need it?

-Doug
