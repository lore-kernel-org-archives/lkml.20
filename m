Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD381559CA7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971669; cv=pass; b=VjnutLhH2TfG+nurOHDpbzNtmoFpumGfA3gggs/hXo8n/k0v7/IiQeNaWSjdJRT2P9WpFz0C4dtvAYknccHybB7DvoOWIHRF+UK8HfZ166jASFCjtbPBH50NJSc0GKCMi8vwdkXnV04aMTxvuZPficECZCreIWAU2THT/PIZQ4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971669; c=relaxed/simple;
	bh=3vInAeTbwaD+UWn7imDpgnRsQEzj9TNCNzSkTEAsOl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIgx+YXCWqkAFy1ZFROxLTAsL8vmutAAk991/F60MCYpQ0fWDa8oD/mArUidbv7OgcYk1pfAliMtbLzZnZlPecX9VfKP5l/Zpm4bf+42uN+UFDQpyy4KavjMGjwco7ymWiQpnzClLoqn5f9QNSduD1AmPPeyjDIIhK0NPLvO0Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWC2BtFG; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWC2BtFG"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f02so646030fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788971667; cv=none;
        d=google.com; s=arc-20260327;
        b=eGJ0KYCJGRjYeRXZJ8/5llg9ox9EQxr9s392CFYOMJyFMpMtgEMT2gVjQIa0cbK1nY
         oVJP9RVcQeRNZ1LkhfTd4J9ht3rQTm2J5RQEDuLvLs601n+24h/OjjqPB5AtLG0q9wqX
         knnc/+ZPhnwB5xN3Neq6OM6Qlp49J3WzBD4MH27CKo9oZ+h+lmBYdKXf5osy226dCt64
         Hsptdbt/gBma1ZV1UD1nhYw23oEyf6YntgXWjfRR8NHM2opT6o4zG/ZnzrXpJKdIQZxv
         O6Z0dGDcNE6sMUpA3eadhwFQW4mCxRftzj8RRTXjL+O8S+5752mv09zhVUlXQo5IxZlO
         /sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        fh=z4jxNZkgwyaUpTwO6ZMpddzbnXeo4nTUxUtdjkBe+W0=;
        b=AwXHysUaMcmxzd6DEEBeT7lEuAqwTpvu14RnBhS8voBYDy/kKqtOJxPWMI0dEkMF4f
         CpBoqF6eiR3ZRCWWzhbIBK1wVlt2HJhXwS0dQjsaUXmKqXTljg6M6COmUDSneRUgd7ED
         koQXw21/AFU0Ln8TqpUxMBrdd7ul6ecAr6Vc/F1JB94hxNxrIJFrLhcO0OePU3cLl/yc
         tsog5I3XQgCgt2Bt3OYCqu3iXjEslQHBxD3cKL4iANYDFX66gHC9GLtNUGF8pqwU23/8
         deDScTVthHYOPT+HUlIR6+L8szDbQcgVPz8yaKEBLxTZjUtBXrZRLlbxXokC3rTe9s/a
         vAQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971667; x=1789576467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=lWC2BtFGIu/Ig4lV7uDLB3jc6h8kJBiGHiIqWiZ28AJUs+5yM6XcBpB73qcPsq2y+H
         GFNL5qd4ioJovv7AQy7EtlbAAvi1dMtsUwmgfLTiJiSXrYcBMQPfBjMTsqE5Dxg9EfM/
         WnX0WYITZJ00mlLyf4DpeVYGxWB/JWr6BkSMEvQPKEpnKzRa4fSH8U3pnUxhFpciaqGN
         coPfKSLRaBbSqlda1rqm+nvnjfUrp+MJWBRhwCL66IS3iNC51kZNq6Omb6xx8frXPpP4
         p008zMcfr0Xx3xI6uEDkcTOc7n1IDEycFwWxpuVuEvxg2f4N9l8Wjc1CnSi3FO7NRbQP
         CZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971667; x=1789576467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OXeBHBySyt3qw2NquXER+mKJWf4OrhxS7QKJQxlO1U=;
        b=OQBsO4hKayOZch9MGIlHS6scOuc2loXdIkJusp/VFJInTZPCSk0XHfQ1R8PjD0tcYQ
         C8vAX/plZHPLXDUN0DH0D1juYJABcE7rOT78sS7fvdV3pENt1rEjqCxPQv7gEWFgOmnl
         cfeojucVihPDtvehcBY5F9xwoHdsfPAXb4Ac4CjfczMzBtI8hlMJGIogAkEeREwUAAK6
         JHcHDSJHQmLGvoR+SpRajLsrmUtIRim3rFajkoecI1RLuvrBlijr3+KelU6KWeRxr8Nc
         QdYAB5QfD7S57pcZtNDzQAOlmJZEV6kbMAA9Psa5AP+k9RGoGpk3BcnQG4sRdw03BJZl
         hrbQ==
