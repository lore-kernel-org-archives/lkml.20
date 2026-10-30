Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370338;
	b=sXHiLzdu+eWY49AD6+pyUmNQN3ubscXO4pim9cD7IRTxABEcqVjjpWeyqFaUU/+Z0yB0
	 i6LMejfg2SOjBskBM2yb0p/O73qO9ns/5vP+zfw6Ca+dPlQ9PRqd6NZaviOiXjESWuuaB
	 wlgn9yXkJf4T0STLoBteB0I5j88JhCLDT0N+9PfVdPNuHMhp5Nq7ff2N6bhAvLXiG/mRv
	 Ai8BVMd1/3vof/D80FIrBkCUaYsexF2zQ8jxBeIb9PRsRHpTQGMGvlOxBBM2Uudp+05sp
	 teZWzdfX1bHRYSbVCp6XS38nyjB9T13OXLtZDhjOSZxZ78STIWkj7j4jz7ci1nUnu+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370338;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aLnPtHK687FMiRhGf2fkDTjbZs7yseTcdHjFjaHWPdw=;
	b=fL+rybAHO/7a9xCDnevUG2CeNCFihKSykl851ck161FyXEVQYC75bXQPTsupwxBZ15CT
	 FsupMra/kG9IrZLZ87y8LkltgciK7nGELaF+vTbdENGTofHe/lEF+mn9a+aEkDimctxSc
	 xN0B5UIYXi3ltmDatUwveRYgXWsZ5jxZkFE1R+wRQqc6/8ZK+/4n40ZRtmQsforJUNx24
	 bO6HzpFHUds8wJimcb0633jqhO+g0+mNtbZR/VTH2rcnntJ/WjES2OWujQfo91tnDzMMu
	 Io4om1N/LoykrPFp55f6oJbSgB4RFDAwTS77DZXKaIiksABrRTuxpcM6nfpM3ClpELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JzYW0hoY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NEns6uPc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JzYW0hoY;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NEns6uPc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793370337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aLnPtHK687FMiRhGf2fkDTjbZs7yseTcdHjFjaHWPdw=;
	b=JzYW0hoYfGbUsXkfhbYLFQQ81WLE0ZIHS46hGeV7vozhHFaB+JyMBMq4yMhW/hHTFOxhOE
	V+t4NKr+X3Oy736pURNhuqPd6yt9X1JySm5mkGLg8UTfg5U1eym0XkyEq4Tvcee+jvCsjC
	Vj7ZZJfdxR/B/nW3jZXutBVDql8CzVo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-5P5ISA06OaKz6tfHFOiGlA-1; Fri, 30 Oct 2026 10:25:36 -0400
X-MC-Unique: 5P5ISA06OaKz6tfHFOiGlA-1
X-Mimecast-MFC-AGG-ID: 5P5ISA06OaKz6tfHFOiGlA_1793370335
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so7304325e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793370335; x=1793975135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLnPtHK687FMiRhGf2fkDTjbZs7yseTcdHjFjaHWPdw=;
        b=NEns6uPcO+4nHjZNwYtz5RcKFQaj9EIcjw1iOSYafkmlUP85BWoR42KiPmQuNcYYAM
         9DdKZ/somvAYLtHoEvIqQ2yVAxqNVN7UNQzUK0HDgQ4jjbxu8w+ndvGvPXhl8t9to0Rk
         xoXpZWrG27B4B0Sz9n2BhfDhV8tmyI47PAwVX6UN6H5pJ9tsNTDGhl76wcVhDpG8aPjZ
         JOISxMSQl6rTy1GRQPXBDODJTgCUd4QzWwsTjKVOJswS1NZRk25v9v1OVkAQ8pfTOERW
         qdbYmW2dkripMv88KWtcJux6oHEQH0G8xiPzIUVOCOAZLhcHEjxkVJPZ72pZQT/FywuI
         ByaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370335; x=1793975135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLnPtHK687FMiRhGf2fkDTjbZs7yseTcdHjFjaHWPdw=;
        b=ix7hc003nIWT0sZbeb8WxNM2dBlPpYgY/ijDm8punzS68cw77RFtCm5PHDONY2vjqJ
         laMgoe5AigelihIyYwiPTpo8CtfU7KZrRunkOw351kaMIBag7sEvrQHjJToTcDRcahxi
         C2oCkdrEhR/scBJyfGm0TauC3+vUVj5HzmMwVg3OU+AMKZfB7e8tcEJxVsWcqjMhTj8J
         vesI4yW+FLG1owCUhR2Lyg8UGLdJizpJvGxK1XFGCFJguoHPODHAMnV+HhCURqZQ6PeU
         DbUNgyN6hPFzosszSJGuwjAKGGaP/4dwZrhvKbmEGCo/Wah/sGLN7RRZMiexgnXxI4Fl
         OWmA==
