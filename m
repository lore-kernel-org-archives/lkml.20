Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B05A0AAC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173842; cv=none; b=KhrNg8u7ZadsE4C5i4BkftGFeDw54JHIHtKwhqbmst4z4ubMd3AJdsAzhPrMekQEoZU8p7ibP+GzvEWYEr4VQPMP0xbJkmSphlY6g5d7AFnuH89UoivGeDw9OAveYqCI96h4VyKAkpZgUJy2jMlFeSfV41f+yhHPsndrEOItycU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173842; c=relaxed/simple;
	bh=TDtRUka2RWQGGuH82kNBMl/WZIUtp20WDCJMLucQyHs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=TQlBGwDv26Kcq0O6s9aupOGFm6qnReAxmx0G5o0Z9rVbnCjSsHuG5T3w4Th5JUH+ooS2/N9c2tbBK0II61vh9/Ayih4lUq8ZSeBIZfsrU2aR8Sw6DeWwnDByz3SwLpoecaYtIW12fjFhIlE54bEUHrBExyotNhX/69p7WzpdVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uw/P6MRB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uw/P6MRB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso138618b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792173839; x=1792778639; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xqMbJ4Gk4nZuBHQzTxf47FBOrF/dsfB9iNWcpMmGEJQ=;
        b=Uw/P6MRBzDATPtyJEPpmsgl58fgJk65+gaQhd0yxMrXSA2rnvCEZ4cxGlnUW1Wtsxk
         1F/N+OIV7M/zfYZMqYWZkAz0u4sRSHLcpyO5NBNMWvLQYTF7KK8nLdxwDoFwToeVs0d9
         83AcTjNs0zfsX+rtRU1NFgNit/AgaqcmPFHiUqC80p4bt7rdyOaw9+Eszq/pe7sjs64y
         paZi2mGssaXQjvV2+yiNYtgs5L4Z8lNTEsh8yLtUWwoxZek4AcglZGe0Gy3eXXFnvpDz
         +H1PTFaDM2SKZGoB9w2p5TAgJl1Dbt1LY0tr5LUXlxlbcOCeIPp/khMLaRMb+jvLh6zm
         /QHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173839; x=1792778639;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqMbJ4Gk4nZuBHQzTxf47FBOrF/dsfB9iNWcpMmGEJQ=;
        b=eUjkKxIN/h23H87JOFf60UWeNZI46whlAoHwn+NLykCk0I3ZJ2dB0X6b+1FIF00GjU
         yJUhPUiKbFVPx82WA6GB0pZsIoTTLswuO124hCY/FCv+6rkS2Q2ZND6+wSVG+SUmtZIB
         9ZdZO0ws6MyGnr55AiQYC0XqquzTpT5vwbMxX7oKodeg1WOY6mleCBzB7BVe2terClhl
         EUyBesd9LYrwH193mWD7+PIGUDF/Zocn9EpttG7xh7RCOdN85TNSZtw8QR0KS+cyuJsV
         qRWmesM6/p329RBnaw7B0lmH2mGbUbA90S4K4KB/QF86OGfYmlnaARZMfPZfLTdbuH3K
         6Jog==
X-Forwarded-Encrypted: i=1; AKwUvBzvRSZcZPfSfL/P4088Phyf0qQ0q4DVULiwCHM7QuXq+w35GC0Kwir37Pmuqyd1HdI0brGTv9hinqSXApc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl9yAEBwPIXStBdSS8CYs6AsEUBpbnVo1KNRiANOmGfYyZ0UFo
	CwN+NohNn4qWbMgV9ERyV5YAOzNXLciKewtLOV3aPQ94yFSFYvRZUhTt
X-Gm-Gg: AYBFou22DIjuwsVvsJ4QwXEzmR/AL+dcaeErfOnGnWHzToAPFKTysKNq4WzCnQ2L/ZG
	8xOyYfJiByv5e+qQ7q2NR6TOEtTt8WaCU7zWUfXMBPFiywTYHwZG68Q68dTJppLMPb+/BzJJTU1
	4ROdG2G1IJVlucnyouWctAdUy01vF+mqOJVtWrAYufKT3Qpt0bvyZhWVIkBN3ml4lESSfT7byXR
	hxfKe7a3LnQ2Yl9aqlyD/aXCnyRD0JVKPVK+KpF64siPNFXHgrAsDX4zy8PdIkRnuVBwpeKDND3
	+rnr7qdwQSv+vhOwgb40PU4xV6VEmwAEWwT4kZnLAE0k5XeWkGBbR2WsGEvhUUilw0FA1kJqnQP
	m08wv97NB2U3hUmdL31nLm0jADRgXz1dtk/HIrzi1Xnhdi6SyNBLLGmETu4Ukho2mAWFvAO7Y1o
	gIFkEtICtJWU9mRgfYCrpRSBDDk5rIpIFKe/8bF0vR4X74enQINeL4+LQTBd7x2H7lIexV3AxLC
	XM5ehP5YTmHR3UdcJNrJGcLzpId4EjFkzXCc/DNlTOQ/loXNmhC9YOoHRvVm31MhgF/WOGr7qBK
	gyE=
