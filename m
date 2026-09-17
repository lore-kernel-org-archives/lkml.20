Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01248FF95
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634340; cv=pass; b=SuZglL0X2tDAi/xGMqYYg8gxBuVYjrnVjcjkjNk/94/woucUKoXV9dD5yAnbW42xjAIq4RaHm7NO2A9MCcSaj0Kr3AQleX6oBDDBFXO4LFZyENMbjAfW+P8/+Z7N6YNzienaR+1P6rSlFko8Iji84CXe5iOf2Uh0R8WMdt7EfZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634340; c=relaxed/simple;
	bh=CBTwYW1egJ18IZgTwbClhMCluzcASmkUQMLwEwQVBqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MS+kDRadZLPrdeKNN9e6qyhvgt+KIaUFZRF322goxUHeyuG4aeqTeUBh3jacEpX3bdrn5BXPIzprKNZRDYiDQ4oCCqJZPjA472mNJGWipgOfWkPm3wJzUStuRXDeFMaF9HYhHwc0QqZLF6zBIHCHLeMxWTD0VYXon9MtZBUtqzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=HBnvfnfp; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="HBnvfnfp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so380331f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789634320; cv=none;
        d=google.com; s=arc-20260327;
        b=hXO3NDs6iETHf0oknHaQKgW+gm5R+DzxYTQgkK3vZnFg12I0udkJBrWubA0bti4N9k
         WNXi4mwhBmzvigZny5u/4jFyM2Z5nyEg2Rvv+Sde3WJ+FtjGQw04lX0GGCWqkjwBismg
         WAWVLgL7pYf8AsaJ+Jhf99xkhlPoAGBD6A9h3TB1mm9qRfwG2tlMeXvigM4NX2eBTX7d
         rzzhu7o3FQQHO63nNstq2Sqe5J46DnFHPgxBD494wQx/Ic42pZcqj78XT3UPQxyVzBTG
         iyEZHpRjHBPDMG9avIG/GQCeashkfeYiP12MvH0AyiyUzn9nk/CGrOmMQ1/wrTZd/n9x
         ruEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xZ8ugZNSOyGTueNHHUg4rhDx4Y6pOqaVeIryusIch4=;
        fh=WjVmaggz+t03a/SyKcQrhcuqk2FQDTU3N+ClEWdsQ0o=;
        b=RKiJ97YGRZUX532GBc/Hxg9Mum9mujqxDsM6ZM6Hghwnk802UIeiAClwES1IB1/zlb
         CmvGsCwyD6M7m+dnsy0uuzwVV6P7/xTkqjeq3JtfDIn/lHryPHGJfKDCMIa1i1tOgG+g
         HizMD/0KCD6k1JNqHChae7NLNYnKdmwytcnnxmxqDUhyD22bTGGlDyITTyfKvoGXofrT
         FPrrCAFc+66L1FginQOdgIIDAtuIVN+wpmwHSMVnAca9cq5Oqlgr55D1SyA96KqGkKSi
         ngY+m0+eC0n9oLgSU7vtS+klQXp7deZDGplQW3LmfBnhcr8xLGsXMeNgD49l9+I5/s0C
         1BqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789634320; x=1790239120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xZ8ugZNSOyGTueNHHUg4rhDx4Y6pOqaVeIryusIch4=;
        b=HBnvfnfpQRi6oiYVQ/vYmfvGnrFUbembuGOFtCrRml586aJsF1H4vHhD7JP/VaCG4D
         K3AlrCY83216mDa8FyiQNKNxvMqLPcY7JYBgaLuL5oXP55yQdlMM1cLwGQLiey6Q8Fqe
         RVoO9lTz9APairrHFX8XQtz58XukQp/sRocDA118RCR2ig772u41udXG9CF+D/aCnz+z
         aQv+mUBJEvCrGc8Z+r6mL6MSbyYbdI46+qJ7ioHa98L76QUIyMr7Xt9dESs0U82cIdS2
         GoGOtlTEa3KdLIIDYBDOumdRLTkUlOTHNZjc1tuXijF59e1PxqcOlxKCTKB1UL89wn0K
         mokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634320; x=1790239120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xZ8ugZNSOyGTueNHHUg4rhDx4Y6pOqaVeIryusIch4=;
        b=qYhAUNF+1HxUR7N9yo/H2V+5Q507pCZqgVHguDRisXwc2yfzzSknPA8L8Rmr6UxHY/
         bE9pgQiwNHknbMxO0faRg3rxpa8zEvWFRvV4cH/utrZX1xNLOPq2MugyvcrVnjPM8sjq
         YCb5ATDmg7xEia2ZryRJBUX4bAFLKQjclODhiyl7tz/Ju+uz4CEO2zpqsq9THuMosw+w
         TYFCGKwTFjhR+bbczxI0ghg+64dE6MyRDIpQAaeSudqDT0tbMyi6APg+/YdVZi6w4i/L
         EISxyzJQp9f3/tD+RahncwDHicQBp7iHrdenuSz3uR87seqmwBCwzgm1nD3oVJ83e00K
         XfDw==
