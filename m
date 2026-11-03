Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696491;
	b=jHS0R8PlZGci0IqZ18cianYd4mMRvOEy8Q69Cbe7vP78fO+KrPxhdPZ1UU2Hly1+LYiS
	 qFRTnRTvyUFcZlyM30DsLS7++fChJOYP5nKan61dYARduyxQy5ULyXD/iAjQie62p5UXd
	 7PPvAVHO5liolJxSWlMDnVbM6by2jut+yQH7of8zTBWQhrOXugz/HCrJqgmDyUADDnGhB
	 FKwpE+RvYK8Mqci52VeVgc0dqtUHBwxfSi7yohqRxKNLPVDob1Oz1nndBqDRt4uo5pazS
	 jqy+V7Nnog2oimjmlVBaGzTS2dShgq9btmDW1qIlSQuxO5OpYyULwartSyZt//CDIWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qYbRMmxVJ6Ai7MVgLLIiU+xvn6br7SPlP+s7GBabEOw=;
	b=0kyYxMuOXrYbII012/HNyaVDgSPpF5iabDEdpISUaKrKF5wvI6autauFMpttwrVGZbKv
	 e4sJrRLNbowcA8zyBUWPPYU0Z1h6HrWz+67TWjfjTaxW8FUIi+mFTj3s2COaRlGf6Gwj0
	 gOP2mflvcbuFwics146zHXGRHmaEPAaNEq2CRrq4XIJQ9nveGXHjgjGrqoRpSn5HaE8bi
	 egS796g3EnaAUKPhzQmAniJkR0nG7NQ58J/U3MAUEUrZi/dui9RGpI02+sLWlta8Jfo8p
	 Ci8Wgd7nkEA9L9iD0b/NYAzknqaVSndMnZk2yWu4sw2aTgJUcgd0ECBxAEBhjtyvtOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrKmuSDD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BAC606D810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BAC606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qrKmuSDD
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-714d57774d8so2558202eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696490; cv=none;
        d=google.com; s=arc-20260327;
        b=sobtEJEpu9rvc8bkZyg0f3RG1hPehx9txNZtNbLn81/4X2BpFGZorSZQ2MQwUBz5oB
         OIRT1tyDxyfXJw7TR3HaAaPXSmW9zjIwow15vb3AGnuVLOvFuMGE94BhTZJoNstCwYaa
         7a5xwe3XiJKb5x1dGwadH+KFBfMZY7TH8VkR4Qz8zuumWRLr3rhMQigDSMnzruxWzCiJ
         u1GC99jhqpuG+/rIqUtf+pfWHR5+xQ+26GZKqqzd76V0zPuciFDJciNKqE7KJgDCScQv
         w3bNusPIs9+me7TPaGU/9ZAoU4In9GBlro4oYu31fiKL/h+PzVistKm+9dUOPr5bxgA0
         sAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYbRMmxVJ6Ai7MVgLLIiU+xvn6br7SPlP+s7GBabEOw=;
        fh=CgGDwBWEdNGwdEbQEDTAyIoyU69nlkAx1wqpELmDeM0=;
        b=IFJ+DJY7hND6ucms+Le6aMD0K/TYEF4B8UH4z+BCRrJaNw8qtqIUuKskGgtSr9KXEB
         m2jvz9Zf3ysRRu5J5wk3794plyNOrP/+aVCP+NiHCUPJZ3M3aLpOEpAcE87JO51oUXju
         S2/YDeI8pUWBaUpL6yvEdGE61zqEk2iPdM9kY9VoI6SIXCwHqsqsaFTQPt7aQ+tfodoB
         9O1jI4N5AockKgNUSPd9UH9idpsc8xF1hcPkwx0bBG6sM/5zqBxBP5vLKFWgc5Tfqz2M
         3i0OQeftTVJJWnEfEzRPkPAmpda04c9ZxPGjYA+ku1S3mHWqledHS4Sw9u80Ln9Ze94q
         +LZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696490; x=1794301290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYbRMmxVJ6Ai7MVgLLIiU+xvn6br7SPlP+s7GBabEOw=;
        b=qrKmuSDDEXhLSRkpiLjzSmQyY8AtMfFBXIASCbwUzBbMQVqgm90htCgYp8eRTnxjHW
         PjZGEIqVDI5BmgrsZHF8zdczDxH31f5HlOXtMGDw4JjPUv3QvC6CJF/vdiS23ozylhud
         PkCNRFX8v1xQzQlatpmMDeaH8h/0fHVvCptNcWXtR9zYMh6oCN1jd0VcgTfHsiTHOrLX
         ekHPJa7eo0FUeLtIHL0wmxRXUcPonJ07ShGepszMDXDD5G+jbe6eOaenXWI23yX1mxz2
         G6mO762ni1Ins+w8/IrveK7EzOJL9G72YCb214gfRHFuaf+6fFNzW9lZVaxZdwwbvAta
         Mp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696490; x=1794301290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYbRMmxVJ6Ai7MVgLLIiU+xvn6br7SPlP+s7GBabEOw=;
        b=ftHQg+gkChPDeFu7wRw5dyjXu7XJDRvgZO5EXNFWg3JOGwc8w4Ab0woSCkiXABnwH9
         6GsR42HNXlBcZWS31Fu8rIcyACfkBEGWoBlicZ11QKRIDk0BIvQv5GncV4SYoMef093j
         0NYVUDwqTG/Oh9s7sq7BE4JgNki+IFqlXjTrHFawcDMHfHB4xdd1QwiCU3VT53Cr8hZb
         6xdi4Ll/HPROHVp27rDK/wcD+m8OvDf6qSrZlCP5lhlCQ61IeOLDhXTRYmIWQRCLE9JQ
         Xw3EQBPs7Y/c1kXa/UEm4SMRJol85sshsSfhPcnhzKNmfhZ9kpH0YbRh9OZ8CqrQa/Ze
         qzSA==