X-Received: by 2002:a05:6a00:18a8:b0:899:3439:c8d5 with SMTP id d2e1a72fcca58-8a04ba37235mr278669b3a.14.1792173838494;
        Fri, 16 Oct 2026 11:03:58 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58208cc3sm1549467b3a.52.2026.10.16.11.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:03:57 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 18:03:57 +0000
Message-Id: <DM6GLQVDXGWL.1ZV7PCL5B2B0K@gmail.com>
Cc: <edumazet@google.com>, <davem@davemloft.net>, <pabeni@redhat.com>,
 <ncardwell@google.com>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <corbet@lwn.net>, <linux-kernel@vger.kernel.org>, <lorenzo@google.com>,
 <maze@google.com>, <sporeba@google.com>, <motomuman@google.com>,
 <madhan.raj@samsung.com>, <srihari.k@samsung.com>, <g.pokhra@samsung.com>,
 <r.kumawat@samsung.com>, <raj.kumars@samsung.com>, <ts413.lee@samsung.com>,
 <ramyashree.s@samsung.com>, <daeil2.hwang@samsung.com>
Subject: Re: [PATCH net-next v7] tcp: add BPF kfuncs to set per-socket ECN
 mode and AccECN option
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Irlanki Sandeep" <irlanki.s@samsung.com>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>, <kuba@kernel.org>
In-Reply-To: <20261016101007.2044546-1-irlanki.s@samsung.com>
References: <CGME20261016100913epcas5p13a41d34ac5d203bff1d220b3d19dee67@epcas5p1.samsung.com> <20261016101007.2044546-1-irlanki.s@samsung.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 03:40 PM Irlanki Sandeep <irlanki.s@samsung.com> wrote:
> To provide granular control, introduce two new BPF kfuncs that can be
> called from sockops programs:

sockops is legacy. New tcp hooks go into bpf_tcp_ops. See
commit 5ac77ae32940 ("bpf: tcp: Support selected sock_ops callbacks as struct_ops")
kfuncs that take bpf_sock_ops_kern cannot be called from there.
It's in bpf-next only, so pls respin on top of bpf-next and
cc Amery, Kuniyuki.

> The ECN mode kfunc is restricted to the CONNECT_CB and LISTEN_CB
> callbacks since the mode is only consulted during connection
> establishment, while the AccECN option kfunc may be called from any

[...]

> inherited by the accepted child sockets. Note that a listener is already
> hashed before the LISTEN_CB callback runs, so connections accepted in that
> window follow the sysctl defaults: for the AccECN option this is transient,

The mode is read once per handshake. No need to store it in tcp_sock.
Ask the prog at the time the sysctl is read, like timeout_init() and
rwnd_init() do. On the passive side the prog gets the listener and
the req, so it can decide per peer or per incoming interface.
One byte in the listener cannot do that.
Then no need for tp->ecn_mode, TCP_ECN_MODE_UNSPEC, tcp_ecn_mode_eff(),
bpf_sock_ops_set_ecn_mode() with its op check, and the LISTEN_CB window
is gone.
With syncookies rsk_listener is NULL and the sysctl is used.
rwnd_init() has the same limitation.
Something like this (compile tested only):

