Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794788498;
	b=cy5jNQEqE6qnKI9awsPpTJ3zLUT8iWRC4FrUzm4HSbjALL9P6Ubtm8Z3RX3hlu8YJSBF
	 LAXiUKfRV8J9ekEL0uB7cYNgehpSDvwJ0UCdHiWblobuBvgOpAg/Xcn686gXAMV+suw2q
	 cQt2CvJM5vxHqW52qxSkUBVWsZiyfcCQsjnNRd+A5lY45dsL0K34s4br8/1OmAmXElOyZ
	 hyEjSLqr9hHEi7uqMA36iIBgw9ZSHzSVubNSJ7p6Iq4Wjqy4pkeiYr31R5E7SGMvOlsj0
	 Y5rs+CoekG6m/5uG0OXEEKyPXiDS22cXEJdNVk2x/ryDTIUfV+5ZHCPowQyYl1v4FUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794788498;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cKKObzBjJ6qvuXGRlLRbqGRJ1cBoJYY2NMGieZ6c/zk=;
	b=WG/EuMPqQmYrrRo1be1TXCaQ+eyHCn3ZxPPTcnPz4FE8vYvjvEZnNJX36aL5PmmGMLKk
	 xyYfoei6k1YPXFXpFdYGCoVKvgbmZ4e+EpzyprgGElpjD3EHqoNmwk64RYJCsv97DfY7S
	 MsaiDPftDcQMgQd09O9/hvnZCH7mhfMri0pj9+QuL/d6VFgYokDlPMf/V3C3WgDc2FboR
	 AErToZWamN+SxFjxxZ4davdCBkK5yKwH3JHYU1NWZM46Ij+zK3jiNqugdAYAHB8z/vD5b
	 39VFpniPt41KIldXEhDJF6FIZ1Wnz02mXvIs0FenIy34Bfun8FpfqGV7vZ/rcweQ39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bn+uvmUn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFE9606A33A;
	Mon, 16 Nov 2026 00:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bn+uvmUn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D631F000C4;
	Mon, 16 Nov 2026 00:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788498;
	bh=cKKObzBjJ6qvuXGRlLRbqGRJ1cBoJYY2NMGieZ6c/zk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bn+uvmUn6LTd/mBjnofnl3fqEjV4IJfnCpJR2sd5wJmOQ5s3QCYOmWC/paYKYiMub
	 cfxDy9/qh7oBA9QmfoxTkOTqbeeuHJ7OecJTEwdinYy5Ol2XwRfCGAYb1/Mc2gHbB9
	 qNlU3DYcxJ/AVgen3pZ3T3N2neTGdj53kgd3XVI9ABZtqwx2rVV1OuB37i9XPPMhou
	 J1lJT3LVsfDbNaViZA5NBFjP5O9c0qyTCQ5lGKf1TyekIQWbdnm6evkLTiQAyLKzwA
	 soeBu20vJJNJKRWwakSdJ0MlbkX47+uhogvb30RGTfWcU61vThdlQ9pCFeqPUvZRD7
	 qFY4QPIe3R8sw==
Subject: Re: [PATCH net 3/3] net: enetc: let core segment GSO super-skb when
 headers exceed TSO_HEADER_SIZE
From: netdev-bot+sashiko@kernel.org
To: vladimir.oltean@nxp.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 claudiu.manoil@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 ioana.ciornei@nxp.com, willemdebruijn.kernel@gmail.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 00:21:37 +0000
Message-ID: <179478849749.3136.8001549291942912250@kernel.org>
In-Reply-To: <20261111233149.479596-4-vladimir.oltean@nxp.com>
References: <20261111233149.479596-4-vladimir.oltean@nxp.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new length check in enetc_features_check()
  (drivers/net/ethernet/freescale/enetc/enetc.c:1128) does not account…
- [Medium] Off-by-one between the new guard and the LSO header field.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but this patch
  leaves it in place.

--

net: enetc: let core segment GSO super-skb when headers exceed TSO_HEADER_SIZE

This patch makes enetc_features_check() clear NETIF_F_GSO_MASK when the
L2+L3+L4 header length of a GSO skb is larger than TSO_HEADER_SIZE. The
core then segments those skbs. Their headers are no longer copied into
the fixed 256-byte per-BD header slots used by the software TSO and LSO
paths.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index 7f089a84d9a65..3c5478238e356 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -1122,7 +1122,15 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
>  
>  	features = vlan_features_check(skb, features);
>  
> -	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
> +	if (!skb_is_gso(skb))
> +		return features;
> +
> +	if (enetc_lso_get_hdr_len(skb) > TSO_HEADER_SIZE) {
> +		features &= ~NETIF_F_GSO_MASK;
> +		return features;
> +	}

[Severity: High]
Does this length check account for a VLAN tag that the core pushes into
skb->data after ndo_features_check has already run?

The order in validate_xmit_skb() is:

net/core/dev.c:validate_xmit_skb() {
    ...
	features = netif_skb_features(skb);
	skb = validate_xmit_vlan(skb, features);
    ...
}

enetc_features_check() runs inside netif_skb_features(). After that,
validate_xmit_vlan() calls __vlan_hwaccel_push_inside() when
!vlan_hw_offload_capable(features, skb->vlan_proto). That does
skb_push(skb, VLAN_HLEN) and leaves network_header and transport_header
where they are. So skb_transport_offset() grows by 4 bytes after this
check.