X-Forwarded-Encrypted: i=1; AKwUvBxJZo5G9sV/gWkVwPMYEXhTdGmeabeszxzq0tZfpLLGK8DRTAx2ldIElj0EBCKjAnjXxoVS6LR8RgaljBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U2Fc3FkJ7m5TcnMT2X4E94rXwPuk2eRbTTKBbz7h11FQ8Thsi
	AUUldfM+lJpxwHlgBzcmfPEQzC83ntsw0NGy5KG03jyTMyuHVlU8dCLkK2hOYd2jYov8qTQ4+pe
	g52WIAJgRPI4RwnJwp448296aaJzAxW0=
X-Gm-Gg: AYBFou15XNsA5/eUqnmgHOrpAU7+ao4wL82CwRf9ZrrB3t3FbTopToiAUaUxCUVAgWb
	MK55traqRqP4LthX3ubAo7wVkPtogoyS5Yhz5mFMhVyptRvVx20zeMJj6kFKLZ6kGEYJ2XG+oxc
	pOGTglkVhXxUp8iiA1Tg2fwvI+tYMgYWpuEZpqHQJ4+BoT+Zf7gBhRwe74yOKNJ/wwa7Oeh60dY
	sPaLPa54WB4v+r2GLs+klRqjBJ37xLsTI6BBs1pNxpR35buqrocse8Pd3Y25bAE/UyCIvu5pO9M
	Monc30eUAtye3s4Ct6Ze/Ln0WDAvBaqsx15wGHyru78Hxv11WmMY3UR8EPbi3xOzMt/2dNzTXjI
	a3P0l6WFs2ZYkSd923bh4woztrATuKhT5zkmSqZIE6kRF4wuU4N+hq0WUrzO9swiUbL7j3XnwX6
	hhxWI466QOgWcX0g==
X-Received: by 2002:a05:6820:1c96:b0:70d:9be9:533e with SMTP id
 006d021491bc7-714f2549a1emr6856021eaf.73.1793696489635; Tue, 03 Nov 2026
 01:01:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102112613.18334-1-amaan.cheval@gmail.com> <CAEAWyHfCM_ZesnChP71AQvxjM4MASwukesgzuWCYECts7jiNhA@mail.gmail.com>
In-Reply-To: <CAEAWyHfCM_ZesnChP71AQvxjM4MASwukesgzuWCYECts7jiNhA@mail.gmail.com>
From: Amaan Cheval <amaan.cheval@gmail.com>
Date: Tue, 3 Nov 2026 14:31:17 +0530
X-Gm-Features: AclHuK92CNC8uT4BMNAZK0ESF7ESyhz_oozfRWBU3vLBGDFrwmZ_QoNugTRLtsQ
Message-ID: <CAG+wEg3qLqauLEFJYrgPrgJOy+Uh86SKzL5FpevBcatNN-apkg@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: leave refcount headroom in the RX page bias
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, joshwash@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	bcf@google.com, jordanrhee@google.com, przemyslaw.kitszel@intel.com, 
	pkaligineedi@google.com, maolson@google.com, csully@google.com, 
	willemb@google.com, yangchun@google.com, npl@google.com, 
	awogbemila@google.com, shailend@google.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:38=E2=80=AFAM Harshitha Ramamurthy
