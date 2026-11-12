Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524416;
	b=oHNZR03qyasnkE89hbsEbskEMkV6EfQrbpXpo5FjA2gO5aSqn+Jk+D1GpzgCXL/vRrIG
	 iMcbdyb/5W/Nb6D0fQ8yKpL5RqH2DvlOIU/CE0Frp44HXt4u3AxwuTcNyvKH93Nh2VBKD
	 Sm68sZaMMn+GZ3Yw8xtQOsisafEPF/nKyljr+RXjkTiXE8xVxZaLuvjI7kdbR6Ybeeaxf
	 nHTr+O3ndpStNZdjF/p4SOsZzvxxBYNGQPLLcdCRq8s61p16qai3kE60MxsYG7sJu/bzZ
	 pPxwFMvm0i54amwU8UpJrDbCOlz+y6U1Q8iOVJDodov8/KdnsCRR3hBUWsn98dYUOeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
	b=okEbIpeYRdckz5Rg/PHchK/M+0xmd16oivDEvGuCXlb8E2+ddWcNUntYNMWwnbL3772m
	 c1kHbqHOMdnV5wURkYk7zifCYfwDvbsT9S4+FCIREp8Hqo38b4NpoVdeRdLsQ8qG5Oakq
	 E/9KrJRN/AMeMi+ThV6/7ETCbelKSvVld8dqknJnY/scIoAaRo02zdTjpHzaolS01uCMQ
	 lp6RtM1VSJVEDVngiMLWOFGvHhHV8575pa1tu5XnOavHrbHtVPKe/ybI1NOeC6L/L7sOI
	 QqDmoat+5njaUzl9o0HnHm6oPk7vBMqsHYdk+aX8fDRgQYycpic0Ih6GoKkHIs9V4ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UEmdS/dd";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22178606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22178606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEmdS/dd
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so167228eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524415; x=1795129215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
        b=UEmdS/ddxgea87Jmi4D6KGO0cwNBW0iN6pjH4MYdOo/9psUz72Te3wCs/WBVGWCYin
         oLAdMFp7CIubzlvzOBmyRG/Lj4TRocdsaMYZRyRloCp5icyGrXTBcF0NN3YDIdpbziPD
         9dCoQysz795JPTNbOOEjaH/EeLGkosuG4aQkxwOskX09xUil/r1gN92uAD9OMsSjKiDB
         F0lH6/nzBn/sVPwCLsDSnGNtu6ltHUoqDrztZuFogvL6rw+gfNvucXjpxiD1Anf0Up7c
         0j1KXXL6s2KWDR5t1ZzoobkG3mM+v03VwLyiHohMh0pxNELAMXLgF+TZ4oIQZUO8hFiw
         1I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524415; x=1795129215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
        b=xSbCsanvtArkv8dgGrPBTYLayVSEoYjGNx0uoh27hxzh0WK1uaYLaU7mNXGMqQMsr7
         HieNDe4nwKV7QpegvHMWLYO9wtf4xvAlBBEdrb65vvIfyjMFIwmJUT6nMTFGJ44uH2Hf
         0adS8uOUoBsnsxYNeqz1aQxEHV/hnGjulXH/QYgoFVPWolZJ4ycNiep9a8wNB94Q7KMq
         GpNQhbDa/e7C3SjiYyukmIbw8Mgxv3OoZ02TlZOEGdTGvxYFuFCMkU/iPFNiWj0BrCVl
         zoF3sTDBOp51lT+k5U9pmnWpV24PYcCuTtj9EuHopxedWenk9HxzBJDUgwMDb+tXnmQ6
         El5Q==
X-Forwarded-Encrypted: i=1; AL+hErF4cS1nlBk+dgxgyAka5LJ2MA3NiEuSw/3HEUhK4d36b0apo11PVmRXfVwnmChpWIAU9sBAOqbbEreD0C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0dMnifm7KCVzrSBGbXVmQBtm7Yn4Iuu6JcH2W2uybNXKO/daD
	O3RdWauil9lacOaHjlWRZrQ+Q2gzeC3YWI9LKfXDEWL9h2hyaHXGWJ+F
