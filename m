Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C429BD8C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816498; cv=none; b=BpXoW0f80XaiQDrLH++eXzD9enxyH/aEfBDDSpzM21NmdNRfddzjC+EQUjNC8C1uJHSrMN067LNjR8CFwexpsrWr7KD50GpnUuSy1VnW/pwnVvGBg/+rloK5JTGw5XIM1jpIW1+2sorQZsrcDzyz+wvYQjSiSflezsg9lVJ9sTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816498; c=relaxed/simple;
	bh=cINaHydl09cxBcvFqTlYGQ6MHKu1jghguZ6j16+ZxYc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=f/ZJ9N7AFNKxZY5+6NM7dxnx/pSsq2L5GsBUQB3cS0prVLnkBqp95/IsEcPPTeqba/m2bLIplEh6gkAlLC8XW216wshulXI4BgHS+u7Smun8LzVfYQELnpiL2zfFSXmWsZhzKK1xS18TeqgbtsNsb9Zq7oHbeTt/5UAuyE5YVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+a+7KSQ; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+a+7KSQ"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so55223797b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790816494; x=1791421294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lnMNm9948egObF1IuNHPSJpwOljnWRz/GhZI4bv+aoM=;
        b=i+a+7KSQfM0/AbTmT2zV5M93ONDfW7/4Hfi3ip39Z1qmW2PsgBvusUQxKzDDbXW8kB
         Ip2DYTfbgu8eFHkXaj3xtYFySmZWngF7JgS1X/ft24WmJKq6HyhUhatnfire1YrwKlq0
         uWKQynqc2gixBYwl5jTRFvaBQE1njTfN+fJ6z/zigCBD9gqTYkjmsr8QWKKbnuXmdM3u
         VeIOBhY3lpFXYT9n2fDRF5qNmEIaP829R+jW0Hg+Ztub9datta7z4bFgj2wMh+EPe/XS
         5CxealTmep0uQfAewQkP+mIi1Z/ADEThPWhT18g4RIjWURfiqCWwOnuPffUs9Z/1soSw
         hLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816494; x=1791421294;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnMNm9948egObF1IuNHPSJpwOljnWRz/GhZI4bv+aoM=;
        b=fjCaZxl7foz03bLQDeTvplh3mvMJ6M+W+SgBEyCXVq+JdFvIvJ7J7tduLeIqqU+Yxf
         53NH2/EG4QIPShQo9hgW7T4iEDn9AHDGGneSl8hh5BOXkI/OhuMn8kIP5xlB/O7Bx/YY
         aA49kHJ7+6vk8Od6gQO4CpsVmg6/rd68tkp1uv/FQdXLSu0K6KjcLFXoyhuJnh74UAwP
         2p+fLLOKxSmXCJRRBeHW8ZPsiDizNpo1CruO4VQfIZlG/fuDRoiE9du/Iy2OOATq1S3V
         3ug8sndhNTFcjSCKH9jdmWkDhPBdWhfckJPDI6q/WBU/pGsHgtgWjiqpFBpPAs4kcC+g
         hiEA==
X-Forwarded-Encrypted: i=1; AKwUvBykJ1xONKGtrWhiRxpsaw+Syc6SlW1+lG6GSle/BrnjemhptAFL+jqB0M6Uedocljufq5r7UE7wXSCQL1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhvELYojeUL63lnEuWSzzaK55vlUY14bb6A82TH/b0QdYR8xay
	2//vQNWzB4ErwfIyioecwa6iDgDJ/UYJtCd9lriBEFX6+y/SlLMeo7Jz
X-Gm-Gg: AYBFou2snt532xTDjj84QIDOMRR/30IkNXn38w5sX4g6T4QN0s0RJvtrG1MjbiGws4p
	IUcD1AAyzAuTW/0ZYMcREJK2dGzWXPwlO7phSIQsTYmmQtLifIUo8j2Nwbatq+Re0/pOiG1q1eA
	LsUWgSkEnQ2nuM0Zt+zkdu07RecIEz296hm+Sd7adIvc/xCQzXWgSE++ljD74p0Va7Dl+Duxv8B
	P1T+/S+mksGvhTKvovFezuocVXKIdQJNURdhDpf/8vKk4zmXOWWilkbgVUdhplCzMrVeVoEX2jW
	oVHk/+uSSdAAchLaBaZsZOOGItoY05hyIOoKrrTiVMLyTl4WnO+YuNy5HEhpltYPlmKSw/SbSQx
	L7OWCnCnv32Wgt+dXjEhrQZD21JJNhhRwzj68gCwkhb2YCCGChaDdA5tcICF/w4ccUhEwnkP4oc
	rZkp2T6oMvXzj41Dwk/YBLQPA5Tf8b5u/TNOXltFMJKUcKhAeUMIYrkPcdtHgl55hjZ8W8OxH0k
	BE76fO9kLQjkierNRCjajP5hRIx44kRe+XRqAtqXG871Y4hBKoDD0/ZNmKVBvY=
X-Received: by 2002:a05:690c:5703:b0:8ab:422f:a89e with SMTP id 00721157ae682-8ac93fea07amr12918507b3.53.1790816493908;
        Wed, 30 Sep 2026 18:01:33 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdad9eaafsm5062287b3.46.2026.09.30.18.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:01:33 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:01:32 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org, 
 quchaosheng000406@163.com
Cc: willemdebruijn.kernel@gmail.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 mkl@pengutronix.de, 
 socketcan@hartkopp.net, 
 stable@vger.kernel.org, 
 benquike@gmail.com
Message-ID: <willemdebruijn.kernel.34fd899c50ed8@gmail.com>
In-Reply-To: <179081112900.434549.3927636774761151103@kernel.org>
References: <20260928113108.2127215-1-quchaosheng000406@163.com>
 <179081112900.434549.3927636774761151103@kernel.org>
Subject: Re: [PATCH v3 net] net/packet: guard the ll header push in
 packet_rcv_spkt()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@ wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> =

> Critical: 0 =C2=B7 High: 0 (2) =C2=B7 Medium: 1 =C2=B7 Low: 0
> =

> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchw=
ork
> know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> (one such reply per series is enough).
> =

> - [Medium] The history and Fixes attribution in the commit message are
>   inaccurate.
> =

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the same CAN=

>   RX skb with mac_header =3D=3D 0xFFFF (left that way by init_can_skb()=
=E2=80=A6
> - [High] This problem wasn't introduced by this patch, but the
>   SOCK_PACKET receive path this patch touches leaks stale skb->cb bytes=
=E2=80=A6
> =


> [Severity: High]
> This is a pre-existing issue, but further down, packet_rcv_spkt() build=
s
> the sockaddr_pkt in place in skb->cb:
> =

>     spkt->spkt_family =3D dev->type;
>     strscpy(spkt->spkt_device, dev->name, sizeof(spkt->spkt_device));
>     spkt->spkt_protocol =3D skb->protocol;
> =

> strscpy() writes strlen(name) + 1 bytes and doesn't pad, and nothing cl=
ears
> the rest of spkt_device. packet_recvmsg() then copies the full
> sizeof(struct sockaddr_pkt) to userspace:
> =

>     memcpy(msg->msg_name, &PACKET_SKB_CB(skb)->sa, copy_len);
> =

> Can this leak stale skb->cb bytes to userspace?

This is being addressed in a separate fix that is in the review process:

https://lore.kernel.org/netdev/20260919215237.3470987-1-benquike@gmail.co=
m/
 =



