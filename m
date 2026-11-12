Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484175;
	b=R9mi5WmN3Q/NPtFX6XM4kf/sl6MeKaD1ujBF0perQDiGdHTQuAQtTYlfy4CdKhPWYZNq
	 0yVY99oo4D6S6ol041pyTS6bI1CwwuNcpnOrlSBIBWUpS4bLjANYktsZZ7yegWRXdx7dX
	 uMNGA7gpiNzN24jWwQ+rL+Japgtuhd3rUd7TNPN2xGuD/8HirNbNXnFPGeLsG2WBaYCoC
	 XgkP4/6mA1OCLTOm+nuJwhYOr4EtOQWElJYxvr5datvzIe1bKRdrDDmVsD1LQJPvHKTWo
	 mE0XQQSwvLrNNnXO46KoCvyn01xla4YB9EtHBsaVTMA6WztPyud9Euw2xGBsNxJgmpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=QfzRbPUJioYckynCvFdcAHAPjcBDdUIwAIhB2YIAKeA=;
	b=hEHsxg8CjtNdFgMkRgxo1CeHia5eMjiOfyDYSqskcS5Bpymew66UWipN8oc0ydHuGwBI
	 Y7eAc2XTOtFdFD8sQ6NE0f4kH9bpDpj4TlWJ51fJ6IrCbOiX8pJrY+hCwv57ORrz46Pfy
	 aaQAx24VprP5NhwmRmnFa0u0slACwqM99BSSQKgo9s5zed0zyaj+o+H9RVjpowEqVaJQY
	 6KBgOXKlwAAxKw+Y+p1UgIksuZVmjv+AGloaZ483FiYG9UgJy4vj31KyOdrgF1wgDGtqV
	 8BoZBykst2fzjLYnSVBdlJdPYdeeEG6fzt2soVF/6dd6MtIePzUjzUuTPvnMH/zyJHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoEUpvK2;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE60606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE60606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UoEUpvK2
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9440304604aso86154185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484173; x=1795088973; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QfzRbPUJioYckynCvFdcAHAPjcBDdUIwAIhB2YIAKeA=;
        b=UoEUpvK2wQR8EAsSwESrTtSF41cimmaJtjmRfCcRf6rSoTAbGnMl4Z2U2F1WYTRlyf
         eSFGIg9dqNUAkBYq5cnbiaOK9p+2WfBcoujk3X+HGDY8myusAuKgMPB0Kmv0daCyFK0A
         2RkvG/K8IY75WPyw1i+1z5zQCwzvz+m4z7NTmC7gTXs4ICFkUVRs8up01m1lgVJsQEE4
         stvlbXf/gT4KYpNXPMmPPFsT7a4627STwieiL2zE1KOIAptykO68OSfxGHa75Zlj7KW+
         BLnoMpBLoUZkJLIifEd+0GIdrsjQf50fugJMWw51gVpZ2loviS0tEJ0zDsFf1ShhC77A
         P/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484173; x=1795088973;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfzRbPUJioYckynCvFdcAHAPjcBDdUIwAIhB2YIAKeA=;
        b=iiv0OsUeLWpTEQFaYL9GePqlLU0cwWZntXAmvPw0dbHFhu10XRYICwKN96OG9N+q1+
         CUbhActTYYY053FMEJXJsZI/seDcb/uv6HwnaDqQTNDGTCk2esyWguBexD4wXU7RtPpv
         j5GABY08dv0531QdH9CwLusFR13Dr9l8eu54V1sOVVDVt7XXmahKBG4ATWGhGbNriJaN
         MHZr0CClI8yeFQ7yUD01v5eBtKmUdjhqEFHsPmxwiWklH9HhbETdIh/O28LLInOJ8zoM
         yUfZ9pRB/CR2neLYveFET2WytmLOR/qRhn5kSDmFwiAjiTx7wtqOcgXwAO8g4pro/gK+
         nfoQ==
X-Forwarded-Encrypted: i=1; AL+hErHUjAWhIsQB23OKBy+KWZrRMjdOLewdvpopCXR36sVRdr8sKkqLsq1MhBJZAt/fXzfwpe7kLt0MWiLmSX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XFuUtMfbPJQ1+aqzH7IhuHrJVPscpn0Eu3dMDB70twTmeGXvR
	jzFC5i5SBGURykkJBOPY6tBR6LKwheVplK/vxU02HjA7BDZRHKvkNiSa
