Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9443B9927
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.242
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273945; cv=pass; b=fHjoi51+08pF1cnv1wnESj8a2k0drjTkFEc2fp5ao13oB+K9BGHKv/lPsCKMRUd+8kANVgPr5GsdzVxKrp6Iq3wXxL9Ry3gy1ykFJsA8MImzYJFy1W3Zj34NqalP9l336fu4lh0/TVCDjOEKblNle2JiV6cOVK07NPoy9Y4M5K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273945; c=relaxed/simple;
	bh=2z49YO454x+6uu0rrqxdOYf2rOaScddUZyoqUeAIaBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QoD2Yup9n6wmrFSz2HhFhtsAzZruP1mI/OSsu9LGAMlIcN9o//1U4AkkMIAc+G1ytLX8YdihrL0KqPSnesJN+DmnXYZ7ivKyO/uKp2Jikm42NsR1pFitwgtcld3hLHygiP0lkSYlQJ25fTWs8kvnU+iCtKqQngmzl+AhfYB0tZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=k5GDwwz0; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=csRmr1rj; arc=pass smtp.client-ip=67.231.153.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="k5GDwwz0";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="csRmr1rj"
Received: from pps.filterd (m0119691.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HL3HV31977565
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=s
	LoXZ4zrSuG0DF9gDAxCqxwkk2HrNuzfj+cEZxHtwEw=; b=k5GDwwz0SksfR0foN
	zeOQAVNr0qigINCmH47KF3LDZHH4QR+xJxgzSfVVnXFifJqBm+XL2MYTq4n4UYVC
	swm+bd+QBGfKF+TQSndFVcjnegFHXZeFp4+rtBHIod3ORqtbChfixDqUG3FH0rB7
	SslL5A7gY6L24mKyAeruDMtLc3Sk6yozF24+v8Gb7YY2lJcE94R/4XEDQhMBToIa
	Z9QF8YXt3a6yv6Pk0veNwzQ6BgmZYkA5KLxaDEWCchpSVwOr5iI5SSLKXxQatgMY
	V/e5paQHUhZtFUOYIsTrpW8ad46llDUePcIH8mu2+CRzPMny+Fjme4qkXvQlCEnX
	w3peQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hcgkn0ajv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:21 -0400 (EDT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1846141eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792273940; cv=none;
        d=google.com; s=arc-20260327;
        b=J7ba3Z8wtZknutzfPyw1GdyI5ZW6NNSSHSv9UVUSYO8zUcD1w6WfJDhxjC7OgVlYDK
         6HM2xA3fZo5benMLuqEZJIV5nIrzLmISEOOIKm8K3La+mCvlHKe9bEKBm15Wn9ORInSv
         NwNqsKrhfW8BpAXmmJDI6MfGd3Dj0tG7dafT+HUFgnD/uu7oUV2dHFvWvJBUTsI5Z/62
         tKWLq1Ce3COMfIsENrA+KYLqlQMfR/BfFEg2TxRp1YY743wMayc8XSiXE9gb5yCA81WO
         tqmRkTODtJaiIpgaGew/Tqk8vV1dZlmofuTlP5unHSFBgdZyrolbFOWtTk1bX3ykIBWA
         OQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLoXZ4zrSuG0DF9gDAxCqxwkk2HrNuzfj+cEZxHtwEw=;
        fh=R/j4ZQ7R9FXXVvj24Y7QABPvlLtJziOg45ScTwitU8Q=;
        b=YboaCJAFXJYS8eEep1e0p/zFpjJxRefLF1lqNDkxyfb9udAEoyQnL2L5K2n7V+UlX7
         xfdzHqbNtSSkwqdps1yBLiK2eIMtDZ4W3r4R5vcdSf0qWZrIy/KdtpaRM46kjSfHrHl0
         KwEC1CQqKZNGbNVdZ/drRcisAT7diphHrUZkfnxgjl8ExMSO2D25rH8Fbp94xIB+tU5v
         G9wTm0SqKLEqrcqCizRWBVFaIJMNsLImYuf9Z2Dkoki/fqAmORYfbwOL9Gl/fBSzu4e7
         NOv/ndQEW2VGpXjQ+DUmx+LHdZWFkOAMLgjJP4T7kRXuUXRR33bOMX9wRGmMpeECdYO9
         HSGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792273940; x=1792878740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLoXZ4zrSuG0DF9gDAxCqxwkk2HrNuzfj+cEZxHtwEw=;
        b=csRmr1rjJfeLVFrvJPCxSndI+Be6ru8Hx1tEVI+GGUEL5RDHwLzRxaRnFa9dN1TznK
         wg+q406hIlWMm3EinPudV+XUUzYRSttB7+CfiTE85XNOXJKlQrN9ityO9WXi+3W98xz4
         T7FLPHerizTBw1zflkzn9KW70ncRn8WO9M2zkfk7xpuyBj8vrdXqraQDbEniYTJjeMWD
         Igg0qt12PLQ1OptXYuyLFN1WaDoLKdi74U9d3vRAJNJj6fPyU7bGT94dch2Fvc8x7r+M
         ec6k72+rZXIv8GSjeKB/P8rlnm72IuzvHzV2AjWwAHCHeIX2kh0cnwSaJ+amILMf0/do
         hMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273940; x=1792878740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLoXZ4zrSuG0DF9gDAxCqxwkk2HrNuzfj+cEZxHtwEw=;
        b=Lq3MjI1Rj+M0tR/9pmE+FjMzArnUvdGUhMACm2PToZzddeEPw4C4iq8gJu5oY3hO/p
         KifbuMZLhJ4+gwwZX6EqpXCUFBisQBFiHZKVIgxFG6eSe7QNLp2+BZmswHyqEU7tDha1
         RmHFzU3SX7Ilqofj3HffsEcr/tfGeTaidSlZuWSJKC0lf2eXemMb+Djtz1HqhtD4j1z7
         9ooOBwhljewP9AQBzmWohoML5HF3SCPLnaGzyLkJ5H6At5rWfkbkItU/URNPQx5JOai3
         1+rxAqiCBDR3twvGP3B0hbE4+6ai/7KeM8WAH+hOavS77TgK22n8EDCwtDoaj24eqRHa
         mosQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgwckOMfGohIPoQzXnQISiGTWp+CmWVLxmhwARxa51/vSXubxibsgJcMpcOHUmsABbCjNfOGYotNyozeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+ia5ZUAlXxZ9E5luGqVDVe0w8Sw/IPw7WvsmcyR3bYMvykQzq
	1uRhy/5Cb3Vfngta55O/KGGzQAyxWa+/Ndsy3D3VvdZJf/pekFEUpXdihmV38m9kah9ZA0JKzW8
	RsciRPcP5vrZm6b88dCvjpiNQj/sQjlsuI3GhBsrIG7TC84Spv06H3k/cwkFEjalNNgiDFjf/1s
	ckkhn6setYowh05mDk+tSiEXV9Q7sthtEHNgeqN7g3Cs9zDhmVaRY=
X-Gm-Gg: AYBFou1uXCsBTCTCWhmvCVocnDNrIwD67h+m0F/QVTUyHQge/q1lVLJe41iAwKK5zQs
	ISE8gUQcdWQrau0Pm2oLt3CgFDLylP7u5LE+iQ+JD95sAF1RarKaKUEnUnrl3F9B6HMeTwe7XXB
	6E38ugP+CLTfhFwn2aXH64asiAmYyD9WswyCSHDJw0fA0H0XeYBilrRRKl3g==
X-Received: by 2002:a05:693c:66c1:20b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-361a264acaemr5212458eec.38.1792273940405;
        Sat, 17 Oct 2026 14:52:20 -0700 (PDT)
X-Received: by 2002:a05:693c:66c1:20b0:35c:85fa:5a61 with SMTP id
 5a478bee46e88-361a264acaemr5212420eec.38.1792273939584; Sat, 17 Oct 2026
 14:52:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014195640.430824-2-kj2864@nyu.edu> <atCf_85Ei_J9CDtd@kwain>
 <CAPqbLS2sM9JZ8VbrzWviV-6XNRniKib_L+seaKtnCfR3pwMMig@mail.gmail.com>
 <atHQupHr7_ocAJ_A@kwain> <CAPqbLS0XXB53mnymFVZAVodc73r8E52PWRnxSwj6k8umqC7SAA@mail.gmail.com>
In-Reply-To: <CAPqbLS0XXB53mnymFVZAVodc73r8E52PWRnxSwj6k8umqC7SAA@mail.gmail.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Sat, 17 Oct 2026 17:52:08 -0400
X-Gm-Features: AclHuK--2zbQAhbE8812SRoKdfqvhlJ6jnYw1O93FmhhB5V2pen0FpVk25aFiKQ
Message-ID: <CAPqbLS1uQ94We27Ot54oZmQ+iEwZfQztmOvz8dDRo3kOCq12PQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: ipv4: add zero check for snd_cwnd_clamp
To: Antoine Tenart <atenart@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, co+71b6509cb791e531@bugs.sh,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4NyBTYWx0ZWRfX6jgExO5z19KP
 Sf35S5UQTuZrUsGoIK1VqoxpWm6MoJRqDL0ypLT0ERZ23hpPkeoxfmzssxv+ABRA3HKXtCEiQvY
 H01C0+FJe4wss0yGxMHuaTM6VD6n9sugHczThxgZzjKqqeNDh8iPFILyG0q4rgmTDYQWcVig/jX
 fido2fP4bZJSDLhvQ/56J67k/8POcUvX7uzuwkWpuDJ9CrN0NgpE14vimE6+z+qXB9otlKwoe5S
 9mWDzmo2oplYo3pZkTGW963OSlPZjic6TR8GjXa1Q/pF+ukgjeYM9ldeGboCXL4s2xlvaNRzDz4
 Xg2ONxr8fQE/tEO5lQ4+OBRzh1Q42UuI3vUiM9HjyF3OBk0Ye51a7WGRWce6sWRV5tbYHbGjgJ2
 5JtrxPtfcB0EzRgtUQldA8zQRkugk0WTEBqze8Nx/n5G9ryOvUzIBDWJVex/Ox1A4Q8AZWx5FGz
 tkAKt0DmGvpsqmCBEnA==
X-Proofpoint-GUID: 14FCn6B8crElfKpESLlGD6LEA6wSjv65
X-Authority-Analysis: v=2.4 cv=C+58WgP+ c=1 sm=1 tr=0 ts=6ad3ee15 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=tr4woWNwjDflhTIOjkZU:22 a=VwQbUJbxAAAA:8
 a=s1qTDB3tYtKRdSl9UekA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 14FCn6B8crElfKpESLlGD6LEA6wSjv65
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA4NyBTYWx0ZWRfX4e12Buf1br5Z
 3yyEj4yQA5ye4hPd3b81PeLkEfu+VRvAgsMQKsJ5K6F/z+SVwfxXDb2a3StFFsf4guV0nIMt+ud
 PRkXsbmTWY4aju7JMpBqc/GL2xF/rfg=
X-Orig-IP: 74.125.82.200
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170087

I stand corrected, by not passing any argument to RTAX_CWND, the bug
can still be triggered. Doing fixes on tcp_snd_cwnd_set would be
valuable. One idea I have is that if 0 is passed in tcp_snd_cwnd_set,
a default value of 1 is written instead of writing 0.

v4 has been proposed:
https://lore.kernel.org/all/20261017214845.28769-2-kj2864@nyu.edu/





On Sat, Oct 17, 2026 at 12:12=E2=80=AFPM Jerry Jiang <kj2864@nyu.edu> wrote=
:
>
> Afaik, I don't think any changes are necessary to tcp_snd_cwnd_set as
> users are completely rejected from inputting 0, which could give the
> assumption argument passed to tcp_snd_cwnd_set is a number larger than
> 0.
>
>
> On Fri, Oct 16, 2026 at 3:29=E2=80=AFAM Antoine Tenart <atenart@kernel.or=
g> wrote:
> >
> > On Thu, Oct 15, 2026 at 12:57:51PM -0400, Jerry Jiang wrote:
> > > I have considered rejecting 0 in tcp_snd_cwnd_set but afaik patching
> > > tcp_snd_cwnd only would just ignore the problem. My current patch
> > > should completely reject the user from creating a socket if 0 is
> > > passed for RTAX_CWND.
> >
> > I'm not arguing against the current patch. My point is warning on 0
> > values in tcp_snd_cwnd_set made sense before but since this is now know=
n
> > to cause oops there might be something better to do there.
> >
> > > On Thu, Oct 15, 2026 at 5:57=E2=80=AFAM Antoine Tenart <atenart@kerne=
l.org> wrote:
> > > >
> > > > On Wed, Oct 14, 2026 at 03:56:41PM -0400, Kaho Jiang wrote:
> > > > > User can pass zero to snd_cwnd_clamp via RTAX_CWND type.
> > > > > This could lead to division of zero error if not checked properly=
.
> > > > >
> > > > > Oops: divide error: 0000 [#1] SMP KASAN NOPTI
> > > > > Call Trace:
> > > > >  <IRQ>
> > > > >  tcp_reno_cong_avoid (net/ipv4/tcp_cong.c:510 (discriminator 1))
> > > > >  tcp_ack (net/ipv4/tcp_input.c:3517 net/ipv4/tcp_input.c:3873 net=
/ipv4/tcp_input.c:4440)
> > > > >  tcp_rcv_established (net/ipv4/tcp_input.c:6685)
> > > > >  tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
> > > > >  tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
> > > > >  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator =
1))
> > > > >  ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator =
1))
> > > > >  ip_local_deliver (./include/linux/netfilter.h:325 ./include/linu=
x/netfilter.h:319 net/ipv4/ip_input.c:262)
> > > > >  ip_rcv (./include/net/dst.h:481 (discriminator 6) net/ipv4/ip_in=
put.c:492 (discriminator 6) ./include/linux/netfilter.h:325 (discriminator =
6) ./include/li)
> > > > >  __netif_receive_skb_one_core (net/core/dev.c:6297 (discriminator=
 4))
