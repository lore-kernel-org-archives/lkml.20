Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AF54CF5B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923435; cv=pass; b=R6TZ5J92VVC433zaOZ74zyN6Z0xhmzMJu506C0SFjs2vpo2Y8ZRiPV+RtsjLcLoslbTXq6+o22C1Arm51MCklOClCt5kYo4KAgJQxopLgvu24AoSD5bG3u9DnhqB/goWWiQU2cTDeh5ZMe8h4jOn8Vm3GOWiWbjxI0bnWXSJhrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923435; c=relaxed/simple;
	bh=v91tamJ4lur5vC0yoc8PA+H+9sgMG/EoWrw7MxUej9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTDbaf0UPIRjCCglMjEqEFoIVWiLu5RCaEsto6MZp9zGWnC44g1r/vTPRl8Y2bTFFwxGvOt+S/Cl47bNOBr0z72c43ueRVT1P47vTSxxS9mSE+vVb/ecQVtgjPNMpVsSxK61LZzPoD6gTRyH9kJVUZ5uDYU6Kxqu1gaBYAZ7mY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed+1qaVa; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed+1qaVa"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6768403e9bbso2894216d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791923432; cv=none;
        d=google.com; s=arc-20260327;
        b=bCzL1Zitc4o/ynjj/MCtss12QCuV5iROcl37csEdZmUfOTcAHnrkHsAp38hVHlUjH9
         nqvCpv2ETTP8ZD07hH6OA2vSmhmDcVUngjUps2kp8YyNjg3nrgNUFMQ2DEyav7CEgIQu
         ptLbjuFUoJhm8UT6DqHfjHAr72B3ztvELoxEQ8fslt5wacoAR2ngXEyEkHuawq/onM1f
         FVhTHn/dluEQAPnFIDNHx+6UJlwi3wslO7K066JfdwKA7ykRH2c6cbIzVRQKmqgMm6c/
         gS0Fd61KWpoL7TDhYZLUB+76OQXLJxeP/KELstFlvuMcLgzg8tNf6rPmNyFqbpWSZjEB
         n5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZ4+EgAKfEgLHQ/9kN3KZ8YlHNWXSOHDiqf8U2cJ1wI=;
        fh=xUjVHpEG/0TAhWO+1ScdyHFV3B5kHFIuBKJZqFqhaY4=;
        b=sjIie5a9F6YzmdHmFA7ElF8lVW1HyytlcHzkTgKTySIsAFqaE+h5ADYlK1OAyAnCie
         sWli6ukENfUPJb3gK3Cd2Z6A4jYKhZ/6d1iYjsE9jOB24yuRU+DYJGbKjS2oY5BxB8Hj
         HbytXoujdYLWJrccoEeFwK+uqsQ6brW/mxGydqYq2Qt01zptZsnTBkaPzu3UNMkWjvEW
         Ryj5GwWMgm180VLvFz0BslglDgy7LYYXIK0feFKBmQ8iZscaFrZEJv2PWD0jyztsk5Zf
         JYbdCj9AQtX7b5ghQXUwMARxLUcIcrJRX28eCyAWc0I6Mbsyipf1qDjO8qZmV5KgAjxp
         7Fkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923432; x=1792528232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZ4+EgAKfEgLHQ/9kN3KZ8YlHNWXSOHDiqf8U2cJ1wI=;
        b=Ed+1qaVaGn5WpDpxp7/MtEsSsOhTd5Vpx5iiugmH5Lm/M63T7wsYQamvCr03bmFaAO
         yN4efmHsH6C74ZygMWp2JLm9MRaW7csnrI4gaaL8CVEG24YervC4n0VljzCpU/Np4s5o
         CAisxRClYZsrLQWwOMxNVRfUnjMmBckYYLQ9n11bFNICvhnMOxriPJOIi2tDJTslcy0p
         f1mycOT1o6+3rxEUQCadljkMIY2r02nrknvJArXSEpFTbu6c91yNY/2upy8rj3nBHoXY
         ueI8L3m2r/JD5rXhXOyUm5gWTehr83+BAnfGHkjqE4RvVidANLz6twctvDw5tOt34VKS
         OrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923432; x=1792528232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZ4+EgAKfEgLHQ/9kN3KZ8YlHNWXSOHDiqf8U2cJ1wI=;
        b=ILqDjt1FmsvmkxtR3UY41vPKDrn+i2OhcYb3ineEw0Y8NeGGrv+D4xA+OdjbuPt+CM
         4hgvNTHZvTfDpvSEo4+7rwIzGAzHanjcK6TSg4ZRgCxeM+RN9U8apRHTguZqzFwzcsjC
         PNB6E93ehXbVOF8jNaaorKl+wppAnKJywpI1S/+06+RXpwp2Fgcep5np08Bwdjlbtc1h
         Ys5BDseGuhgTLazWbx48CIBY/YrRuIdW19CLv3ZkPc4drD+3LXC0uFqk5Iwzlku9d4VS
         N06C93IOt0unT724EaMkXRyvMQQf1MspZWi86XdGqFWRslnCLYEGLpSIJekdcrivC6N7
         1JBQ==
