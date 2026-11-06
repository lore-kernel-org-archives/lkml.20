Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937018;
	b=cte8zgRT2iHsdjpUbSfX4diVgEZknXSh4lzxCRSIFvdK725qK3If5JB/FHt/o4Xf/fkd
	 LR1fZcAnmA5rg8cx2ZOrmJy6YgcjdEWWpjM2r7kxeFDfHcELgfQe7t5iFu1RlUM/Ghw/9
	 iZbIMiOMhiCvcdXpouxZ6EsrHpKJbv2rX+Jlq4YuSzm8ICbsWmaDI+O67JDQhp56h6/jC
	 RDSVpmBc6tNgF0SRAgWHuFMsMsmEOKkw8q3TWsJxQL/f/ygNT5LokOlKsj16AYRFLsbKL
	 kGQplSBr0QpB5tx2UKn99eZ6vR6DxBjx5mRcQIiv5lcePHr1N0q6OYQQiVJZ4shYqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=mzWNIgox/w4qNjiRIlcPQMIvLrmBH31myx/g/3s6wQA=;
	b=LHwm+gKHAlznnOcLVQvNENtATLwVhdEN6cjaXMLVBuQnMmed423XX5gRSO0VyVouAp0D
	 7ug7Lk38+qk6lTbgUhRNy8iCZmMfDUlupCJTq2OCxqyp7svu5pQsihV913ggJBWGbMlq2
	 KyFCsxKgp9AIc3e83EfzfyaDBthzQJaay+Q2SuOPq7jkGGUG5qV26rIEbH6zO1D8WPDCh
	 aE/fUu2G2f3A21oPk3gp709vV8riYLkwfLVulEbyf1lh0Hau0WcgZ3mN1Ne54biADCi5E
	 nPX66psjAoMK6e9J8hpjs5GN61ViOAlyw6Nb0HNURyt6AUtCJj/5HAMlxVZ1BHoA9Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvSH5nMQ;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0A8606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A0A8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvSH5nMQ
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso99366a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793937016; x=1794541816; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzWNIgox/w4qNjiRIlcPQMIvLrmBH31myx/g/3s6wQA=;
        b=qvSH5nMQv96uu/Fnl0su+/LAaZ43VJiHaYCmYpPGAOk/Ju+NE8lTdad4+eQf5vvj4u
         26iatJElu7RIlaEovBJHVBFuGUSan5FxnyPCy7cs7x+oKwV039X0z6pBuFmCHc1LNWh9
         +lkXwrg9feV46Ai91AmE4xkEupWH5sZb71NKbVklp/uvJ0JUqGxhMjBw116wEmK3piLq
         3OFeNqq01y8QJkWdh0XtlUBNNa6gpWXsTdjLrLYG/c4deRHZM1cnsWlX9ETk2E4knqe5
         gb2wENguyDUMV3nrvMw/JP/BWdpSS9P++c7ti9U6ruN2jdp2ksw/dW70uHw8Rkmm8C9F
         Ivow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793937016; x=1794541816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzWNIgox/w4qNjiRIlcPQMIvLrmBH31myx/g/3s6wQA=;
        b=GtgtYlyy9ijx740nwgP+1vV23vWpxT0oYBEqntVzpNp/1rrQobp6LyvPi+KjUA4Q2B
         1aAUcvhzLAoVA6pZSRNn7FqSUiCpL4Jr/wp71xzjdtd5gYcoCc3BTWbJUUK7e5t+YAEv
         f4KEH/w21UztdLmH8FsNXts1uuq7KsyMfYGyv7cOUKhP5N0NarrdOvJYVGPOMz8OA+ZT
         S2UD2CjjAjjJRhe/NEahA+xFXCFmoFoX5Fiz0rvRHwym4IoSsLe3sz0U+sLZIypUY7HD
         lUtaG/xlaU7CjFJALI15FrN6WZh5pBGpOl4EQh9J41TUFJrNbtEu7HbOPyFrbzc2mbMf
         Wu8w==
X-Forwarded-Encrypted: i=1; AL+hErFVjIct9H2dvaiNjNZm/WfADI/BRHbBTvQsrYGo79hD+mYpYCAZAP7MYItjEUMn/XYIJqYW+pZqW1sNZbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yv720s+/kMpGpw9RRJiQ29DMdRo77NTJprp3HdfMk9Jz4Igb8
	rVvP5WAEtudFwmswTxtNAoeIUGargB9ROtfbJ5XoglBL2Rce434Ll8Y5