> > > > >  __netif_receive_skb (net/core/dev.c:6410)
> > > > >  process_backlog (net/core/dev.c:6761)
> > > > >  __napi_poll.constprop.0 (net/core/dev.c:7830)
> > > > >  net_rx_action (net/core/dev.c:7893 net/core/dev.c:8050)
> > > > >  handle_softirqs (kernel/softirq.c:645)
> > > > >  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel=
/softirq.c:758)
> > > > >  irq_exit_rcu (kernel/softirq.c:775)
> > > > >  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (d=
iscriminator 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
> > > > > RIP: 0010:tcp_cong_avoid_ai (net/ipv4/tcp_cong.c:482)
> > > > >
> > > > > Fix by checking if user pass in zero as parameter,
> > > > > if so reject the value zero.
> > > > >
> > > > > Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cach=
e.")
> > > >
> > > > This looks like a refactoring commit only, 814d488c6126 might be mo=
re
> > > > appropriate but please check.
> > > >
> > > > > Cc: stable@vger.kernel.org
> > > > > Reported-by: co+71b6509cb791e531@bugs.sh
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
> > > > > ---
> > > > >  net/ipv4/metrics.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
> > > > > index ad40762a8b38..e83a129a25b6 100644
> > > > > --- a/net/ipv4/metrics.c
> > > > > +++ b/net/ipv4/metrics.c
> > > > > @@ -54,6 +54,10 @@ static int ip_metrics_convert(struct nlattr *f=
c_mx,
> > > > >                       NL_SET_ERR_MSG(extack, "Unknown flag set in=
 feature mask in metrics attribute");
> > > > >                       return -EINVAL;
> > > > >               }
> > > > > +             if (type =3D=3D RTAX_CWND && val =3D=3D 0) {
> > > > > +                     NL_SET_ERR_MSG(extack, "RTAX_CWND must be g=
reater than zero");
> > > > > +                     return -EINVAL;
> > > > > +             }
> > > > >               metrics[type - 1] =3D val;
> > > > >       }
> > > >
> > > > My understanding is tcp_snd_cwnd(tp) can return 0 and then the divi=
de by
> > > > 0 occurs in tcp_cong_avoid_ai. Have you also considered updating
> > > > tcp_snd_cwnd_set to not only warn about invalid values but also rej=
ect
> > > > them, preventing similar oops?