X-Forwarded-Encrypted: i=1; AKwUvBzSqqk7nzqIroJvwBQZ/OGI8UdphXno1gX8WBNCcOa0p+Us2qQ2AZLDh7nWI0pK3Y8lhyP8vl7cR4kLPww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm91idU+xItEAThMo2xjZHBq//S7pZqLe5P0v0JNLgaPVNxpmD
	z8yjho7aopGGjHPfW/B2hZboVy6O+Yi00YN+kWDaQ2kJqeakC5Oko/bz7LzRWcHj95Knh8fyTqk
	hJRrRYXM1Bu5MqD89PJ6pRVcfDU3Cp2zeFDthOzZhAVNvo1+O4U8+ZjvJqX3xZN+s/g==
X-Gm-Gg: AYBFou2UZs3M1RIv9j1xqXXFuD1YU/uOy9ijBXLfUEbW+3crQ/60N38CUQtlRNCUxoS
	vw7yvBixwthg56jgGm5mJ96har/lh6ORg8Y3nUqUf4Ecav3MhcG/m5zKYWxdks3yLpdKTx8+H3Y
	NXx9N/k5pSIdN9iq5I/trIGoksfmDidhdM9F2SRkAtCCUfTvYlvqfrcnTDhomTX89nvcZtTLthi
	h7k0hlGz6mPgCO5A7OFqvABT7M2iOkhWki8NeVKQLsGRdZJW76C8tihBGzaMW1WVLE3RxzMBDcp
	NvSYJWDOMKXnmhBrxBZqFxIPaqE2MKUSYV583vsI8ZgJo4rDjzixxUV3BYRDXwQuOgSRzXBILW4
	QXb2zyrppWPlMR7FZX+2+PGyo+VelRsGpM4CY1FYwcXVd6/kMg4KdsI4ipBO4toJAudLLAiCU2+
	9XMurwwjvphqz4eC8=
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4ac17e10ac3mr56533735e9.19.1793370334630;
        Fri, 30 Oct 2026 07:25:34 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4ac17e10ac3mr56533065e9.19.1793370334072;
        Fri, 30 Oct 2026 07:25:34 -0700 (PDT)
