Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820013;
	b=m5UpGglRW/L0Av+zuLX8EIGhQIXeK89EjQc6oowYTxaVgAq8FUpJeR5QFOdOL/cwi/ia
	 NvkeFQVX8iVmOlMgZg/XEoyXfFVIXoDqqQOIgsaNcH6LiZZTBGpNYm6lkh1fPUOBjEZ0S
	 x7oJO/qKsRimA5bH6OEQ/2s6Iou+5Gh7lvCssCVk1JgC5CZG0TIlN9n1Yy5V/VOgveFGR
	 /BZut3Z17pR6Cf3ViiRfaRolf6hgfMVcNs68s1m97hNbHqzvPQVhXnWH0/946kktuSizj
	 Ap2eeV5VXjd3RcZlh6aqf+B0oh/52zKZg3sC3DK4Ls+ww2AlHh25RH/2BdFhon2kZ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3pchkY95SlYVMfXzEW7d1/IDKmFrvcEI7YIYQHnUSg4=;
	b=N+vUdbYevWMF9u6wU2bR0JTNJo1bDBS6T71B8Z6q7XTQPW+ezaX+Vk4U7S5WAANdDg5b
	 KwkojUbTYRumz5+nWFykqHQn3I3B7t8FsZZsWvAgwT3u5HxopahCOhdUjwG3YrSVujfdT
	 sTnfCe601MHcVQs2JbbGl2ppa6TdnIY0/H/b2Y+dEYx8jzaaO8Uxc2FXSR+E4iYwrrDj6
	 7btK/8+0IKA2ODps33LqAraLIqUaq4qjXCXJFR7eH3px0cmT6IFrSV44kVLYU2EDSvEhg
	 FSfFsV2EK/2XKpBa1cNFnDMiyt5uUVsPB9GCkNjhWfw8krQbC3DL6DRt7mdnDtfB3tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgh5CBpU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C460A5BE1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9C460A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kgh5CBpU
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f8a519e215so942369eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793820007; cv=none;
        d=google.com; s=arc-20260327;
        b=WI23tPiuqwAek7x7UpzX6ppgD13AV/Zwp5fXjk0r36ATQGg6a4EyMOljv1LH1PcVay
         04yTeANvhf2I6uEH0EzM2kHr5HRrM3ZEkpkFnIcsHVWbbTK9cehGMTT/9NzUntZ+GMvI
         kYvUPcRzks1cr32Smsv/w8j3Vzt3lxPdUVSQw1Hh0Ovy24OytMLN50VUUdG87H+0gAkh
         1x6YH8qf8eBCGWP0Y/HrN6OA0HBDyENlEPtsSwQuSWJIiGvixAZyaVOfc4k2nuM5X4Xp
         EE9VXj2B7V+SH3E3IL+0Wb3Pk8cKCXfRptxBW7EJxQccVYFAqelnpFnvpuEA9Uievnfg
         KJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3pchkY95SlYVMfXzEW7d1/IDKmFrvcEI7YIYQHnUSg4=;
        fh=K4Y0Ny0iJNACte2xuRxVmRg4RFWhMZ8u1iVclYD7GaM=;
        b=lqwOkCRb8hmslYnNPAsF5pAfbS72+0y+LYZPq7ELCrxPRxrU07HWgzno6t6JYVQ9eX
         Y9Vrr0vDJ9h4Kye/Qy/i7vh1/pauj2r9E8ZlmnhIKr3I19/gG/tNaCUhxaQsyyLZbpV1
         O0oKF5eiMLnPOnYu6vjy3IsATpxdJzfQpaKzFLUOre54P2MpCqykGYvepttfSzWYyjix
         XUsaPtGUDAExwC8SizDY9OBZxSdBjIpd66fO/I9trnp93K3MZVExM1m+hvhL2TEqVC32
         jMUX8ZjPT1i8B3hU5tHClhIkJaqi2wF2zg+7pNfs9OILgFIzKReB6RFxpILx6cJ8r4ZC
         Xitw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820007; x=1794424807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pchkY95SlYVMfXzEW7d1/IDKmFrvcEI7YIYQHnUSg4=;
        b=kgh5CBpUCbeg25Kx0eJ4+ldfnPlPvQVd9i6/p/3oEe6WuYQu8JySwggJCB1BuiKlNh
         BVWjdcQvCskG0oFFHuy1rJN/ZD+mDg9irkjJ8EF1dfoQPk+FhsAE1PlItaadBjPmGfVp
         KCN7kAMdsqLuk+ndYVnvaTbM2Q3XgEQ3HhdEYSs7bpwgU6fk9ptElcjH6bfTG7HqYB8/
         VJMILPaGdvAH5MIF4ZjR378gn0p+8YDLH8XFgXpQdSjtiHPWj7a5c2DuFc3nK3tKqv/+
         hAED4unduDBzG5FDXENKuAxPpI0f7DXP7DdL1lrLyHb2+UM7PAE4XlnddFb0SiMnwwN3
         /7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820007; x=1794424807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pchkY95SlYVMfXzEW7d1/IDKmFrvcEI7YIYQHnUSg4=;
        b=I7B8I4UYPkn8wSkrNKF41JVBnjWRAsVJwbnatt00IUfeQ0FfZ7H2m3KxWVfbsiElsq
         RY5H9jdsMPd8t+mH17j/7ax+38jghfEh0tnfWIMrw84LKCb2EVza5xp0boYeejOV+dTJ
         +nYJcUhEQrqXWX+x2nAsUfnSiY6MqdckUAjWa0OInXmQC04YSrORPDuXM91eXmAAkhUb
         L+K/cWArchmQK6/Sn+I4OLZnrOa6/a1CjaSz6rMPHyqhf/IoMgH13vrZAnUsz9P+AnXA
         xwxyZUEm6R2MY3/F1qYKcgw12QHvlq/dobju6jXO6rDxKh39moxxwef0rJ/Ikba50DBu
         Ic4A==
