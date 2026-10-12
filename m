Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CF427FB9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840425; cv=none; b=qXzLfrenb4duR2RJoEhx9SVeJZn39m84f7pH/0sBYpNx5HM2tO/A145KtvayWgpsvahNyRCD6Aeymr/W9/DXv1JlaKQkx5NcuFe83ezURBv5S0kNbD03LExMmWe6vjInVsJ1cVECTpBVBzAyP/KtZCROmrFmVpT+YmlNVj3iBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840425; c=relaxed/simple;
	bh=vFCTPi6RkqhF5HPuqeIigpw8olvShpvLUVqeUIoJdYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSvUJPE4N/L/+duKKo0sqJLF7Vz0sJ464Ls9foEh3D21AtKsHM85U29IOM+l0Am/dKDpgWIDkvzIBBWuZRbb4BloyhQ4hgewFe12y0RYunzKmght6BFhlVqtrqvtpdU5YSldcDen/fmQ+bq+eZLegb1y7q8EKw0krPIq3bCrhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=UuPUM0He; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="UuPUM0He"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-881269371acso2062309b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791840423; x=1792445223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=00lr0ueSHjjLFpqBUflLoQS+JH73YrWnwKwvoX92I9o=;
        b=UuPUM0HeTJ/ADEIghcha+FZah2r1LoSTx/oKR1mcAhddvveQVx+4banNqP2RU3CsTY
         LJ++V2f0XycCs4OQM6j3dOCi6hmgN3I4a8ATKZmItwuAeFCIyAYiX63tMUmNaQWXeqxA
         FRo9JNB3KvPQjw97HmOqQMAZsH5OM2xHx1E5PcmH8ODMIXZOgEV9UHxwryORjEAM539C
         k1h4aIjiBHEEI6b3aCwPPZBxbriyEzUxl4P+CQQYn7av7Rx1194ZgGy+P1sOpMKVKiVa
         o5B4e38Yv9ieFFKRRqYzydXFevulTXLoTGVb6YqtbgNIWFIv7Wy51EHhDGn3CIb8oRyR
         +13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840423; x=1792445223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=00lr0ueSHjjLFpqBUflLoQS+JH73YrWnwKwvoX92I9o=;
        b=lTYQUQ0HWJDlmC6glCvVBl65BkbmG/rX8/nFH1lBrvTdEDt1OPKWT3rBLlPAtkUMa4
         HTUyiHy7AczzvEIumSoqa3FcViutHavqaPFCgpdlo3yktH6lTbkwBoRHzrPUSN6sMKTG
         QniMOjCXDz30/ENrccd6MMW/5ATL7f/x+fw8DG3jn/2u40I/c2KM7CS+Ddc5ksbT3l1o
         OE5yuR7gB/Z2t55dnt6e7hltTG6DIDTbqimgyDP9D8cpCMC7LIsY0s+6oWy6n8v9eME0
         NT3SiAdtaLLrsfOpY0dy5JbeF/InA4qDYlD7RDQJqy2NaIShPIWLUB/IQr8cdg+rUuu+
         mOHw==
X-Forwarded-Encrypted: i=1; AKwUvBzydihxYIIrlPZn982TuxAWvnnhbh7uU1wOC3ofKt2F7ebggVRppGiaRPNVXWrotB3AOfpPaeKhbAUJRHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmOcWhmpJdJooG45B1tptZj3QhtdYqJjiG4cWG+vduQHf/TYg/
	4P8oxLtjL/x2YdjYSSMuZXO3Pnf/jacVAiXNfqu9kuFp9keddNd6xEEQApN92ycqUxU=
X-Gm-Gg: AYBFou1asACrryhtAyMwua8wdn94uhS5m0cnIdArPNLzqd0SJ0z8kBmJwHmplVmcYyC
	OrkjDMSfU4DijJVXN2rmW1qtUdbEczztobWq1P1pfD23kW8JvTz2vo5P9KxFpagYY5LLiyQiW+z
	CR4dMfhHrUuqJyqOZrXVuNmLTSP5igc/2AJUAw/MoQtfXjegmdUIIRvWUob0QGVgINIlfY9D8I6
	MRJZyX/YOfcfV5XTIxBsB4B6Dvj/fXMPveQP8N0bc4BB2uPU40+crwx+IynjGiEBwTsvGUBudhL
	MoylbEKqqVRrIg6/apsNjkpWfEs+cv5x0TczmRDWQTtt9G48oBQoIp5Wc0u1GV4wluvqR6rv5+a
	V8GMS8dcNIBGLiU1KCb4J4AMmVIC4yNpUI9pkzPnmGi5/5WYaoYPlkyBjWVHAgyQ3B/ZDDCJXcr
	TjZrUZp0oT4FOlsc4PUxGcP5X6WEbbfkVso1eifGGVqoP2kALiSQbknrU46475wBdONCtwui+Vs
	0A686zojy78AkLyDYZe7rk=
X-Received: by 2002:a05:6300:6698:b0:3e1:4fbc:5ce9 with SMTP id adf61e73a8af0-3e164f32a4emr6971521637.20.1791840423279;
        Mon, 12 Oct 2026 14:27:03 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm4705338a12.24.2026.10.12.14.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:27:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:27:01 -0700
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] bnxt_en: Pad short SW USO segments to
 BNXT_MIN_PKT_SIZE
Message-ID: <as1QpaiN8tTtZ1vx@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20261009215426.2377946-1-joe@dama.to>
 <20261009215426.2377946-3-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009215426.2377946-3-joe@dama.to>

On Fri, Oct 09, 2026 at 02:54:24PM -0700, Joe Damato wrote:
> Each SW USO segment is hdr_len + seg_payload bytes. With IPv4, hdr_len
> is 42 bytes, so a segment carrying less than 10 bytes of UDP payload is
> sent shorter than BNXT_MIN_PKT_SIZE. This happens with a short last
> segment (e.g. gso_size 1400 and 1405 bytes of payload) or with a
> gso_size below 10 bytes.

[...]

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
> index ef04c9d08066..80d5c4f963a9 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
> @@ -82,11 +82,19 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
>  	if (unlikely(num_segs <= 1))
>  		goto drop;
>  
> +	/* bnxt_features_check() makes the stack segment these, but paths
> +	 * that skip validate_xmit_skb() (e.g. generic XDP_TX of a GRO'd
> +	 * skb) can still get here. Padding every segment would need more
> +	 * BDs than bds_needed reserves below, so drop instead.
> +	 */
> +	if (unlikely(bnxt_sw_gso_pad_len(hdr_len, mss)))
> +		goto drop;
> +

I could be wrong, but I think if [1] is applied this drop can go away (?)

[1]: https://lore.kernel.org/netdev/20260928223648.2739371-6-kuba@kernel.org/