X-Gm-Gg: AYBFou2zpSvTwEtBVgmX9SyfpQhbsbnkEeAzPBeZs4q3Op6ZDz7plYFVAc2vkBo+h/8
	y0LHzFKBe7xjlbQB0suNCv3CFwSAX9sC+Tx5XfyR9ZuHQDvVl6LWwQPGMLlToUp3S7RbGqD3OwG
	lWByEWy12funI9+ZCihNMPLZUulljLWR7hWtzMwLFya3p5YshMGL0Qc0nXEk1fnYEzuqgbTalCQ
	UVo3UmgSlYelNyV5u/elTiAWcHWZlyv6VLb1XXZwjYJ/nvZRX5DD+u5ZHj2f8tSha9+AM56kG9H
	jEn1fW1UA8mKbKOwDaE7A/0lyMVEAvyoi7dr4JYyljgzlfxgfA0OtNtFLveabvi08ZAtfI89Xms
	UMuj9P92FKpg/Jd/ic6ja8LG9VbsPc9WkAC7wa7yYoNPULcuyDqyRCzU8o+9DZl4v7SXNnH4VFr
	Q5KAnaO0M7CC5CB7ad682EOM8QnXF/P7LrhBqi163dk6mJRUk12uEeQhwlf0qeCy7Mf7RkdS/gc
	bMJ/bzG+FIQS7AuKMegyxMrKwrvd6j7zL/LP1k/oQ/QT1U+pBFMD5bDIFIn+ue2OcUZP8Na+la3
	F0SuDkjluFy/+3Zblb3cwxpxE1IYNQIkNw==
X-Received: by 2002:a05:620a:4107:b0:93c:891b:90f1 with SMTP id af79cd13be357-949330d463amr363214485a.26.1794484173123;
        Thu, 12 Nov 2026 03:49:33 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7f618csm710667885a.41.2026.11.12.03.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:49:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 06:49:27 -0500
Message-Id: <DMT7JPSJL8MK.13BO3F0V0R9T@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <dimitri.daskalakis1@gmail.com>,
 <mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 3/6] eth: mpnic: TCP segmentation offload
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261110-mpnic-lso-v2-3-ccd37b051d08@gmail.com>
 <179447813579.2199510.17629296645152623901@kernel.org>
In-Reply-To: <179447813579.2199510.17629296645152623901@kernel.org>

On Thu Nov 12, 2026 at 5:08 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] At this commit, mpnic_xmit_frame_ring()
>   (drivers/net/ethernet/meta/mpnic/mpnic_txrx.c:306) calls=E2=80=A6
> - [Medium] eth: mpnic: GSO validation bypass in mpnic_features_check()
>
> --
>
> eth: mpnic: TCP segmentation offload
>
> This adds hardware segmentation for non-encapsulated TCPv4/TCPv6 packets
> to the mpnic driver. It also programs the TOF mode and TCP flag clear
> registers, and reports hw_gso_wire_packets through the netdev qstats API.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> index a35ce8998409d..b78f8599bbe8f 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>
> [ ... ]
>
>> @@ -312,6 +368,10 @@ netdev_features_t mpnic_features_check(struct sk_bu=
ff *skb,
>>  	    l2len + i3len + sizeof(struct tcphdr) + MAX_TCP_OPTION_SPACE > 256=
)
>>  		return features & ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
>> =20
>> +	if (skb_is_gso(skb) &&
>> +	    !FIELD_FIT(MPNIC_TWD_MSS, skb_shinfo(skb)->gso_size))
>> +		return features & ~NETIF_F_GSO_MASK;
>> +
>>  	return features;
>>  }
>
> [Severity: Medium]
> Does this MSS check cover every GSO skb that reaches mpnic_tx_lso()?
> Earlier in mpnic_features_check() there is an early return when
> skb->ip_summed !=3D CHECKSUM_PARTIAL. For those skbs, neither the header
> geometry checks above nor the new gso_size check run, and NETIF_F_TSO
> and NETIF_F_TSO6 stay set.
>
> Those skbs can still end up offloaded. __virtio_net_hdr_to_skb()
> accepts VIRTIO_NET_HDR_GSO_TCPV4/TCPV6 without
> VIRTIO_NET_HDR_F_NEEDS_CSUM. So a tap or virtio guest, or a
> PACKET_VNET_HDR sender, can hand us a GSO skb with CHECKSUM_NONE and
> SKB_GSO_DODGY.
>
> The path from there looks like this:
>
> - validate_xmit_skb() sees netif_needs_gso() and calls
>   skb_gso_segment().
> - tcp4_gso_segment() or tcp6_gso_segment() seeds the pseudo-header
>   checksum and switches ip_summed to CHECKSUM_PARTIAL.
> - tcp_gso_segment() then returns NULL, because skb_gso_ok() is still
>   true for the advertised features.
>
> The original skb then goes to mpnic_xmit_frame() unsegmented, having
> skipped every check in this function.
>
> In mpnic_tx_lso(), shinfo->gso_size then goes into the 14-bit
> MPNIC_TWD_MSS field unchecked. gso_features_check() only bounds
> gso_segs and skb->len. A gso_size of 16384 with a total length under
> 64K therefore gets through, and FIELD_PREP() truncates it to an MSS
> of 0.
>
> The header lengths that mpnic_tx_offloads() writes into
> MPNIC_TWD_L2_HLEN and MPNIC_TWD_L3_IHLEN are also unvalidated for
> these skbs. The same goes for the even-length and 256 byte header
> limits. Here the transport header was set by the flow dissector, not
> by a trusted stack.
>
> What does the hardware do with an MSS of 0, or with truncated header
> lengths? At best it seems to put malformed segments on the wire.
>
> I see two possible fixes, and I'm not sure which you'd prefer:
>
> - Clear NETIF_F_GSO_MASK for GSO skbs that are not CHECKSUM_PARTIAL
>   yet.

