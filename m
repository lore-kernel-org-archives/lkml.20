Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D673164BA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535335; cv=none; b=bweSEdJPUbwf591hQVtZoPwKGbEfeCFtgJteZ2Mlp4DhT2Xlvznygoa1IXFutW/NPYNcBtGZ9xZzvW/2EnfaqpFNVF/MX39nib/TBPsPcQUEhJEFu84bCnzz2npSu93vlNAY2smMQov5eThxiyzdjGD/v1MUSjb4KS0cQI9yDjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535335; c=relaxed/simple;
	bh=iQjeIeuE0TrRXjzq/4BN2JXwMS5sWSC0KsOOoHnJAa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGYGethdzn1F0ypxp6MA6BfPLU5Lzn+8neA76rUhojFTzgXcbbdyG+SQ4JO4V5qqdMtZRAzVW3Mhj3QD3HLSLaHYg7jcBnq2eicjBWKRG3i82DiIwOtEx0mWXpdr6h9NLk0xwUtijceLpQoig8sEUPHoHS6dTbBwoLhe9+HPzgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kE7nOjec; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kE7nOjec"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso839934566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791535331; x=1792140131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=kE7nOjecHuI+708da0BhmfuEPBdPZCsM2QJRIB443rwzIWcfcqKO/P7IH0wnnNddb0
         wnYAzs4NjUSoV9YyumrskoeIg9NnLpwyZ1WW/srLOFAMrn5fIbEvNQLo5I1+InaG3UJQ
         1TqwV/lRknJpM4egU4OgCN0vZJu9uXRbOvxho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535331; x=1792140131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpL9JdRnQWjZohyDj5gd2hk16XdjjZ4+ynUw0iwS7Uk=;
        b=q7vOGMYVNBYA4WzL+FyMDCJjl8R9oRw6XA/BDNPYOU1AYXJdwa+oTI9sZlpvw2oGxp
         QZMwspx6jlD1WSene3WPdJKMnZziuPNBdsRl2/jNjWzJ7fT2RDGV/VOw7QCybEZsx4KD
         5gfS1bCYT9MOQ3NZs9ctYivTd8/v2rai/zELJTryvu1aXluxPOgAaJxSkbSP+svyKLKF
         VboS6L53AUCUynpA4UV+S4hXrDtSYiS6uc8BcIrw6Kr99bzOZiX7BVI1FPw3wHtoiKEX
         GkwsY+IxRLE4XMB4RSJ3eXrcF1GPqHdPCImIYeTncW7Jvfd10XWBLIG3GodaS0PbquSH
         s4BQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0TQpOgtFxO5d85qdd6fUUniTi6GIxWohq12ZVaQse+uD+x93UkzWrPvCtJzJ7xPilCPevCB0eOOfkJbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9E2etmXDjqJXp9aH7gxLZDyH/5kFM/dsCKShjaNwemOyvH+s6
	V2MaOHBeAt17AmuaJNf+aCnE42W9y7sFwNavGivmQTlW5bFL6ttSocXz2s3TAz4usweCgpvHC4f
	40TcHaA==
X-Gm-Gg: AYBFou3eNv89+FEISoRIwByWEj1LcmJ74UCq3SI2TwvkxADj/bE4W+eMcuEDfBna/ep
	TBUdbqo1iS9TFWYbvGlDnnp8NU8ZqX05dN61uM5KDs+c6dL50KjWkegIC7JPBFGWAYLCWXhk5U3
	+QNwMx58e8AUYWP9/t+iXYnrZ+N4IFW06HbtegkRaM886wU4kZWqaz3LLLmkrlx4Wv50rk+YKzL
	E/ZocOmg1769LDhoj5qllv7mzsHL3/0VAssTv82q69nAzLE0Ej43RdxazGJf0hWqXlfgFJ2/z4a
	JxgoB4RmtePMWc8WX9x8/G9HwA5VlchxD2Kr3PhA7ETxfClMkTPyy8cMsRIRm8oJ3iO2DiUu/6C
	3cEY3ltIe60Zd5RbQDN/n29SfOBI0T3ijvgUxFKMAyiJOWeWfCXLVmo1WwIsU7kVCTLbw1QlrTs
	Qm5H6RT0BdEPoO4Gd/s7gem67q0KarQb8ThctZGm5pwHwNIRWpTS2J61iPI2fEQPZnZd+Uk4Opw
	EWNVc+sn1We8fvPUJdzPAA6AljxLZpUWRVJPQ==
X-Received: by 2002:a17:907:94d0:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c31aa0ac6efmr121428366b.38.1791535331334;
        Fri, 09 Oct 2026 01:42:11 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm63994566b.24.2026.10.09.01.42.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:42:09 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so59846905e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZQxk/EIKFBjeG3tCnKEPlr+iFrrStp8JAaU+thigvD7uDiWZYr0jeNnK2Y2xksc6rYAARrPTh8iUJIGE=@vger.kernel.org
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a18e4a3f69mr19100085e9.14.1791535327953; Fri, 09 Oct 2026
 01:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
 <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
 <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
 <CAD=FV=XGka_QqGt5iK53vU704ZsvCrXUWvJ9ewo1=TCiepfz-g@mail.gmail.com> <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
