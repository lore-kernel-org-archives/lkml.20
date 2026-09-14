Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E26367B8E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357410; cv=pass; b=bsuxjx0R09P3AIGBnV9VE7iL5vnn3aa6DWzIRs6C+czOHcv+L1VGJ7q50bfgavwQU9StVvWBbPeQ3a6446UzZkomedxYbrG6laIuiflglgNflrCnZc39qVF5KzODdMHJIe71f9JbSr4qVul1xTRXSlEEqol+2mWJj5WWU4ITaJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357410; c=relaxed/simple;
	bh=NzSme+R0yXt6U9+wDpheCojyCfR6mbpdED9/ML2VO6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+iQST4hDWD6fENAOGtVQdHs3rRRaikCgLQFNZ0n3Jy40sNjxRLNKmmfDlBP3K3ehzkCkJ+ehpqI7Q5sfmsrWZz38gyjeQ5r7ztkps+5hTuvXpfvDTJmld0vIyx7KKDkg/Jkb6pITjWiuLw9sjcm0FkHvXQB6PhI2nuVIeczvGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=K+/ekxUU; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="K+/ekxUU"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a499a6d02cso20816541fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789357406; cv=none;
        d=google.com; s=arc-20260327;
        b=Juoq6P+HTU/tOSvZ8y+2I3q1S+DstyQuCkZV6L2CQ7GYUEq7CTkliO+2JBphB8aj82
         3soteVUaaRtZPZ7kkhXPZ92XZwd1+9aZC3Vyu5wz0XYxKk/xaRUe2ebgYK+8p/3URkos
         AbxJg5uChiNOPNFdGCEpL1rx4YwCm++fA0MjUTsprd1lv7Q0JQI1UoE6RPgUsVVtvezZ
         vgu7tscGw07TXV3wRDKrg56GnBY288q4nlww22bUmM8R876T68gf+ay0jAaka6xIH/IN
         dguurD2ock9V5ydGE/rk1sn1BOTBxcjEY1IkXIfMv70aNCrXZ83SQcrvpKXPK05EmC3I
         jT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MbVBeRgR/r9NT4m1jsSZaQ9G2ade0FNigfquN4F7Tl4=;
        fh=ejI8O0gOZpR75ClGo6dPotJXYE8zNgslJXMgetMCIz0=;
        b=VDtE5GEy4MGhVPZAt89auZ/JVizRkDtQ/O/cXmN86h5La5yaMu5yt95MoG5W9RmXkp
         4ptYJ0QuHan+SuOfnobv3trrGFd92cxCHOfltGmBj3Idq2AYINdmNV8J/slNHbtbnp8l
         mWGrek8m2lGkTKyJ72JFtrw8aW1aaFG4/6suadJD3XV9erllESToI9zIisGDwo3ii8AF
         PltV3Q9roFueiuDMIzph6GqWZaxbI6GwAKTdJ9TKl32E0RFEJpsm8HgOSQ0p6SE2FJS1
         SJ7XEwpFFwNIs1b+Ljts/Ch3iUblSVbxsOsK68nKoa8Jia57XYcmvkPNRp/VweKM/S58
         DCrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1789357406; x=1789962206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MbVBeRgR/r9NT4m1jsSZaQ9G2ade0FNigfquN4F7Tl4=;
        b=K+/ekxUUM4NaJkHP2HQb0ysQPlHiCW/Og4gnuiujo51Qc4VNuXIkV+rzZ4tVy548mG
         VsmJy05INWOk6FFM4T04Z7Cdpidl8g7h0Bk0yB8WBIO7Ut5YhXc1L0R+ifIIUaAxDUAP
         vvtPy5Kfx/mHF1Gs9fFqENMl4/aASwBH0OqduIGjM8FzlybBEoc73JUMHu5KKSkmzGNZ
         xpt5LrdQQsU8g5KmjgcP64AVc1WawXnIMn4YUP7wxZBbpehqymWsnQ9BnAmMKqzTkauZ
         sIivi5T+3ZIdbkcdIfiBKnM01sKGRtkJ1uRGz+wDWArR3+LrRV0psxVWrYF7nnezC5SY
         V5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357406; x=1789962206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbVBeRgR/r9NT4m1jsSZaQ9G2ade0FNigfquN4F7Tl4=;
        b=n61s9yRvDkbs4zVFK/v3dZEC10jZD1jNgpW7Mv3daG2WmsRWXpUq2FUrZBTVoT1uxQ
         ptgI3FbF8EaC7Y4G0+MCcf7bnkWVo0eD7n5UKik4aI4Zq2phY4SzAdb53eR+MJoPGzOl
         q+Y2Y+FBPcdpFr+5ZNoHt1gMj7kOate5WofAFn5W5c2JZR1aiqoOSBkpoYYAdx4VKLrh
         PoeFzWp/6E69vK74vDF4MoWbugYKqY0HS71wEutF5JXwuiv8ph9l8DTP2bXzrQiNaU/7
         xBtMvYqF3n0p2Q9lD7+FvAF/R2izCmw2sgjC6li9UkiAjRz7R9TVs1FahvMt1/1wAbMv
         cNww==