<hramamurthy@google.com> wrote:
>
> On Mon, Nov 2, 2026 at 3:29=E2=80=AFAM Amaan Cheval <amaan.cheval@gmail.c=
om> wrote:
> >
> > gve's GQI and DQO-QPL RX paths set every RX page's refcount to INT_MAX =
and
> > hand references to the stack by decrementing page_info->pagecnt_bias, t=
o
> > avoid an atomic op per packet. This leaves the page no headroom: while =
a
> > fresh page's buffer sits in an skb its refcount is already INT_MAX, so =
a
> > single get_page() from the stack wraps it negative.
> >
> > splice() of received TCP data into a pipe takes such a reference, and t=
he
> > onward splice into a socket then fails: skb_splice_from_iter() sees
> > page_count() < 1, sendpage_ok() fails and the send returns -EIO (since
> > commit 2e910b95329c ("net: Add a function to splice pages into an
> > skbuff for MSG_SPLICE_PAGES")). tee() of the pipe fails with -EFAULT vi=
a
> > try_get_page(). On GQI the reuse check gve_rx_can_recycle_buffer() also
> > sees page_count() < pagecnt_bias, WARNs and calls gve_schedule_reset(),
> > so a task that merely pins a fresh RX page (e.g. holds spliced data in
> > an undrained tee() pipe) can reset the NIC.
> >
> > Use USHRT_MAX in a u16, as igb, igc, ixgbe, i40e and hns3 do: the bias
> > only has to make the per-packet atomic rare, so a small value leaves
> > page_count() ample headroom below INT_MAX for the stack's references.
> > Refill by adding a fixed batch and setting the bias to it, which keeps
> > the rule `references =3D page_count() - bias` intact.
> >
> > Refill when the bias drops to 1, not 0, so the driver always keeps one
> > reference of its own. That matters when a consumer returns its
> > reference before the driver has decremented the bias:
> > DQO-QPL passes the QPL page itself to xdp_do_redirect() and only calls
> > gve_dec_pagecnt_bias() afterwards, and an AF_XDP socket in copy mode
> > returns the buffer synchronously via xdp_return_buff(). If the refill
> > waits for bias 0, the last handoff of each batch happens at bias 1,
> > when the reference being handed off is the page's only one, and that
> > put_page() frees a page that is still DMA-mapped and registered with
> > the device as part of the QPL. That is a use-after-free: the driver
> > then takes new references on freed memory and re-posts the buffer, so
> > the NIC keeps writing packets into a page that may already belong to
> > someone else. INT_MAX hid this because one page had to be handed off
> > 2^31 times to get there; a 16-bit bias gets there after 65535.
> >
> > Reproduced on gVNIC in GQI-QPL mode (GCE n2-standard-8, 6.12) and
> > in DQO-RDA mode (GCE c3-standard-8, 6.12) with the help of
> > relay.py -- a small splice(2) TCP proxy -- relaying a download while
> > the RX ring is refilled with fresh pages:
> >
> >   ethtool -G eth0 rx 512 && ethtool -G eth0 rx 1024   # fresh RX pages
> >   ./relay.py $HOST 8080 &                             # splice()s both =
ways
> >   for i in $(seq 200); do curl -so /dev/null \
> >       --connect-to $HOST:80:127.0.0.1:8080 http://$HOST/file; done
> >
> > Most downloads failed with EIO before the fix (tee() with EFAULT) and
> > all completed after it. relay.py is at the Link below.
> >
> > This bug was found and fixed with the help of an AI coding assistant
> > (Claude Code) over an interactive session; it read the driver and
> > splice/pipe code and ran the tests above.
> >
> > Link: https://github.com/amaanc/kernel-bias
> > Fixes: 9b8dd5e5ea48 ("gve: DQO: Add RX path")
> > Fixes: 58401b2a46e7 ("gve: Add rx buffer pagecnt bias")
> > Fixes: 82fd151d38d9 ("gve: Reduce alloc and copy costs in the GQ rx pat=
h")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Amaan Cheval <amaan.cheval@gmail.com>
> > ---
> > v1: https://lore.kernel.org/netdev/20261031173449.2439047-1-amaan.cheva=
l@gmail.com/
> >
> > v2:
> >  - Refill when the bias reaches 1 instead of 0 so the driver keeps a
> >    reference of its own across every handoff. At bias 0 a consumer that
> >    returns its reference synchronously, such as an AF_XDP socket in cop=
y
> >    mode on an XDP_REDIRECT from DQO-QPL, freed a page still registered =
in
> >    the QPL.
> >  - Commit message: explain the refill point, drop the build notes.
> >
> > Re-tested on 6.12.113 (c3-standard-8, DQO-RDA, which still uses the
> > bias on 6.12), fixes EIO/EFAULT from splice/tee nor a NIC device reset
> > after applying the patch.
> > DQO-QPL is untested; I have no access to that hardware.
> >
> > Built allmodconfig W=3D1, no new warnings.
> >
> >  drivers/net/ethernet/google/gve/gve.h           |  2 +-
> >  .../ethernet/google/gve/gve_buffer_mgmt_dqo.c   |  4 ++--
> >  drivers/net/ethernet/google/gve/gve_rx.c        |  8 ++++----
> >  drivers/net/ethernet/google/gve/gve_utils.c     | 17 ++++++++---------
> >  drivers/net/ethernet/google/gve/gve_utils.h     |  8 +++++++-
> >  5 files changed, 22 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve.h b/drivers/net/ethern=
et/google/gve/gve.h
> > index b7ce6e8632db..18d7edbf4b3b 100644
> > --- a/drivers/net/ethernet/google/gve/gve.h
> > +++ b/drivers/net/ethernet/google/gve/gve.h
> > @@ -119,7 +119,7 @@ struct gve_rx_slot_page_info {
> >         void *page_address;
> >         u32 page_offset; /* offset to write to in page */
> >         unsigned int buf_size;
> > -       int pagecnt_bias; /* expected pagecnt if only the driver has a =
ref */
> > +       u16 pagecnt_bias; /* expected pagecnt if only the driver has a =
ref */
> >         u16 pad; /* adjustment for rx padding */
> >         u8 can_flip; /* tracks if the networking stack is using the pag=
e */
> >  };
> > diff --git a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c b/dr=
ivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> > index 6880d1531ba5..571f851d6dcd 100644
> > --- a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> > +++ b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> > @@ -149,8 +149,8 @@ int gve_alloc_qpl_page_dqo(struct gve_rx_ring *rx,
> >         buf_state->last_single_ref_offset =3D 0;
> >
> >         /* The page already has 1 ref. */
> > -       page_ref_add(buf_state->page_info.page, INT_MAX - 1);
> > -       buf_state->page_info.pagecnt_bias =3D INT_MAX;
> > +       page_ref_add(buf_state->page_info.page, GVE_PAGECNT_BIAS - 1);
> > +       buf_state->page_info.pagecnt_bias =3D GVE_PAGECNT_BIAS;
> >
> >         return 0;
> >  }
> > diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/eth=
ernet/google/gve/gve_rx.c
> > index 81ea800e66e9..6533fff06155 100644
> > --- a/drivers/net/ethernet/google/gve/gve_rx.c
> > +++ b/drivers/net/ethernet/google/gve/gve_rx.c
> > @@ -152,8 +152,8 @@ static void gve_setup_rx_buffer(struct gve_rx_ring =
*rx,
> >         page_info->buf_size =3D rx->packet_buffer_size;
> >         *slot_addr =3D cpu_to_be64(addr);
> >         /* The page already has 1 ref */
> > -       page_ref_add(page, INT_MAX - 1);
> > -       page_info->pagecnt_bias =3D INT_MAX;
> > +       page_ref_add(page, GVE_PAGECNT_BIAS - 1);
> > +       page_info->pagecnt_bias =3D GVE_PAGECNT_BIAS;
> >  }
> >
> >  static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *d=
ev,
> > @@ -230,8 +230,8 @@ static int gve_rx_prefill_pages(struct gve_rx_ring =
*rx,
> >                         rx->qpl_copy_pool[j].buf_size =3D rx->packet_bu=
ffer_size;
> >
> >                         /* The page already has 1 ref. */
> > -                       page_ref_add(page, INT_MAX - 1);
> > -                       rx->qpl_copy_pool[j].pagecnt_bias =3D INT_MAX;
> > +                       page_ref_add(page, GVE_PAGECNT_BIAS - 1);
> > +                       rx->qpl_copy_pool[j].pagecnt_bias =3D GVE_PAGEC=
NT_BIAS;
> >                 }
> >         }
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve_utils.c b/drivers/net/=
ethernet/google/gve/gve_utils.c
> > index caed38cd5f2b..adcdccd54684 100644
> > --- a/drivers/net/ethernet/google/gve/gve_utils.c
> > +++ b/drivers/net/ethernet/google/gve/gve_utils.c
> > @@ -92,16 +92,15 @@ struct sk_buff *gve_rx_copy(struct net_device *dev,=
 struct napi_struct *napi,
> >  void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info)
> >  {
> >         page_info->pagecnt_bias--;
> > -       if (page_info->pagecnt_bias =3D=3D 0) {
> > -               int pagecount =3D page_count(page_info->page);
> > -
> > -               /* If we have run out of bias - set it back up to INT_M=
AX
> > -                * minus the existing refs.
> > +       if (page_info->pagecnt_bias =3D=3D 1) {
> > +               /* Refill at 1, not 0: the page's own reference is coun=
ted
> > +                * in the bias, and a consumer can put the reference we=
 just
> > +                * handed off before we get here (e.g. a synchronous
> > +                * XDP_REDIRECT return). At bias 0 that put would free =
a
> > +                * page that is still mapped for the NIC.
> >                  */
>
> DQ QPL mode is not supposed to support XDP at all. The bot correctly
> caught that xdp_do_redirect() is inadvertently called in DQ QPL mode
> but the more holistic fix is to explicitly block XDP in DQ QPL mode.
> Since the driver is not supposed to support it(and doesn't)
>
> We will send up a patch to explicitly block XDP in DQ QPL mode, so v1
> is the appropriate fix.

Ah, that makes sense. Thank you for the context and confirmation.

>
> With that change, feel free to add to v3:
> Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>
>
> Thanks for providing the reproducer script, I verified it on a N4 VM
> which runs DQ QPL mode. So,
> Tested-by: Harshitha Ramamurthy <hramamurthy@google.com>
>

Thank you! I'll send v3 with the appropriate fix and the tags.

> > -               page_info->pagecnt_bias =3D INT_MAX - pagecount;
> > -
> > -               /* Set pagecount back up to max. */
> > -               page_ref_add(page_info->page, INT_MAX - pagecount);
> > +               page_info->pagecnt_bias =3D GVE_PAGECNT_BIAS;
> > +               page_ref_add(page_info->page, GVE_PAGECNT_BIAS - 1);
> >         }
> >  }
> >
> > diff --git a/drivers/net/ethernet/google/gve/gve_utils.h b/drivers/net/=
ethernet/google/gve/gve_utils.h
> > index bf2e9a0adb36..a5e3413234d0 100644
> > --- a/drivers/net/ethernet/google/gve/gve_utils.h
> > +++ b/drivers/net/ethernet/google/gve/gve_utils.h
> > @@ -25,7 +25,13 @@ struct sk_buff *gve_rx_copy_data(struct net_device *=
dev, struct napi_struct *nap
> >  struct sk_buff *gve_rx_copy(struct net_device *dev, struct napi_struct=
 *napi,
> >                             struct gve_rx_slot_page_info *page_info, u1=
6 len);
> >
> > -/* Decrement pagecnt_bias. Set it back to INT_MAX if it reached zero. =
*/
> > +/* Up-front references gve holds on an RX page, so handing a buffer to=
 the
> > + * stack is a pagecnt_bias decrement, not a get_page(). Keep it in a u=
16 so
> > + * the 32-bit page refcount keeps the headroom every page needs below =
INT_MAX.
> > + */
> > +#define GVE_PAGECNT_BIAS USHRT_MAX
> > +
> > +/* Decrement pagecnt_bias. Top it up to GVE_PAGECNT_BIAS if it reached=
 1. */
> >  void gve_dec_pagecnt_bias(struct gve_rx_slot_page_info *page_info);
> >
> >  void gve_add_napi(struct gve_priv *priv, int ntfy_idx,
> > --
> > 2.47.3
> >
