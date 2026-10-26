Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979506;
	b=FU1FRyMBQaG35X1OW0Q2S0moHOglv4VuQUIYtz/VBaRXYLP8WphJ5TZdAjM22Ow3pNSA
	 RhReiDtmICUTG4PtcIwHF7PPx0KPRhTVB46RWwKn2GL5jTBv9svkmNTZ2w7LgIuEPLXX8
	 Pa6Q8u/4YlJ1Z0AhN/7fra4tQfldRXru50ywYSJ2vFrBdiCr7AJeaejr60aY7uIYRjStv
	 sBwoHp0a/f2ysALlnZpcZwX8FqL02byfnzUCaKwIjNCgEf05/UXDxbJ/2WM5gC+O2uLAu
	 HqoUDz7AtAoXYe77vy8b8O30615pqpGM5miTvtFkayzfLbJkUtxKklcxlcxYeio7mTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
	b=5RY+4/qvm5ifSjW+2rPCdga744s7jykrOzEhFTWWriaied4EYgCEqAQBRDmWzPAWx09T
	 PdDcSvC6PKReNL/gwM1nnbUnjGO5brJYql/4N2y0GopQCHXoKL1pgdRrXuyQyAbYYQjih
	 wqdqNK3zWBWYUjlB6Izr/IbsntOPPRK1Hp8tduCz2pOJpceNYUhr8ETdtNVG9sSzT3AMR
	 jmjSzdG0pBIKrXE9owSx4RxUggQMu76iDvWZatg4gE25MAJHHiJLjIj48Z+8mOS1C0INZ
	 LXMN1zErrf2mgiV8Gcyz3rmYuv17IVVGcC0UUOFQiGC4cKlbg7NFE0eBijAnm8lLF0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpYYbdm4;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95178606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95178606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpYYbdm4
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so1240831a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979505; x=1793584305; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
        b=kpYYbdm4UIaNLa+4gA2O6vViuDhEEOp89PGqsr6EZIpTsN4tT9rOukWJvOxKhiMzeL
         GZsL88QdGFZkEGpbWgmYAFWisgtS4+VmFYBxz5F/QASaNM18840QlkwDndtICLSkDsYT
         +wm+sqLmhdtZ0wQYO/YYpFSkRwbXYA8hTeJsttvMdEb3hJ17KHaxACnHIddAhMAUVsc8
         zMiQZ/e/rOloj5PbH/wf2fzd0LKgnBXs3jpJ0hLVcoXa7yWfqzFCfpgz9PHDRvw+ZpKY
         9dQj8TE8BR25EYre0sIPa9V9z1wBOa6KnuohoN8g3q6QdscMbq/p2/JPiJeBQ9mgjIk+
         1qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979505; x=1793584305;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXt5xvOrWgVG3N+GpdyyPOrA9kPOQI1oYFj+yIA1B0M=;
        b=MKh4qQFshvgDqg1xKq6YuEVLFQstsOrwSo3ftaDTZVYSoDD54dFYE50U/kvdChlDo1
         /GPIe8bwhp0Jtp4y1kUsNbmbB+GvUW1CEJ94nu91SDzAOyg93cgp9L4a7kPI/RxGPt98
         NNvSu4Rh0mG5dvjntv7VUmr/0HNsBLcz1d5QrmrpWVYP+k4ePkw3aJ6359aQbpeF+j0T
         srpwEvAtQRpaOJgI8oLYgxSAg6OcFVvNQ0W8/1Td1LXRwE7H4J10/Sg/FVa8Bbd4Tngs
         4fEmbhb8G2SVb8qsB+Nk0t8yyFPcHHsPj8eRkIjsKpFSQJDL9VY8IU6oWau8tiailV7j
         Wn1w==
X-Forwarded-Encrypted: i=1; AKwUvBxUOIGw2BeGp053f4TDHlkmu/Wu2ezprPcLLWhZpVgIDQkDk4Nes1TYT0FOfP2qbEAgDkIe/pFRLu0ti/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTdlS8AFYz0CQ6LqPI5dY3AbClwkhNaLwpII602TzUuH6kMthZ
	PAEFJU+ij4SxcsO6NSSPus5GTG5JxoCPZK0c+4i9EhmSUzCRlE64wZuZ
