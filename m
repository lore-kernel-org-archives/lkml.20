Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE7049F139
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375544; cv=pass; b=aGPKTorf7KpAGal8VKiSTP3swbIYSF8Sl71hiVIAC39UpFjw+7phQxcKMYS5HcgzICc1C6BB38bP/LoFLYJ3l0NruzxwR9FgSAxz3iJ9Yz0WGQti111bxW5qNIYCSsNoNgqiT7E4jetm7efFLtjv4doVS8yEAS5aMneAug6o3j0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375544; c=relaxed/simple;
	bh=PlYDKCubdg2Vpkzfi7BodZEu89/tMEosCuvgSei2oKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRG1VEhDJ1J1tE7NLkPhxmrnhnwAruFod6fA/A2MThVWQ+Xdd0JmNqt8H0oZIM1QV8k+P75uF2Cv3FotfzpsWpSWxgbU2sxKXfTmpal3wk3h9rYW0OhxYhIt97w4PW+Jx3IjfpbBc+DMktbmBCuDk+Nmom2N/uTaYX+dIC81UEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sZ704HKh; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sZ704HKh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1242031a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788375542; cv=none;
        d=google.com; s=arc-20260327;
        b=W/T9lIsB7DaCdNNaW7k7RY9dR7IqanqZOuj00BK91xDZhkp2lIVnU8VzmY+5CHBRp1
         nXQurWki6SzNl8Qy5oBubw0JhuTMkFauvvY5FBxf8okpd0OlvIMZJ7uwtJA9MlNwVLRi
         iscVWtGAAWsxF40iwFFFiS2hMFRa6Fmb1xMY7MX29NhBUdzR367q0cyjVLLik2U5c61l
         xwiYPC2wez0GFLsxp+EwlKCaFJ3upZqfHkhY5TZuQCiwoWdc1vRG4OCOC0oEVlofxqAP
         94Fzktmsu4yXX2vaG4/MmsJ11/4Flrqj9d3jozvHPL2ElZB+drwwTJyo/6IqVqVYWBLx
         2fDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dmoGpki0UxRpf1bO8pSrPH7StAL/x6IA9T+AOAVdnbg=;
        fh=xZ+fnxwBGCH1cNiqfBvClJjs246AQt+AuR5tdWIE0VY=;
        b=Dj+jguaX6NIbd19RlybpkTl8bohZm8DKtautR8qW3Tz7VqnWOQ1NobH89rY8JK0Mnq
         Ut5rmT0WrcEnPXpKEQ8OC+cefM3/+wMHL9YHmfhyz2IbYkS7JZmv9X5r/2HHidDimBCi
         agdeZj5aVey8ySLGh231F2VB5FBx1Le0nAtLwoEXigN8lOmlLXeZkLSJkrtJXEffBvh7
         zpzZJlHBTowF3wGmWHQ2e1+Sn3JCflnAu/7n18L0Pxo2t/RCWcvBvIDORxmOfkh/y0ss
         nhqNKWW7hmy74pHjfT/nlLRIzw6o21IGPCIH+gSOiKnZIBGoOYfjuTPed7GDinM+6on4
         ZmPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788375542; x=1788980342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dmoGpki0UxRpf1bO8pSrPH7StAL/x6IA9T+AOAVdnbg=;
        b=sZ704HKhx08Xe3jzi+Zaf4HAzb94oHM7OCT/EJC/g9kw0xoe0iD44fTOdpKDBbtz9B
         vqjuo87RU9LmGZnBILrPOhNnTpb1zUD2PpMO/04Q3CDAnZpaK+xmIBwB1glgbTFq0DPY
         tQsPK9ISA32zTI2hOc36tsNU0daYGnWvIne/cQVTNQ8KWaXZGU3MkMXVXMCb168LaIsQ
         XB2Z1aGb5ZKA9/7F+gC7OV16C6gdIG4cAtsTsqUzlkN7pjjgO7UjEO3XwUL1/lRo/+Ar
         2yVUhJcIt5GX1YKpttl0HK8F86Bfh3N755fe5u395EWx4O37EXxMyATLg2TTkBjfPuPD
         s2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375542; x=1788980342;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmoGpki0UxRpf1bO8pSrPH7StAL/x6IA9T+AOAVdnbg=;
        b=TtFZKWk3AFc7ytycryzbxa3k/Ew+xNnJnC1YBr6v7m0BO53tylwsJhkja5pF1T/Im/
         +d21+8LOgIPIVI3mAGM77sTdh5LkRi3InvcerHKBThwz/vQ+BK9ijOKtZftI347qmWJG
         ixein9lQxz7UUq298j4lTABK+UcLYnUDGF+cMRG9k+hwqIexMDVFgQd4UNbuBRKKB1ZW
         I4FvmOHHTKp2kPPkGugiF3fKPK80mWA0sfh6VwRMWawWPbuPoUJJAKEgfbatHzMmjYoH
         b1yT/eKluSHekN6oJZQA3WL+CljP538WpTd6CNkO4ZwhC5FlM4SMeyVFSH+T16mkuot9
         BSpg==