X-Forwarded-Encrypted: i=1; AKwUvByqL2Jj3HGv+fuvpkUaPf9MP9uBF3yrHAWVgMBhbig25IK/dnXLZwvkhT5zI68LgWblig5tMNaQRG/D520=@vger.kernel.org
X-Gm-Message-State: AFuF++mpjHlGJNudJgzD2PUIK9NmhkyWuZpcf6xziT6wRDGPiyt46sLi
	xQTuUVM6MqpUWUZ2nRryf1FF+JezZPut+fdWOBODh6EUyHMYWTE+A7zmfjAOtc+v5wtT6J8JP9Z
	IT6B+EzUIKwavl9skpMQbXMYPg/VcI6E=
X-Gm-Gg: AYBFou1/VEMQ3JkKOB1xTT9gqpZ/M+5vDfRD7qMI25pA12Z8LQh6Zp3qxozHW+0hU/y
	PUf4xvp5wv3y28r7xy/zaaC9MjN1kDimMNEco7hsm6x3nmLaXOapyabZolNjPE5NfaUdbrenzXx
	1YFkyyLvSTF6to+0H6pRi2u1OJ0bOZ2Ryyg+yUP4LDMwYX3zbyYpnM9hqgojilL4DO1oGDFu6W0
	Vn2M4EisJ7PMNbvs6a3HdkgT7H5Xg5WemlWqEu2OyniDyj7PxWhCTcSYf1WL+xPtigAVZDjIUYK
	pWw60JdxqXeDT9nQAi3hse73zcDIIFDgrlU9/CjDjQVrfVPlU79H9zo=
X-Received: by 2002:a05:6871:73a2:b0:47b:d505:86e8 with SMTP id
 586e51a60fabf-47c97aefcebmr81914fac.7.1788971666583; Wed, 09 Sep 2026
 09:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com> <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
