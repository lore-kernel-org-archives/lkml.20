Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114214;
	b=0h5nrImCPA87Vj5bhZhtjvgSmsIo0NKgeP9evwNWZxfjqSfppC8wXjhnHp9FMz+fMbXK
	 Kezcm1rYfVzgsIbMRwHsvdvwzsE2Mt3QaqOlwlSwWfxQsIkD+R2WlSAGNgpP2oLCboZyb
	 0qOLELgon3zgfLnhOcNysWjyJ4JlGMwa2kioK22iichqn3HF3z/5KZeBFseclGhaKhQO8
	 yfC6SB8j6G6Wl8OIPNCyOcmjaMkjY3wbp/AVpO2jAY/jMT/vgTT/jdPZ+0gVN0uqUNikN
	 29bcgD4UWPyHDt4pyax5Nvd84iHFJbr15dE4s2KS1zVZJxiSih649GoCKojQKOc5m0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=pV7/FMjkL7wdPpM8Y5++u8mrK5b9ri0r/zd+YSKLnSY=;
	b=3sIoznoZTgKzWktIBv8J+CMCxiRaduBJHN5a5FQNjkMuwLMtCFPmKSOU4OKDZwfY3wml
	 nMJ16PrBcyPNIlm3KYARJnW6mvvAX+blRHvWgZD5R+wSpFaZXHytTtDa6NHewdvdKqeqp
	 Xe0Z4D8Zk6I1NW8uI77fpHo7SHLarZZ13Nstx7eqy2Li5ubwK4BFqa6Iq17QsQ39y0oNs
	 aU1Cn4auLISbafwhXaOOUvGMwqLHaSZdZxh17IYDnTUXFlxyHtDaVSSW/VuRNtczYOx99
	 y07EjWyc5nfYY/ldDh9P+KZKrCeBDLf577EOn4bXZ2Pcdhptq6r2o2LroQyeb1JNAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJcrFyod;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4378A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJcrFyod
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b05bf699easo40162697b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114212; x=1793719012; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV7/FMjkL7wdPpM8Y5++u8mrK5b9ri0r/zd+YSKLnSY=;
        b=bJcrFyoddKPNBUKMCWSaSLNvZDtVwvQ1Ps1hJYAyLKLDONqD/aDvfhTq3zgSTdBwlN
         jBjU+4/LHNvJx9CTIEQ1Vg6/GMOm5ZHWSeSEcUn1cglxfM/QokKoFF2DgNFEgxf6mdfB
         qRu+o2ma+8jTA6il9dY0Sx+/uVtjMTims0fyGaPPwj4sLUh30Ql24gM0/0Rn60UcJYtt
         TJdmauEA1AQ5PkKzhYzcZpDgFk2vteUH2BIdeSbjf/KJ+zb4MD5ISpp8zLc8eLfQmlEX
         dalfnQzkkYc4bqYoPXZIMrAV7Qu2oK0u/UZzPJ8jIkks16MV1M8bEzik3Miq6yR3uEya
         q4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114212; x=1793719012;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV7/FMjkL7wdPpM8Y5++u8mrK5b9ri0r/zd+YSKLnSY=;
        b=AvsS1pwSpTw7qvGRU+syAlSXVSGlAD32itfz1b4HXWhgGR80qre/JTKBBQgWAZoYn8
         hDxwWRXNiJz0+wJmEKlWF41wxUk9d3ZZg3oSVCc107n6Bz9m+uZAg6GzSBV+N/QGTy1W
         CuMDXHI9lQdNNOvhr0pt7YNoy7WE+rG9ziCHjAX/9zh/FftnLpTPp6KdrPK+kCsZdyxx
         A2yqdwkrP4GUj3sAu7P6mj/Kwj00A1dgSJx//N3ka+2IDiiuiKWWJQgWTbcBqjGx4+IZ
         xB1m/yAYzDPqK1QzEiaBUsS5WGoWpUmGK6XGvPjWFz8GKh/VP7dtwBTfTg03DffL1nGx
         KytQ==
X-Forwarded-Encrypted: i=1; AKwUvBypK9vs9so/FSSoyLHZ6WotGHy/RqQWM44EX+B/h3gSKT+NbX/b4F6f/QfF9jJZnGqfMGhckYiJi2rPXA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/pcTWg9oIMenJY93TikrUdjISFYUZDZ3zn5gXZzORTDjj1Njf
	nakqFmfaTTFOkTTs8CdFWF7zcS66qvnyOVcnJEg4lmvZPXYo1K8WMYjT
X-Gm-Gg: AYBFou3wt72T/wNaQyNyIPJJAMRSLexp8Q7RWVTCP5PnT4W83PDI6hySZarHXKso0U/
	TIr7bZ2c81LAeho0bTVx5onI0zKSWK/7HpHg5d8+S0J+Xx1OJkMe1DQRv/KEXdOi2ED0OUygvWG
	hAAN7P3f+i87djr5WdP/vBJ4BF5slse8EVeHslm8PNPZPrdeF6I3Mt3u3SFmxUmXlqhYpXDp4ff
	Sp51/OQMf897GSF3YxFTu9V7MwLFcljYKxiyYjyltKzU53ZVRThTEbJEgFvDeUwEW8N75tWn3X7
	32BD+0nEpJV0x+Dl6AXn/fVLuGZrmU3WrSAZIjMyAaSkT5qiEfYIyn0aNyPzlZuuL3YOturZwKT
	Q+odr6uZvZiTRipBVW2tS6uEWWPRtB3MDmRf7pY7YjhjCplObmWYccn4nJW3TaPYc0RUDgnS7Nz
	SaaTO5HmT7YWvrQcar+V9W4wY0Vzngg+nV3wP5DX+Fy9EkLz9w1PHjawyhEvGlbA20jRqs1yl1X
	A/v1OWz0CspS6jXX1M2lDwHsky3J6DQ978m0HK13Ez326GyZm5AHyzrk8hZrodZ
