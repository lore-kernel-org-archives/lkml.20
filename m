Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837319;
	b=hkpiaDq+2oExV4dggVJ48zKAdEmuHYt4lrsG0O/tM6gfNyjaElmFVg+rxU7upt/lAfGQ
	 FvJnImxJ68dfvHb27clGBjZJI+3XCWj9pos+jOYJ/XmB8X/V+Th5YN4GqY4yEDeikKScN
	 kLfUc+GV6q/5WbfwgJ+wwvol+2NGzoV7tbmQpJxJdMxO4oVsZQs8mGnjYHMmHQPuIZEom
	 XY/rjegPEnmbej3tm4duw1PsoQ3SZsEREqVCmd9j1UhVpTJnPMhASaHY4HifFr9KpY1k+
	 eM0jKUQvrGuIqN0DFe8ECc+8qpjPvUJmVTV4xgP3VGQzmvJqP5s2Js/CE7Z+k4pCYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837319;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=L+9EA2+eiAIQrNgICkfUh6aQq6fKl8y/LGKwTRK2g8Y=;
	b=I8xo6+Flrxa4Fci5eiJyYz6PJYz83SdZQsrZDrlL4EhnCcjMrxNjTADvnYJ7Z2YyRU3u
	 8RfPMpojDEqWlTYCCbW4ePuPaddxkiirYtPlGg2TiJUWmL1aNqni/knYEbOO0jn9n0KWL
	 WxvO9fhAAbU2MEpG0X+XoWnnTrpFrjPx373OaDBoiF6qUGHApfl73cv+SNinetOYp5J+f
	 k5paiLZ2r1qU92F5b46IM3PeZpZAdu8rxanFmpcX6AH2pJhU8rTkNeVExkbN5xKpeOngQ
	 tLrhpidltsrzxnObzoWTTxI5mo+nMnMMsRLbdyZqWnfsSeKyeYDdUr8h28j3c3JTeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luQh3eZS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662D606E72E;
	Mon, 16 Nov 2026 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=luQh3eZS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287281F000CA;
	Mon, 16 Nov 2026 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837319;
	bh=L+9EA2+eiAIQrNgICkfUh6aQq6fKl8y/LGKwTRK2g8Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=luQh3eZStg6L5kTLYQtdUiWeK/gIbvcGOjR7QCrznusr3YYJ06mI+Ae+P5CL53BJJ
	 zhL1Z2qw6TLOtJFnIwNn7LHmDiOnT9f0D3eN649YR7bKQNcTPaY6BIrL5/i4enAylY
	 lupvbPlKFlcq9amOGzE52qtGBmE1+8lmajNg4TjG5HLGif6to9eHUMGhAP+2J0STwU
	 bng60Y9cT7Ng1dr1V/U2afHOuCNWfpLdlICwjZbnao2MeUiujj42T8LA3HPk6Y9szW
	 KAm3MmHY2u2YxONIGzLMB8+tm6RbH+9QnRplfpmbmJg4C1c3SOd/+tkUZ1VsdBjgrC
	 /tSxREALVcXug==
Subject:
 Re: [PATCH net 2/5] net: wwan: iosm: validate the ADGH datagram length
From: netdev-bot+sashiko@kernel.org
To: fangxy@xiaopeng.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 netdev@vger.kernel.org, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, maoyixie.tju@gmail.com, horms@kernel.org,
 m.chetan.kumar@linux.intel.com, zhugl3@xiaopeng.com
Date: Mon, 16 Nov 2026 13:55:17 +0000
Message-ID: <179483731765.3136.9756237680420915159@kernel.org>
In-Reply-To: <20261112125201.1019-3-fangxy@xiaopeng.com>
References: <20261112125201.1019-3-fangxy@xiaopeng.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new ADGH length check in ipc_mux_dl_adgh_decode() is
  `adgh_len < packet_offset || adgh_len > skb->len`.

--

net: wwan: iosm: validate the ADGH datagram length

This patch adds a bounds check on the device-supplied adgh->length in
ipc_mux_dl_adgh_decode(). The block is dropped unless the length covers
packet_offset and fits within skb->len. Without the check, a short length
wraps the payload size computed as adgh_len - packet_offset.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> index 5c33171ca7012..b573067a366f0 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_mux_codec.c
> @@ -473,6 +473,15 @@ static void ipc_mux_dl_adgh_decode(struct iosm_mux *ipc_mux,
>  	if_id += ipc_mux->wwan_q_offset;
>  	adgh_len = le16_to_cpu(adgh->length);
>  
> +	/* The device supplied length bounds the datagram. It has to
> +	 * cover packet_offset and fit into the received block.
> +	 */
> +	if (adgh_len < packet_offset || adgh_len > skb->len) {

[Severity: Low]
Should the lower bound be adgh_len <= packet_offset?

With the strict comparison, adgh_len == packet_offset still passes. That
gives a datagram with no payload, and ipc_mux_net_receive() is called with
pkt_len == 0.

For example, the modem could send a 16-byte ADGH block with
adgh->length == 16. dl_head_pad_len is IPC_MEM_DL_ETH_OFFSET, so pad_len
is 0 and packet_offset is 16. ipc_mux_net_receive() then does:

	skb_pull(dest_skb, offset);
	skb_trim(dest_skb, pkt_len);

and the clone reaches ipc_wwan_receive() with len 0. That function reads
the first byte without checking skb->len:

drivers/net/wwan/iosm/iosm_ipc_wwan.c:ipc_wwan_receive() {
    ...
	if ((skb->data[0] & IOSM_IP_TYPE_MASK) == IOSM_IP_TYPE_IPV4)
		skb->protocol = htons(ETH_P_IP);
    ...
}

So skb->protocol comes from a stale byte past the datagram. The empty frame
is also counted in rx_packets/rx_bytes and passed to netif_rx(). The read
stays inside the DL buffer allocation, so this is not a memory safety
problem.

The aggregated path for the same protocol, mux_dl_process_dg(), already
rejects this case:

		if (dg_index >= le32_to_cpu(adbh->block_length) ||
		    dg_index >= skb->len ||
		    dg_len > skb->len - dg_index ||
		    dl_head_pad_len >= dg_len) {
			goto dg_error;

Would using <= here make the ADGH and ADB decoders agree?

> +		dev_err(ipc_mux->dev, "invalid ADGH length %u, skb len %u",
> +			adgh_len, skb->len);
> +		return;
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112125201.1019-1-fangxy%40xiaopeng.com
