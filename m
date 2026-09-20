Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556B471262
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924010; cv=none; b=ojd7jK52Aq7UqmZ3i2NBkYd6BrMO7xrXpX5FDU1kjX7wqCyVRB6b+VGEENU/VIQuui4DVSCocTigKG54Jaa7QveknSbLhkhniD2IK2VwsJM2cXLlyb4rV9QSUipiaWR6/g/mWCnr+WbLVkCrEtbvpxuEDewexV+97QYXe8wmsfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924010; c=relaxed/simple;
	bh=zyIl1YnF/JeDemR1K+Qanp4L+ZXF5mP582Kn34vWEy8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=ja2JzVAT9LQFOX9H8c5tprmgRuJIFgXgka/E2dcIgAsxm5EdfFhjMlZI4r8kFZrGW1zcDb+b3dszPItQr5l2oWmUIJSijim/39Yq7texrzAnqcdGjCdBJJH2TkfAURVAjDeQnMNuF7fflyuXDvYD+tYQuaTc9lbOyH1JUjekgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISqT5DKM; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISqT5DKM"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso2311873a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789924008; x=1790528808; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjWfIDJ8pChJcBT+tDEEp1v7Bwad+KNaOWOCVwGIFkE=;
        b=ISqT5DKM960lQRUriozMuzkHZLrb7N1gpYgZklj3uckDCsFJtJzKVKkbqwKO5hUGKi
         zDQYcoKYG4TGAb/ZupyK9u44lWqSBGDjwE8zjJpSJc90tZANict9P4G63mHO6EwsS1kw
         xdE19gyxnUR9NGWWmDoSVKqh5m+rkQBjuHy0tJZiZEzch2bnl8jE6X+8NOWFgoKN1KCw
         DgkJByv6P+Qf/CgX2matMw66vLlf/mM+9cNw9r+dRAt0GDXYRATo33F8bAZBH9ZSgG6Z
         WxDzlOEDBGBl4xawrGtuomiEtN++daha1qP0mC2kkkWbp18h03D4ElMBLfIUYzmJFNqS
         0wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924008; x=1790528808;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjWfIDJ8pChJcBT+tDEEp1v7Bwad+KNaOWOCVwGIFkE=;
        b=ANJ231tU8Vrak30a4DT+mYVQ97c0iMBsIsiFxvBdUY1i4KlsOpnl3DDZJRzj/1+aJi
         C24hC+bddyzie3uLqBnXoyg+tkOZr2mcBRxxT51dhibfGwBBQKHUM6NQyi7dUQ6+Hi4q
         BLl5YdwrmzNFlwe00mkx4tqb21dBNGYWUzUNq1Hi1wgWKEXaQrGMno1KN04wOXMMGboQ
         YGDCCvzoR0jk+qEnZ0cB1fgHhlKBSZMW5d6Zo8vfgagd13rCOq+b4tcsOqRZPUXqCf7u
         TDCZtxX9ievwFWjYKZWYof+iwjtbrzEau6cTAFZ1yWnOt9VBmG9eRVq1SGO0qNcDHBdk
         eiIQ==
X-Gm-Message-State: AFuF++lZhCTHI7A0xuu58NvhPpf/2+QSiNWLKQ8uQjipt+3ujuen+NST
	PxsDxHeVJDS8tsaORqpD7W28FUThFCzWzCf3EkijQxe0wIK46PTg82El
X-Gm-Gg: AYBFou1f9ZnZ9+dDL0d1zRyj6LwzZ1IRyPLc+DpJHqyTy3ItraY7jbaf6OSmLk0Mbwe
	uI+3wQ7wlRJ7VsvUuwaJ2uGECUKbo9IdNXsdBCcP2YI4XL0HbBWHrdzh3TrW9AbefRmxDf35XXL
	RIhN4HvtWSzR561g0MJj5mGYBZzksHve3Pc4Exjzt6TaULxzLorArrGuLeIWRsBhSIqi0jrZdWa
	Nu1QAzJ09luHyAuRIyOQmWtlZzxhqeRL89KX5nDf8AMMyDjNBP/pHsY6nQIpWjvnStKJxLeaDiN
	PQy7s1kXp/YnZUsXwGZAvLwB2YN6GZXhzU/KYyATwu6xGaiTXOLSRFyxyX0pC6EuyYSI+l5o+FR
	MlqdwPZvceL8oGeIY+VfKA8XGUgUwBTrCWVs5sa11TUhLUfsDfBS3vdbXrC9MR4vLmH82IG+0TA
	OuCQPGzRUVXffFXH52Q/ArPAJuhduawhm0HpgqMeHwSXxuKEVltGxYeauzmZOAg7EWoxDSc/Kkd
	mv5112+fiSn/x5hvDThIxaHDahgsIvSCvMq/zze0zcLoSEU6qgTFpr/wFLMYm8G78kiQubDQi7o
	lZDV
X-Received: by 2002:a17:90b:2d87:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e54d8ecdemr20165760a91.5.1789924008366;
        Sun, 20 Sep 2026 10:06:48 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6bd191aesm10168886a91.0.2026.09.20.10.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 10:06:47 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 17:06:47 +0000
Message-Id: <DLKB3T7PYCND.3FLS0I8UEX9NL@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Peter
 Oskolkov" <posk@google.com>, "Xiang Mei" <xmei5@asu.edu>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] bpf: clear stale IPv4 options after LWT
 encapsulation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260920163211.795547-3-bestswngs@gmail.com>
References: <20260920163211.795547-1-bestswngs@gmail.com> <20260920163211.795547-3-bestswngs@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 21, 2026 at 12:32 AM Weiming Shi <bestswngs@gmail.com> wrote:
> Select the reset layout from the protocol callback which consumes the
> packet: the original family for BPF_OK and unsupported redirects, or the
> new family for supported reroute and redirect paths. Preserve the ingress
> interface and L3-slave state from the restored original control block and
> initialize the IPv6 next-header offset when needed. Save and restore the
> marker around nested LWT runs.

What Daniel sketched in v2 was 20 lines. This is still an overkill.

[...]

> +static void bpf_lwt_reset_cb(struct sk_buff *skb, __be16 orig_proto,
> +			     bool use_new_proto)
> +{
> +	__be16 cb_proto = use_new_proto ? skb->protocol : orig_proto;
> +	int iif = skb->skb_iif;
> +	bool l3slave = false;
> +
> +	/* VRF may have replaced skb_iif with the master device index. */
> +	if (orig_proto == htons(ETH_P_IP)) {
> +		iif = IPCB(skb)->iif;
> +		l3slave = ipv4_l3mdev_skb(IPCB(skb)->flags);



When the family doesn't change only IPCB(skb)->opt is stale.
Clear just that like ip_tunnel_xmit() and udp_tunnel_xmit_skb() do.
iif and flags stay as they are and the VRF special casing goes away.
When the family changes do what seg6_do_srh_encap() does.

[...]

> +	use_new_proto = (ret == BPF_LWT_REROUTE &&
> +			 lwt->prog->type != BPF_PROG_TYPE_LWT_OUT) ||
> +			(ret == BPF_REDIRECT && can_redirect);
> +	if (lwt_ip_encap)
> +		bpf_lwt_reset_cb(skb, orig_proto, use_new_proto);

Not needed. BPF_OK after the prog changed the family is broken no
matter which layout the cb has. bpf_xmit() drops such skb and
bpf_input() hands a v6 packet to ip_forward().
Use skb->protocol.

pw-bot: cr