In-Reply-To: <b1f088eb-7c77-4079-9b05-20729fcfd612@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Oct 2026 01:41:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
X-Gm-Features: AclHuK_I9OeBRY02WEee3vuFJa_eA7foPBEu58USBohXW5y9EM2eolVWe-MVbbg
Message-ID: <CAD=FV=VSSEZykDpu48XVwDzNWKAhZjsPm3PNweTqeHv_DxiykQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Joonwon Kang <joonwonkang@google.com>, 
	Subhash Jadavani <sjadavani@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Lucas Wei <lucaswei@google.com>, Brian Norris <briannorris@chromium.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 8, 2026 at 11:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/09/2026 23:34, Doug Anderson wrote:
> >
> > ```C
> > static struct mbox_chan *goog_mba_fw_xlate(struct mbox_controller *mbox=
,
> >                                       const struct fwnode_reference_arg=
s *sp)
> > {
> >   int i;
> >
> >   if (sp->nargs)
> >     return ERR_PTR(-EINVAL);
> >
> >   for (i =3D 0; i < mbox->num_chans; i++) {
> >     if (!mbox->chans[i].cl)
> >       return &mbox->chans[i];
> >   }
> >
> >   return ERR_PTR(-EBUSY);
> > }
> > ```
> >
> > Then the client loops around and requests the same channel over and
> > over again until it gets -EBUSY? Like:
> >
> > ```C
> > for (i =3D 0; i < FIFO_MAX; i++) {
> >   client
> >   chan[i] =3D mbox_request_channel(client[i], TX_CHAN);
> >   if (IS_ERR(chan[i]) && PTR_ERR(chan[i]) =3D=3D -EBUSY)
> >     break;
> > }
> > fifo_depth =3D i;
> > ```
> >
> > I _guess_ that works, but it still feels like a bit of a hack to me.
> > You said you were worried about people abusing the "has_queue" API.
> > The above feels like it's abusing the "fw_xlate" API, turning it from
> > something that is normally a "lookup" into an allocator function.
> >
> > +Rob, Saravana, and devicetree@vger.kernel.org. DT folks: is the above
> > something that looks right to you?
>
> There is no allocation in your xlate code above, so this is not that
> terrible as we talked on LPC.
>
> >
> >
> > I researched whether other upstream drivers use of_xlate() /
> > fw_xlate() as an "allocator" like this. I did find "exynos-mailbox,"
> > which appears to be doing something similar. However, upon deeper
> > digging it seems like "exynos-mailbox" isn't using this dynamic
> > allocation for any compelling reason. It looks like, really,
> > "exynos-mailbox" should just be returning one channel. The client
> > (exynos-acpm) could just use the same channel for everything since:
> > * It actually gets the _real_ channel ID out of the data.
> > * It doesn't care about txdone.
> > * All it does is ring a doorbell and there's no queueing.
> >
> >
> > In any case, if using fw_xlate() as an allocator is truly the only way
> > to proceed, I'll finish my prototype and send a v2, but I'm still
>
> Why fw_xlate() would be an allocator? Can you extend your code to show th=
at?
>
> I think doing any allocation in xlate() is calls is fundamentally wrong.
> These should not modify the state of the device, so no allocations, no
> device_link_add() etc.

It's not _calling_ an allocator, it _is_ an allocator. It is walking
through the array of channels and returning the first free one. Then
that free channel is "allocated" to the client.


> Why? There is simply no corresponding xlate_destroy() call. It's also
> confusing, because the meaning is to translate from one domain resource
> to another, not perform actual resource allocation.

In this case, there is no leak because it's relying on knowledge of
how the mailbox core will be using fw_xlate() to finish the allocation
and then relying on the knowledge of the mailbox core to free. It
works like this (simplfied, see mbox_request_channel() for full code):

```
scoped_guard(mutex, &con_mutex) {
  list_for_each_entry(mbox, &mbox_cons, node) {
    if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
      // The below "allocates" the first free channel associated w/ the nod=
e.
      chan =3D mbox->fw_xlate(mbox, &fwspec);
      if (!IS_ERR(chan))
        break;
    }
  }
  if (!IS_ERR(chan))
    // This finishes the allocation.
    chan->cl =3D client;
}
```

Said more simply, in the mailbox driver, there is an array of channels
associated with a given "fw_node". These are "allocated" like this:
1. mbox_request_channel() grabs its global lock.
2. The mailbox driver's fw_xlate() is called to find the first "free"
channel associated with the fw_node (a channel with no "client").
3. mbox_request_channel() sets the "client" field in the channel to
finish allocation.
4. mbox_request_channel() drops its global lock.

Does that make sense?

Is that a design that looks good to you? If DT folks have no
objections to that, I'll send a new patch that works like that.

-Doug
