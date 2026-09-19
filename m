Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1615379EDA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850460; cv=none; b=ACxisfLrIk/8ouZEnhr5KqbviKSisxy+S/JQqu16aeEhE6fHVyxXDzkwfWSXzZAR9W9RrJ3eCdNVmi5oZVFeBrgZr1wtpNjJ3whT6M1QoOwX1Bolgv9QgR6QM4ZahIaWWZM40E4Qi+X+/4wDZg6myz15WFuFrKo5zEh3uV8Jo50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850460; c=relaxed/simple;
	bh=e62aRkkbOSsZptWXo3iOdQAeCcUpVZ7PON6/+HmOccA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcUBZFb6tCMpm6VksxuozD6g87AG+H6Hdk3jZQbtoGyviMfKEfbwvb1TwYkxewKZVcUT+uGYUWC5hqlrmWXX+sfulVm8AiZosgCLrUI7VWvzCwibRNtfnaBkjY+VjSPWYCjK/zfy/zA1IWF0M+oyStP0zaphcj/sSnmaE2SelLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m+iosmwd; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m+iosmwd"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6aa487e2337so2760389a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789850456; x=1790455256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUXpSKvxxMXTUlxX9mKnAwarD3gguu6C1vrYMI6hVaI=;
        b=m+iosmwdjWPtSSqivf5CrqB3PAMP/OYAuPCzW4jKIgrOrSBAREq6IzidvccguuOVDn
         1XvDTGWNtGvii4hfnkr/W/vkgxcG55y2jHXy2BztgB59SWtmAZbg8CFLxFPFKn4KTVIZ
         uB5xaV+1ZLT44q6PEKt9zZsWyRBf4B6fAubMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850456; x=1790455256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUXpSKvxxMXTUlxX9mKnAwarD3gguu6C1vrYMI6hVaI=;
        b=h62QbbRCGM+sY3bNXYzxkTAyEwAi1vLVN2P1nQRi3W5Rw8eYTf6zU8DV2TL2LqcTJC
         8a1a57ymOg6aSddP/9jJbyIsx9sdgzRAdd7zTEUwBiAlWnle1QgX+wTBmEkWJ5Jheu0K
         NGEN2s3p17JvwPpFBGNIBGh47UkuiFeG+avf16T51x+FkanFX72qiHCGw2kLZWtGMRH/
         NSIhQbOJElUD9NxkIIMWAOCNNBy6FSCgCg0H++6rcUUT7jGdDwLZnuXZE30QyuvdfLJj
         6wnWRCfFbZ3LfeDKFb5ulD92FghGMK02soJf4o6zHp+mJerENg5IDdN815IsVxZyamyk
         B9cA==
X-Forwarded-Encrypted: i=1; AKwUvBzOZXF8QIF36b0VZXqwJf6/424YJn8gVQ1LvHE7Qqw3PEgUaE6xUNYQ4HObgHjnm0cGeZJy9kRkVOkWYtA=@vger.kernel.org
X-Gm-Message-State: AFuF++kbYqfq105YXyHbONpyzzlQNs8Ge2XMJNXH5d0t7y+M745jK7+9
	AecNJyS9xJjITD8qf4qP1/WubrViq4fAT9Rw5Nk7OmBVQ/dr4a2ipXyDQvwKq/7ZpcvlaA+JE8P
	puA0=
X-Gm-Gg: AYBFou1QZODxkXDjFbVOZqUeb78tw7Pus6zootRRRA+irVYd1Dqk5Nh6OX0kREaocq4
	yNp9xPZfKwP8hpJpi+zV0Ezkj1SHMk6Uh2X0doCZ6TjqxwFddP2JvXirZeducKQy3qhkuvqXbdw
	IrhWsYAVcCaNpGIwON14nLb6KGMEW3Q3ONaCGedAz+scFhYvu7bTHIRKXHrFps7MGFNImprsbA2
	D9yD3sywUdzxBjkmK+GiRMA5FDjZmTpxZfPmbcxY6G5hGLQ7z7cCT7jTX/UdBZ6MmkQjX1n4kGe
	6so4X9p0FoE+F7i4NAOf09Dh75ndbc90vDMxFb63OTFEHhbBjzVLCgr6IX/eutlqgYmohRgZeR4
	DBd1EeCTTiXf/DX57QEb0NSrG27NJcQKbojd95E/0OdMwJ7XYLXtNYZwRke82FUtikXYYSve35t
	y68cFrCQ/29o1RrH+XFM8ZC/Hj5zLprivNaFAS7FLqCAgsZkp/6K4vyHR3IIqkUVlLjtGdNDuDL
	IfwIyNuHLPIqQTHdpxb/4Z8EIt1oI6iX9FKdg==