This came up in a local sashiko run, but I declined it. The issue is
from vnet headers that request gso without csum. A handful of drivers
have an early return passing through the features if the skb is not
CHECKSUM_PARTIAL. Seems like something core might want to handle.

> - Move the gso_size check above the early return, and validate the
>   headers from skb_transport_header() in that case.
>
> Either way, this patch is the one that turns TSO on, so the fix
> probably belongs here.
>
> [Severity: Medium]
> Can a TCP GSO skb shorter than MPNIC_MIN_FRAME_LEN get to hardware LSO
> here? The only GSO fallback in this check is for a gso_size that doesn't
> fit MPNIC_TWD_MSS. Eth + IPv4 + TCP headers add up to 54 bytes, so a TCPv=
4
> GSO skb can be 56 bytes long with gso_size 1 and gso_segs 2.
>

This is the same feedback I addressed in the udp segmentation patch.
Shouldn't really be reachable for TSO skbs, but the check is there in
the next patch anyway.

> mpnic_xmit_frame_ring() pads every skb before the offloads are set up:
>
> 	if (skb_put_padto(skb, MPNIC_MIN_FRAME_LEN))
> 		goto err_drop;
>
> That puts the zero pad inside the buffer lengths that mpnic_tx_map()
> programs. Will the LSO engine then segment the pad as TCP payload? That
> would produce more wire segments than shinfo->gso_segs, carrying zero
> bytes at sequence numbers past the real data.
>
> The checksum seed also looks wrong for these skbs. mpnic_tx_lso() takes
> the length out of the pseudo-header using the padded skb->len:
>
> 	payload_len =3D cpu_to_be16(skb->len - skb_checksum_start_offset(skb));
> 	csum_replace_by_diff(&tcph->check, (__force __wsum)payload_len);
>
> The sender, or tcp4_gro_complete(), seeded tcph->check with the unpadded
> L4 length. So the seed ends up off by the pad size. Won't every segment
> the hardware generates then carry a bad TCP checksum?
>
> One way to reach this is a remote peer sending back-to-back non-PSH
> 1-byte segments. A forwarding host GRO-merges them and sends them out an
> mpnic port. tun/tap/virtio and PACKET_VNET_HDR sources can also build
> such skbs.
>
> Now that NETIF_F_TSO is advertised, these skbs reach the driver
> unsegmented. Before this patch GSO was never offloaded, so the padding
> did no harm.
>
> The next patch in the series, "eth: mpnic: UDP segmentation offload",
> adds skb->len < MPNIC_MIN_FRAME_LEN to this condition. Could that check
> move into this patch, so this commit doesn't send bad segments on its own=
?

