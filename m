Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0674A9D77
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004279; cv=pass; b=UhUBAQZMxJAHzBwjrV/7+thz58TFeGBvuUVQ3ZYWtHfxbhNoY5HDQi15daYcK2p7fUfVkhCR3YmoeKW3Wq5uBglVm64AUslm3QTEzaaDxlWlh9JXci9NPtSXn97OxiB3CSS3YIQ8rOI9VKyY97NjOL/Des++oPS7xUfBJakknf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004279; c=relaxed/simple;
	bh=fVkMbtrDFgg9JhiC1LwbHU+t/WNuxQvV8nWO3zEnhqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZJrjQ4roc3lr8x1oKWB3Tv2Uws9hHxxjjboGB5gDf0b8mzOWvSGGrYzhwcveI8dcVzeeyf5CLKxCWUMVu8+HkHftCaAmQPIIhmOcAszEDw+Ek3fXeZy+dHX6B1zPHZGoDXm9gGJHt2Ph6ZnvmfgqyJmBg7ZhdWaO73Vl0xOEYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQoRKykJ; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQoRKykJ"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a36de66c0dso30299271fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790004276; cv=none;
        d=google.com; s=arc-20260327;
        b=XvRAEfCqjt9/VySLplytr6KIyuG4m7Qy4F5h3ebcxv8sO5CipuD5SMHECEnGxLRlfo
         Zcg7tCrAKOfuyeBt2ytT6cSMb96++UUOfozdx0X1ioWdVlkFrm+6dRigxH4qRlhxwNlZ
         jaBkjOfN9NRoFs4CUWcqC20zPNS7EFmqgVGwE9PSbW8/ZkqnmwTtRYshN74Z/LtYbSW+
         MxTizpoZhBsH4ffyZhmtp1XmAOdsd5FPhFW88mLr9fp2KvtAOiQnSpXVKqdK79Qsxq2c
         b1UwCz1nOYnIJIVPjQb5uYHcW5zEsIyEZySFTiT3+qHCBj1Q1CP0p+sIQjGAyoSjrVys
         a+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3IcGGSo5+j0HvIrQfCCVAwZ7s4gKZX9RwrmAX0fXMM=;
        fh=mj3mquYKa/WbhTs9qEdi367tbqD9RgINz92nhZR+4+Q=;
        b=a5qG+0j3Ic2OpBhAQBbch6+Gk60sLoXLGkkT9vfzq/y6lk36CSgK0nLApAugQV3FYR
         XajL55VTo0pBaYadbr6D3wU0TWtBJXY8+olgsNGRktyJhNlQCgm0oucSyH7aJrPdb+5j
         Pq90iOpXYUG8RySbCk5hUlODgV1cHakwXhG5Vz9Ci/CYY3uAaUoioPkFCsBp47ZoLAoD
         moiFVY93nO26FFSz6gDZlnr+7uwJOiPb+9dhEWiM31BalWtMOi9dZYWKY9gepkHPc6gX
         niUPjllYmzROFcE+ts9mrkEkEreUKqBLizOh0ZKgxCLEXg7juJcUz7+fg1g59hdZ7eDe
         iXpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004276; x=1790609076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3IcGGSo5+j0HvIrQfCCVAwZ7s4gKZX9RwrmAX0fXMM=;
        b=cQoRKykJFqFyI9NigTnPCxeRN1VP1Ou79d7z8LN0sQVBAb3eOJCjlisTu98bQpUjEP
         6J2SIyrGd6sKnzDGj1ylmrd1zSzIP8/Kqpdj5jyvKZIzuR39nEPXQ45vi5TDlcozpEOp
         yvkO8I1+9RFwGUQrOfXuKnEttydrjoRMXvlDrSZSZjmXec4ken4RT0S2WJg1TvM32/+u
         6cYKCBZwyDCyR8i/kCt91Nu4lyRFRK9Rq+t9VgnmFGgwkGiTeaU3M2jbQ7uQEga/8DbT
         CedNXLSET7HzY453SzdOMpT7b9jJNuQuuwrxmAxV6JaeqG/SZSPe+5qRJXI4tiimoDsg
         YV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004276; x=1790609076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3IcGGSo5+j0HvIrQfCCVAwZ7s4gKZX9RwrmAX0fXMM=;
        b=b90vl0XAez0XMsx/Si/zenJYJESL0E0OtKXcPZFsw8IaW6lt9x8f4v2JT8aOpUdB3v
         k6V32eD964iYuGCYbKHshm7gryszwZ5I86HxtPnXoj+De0KpC/m4MkEQFSlzBeb8TMsX
         KtYHBoUnlTZ0mvqCxpb9Re7V6wfaAsp0Ol9Px/BDYExvVhRnaSTP+S7kxeMjskt9FTiU
         qxbqzaPAOFn/zc4zbZSaywXwQt2ML+ZShCPpWzP2NEcpcWYWYGp5I5pND8t+5pFDvdur
         Jy2efRK8uP/DY5qofsj0D2fH9DLNVelXvz4vW+qePd7sPV1nuDyWnziZVEVw2ZuJXH4u
         2ixA==
