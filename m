Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62B45A29B;
	Mon,  5 Oct 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193242; cv=pass; b=Ik0OOmFQy87zZ+Ki/K1s6T+ffTpp6srOT77kf8LAxuzkQWFpmcZjQ6YyiuleNUfMQa1dRtkv2lhAqV725+ZLSBISeZckAJPZln6LxJVEg2v8/OldkNIT6kxJjFGmtvkdq3J9njERU8q/kJqaWoTZagDlFq/+8x01lUtSh++RMn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193242; c=relaxed/simple;
	bh=0uNzwit0ri35Jmfc0qhuP++aIw+aqsQZdgsHLYbVHAI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UGd/jjVEiDSOONJqb7N7qJ20pixtxR0rurnRq0Ts56QEHHHLt63Rgws+NX64h7c4Wo5QTdotkBjdT+TzRuPs1k5c0tVqBhJa3Pbcek/rAq9TThMbifrAG5i6bVcA5M3lp/g7tpzUDSbZl2xNym8TYZ42A9rUtrKfLh11UGemOhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=QCAcaSq7; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="QCAcaSq7"
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 272642012A4;
	Mon, 05 Oct 2026 11:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4xsJYMrf5HGdjphikg5hJt2U4oFPoxOZcXn/vcWrJM=;
	b=QCAcaSq7lgfYtWlyqoWlUQiM7/4L+x2v4P1IZ8CgiJj2RacGXeBNz7GU/VnHZax5ofyeag
	YhKhxa8w+v5o10axjZj41dyNzmSRUlFN04Cjomhtv7o2nnKI/UqRAwvTCELzyg1P39vCgq
	8m8EsdAyYHzvV1Pw0Oht77OW9EqPSbO8tX+tYPaZ7ZjSWW/4/D0vRATVGCk08Marafs2Gm
	TSTNFs6iwxaHUnhPiNSllIesG5doessKIV9N7ENVbINHF+3133rTavggEthiqBvKb5bL0W
	l54r0eV3MeU2nxg5MdoCy/foeVr+LwSku5vHt+tNAVWgt2OnYLXCf+lJEDSbaA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791193226; a=rsa-sha256;
	cv=none;
	b=KySaxDTa9Nn4orTzLSZ2pAbYYJp7WOmsWsOG8la4L+gEmRQd5gCUgU8pI6BH3jxH0sIMBC
	eC7C/ngmXxfPKugShKayGMY9/t+GBDI80VDS8GmajfGf4KUtOhs0TWGziqzXRrZXQEQtWX
	35ojsr39fLvLKUi0Z+/HsaAepx0YfKf32n1gxCDwiowtQ9Fb22gGq1AB/ATogN6OnxvTrc
	pb342ma7PzNDzdOCPAz3phjkH06PnVybyJzKtvDWVPdgnSE2EwGZke9lNiJzzb24lXofDp
	7leIZ9I5qr6/TEuFknxAZEVyzxi11cLjwOMIX80tw/Az1rkFsNTtdB6DGzsYmA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4xsJYMrf5HGdjphikg5hJt2U4oFPoxOZcXn/vcWrJM=;
	b=UHn7Z83nTe0iQi98ov7g8Gqfb81hE2ll8TqojTYQNIlY/nltK9SsQZJO9QzT/eh48sFAwn
	gL2qVq0rTYc0ycEVlzQzkopaXNdvZoJXs2wzfnxFhKuL8gkZqjHFV6G8V3kAhek9afMqsB
	hBZt8JYCxJPbYi8CIjFTaLaqoYwSFjYgoKiuHZMiegvioY2IdKgx95PwHWBjl/hHpnpVfe
	ln2ZemKadbuvEuRaHg9aSKw9HI2Di0YHkrltwjdCIqEX8JRAdXX4DqDhBzTtotCBum77zq
	ks8EB1hNZKffrz4JlfW/uH2XqjnxeUUPMdYTPJ7D2eoOP8WLii2xvsjd0ccxIQ==
Message-ID: <ea747d54-acec-45cd-bcc4-77385812eead@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 2/4] media: rockchip: Add JPEG decoder driver
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <c28b782fd2de05f4e1fdaa1df96a57f04640f4df.camel@ndufresne.ca>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
 <20260925-rockchip-jpegdec-v5-2-30658833cb68@pengutronix.de>
 <8a559d812623457381e65e0e62699ba043de7861.camel@ndufresne.ca>
 <97676b94-47f9-4937-a1aa-69e8bbd527df@pengutronix.de>
 <c28b782fd2de05f4e1fdaa1df96a57f04640f4df.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 09:40:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On 2026-09-29 15:34, Nicolas Dufresne wrote:
> > > > +static int vdpu720_fill_chroma(struct rkjpegd_ctx *ctx,
> > > > +			       struct vb2_v4l2_buffer *dst_buf)
> > > > +{
> > > > +	struct rkjpegd_dev *jpegd =3D ctx->dev;
> > > > +	struct vb2_buffer *vb =3D &dst_buf->vb2_buf;
> > > > +	u32 y_size, size;
> > > > +	void *dst_cpu;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&ctx->fmt_lock);
> > >=20
> > > I keep seeing this fmt lock over and over and can't get my head aroun=
d why you
> > > would need that. There is implicit locking in the VIDIOC system that =
do protect
> > > these. Again, can you in your own word explain your choices ?
> >=20
> > It comes with dynamic resolution support. The check for a new resolution
> > has to be done in device_run() to make sure the resolution change takes
> > place on that exact frame. Doing it in buf_queue() would mean we get the
> > frames still in the queue wrong. We can't take vdev_lock in
> > device_run() which is why sashiko continuously stumbled upon missing
> > locking of ctx->dst_fmt.
> >=20
> > I cannot judge how propable an actual race or how serious this missing
> > locking is. But yes, the fmt_lock is a direct result of my LLM fighting
> > against Sashiko.
> >=20
> > So I could drop dynamic resolution support (which I don't need
> > currently), or we could ignore Sashiko here.
>=20
> That's the tougher one to solve I suppose. This is probably the first jpeg
> decoder implementing DYN_RESOLUTION, which is valid, just a feature more =
recent
> then most jpeg decoders today.
>=20
> I was mostly triggered by the fact  called fmt lock, since device_run() o=
nly
> occurs while the device is streaming, and the format cannot change while
> streaming.
>=20
> On dynamic resolution change, to avoid the need for this locking, I belie=
ve you
> want to delay the update of the dst_fmt to when the draining have complet=
ed and
> userspace stop streaming. Only then it is safe, as in order to resume dec=
oding,
> userspace will have to call streamon, which will fail if the allocated bu=
ffers
> are too small. There is no other validation of the buffer size in place, =
so
> otherwise you can just do CMD_START and let the HW write all over the pla=
ce.

Ok, with the next version the fmt_lock will be gone. I'll update dst_fmt
only under vdev_lock. On a format change the decoder stops at that
frame. In g_fmt I can now report either the dst_fmt, or, when the
decoder has stopped, the format of the frame at the head of the queue.

> > > > +	irqreturn_t ret =3D IRQ_NONE;
> > > > +	u32 status;
> > > > +
> > > > +	/* The registers are only clocked while the device is runtime act=
ive. */
> > > > +	if (pm_runtime_get_if_active(jpegd->dev) <=3D 0)
> > > > +		return IRQ_NONE;
> > >=20
> > > Was that sashiko asking you to do that ?
> >=20
> > Yes, several times:
> >=20
> >   =E2=96=8E [High] The interrupt handler reads hardware registers witho=
ut checking if the device is active via=20
> >   =E2=96=8E pm_runtime, leading to crashes on spurious interrupts.
> >=20
> >=20
> >   =E2=96=8E [Severity: High]
> >   =E2=96=8E This reads the VDPU720_REG_INT register unconditionally upo=
n entry. If a spurious interrupt or an=20
> >   =E2=96=8E irqpoll event occurs while the device is in a runtime-suspe=
nded state (with clocks and power domains=20
> >   =E2=96=8E gated off), will this read trigger a synchronous external a=
bort on ARM? Should it use=20
> >   =E2=96=8E pm_runtime_get_if_active() to verify the power state first?
> >=20
> >   =E2=96=8E If a spurious interrupt fires while the IP block is held in=
 reset, the rkjpegd_vdpu720_irq() handler=20
> >   =E2=96=8E will run. Because PM runtime is still active, pm_runtime_ge=
t_if_active() will succeed, and the handler
> >   =E2=96=8E will try to read from the hardware (VDPU720_REG_INT), which=
 can cause a bus stall or kernel panic.
> >=20
> > > To start with, if you clock off the
> > > device, you won't get the IRQ. If you clock off the device between th=
e start of
> > > this function and here in a race, you have some bigger problems in yo=
ur driver.
> > >=20
> > > This type of IP is not free-running, its trigger based. When its trig=
gered, it
> > > should be busy and a PM ref should be held. Be careful with sashiko r=
emarks, it
> > > does not differentiate free-running IP from triggered IP.
> > >=20
> > > I'm also a little worried that maybe you don't actually understand th=
is, since
> > > its quite possible you simply fed sashiko into your llm to produce th=
is v5.
> >=20
> > Ok, shows I have to think a bit more before taking Sashiko things for
> > granted.
>=20
> Yes, though I was off a little, what I mean is that for triggered devices=
 like
> this, which don't have known spurious IRQ hw bugs, you want the PM runtim=
e to be
> held for the duration of job, which imply it will be running on IRQ. The =
method
> you have now would be useful if there was a shared IRQ or some known hard=
ware
> bugs to deal with.

No shared IRQ and no known hardware bugs currently, so I can drop the
runtime PM from the IRQ handler.

> > > > +			rkjpegd_last_buffer_done(ctx, vbuf);
> > > > +			v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
> > > > +			v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	rkjpegd_parse_src_buf(ctx, vb);
> > >=20
> > > This function can fail, its not clear once you ignore the return valu=
e how the
> > > error will propagade to device_run() and produce a matching error dst=
 buffer.