diff --git a/include/net/tcp.h b/include/net/tcp.h
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -2971,6 +2971,12 @@ struct bpf_tcp_ops {
 	 */
 	int (*rwnd_init)(struct sock *sk, struct request_sock *req);
 
+	/* Should return the ECN variant to negotiate in this handshake:
+	 * one of net.ipv4.tcp_ecn values. bpf_get_retval() has the sysctl.
+	 * @req as in timeout_init().
+	 */
+	int (*ecn_init)(struct sock *sk, struct request_sock *req);
+
 	/* Called when an active connection becomes established.
 	 * @skb is the SYNACK that completed the 3WHS, or NULL for a
 	 * TCP_REPAIR socket (tcp_finish_connect() with no skb).
diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
--- a/include/net/tcp_ecn.h
+++ b/include/net/tcp_ecn.h
@@ -32,6 +32,17 @@ enum tcp_accecn_option {
 	TCP_ACCECN_OPTION_PERSIST = 3,
 };
 
+static inline u8 tcp_ecn_init_bpf(struct sock *sk)
+{
+	u8 tcp_ecn = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn);
+	int ret;
+
+	ret = bpf_tcp_ops_call_int(ecn_init, tcp_ecn, sk);
+	if (ret < 0 || ret > TCP_ECN_IN_ACCECN_OUT_NOECN)
+		return tcp_ecn;
+	return ret;
+}
+
 /* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_NEGOTIATION flag */
 static inline void INET_ECN_xmit_ect_1_negotiation(struct sock *sk)
 {
@@ -599,7 +610,7 @@ static inline void tcp_ecn_send_syn(struct sock *sk, struct sk_buff *skb)
 	struct tcp_sock *tp = tcp_sk(sk);
 	bool bpf_needs_ecn = tcp_bpf_ca_needs_ecn(sk);
 	bool use_ecn, use_accecn;
-	u8 tcp_ecn = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn);
+	u8 tcp_ecn = tcp_ecn_init_bpf(sk);
 
 	use_accecn = tcp_ecn == TCP_ECN_IN_ACCECN_OUT_ACCECN ||
 		     tcp_ca_needs_accecn(sk);
diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
--- a/net/ipv4/bpf_tcp_ops.c
+++ b/net/ipv4/bpf_tcp_ops.c
@@ -24,6 +24,14 @@ static int rwnd_init_stub(struct sock *sk, struct request_sock *req__nullable)
 	return ctx->retval;
 }
 
+static int ecn_init_stub(struct sock *sk, struct request_sock *req__nullable)
+{
+	struct bpf_tramp_run_ctx *ctx =
+		container_of(current->bpf_ctx, struct bpf_tramp_run_ctx, run_ctx);
+
+	return ctx->retval;
+}
+
 static void active_established_stub(struct sock *sk, struct sk_buff *skb__nullable)
 {
 }
@@ -87,6 +95,7 @@ static void dequeue_rcvq_stub(struct sock *sk)
 static struct bpf_tcp_ops __bpf_tcp_ops = {
 	.timeout_init = timeout_init_stub,
 	.rwnd_init = rwnd_init_stub,
+	.ecn_init = ecn_init_stub,
 	.active_established = active_established_stub,
 	.passive_established = passive_established_stub,
 	.rto = rto_stub,
@@ -258,7 +267,8 @@ get_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return NULL;
 	case BPF_FUNC_get_retval:
 		if (moff == offsetof(struct bpf_tcp_ops, timeout_init) ||
-		    moff == offsetof(struct bpf_tcp_ops, rwnd_init))
+		    moff == offsetof(struct bpf_tcp_ops, rwnd_init) ||
+		    moff == offsetof(struct bpf_tcp_ops, ecn_init))
 			return &bpf_tcp_ops_get_retval_proto;
 		return NULL;
 	case BPF_FUNC_reserve_hdr_opt:
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -7500,13 +7500,13 @@ static void tcp_ecn_create_request(struct request_sock *req,
 				   const struct dst_entry *dst)
 {
 	const struct tcphdr *th = tcp_hdr(skb);
-	const struct net *net = sock_net(listen_sk);
+	u8 tcp_ecn = tcp_ecn_init_bpf((struct sock *)req);
 	bool th_ecn = th->ece && th->cwr;
 	bool ect, ecn_ok;
 	u32 ecn_ok_dst;
 
 	if (tcp_accecn_syn_requested(th) &&
-	    (READ_ONCE(net->ipv4.sysctl_tcp_ecn) >= 3 ||
+	    (tcp_ecn >= 3 ||
 	     tcp_ca_needs_accecn(listen_sk))) {
 		inet_rsk(req)->ecn_ok = 1;
 		tcp_rsk(req)->accecn_ok = 1;
@@ -7520,7 +7520,7 @@ static void tcp_ecn_create_request(struct request_sock *req,
 
 	ect = !INET_ECN_is_not_ect(TCP_SKB_CB(skb)->ip_dsfield);
 	ecn_ok_dst = dst_feature(dst, DST_FEATURE_ECN_MASK);
-	ecn_ok = READ_ONCE(net->ipv4.sysctl_tcp_ecn) || ecn_ok_dst;
+	ecn_ok = tcp_ecn || ecn_ok_dst;
 
 	if (((!ect || th->res1 || th->ae) && ecn_ok) ||
 	    tcp_ca_needs_ecn(listen_sk) ||

[...]


The commit log says that the problem is in the path, and in v4 Jakub
said "This is a routing property".
RFC3168 ECN has a per-route knob for that: RTAX_FEATURE_ECN.
usec TS got RTAX_FEATURE_TCP_USEC_TS.
Your reply to Eric in that thread had a per-app reason too: AccECN for
latency sensitive apps and not for bulk traffic.
Make it clear in the commit log if this is must-have part of design.

I'm not saying that this bpf ops should be the way to go.
If it's only the path, one more route feature bit
might be all that Android needs.

pw-bot: cr