X-Gm-Message-State: AFq9FYJYEQTBXlgCyQOQNMOEgRc0aWsnreOHi7oaHyh2F4TGMmx+iRXR
	0I4kASHHnhKGrKGsWfx9rc6R7Vj9KjZgMiTInZisnhG6ran/p4ucmWsmHlyAOULez392u+mVXk0
	fM1KetQXlxFQAfz5ewOp6kkg1sPOSupw=
X-Gm-Gg: AYBFou1/J47oPDAw++ej0yR5PO/vyrq085BxXtSjNB5Bzd0RJFe0Qi0SDsvOM50osn6
	iRq6C//ZL73XGAVQCdctTvaB6TUcUAHhRA476Vz/ZXKpCK8B9Bl6/rlAwSx3HGO1ezzayGH+379
	19D6DIuAeG/U30rXBPOQ3LEO53CExlGCGLG3FaQdjV8KQ1l/HdS5bT+ask00PSvSUr0Ehq7psOq
	dWLSnIyrAEcXruA753DP3425HW9K2dxxuUCSXIUtKBuM9WszHuyU3fhM/Um2wvB1EQDNHXGpVJb
	9dGrUyJKTaktZvfKgRxzif+tx9gOm5yDvxTolnHMkp++f1vbmyktCfL7KHqMkjifPmi37CkEh7z
	Zo33Jx7NJFFNJIKKO4hvEnDGJr4dHoPKxybOv700e
X-Received: by 2002:a05:690e:4148:b0:674:cc60:9ac2 with SMTP id
 956f58d0204a3-679369ed352mr4676766d50.46.1791923431579; Tue, 13 Oct 2026
 13:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com> <CAF=yD-JhTbmYmHUkkruPcyvSWv0QhVeGWC=K=ZvvpMdkzA-jig@mail.gmail.com>
 <20261013143716-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261013143716-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 14:29:53 -0600
X-Gm-Features: AclHuK8wZI7uIJlX-2etJDs8Vk1Tx42gw4A7NIBFItdYxL1q3Y6FeTRL8Oizybs
Message-ID: <CAF=yD-LLNm1K5r37-y2thyvLJN58ruffUUHy-6BUh1CGVmep0Q@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] more virtio-net csum hardening
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Paulos Yibelo <habte.yibelo@gmail.com>, Chris Arges <carges@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:41=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, Oct 13, 2026 at 08:41:19AM -0600, Willem de Bruijn wrote:
> > On Tue, Oct 13, 2026 at 4:58=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > Allowing untrusted hardware to specify csum start/offset for
> > > CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> > > outside the actual checksum, and depending on the setup, the networki=
ng
> > > stack could be looking at the packet both before and after the edit, =
and
> > > seeing different results.
> > >
> > > Previously, commit 6785011f8b16 ("ipv4: validate checksum_start befor=
e
> > > completing checksum") validated all known instances where this
> > > causes the most grief, but the real fix is to make sure
> > > that either only actual checksum fields are ever edited,
> > > or the checksum is completed before the net stack looks at it,
> > > so it is always consistent.
> >
> > +1 on the general approach of performing the checksum offload at
> > input, unless the input can easily be validated to be one of a few
> > common protocols. That greatly reduces the risk vs my previous attempt
> > at trying to drop.
> >
> > Since we do not know the full extent of grief, I think this too should
> > go to net and stable.
>
> I think it needs a bit more testing to be frank, I do not see it
> wait months out of the tree. So if this lands in next before the
> merge window, we are good I think. If we miss that I will target net.
>
>
> > That would mean initially a single patch that
> > touches as few files as possible. The helper function in
> > include/linux/ip.h and conversion of existing open coded parsers to
> > use that can follow up later in net-next.
>
> I don't see the value to be frank.
> What moving code between files accomplishes, I donnu.
> Squashing things surely makes review harder?
> Does your backporting system really struggle with trivial
> dependencies like this?
>
> I can drop patch 2 and will if I am targeting net.

Good. This is not about "my" backporting, but upstream stable.
Refactor patches do not belong there.

Since patch 3 might have to be backported in the future if a serious
abuse surfaces, even if you now land it in net-next, it is better to
not depend on other patches.

> >
> > > This basically does this: checksum at ingress, except in a narrow lis=
t
> > > of specified known good cases.
> > >
> > > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> > >
> > > Michael S. Tsirkin (4):
> > >   net: add ip4_parse()
> > >   net: use ip4_parse() in receive validation
> > >   net: resolve uncommon partial checksums at ingress
> > >   net: account for ingress-resolved virtio net hdr state
>
