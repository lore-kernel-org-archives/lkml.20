Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7841A346FB3
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.242
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273933; cv=pass; b=HjdPQ7QNilaZhtudGBZkeIyhqeAKNzQXmrfN264IZ0LV8eelRz4tPd/Cn7dDjNuH7ELCi1qJFYnrMfkobkLfnn6n/bnTjglj/rhHoYzU/kB6SEwKyh9Z0mS3lWVkBQIl6g72MbPDDcuJcWgL96S9rTsO/3R/u0i2Ji6SrZW6zkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273933; c=relaxed/simple;
	bh=d8B6iYTbhPZ4eQhHbMclnxqxpRbx9Q0XEc7yVaOrrpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCAjsdhH9vZ3DIveRfBJSvyXiMBWYdqe4SSLWG1X2UhmaGyYRvrDJKJHWdzxrcGg7hIVuDXd9Jriedn+TsAzzH++f4LWXAz0m132w63m03x2iXozr6m1dqYdFYDA7pLOw/kUsNEoZYiz0rARymYcN3WoCKzaGdyMbkXUPdzHceA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=hmE9i7Zy; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=lPN/qBNM; arc=pass smtp.client-ip=67.231.153.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="hmE9i7Zy";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="lPN/qBNM"
Received: from pps.filterd (m0119692.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HKhvEU1885172
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=20180315; bh=8
	qt7LuF8GRgjS8yzBLI9aYUymptt8k72tgwjkn5uLH4=; b=hmE9i7ZycV02BfcjP
	HkDp3dloe3OyHmC1Fk+R34beoPq8p5iKPRXyIscXZXqM7RiOOR70OS4oSzLDHmQU
	8yuH0mLCQZ9+/unn5SYfpDiHbOWIKPIYvdzOb5BaZRIjyZRfIoadh79pxCJ7P9zQ
	M1FeuUlEx4A48kiQDGcaLeozjbDkCP7vvTCX8VtJBnl1k7rDgIrzO8aNOob41768
	ToEAGFSgOS06zU2fzsqxzMpxa3mMByIgmeS2MHPHvpI9cdej2uh64rmp90kcXdd1
	cdE6GvwJLTl95m1IfDFkBei08WbqRs8SB9viHHglyd62uMKbR85YNIc8Oho2TX4l
	TMwEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hcgaj0eab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:10 -0400 (EDT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so1077262eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792273929; cv=none;
        d=google.com; s=arc-20260327;
        b=SEw9fBvtDZpmH66MXY/12e9qMxP323OnqHJNPyrBg9nZs9rIHNbusn2SsUkueM+213
         el1nkKOOLOqq+c2kCj56oilP5oFI4WcnxeyuYYsnavoJzz80GpBmcyzhnQS/tfASpM15
         kAPy3vBH1T8ik1c9rGegkVfx9fpCIAEvMOdGSrbPVkwN3BCjKa014FvEWcpLhclnpCdy
         vIWTF4sfVYtHXUsWNI3dqhJa+ln3YOr0zteZUZsxOz39bTD0tlZ7FwcffImDkz6VK3xn
         ESQiBHpOlGXBmN9P8ESUfT2z6NXxFnYWYPLVbRAOck/7Q5z3fF3/mExWEn7o0sKv3ZT8
         IJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qt7LuF8GRgjS8yzBLI9aYUymptt8k72tgwjkn5uLH4=;
        fh=hPkKx9r0adMS5Gk/4FA5AT6FKmzA23VDn92VmkIb1xo=;
        b=Y4bZ7YcGKiM18GT5JKMZ3Wm0oejoQzly8m6EMr2nj/QmMrrsU24q9aOvjrw5x6qUtq
         ++vihWMFpUY8F/jIqOCS84V0/oJ/v7Ib7iFOFEQw9PjaG8+sOqCuzO9dDlA0e42bYaqU
         2dgM628uQ4ZwYW3sI/T0YlsuKcVswlBfvJaWZeGjrjK8s9Hek49hJ5weMwQqAS9o8XzP
         ksFdP3B7YYUovucVKg0ak8+/KXLJf9EH+ClXfa/1P/GDGhgbKx3yCWznGlw6YNNLmH7e
         XLPFUQ6KvcXenYVLNUwgAReLsgHIKF5mpMMZnsobsRCzgft1brwYlXZ+Z/X9TiJspL+K
         tL6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792273929; x=1792878729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qt7LuF8GRgjS8yzBLI9aYUymptt8k72tgwjkn5uLH4=;
        b=lPN/qBNMb3s7F/uEvK7v2u3wVZmyOWknoqR4J1UH4O3aEr4eE7EwJzv33Nhr1R1Clo
         +f7grPHEa/xrehMVdyb02DZnvj9v1y4k6lLYS9I2+NmAslczRwtAnRQhJba9Fu38JD+8
         ReXIlY+HVGmiA5BU4GgUiMsjJBaDgzMgDuq8DrNQuf4iIti65XmPNHlMrh14PpDONALJ
         SCh6TCFYNzLi87JjHEhfi/SvshXAFCTwykvElfzwK/lrt51qZWKJ+9k+De7kZ0mbc6o3
         7NWIldeeNvxsL3NT/62EB2a+3NtvC9yTk+Bok5oCWJ29ZPFupyZjxIcAic2iwMe5F52u
         DIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792273929; x=1792878729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qt7LuF8GRgjS8yzBLI9aYUymptt8k72tgwjkn5uLH4=;
        b=C9+YPjgKF4aK9C6fph+BEqPxkdsgvkhqDqhyjofBhg8Aurw44SeL7fV3ujYP0QQGjz
         XHnpnw7Lxbe9TK5oEd0QX3hukG2SYGDvaG6YSJE4v6ZA/WApwky6pYxZTR7PhpDr5wuP
         63MZB04Cz9BbfgweJ6imn5q0swENZ34U6/Pk+Lpu5g4Ba3IwR0vnz70GSEL4PbXihSAO
         xDiz7TOQ+fOXiXz+dUFzZPVQjD8G6cMPlAoCwQui4ER/gFQ5jeYWNw1ofX+g2IHSXmDJ
         CJweDaX+YDmjp6yiJQ3zt+2YHPO1gW6cr36F7KkJ2nyYoz4OyfCEGPEa3jujFmlUxRT0
         gAjw==
X-Forwarded-Encrypted: i=1; AKwUvBy+neadJkh00oR9OP9gCZWjwWrHxRR9fKMjgWfSLCrVPCEqXH7GVGt3KGsPTouse13EmH3S3rzeoVECRQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYDmADH/VRDnTcdvtZfVOxoSG979ZMpdlJYT2Egc1u7S4piNxz
	er+30DhHgST4OnjT5apSrTJp81fBduz4oRNUqHBT8kVcdrgeQM/dC1GcBFcTR/J47yrdxql9Mqh
	te7shoS1Ypt46E0w2PH8q3JzC6V21Zn0Ga/veTnR0hteEMCLFBH3BLU1Nm7RUUcTwVggfGg+HQb
	DeSJ6Dgzr9jfSBcUiyeyEJ8wvqZ8k+16E7BJWZGA==
X-Gm-Gg: AYBFou2r5ZKwCqbU02X46p71iLT9IlTMhnlEYwasSTCQX7BZs8utsh+D0Dk6J56VlZV
	3KEMseoZEZnPwLuiJst45llWXi9LhQ4v42nmY0NazHlUV0K1RMF3W89rWjGcfzuYTeOsZAyY36d
	7Bg8taudzJWwTLjDV/ugsV99/JGdFyWJyISme8p69fMLxGNvWxhYZbRe2RfQ==
X-Received: by 2002:a05:693c:42d2:b0:34b:3f7d:6105 with SMTP id 5a478bee46e88-3602e3a6861mr8093133eec.14.1792273929011;
        Sat, 17 Oct 2026 14:52:09 -0700 (PDT)
X-Received: by 2002:a05:693c:42d2:b0:34b:3f7d:6105 with SMTP id
 5a478bee46e88-3602e3a6861mr8093109eec.14.1792273928367; Sat, 17 Oct 2026
 14:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015201549.4023-2-kj2864@nyu.edu> <atMFPKhON1IK5cxc@google.com>
In-Reply-To: <atMFPKhON1IK5cxc@google.com>
From: Jerry Jiang <kj2864@nyu.edu>
Date: Sat, 17 Oct 2026 17:51:57 -0400
X-Gm-Features: AclHuK8V8PqtlumCUfPitjiENks2rIhGVpjBZixB0b_eQMRRbzEBuswi5lOYgMA
Message-ID: <CAPqbLS0vsCAPqoAwqZ=HSCqfH4SigQTuv+dn_ByED-b2ickRXg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: ipv4: add zero check for snd_cwnd_clamp
To: kuniyu@google.com
Cc: ncardwell@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, edumazet@google.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+71b6509cb791e531@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 68CluRHbLi6pYgDnDTBbDG2EaSo8rmdi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA4NyBTYWx0ZWRfX4lhsGI78Jt9n
 eDyekk7LVpJdWEZS2nIppRx5lA4sbdGWfzM/oChqFYOYguyqJ7C+JcsUJ1URFyknolRQcHz+3O0
 4Xm7M3gGMtEy7wAp/vUG9S8N+rpL5dxEfKpZ2d2kfBWyrT/5yx+UvaQh14WvWWOf0erTkIOrJ0m
 wxo7tcCPGaAxWU6S+GKJGtrO9zQ1vQ/O60S0dYhbmu1VUbY4DmZfzAGUG63KhMIcu7wYYJ6TNeG
 CBI7xKZDc2WGoIC8hbBlAC2X55nTeCraa0s7FLoDETHNTxZ37Na2lbk6sVAAp9WjKKc0fWkvVEg
 9/bz44QJlzf9hECtlh6vCKN1+vMM0RvKQNEug3Rjfgw1NuVXA2Sg8ap3x15P8/AbY5MOi4yhUOy
 oGny419HHzVpHT6eTH5YqmzxOSoPsv1WTqbfylWH2H6D0Kfm0iRt6L2D9Dk9Rh3q0+5s4RymA3T
 /lHTwN6UntgF464VBEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA4NyBTYWx0ZWRfXx7gG/OlX2kfb
 Y+YQ6BmslBqrSs5ncaLk+5i/Hu1pWNSHfpWpDqydGxq0Xy76SRfjJc7ua4pd3CvTn9efDugH9Gs
 nclULkpSfzMZs8D44gnp65jd8n/TViw=
X-Proofpoint-GUID: 68CluRHbLi6pYgDnDTBbDG2EaSo8rmdi
X-Authority-Analysis: v=2.4 cv=RMomjIi+ c=1 sm=1 tr=0 ts=6ad3ee0a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Se5WoFf3ZZRiLcel0nel:22 a=_0uBWF9-lnOxR1nRej8j:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=LDwnR17CkXKMPNxMdHAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Orig-IP: 74.125.82.197
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170087

I've made some further changes using suggestions on my v2 patch and
using !val. This change should prevent all future errors regarding
snd_cwnd and snd_cwnd_clamp being 0.

v4 has been proposed:
https://lore.kernel.org/all/20261017214845.28769-2-kj2864@nyu.edu/



On Sat, Oct 17, 2026 at 1:21=E2=80=AFAM <kuniyu@google.com> wrote:
>
> On Thu, 15 Oct 2026 16:15:50 -0400, Kaho Jiang wrote:
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
>
> While at it, please check RTAX_INITCWND too (although it is
> ignored and TCP_INIT_CWND is used), also use !val.
>
>
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