X-Gm-Gg: AYBFou0w0ylW8TKJo7A8LTaLx9osfagX0AGHENgKN8b6/UPKnInFiSkfc+iYa89dYXC
	gjbxf3NMht54jKdOtZI9/MX8/1Tt87j7zX2ZMSXKLfIctbJwwIcQ85eNFgJE2pvac/Q4Wjcb3OE
	tMWMuBE7am1ZOrifPgC6XhGvcN0GpG3Zo6XDVdKNxLUp2UXX3S8DhN7ASeEax2dyFd7fz6ETjKq
	6sCJZRDT0bTu/jb7DqhyJi8URx7+aAzJeODkg/cc+1OHG7l9YluKbUS+xsT0FF+X2Id7kl4aDhW
	VDS2U8WoaqznOymG1FTGSi+0fhuWI+aww9x2+aHl5cR+V6isV0zlbjUsKFR+VuAcxc7+PpFROYn
	ceJlbdJYgrWKwv9c5es6oIOFxxa6uM+em9da07p85I+83Of1g0lnlzHWfI+cIkxh5yjHt+n74km
	iXUhxH1kLKtAXLZV49Kr1LIFtFUckD6tYeiHjsd81tbnhVQtJ00p6Wk01KjPXwWOl6Qf9CaE7W1
	o5HIDrDUvPFADWb5/mObKHkaagZcDyvGReKBOV4jBLWfnFJ3wrPT556u6Ni7eGxc1EcM9FZbFTE
	Ah5ToXwgCcNMy3BJX37kTF99Y16agHlRQbVIDk7HlJgerhH/OkbPrO3uYgSCPaDGKz8wfXxuiJ7
	iPTPpWHU7n7crwZ4auHpITHk918Pb+fMGAQ==
X-Received: by 2002:a17:90b:4ece:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3b0db705fd7mr1132135a91.33.1793937016161;
        Thu, 05 Nov 2026 19:50:16 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e57a8031sm5076a91.4.2026.11.05.19.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:50:15 -0800 (PST)
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
Date: Fri, 06 Nov 2026 03:50:15 +0000
Message-Id: <DMNTLJOZ13N4.2LG5MIRML7XOZ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sariorkunemin@gmail.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Martin KaFai Lau"
 <martin.lau@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Josef Bacik"
 <josef@toxicpanda.com>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: lwt: Don't let bpf_lwt_push_encap() wrap
 gso_size
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261105-bpf-lwt-gso-v1-1-cda5e19d321a@gmail.com>
In-Reply-To: <20261105-bpf-lwt-gso-v1-1-cda5e19d321a@gmail.com>

On Thu Nov 5, 2026 at 1:23 PM UTC, Orkun Emin Sar=C4=B1 via B4 Relay wrote:
> From: Orkun Emin Sar=C4=B1 <sariorkunemin@gmail.com>
>
> When bpf_lwt_push_encap() adds an IP header to a TCP GSO skb in
> BPF_LWT_ENCAP_IP mode, handle_gso_type() lowers gso_size by the length
> of the header. Nothing checks the result. gso_size has 16 bits, so a
> gso_size smaller than the header wraps, and one less than the header
> length gives GSO_BY_FRAGS. skb_segment() then takes the segment lengths
> from a frag_list that the skb does not have.
>
> This is the problem that commit 12d07c38e1b0 ("bpf: Don't let
> bpf_skb_adjust_room() use up the MSS") fixed for bpf_skb_adjust_room().
> As there, gso_size comes from the peer if GRO built the skb, or from the
> virtio header if it came from a tun device or a packet socket, so it can
> be as small as TCP_MIN_GSO_SIZE.
>
> Refuse the encap if less than TCP_MIN_GSO_SIZE would be left, before the
> skb is changed. Return -ENOTSUPP, as handle_gso_encap() does for GSO
> skbs it cannot handle.
>
> Found with AI-assisted code review (Claude Code).
>
> Fixes: ca78801a81e0 ("bpf: handle GSO in bpf_lwt_push_encap")
> Signed-off-by: Orkun Emin Sar=C4=B1 <sariorkunemin@gmail.com>
> ---
> No reproducer was run and the fix is not runtime-tested. Build-tested
> with LLVM=3D1 W=3D1 and CONFIG_LWTUNNEL_BPF=3Dy. checkpatch prefers
> EOPNOTSUPP; ENOTSUPP is kept to match the other errors of this helper.
> ---
>  net/core/lwt_bpf.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> index da49364ec6..c151a013a8 100644
> --- a/net/core/lwt_bpf.c
> +++ b/net/core/lwt_bpf.c
> @@ -13,6 +13,7 @@
>  #include <net/gre.h>
>  #include <net/ip.h>
>  #include <net/ip6_route.h>
> +#include <net/tcp.h>
> =20
>  struct bpf_lwt_prog {
>  	struct bpf_prog *prog;
> @@ -632,6 +633,14 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void =
*hdr, u32 len, bool ingress)
>  		return -EINVAL;
>  	}
> =20
> +	/*
> +	 * The MSS is lowered by len. Leave the least that the stack lets a
> +	 * TCP GSO packet have, or gso_size can wrap.
> +	 */
> +	if (skb_is_gso(skb) &&
> +	    skb_shinfo(skb)->gso_size < len + TCP_MIN_GSO_SIZE)
> +		return -ENOTSUPP;

I think it was fixed already. If not pls share a repro
that does so on bpf and bpf-next.
pw-bot: cr