enetc advertises only NETIF_F_HW_VLAN_CTAG_TX, never
NETIF_F_HW_VLAN_STAG_TX, and CTAG_TX can be turned off through
hw_features. An 802.1ad VLAN upper, or an 802.1Q upper after
"ethtool -K ethX txvlan off", always gets its tag pushed in software.
ndev->vlan_features still has NETIF_F_TSO6 | NETIF_F_HW_CSUM.

For example, Eth 14 + IPv6 40 + SRH with 10 segments (8 + 160) + TCP
with timestamps 32 = 254 bytes. That passes this check, then becomes
258 bytes after the push.

On the software TSO path, enetc_map_tx_tso_buffs() then does:

	hdr = tx_ring->tso_headers + i * TSO_HEADER_SIZE;
	tso_build_hdr(skb, hdr, &tso, data_len, total_len == 0);

net/core/tso.c:tso_build_hdr() {
    ...
	memcpy(hdr, skb->data, hdr_len);
    ...
}

Wouldn't this write 2 bytes into the next slot, which may hold another
in-flight frame's header? When i == bd_count - 1, wouldn't it write past
the end of the dma_alloc_coherent() header area?

On the LSO path, the u8 lso->hdr_len would truncate 258 to 2, and
enetc_lso_map_hdr() would misprogram the descriptor instead.

Would it close this gap to add VLAN_HLEN when skb_vlan_tag_present(skb)
&& !vlan_hw_offload_capable(features, skb->vlan_proto)? Comparing
against TSO_HEADER_SIZE - VLAN_HLEN would also work. So would clearing
GSO for IPv6 extension headers, as the core does for NETIF_F_IPV6_CSUM.

[Severity: Medium]
Is there an off-by-one between this bound and the LSO header length
field?

A header of exactly 256 bytes passes this check and can still take the
LSO path. But struct enetc_lso_t stores the length as:

	u8	hdr_len; /* LSO header length */

so enetc_lso_start() truncates it to 0:

	lso->hdr_len = enetc_lso_get_hdr_len(skb);
	lso->total_len = skb->len - lso->hdr_len;

enetc_lso_map_hdr() would then copy 0 header bytes and program
txbd_tmp.hdr_len = 0, while the frame length counts the headers as
payload. enetc_lso_map_data() maps the whole linear area, headers
included, as payload:

	len = skb_headlen(skb) - lso->hdr_len;

L3_START and L3_HDR_LEN still describe a real IPv6 header, so the
descriptor contradicts itself.

A 256-byte header needs 2 or 6 extra bytes before L3. That can happen
when enetc is the DSA conduit for a switch with a 2-byte tag such as
tag_qca: 14 + 2 + 40 + 168 + 32 = 256. DSA user ports inherit
conduit->vlan_features, which include TSO6.

Should the bound be ">= TSO_HEADER_SIZE"? Alternatively, hdr_len could
be widened and checked against the hardware's real LSO header limit.

On a related point, the commit message says that the LSO path
(enetc_lso_map_hdr()) copies the headers "into a fixed-size
TSO_HEADER_SIZE (256 byte) slot of the per-ring dma_alloc_coherent()
header area, without checking that they fit", and that this "will cause
driver writes outside allocated memory".

Since lso->hdr_len is a u8, the pre-patch LSO path never copied more
than 255 bytes. Was its real failure mode the descriptor misprogramming
described above, rather than an out-of-bounds write?

[Severity: High]
This isn't a bug introduced by this patch, but the patch leaves it in
place. GSO skbs whose IPv6 extension headers fit within 256 bytes still
keep NETIF_F_TSO6 and NETIF_F_GSO_UDP_L4 here.

Examples are an SRH with 10 or fewer segments set through an
unprivileged IPV6_RTHDR, or a Mobile IPv6 type 2 routing header. As the
commit message notes, gso_features_check() only strips these features
when NETIF_F_IPV6_CSUM is set.

On ENETC without LSO (e.g. LS1028A), enetc_map_tx_tso_buffs() goes
through tso_build_hdr(), which writes:

	iph->payload_len = htons(size + tso->tlen);

That leaves out the extension header bytes, so the receiver's ipv6_rcv()
would trim real payload.

enetc_tso_complete_csum() then computes:

	csum_final = csum_ipv6_magic(&ipv6_hdr(skb)->saddr,
				     &ipv6_hdr(skb)->daddr,
				     len, ipv6_hdr(skb)->nexthdr, sum);

With extension headers present, nexthdr is the extension type (0, 43 or
60), not IPPROTO_TCP or IPPROTO_UDP. With a routing header, daddr is the
first hop, not the final destination that RFC 8200 section 8.1 requires.

Wouldn't every segment then go out with a wrong Payload Length and a
wrong L4 checksum, so TSO does not work at all for these flows?

Would it help to clear NETIF_F_GSO_MASK whenever
skb_has_ipv6_extension_hdr(skb), as the core does for NETIF_F_IPV6_CSUM
drivers? That would also cover the header overflow, including the VLAN
push case above, and the TSO_HEADER_SIZE check could stay as defense in
depth.

> +
> +	if (enetc_skb_uses_lso(priv, skb))
>  		return features;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111233149.479596-1-vladimir.oltean%40nxp.com