> >=20
> > The error travels through src_buf->parsed and rkjpegd_vdpu720_run()
> > bails out with an error when the frame couldn't be parsed. I can make
> > that clearer by returning an error from rkjpegd_parse_src_buf() and
> > setting the variable here instead.
>=20
> Not sure I completely followed, but the main point is either drop
> rkjpegd_parse_src_buf() return value and related code if not needed, or u=
se the
> return value to propagate the error.

rkjpegd_parse_src_buf() returns void in this version. Anyway, will
change to return an error and use that value.

> > > > +static void rkjpegd_stop_streaming(struct vb2_queue *vq)
> > > > +{
> > > > +	struct rkjpegd_ctx *ctx =3D vb2_get_drv_priv(vq);
> > > > +	struct vb2_v4l2_buffer *vbuf;
> > > > +
> > > > +	for (;;) {
> > > > +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > > +			vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > > > +		else
> > > > +			vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > > > +		if (!vbuf)
> > > > +			break;
> > > > +		if (V4L2_TYPE_IS_CAPTURE(vq->type))
> > > > +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
> > > > +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> > > > +	}
> > > > +
> > > > +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);
> > > > +
> > > > +	/* A seek also ends a drain a resolution change had cut short. */
> > > > +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> > > > +		ctx->fh.m2m_ctx->last_src_buf =3D NULL;
> > > > +	else
> > > > +		rkjpegd_resume_drain(ctx);
> > > > +
> > > > +	if (V4L2_TYPE_IS_OUTPUT(vq->type) &&
> > > > +	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> > > > +		v4l2_event_queue_fh(&ctx->fh, &rkjpegd_eos_event);
> > >=20
> > > That is strange, STREAMOFF will flush the queues, so adding an event =
to the
> > > event queue seems odd, I never seen that before.
> >=20
> > The same pattern is in the vicodec since [1], was added to mxc-jpeg in
> > [2] and went into this driver from there.
> >=20
> > Sending EOS here is deprecated anyway:
> >=20
> >       For backwards compatibility, the decoder will signal a ``V4L2_EVE=
NT_EOS``
> >       event when the last frame has been decoded and all frames are rea=
dy to be
> >       dequeued. It is a deprecated behavior and the client must not rel=
y on it.
> >       The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> >=20
> > Maybe we can just drop it for a new driver.
>=20
> But that's different, its about sending EOS event when the LAST buffer is=
 queued
> into the capture pool. Driver that strictly want to implement this backwa=
rd
> compatibility must resort to queuing an empty LAST buffer. Doing this in
> streamoff seems odd, I would need to further dig into. I must admit, I ne=
ver
> seen that event being used, so I don't really know how it was historicall=
y used.
>=20
> You can always leave it, I'm just not convince of the usefulness, as we s=
hould
> be flushing the queues when we stop streaming.

I'll drop it.

> > > > +module_platform_driver(rkjpegd_driver);
> > > > +
> > > > +MODULE_DESCRIPTION("Rockchip JPEG decoder driver");
> > > > +MODULE_AUTHOR("Lucas Sinn <lucas.sinn@wolfvision.net>");
> > > > +MODULE_LICENSE("GPL");
> > > > +MODULE_IMPORT_NS("DMA_BUF");
> > >=20
> > >=20
> > > Looking forward your feedback, I'm quite surprised of "your" choices,=
 and how
> > > you possibly have needed this complexity.
> >=20
> > Thanks for the thorough and honest review.
> >=20
> > When I first worked with v4l2_m2m many years ago I was excited how easy
> > it has become to write such an m2m driver. I am also shocked to see how
> > many possible races sashiko found and through which hoops I had to go to
> > make sashiko happy (I still haven't accomplished that it seems).
> >=20
> > Much of the complexity comes from two things: The watchdog and the
> > dynamic resolution handling.
> >=20
> > Sashiko claims the watchdog has to protect itself against a race with
> > the irq handler. That of course misses that the watchdog only triggers
> > because the IRQ doesn't come which makes it quite unlikely that the IRQ
> > comes in the precise moment the watchdog triggers.
>=20
> That should be solved using the watchdog API alone. On a theoretical basis
> (cause I don't program this every day):
>
> irq_func()
> {
>   if (!cancel_delayed_work(&dev->watchdog_work))
> 		return IRQ_HANDLED;
>   ...
> }
>=20
> watchdog_func()
> {
>   reset_so_that_no_possible_irq_occures_passed_this_line();
>   return;
> }
>=20
> So in the IRQ handler, you use the delayed work API to guaranty that your
> whatchdog won't be called. If its being called, or has been called, then =
it does
> an early return.
>=20
> For the watchdog, the delayed worker code ensures that once called,
> cancel_delayed_work() will return false. You have to make sure you synchr=
onously
> guaranty that no more IRQ will occur, hense why we operate a HW reset. It=
s also
> usually the only way to recover a wedged IP.

Done that.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