Received: from sgarzare-redhat (ip190-139-192-82.pool-bba.aruba.it. [82.192.139.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1076sm67431295e9.6.2026.10.30.07.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:25:32 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:25:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: jrmmhm.kernel@eldare.de
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michal Luczaj <mhal@rbox.co>, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] vsock/bpf: fix zero-length, MSG_OOB and
 MSG_ERRQUEUE reads in recvmsg
Message-ID: <auSngVsWiGI475J4@sgarzare-redhat>
References: <20261028-kbh3-1-022-fix-v2-v3-0-bc0752b2d3db@eldare.de>
 <20261028-kbh3-1-022-fix-v2-v3-2-bc0752b2d3db@eldare.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261028-kbh3-1-022-fix-v2-v3-2-bc0752b2d3db@eldare.de>

On Wed, Oct 28, 2026 at 06:55:41PM +0100, Jerome Mohm via B4 Relay wrote:
>From: Jerome Mohm <jrmmhm.kernel@eldare.de>
>
>vsock_bpf_recvmsg() sends every read that cannot be served from the
>transport's own queue through sk_msg_recvmsg() and its wait loop. Three
>kinds of read do not fit that path:
>
> - len == 0: with data queued in the psock ingress queue (for example
>   after an SK_PASS verdict), sk_msg_recvmsg() copies nothing and
>   returns 0, and the wait reports data ready at once, so the loop spins
>   with lock_sock() held. The vsock delivery worker then blocks on the
>   same lock and all rx on the transport stops (hung-task).
>   tcp_bpf, udp_bpf and unix_bpf return 0 early, and
>   __vsock_connectible_recvmsg() handles len == 0 too.
>
> - MSG_ERRQUEUE: the read only reaches sock_recv_errqueue() when the
>   native fallback happens to be taken. With empty queues a blocking
>   recvmsg(MSG_ERRQUEUE) waits for stream data instead of returning
>   -EAGAIN for an empty error queue. Route it to the native path first,
>   as tcp_bpf does, so it is also not caught by the len == 0 check.
>
> - MSG_OOB: vsock has no out-of-band data and the native path returns
>   -EOPNOTSUPP, but sk_msg_recvmsg() ignores the flag and consumes
>   ordinary stream bytes; with empty queues the read waits for data.
>   Reject it right after the MSG_ERRQUEUE route and, as
>   unix_bpf_recvmsg() does, before the len == 0 check.
>
>The len == 0 and MSG_OOB cases were reported by the netdev Sashiko AI
>review of earlier, single-patch versions of this fix; the MSG_ERRQUEUE
>case was found with the help of an LLM coding assistant (Anthropic's
>Claude). Each reproducer is a C program run as root in the guest: it
>adds one end of a vsock-loopback stream connection to a BPF sockmap
>(CAP_BPF and CAP_NET_ADMIN), for the queued-byte cases with an SK_PASS
>stream-verdict program, and issues the reads below. No kernel change or
>error injection is needed. The reproducers are available on request.
>
>Testing: on a private VM with a KASAN + lockdep kernel on net, with
>reproducers over vsock-loopback. Before this patch: recv(fd, buf, 0, 0)
>with a byte in the psock ingress queue spins and the delivery worker
>hangs (hung-task); a zero-length recvmsg(MSG_ERRQUEUE) blocks; and
>recv() with MSG_OOB waits for data or returns a queued ordinary byte,
>which a following plain recv() then misses. After: a zero-length recv()
>returns 0 and the next recv() returns the byte; MSG_ERRQUEUE returns
>-EAGAIN from the empty error queue; MSG_OOB returns -EOPNOTSUPP at once
>and consumes nothing. With both patches of this series applied, the
>three single-VM tests of tools/testing/selftests/vsock/vmtest.sh
>(vm_server_host_client, vm_client_host_server, vm_loopback; 44
>vsock_test cases each) pass, as on net; on both kernels the host-side
>runs skip the SO_INQ cases (SO_INQ not supported by the host kernel).
>The ns_* tests of vmtest.sh were not run (they need root on the host).
>The BPF test_progs sockmap_basic, sockmap_listen and sockmap_redir tests
>pass (767 of 767 subtests, among them the three vsock subtests of
>sockmap_basic and the 240 AF_VSOCK cases of sockmap_redir).

Ditto.

>
>Fixes: 634f1a7110b4 ("vsock: support sockmap")
>Cc: stable@vger.kernel.org
>Signed-off-by: Jerome Mohm <jrmmhm.kernel@eldare.de>
>---
> net/vmw_vsock/vsock_bpf.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/net/vmw_vsock/vsock_bpf.c b/net/vmw_vsock/vsock_bpf.c
>index 5120911b8143..3edc01268c42 100644
>--- a/net/vmw_vsock/vsock_bpf.c
>+++ b/net/vmw_vsock/vsock_bpf.c
>@@ -111,6 +111,15 @@ static int vsock_bpf_recvmsg(struct sock *sk, struct msghdr *msg,
> 	struct vsock_sock *vsk;
> 	int copied;
>
>+	if (unlikely(flags & MSG_ERRQUEUE))
>+		return __vsock_recvmsg(sk, msg, len, flags);

If the psock ingress queue is not empty, wouldn't recvmsg(MSG_ERRQUEUE) 
(e.g. a MSG_ZEROCOPY user reading completions) also consume stream bytes 
through sk_msg_recvmsg(), since it only looks at MSG_PEEK? If so, maybe 
worth mentioning in the commit message.

>+
>+	if (flags & MSG_OOB)
>+		return -EOPNOTSUPP;
>+
>+	if (!len)
>+		return 0;
>+

Is the order of the checks important? We should mention it in the commit 
description (if it's important or not and why).

Thanks,
Stefano

> 	psock = sk_psock_get(sk);
> 	if (unlikely(!psock))
> 		return __vsock_recvmsg(sk, msg, len, flags);
>
>-- 
>2.56.0
>
>

