Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439266;
	b=07sHTVMv8/+dVPruVlqqC6lesjPHNwzRANUY842S/v26cQ6ed+e9OaAwpdVANJeFyhPh
	 7FhhP1hM+yNeoxgLlQ551LV3itd7tdJI4AAfMj3oFXJrK6ndweAFojANlZ71ylZ/8xAuO
	 jlIvL1IbCIQlyub8XsFMGNhQUyfsKml4mI/YzlWwVHJriJXwN9sx6/JxpPwEoYf3S0TMx
	 cB1Yv67B3Tb8RQHSp9/iSueqxxdpfa/Ee6bYi0mTU1yfv03WeuaZJ+zQKk9hIPzYfn1Xh
	 vYiLfdVDVP5hHjq5mT+vsIR9Sp1sqmbxjixHof1mPG5fwFY24oW97HrjUSXdWjCRgdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
	b=eH+9i0204BkLa0pHvLRRbrHcNqigFOaId2Mz8d3WM3R86LcCBQSeJycsVuBC5eggi8fB
	 549LlFv7VfoHrL5kmhAYQILepH8eHcrG6HH7bOzwLGj/y/74G2n2lq9Dl7BLeWlFNoNvz
	 noYMnSK5QcGFW7OLZ2jLJm32x0bl0d26K5ddP+fcLvS1H8cIkZC2bLrllv3EiSQxQ95Cg
	 lQjggG9ia0oUb3ma+QkYczPIMipi7YUafkC3x5W1EHR/1n/qn5uKBr/tyRrsMCILRpgl1
	 3s+LwSeox0CrFFenIG7Rh575rnoW1D1uBVs+a0zhqbV9J21SCfcRHDcKglgofEVFShg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PG06NK+8;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06860A2613
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E06860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PG06NK+8
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso2044409eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439264; x=1795044064; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
        b=PG06NK+8sjeCnFGsPkv7biN/XWVPp8cx4Zvam/TsDYmOaiYK6pe/9gJPX+5xFQMDwG
         FI7ZSXarOy2ZHCcYR5HKV+yYkrekblBvCUk1vUXz8MBnle4pAyi/GaiRzj0Y8Nfhmwvr
         OtfaG8jT6g6qhd4JuBpdh076rXDErLVCFrVlN+o2mFB/qS+lMM/hs33G70qIsK6M4TEJ
         J9VDq8+u00RPZUP2ARQzoVo6UUoByewIDiHYnMAJTB80Wztg6WOV49S5nQpMmODo77Cm
         n18RFe/aTJZ38OOYzqUaC6AVSKP3D41+hpBAIqwtbHebYSyUXCxDDrF162O6k1hWddDh
         Thdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439264; x=1795044064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KNu4FBFo+NiXU4uk2EB8iN37f7AOkMfz2eB0q/Nmt5s=;
        b=2BwSEk2WRG95zPXbwvxdTV/UuVBdHDRttpvFxfg5xfU5if8Uc5QaI/p/pt9Gk9Ih2F
         Ttb7gyzc5HL5ef51fHgjiAO/C75D3JXNgZ2bvbbau8CH+b9kWf62D8zhtwDCuX/wtJvf
         Lk5aiKXIHF2IX56HsS1JY1jrf9VnUvKIDoMjKkQX1J3tm9d0Op4mWiqUTAPaPkYqdzFy
         svS594ANXW4ECOPmaHu6CQ/cWTQlbAkw6iouR8/LNDMPDHV130I0kH8RuIybgDHmoDlm
         z9FwBlKNtpCxShGy3SKi6dAzfp6OX/hBrCJb2qtsJH7+DZSN594RkeynDW3FMSS+iRw2
         Z38w==
X-Forwarded-Encrypted: i=1; AL+hErGc36Znl/AEvPSl9iDR+wQE6M1+JqX8DDeGEV8eVUsq5rix72scU4fC3nsB+wm2FPOJNQbvYvp41QNBE60=@vger.kernel.org
X-Gm-Message-State: APuU4Z9otxv25sRL+DXu73AM7o9QMli9uOC8JMiiMEuvGADakVDNZ2Np
	dpeaAVeeWLFjvAQ4ukDXSIvPRcXJMBAT7KXFB8FczMBkZaLVpUIIiX/4