X-Forwarded-Encrypted: i=1; AKwUvBwwkFGxWXONNRahh9Hvs8s2IhFQu6LW5hhTTAY5rHPfd8fCFhY0cWb1tggXRVKpFgxDrdT7ddV2rUwTr80=@vger.kernel.org
X-Gm-Message-State: AFuF++lhWiddBGJDgUFPIN1IOqsAi0BFe3R4EaGuXu80Yy+I4sQRGH8S
	pRWPcEi5S3udMJS623GVKLY9OHBdIS8qU8Df4NZ7xy9tq5cXTqUP4r9q/T5ELzgfBIeuF4XVmRK
	JIjdx3tixFB1awfQQK0LTJrfTVPj9T9w=
X-Gm-Gg: AYBFou0p/wBJVei8NdU0HHzCSzfe+/1EvL3QjjRiWT/xk8ds2mg3f4tIDxHo38xlhgH
	g9ZqlW6jlmrozy8naRLZMZ841QLwQ51o2njQTWQ8F8AZ4dUbjKAkTRTTVEFu/EEWSzZdqR9mSPE
	NVPrGfMM0aRcsKVZvG94F39XsICOqI7H44bj4QKKPJc79NyK7FkPmsfzAnLABQ8nZiG9R4Lmzpy
	5TUs3d7l8AkHkINdhuCxpAbmIb+ivktOsIng+gOyExjqVhCh/stCri1GWv20sBv2iZLBUIAAdPD
	JJkhHgjjLEkA6UL3X8Efeie8BZrSOSRaMcmvXQ4mncv4tsX86jx32IFyw/3QtFCasjMDNbuDuX2
	ukLDSpOPCaxEc7jgoWu8sz1XHG8FMRZ9N7qpx1tBTU9sKkYbSnYoRT6AOHkcQSwV8UG4ydBNVJD
	vsJ90zvovRkQLtKS8vCFCPhdyzt+0=
X-Received: by 2002:a05:651c:54d:b0:3a1:8dd6:aaf9 with SMTP id
 38308e7fff4ca-3a5fbf32d5amr23385811fa.8.1790004275723; Mon, 21 Sep 2026
 08:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917153923.904124-3-bestswngs@gmail.com>
In-Reply-To: <20260917153923.904124-3-bestswngs@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 21 Sep 2026 23:23:56 +0800
X-Gm-Features: AcwNN1VVTW-G-tYVzMWlBy3I-0oQzwQRNZQ4azMiWAQGx7Mm8VmFuFMIZMGo3_g
Message-ID: <CAL+tcoCD9baTVJFckt8yXaTHEqU4BQ=cKCUxtyUHO2MqfLimFA@mail.gmail.com>
Subject: Re: [PATCH net] veth: manage XDP program pointers during channel resize
To: Weiming Shi <bestswngs@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, co+65e5c76b187f08b2@bugs.sh, Xiang Mei <xmei5@asu.edu>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 2:50=E2=80=AFAM Weiming Shi <bestswngs@gmail.com> w=
rote:
>
> veth_set_channels() tears down XDP resources for removed RX queues
> without clearing rq->xdp_prog.  If the program is then detached or
> replaced, those queues keep the old pointer after bpf_prog_put().  A
> later channel increase can re-enable NAPI and run the freed program.
>
> Clear the program pointer after taking an RX queue offline, and publish
> the current program only after bringing the queue back online succeeds.
>
>   BUG: unable to handle page fault for address: ffffc90000256048
>   Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>   RIP: veth_xdp_rcv_skb (include/linux/filter.h:779
>                          include/net/xdp.h:696 drivers/net/veth.c:820)
>   Call Trace:
>    veth_xdp_rcv (drivers/net/veth.c:941)
>    veth_poll (drivers/net/veth.c:986)
>    __napi_poll (net/core/dev.c:7787)
>    net_rx_action (net/core/dev.c:7850 net/core/dev.c:8007)
>    handle_softirqs (kernel/softirq.c:645)
>   Kernel panic - not syncing: Fatal exception in interrupt
>
> Cc: stable@vger.kernel.org
> Fixes: 4752eeb3d891 ("veth: implement support for set_channel ethtool op"=
)
> Reported-by: <co+65e5c76b187f08b2@bugs.sh>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

Thanks!
