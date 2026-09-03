Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBC442120
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423907; cv=none; b=pikf9aYwJwgN5dh8rnyq/rNwsuPzA6GIiixzHtUHTdcPPWSAChd7gxe6ZtyUOtWedcRBg1tR/+u/NxyzQVOowhZftgzB24TmaHgelyRq9dXHcuFgKRSze2HQpAgD53jSp4I7jb8qAMiE9h8btbsD3OsVDEet31mdiheaVr6Lb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423907; c=relaxed/simple;
	bh=ZGKwEzednZQcg4U0uMNNTXJ+7d2gtBiYk+kpHfLI2pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+XWLyd5svZGnYdlHWMkFMDV6AMuk8d4R7fqS/gUfVqeQoX1B/MPdZRvxGUecTtK4WmZuzqkYeM3pEVAtroczYxDCZPQTMZfHsLv6ch54fLGpfEDhNLXNsF9zf2Gogy7ZoK9qOmKM5i+UJDzAvhvJQUNASbC3tCV166Jbc2ZAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rNgvIw+l; arc=none smtp.client-ip=95.215.58.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rNgvIw+l"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZGKwEzednZQcg4U0uMNNTXJ+7d2gtBiYk+kpHfLI2pM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788423903; v=1; x=1789028703;
 b=rNgvIw+l+p7VyR9Bw7fdOSaTv5o7DMmdfh1FTA1aJLw5JgnlQUOEkdYRpc2IBPge1UDpRj26
 Lm3iPEaiV1heG+GqenJoGD2pu38IuZ78gPDlDbOP0vg9X6wRhPgUJy1GoSm9LNHRaPvaD/nPmxu
 If/hCxSj8zYwPqTJi43ZNibo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2803595f48595b09;
	Thu, 03 Sep 2026 08:25:02 +0000
X-Mizu-Trace-ID: 2803595f48595b09
X-Migadu-Flow: FLOW_OUT
Message-ID: <e10b5f72-adbd-46a5-9364-3580ff16a765@linux.dev>
Date: Thu, 3 Sep 2026 16:24:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] ppp_async: drop the errored frame instead of
 resetting its headroom
To: Vlatko Kosturjak <kost@linux.hr>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
References: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <apkR6ZU+tqP2C3Fl@griffin.linux.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2026/9/3 14:21, Vlatko Kosturjak wrote:
> ppp_receive_nonmp_frame() prepends a two-byte direction tag before running
> the pass/active BPF filters:
>
> 	*(__be16 *)skb_push(skb, 2) = htons(PPP_FILTER_INBOUND_TAG);
>
> Nothing on the receive path guarantees those two bytes of headroom. The
> frame-error path in ppp_async's process_input_packet() resets a reused skb's
> headroom to zero while claiming to restore it to a freshly allocated state -
> but a fresh skb from dev_alloc_skb() carries NET_SKB_PAD:
>
> 	err:
> 		if (skb) {
> 			/* make skb appear as freshly allocated */
> 			skb_trim(skb, 0);
> 			skb_reserve(skb, - skb_headroom(skb));
> 		}
>
> ap->rpkt still points at that skb, so the next frame is reassembled into it
> with no headroom at all. A peer that sends a bad-FCS frame followed by one
> beginning ff 03 then leaves a single byte of headroom by the time the filter
> tag is pushed, which lands one byte below skb->head:
>
>    skbuff: skb_under_panic: len:49 put:2 head:ffff888003c10000
>            data:ffff888003c0ffff tail:0x30 end:0x640 dev:<NULL>
>    kernel BUG at net/core/skbuff.c:214!
>    RIP: 0010:skb_panic+0x13e/0x230
>    Call Trace:
>     skb_push+0xbd/0x100
>     ppp_receive_nonmp_frame+0x48a/0x1d10
>     ppp_input+0x4e9/0x2f80
>     ppp_async_process+0x2a/0xe0
>     tasklet_action_common+0x20f/0x8a0
>     handle_softirqs+0x18e/0x590
>    Kernel panic - not syncing: Fatal exception in interrupt
>
> Zeroing the headroom violates the NET_SKB_PAD guarantee that dev_alloc_skb()
> gives the rest of the receive path. Besides the filter panic above, when CCP
> compression is enabled ppp_decompress_frame() hands skb->data - 2 to
> ->decompress()/->incomp(), which then reads out of bounds before skb->head
> for the same reason.
>
> Rather than restore the headroom, drop the errored frame - as ppp_synctty
> already does on its error path - and clear ap->rpkt so the next frame is
> reassembled into a fresh skb with proper headroom. This is simpler and fixes
> both the filter under-panic and the CCP out-of-bounds read.
>
> The original V1 of this patch made room in ppp_receive_nonmp_frame() with
> skb_cow_head(); Eric pointed out that fixing the root cause in the transport
> is the right approach.
>
> Found by fuzzing the PPP receive path with a mutating peer on a pty; it is an
> interesting (remote) DoS: root configures PPP, the peer supplies two crashing
> frames. The reproducer (repro-ppp-skb.c, unchanged from v1) panics in about a
> second, and returns cleanly with this applied.
>
> Fixes: 6722e78c9005 ("[PPP]: handle misaligned accesses")

Nit: the skb->len == 0 alignment check introduced by said commit is now 
redundant and can be moved back into the allocation branch.

> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
Kind regards,