In-Reply-To: <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 9 Sep 2026 11:34:15 -0500
X-Gm-Features: AcwNN1VgB6PY3lWZVGJPLxRB24QIZFj2GUXPTnTbU7UduTBmTljunh-ycSlPZcM
Message-ID: <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:53=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Sep 5, 2026 at 6:20=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
> >
> > Hi Douglas,
> >
> > On Tue, Jul 14, 2026 at 5:24=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > ....
> > > +
> > > +/**
> > > + * goog_mba_handle_tx_interrupt() - Handle interrupt that remote Ack=
ed our msg.
> > > + * @goog_mbox: The mailbox info.
> > > + */
> > > +static void goog_mba_handle_tx_interrupt(struct goog_mbox_info *goog=
_mbox)
> > > +{
> > > +       unsigned int reqs_completed;
> > > +       int i;
> > > +
> > > +       /*
> > > +        * ACK interrupt needs to be cleared before reading CLIENT_OU=
TSTANDING_MSG.
> > > +        * Then if a "race" happens and another message gets Acked af=
ter we clear
> > > +        * but before we read CLIENT_OUTSTANDING_MSG then the worst t=
hat will
> > > +        * happen is we'll get a followup interrupt that will show 0 =
reqs_completed.
> > > +        */
> > > +       writel(CLIENT_IRQ_STATUS_ACK_INT, goog_mbox->iomem + CLIENT_I=
RQ_STATUS_OFFSET);
> > > +
> > > +       if (goog_mbox->queue_mode) {
> > > +               u32 outstanding_msgs;
> > > +
> > > +               outstanding_msgs =3D readl(goog_mbox->iomem + CLIENT_=
OUTSTANDING_MSG);
> > > +               spin_lock(&goog_mbox->lock);
> > > +
> > > +               if (goog_mbox->outstanding_msgs >=3D outstanding_msgs=
) {
> > > +                       reqs_completed =3D goog_mbox->outstanding_msg=
s - outstanding_msgs;
> > > +               } else {
> > > +                       /*
> > > +                        * The hardware's track of outstanding messag=
es should always
> > > +                        * be less than or equal to the number of mes=
sages we queued.
> > > +                        * If it thinks there are more messages outst=
anding than we
> > > +                        * queued, something is wrong. Assume nothing=
 was completed.
> > > +                        */
> > > +                       dev_warn_ratelimited(goog_mbox->mba->dev,
> > > +                                            "%pOFP: unexpected outst=
anding msgs: %u -> %u\n",
> > > +                                            goog_mbox->np, goog_mbox=
->outstanding_msgs,
> > > +                                            outstanding_msgs);
> > > +                       reqs_completed =3D 0;
> > > +               }
> > > +               goog_mbox->outstanding_msgs =3D outstanding_msgs;
> > > +               spin_unlock(&goog_mbox->lock);
> > > +
> > > +               trace_goog_mba_process_q_txdone(goog_mbox, reqs_compl=
eted, outstanding_msgs);
> > > +       } else {
> > > +               reqs_completed =3D 1;
> > > +               trace_goog_mba_process_nq_txdone(goog_mbox);
> > > +       }
> > > +
> > > +       for (i =3D 0; i < reqs_completed; i++)
> > > +               mbox_chan_txdone(&goog_mbox->chan, 0);
> >
> > The patchset doesn't say much about the clients but if the platform
> > works like this, I have a strong feeling we can do without introducing
> > mbox_controller.has_queue.
> > Just use the msg_data[] ringbuffer -- we can avoid changing the core
> > internals and you will still get ACK for each message.
> > What are the clients going to be like?
>
> I don't think we can get rid of `mbox_controller.has_queue`.
> Specifically, the queue mode allows the mailbox controller to handle
> multiple outstanding transactions simultaneously to reduce latency.
> Imagine host (Linux) interrupt latency is 100us and we want to send 3
> mailbox messages. Let's say queuing a mailbox message takes 10us.
> We'll say that the remote interrupt latency is 50us. Timing would look
> something like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000010: Client sends msg #2 and mbox controller initiates the xfer
> 0.000020: Client sends msg #3 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees 3 messages, and ACKs them all.
> 0.000150: ACK IRQ arrives; mbox controller sends 3 txdone
>
> ...so all 3 messages are sent / ACKed in 150us.
>
> Without letting the mailbox controller queue, we'd end up more like this:
>
> 0.000000: Client sends msg #1 and mbox controller initiates the xfer
> 0.000050: Remote gets IRQ, sees msg #1, ACKs it.
> 0.000150: ACK IRQ arrives; mbox controller sends txdone
> 0.000150: mbox core notes txdone and sends msg #2
> 0.000200: Remote gets IRQ, sees msg #2, ACKs it.
> 0.000300: ACK IRQ arrives; mbox controller sends txdone
> 0.000300: mbox core notes txdone and sends msg #3
> 0.000350: Remote gets IRQ, sees msg #3, ACKs it.
> 0.000450: ACK IRQ arrives; mbox controller sends txdone
>
I don't mean that ... though even that may be more acceptable to the
clients than you think. What class of clients are there?

I am suggesting to consider TX-Is-Done when send_data() returns, i.e
tx submitted is seen as transferred. You anyway  don't catch
transmission errors. That way you fill all slots without blocking on
the first message and achieve this same throughput.
Without knowing the clients I am not sure if that can't be done.

Regards,
Jassi
