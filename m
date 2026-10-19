Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792448825;
	b=VxA5aETmsqGZi03w/7F5YPeYU/9Q2QHOYDxZpQaCdgI1jtOB46Hi35F1g9wYq4coE8Z+
	 9LKcEKdL8gco/fpHFU3kb399oFft36uYCMAt506bs+lJ1OWV7pc13eEFBLcuj0ouXJxXR
	 fneZkt4DonT9a3ASBYjex/Ceau1gL93lbab5QEhejXRb47Zd5Nb0yCVicFOX4mbtTFuh9
	 EL1ZxffytkOkmJieq/zNKMbKRYd/ZK8uNuHNr0QocT5uPeBPBIsOLEVTmdXgIqQye2zR7
	 7Xhmk8StApZrfjMWrHPZbTdzibXU9uqYYB6YFA0+itw0S0NtehyArv2WSIMk1yKWwug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Orig-IP:X-Proofpoint-Spam-Details;
	bh=7W0BmcepB6Aeqg3by+8VUO80cva2C9MnIOBEI/kRUkM=;
	b=wBCKGMupB0f2fH10JzDqjRB2CjM0WWCcbxPyg396xayH/6pxIF8uVkPcq5uEihHwQ6lh
	 9WeeUti9bLjiTIm8FqZnnT6/eqiuHSQ7/I4tH23eJRpz6EQH58Vy0k898TA/6sxnPhxqI
	 1CxH5AK9rvdAJbJHfFTn98ziebFIWrWPamhyE48/bZxULBNl/40hL2jd7k7dWLMpH2lwu
	 m9vPJU2PBRpQJc3LLs4DkAtwrIR/911UP59SRX91hmO1GGQPlWCARRCWiux4nVOL2q6q2
	 4lPMYTRC6sZMdMahpCHTKVPxfRp89ut3gHavnHMDl5x+Ao9cX8DupjFalfrR2zH/WDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=Ik8aelSe;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=nf9o7U+C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.240
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD94606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD94606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=Ik8aelSe;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=nf9o7U+C
Received: from pps.filterd (m0094546.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JL8mtu3294808
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=7
	W0BmcepB6Aeqg3by+8VUO80cva2C9MnIOBEI/kRUkM=; b=Ik8aelSen+0yPt9sa
	EocafKhobDXbKGKRRviMN6sAcOIuxKAj5l9lAdqzxQe8Kt/1ps6w2LkiPA1OLDFa
	lcRgEKIG0hiEgsV8PwrEQXlRmhPFB2Jkyi2eYBt4RERzLswy3Vmw5HYeT6d0addK
	D1FlUbITAR3x8hg8S9ckM4Z+QA4ebhPOXzyQeSk5GReME2Ua9j+MpLfkE0I3jILR
	JYuihYXTP6C1VVbJ23jV4kI8wVTHEKr1f+/eVq6pw7kDbbxwfSkFckQktuZpBKx6
	qO7EYqiTD4NzfHm3nxB2Xfme353iVlvZS85Jw53Q1I8X9fRG0QBOe67+IjCmwqin
	YZCGg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hdttc91au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:27:02 -0400 (EDT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so137851eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792448822; cv=none;
        d=google.com; s=arc-20260327;
        b=jeFY8jHgzLiHjuDGCpHrs1XcfiLWvFVXigHu9edaACqD541wVWdoP85XxVxZdiw+Mm
         LRpdE/7mrUzjlf6dHML68pQDqoBgbbX8RFytLRJhqkCC7YTOGBUJXPmiJlWCWjo+qBf7
         tLW6Uu0Unqgp/stnE+tc3ZgKGlQ7ixKr9fmkoiqBP9WwkAA7hYRaEcMFHR5eLziMME9Y
         deEvWspmeA76Zx6DkX1jis/gPE/K2fPzu25kknGtQg7yKKempOuradFzPtgqXErbHTNH
         aGCE+4CQGxRWJSYqBQp92og7d8fL+D3y/twEfrUEJXTdU6bzVVJCp3ZFTjvyzsrgt2di
         aNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7W0BmcepB6Aeqg3by+8VUO80cva2C9MnIOBEI/kRUkM=;
        fh=rqa612LceND+NiyomAsc9eRBvcL8i5Ll9B79661MGv4=;
        b=eSsAb0OJJjeg9O/lkIxhqtFQOd8nOX/y4BP580uQTfXmQwiJ7P5W2pHFM9ZtGcMhS3
         9v0CiCkHrLFpf+nGRnMp2f3pe2aaIrrJFWnXgudDu09uG5echJkq6Fl/5TQT+CjsrWKL
         O8XCtL/C+0W7elM9l/t7YVBVan48MYFzdI5EJdlXp8bSVk8PEMiIksi0tUK4jUIhjglG
         wFKl682KtcXYsNRD4lamnPhvc637N+9s9vDFaJkaQgCmMtBLvVVtxC+W3D/3HUT1gZPJ
         tZs+IRtsHkQKZ76I1lSO5W2ZZ+GOQMMJGStKxjDFVf+fxQ778UYvA0KEYjq/Ow37d3Ym
         hDIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792448822; x=1793053622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7W0BmcepB6Aeqg3by+8VUO80cva2C9MnIOBEI/kRUkM=;
        b=nf9o7U+CdVmNSA8SypncHM+YKDlJKnoP6jBDVVYI5lhlc9p3KaU6f9RGOk4JVolzlh
         kgo9KHZ9+1DnWHtHbKOZb5gmVdQobCb+jpQZBqva8haMFlhvws3VJm4l0Mf4x2HhYfcR
         74MqhWecZjGCVCBFJ4YTAImmvUW9jG7or0pcimmfMWYTT+aloWHcG9xaOQTeaVISOKgI
         ZfEpC8F+VFBPOJBvlB3crO93GfVAu37GQ5X/PfIk/cuxLHXB7WLKWXnbCRJkP/TpeMF8
         YtSQ0Klh2ydpBNhV7KUMppTGPl4JfCj6p+26OlSvA9R1XKxf0/UlPk8YZyH5e3fQ3FmQ
         4G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448822; x=1793053622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7W0BmcepB6Aeqg3by+8VUO80cva2C9MnIOBEI/kRUkM=;
        b=UDeLISGBFpDTtEJUUxEYsM6dtGz3CVa93SrMGTXLmCqwrv8NqAv1/IoRtfOBcxIQ9n
         EofnNip3KZ75aN9awkgcikI3Dxs4pTKfPmZwvsAz7wzqIXkHgE2xnmwUYEnYUAZhpKyn
         ud7156vzuMCMDhZfRwIxeeGXgBXntbpR/KbbxQ7fyISab0Nt7+QLHDxZGOA0NHkVKFgH
         uhNlUz5cTOB2XH/6NIrfYdWOWW/Z8+PjE0Mlgjrxm6MHeMt4OciExmNZk2APmc/9zt3X
         Xku3gcdpPvVbu6bmetuzyUo39sCBZ4NCc5+tbzmDNCtefHLt/xEBnzI7rg+a1uvKsawh
         e4cg==
X-Forwarded-Encrypted: i=1; AKwUvBz/D1KPaQRCV803WxDj3Pi7PMtFcpdldLfuBsDXLgIra27C20LCdGqo6Ds4+W3PStAXKp94bob9EpWdxiA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyONhTKLgsyTD9ZPGlSsQYMTagzKw8ir4SpZ4vKIK/TMyJUofo
	TfvyWWtLSJWQqIybbh5DOQ/7ujxdbfs8z+6PqcDsJvqJl0cNdjKlSkPgE8rFY/px9B5LnBqLg1p
	y/y7B+R6Li7MUOSaWf9hfE4sBLAw5SXYCG6Ssa9vEVi+WFWhtF3hXru67n2Wxp/1V7ZnqPKSB8e
	2MliV9uHd3LDNpf9NNXi5U7EO7AE6CMUrnSaJjWMkHjf4eh8Tp2Vg=
X-Gm-Gg: AYBFou0hAJ8//ii9Xo3g2fkxK2hl9lMedL665DnNuCiOBxQVm89NTl5qnQZ3dGROKbF
	3LViTwZNOGP6lDF//LJrMHzTqzysORChINHnK878Swx5BJdLlR0XNy3WyfOr5Nxiv2z6tu+cJPi
	aDCyitl6XRs+DgRsFnTlcIiRKnabqh3OgX4IsrQHSw0l4ka4SAEn9/L0RAkg==
X-Received: by 2002:a05:7300:fe8c:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-365fbe702e6mr513083eec.23.1792448821948;
        Mon, 19 Oct 2026 15:27:01 -0700 (PDT)
X-Received: by 2002:a05:7300:fe8c:b0:33e:61ab:8309 with SMTP id
 5a478bee46e88-365fbe702e6mr513046eec.23.1792448821208; Mon, 19 Oct 2026
 15:27:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017214845.28769-2-kj2864@nyu.edu> <atXVqZDUhE9Z8InH@kwain>
In-Reply-To: <atXVqZDUhE9Z8InH@kwain>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Mon, 19 Oct 2026 18:26:50 -0400
X-Gm-Features: AclHuK_OizrKzXhjvZJbJnNHqcKl2cJmdxnoqVFQ_oSZGq_xEOdyc5Kt-heihiY
Message-ID: <CAPqbLS3wzSQTJJRoBGjJ-C-2GZ95qn6GLAwYBYOt3o75uRiW8Q@mail.gmail.com>
Subject: Re: [PATCH net v4] net: ipv4: add zero check for snd_cwnd_clamp
To: Antoine Tenart <atenart@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, co+71b6509cb791e531@bugs.sh,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 5Kal8XCzPRqpvnNu6Vb6IYDsLCHAlcqj
X-Proofpoint-GUID: 5Kal8XCzPRqpvnNu6Vb6IYDsLCHAlcqj
X-Authority-Analysis: v=2.4 cv=Qu3LTlyd c=1 sm=1 tr=0 ts=6ad69936 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=T67y4n-0JBmO_r8OIWtK:22 a=VwQbUJbxAAAA:8
 a=hKX_YmtgrgkOCiSBCTgA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX9Fxbzp6iGMFn
 /Kw1g6WC2qpj6t16sOFa63Ys1s1nsANXFvWk7qJ+Q8QfvP2h3zu8Vqwh2mL6QDBZC8uKoOpAoCT
 6PDB5nvgDP7KaWxTC0Rq7e891nmFXTL2hwPNEWuS+g1iKVSAYymVqQAG6TTwJRYcPI78avBuebq
 JZfrlXUPV1R3KQCqO+p9+xElFPFGYb0oLsPYRP9fgT+lKEbndhPMLrfNzCW+xNIHpRDP7uYn/RW
 RYUWnN7PM43Hs9l79TLQ5sdnV3VJNCQL9gOz0M0sQhT40BDT+VQ5nm45sI9jz3/NV8JNXmDTs21
 CSqwpq3stfL+TWDipMF/SKlvE+HGTTgrgwfSRayzvH1ISAC6/SEuW7s6NxC+uFNLIaiOngNTq4t
 h/HVG0LYRPXzSGW1N9bOAYgZsir7kiLh0xf9OSdJ/zH60qDCFdijznkhwID1qSd/KOO99fD1tiT
 gOGOeAUq5CtpkP4j7LQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4OSBTYWx0ZWRfX2qbqET/GKga/
 ji64HyDrUEkm0DK/u+uhgS9KxVqQrvIUX1pFnsNsXFIRrbbFWTupGa19HxKN5uoAY93VKhpSC9u
 RSu1gxTlKD0CxMFZ5Ui/ao7L6GGahuo=
X-Orig-IP: 74.125.82.197
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190089

I apologize for deleting the warning.

v5 is proposed:
https://lore.kernel.org/all/20261019222531.1073-1-kj2864@nyu.edu/

On Mon, Oct 19, 2026 at 4:33=E2=80=AFAM Antoine Tenart <atenart@kernel.org>=
 wrote:
>
> On Sat, Oct 17, 2026 at 05:48:46PM -0400, Kaho Jiang wrote:
> > User can pass zero to snd_cwnd_clamp via RTAX_CWND type.
> > This could lead to division of zero error if not checked properly.
> >
> > Oops: divide error: 0000 [#1] SMP KASAN NOPTI
> > Call Trace:
> >  <IRQ>
> >  tcp_reno_cong_avoid (net/ipv4/tcp_cong.c:510 (discriminator 1))
> >  tcp_ack (net/ipv4/tcp_input.c:3517 net/ipv4/tcp_input.c:3873 net/ipv4/=
tcp_input.c:4440)
> >  tcp_rcv_established (net/ipv4/tcp_input.c:6685)
> >  tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
> >  tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
> >  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 1))
> >  ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator 1))
> >  ip_local_deliver (./include/linux/netfilter.h:325 ./include/linux/netf=
ilter.h:319 net/ipv4/ip_input.c:262)
> >  ip_rcv (./include/net/dst.h:481 (discriminator 6) net/ipv4/ip_input.c:=
492 (discriminator 6) ./include/linux/netfilter.h:325 (discriminator 6) ./i=
nclude/li)
> >  __netif_receive_skb_one_core (net/core/dev.c:6297 (discriminator 4))
> >  __netif_receive_skb (net/core/dev.c:6410)
> >  process_backlog (net/core/dev.c:6761)
> >  __napi_poll.constprop.0 (net/core/dev.c:7830)
> >  net_rx_action (net/core/dev.c:7893 net/core/dev.c:8050)
> >  handle_softirqs (kernel/softirq.c:645)
> >  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softi=
rq.c:758)
> >  irq_exit_rcu (kernel/softirq.c:775)
> >  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discrim=
inator 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
> > RIP: 0010:tcp_cong_avoid_ai (net/ipv4/tcp_cong.c:482)
> >
> > Fix by checking if user pass in zero as parameter,
> > if so reject the value zero.
> >
> > Fixes: 814d488c6126 ("tcp: fix the timid additive increase on stretch A=
CKs")
> > Cc: stable@vger.kernel.org
> > Reported-by: co+71b6509cb791e531@bugs.sh
> > Assisted-by: LLM
> > Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
> > ---
> >  include/net/tcp.h  | 3 +--
> >  net/ipv4/metrics.c | 4 ++++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 4416cdf9bf30..ad80b8fb8a52 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -1521,8 +1521,7 @@ static inline u32 tcp_snd_cwnd(const struct tcp_s=
ock *tp)
> >
> >  static inline void tcp_snd_cwnd_set(struct tcp_sock *tp, u32 val)
> >  {
> > -     WARN_ON_ONCE((int)val <=3D 0);
> > -     WRITE_ONCE(tp->snd_cwnd, val);
> > +     WRITE_ONCE(tp->snd_cwnd, max(val, 1U));
>
> Please keep the warning (it's not only about 0).
>
> >  }
> >
> >  static inline bool tcp_in_slow_start(const struct tcp_sock *tp)
> > diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
> > index ad40762a8b38..cb36686973e5 100644
> > --- a/net/ipv4/metrics.c
> > +++ b/net/ipv4/metrics.c
> > @@ -54,6 +54,10 @@ static int ip_metrics_convert(struct nlattr *fc_mx,
> >                       NL_SET_ERR_MSG(extack, "Unknown flag set in featu=
re mask in metrics attribute");
> >                       return -EINVAL;
> >               }
> > +             if (type =3D=3D RTAX_CWND && !val) {
> > +                     NL_SET_ERR_MSG(extack, "RTAX_CWND must be greater=
 than zero");
> > +                     return -EINVAL;
> > +             }
> >               metrics[type - 1] =3D val;
> >       }
> >
> > --
> > 2.43.0
> >