X-Forwarded-Encrypted: i=1; AKwUvBxRS2fqloj3FJ58TuNY0ZeId1pQ1IJrjklK/ClPg1XHLuOPhnxtGblec6eJUXu9Ad9PRHYd8Mc/BwSaVUU=@vger.kernel.org
X-Gm-Message-State: AFuF++miNrbaEMqfrXMu4ICI5G3ZuR1IdOfYKruMdWrMjTLuKSpWMf8T
	+F1O/E5PzDMD2mugphsSVoPhefO7XR/X3yaQv4UpiQaMmDJxUnuls1ye8VZPowuIsGMJjRJ3ba2
	SBayKuFSL5WQIGB3qVfWpBsuDXAtR+T2RiNSKxyWz
X-Gm-Gg: AYBFou1zST3XnL/pvWTytNpYYMz51A321dg80SfjZRL6x4BfB1b/LyeUCmsCDoniy45
	ekYwtQT+K87iom5RChsHrq+CYJnL9DG+xTWPcZNO/y4iZmiNUa1emsRD1aAsuA9z0hTXqAYJ4gx
	ax6xBKFNVuEu98Mo0Nlcj1R3pdcvmybTon6paLA8SMFsT3mxLd90Y87mwM+lsmc2yCvOzKzg5b4
	/4srd+eJ/q9p7ozOaCnEfSHxm1o8E7fno72hdoGPekzBkk2WyiJsjL2w5DHrAgXXTHG5tQPgOjA
	CMB3j+5a/KKafCnfuGDlijbhY1WjO1DkDiCxVxWyD9C76N06FFPxchEItJYmR1JPpN3LcnW98ci
	WOpLfX1v/2CQHvKEeNXvJ/aZjJXYg+dSn6QQo2n+AVU5K5TXCHu22iUcMXi1B3WRLvWz4s7KWNj
	+pkbRF45ojtV1y6Q==
X-Received: by 2002:a17:90b:4486:b0:398:a2ed:7b5c with SMTP id
 98e67ed59e1d1-39aee2842ccmr8983606a91.24.1788375541361; Wed, 02 Sep 2026
 11:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-sockmap-lookup-tcp-leak-v3-0-b998b3d49d07@rbox.co>
In-Reply-To: <20260902-sockmap-lookup-tcp-leak-v3-0-b998b3d49d07@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 2 Sep 2026 11:58:49 -0700
X-Gm-Features: AcwNN1UmGcF2VNT2UTQBCVlO5BUit75iZ8LYXzV1SdkMAusKeGl59FM9vhE-5n8
Message-ID: <CAAVpQUC==6KEBs3XgFjZ536mJ23cbHma8HuiWMu1DRc_=YYOHg@mail.gmail.com>
Subject: Re: [PATCH bpf v3 0/2] bpf: Fix socket leaks around connect(AF_UNSPEC)+listen()
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Joe Stringer <joe@wand.net.nz>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:55=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> This is a follow-up to Sashiko's report[1].
>
> Several BPF socket helpers acquire a socket reference only when
> sk_is_refcounted() =3D=3D true, and release it, independently, by
> re-evaluating sk_is_refcounted() again at the time the release runs. TCP
> connect(AF_UNSPEC)+listen() sets SOCK_RCU_FREE on an established socket.

Due to several bug reports, we are now inclined to forbid the
buggy transformation.
https://lore.kernel.org/netdev/CANn89i+px52TtJy3S9=3DuHxGj3s-WueguRo1Z_4FxO=
=3D02KLmwmQ@mail.gmail.com/


