Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDAC4F7995
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898209; cv=none; b=hG5sndSwjxPVwskCCkS9BL07M9zESe7ZZmNHAgJ6Y+jwrVtIHLxMSpgAPiwsYLG9Koz0fI8E344syB6TH8gTUDOA4NOJgldyS6djgCFKP7aX8F60asp72RtptA7bEQQOckTLLopmrT/HOcTlBBTsKx/mdOSjsLDrLrGCKrUN/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898209; c=relaxed/simple;
	bh=MYb+KZhXthdS1tI1u5L6tYn5kd9NKgccGuIs3/6bcFo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mkqIyFwpZK9lr7m2cEQCl+cwdhp8U0skS7d+XrkS5bhJto/beUwVxj9Pi1c6dHrMyWOzOuzZqe4F+UfKtZ+Pyy2z4KhWhD6s6kaPD/wVAh8uNkdhh+ZJoJQF+TMUMB7DWTAGgQTZ8rVs2gcipxKiC+MvdUOE505UhxOwze1Odso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOuNoX9W; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOuNoX9W"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5356b6a7fe5so37731001cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898206; x=1792503006; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdYWexqI8VnjnVIAaPxGnMoLpd+H3V236ImJISdPKrc=;
        b=bOuNoX9WU76ro+ZOSrp0N2Fba0IRKIAIg80EFZvmjoIo0RW919eSojewJuu94sNM2E
         AA0/2arLdp96VSdm0c7s//SUwMKP+b966JoASumBME3WSENL9LE0rFhaoMdUy6n2LNvI
         x3w4YnKAPUZNNVbbT1x62nB8+Z4MWc2oyaLeK+hufkJT2NhoptaWpBW70D5gCSy6kMoh
         UeFKAUMhWbGh/9Jn6zCuVI7acQ++15yvhq3wVHim7sOmv+silQnRJ25EHBzHGH+r6a2s
         d1LRnFFNAWZlLBJ6xzYJzMiHNNj3w6jkJvIn/3NosvDD+nk++Sc8DQMDzi4W/RSMcEEQ
         8n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898206; x=1792503006;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdYWexqI8VnjnVIAaPxGnMoLpd+H3V236ImJISdPKrc=;
        b=1aMdi2OVJXylERtR7ME7sKGixPBqn/6KnmHcc+OJreZNKpiYB4Q9R+skJC7yvuhahs
         4OoEdDGBxS5RzK9JcD8MlzGaasntzNg7/NDZI3CpKLuwxYahyHFOrFrRbCx5WXVE89BX
         VquIzwggvPRDX3FQlx3U4gvzAs+4M4iE9ljQz25RXolJz3ee0o6TdDkE39nVYk1hPzvN
         JOSOtR+9u9Dqf6EbAxY+lZl+uz9F2bJtAw1fA4Ch76rckB6YDE7q2WgrDFRuZ5pve8zv
         K7iQ1O+i5rnQrKo5R4I2WAA6ViBZ+YqhLLa/37g2W3TVFYux55Kql90B7Boa2ibrBy/9
         jGaw==
X-Forwarded-Encrypted: i=1; AKwUvBxUmZFVaEZvry5cnoH+rmKFGavrU1a3xDzmI6PZJxv2dOm+aTYOFeoh3eVfKff3TrtRJVlAUwNC8UwUQX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqbjCA4TZTteq0p5aJKG7KIbr5ivWlYkG73fn/N4Lcxqxx4Zav
	o+bgmVzP/au5ridZHQpwXONU6s7X9gopEyvLKyH8XMbMFBKXzZ0Pde5F
X-Gm-Gg: AYBFou3FR9G63c7nGpDjVhym5NbuHJ+aeFXfCw7+RuuXA5j4wvWouPeKJ5i7badPqct
	Ls6gZch31lP4OrrgZLPFrHixzJwEZW177K5oYNjU2jjZUZIimeKd+aQ7Q7BcZz/EaUXf4t8L0VV
	I58VKq0Rd4+wX6qFidl2MhbcbavHn29hylcmV91OHs7kI8cpTn86NN+GORGGccIwNtm24vie9Ee
	VveTwWRZZS94LeiImVBfL77rVwVrWLP7iOsg+zTVT0kgwJ0CCmT9qwNps6FfTpZDabU8zx87VXD
	m1+I83fgZKAF6Fr6G2OQYkAH9Szn09HWpI0akbkP4+B7sScE0pefZGJIU1UYvIZ7xn2WOV57/3B
	7zeXYsr4NmYCmpvMh+fWVeGpJ+hFT3KHe0dQRBLDGYAJGB1so/9j8EepwCKOqYdgSZmCZOKRKks
	rr8TVR0/BgU/WyuFFC/R4gTM7uhCZmU1qHNpw7GOtN3xW202Wa4kMD8p2anh6Yd1bny6eiX2uBy
	m4=
X-Received: by 2002:a05:622a:1e1b:b0:533:386a:edca with SMTP id d75a77b69052e-5359fae2dd8mr197794911cf.16.1791898205969;
        Tue, 13 Oct 2026 06:30:05 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535e652f3c7sm24443901cf.26.2026.10.13.06.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 09:30:02 -0400
Message-Id: <DM3QWDZ4B408.2O12B5PXKY8AR@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <pabeni@redhat.com>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <edumazet@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 2/4] eth: mpnic: report per-queue stats
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261012-mpnic-counters3-v2-2-8afba81c2d5a@gmail.com>
 <179189313526.434549.10762925482009523771@kernel.org>
In-Reply-To: <179189313526.434549.10762925482009523771@kernel.org>

