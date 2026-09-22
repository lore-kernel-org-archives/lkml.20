Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A485540A0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092893; cv=none; b=BMZXZGIgKA16nBnWKZ7a0yO02ifo+bHgQ0cusEoamLH/uURDHkda5Tu4WTlK+Ar4hrDomPIl8JxrYbs0JmRbonpaU40LaAUIC59g9mmR7dc5EX07/5TXmm7Hcdq0wC54wrHURxvPCTvNMw8bmHyzHQaFMEaqvSNXeap8ZALoDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092893; c=relaxed/simple;
	bh=oDUI9K4i6Hsvd0l2k00UtldUQ3IBCZSvk4sLz5OcGco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V033mFjjzSucrXbSdqmvUdkVq2jP1u6Rlo4CRNfScwoBOVmWuyj/0qRB5FREZBV2ZrU5u14TwzVhHqg0onhDi3Fux/HY/xZa7vh75xPzLaIGkdcNA3iendRWDmsN6znVBXSZ1Ziu11USbf7pzi0y6ULtC9PMtC121L3R/hBdtRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eocXqIR7; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eocXqIR7"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso3135624e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790092890; x=1790697690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=eocXqIR7Pulg8uE6paLR5WxyMJv+fM9rwCoIPCplL2vaF40MBtQS0tNVVr/BD43+2e
         PC7i99JlF7V2s+2GS53i1EKuWdK5hue+J0wRQHDg2C3o/EQnPqa4UolM4fxrKlYtyriY
         mWnLYFbtT5esgavgfw3H/WJN+zz4boeTwv2iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092890; x=1790697690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNz/wDlgUriHqoN/KacvxVQ0rGGEt6RX29bmdR2Unq4=;
        b=pTMTxd94KMnVMEVqeyUCm/KiW4uet4nY3MH+SijAh7HBEmPhZwSXgx27Sixo5Kjm4r
         9vnPbDcEaTsUL5Q0da69K/QiERVnHCYXu+tImC+HrqJ9GlHPmwmIl6eEgzJt7UzJlVB8
         VkuqoEgGNLYyLUqe87aSS119ds4DdX7RdgrHNRDNuX62NvZH/SnJmAmaLJn0mnuP8kZp
         5q7ogoTTFOD95anozuWaB00AXkoFDpsqSEGMcyqoRdCX+MowG5Mg7JXEjnho8jSS4dWz
         ExP37y2dxVdIwhv/DX4s5uMTfkOqSUAFJ/UeMCP0Gf9cXE1HtSiqIMxLs+r4GebDL5Q1
         X5DA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ZN8AF/Ri/iKZ50A1/YFUMXbEB7YIpnVWzha+1JBYgE2Z6qmMSgef8TqFmQHLS8KFazdf0oLIcnR9B9k=@vger.kernel.org
X-Gm-Message-State: AFuF++mXKaS+hmCX6H9R7t/dhWXN2kEmnlULK+RdgVZ0skQNJB0BsQy5
	9COWLilr+6iFlICsqUL1qnE2khiPzQAKaaQ5ni8CuqmpIcVFHJxbSBjOm0Ru+uXSmI+F7V9mleJ
	ppG0=
X-Gm-Gg: AYBFou3C7SC6f4lla6Bb6RcZvy9/af8NLBeX3SwHEFWpFP2LOq73J7Mp+/GO1RcQ0Yb
	is6cv2pmRTCqxMVujPvaEx4H4vb9VkrNCFMWb1r9CT7a0jS4Tj66MN4E+Kw0YsiZpFZAdW3g9E8
	I4oyMGbmXPh19LOMwDHFGEHa4noeJ0QCTuupjlPNsQ0/uWrsK0fl7aAFCr/M/eNBBOST7SpVreK
	anrEQ7Tixn2qib16BFsOkA0P2wP1t6bs+bCmVo5hGYScqp0ZD67up1ACHW8m5U/mcuZrdNpFB90
	admmi6AVS7Q9epzVwHnegVaIk3CP3j2Ym7PwfP1UJ5re182xgadBZrXRHIBUYN/CAKey6HvX3PF
	gYmLp+bJtQtt13gHg/A9F+VyAE0wDGavnTNIFdweHJKVTrsV54I8gqk2jS+WxgBzdX/bUHrYncm
	XJPegEz2KtLUKelm2T23iF/fEAL6ROcVRbNRjt9t9zSd9D8/ScO4xXoN9EH2ju1evJmT0r9+azE
	Tp01VUgTOWRIBXZLxuAGZsIxy/5UmEGfzaSzZH/XF7HYhXD5g==
X-Received: by 2002:a05:6512:3195:b0:5b8:bc5e:b57c with SMTP id 2adb3069b0e04-5b8c1952cdbmr5053502e87.52.1790092889535;
        Tue, 22 Sep 2026 09:01:29 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm1275e87.82.2026.09.22.09.01.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 09:01:27 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b74e0c2e4dso3987010e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnzK98Hz8mQX1yhptQZvZ7zFia717tN7eK0T+eNx/VDuPkbGBPvHn8nsdwEkFJKgpg7d5nVuMwPYUR/yk=@vger.kernel.org
