Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794074036;
	b=RRJtbMqLO9O670EiPNpi5pDVqWDy5c5075afDYDWQeKfZ+CVHcSfV/5u/3ynYrLsmLNj
	 Ls7RhIxhHZdCQObLa5tjsITCBZIttePoUFTBvG/Yqx3Gx/KhwjujPsvS2QRhrRY+H2qM5
	 IC9EfFsvyVRktk0rvtTTLRV09ixh6un02ZGJJLkTY62uFDmxrtR8s3A03Jc4Qu7xUE8Vi
	 h7f682C+emz8rbvJIyIkcPSNf8T675RryCegt4bOcBK6rJRrLI7tZGOl28GqUMJ0OkDZD
	 n+6Z3ZeFVvUSEZy6IU32Ofrc2t/X6ZPhMLHy6AXeVj2n0RviNio9sPEsq+1Xr32WbtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
	b=1nWY+XSlhlpowkbXRsq+8pmHaDfWVcpxDi8YoBrGFGP8WGTbt10rUaTA++prkai/1fpW
	 nmXmSOQ+bj/i4L+8Wz5y+ftF6A7zmGjk0IjTkuBeeDjZUylG7Bu8SkxrzZ8q8P+oEuTKj
	 0KaYFKitNXh1Filgw5PncryboKcmxhcwiH/8wj+pFTxx5kPXRCnQz57KQrtd+EQ30CK4x
	 3kZ34nGrP5vCt3gyDdLIS9/WNZcuLqmzXV0Ezs8tpu+uxXptB5Y8EKqibbLBcqO88N7xQ
	 IGsTEmqxT+Ojlx+UzDZljcbY6zp1Lnr18pcmNPoRylr20Gvcj09WMksMcIZHDsPU9Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MA43WfmR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFEC606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFEC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MA43WfmR
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535f598d126so85661cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794074035; cv=none;
        d=google.com; s=arc-20260327;
        b=cesZoiXhkWV5GW9L7qUAzQcr7Pj8moH+DwPmZ9zbcDspSGAl+dLUdMpKrU1NemItXW
         V+oThcit1ZnnYBvXXqm+LxK+f13eAYi8MPgYYNkBsJCWfZCwi/tpf2jHUpz6u3fdjjJ+
         i+XknURxYULWw6bvT68mdAdJ4rI41OlzkDhHh3MQyMnVEMlZ6rfM4n8P/Iu6YGM6CcRb
         L6RvSKE+gGcaN3fkb7qZBxwWyIjecRbaTFvnp/wMt4u1pqWFjR7PQuZ0xjRqKRPOt4aM
         iAC8Oz4stW4xCLa3spNU/PiXyPYNWeA75jhQPhlLAxcRWl8jcYXjE0R0fKEOw7DVUU2l
         Hy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        fh=N5ePp1kKGGCyHPUCxP/A4PbXKiiUiKMilknVRg3VDvc=;
        b=LUpPXgoRXUj73nxBjIAt4VUG9kf20KrOQ8QqT+VGJufHgBDZkOKsA4971fLAkMD0R1
         3RsJCHtthfGMY+jNZBF9gFgbvqyBm5nZBQAQln4shO82eYsOJ/KKYcAgBr3RTGXhfVUR
         6fdHB/Dw5pf2Zt8NrZJAQ3dEbw+EOoBiVePFBlqqvufqCtKR9GB/WVLey39Xftx1nGEq
         WPk+Er+4DHZ2CExcqUoEeeyUkrJONG+PXm4V6AoZJRp/97gad+5/ruA42gzd213JWnp0
         l6eNUYnad+DTMzBcnnf9lvFDglOX9boeOEw8EpzcxpQQ85S8hTOt7Ouc+DPT/ycb4XgU
         UeHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794074035; x=1794678835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        b=MA43WfmRkdNpKUpHX5S3uJIFs7srnYuG5eT22TXmuwSmQj5p1KpLdBHBIP+Sp6zNLy
         Fcluhei+8RnXNRn5oAghsrsoPykvQsbaegnV/ATRS7fzB5Ep11p2KyqXwHJXKWJLNKOR
         faFXYBFCFQQbazi8ZelSEiNdJfLblkuKbBf5Xltl1CtXOThd6wnjlbkTsFandUb0Bnxs
         HWxu3tnEu8ZeHdAfrb1cr3MAIoKJJtYIZSf+T4vEpczx2cOaknV/0jJC4xHW73MMlbRO
         +Uz9LpSuFbtZLp0kiirEy1I9tpRJLip/Wewawl2FWNCwMMfBSEgnM7UuwpgeoJ8sniZD
         2qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074035; x=1794678835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        b=TaGyaEBrjKY5zG3n3/Gz/ZNtdo9z8J3VsbF4vwkFI9LnEMRPPiSb0cD7BpjxcFKjto
         7KC/wBwwJ6xjOtf1yWbQ8utUgjCwDBqAYXE9q0Wnv4i/QLz0VJbeDSZzRFscjCaEKEFQ
         xj9mhxWD4bG2JItfVIpUZ/8L/AfLynjoXBI45Ow4StgiijxDVLekPjmHNUCFGmT63e4f
         hKNoZAFWPdhpGU1CCx9TVAH3PxUHm1mSAx5jlZRKHz3l368fSS7msdckeAQWErm7j/sd
         2Bc/YYI1iUtJq/wKMK+vZ+DT+a6TRe+Mkcu4ZfdECHl6rIxHZ/SMlqyD/h99e8fcUVJu
         DVXQ==
