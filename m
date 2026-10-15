Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6906C549390
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.150.240
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083499; cv=pass; b=A8/2BP2SVT1+42I63wHl8FZhhL81k1Eqa2u8j8QtdbPmlYDBxmj+OSdKwRFjF6p6lH5zvo+xiBOD6Yv+pPPJVOsdgwg1xmuGwNH46GDZb8TuDPT/hJhgin0dJduXYNGMA4dGv1YHe/esoDhIOR9mDUpeYPfkD+5Fr+WwZ6w/VJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083499; c=relaxed/simple;
	bh=5SvIsi7SBbQT+gfq4uEUynEUgBhqEiqCCRbjzgQhmF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU6X7lACzGd6dHlxI2PBrLqkmIh49w2ypXe8fD0tr8s39HIPREAGGZrOPYSJfPGirHh7So3iKNBIG5LW/2Ph1Yj6Kp0YAkk+yu42p2Nsww7FbX33iMB0HB6tLAXQ/wafxT2uKBh7KEC6iYqm+vkYFq4Et8JXRVaoyPnbnX2DI4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=TbCtNgZ5; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=rxekr/U3; arc=pass smtp.client-ip=148.163.150.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="TbCtNgZ5";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="rxekr/U3"
Received: from pps.filterd (m0355794.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGBO5M3503902
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=E
	WnJ+H2sZYoV2Jv8w7ejHJBb3pXYIPz2WtL3bUBFqA0=; b=TbCtNgZ5pqfGfWlB2
	tTsfdWcTYueTaUtyJr+orPiDsvFGfaS69yMaAWatqFLx2NtKrF6Zu13UJ01cq7Xn
	V3+H2PDs9qAVotq9eL2qLCx9fJ1HScrXh9f5EkfjMkjwQ2mRGzTJsVQSwV2bvykH
	Yc28NcSRAYqM/ZhW2nF1yxIpjIAAGrsQmClK1Hp1lSjbo5e3Wf2mW6OL1jEVyL6k
	2YZWh5Y1bXRyLRc6YMfhtxepxtA9lWLuPqc5ONgY5JlN0/9hhyGzJaCOW6mAsFHF
	EfJ/FFUm+0DmLQnnDmL8FFPT/uhn1xhmF3AwpWVrTM9p8qnCIVlj4h3JSsbGoRuo
	CPwsQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4haxta5nny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:05 -0400 (EDT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9704289eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083484; cv=none;
        d=google.com; s=arc-20260327;
        b=AXb0V0B7ANV2oQ//SNmrK3whnivJ2lJHa4dpNexjrnaqf0shSJFSsIZ7J7ovsj/b4w
         nUyoynTOn/uHYTbBO9a10TCGAYiscEi4btETD/Fq8Sn6OgK04KvVgTvP4QJyWyRuHgWi
         Dnq1uqi0G9wvBH4IJlngZLAFyne/k241RlnYm5MjhwbrTqVmbYTHWzhdU0kmYu5AX+17
         TviHI66geIcxngTXvN6VPwlli5UjMUCFVFR0LkwXwcEW0wcJ6W0tdJmCTYbvQIq2J5PA
         g+y5HPgS2txjH4GOquuyzqc83jA8gsR1MXkeRw9/mM+ccXLc6qM+4ilXhGbC8PRMHGM+
         XQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWnJ+H2sZYoV2Jv8w7ejHJBb3pXYIPz2WtL3bUBFqA0=;
        fh=5JpqgE7PfkYEJsr8iYODjqrb3+9iSC3mYHhdw0zR9XE=;
        b=BFAk5AACC0rw1OMk2m/1gqSEAPuA9n0KWJDHxUl0jJFuKGb7TNEt7v9LQ6kperfXiV
         IweJOKvjmdRv/jfiWCjHcEnc0rTW0Egnn5P3ICtkPhVyeo6MVHzweUw8D3LiKGlJobri
         GF8Amd5N6IHXuwTVCNk9EH0c08/DQCcImOthK0AP8SyNKd0losD0mLYkIwmtvsZYssMj
         9zmby+vHElod5UrOBhgmbUv5DXUerSSSnNi0P7K59CtBRFUGkjk37ZNM+MJJ/QJAXK7Y
         trOPXwFUxA/WKWNYMWqP3mvKYE8NNdoGmmgn+pq2e16P1WTDcDY1T3hs6TR1zSnH+piA
         oW5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792083484; x=1792688284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWnJ+H2sZYoV2Jv8w7ejHJBb3pXYIPz2WtL3bUBFqA0=;
        b=rxekr/U3Adyt4Qc70CtHRbfopnrZknxnkCk5VoOEcs+rY8odjxo7qmLq0dt09lXshW
         g8I2Ye+7kmd3iSTmizaL0dLzeRTYSOU5WBS3XGBqkT5ccCGeHFTfLFMUxfIr/cD4xv3J
         VTvkP98S8tUjT2mT4+95Qh9WNyWrS8/6Qeg0zWVjxnUsylGJz/HSNTHykJcdJHpprTLb
         1j65S0Mj9XUYxRdFB2eqQCwWn3G/kGvh2Hs1R+fm5iSVGpZ4b71bfD9vG+++4IrYbn4d
         YrEskr4+Yg304bRm3QOiUS/nN/JC2MentOdBXr2YUQTrae5A6yiN8JSt3MUBN+Rbu28T
         HW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083484; x=1792688284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWnJ+H2sZYoV2Jv8w7ejHJBb3pXYIPz2WtL3bUBFqA0=;
        b=nkt0C1TJE9/sXvrZHyG4LxJMlOpMBn5nEvdMzAigr2IsJF+5julFf11z6vhriDmsp1
         y71x9gTEZYOukTZE0tbOoP2Ji0oQQOxoA7EIT5lh4yYVJCYuVLuNvsgIwjxLkvPTQsnh
         CrINWz3QCB2gesMccIfn4bAumnH57617DrV6AALw4g4zsxXriVmeAnljd57otyscpQ6w
         Gf4TB4BenEVNOgaUbMjcRW6hAKzW29nvAfwJp9wyQAH8fP7GUYTuWeRfpEL6Qr2OFPCc
         bpIKq9HI4iwAnlxBgbKfQKkmP8wGYxE0S2R969eYra5z2kb/wNePzM3YdCNnDZPysVfw
         zH9w==
X-Forwarded-Encrypted: i=1; AKwUvBzQsNtR9FZbaSVepbp3M7ONwcuosO+2l1H+4sqZzcdpCmUbGVDx1JmNil5Q0v9G7pUo9EswoKQvUOenNQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2AN+HgZqSFBx2TXseeG+1AULb82xB2l7qQcgVTC4ulwRiUh7G
	xynbv77MAzjqxK6QTLh6cJEQy/S8PfgmwLaGaQchA3Mw4sW6t9qtSi+FsY0RQl9C2FpF9Wu3wER
	1ITOqM5d5AAIodZ9zSJC2tbcx3SWZZfC6ov4heHEFEElK4OKrfvDDPJi8EuVNvwCLgHKs5pKPyM
	02AEvo7JFUYPsYzZiQ0jx6fKoZxWYSfQOwihUOTg==
X-Gm-Gg: AYBFou0AWLB6+AmURgY+HqSJRKq8FnzxyFSfUv+qJVdeWm8inrhdZhtA6iyEtf6+7nN
	0lg5zXEeyESb7gW0rJFtpogBJblIME6spBnn0qQV6DfyGJtlXznxcd2pG/SpLbmF5jpn8ShxfII
	9X59M7MzHZ+EszDoIZ2aWxDqRQm8J8GKEujwGIPWfoZr/WWa8evW4pbJGaYg==
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id 5a478bee46e88-35cf6678c8fmr10408706eec.6.1792083484428;
        Thu, 15 Oct 2026 09:58:04 -0700 (PDT)
X-Received: by 2002:a05:693c:66ca:b0:35c:f667:8b9a with SMTP id
 5a478bee46e88-35cf6678c8fmr10408674eec.6.1792083483848; Thu, 15 Oct 2026
 09:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014195640.430824-2-kj2864@nyu.edu> <atCf_85Ei_J9CDtd@kwain>
In-Reply-To: <atCf_85Ei_J9CDtd@kwain>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Thu, 15 Oct 2026 12:57:51 -0400
X-Gm-Features: AclHuK8axhoL9SJOQPtXMgXZpb7I487EoomfVtbK9W7aQp2W5VgW_o_At6K7uXg
Message-ID: <CAPqbLS2sM9JZ8VbrzWviV-6XNRniKib_L+seaKtnCfR3pwMMig@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ipv4: add zero check for snd_cwnd_clamp
To: Antoine Tenart <atenart@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, co+71b6509cb791e531@bugs.sh,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2NyBTYWx0ZWRfX/XenbMMOKuhu
 SBkXm1dT2ZrW5Pfvqv2HdYs2KKB49Dj5DoS49k0t1FkklW8snoWKUUkCPnYMO9RFC5WABxSP6v3
 4sP9uz1JhOleZIdk41nvdm98InUIGBk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2NyBTYWx0ZWRfX6TOFUaufbo6z
 ZaUR34N+3hjtPCKn8UsMzfVaqEG3glzmk+9QB36A+jvPyMloWyrgrbvtK4VcbKEAr2dSUr5m+9E
 H4/NNZlTBF1nTDVTD7LMmsa/BhNGoWx9SpSn6hOKz+nKUTiDDBqdl8hUIn/ROzk6A7qkEn5hXab
 UOsnVHeKpHXNfMUVbiow49OnORGjSjitB9gRd0WxNaSGkmXnkaeMjdDSjCS7cNGkIdLQF5InNle
 C9rX2zd+dHqVK3yoz2Z7l+2QTWc65mVylxv2XP9scfW04XbM/CCGFuxDtyNVU8uos4ITQJseHhz
 U2lr5ix3L1uu2InntNrSIEE0LBRZ8QNFuDM2vJO0NfIX2H/UaI2lHcHfevmRo2JRtpb5NKOvxc4
 CvH/RF4rNemiitNJzPp/TaBaEUf36gYtjg+ATUq0iGEDET05LD0cUUIX41vDCX250jhu5gZzfSK
 L/AITrAK1Givvu1WQSw==
X-Proofpoint-GUID: y7XvOpZS1U5n-TF63V15Bo2AYoeRO4Lk
X-Authority-Analysis: v=2.4 cv=OMeyTiaB c=1 sm=1 tr=0 ts=6ad1061d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=A3cO9-ABBa8CDv30UOuY:22 a=VwQbUJbxAAAA:8
 a=hKX_YmtgrgkOCiSBCTgA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: y7XvOpZS1U5n-TF63V15Bo2AYoeRO4Lk
X-Orig-IP: 74.125.82.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150067

I have considered rejecting 0 in tcp_snd_cwnd_set but afaik patching
tcp_snd_cwnd only would just ignore the problem. My current patch
should completely reject the user from creating a socket if 0 is
passed for RTAX_CWND.


On Thu, Oct 15, 2026 at 5:57=E2=80=AFAM Antoine Tenart <atenart@kernel.org>=
 wrote:
>
> On Wed, Oct 14, 2026 at 03:56:41PM -0400, Kaho Jiang wrote:
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
> > Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
>
> This looks like a refactoring commit only, 814d488c6126 might be more
> appropriate but please check.
>
> > Cc: stable@vger.kernel.org
> > Reported-by: co+71b6509cb791e531@bugs.sh
> > Assisted-by: LLM
> > Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
> > ---
> >  net/ipv4/metrics.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
> > index ad40762a8b38..e83a129a25b6 100644
> > --- a/net/ipv4/metrics.c
> > +++ b/net/ipv4/metrics.c
> > @@ -54,6 +54,10 @@ static int ip_metrics_convert(struct nlattr *fc_mx,
> >                       NL_SET_ERR_MSG(extack, "Unknown flag set in featu=
re mask in metrics attribute");
> >                       return -EINVAL;
> >               }
> > +             if (type =3D=3D RTAX_CWND && val =3D=3D 0) {
> > +                     NL_SET_ERR_MSG(extack, "RTAX_CWND must be greater=
 than zero");
> > +                     return -EINVAL;
> > +             }
> >               metrics[type - 1] =3D val;
> >       }
>
> My understanding is tcp_snd_cwnd(tp) can return 0 and then the divide by
> 0 occurs in tcp_cong_avoid_ai. Have you also considered updating
> tcp_snd_cwnd_set to not only warn about invalid values but also reject
> them, preventing similar oops?