X-Gm-Gg: AYBFou1wuNQyGIiX/JTjDB0XqPLqL0cL/q+WngR5o77CGmDWUjoe2XciZu/Z/2aiZK8
	rXMJH8UFLbfBwoH6a1jTIUQDstdbfLaXNI9sG+SDijcRr4a7cLLK7lsFjUfo2kMkKprFRKmFZ9u
	nLuVZzZ0cACpanzD/je6ehrO15N5tTIiAlXbpHJTjEkXC5rejnJsTzt3t0nk5VA+OdDhH46WZIt
	9ZgiWucY+8S26B9rmgoo/J7KCuL+gS/5qRDuhlGbPs/BebHazcRTdzGLaQ1R4VeOq++PIra6rfC
	I6StbsVxg0x2N97nHLcOr+54VRgDKd/1qsmbqGaVLiz8I/BtCHCg5yCeJG3iJd1w1qkdaaLZ0jj
	+KYvWNdolTiQcJz4Hxmu9a3OQve5CN5kUA9/zk8Z10G/VXp4bT4LzAvNgrr4oBuPwLRrsA/P/q+
	cxsEadFV52c6W/7l7G4ocMa2wanKJ0eYbH+Cj1pzkb689BaW/JfEOVnAA9dxdkhQ9mgUdRZMXda
	BILGJkepASR1cO81Qjaya45ynIeMKx3J5WJ+DF17Oe3JfT1/ZcnxUkrODYFlfxF8tbFlZ77jXNU
	8upxBOPoaxpoDaoWCWlQHkQ=
X-Received: by 2002:a05:7300:fc13:b0:375:87f5:ccee with SMTP id 5a478bee46e88-37686a456b0mr3993699eec.29.1794439264317;
        Wed, 11 Nov 2026 15:21:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm39819238eec.16.2026.11.11.15.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:03 -0800 (PST)
Date: Wed, 11 Nov 2026 15:09:21 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through
 page_pool
Message-ID: <avT1lx9mdbzz8OGo@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-5-bjorn@kernel.org>
 <avOia/ZPWiFdfW7y@devvm16445.scu0.facebook.com>
 <87o6bv8o5e.fsf@all.your.base.are.belong.to.us>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6bv8o5e.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> new file mode 100644
> >> index 000000000000..fdd55265a6cd
> >> --- /dev/null
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -0,0 +1,246 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* AF_XDP UMEM as a page pool memory provider
> >> + *
> >> + * Each aligned UMEM chunk is a readable net_iov with one owner at a time:
> >> + *
> >> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page pool
> >> + *       ^                   |
> >> + *       +-----RX ring-------+
> >> + */
> >> +
> >> +#include <net/page_pool/helpers.h>
> >> +#include <net/page_pool/memory_provider.h>
> >> +#include <net/xdp_sock_drv.h>
> >> +
> >> +#include "xsk.h"
> >> +#include "xsk_queue.h"
> >> +
> >> +enum xsk_pp_chunk {
> >> +	XSK_PP_USER,	/* owned by userspace */
> >> +	XSK_PP_POOL,	/* owned by a page pool */
> >> +	XSK_PP_REUSE,	/* on the reuse stack */
> >
> > Can you explain more about that reuse/reuse_cnt? When is the chunk reused?
> > How is it different from FILL->RX path?
> 
> 
>             FILL             RX ring
>   USER ----------> POOL ---------------> USER
>                    |  ^
>    release_netmem  |  |  next refill,
>                    v  |  before FILL
>                   REUSE
> 
> POOL is a chunk in the page pool or on a driver ring. XDP_DROP, copied
> XDP_PASS and XDP_TX recycle it inside the page pool, so it stays POOL.
> FILL->RX is the only way back to userspace: an XSK redirect puts the
> chunk on the RX ring, and the flush (patch 7) marks it USER. Userspace
> posts it to FILL again.
> 
> REUSE is a chunk the page pool lets go of without a packet: when the
> pool is destroyed (queue restart, unbind), or its ring is full on a
> recycle. Userspace already gave it up, and the kernel can't post to
> FILL, so the next refill takes it before FILL. Same job as free_list in
> xsk_buff_pool. A FILL entry for a chunk the kernel holds is dropped.
> 
> I'll put that in the comment at the top of xsk_pp.c.

Yes, that helps a lot, thanks!