On Tue Oct 13, 2026 at 8:05 AM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] This patch reports the RCQ `rcq.packets` and `rcq.bytes`
>   counters as the netdev qstats `rx-packets` and `rx-bytes` attributes.
>
> --
>
> eth: mpnic: report per-queue stats
>
> This commit exposes the per-ring packet and byte counters through the
> netdev queue stats API. Counters for deactivated rings are reported
> through the base stats.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/ne=
t/ethernet/meta/mpnic/mpnic_netdev.c
>> index 5164475a0f943..c2f4a326a8f0f 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>
> [ ... ]
>
>> @@ -146,6 +147,77 @@ static const struct net_device_ops mpnic_netdev_ops=
 =3D {
>>  	.ndo_get_stats64	=3D mpnic_get_stats64,
>>  };
>> =20
>> +static void mpnic_get_queue_stats_rx(struct net_device *dev, int idx,
>> +				     struct netdev_queue_stats_rx *rx)
>> +{
>> +	struct mpnic_net *mpn =3D netdev_priv(dev);
>> +	struct mpnic_ring *rxr =3D mpn->rx[idx];
>> +	struct mpnic_queue_stats *stats;
>> +	unsigned int start;
>> +	u64 bytes, packets;
>> +
>> +	if (!rxr)
>> +		return;
>> +
>> +	stats =3D &rxr->stats;
>> +	do {
>> +		start =3D u64_stats_fetch_begin(&stats->syncp);
>> +		bytes =3D u64_stats_read(&stats->rcq.bytes);
>> +		packets =3D u64_stats_read(&stats->rcq.packets);
>> +	} while (u64_stats_fetch_retry(&stats->syncp, start));
>> +
>> +	rx->bytes =3D bytes;
>> +	rx->packets =3D packets;
>> +}
>
> [Severity: Medium]
> Do rcq.packets and rcq.bytes match the qstats meaning of rx-packets and
> rx-bytes?
>
> The netdev.yaml spec defines rx-packets as "Number of wire packets
> successfully received and passed to the stack". It defines rx-bytes as
> "Successfully received bytes, see rx-packets".
>
> In mpnic_clean_rcq() in mpnic_txrx.c, packets++ runs for every META
> completion, including completions where the driver drops the packet:
>
> drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:mpnic_clean_rcq() {
>     ...
> 			if (likely(!(rcd &
> 				     MPNIC_RCD_META_UNCORRECTABLE_ERR_MASK) &&
> 				   !state->pkt.add_frag_failed)) {
> 				bytes +=3D xdp_get_buff_len(&state->pkt.buff);
> 				skb =3D xdp_build_skb_from_buff(&state->pkt.buff);
> 			}
>
> 			if (likely(skb)) {
> 				napi_gro_receive(&nv->napi, skb);
> 			} else {
> 				mpnic_put_pkt_buff(&state->pkt, true);
> 				if (rcd & MPNIC_RCD_META_UNCORRECTABLE_ERR_MASK)
> 					errors++;
> 				else
> 					dropped++;
> 			}
>
> 			state->pkt.buff.data_hard_start =3D NULL;
> 			packets++;
>     ...
> 	u64_stats_add(&rcq->stats.rcq.packets, packets - errors);
> 	u64_stats_add(&rcq->stats.rcq.bytes, bytes);
> 	u64_stats_add(&rcq->stats.rcq.dropped, dropped);
>     ...
> }
>
> Only errors are subtracted from packets. If add_frag_failed is set, or if
> xdp_build_skb_from_buff() returns NULL, the packet is counted in dropped
> and also in rx-packets.
>
> The buffer length is also added to bytes before xdp_build_skb_from_buff()
> runs. A failed skb build therefore still counts toward rx-bytes. An
> add_frag_failed drop adds to packets but not to bytes, so the two
> counters also disagree with each other.
>
> mpnic_get_base_stats() reports the same values once
> mpnic_aggregate_ring_rcq_counters() folds them into base->rx. The
> miscount carries over after a ring is deactivated.
>
> fbnic_clean_rcq() handles this by jumping to next_dont_count for dropped
> packets, so they are counted in neither packets nor bytes. Could mpnic
> do the same?
>

v1 of this series matched fbnic in this regard, but the bot pointed out
correctly that rtnl stats docs say that packets received ok at the host,
but dropped in the driver (mainly skb allocation failure here), should
be counted in rx-packets.

> The counter semantics come from "eth: mpnic: count packets, bytes, and
> drops per ring" earlier in this series. This patch is the one that
> exposes them as qstats rx-packets and rx-bytes.
>
> The later patch "eth: mpnic: count Rx allocation failures" also counts
> skb build failures in alloc_failed. Those packets still stay in packets
> and bytes.
>
> [ ... ]

So, the question is whether or not rx-packets, reported both to rtnl
stats and qstats, should count drops in the driver. Here, drops are
either running out of shinfo frags, but really just skb allocation
failure.=20

The docs for rtnl stats strongly suggest an skb allocation failure
should still be counted for rx-packets.

The docs for qstats imply the opposite. Especially when xdp is not
present, which is the case as of this point. Once xdp is introduced,
though, counting an skb allocation failure in rx-packets becomes
reasonable by the qstats docs, because xdp runs before the point of skb
allocation.

Another option would be reporting rx-packets differently for the two
APIs. I think this is not desirable, and seems to violate what is in
the stats.py selftest.

So, I could either submit a v3, which would just be reverting to v1, or
take the approach here as is.

I'm going to hold off on sending a v3, unless there is some human
feedback.