X-Forwarded-Encrypted: i=1; AKwUvBxeypk0pz3iSYrqJm+z/lR5cg5xf9Gr0RUWZWq9X+JCLKotnbRZWJum++Oi1Httb22LYTRu4W52igaqBYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UBkn0nFURRr2k/u4kKbROBd/eCuvJbBzqieTyb9MC+Mz/fjXu
	5t8O+ZFX1K4a8lt7up6u5YgAE7Hjt1j5/J3hCjuqaPALwrx1SrVoxmsvmPB+VHI087UgymFAGwe
	bgRBa1C9nvVhieOfviLVj/JoMVkuNRCU=
X-Gm-Gg: AYBFou2DN+buTP1AWW0mdZx7MFV2sMg4NWZWZLgA+9jIOcO0KqpHo41Ms0syNmQr1JB
	19EuvpawdNCSCT+JBAylIg3HLrxxr6ukeEQRRN8fWSWztIn8YRa8PljkO+UiGdEo1oBLlbuoE3o
	Vf1/S5imNwO2yTujGE/jAZbWVkxjdaS4VSi8TZHB/ug8OYWLb8N/tcqAPg0iEk9v8sw02jeCVv4
	LFAV99mOp7gwxYM5hJN058UDa9vDShDMniurPHFAbcFiA1vXIRgXaQuPkcjoDeVAnG82B0QbnLM
	MTeNUkJssBtLziA8mXq/RBHz4az0KAfeGl+gmsgVYVDWUm0LpWn4RPsucU2WFKjS0G4wi0GMnGd
	4whigFn08hbBRGFOGEwBL3yA+5LIPDsRAXobc7XyhruAut1OQMFpHkTRa4j+p
