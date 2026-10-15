Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3043D9DC9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.242
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098276; cv=pass; b=Zz70Qv1EkSd7GjUTGOKIRFHqLrUgGU2BgoHnSftxngrsljPHcUrB1HQnY/XxnB+Uy0TPDNGe/5KqHpZk2I9biwUc+VXNlLSpeYDHcBej3E/GSxNrojqWb5mj6dDo1bF+PUrz9kDVv0qxiwGei/jlrU0CnHQrWLwnY7Fyhu8/ywg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098276; c=relaxed/simple;
	bh=2Dt4ze1PRtPcKMOQhYhXAM2HdUXW7CpVLr79L/hKjIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cufEUADAmmkFxHgrjMHWtdiTKmDr1r+DMv9ysSuvRf3kjKTjn3mgmrkg5XkrC8lMtsAqBxMPvsjAY8OMwneIolv5Ai2yhm03yUzwfcLwAx0OVj5rTP6UbWH9G3lPGaXnqTVBBjZY0ZtXyvXgUhOXx5Xzrd+TNaNkFcFgU067Cs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=Z7o6TgYO; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=K8WY3vQ6; arc=pass smtp.client-ip=67.231.153.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="Z7o6TgYO";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="K8WY3vQ6"
Received: from pps.filterd (m0355792.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI4PjY1867068
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=E
	jTzUdIh1JiWqCTQbTHIx2EY+cLBJ9IwG0EzO3Un/kw=; b=Z7o6TgYOAwaocZQLO
	RxsZ08glAUbeb+v7CAkOpuPO0q/dOErfoxhuK5uQke00iop+ZU/GfPu9/yjc4K7L
	tg3+W6ARyztVBI6V08Ii3DkMT5A6Eb56P5IS2NyAbGqtR7efsZhcvJyvHpH4pG30
	ixz0BxOkWAF58vdWCzRQsx8gA75itOI7ES74KCkTI5DXmrNfHGS+CN1F62pKlFkT
	xwGVC7QXh2YhkDR6v1Pbm/ZVqvSJcorLcbuVCkculNPfW1Zk5tt7lJXnGFvsXIp1
	rA1OoWfGDpbU739KHDyOJEWLfXUI6oMz7ikerdPq0xZY0r5EDCBd33PU1Nd0L93u
	dz6ZA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hb3ssajw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:18:35 -0400 (EDT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso14740268eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792095514; cv=none;
        d=google.com; s=arc-20260327;
        b=MofBQS2I43hd170WCc2vsp2SzzekUT55nGhS4w/u0pVHUv0QGSwsJqSwceU9NANqsI
         cRs7hly/d5/g48qDNIz7wGPEtNHrB/Lf2d7JvXQi5G1ez1lzlbiK4LWuaaXXWzvjiuYJ
         RBmYOCmDH59C8rle/BF8Swf5JnsSCrsbRUInkUWm57g3ffVfAom9+hOT3Z5jBjzw3Ehu
         51kruO5dx4shRDfyhXDBjY9Ia9gkWiWFOz5t+WWWlNXI5XvFW2FTzM6TDjg/oxyz9G1A
         mljtQVt9dp1NBTKPVgDsoz7gWX1YfdRFWuOh9F5W5b4fJLqekFXhiOqXB17dumVwc5Ru
         RRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EjTzUdIh1JiWqCTQbTHIx2EY+cLBJ9IwG0EzO3Un/kw=;
        fh=r+f3kKjH1ph35rYPUNzYKtR/FKOyd6OrxBGi0IxKAFI=;
        b=bCn5vElJtgOrpt6NMAxuNe/AKEkpDlt833E2lJ1cLlkbfuU6t1C6MWFMn3cQ2N2S+k
         RsKWcuq38JTP2C7Lmt50HPrW7QQR6i8ZO/Thh4lfxtfV4fI4FObUQimXeitYpGIrD45P
         3Sc588d2J4xoCLVwkme9MIxRGDKNhEN7BGfyMQYrppJwpsKw5Eb6Km0qKNDdA5r7c7iZ
         RL/ZsqgQETIxzC14sY92EMoFXvaFbxhyr5vonFsTqQp9c4ZXyAxqQVhHMzAVha6LFDvz
         mK3jLqNGfwkH+B8hjxYsTxNZXAyLGEljBFOFKIzDWNvl39VihA2CHBUsPaUUpvHE7Lmm
         dhiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792095514; x=1792700314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjTzUdIh1JiWqCTQbTHIx2EY+cLBJ9IwG0EzO3Un/kw=;
        b=K8WY3vQ6UZoCX9/UXiHzZ1vOREfRJRlDPOY0vkrjGHoYIt8x+MPtath/6jW9mP7hZ+
         f3gzP71OopiwjZNi/RDL5f0ob0VZw3texzFEIvyo3ls1RsBdU+eW7rN+16VvP4WeEXEM
         Z1pL4bF2PqgUgb9HdKKZssvVSpIncBajOHNmGkH1iHWIa+5aM913PDdEBxarzMkpg1u5
         1rzXfjIAnUFeBU/T9N6vNMHbnXEOdojAKA8GMJSS8z3E3CL5Jxin9cU5BZ9vmtgHJ54s
         gjzptCPihKnIKSjXx43JV+V1mPFXUUz53HIl+ZgjK/YJ4xqbRPxzJscXiJJgui5Pc0Nd
         6hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095514; x=1792700314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjTzUdIh1JiWqCTQbTHIx2EY+cLBJ9IwG0EzO3Un/kw=;
        b=JOXiYtbIcTQ2LPSxznDtDJ9+KGOukapa/iqbOmio24EvaVoPkVF2YYKGVVgJEUeLmA
         sBpbQw+5fgn/45x3F5KNh6fq+SsWpC3x5upkOspaJajuMQUXBGwK05lLlWAVVptfHAUp
         lioFBLmfpGm/uagZBaxjNq+bpxU3WGyww9QZU59Ex6TOdvPLkNje2P6nxpv55uvy0C79
         1QcgOap/g/s5DHWdw9qEqiHtIRkOqilP3erSU/7MvldpGXUvGiBBFPyJzuJ6OnRX1SN9
         TBL3tdm9rZW1lGv2QmxIrR7GX1B9ZUV34Ce3HQfKJ/G30mVU9StekAxjfguSYyuAYHu9
         eAhg==
X-Forwarded-Encrypted: i=1; AKwUvBwp7Y1xYdYQNSdxWva7kdSq7qD6smIdvs/P/u26RmqwRum//X1AiCTbm7rw1Sop6OmBI/osWoK1tgpL+Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL72NTiKgOl2UyAcfuho3KX27puXHIetB5p/2AkP5RVc1swaxJY
	pGWElDym+hJYBMjhljwLochH60KdAmvByRBOlo0DysBMgqZL7AJ7Q9OyOWPpxrWJ11N19QMNIOi
	xe6Q52EEthesDPoYkmfG2L2KcjwUyRLqx/2hYbCrpr3bTZND7sI1ma3rLC48YN/FLfEPi46+yGr
	iPqbdKWGPV4BUde0wRK/VQEK4agslqvqVhSGlnsA==
X-Gm-Gg: AYBFou3gFM57bk+h+EU5Zr88fOp6ezEGcc+dcYs8oP7L1vUbqQuXnZwhqbGxtlFK+HY
	oOxPI6fYUD3YcH/CabOP+ooZTecn0v3nWiMNIKkat/NpbHqrRlFlXZ124rctkJeC7KXusyZ/36u
	ZuQylBE1z+el2B3hAhyjDM8IVJHf0RzTOUE9KCbo1qg7ZpwbOC5DaPPXNOXg==
X-Received: by 2002:a05:693c:8381:10b0:360:444f:a56b with SMTP id 5a478bee46e88-360444fa971mr1156939eec.12.1792095514062;
        Thu, 15 Oct 2026 13:18:34 -0700 (PDT)
X-Received: by 2002:a05:693c:8381:10b0:360:444f:a56b with SMTP id
 5a478bee46e88-360444fa971mr1156906eec.12.1792095513407; Thu, 15 Oct 2026
 13:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014195640.430824-2-kj2864@nyu.edu> <atCf_85Ei_J9CDtd@kwain> <CAPqbLS2sM9JZ8VbrzWviV-6XNRniKib_L+seaKtnCfR3pwMMig@mail.gmail.com>
In-Reply-To: <CAPqbLS2sM9JZ8VbrzWviV-6XNRniKib_L+seaKtnCfR3pwMMig@mail.gmail.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Thu, 15 Oct 2026 16:18:21 -0400
X-Gm-Features: AclHuK_Gij50KpJSzBvvPkxLcAi-zGcFI58uFnfwogGtPPy3-y0tsgfoZbC6PZ0
Message-ID: <CAPqbLS1dK9wqSCtDGJx=cYTJnO8PE5YONj3bykomOFuGDyYmRw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ipv4: add zero check for snd_cwnd_clamp
To: Antoine Tenart <atenart@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, co+71b6509cb791e531@bugs.sh,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4MCBTYWx0ZWRfXyNUlCfIPP3+N
 dBxxsfk9vwgR4/mdZlaRWI5Bbyj0eqmWAXCsFVgvSAjLu6PBut3kXTsZHEcTiSqJdIKziWVKsF+
 j+/jFqOXSmtVKOT0GcJpPnTQO2A2XYU=
X-Proofpoint-ORIG-GUID: t7zfShdycr6_6CRox0PV0HT8nHLft6j_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4MCBTYWx0ZWRfXxB8Ycx9oZYK1
 4o+kX+tTvLeSv111wvsPg2WqmY/FBYU85NKsmLa8NJ0O9slqTm00S2TlAZz8SqnVZ5PPNLtDX97
 Yha+JT1qc9QjRUzPKr/1QyQkxdaNYd7rWG0oCawV+KHmaMZ1PC8EcPikfIblVn6B7MgyDaSCa4o
 C1H4oshQGcE/4jSxkS7skLhpGS0cmghYnmdUEJoV8/xmwcE0gvVIV0paUn/30jRl7sENKgP+R2p
 n9vC30Umvk6hWadsv2jbl0O1q3k1dx49+jGedxTTy2KAFmNDD8gFs3oP78bQ8xy+QZkARiYTxBo
 aU7qsvgWp9hX2JXPUh6NbQ2gERODZn1BXqh8TpPMkrhjkPFZoAPHew0UI0W+pU6Xp3B2hv8SYq6
 BDdPAXjPwalIuh1Q33ZPdYkUsReVpFofg3aVY+Xfp87HBRq4Xr2dZsLFQlExZWYzoHQIPquvrcb
 t3uLNn7uzM4M28Jk64Q==
X-Proofpoint-GUID: t7zfShdycr6_6CRox0PV0HT8nHLft6j_
X-Authority-Analysis: v=2.4 cv=YLUKWhGx c=1 sm=1 tr=0 ts=6ad1351b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=16cGfGHOS5B3VL_TWyp6:22 a=VwQbUJbxAAAA:8
 a=GMUWeUELocx5WyZuTCQA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Orig-IP: 74.125.82.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150080

You are right to point out the refactoring commit, 814d488c6126 would
be more suitable for this.

v3 has been proposed:
https://lore.kernel.org/all/20261015201549.4023-2-kj2864@nyu.edu/

On Thu, Oct 15, 2026 at 12:57=E2=80=AFPM Jerry Jiang <kj2864@nyu.edu> wrote=
:
>
> I have considered rejecting 0 in tcp_snd_cwnd_set but afaik patching
> tcp_snd_cwnd only would just ignore the problem. My current patch
> should completely reject the user from creating a socket if 0 is
> passed for RTAX_CWND.
>
>
> On Thu, Oct 15, 2026 at 5:57=E2=80=AFAM Antoine Tenart <atenart@kernel.or=
g> wrote:
> >
> > On Wed, Oct 14, 2026 at 03:56:41PM -0400, Kaho Jiang wrote:
> > > User can pass zero to snd_cwnd_clamp via RTAX_CWND type.
> > > This could lead to division of zero error if not checked properly.
> > >
> > > Oops: divide error: 0000 [#1] SMP KASAN NOPTI
> > > Call Trace:
> > >  <IRQ>
> > >  tcp_reno_cong_avoid (net/ipv4/tcp_cong.c:510 (discriminator 1))
> > >  tcp_ack (net/ipv4/tcp_input.c:3517 net/ipv4/tcp_input.c:3873 net/ipv=
4/tcp_input.c:4440)
> > >  tcp_rcv_established (net/ipv4/tcp_input.c:6685)
> > >  tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
> > >  tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
> > >  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 1))
> > >  ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator 1))
> > >  ip_local_deliver (./include/linux/netfilter.h:325 ./include/linux/ne=
tfilter.h:319 net/ipv4/ip_input.c:262)
> > >  ip_rcv (./include/net/dst.h:481 (discriminator 6) net/ipv4/ip_input.=
c:492 (discriminator 6) ./include/linux/netfilter.h:325 (discriminator 6) .=
/include/li)
> > >  __netif_receive_skb_one_core (net/core/dev.c:6297 (discriminator 4))
> > >  __netif_receive_skb (net/core/dev.c:6410)
> > >  process_backlog (net/core/dev.c:6761)
> > >  __napi_poll.constprop.0 (net/core/dev.c:7830)
> > >  net_rx_action (net/core/dev.c:7893 net/core/dev.c:8050)
> > >  handle_softirqs (kernel/softirq.c:645)
> > >  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/sof=
tirq.c:758)
> > >  irq_exit_rcu (kernel/softirq.c:775)
> > >  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discr=
iminator 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
> > > RIP: 0010:tcp_cong_avoid_ai (net/ipv4/tcp_cong.c:482)
> > >
> > > Fix by checking if user pass in zero as parameter,
> > > if so reject the value zero.
> > >
> > > Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> >
> > This looks like a refactoring commit only, 814d488c6126 might be more
> > appropriate but please check.
> >
> > > Cc: stable@vger.kernel.org
> > > Reported-by: co+71b6509cb791e531@bugs.sh
> > > Assisted-by: LLM
> > > Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
> > > ---
> > >  net/ipv4/metrics.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
> > > index ad40762a8b38..e83a129a25b6 100644
> > > --- a/net/ipv4/metrics.c
> > > +++ b/net/ipv4/metrics.c
> > > @@ -54,6 +54,10 @@ static int ip_metrics_convert(struct nlattr *fc_mx=
,
> > >                       NL_SET_ERR_MSG(extack, "Unknown flag set in fea=
ture mask in metrics attribute");
> > >                       return -EINVAL;
> > >               }
> > > +             if (type =3D=3D RTAX_CWND && val =3D=3D 0) {
> > > +                     NL_SET_ERR_MSG(extack, "RTAX_CWND must be great=
er than zero");
> > > +                     return -EINVAL;
> > > +             }
> > >               metrics[type - 1] =3D val;
> > >       }
> >
> > My understanding is tcp_snd_cwnd(tp) can return 0 and then the divide b=
y
> > 0 occurs in tcp_cong_avoid_ai. Have you also considered updating
> > tcp_snd_cwnd_set to not only warn about invalid values but also reject
> > them, preventing similar oops?