X-Forwarded-Encrypted: i=1; AKwUvBx/i+exDPsrNb1IodbaFli7otqVx8WZkfxTFX+UT6bpUC6/vivwibz1MMAM5eE9Hgz1LQlt1RVDw7NAQeY=@vger.kernel.org
X-Gm-Message-State: AFuF++nCCjoyzr5D2mYqYt3M9p88orGjBV8+FFbqPRUrOs0PX3gMyejl
	dI8PhRwuSFotsd3Lo+vqMU65DEgnWPQTsTbfALHl+56RM90MzT/jL+PkPhaWptZpp0h/xSojI96
	1P+QABWZUVC8/1JHal1pmEyfF7wdSz4RaF4KG9OtFPdI=
X-Gm-Gg: AYBFou2mj5VW091HN5XMFCpxYa26BNF95b8TVTvYfVAR4TFQYjDNRmW3u5D/l8tPxx2
	2qMaoi5rL7KiqakChIJ9QB+2rAMHls9PBlFkJ3EJsHsbOTbK+X4kCh5pI87Ni+I8NM6iCe6izo/
	ACTN8dcPOg6BpvO0SziI+B8FBxzGo9qshjx+au43S5gaUK9M4jUV5zLnwG3zpq0Ev3xIfY/Jdx0
	bjIq/fcY5fmzEkffvZF/o1hHM2MASqPph9d2RXhfkdkQNqGkfKVORTF0I7Dch1mPV1Wj4SM4/Va
	l6tYfyCro/jtkYCc2+Qos4zEl6Uvyf1M4vo2uqDoqK/YzzlNfAHcgQ2mLQxlOc1Qf0Ff2pHQ3yy
	zBx6zfVdt6kA3KhYQ+Mkm
X-Received: by 2002:a05:651c:15c1:10b0:3a3:7681:6d5b with SMTP id
 38308e7fff4ca-3a5c896638bmr440071fa.19.1789357405821; Sun, 13 Sep 2026
 20:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789302084.git.zihanx@nebusec.ai> <a4f108b00c7d3c0997bfcee84a9e7e481c07ad5b.1789302084.git.zihanx@nebusec.ai>
 <willemdebruijn.kernel.57ad3a4d0955@gmail.com> <CANn89i+QqU5sw=WPrcki8W=-HoyNLpHGj2C568VHDU1CyZgodQ@mail.gmail.com>
In-Reply-To: <CANn89i+QqU5sw=WPrcki8W=-HoyNLpHGj2C568VHDU1CyZgodQ@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 14 Sep 2026 11:43:12 +0800
X-Gm-Features: AcwNN1Vzegn2UprCAGHFpd-fO9Lbw1c64hwiit7IoJ9FqdyY9q9AMmeI6XAJD9Q
Message-ID: <CAANe3eR+zoRupQ0nZREKyqABCV_VwRotK+OLHa_TMzgOOvQQPA@mail.gmail.com>
Subject: Re: [PATCH net 1/1] net: gso: limit recursive IP-in-IP segmentation
To: Eric Dumazet <edumazet@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	willemb@google.com, kuniyu@google.com, kees@kernel.org, 
	richardbgobert@gmail.com, jiayuan.chen@linux.dev, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>, Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:08=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Sun, Sep 13, 2026 at 3:46=E2=80=AFPM Willem de Bruijn