X-Received: by 2002:a05:690c:dd4:b0:8b1:4446:8534 with SMTP id 00721157ae682-8b166b77c23mr74464917b3.15.1793114212162;
        Tue, 27 Oct 2026 08:16:52 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::4:1ee2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e539e34sm13895667b3.9.2026.10.27.08.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:16:51 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 11:16:50 -0400
Message-Id: <DMFPXSDO64VR.2AYG2NTUEYFRF@gmail.com>
Cc: "Boris Pismenny" <borisp@nvidia.com>, "Saeed Mahameed"
 <saeedm@nvidia.com>, "Leon Romanovsky" <leon@kernel.org>, "Tariq Toukan"
 <tariqt@nvidia.com>, "Mark Bloch" <mbloch@nvidia.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Daniel Zahka" <daniel.zahka@gmail.com>,
 "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Simon Horman"
 <horms@kernel.org>, "Shuah Khan" <shuah@kernel.org>, "Cosmin Ratiu"
 <cratiu@nvidia.com>, "Raed Salem" <raeds@nvidia.com>, "Rahul Rameshbabu"
 <rrameshbabu@nvidia.com>, <linux-rdma@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Dragos Tatulea"
 <dtatulea@nvidia.com>
Subject: Re: [PATCH net v3 1/4] net/mlx5e: psp: tso: replace only the length
 in checksum seed
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261023234640.1459291-1-toddfreed@meta.com>
 <20261023234640.1459291-2-toddfreed@meta.com>
In-Reply-To: <20261023234640.1459291-2-toddfreed@meta.com>

On Fri Oct 23, 2026 at 7:46 PM EDT, Todd Freed wrote:
> for psp tcp with tso,
>
>  - __tcp_transmit_skb() -> tcp_v6_send_check() or tcp_v4_send_check()
>    computes the checksum seed using the addresses on the socket and the
>    total length, then
>
>  - mlx5e_psp_handle_tx_skb() recomputes the checksum seed using
>    addresses from the packet's l3 header, and the length of one segment
>
> the length difference is expected by the device. however, the
> difference in addresses is incorrect in cases where the l3 header daddr
> is an intermediate hop (e.g. IPV6_RTHDR). this causes every segment of
> the tso packet to go out with a bad tcp checksum, in this case.
>
> the fix is to replace only the length in the seed which tcp had already
> computed. this is also what tcp_gso_segment() does.
>
> tested on connectx-7 with the rest of this series applied, with a psp
> tcp socket whose segment routing header's first hop isn't the final
> destination, and the peer checking tcp checksums in software.
>
> Fixes: e5a1861a298e ("net/mlx5e: Implement PSP Tx data path")
> Signed-off-by: Todd Freed <toddfreed@meta.com>
> ---
>  .../mellanox/mlx5/core/en_accel/psp_rxtx.c    | 21 ++++++++-----------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c =
b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
> index 348fd7a96261..d9c2742b3c24 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp_rxtx.c
> @@ -177,18 +177,15 @@ bool mlx5e_psp_handle_tx_skb(struct net_device *net=
dev,
>  		return false;
>  	}
>  	if (skb_is_gso(skb)) {
> -		int len =3D skb_shinfo(skb)->gso_size + inner_tcp_hdrlen(skb);
> -		struct tcphdr *th =3D inner_tcp_hdr(skb);
> -
> -		if (skb->protocol =3D=3D htons(ETH_P_IP)) {
> -			const struct iphdr *ip =3D ip_hdr(skb);
> -
> -			th->check =3D ~tcp_v4_check(len, ip->saddr, ip->daddr, 0);
> -		} else {
> -			const struct ipv6hdr *ip6 =3D ipv6_hdr(skb);
> -
> -			th->check =3D ~tcp_v6_check(len, &ip6->saddr, &ip6->daddr, 0);
> -		}
> +		u32 seg_len =3D skb_shinfo(skb)->gso_size + inner_tcp_hdrlen(skb);
> +		u32 len =3D skb->len - skb_inner_transport_offset(skb);
> +
> +		/* update just the length component of the checksum seed
> +		 * tcp computed the seed with the total length, but mlx5
> +		 * devices are expecting the segment length
> +		 */
> +		inet_proto_csum_replace4(&inner_tcp_hdr(skb)->check, skb,
> +					 htonl(len), htonl(seg_len), true);
>  	}
> =20
>  	return true;

Thanks. Makes sense to me. The bot has a mega nit about the commit
message that may be worth addressing next version, but otherwise:

Acked-by: Daniel Zahka <daniel.zahka@gmail.com>