X-Forwarded-Encrypted: i=1; AKwUvBwM22EYOgUl433j3AY87Ur0KHnZ3OR//fkQYAZEC676r3Qc1RB/9v00izUaZO4Q2tmBwa3Q5f1o3/1VQAo=@vger.kernel.org
X-Gm-Message-State: AFuF++lIux87B9K2qc2kTtzTWySsEmdPzI51V7DUxQy6vIZyavX0A+W9
	TjbvxoWcbgBPCWZzvMtObbwJBLiGYUtbWn41NU11Jdx+uAuxDIxoxkIz7pdGTENrjh7dlR1Wc4C
	R8ao6pTPAd8GxD76x6TNYvvM2BLGz2x/vJPPrLg9Wbg==
X-Gm-Gg: AYBFou2ERjdL1HDjt+qCeQ/2NCpcjuu9ytDUTu8PB04PE0xBD3pgV4PvQyQvZz8sCD0
	VgQm4/cVSijjKN91+kSoehcxoLVKW9g6smmORENZWk10yCg0wUBnqQNfDkzSyqQ95epg9tIAibJ
	meGJ0YLhvbDliStEJLLlMv5kh68V/pwBR2tSFSJolm2DT56kPT8yKJxtp+fmsicAC4eAm20nkhj
	DuHqwqadFBP/1CAH+/BFEYUint4Ky9duJOjY+kkzk29sh1Tv0f4eJz2oZt6tYv8qi9vjihBuDQB
	/lS/fVR8eIDbsiSlE5VrKnGfj0nyqOovw7s0GW4c3vhDlF+2JaeAUqJxCVonu+VysOrLLcOPJIu
	KkljhoURBYujkSMgfGBstiFra2jHD3F3hqMNgmjEmBIGMJhx3LcuaT9qn266jX+cd/DC35WDXHJ
	DNnAYmWCyi
X-Received: by 2002:a05:6000:654:b0:487:72f:fb42 with SMTP id
 ffacd0b85a97d-4870cf29d90mr13783311f8f.14.1789634319634; Thu, 17 Sep 2026
 01:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
 <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com> <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
In-Reply-To: <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Sep 2026 14:08:28 +0530
X-Gm-Features: AcwNN1Vcy0QtpmdJ_pk5OG_hAQ80ZZl7phHzkpnX5C7hVHyAhOEU3VXVGWfW1fk
Message-ID: <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:46=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Anup,
>
> On 9/16/2026 8:12 PM, Anup Patel wrote:
> > On Sat, Sep 12, 2026 at 3:45=E2=80=AFPM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Add a device-tree binding for the OP-TEE RISC-V transport using the RP=
MI
> >> TEE service group over SBI MPXY.
> >>
> >> Describe one mailbox channel per hart and an optional interrupt used a=
s
> >> the availability doorbell for asynchronous notifications.
> >>
> >> Add the binding to the existing OP-TEE MAINTAINERS entry.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 +++++++++++++=
+++++++++
> >>  MAINTAINERS                                        |  1 +
> >>  2 files changed, 66 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee=
.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> >> new file mode 100644
> >> index 000000000000..8f6ff313fd42
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
> >> @@ -0,0 +1,65 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: RISC-V RPMI TEE service group based message proxy
> >> +
> >> +maintainers:
> >> +  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> +
> >> +description: |
> >> +  The RISC-V Platform Management Interface (RPMI) [1] defines a messa=
ging
> >> +  protocol which is modular and extensible. The supervisor software c=
an
> >> +  send/receive RPMI messages via the SBI MPXY extension [2] or some d=
edicated
> >> +  supervisor-mode RPMI transport.
> >> +
> >> +  The RPMI specification [1] defines a TEE service group which is the=
 RISC-V