X-Received: by 2002:a05:6820:60a:b0:716:c870:7eb9 with SMTP id
 006d021491bc7-716d1ed0d87mr313916eaf.17.1793820007417; Wed, 04 Nov 2026
 11:20:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103103633.2707416-1-zhiyuzhang999@gmail.com> <CAL4Wiip0RPZkfrwHeuNp6ntVWarpkL=wJ-wW6sUvNzYWS68s3Q@mail.gmail.com>
In-Reply-To: <CAL4Wiip0RPZkfrwHeuNp6ntVWarpkL=wJ-wW6sUvNzYWS68s3Q@mail.gmail.com>
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Date: Thu, 5 Nov 2026 03:19:55 +0800
X-Gm-Features: AclHuK_BR4-6TIohRJS_zawjA7_IVa0Ao4YBLhd308J7rBy_Y8iFzOZsQJyitaI
Message-ID: <CALf2hKvGy9_wFYcmhdegEHW3OrDovJQ_t7_B98ZwE8erwyykWg@mail.gmail.com>
Subject: Re: [PATCH net v3] tcp: prevent cross-family skb processing after disconnect
To: Eric Dumazet <edumazet@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, 
	mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Tong Liu <lyutoon@gmail.com>, Qi Tang <tpluszz77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eric Dumazet <edumazet@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=883=E6=97=
=A5=E5=91=A8=E4=BA=8C 19:03=E5=86=99=E9=81=93=EF=BC=9A
>
> We do not want to add yet another check in TCP IPv4 fast path,
> for a problem that only exists for IPv6 sockets.
>
> tcp_v6_do_rcv() already dispatches IPv4 skbs to tcp_v4_do_rcv().
>
> Simply stop changing sk->sk_backlog_rcv for v4-mapped sockets
> (tcp_v6_connect() and tcp_v6_mapped_child_init()),
> so that skbs found in the backlog are always handled by the correct path.
>
> tcp_v6_disconnect() can then test
> inet_csk(sk)->icsk_af_ops->net_header_len =3D=3D sizeof(struct iphdr)
> (this also covers subflow_v6m_specific).
>
> Thanks.
>
> Untested patch:

Hi Eric,

Thanks. I applied your untested patch as-is on top of 5838f10563d5.

I agree that keeping tcp_v6_do_rcv() as the backlog handler for
AF_INET6 sockets is cleaner than adding another check to the IPv4 fast
path.

The patch fixes the reported bug in my tests. In the native IPv6 to
v4-mapped race, the stale IPv6 skb no longer reaches
tcp_v4_send_reset(). The disconnect/reconnect tests also pass for both
TCP and MPTCP.

I also checked the two races reported by Sashiko. On one v3 run with
400 reconnects in each direction, both races were hit four times.

For a native IPv6 to v4-mapped reconnect, I observed:

  tcp_v6_rcv()
    tcp_v6_do_rcv()
      tcp_rcv_established()
        inet_sk_rx_dst_set()          /* IPv6 skb */

For the reverse reconnect, I observed:

  tcp_v4_rcv()
    tcp_v4_do_rcv()
      tcp_rcv_established()
        inet6_sk_rx_dst_set()         /* IPv4 skb */

I added probes after the rcu_assign_pointer(sk->sk_rx_dst, dst)
instructions and confirmed that the mismatched dst was actually stored.
Both cases can also be reproduced with your patch.

So the receive paths and the cross-family dst assignments are real.
However, I have not reproduced the Critical outcome suggested by the
review. I saw no warning, oops or panic, and did not observe an IPv6
skb reaching ip_local_deliver() or an IPv4 skb reaching ip6_input().
For the local IPv4 input route in this test, the bytes overlapping
rt6_info::sernum are non-zero due to rtable::rt_type/rt_is_input, so
the invalid rt->from dereference did not occur.

Given that, I think your patch is still the right fix for the reported
header.h6/header.h4 bug. I would post it as v4 with that scope, and
handle the stale skb/sk_rx_dst race separately instead of adding the
IPv4 fast-path check back.

Does that sound like the right split, or do you think the sk_rx_dst
race should be addressed before v4 or should not even take care?

Thanks,
Zhiyu