> <willemdebruijn.kernel@gmail.com> wrote:
> >
> > Zihan Xi wrote:
> > > IPIP GSO/TSO support makes IP-in-IP GSO dispatch re-enter
> > > inet_gso_segment() or ipv6_gso_segment() for every nested IP header. =
The
> > > only state that tracks this nesting is encap_level, which records hea=
der
> > > bytes and has no recursion bound. A sufficiently deep chain can consu=
me the
> > > kernel stack before a transport GSO callback is reached.
> > >
> > > The unbounded callback nesting was introduced when inet_gso_segment()=
 was
> > > made stackable by "ipv4: gso: make inet_gso_segment() stackable". GRE=
 GSO
> > > support predated that change, and IP-in-IP GSO/TSO support later made=
 the
> > > affected path reachable.
> > >
> > > Track the number of IP GSO callbacks in skb_gso_cb and reject the 15t=
h
> > > callback entry. Thus 14 callback entries are allowed to complete;
> > > GSO_RECURSION_LIMIT is the rejection threshold, not the number of
> > > successful callbacks. Initialize the counter for each top-level GSO
> > > operation and check it in both IPv4 and IPv6 handlers so mixed IP-in-=
IP
> > > nesting is bounded.
> > >
> > > Fixes: 3347c9602955 ("ipv4: gso: make inet_gso_segment() stackable")
> > > Cc: stable@vger.kernel.org
> > > Reported-by: Vega <vega@nebusec.ai>
> > > Assisted-by: LLM
> > > Co-developed-by: Luxing Yin <root@tr0jan.top>
> > > Signed-off-by: Luxing Yin <root@tr0jan.top>
> > > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> > > ---
> > >  include/net/gso.h      | 9 +++++++++
> > >  net/core/gso.c         | 1 +
> > >  net/ipv4/af_inet.c     | 3 +++
> > >  net/ipv6/ip6_offload.c | 3 +++
> > >  4 files changed, 16 insertions(+)
> > >
> > > diff --git a/include/net/gso.h b/include/net/gso.h
> > > index 29975440cad5..2665acbb9205 100644
> > > --- a/include/net/gso.h
> > > +++ b/include/net/gso.h
> > > @@ -19,10 +19,19 @@ struct skb_gso_cb {
> > >       int     encap_level;
> > >       __wsum  csum;
> > >       __u16   csum_start;
> > > +     /* Number of GSO callbacks this packet already went through. */
> > > +     u8      recursion_counter;
> > >  };
> > >  #define SKB_GSO_CB_OFFSET    32
> > >  #define SKB_GSO_CB(skb) ((struct skb_gso_cb *)((skb)->cb + SKB_GSO_C=
B_OFFSET))
> > >
> > > +#define GSO_RECURSION_LIMIT  15      /* First callback depth to reje=
ct. */
> > > +static inline int gso_recursion_inc_test(struct sk_buff *skb)
> >
> > What is 15 based on? Is that where in your test stack overflow occurs?
> >
> > A realistic practical limit would likely already be smaller.
>
> An alternative would be to limit total header sizes (nhoff) to 256 bytes =
or so.

Thanks for the feedback.

> What is 15 based on? Is that where in your test stack overflow occurs?

No. The reproducer uses a much deeper header chain, and the test did not
establish 15 as a meaningful boundary. It was an arbitrary callback-depth
limit in the initial version, so I have removed that approach.

> An alternative would be to limit total header sizes (nhoff) to 256 bytes =
or so.

Following this suggestion, I changed the fix to bound the cumulative nhoff
in both inet_gso_segment() and ipv6_gso_segment(). If nhoff exceeds 256
bytes, the existing -EINVAL path is used.

This bounds recursive IP GSO by cumulative header size rather than by an
assumed callback count, without adding state to skb_gso_cb. The 256-byte
value is a practical upper bound on the cumulative header offset, not a
measured stack-budget threshold.

I am rebuilding this revision and will rerun the reproducer against both
the fixed and unpatched kernels before sending the next version.

Thanks,
Zihan