X-Gm-Gg: AYBFou0koVKb32fG1oKwj0kO0nbmzaZPJKVq3A6NUAqr4i3Ngymk2eWU7HaEhZ0CYq2
	5blfz7xXbyOswN0xQBxFkJmzXk/XODj0y2gsalOfgPKhtCyeUplpGfPSdSSj6mZ8bRaR39gAWPr
	FN87JE/FRbnooYIvRWY2j0dapuXNTqTMK6Tm15aJudr7a5E2UYMCA0MnlXMliVVAfh1LAoGEVfI
	4C3TynXQc7VfLpMXdGoOLEZ+JuJNaYSgQqR7kGeJp4jnHhVIais4J2y3ksbgIXCq9b1O8eWwDAu
	rryHQrF6J8SJhT/WFbh9q0GHFB8osHeoInSpGh64jUHiSLhpE3mgTW7jPPs6qjTE9QA0PjMiZ9y
	IM696hlFA3emGoVsW0K727O1h36nkll7vsIX27uzvLMhqwjUivpBVMjbfYZlgHoSCHPKDoG1Sl2
	IEG3kp9Lg5gEiIOJcHgO/gTIXVvNZW/U9wYPTDX7Ovz57JQ0DDD7JqsNwSYuAYS/rx2lRbmodf2
	NhrAUOjP3FEPDyq6kpqkar4x9ktAuWoYIrXiAE0jBwi+x9Cc0axJ9tzZhW6yyd9RxA8/ranPNm/
	AqRxoBX9tjZfD6qZnGrgS8k=
X-Received: by 2002:a05:701b:454f:10b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5030db655mr763014c88.35.1794524414765;
        Thu, 12 Nov 2026 15:00:14 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm2014845c88.14.2026.11.12.15.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:00:13 -0800 (PST)
Date: Thu, 12 Nov 2026 15:00:09 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	almasrymina@google.com, sdf@fomichev.me, leitao@debian.org, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
Message-ID: <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>

On 11/12, Paolo Abeni wrote:
> Hi,
> 
> A few (late) questions/comments to check I'm not missing relevant
> points,
> 
> On 11/11/26 23:47, Stanislav Fomichev wrote:
> > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> > 68KB, which makes BIG TCP ineffective for devmem TX.
> 
> ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> ~180K...
> > This series picks the TX net_iov size from the dmabuf sg table instead:
> > the largest power of 2, up to 2MB, which aligns every DMA segment. With
> > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> > no UAPI change since TX addresses are dmabuf offsets.
> 
> ... still this option should be more effective because the limit would be
> higher and the skb would use less cachelines for the shared_info,
> 
> I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
> complex and if you could do that, too.

Originally I did not want to include bigtcp to keep it apples to apples:
same tso size, just 16 frags in skb vs 1 (in ideal case).

I just tried running mlx5 with 45 frags configured and it fails to start with
the following error:
mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.

(fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)

What I also tried just now is `gso_max_size 524280` (on top of this series)
and it ups single flow throughput from 200Gbps to 240Gbps (presumably
by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
the sender softirq..

I hope this gives you more data, not sure running with 20 frags is worth
it (vs 16)? LMK if you disagree or want me to run something else.

> > This doesn't make skbs larger. TCP still sizes them with size_goal.
> > Only the frags get larger, and a single frag can now cover the whole
> > skb.
> > 
> > An skb stays under 64KB unless BIG TCP is enabled. With BIG TCP,
> > MSG_ZEROCOPY from huge pages can already create frags of 64KB or
> > more. So drivers already have to handle them:
> > - mlx5 has a 31-bit length per data segment
> > - gve splits frags into 16KB descriptors
> > - fbnic doesn't enable BIG TCP
> > - bnxt has a 16-bit BD length. It is broken for such page frags today
> >    and will be fixed separately.
> > 
> > Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> > net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> > kernel on the sender only. 1 flow, MTU 4200, receiver tcp_rmem capped
> > at 16MB so it doesn't drop, median of 5 x 60s runs:
> > 
> >                                before    after
> >    frags per skb (sender)       16-17      1-2
> >    throughput (Gb/s)            208.6    211.2
> >    sender sendmsg CPU (sys)     40.8%    19.5%   (-52%)
> > 
> > The receiver's CPU is the bottleneck, so the gain is CPU, not
> > throughput. More of the transmit runs from the ACK path, so the
> > sender's softirq grows (52% -> 59%), but sys + sirq still drops by 16%.
> 
> is the receiver using GRO H/W offload/big TCP? Which are the gro_max_size/
> gso_max_size limits? In the `after` scenario, is the 2nd frag used for the
> headers?

hw gro, no big tcp (default tso of 64k). The headers are still in the
linear part and most of the time we get 1 frag.

I'm assuming 2 frags are happening sometimes because of tcp sending
something over that 2MB boundary. So that one single range has to be expressed
by to frags.