X-Gm-Gg: AYBFou3kyFKcQasip2Bv3luBFadcM9H42xBX6dMJfxRPcxKbsagUMe5fSTEsKP+E/I4
	2YBQvSwMqKtRAosCo7yQ2G45BN4yqXXUVVkBLyUC3DVrExoljH5e3yRLFPfoemY5BECnMjG7d/T
	lyj14Kz5MvmtObNuHaVcPFNzfdQpX7ZxyPqs/ehBKxyrkhAt2CPsAcyw1fCy2dNpjaHSPfMoWvM
	liLqTj6zY2u5wCjNiG9kAczdcq1FmrRGY1f+WhAg1VemEKEihm5KEYkkli2aaHY8K21pJNrd2qX
	SDCq1zRiVK6airsX6OhXwK+MBhVRCJ5sC2HSMgond3q0i/3nY+C0CJjtdDwFXn1u/8ksQeG06L7
	XpmJoFF4/0qbZ+vKe7asoEvplp/4fusvUemFLqwyfj3ObHGzHID3eAlFOlAGghbaRXDHJSvpBKI
	imyY1SrTpn7gF1993eqClXb2OJ0vu7Zaiwijss0HHfLmUax6CPFDJdS4kCE4DAOXH9IjGMsxXe5
	x1RYvTQq0uBkdPuTwTfV290vp/65nzDb7OEOiKvf9dTln8zQ5JZmY7xY0pFeHIL+FJBLCLgN8mt
	EB/NHyi3csEaZiYx7kCPmeFY9WlAgzFY0uX/KJh6NuQ/ryqc8mEbLdtPwQggEw==
X-Received: by 2002:a17:90b:17cc:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3ade9b2ff58mr4868899a91.8.1792979504834;
        Sun, 25 Oct 2026 18:51:44 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebac408asm6281205a91.0.2026.10.25.18.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 18:51:44 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 01:51:43 +0000
Message-Id: <DMEE6SW3UE97.2DF11HBEBKYYI@gmail.com>
Cc: "Geliang Tang" <geliang@kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Stop reporting EPIPE on
 zero-length skb redirect
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <kernel@eliskeggs.com>, "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Cong Wang"
 <cong.wang@bytedance.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <20261025-sockmap-bare-fin-v1-1-bb8feae7c4a7@eliskeggs.com>
References: <20261025-sockmap-bare-fin-v1-0-bb8feae7c4a7@eliskeggs.com> <20261025-sockmap-bare-fin-v1-1-bb8feae7c4a7@eliskeggs.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
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

On Sun, Oct 25, 2026 at 04:41 PM Eli Skeggs via B4 Relay <devnull+kernel.eliskeggs.com@kernel.org> wrote:
> On an ingress redirect, the empty message is still queued as before, but
> the target socket no longer reports EPIPE.

That leaves the target broken.
Nothing dequeues the empty sk_msg. __sk_msg_recvmsg() sees
sge->length == 0, returns -EFAULT and leaves it at the head of ingress_msg.
tcp_bpf_recvmsg_parser() finds FIN in is_next_msg_fin(), returns 0 and
does copied_seq++ on a socket that didn't receive any FIN.
So every recv() on the target returns 0 and moves its copied_seq further
past rcv_nxt, and the data redirected from other sockets stays behind
that msg forever.

[...]

> -			if (ret <= 0) {
> +			if (ret < 0 || (!ret && len)) {

Lets skip empty skbs instead. That covers both directions.
The socket's own FIN that goes through the backlog is not queued either,
but SOCK_DONE check in tcp_bpf_recvmsg_parser() returns 0 anyway.

Something like this (compile tested only):

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index df385a5..a5003c7 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -711,7 +711,7 @@ static void sk_psock_backlog(struct work_struct *work)

 		ingress = skb_bpf_ingress(skb);
 		skb_bpf_redirect_clear(skb);
-		do {
+		while (len) {
 			ret = -EIO;
 			if (!sock_flag(psock->sk, SOCK_DEAD))
 				ret = sk_psock_handle_skb(psock, skb, off,
@@ -735,7 +735,7 @@ static void sk_psock_backlog(struct work_struct *work)
 			}
 			off += ret;
 			len -= ret;
-		} while (len);
+		}

 		/* The entire skb sent, clear state */
 		sk_psock_skb_state(psock, state, 0, 0);

pw-bot: cr