X-Forwarded-Encrypted: i=1; AL+hErErc5Mx8C7/eg7m8doHhbF2+GH0aBCX3KXrvRy14JQYAq+GB7lFrnFveM/tBkO2ogkyPcEKgagoCmZyfiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6jsOHbxqW9jfwN4TniICAyqixrgmhhbztZ37kmlf6nEV6wocm
	RZwk6/dVgES902vx9D5NahKunK8TOB+rG/0mhbxKwiv5+wRK/bT6vu7TBrhw73DaEGzLzaEVlVI
	xk7ywDGfJJvfDHuC986PhhA2l6Kfet/KWK7PvY+wG
X-Gm-Gg: AYBFou3WPh6uurYAo+oXB6uyESr+bCM/EBzhrBK9PSXnE22I2ZZ+4Vkn4EtcAZOpeqQ
	sOC0fqVxzw37MpNVNgSUfCqTgsCF2NxPIGojpXxBfTcQ90MDug3ZIEVnk81xLR58yJIpOB8Cljf
	mbFGtMyEuMhIQP7cBYnERP/FLdvKKz+K8r+ZdvOmrXe6khw/3x/K7S/etEvqo86J5X++8dQ0/ci
	O4t4R8CR9tzghmSkI0LCDzLRGg2joL/l5v+0LS2yq5ajaOEKt0uNJ2IwmJaks2wQcWE6SbwYNM9
	wyml0sshwqZi1+InODbql47gMs9O7gsRyp+etiDfrvMCWwTt01+sX5E8wnC3xfv2RP/f9qKR/dP
	lScJsFFO4edZfnvadeqpXs4I1b6mQqdBL3R1ifkA61h1P2M8P+0joutAvh+fWGExe8rFvGyDtuv
	Dv5jA0RwzHdYzbl1elJ2tUnN7tV1A=
X-Received: by 2002:a05:622a:c07:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-54fc4047021mr12339661cf.12.1794074034132; Sat, 07 Nov 2026
 09:53:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com> <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 7 Nov 2026 12:53:36 -0500
X-Gm-Features: AclHuK-b7qc6bzaZz7ltF4_Msg4vRZBtYtjjIeLFeqwo1Hd-sWVco-4G452TJu0
Message-ID: <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: echoowall@gmail.com
Cc: horms@kernel.org, edumazet@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> before MTU probing is enabled, and tcp_init_transfer() enables it later
> without syncing the MSS again.
>
> With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore starts
> at the full MSS instead of tcp_base_mss as documented, while an active
> connection starts at tcp_base_mss. This has two visible effects, shown
> here with tcp_base_mss=3D1024:
>
>  - The MSS drops when the first probe is acknowledged, from 1460 to 1242,
>    although that probe has just shown the path can carry more.
>
>  - On a black hole path the MSS never tries tcp_base_mss. It goes from
>    1460 straight to 512, since MTU probing is already enabled when black
>    hole detection triggers.
>
> Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> search_low when MTU probing is enabled, so the other tcp_mtu_probing
> values keep their behaviour.
>
> The Fixes commit kept tcp_mtup_init() in a single place on purpose, so
> sync the MSS next to it instead of moving it back into the
> syn_recv_sock() handlers.
>
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e1f2d9765..c13f005b2 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf_op,=
 struct sk_buff *skb)
>         struct tcp_sock *tp =3D tcp_sk(sk);
>
>         tcp_mtup_init(sk);
> +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
>         icsk->icsk_af_ops->rebuild_header(sk);
>         tcp_init_metrics(sk);
>
>
> --

Functionally this seems correct. But I'm wondering about the
performance impact, and whether there is a way to achieve this without
adding this call to the code path for every connection establishment?

Eric and Kuniyuki, WDYT?

neal