X-Received: by 2002:a05:6402:15d2:b0:6a9:c5cb:693e with SMTP id 4fb4d7f45d1cf-6aa36d9c7e8mr5913311a12.4.1789850456028;
        Sat, 19 Sep 2026 13:40:56 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm1615045a12.7.2026.09.19.13.40.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 13:40:53 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843e397f74so806933f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzyC5GcYNpAGDrpIGCnFZ001532VaRfrNDa1TWs8SBrSyTjQcLkadxkhXqXKkWsa2poERYriU2BQoOHag=@vger.kernel.org
X-Received: by 2002:a05:6000:4715:b0:486:62c9:5452 with SMTP id
 ffacd0b85a97d-48713c72068mr16983654f8f.28.1789850452608; Sat, 19 Sep 2026
 13:40:52 -0700 (PDT)
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
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com> <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
In-Reply-To: <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 19 Sep 2026 13:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
X-Gm-Features: AcwNN1XDU4cFXhN4eMaor0t2u3bfL215FENEBSC357QMe8ArSAuq8YdwUeQd-HA
Message-ID: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
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

On Sat, Sep 19, 2026 at 11:32=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
>
> On Wed, Sep 9, 2026 at 11:57=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > > I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> > > tx submitted is seen as transferred. You anyway  don't catch
> > > transmission errors. That way you fill all slots without blocking on
> > > the first message and achieve this same throughput.
> > > Without knowing the clients I am not sure if that can't be done.
> >
> > We need to know the txdone and thus we can't do what you're proposing.
> > In general, queuing mailboxes are used in cases where the remote side
> > enables a resource like a clock or power domain. Different tasks in
> > the system may independently turn on/off these resources, so allowing
> > them to work "in parallel" makes sense
> >
> It will still work in parallel - you still keep writing to the h/w
> fifo without waiting for previous ones to finish as long as there is
> space. Just like you get here.
>
> . ...but each task needs to know
> > for sure when its resource is finished turning on. If we just imagine
> > 3 clocks we want to turn on.
> >
> > clk_enable(clk_a)
> > clk_enable(clk_b)
> > clk_enable(clk_c)
> >
> > Those 3 calls can be made in 3 different contexts from 3 different
> > drivers. We want all 3 enables happening in parallel with each other
> > (not one after another), but each call needs to know when its function
> > is done.
> >
> I don't see why not?  The three requests will be queued into h/w fifo
> in the order they arrive without any block - just as you do now.
>
> Btw, if you mean they need to be enabled in parallel literally, they
> should not be called from three different drivers. Instead they should
> be modelled as one "composite" clock.
>
> > Does that make sense?
> >
> The usage makes sense but I still don't see why existing api can't work.

I must be missing something because I don't see how the existing API
can work. Let me explain in more detail and maybe you can tell me what
I've got wrong.

Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
"clk_spi". The "clk_i2c1" needs to be turned on when we're going to
start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
SPI transfer.

In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
the clocks. The three clocks are operated independently by their
respective users. An I2C or SPI transfer may take place at any time.
The I2C and SPI drivers need to know for sure when the clock has
finished enabling because as soon as the clk_prepare() calls return
they will start transferring.

All three clocks are backed by a single clock driver. We'll call it
the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
to turn on the clock and encodes it as a mailbox message to a remote
processor. Let's imagine that the mailbox message looks like a 2-word
transfer. The first word contains a 0 or a 1 for enable/disable and
the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
"clk_i2c2", and 2 for "clk_i3c3".

Now, imagine that we want to turn on all three clocks simultaneously.
The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
needs to convert those to messages to send the remote processor. It
will then call mbox_send_message() to queue those messages with the
mailbox controller. In other words, we'll see these three calls happen
nearly simultaneously:

mbox_send_message(chan, &{0x1, 0x0});
mbox_send_message(chan, &{0x1, 0x1});
mbox_send_message(chan, &{0x1, 0x2});

The LGA mailbox controller knows "txdone". That is, when the remote
processor "acks" a message, the LGA mailbox controller can tell (and
get an interrupt). This "ack" signals that the clock has finished
enabling. This means that the "clk_mailbox" cannot run the state
machine and it can't call "txdone" itself.

Without my patches, when the above 3 mbox_send_message() calls are
made, the first one will go straight to the LGA mailbox controller and
the second two will be queued up. Once the "txdone" for the first
message arrives, we'll queue the second message. Once the "txdone" for
the second message arrives, we'll queue the third message. This means
that the messages are not being processed simultaneously. The third
clk_prepare() call will be processed much more slowly since it has to
wait in line. If we had 10 clocks enabling at the same time, the 10th
clock could have a pretty significant wait.

With my patches, the LGA mailbox controller is given the second and
third message even though the first message isn't done yet. The LGA
mailbox controller can queue the second and third messages even though
the txdone for the first message hasn't arrived yet. If things are
fast enough, all three messages can be queued up before the remote
processor has even started processing the first one. The remote
processor can process all three messages concurrently and acknowledge
all three at once. The LGA mailbox controller can get a single
interrupt representing all three "txdone" ACKs and call "txdone" for
all three messages simultaneously.

Does the above example make sense? Can you explain how I could make
things work without changing the mailbox core?

-Doug