X-Received: by 2002:a05:6512:33c6:b0:5b8:bc5e:b577 with SMTP id
 2adb3069b0e04-5b8c18524cfmr4607284e87.47.1790092884382; Tue, 22 Sep 2026
 09:01:24 -0700 (PDT)
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
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com> <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
In-Reply-To: <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Sep 2026 09:01:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
X-Gm-Features: AclHuK9ya1QMn_ceGlLKarlnG-Ztmeo8rReIvHR5PtOBYGFh5F04B9XoOov-3rs
Message-ID: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
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

On Mon, Sep 21, 2026 at 5:11=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> > > If you do have some real numbers and think it is worth it on your
> > > platform, then maybe expose each doorbell/shm-slot as a generic
> > > channel. clk_mailbox will request a generic channel, do the request
> > > and free it. The same effect but without inventing a new api. I can
> > > share a draft if you want, but I suggest let's not make things
> > > complicated without proven benefit.
> >
> > FWIW, the downstream code in Pixel does what I think you're
> > suggesting. I can confidently say that, while it doesn't require
> > changes to the mailbox core, it is much more convoluted and
> > complicated. It also bleeds into the device-tree representation, which
> > doesn't feel great.
> >
> > Just to be concrete, I'll document how the downstream driver works. If
> > this isn't what you were thinking, please correct me.
> >
> > Back to our simplified "clk_mailbox" driver. We'll say that our
> > "clk_mailbox" driver talks over a single mailbox to the remote
> > processor. Let's say each message is 4 words big. The message space is
> > 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> > queue slots. Downstream represents each of these queue slots as a
> > generic channel. That means that, in the device tree, our
> > "clk_mailbox" driver looks looks like this:
> >
> > mboxes =3D <&cpm_tx_mba 0>,
> >          <&cpm_tx_mba 1>,
> >          <&cpm_tx_mba 2>,
> >          <&cpm_tx_mba 3>,
> >          <&cpm_tx_mba 4>,
> >          <&cpm_tx_mba 5>,
> >          <&cpm_tx_mba 6>,
> >          <&cpm_tx_mba 7>;
> >
> > Then the "clk_mailbox" driver is in charge of rotating through each of
> > the channels. First it writes to channel 0, then it writes to channel
> > 1, etc. This works with no changes to the core, but...
> >
> I was thinking something like   mboxes =3D <&cpm_tx_mba>
> clk_mailbox simply asks for some channel, gets allocated the next free
> slot. The mailbox controller driver keeps track of the channel-slot
> map locally and is responsible for managing contiguous slots and
> completing the tx upon receiving ack.

Hmmm. OK, so I guess you're saying that every time "clk_mailbox" wants
to send a message, it calls mbox_request_channel(). It always requests
the same channel over and over again, but underneath the mailbox's
fw_xlate() function returns the next distinct channel? Then once
"clk_mailbox" sees the tx_done then it calls mbox_free_channel()? I
guess it would need to fork the mbox_free_channel() into a delayed
work function since mbox_free_channel() requires grabbing a mutex and
tx_done() is called from atomic context. It would be up to
"clk_mailbox" to ensure that it used the interface properly: always
send the message on the next allocated mailbox, always free the
channels in order, etc. Also, "clk_mailbox" would still need to
implement its own queue to handle the case where there were no more
free channels.

One thing that is important is that "clk_mailbox" needs to know when
"tx_done". If we didn't need that, everything would be vastly simpler:
just allocate the channel, send the message, and free it right away.

Did I understand your suggestion correctly this time, or am I still
not getting it?

Assuming I understood correctly, my thoughts would be:
1. At least this doesn't bleed into the device tree, which is great.
2. I'm a little worried about all the overhead involved in constantly
requesting / freeing channels. Maybe it's not as bad as I fear, but
those functions don't seem intended for constant calls. Even if the
overhead isn't that bad, the extra overhead needed to fork the free
call to delayed work doesn't seem great.
3. It feels like trying to manage this from "clk_mailbox" is going to
be a bunch of complicated code, including managing our own queue since
we still can't use the mailbox core's queue.

Overall, it feels like an bunch of awkward code. It feels like a hack
that a downstream kernel module would do simply because they didn't
want to improve the mailbox core...


> > I'm also a little confused about the resistance. I don't feel like the
> > mailbox core change is that complicated. The diffstat shows 58
> > insertions and 17 deletions. 14 of those added lines are comments.
> > While we certainly don't want to add useless APIs, to me this truly
> > seems like the correct way to add the functionality. It also doesn't
> > seem absurd to me that some future mailbox controller out there will
> > also support queuing like this.
> >
> It is not the diff stat but about inserting a flag in the api to
> introduce special case behavior. It is like adding one person to the
> party introduces N-1 handshakes -

Sure, it's new core code for a single client. ...but some client has
to be the first. The idea of a mailbox controller being able to queue
data doesn't feel like an absurd feature that nobody would ever need
again. Heck, once the core supports the feature it seems like someone
out there will figure out how to make their existing hardware work in
"queue-mode" and improve its performance.


> the has_queue flag doesn't play well
> with other configurations and may allow future platforms to abuse
> has_queue to implement hacks.

I don't really understand this part. Can you give any examples? How
does "has_queue" not play well with other configurations? You mean the
fact that my code right now only works with "MBOX_TXDONE_BY_IRQ"? I
don't think relaxing that would be very hard. ...and sure, people will
implement hacks no matter what API you give them (the "allocate a new
channel for each message" might qualify as one such hack?), but it
doesn't feel like "has_queue" is especially prone to abuse, is it?

-Doug