> If that happens while a reference is outstanding, the release side sees
> sk_is_refcounted() =3D=3D false and skips the put; the socket is leaked.
>
> unreferenced object 0xffff88811617ce00 (size 3200):
>   comm "softirq", pid 0, jiffies 4294848512
>   hex dump (first 32 bytes):
>     7f 00 00 01 7f 00 00 01 4d 43 02 f6 00 00 00 00  ........MC......
>     02 00 07 41 00 00 00 00 00 00 00 00 00 00 00 00  ...A............
>   backtrace (crc fb5bd4c8):
>     kmem_cache_alloc_noprof+0x53e/0x640
>     sk_prot_alloc+0x69/0x240
>     sk_clone+0x79/0x1230
>     inet_csk_clone_lock+0x30/0x760
>     tcp_create_openreq_child+0x34/0x2750
>     tcp_v4_syn_recv_sock+0x12e/0x1080
>     tcp_check_req+0x447/0x2310
>     tcp_v4_rcv+0x1026/0x3c90
>     ip_protocol_deliver_rcu+0x93/0x340
>     ip_local_deliver_finish+0x356/0x5c0
>     ip_local_deliver+0x184/0x4a0
>     ip_rcv+0x4f4/0x5b0
>     __netif_receive_skb_one_core+0x153/0x1b0
>     process_backlog+0x28d/0x1190
>     __napi_poll+0xab/0x520
>     net_rx_action+0x3f0/0xca0
>
> [1]: https://lore.kernel.org/bpf/20260701235552.2B0AA1F00A3F@smtp.kernel.=
org/
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v3:
> - Add a fix for TC bpf_sk_assign() (patch #2)
> - Clean up commit messages
> - Non-fixes went to bpf-next: https://lore.kernel.org/bpf/20260813-sockma=
p-lookup-get-ref-v1-0-31f5d55f44ac@rbox.co/
> - Link to v2: https://patch.msgid.link/20260803-sockmap-lookup-tcp-leak-v=
2-0-306e025bfe66@rbox.co
>
> Changes in v2:
> - Defer "Use sock_hold() instead of refcount_inc_not_zero() in lookup" to
>   bpf-next [John]
> - Fix comment style [Sashiko]
> - Link to v1: https://patch.msgid.link/20260723-sockmap-lookup-tcp-leak-v=
1-0-1bbdc58ce514@rbox.co
>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Andrii Nakryiko <andrii@kernel.org>
> To: Eduard Zingerman <eddyz87@gmail.com>
> To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> To: Martin KaFai Lau <martin.lau@linux.dev>
> To: Song Liu <song@kernel.org>
> To: Yonghong Song <yonghong.song@linux.dev>
> To: Jiri Olsa <jolsa@kernel.org>
> To: Emil Tsalapatis <emil@etsalapatis.com>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Stanislav Fomichev <sdf@fomichev.me>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> To: Kuniyuki Iwashima <kuniyu@google.com>
> To: Willem de Bruijn <willemb@google.com>
> To: Jakub Sitnicki <jakub@cloudflare.com>
> To: Jiayuan Chen <jiayuan.chen@linux.dev>
> To: Joe Stringer <joe@wand.net.nz>
> To: Ihor Solodrai <ihor.solodrai@linux.dev>
> To: Pablo Neira Ayuso <pablo@netfilter.org>
> To: Florian Westphal <fw@strlen.de>
> To: Phil Sutter <phil@nwl.cc>
> Cc: bpf@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: netfilter-devel@vger.kernel.org
> Cc: coreteam@netfilter.org
>
> ---
> Michal Luczaj (2):
>       bpf: Unconditionally take socket references in lookup helpers
>       bpf: Fix reference leak in bpf_sk_assign()
>
>  include/net/inet6_hashtables.h |  9 ++++----
>  include/net/inet_hashtables.h  |  9 ++++----
>  include/net/request_sock.h     |  2 +-
>  include/net/sock.h             | 11 ++++++++++
>  net/core/filter.c              | 49 +++++++++++++++++++++++++++++-------=
------
>  net/core/sock_map.c            |  8 ++-----
>  net/netfilter/nf_queue.c       | 18 ++++++++--------
>  7 files changed, 67 insertions(+), 39 deletions(-)
> ---
> base-commit: ce6b9e5dd873de532cd924e2abc928220cdc2738
> change-id: 20260628-sockmap-lookup-tcp-leak-bdaba3e083c5
>
> Best regards,
> --
> Michal Luczaj <mhal@rbox.co>
>