> >> +  analog of Arm FF-A: OP-TEE and the rich execution environment (REE,=
 i.e.
> >> +  Linux) are peer endpoints and the RPMI framework (machine mode firm=
ware)
> >> +  mediates every message. Entering OP-TEE on a hart runs it on that h=
art until
> >> +  it responds, so the SBI implementation provides one SBI MPXY channe=
l per
> >> +  hart; all of them are listed, in hart order, on a single node.
> >> +
> >> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +  References
> >> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> >> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> >> +
> >> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> >> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: riscv,rpmi-mpxy-tee
> >> +
> >> +  mboxes:
> >> +    minItems: 1
> >> +    description:
> >> +      One SBI MPXY channel implementing the RPMI TEE service group pe=
r hart,
> >> +      listed in the same order as the CPU nodes.
> >
> > I am not sure why you need separate MPXY channel per hart. The MPXY sha=
red
> > memory is already per-hart whereas the MPXY channel will be doman speci=
fic
> > for TEE.
>
> True. My reasoning was that TEE_CALL, as I understand it, is expected to =
execute on
> the same hart that issued it. Given that, the mailbox core holds the per-=
channel spinlock
> across the call to `send_data()`, while the underlying `sbi_ecall()` is s=
ynchronous
> and does not return until the TEE call completes.
>
> So, if two harts shared the same channel, a hart executing a long-running=
 TEE operation
> would hold that channel's lock for the duration of the call, and another =
hart
> trying to enqueue on the same channel would spin waiting for it.
>
> Using per-hart channels avoids that cross-hart contention. I agree that t=
his may
> not be the right layer in which to address the issue. I did not pull it t=
o the discussion in to this RFC.
> I'm happy to use single channel for now and follow up on it separately if=
 useful.

The per-channel spinlock serialization is not required for SBI MPXY based
mailbox channels because the underlying SBI implementation will take care
of the serialization where required.

In other words, we need to improve the Linux mailbox framework to allow
SBI MPXY mailbox controller tell Linux mailbox framework to not use
per-channel spinlock based serialization.

One possible approach to enhance Linux mailbox framework is show
below. May be include this (or some other approach) as a separate
patch in your series ?

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..437e7e2e6ad5 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -48,7 +48,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg=
)
 static void msg_submit(struct mbox_chan *chan)
 {
  unsigned count, idx;
- void *data;
+ void *data =3D NULL;
  int err =3D -EBUSY;

  scoped_guard(spinlock_irqsave, &chan->lock) {
@@ -66,14 +66,22 @@ static void msg_submit(struct mbox_chan *chan)

  if (chan->cl->tx_prepare)
  chan->cl->tx_prepare(chan->cl, data);
- /* Try to submit a message to the MBOX controller */
- err =3D chan->mbox->ops->send_data(chan, data);
+
+ /* Try to submit a message to the MBOX controller in atomic context */
+ if (chan->mbox->ops->send_data)
+ err =3D chan->mbox->ops->send_data(chan, data);
+ else if (chan->mbox->ops->send_data_nonatomic)
+ err =3D 0;
  if (!err) {
  chan->active_req =3D data;
  chan->msg_count--;
  }
  }

+ /* Try to submit a message to the MBOX controller in non-atomic context *=
/
+ if (!err && chan->mbox->ops->send_data_nonatomic)
+ err =3D chan->mbox->ops->send_data_nonatomic(chan, data);
+
  if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
  /* kick start the timer immediately to avoid delays */
  scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index b02c17c2c64e..9afa10c72bd7 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -420,7 +420,7 @@ static void mpxy_mbox_shutdown(struct mbox_chan *chan)
 }

 static const struct mbox_chan_ops mpxy_mbox_ops =3D {
- .send_data =3D mpxy_mbox_send_data,
+ .send_data_nonatomic =3D mpxy_mbox_send_data,
  .peek_data =3D mpxy_mbox_peek_data,
  .startup =3D mpxy_mbox_startup,
  .shutdown =3D mpxy_mbox_shutdown,
diff --git a/include/linux/mailbox_controller.h
b/include/linux/mailbox_controller.h
index 26a238a6f941..4bc4798c4b1f 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -28,6 +28,10 @@ struct mbox_chan;
  * transmission of data is reported by the controller via
  * mbox_chan_txdone (if it has some TX ACK irq). It must not
  * sleep.
+ * @send_data_nonatomic: The API asks the MBOX controller driver, in non-a=
tomic
+ * context try to transmit a message on the bus. Returns 0 if
+ * data is accepted for transmission, negative error while rejecting
+ * if the remote not acccepted.
  * @flush: Called when a client requests transmissions to be blocking but
  * the context doesn't allow sleeping. Typically the controller
  * will implement a busy loop waiting for the data to flush out.
@@ -53,6 +57,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
  int (*send_data)(struct mbox_chan *chan, void *data);
+ int (*send_data_nonatomic)(struct mbox_chan *chan, void *data);
  int (*flush)(struct mbox_chan *chan, unsigned long timeout);
  int (*startup)(struct mbox_chan *chan);
  void (*shutdown)(struct mbox_chan *chan);

Regards,
Anup
