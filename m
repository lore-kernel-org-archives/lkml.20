Received: from mail-oa2-f36.google.com (mail-oa2-f36.google.com [74.125.231.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD42314A86
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789944409; cv=pass; b=T0m/WdeNWQyvmoTNFhoXTU4FViMRHluHdYIXjIVNdPZJzFGX42Dt8yW5E6xcZ4FawBArcbgGPCUcHmI7gosJI91b5wK4qT8UZXZRk5ExA5At1xzw8XgPI+OqXYM5rkwPVdN2nPo1P6W+FYXGiU8htnzW/r/Z/ibP7JWiQWU/nR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789944409; c=relaxed/simple;
	bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YG03PESMtdQoKGowXSQ9pmNktTrwB0WgwLURSVW7LET5+I6xr76CWLX8IG7doBJIxBorZcLltlctxCq1meckG0cE1gWQ2tWlGAi2FNPTk9/P3YtsHzzG1NSzxewWE05gMxBhe70M1RKcC/qaCCQrDtihEZjfNKzJI/IRXu1tXd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Klw+jYS8; arc=pass smtp.client-ip=74.125.231.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Klw+jYS8"
Received: by mail-oa2-f36.google.com with SMTP id 586e51a60fabf-466ccbd478bso1070136fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:46:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789944407; cv=none;
        d=google.com; s=arc-20260327;
        b=cGkutOtgk8BFtrOedgC2PdBb1HayAzUi032qNEqb/oNIO/knm5n7HHOsmVretXO4Ib
         bQz7j7ky6YGLJT0Fxg77ER9s2vpLHQYWZ8WUrXcFhfPMWV/Ukg7H61Wr44Q3jMNYqKxn
         ZrOcOhwtmO3U+YfK6vuVuBvPmfsPB+nTJRXuB+GGKhCBbrAN5YV4aWi4tgoN4Tw1cQOM
         2dd3JLYVzHws1IIny6RjETXbByZOLm+B2OlDZ4cZAPPUpSifa3pWp1LgfwfDUzAUrcL/
         B6MrtCZOF8pEOHUwIt9BCL20FkpcyZR9U6LHXjzcW4TtWgPQ78OpKSEhfEVZ9qbBksd+
         nc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        fh=E63K8ioRUqoElMW578Zz0MQF1rDimrJk/hTSyUua9Q8=;
        b=sANhsLv3KlSEgoIA0rhmdWtUVYLQsbA7mZqZfbrOKwUpipUiCmc9RpIDAe4AYNRswA
         01jnhran1jkgNT6dKKFgLTy2vMe9G3E6EvLbWMuQzVgjbuuWVPryZBLKZenSPYSHYhVX
         EYgOkViqcxtT33gz6JZfTKdwYs81YYfsGo9uf0cZmAOdFnFPu5/biM48W9I8ztxRrQ9S
         enLAboJZw/aJOD21Lxol+IvGxILP1Q9dCMI27EM3sWQNV4POv3yXiu6jLxYGyVsUeKFL
         u5Zs9aAPmXSV1L/yBT4g9ArLL52qnHMgl1KC1d8CaKQ4ni1jFGvP1/2ZSBaS1uRntMCu
         7r1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789944407; x=1790549207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        b=Klw+jYS84KWcrvELtJqi6UxylqwtErAp/xfj5Mzl1ahu8XNmOOEFtZghCCC7nw8VCN
         fm9GaEtXrZPGYZsdCkYS17vmDsNpRV4sg+Qo4ysVzF5vUDYGdGpuagsPweDmy56sowcq
         9iGqsCQ20G3+JMa121zrkso2n5Y6FHS8MqFQzYCnp8Wy9HlIt4qOkyte7nPPMCCZIBkm
         48zEDZapPYp/Fb3OG1JJYAZvZjmASVPo8N6T3bRW0v12u5yjzTsjNeICmpjY5UESUUcT
         JgG/KlbuywrKCjSL4ZFXmS9D6UHlp/Nv6lNQXnVWoE0Ne+SLgzmlKGHURGY2iV2yaIYF
         pVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789944407; x=1790549207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBhM7FF9u5QvV0vicKwt7/j6wjdB57A3Ftn0yg5M34M=;
        b=bqWLylRjrO6QkdmVaN5UtqSsgv6oVXOlD3K3q+9PFc8hl1DHTZsSu5vbEP3bpnLFQ6
         xv69471gvK+SuvNuxMip/MAwe8fgPbfkTQlvTOC6VTRVrdwB+ZvEjj/16KgJF0XCxWqp
         Tr79TabtTctmJtpI6VjxkI1gAOb0jj7BQIRXK0P12ujUAm1OSDcuuqtUzadgYeQtFJDK
         BAooqSun6/qN5phH6Fblwjr21kwnvtV8pNJlXDdi240FSIMBZemw23ttsSlimfZwwRPc
         vdSUAbfskHsY80/RPzK2WjunGUUpLdLBa1lOVbFEoJ5xkkI/mX8VY6/+u5A+ICJUpyil
         vlsw==
X-Forwarded-Encrypted: i=1; AKwUvBw1qm7OaMuc5xKG3D130Q4OKNFGCqZx6u5pQT2kEQ1698zynq3uIFNssTzmcgxim9MsbbDvaTRs4v06D/8=@vger.kernel.org
X-Gm-Message-State: AFuF++myIPFPLE+fWueljIx7ewFwI/BhFJ29XmS4STQ/1MBUCASw2IOF
	NjE6jENyJIQmpk0jsjbViFC9NsIWjqeRybm/sZCgyOlLW0QlsAjZAiounohw1nZX862Gz3hzEdc
	tzq2rMemB3Y23DM8DT9KsOqbAwtZYk7I=
X-Gm-Gg: AYBFou0tmBPMHxUJ4csCEvR0Nr4cfP0uVPkmdGpPQKnbLpL3vOVwkCl0jPKRa5ztHpw
	HA2fg/W6kKnoVlMNaX4Br+FH86AS45AgEKll9E9a9rFR0dCLGhzfSsAY7qQhdE2hD+qAs9rbW5i
	t6jOqh+rp44EREO5gXB7fxEwt5Vy7tNimGyLxKyaF/ajYFirY1nPPD4GMPAo9UKsldrDc47AE81
	MHTGFiaTPWd6DR2N82lngdCwUH7Qr9uvtq3V7vBiDx0dHo2VSN3ga6Pmxn8st/fWDWMhI3pww5V
	4nIvUjLMefzTVrRq3Q6ZwKHMF4qr3VdFQfgpkX7w7AMdpcFtBf6XC7U=
X-Received: by 2002:a05:6870:3207:b0:46a:d3e7:2552 with SMTP id
 586e51a60fabf-486e4e100b8mr8341437fac.1.1789944406853; Sun, 20 Sep 2026
 15:46:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com> <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
In-Reply-To: <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Sep 2026 17:46:35 -0500
X-Gm-Features: AcwNN1VuA008vOMHnkJv-oCnQ1icxOOy2PmZx4D2aQIj4GV-3fDcHSdBhSxycls
Message-ID: <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
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

Hi Doug,

On Sun, Sep 20, 2026 at 4:39=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
 >
> > > Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> > > "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> > > start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for th=
e
> > > I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> > > SPI transfer.
> > >
> > clk_prepare() is allowed to sleep, so any path, that includes the
> > call, can not be expected to have low or even deterministic latency.
>
> Sure. Essentially anything using a mailbox as a transport mechanism
> needs to be able to sleep, at least if it cares about "txdone". Even
> without a guaranteed latency, though, that doesn't mean we shouldn't
> try to reduce the latency.
>
>
> > > In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> > > the clocks. The three clocks are operated independently by their
> > > respective users. An I2C or SPI transfer may take place at any time.
> > > The I2C and SPI drivers need to know for sure when the clock has
> > > finished enabling because as soon as the clk_prepare() calls return
> > > they will start transferring.
> > >
> > > All three clocks are backed by a single clock driver. We'll call it
> > > the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> > > to turn on the clock and encodes it as a mailbox message to a remote
> > > processor. Let's imagine that the mailbox message looks like a 2-word
> > > transfer. The first word contains a 0 or a 1 for enable/disable and
> > > the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> > > "clk_i2c2", and 2 for "clk_i3c3".
> > >
> > > Now, imagine that we want to turn on all three clocks simultaneously.
> >
> > Why? (not that it can't be done) I2C and SPI clients run independent
> > of each other.
>
> Right, the whole "independent" aspect is what I'm talking about. I'm
> not saying that we're _trying_ to do all three transfers at once, but
> just in the natural state of things there will be lots of clock calls
> going on at the system all independently of each other. That means
> it's likely there will be times when several clocks are enabled
> simultaneously.
>
>
> > > The "clk_mailbox" driver will see 3 calls to turn on the clocks and i=
t
> > > needs to convert those to messages to send the remote processor. It
> > > will then call mbox_send_message() to queue those messages with the
> > > mailbox controller. In other words, we'll see these three calls happe=
n
> > > nearly simultaneously:
> > >
> > > mbox_send_message(chan, &{0x1, 0x0});
> > > mbox_send_message(chan, &{0x1, 0x1});
> > > mbox_send_message(chan, &{0x1, 0x2});
> > >
> > > The LGA mailbox controller knows "txdone". That is, when the remote
> > > processor "acks" a message, the LGA mailbox controller can tell (and
> > > get an interrupt). This "ack" signals that the clock has finished
> > > enabling. This means that the "clk_mailbox" cannot run the state
> > > machine and it can't call "txdone" itself.
> > >
> > > Without my patches, when the above 3 mbox_send_message() calls are
> > > made, the first one will go straight to the LGA mailbox controller an=
d
> > > the second two will be queued up. Once the "txdone" for the first
> > > message arrives, we'll queue the second message. Once the "txdone" fo=
r
> > > the second message arrives, we'll queue the third message. This means
> > > that the messages are not being processed simultaneously. The third
> > > clk_prepare() call will be processed much more slowly since it has to
> > > wait in line. If we had 10 clocks enabling at the same time, the 10th
> > > clock could have a pretty significant wait.
> > >
> > > With my patches, the LGA mailbox controller is given the second and
> > > third message even though the first message isn't done yet. The LGA
> > > mailbox controller can queue the second and third messages even thoug=
h
> > > the txdone for the first message hasn't arrived yet. If things are
> > > fast enough, all three messages can be queued up before the remote
> > > processor has even started processing the first one. The remote
> > > processor can process all three messages concurrently and acknowledge
> > > all three at once. The LGA mailbox controller can get a single
> > > interrupt representing all three "txdone" ACKs and call "txdone" for
> > > all three messages simultaneously.
> > >
> > If your remote (host) can actually act on multiple requests parallely,
> > you need a way to map ACKs back onto the requests. Currently you
> > don't.
> > Looking at the goog_mba_handle_tx_interrupt() implementation, consider
> > the situation when 5 requests are submitted in the h/w fifo and 3 are
> > reported ACKed by the interrupt after some time.
> > You assume the three done are the first three -- which implies that
> > the remote handles requests in the order they arrive i.e, serially.
> > Otherwise, say, request-1 may be wrongly completed if the ACKs were
> > for requests 2, 3 & 4.
> > So it seems mostly an illusion of parallelism - remote is acting on
> > requests (or atleast sending ACKs) serially.
>
> It's more than an illusion because all of the slow paths are
> parallelized. For the remote processor, I believe that turning on a
> clock is trivially easy: just set a bit. The slow parts are the
> interrupt arriving on the remote processor and the interrupt arriving
> on the Linux processor. Those _are_ parallelized. During a single
> interrupt, we can see and process multiple mailbox messges (or
> multiple mailbox ACKs). I can paste the example I gave earlier. Just
> as you say, interrupts are processed and acted on serially. ...but
> because we can parallelize the interrupt handling we still get the win
> because interrupt latency is much worse than any of the actual work
> that needs to be done.
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
> The numbers here for interrupt latency are made up for my example and
> I haven't personally measured them, but I think it's not completely
> absurd to say that interrupt latency (on both the Linux and remote
> sides) dominates the communication path.
>
Yes, the numbers do look biased. It takes 50us for remote to get the
irq and act upon it before ACKing but it takes 100us for that ACK to
get back.
And the benefit will be hard to achieve - it involves three unrelated
clk_prepare() requests done within 50us often enough. When the stars
align you save 300us on a clk_prepare()

It feels you are trying to optimize a non-issue. clk_prepare() is
expected to be slow and anyways shouldn't be frequent enough from all
devices to give noticeable benefit.

If you do have some real numbers and think it is worth it on your
platform, then maybe expose each doorbell/shm-slot as a generic
channel. clk_mailbox will request a generic channel, do the request
and free it. The same effect but without inventing a new api. I can
share a draft if you want, but I suggest let's not make things
complicated without proven benefit.

> > We can keep the core
> > unchanged and the driver much simpler if we simply use the buffering
> > in the core.
>
> FWIW, the driver will need to contain the queuing complexity
> regardless. This is because the remote processor expects queuing. Even
> if we don't queue at the Linux level, the driver still needs to know
> if the remote side uses a "queuing protocol." This is because the
> remote side expects the shared memory to be partitioned into chunks
> and that we must move onto the next chunk between messages.
>
My first concern is to avoid implanting a yet another path of sending
messages and second is to keep drivers simple if they can.

Regards,
Jassi
