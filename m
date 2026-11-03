Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672958;
	b=Tw+T2P1I872LMHX117d2qVYbDyt9u/4p/i5zfwnRpXrkB3E50dmRSQNWYSWq3m1CAueZ
	 K54T4M7rTMTJaLyMLsFzr0EJCJq352Tb8BwJf5chsEOutZDUVU8rDwfp5ZIcjCz09bJuA
	 Xopr+g7EnS/wpfqMdYL82E7W8R8VW/wHtDxR7VAytsswsB6eqERqA6fdyxKlGYZf43nuV
	 6E6ayX42Hgnru+62gLtszL1lhx7L0/npR2netg34qcyvlGGMSjJQOBBXi3bgx8cS8m9ti
	 AUKZrOMc+Z3dXtW32HAGBfwW5digANcuyKhh0xXfD67TpkZa9RUaSRp+eeuogVLc1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=wtbcAf+FvF7jZzxG9NsxCkDjvCktPNS2WNMlwIbxlfE=;
	b=5nn2s9vMbMH+cDGvbJUjfw3dw5Arf0HyS19Mv6OuJ/OxSp5yQwx4CqSElQQZB2zPGa4W
	 bUf/FvQUqyh/aHfwlH5Xs6CufSzVfEAlbzJIhGUAY93+WQRiA74sCM69LK6sweYod0+Ze
	 gafhfGdZtprQJCdkbtHcHX/TxHZLoXAiVcx0icxCt7kqk0QC8IRlowmpt3QJWYrKmJySw
	 zT0HHKfUshh0xoziGtZxcytKqRt956+zF7L/4kcz4RCeR8KiXDL2R73F+w0hUeBB3NncH
	 pYUJHX/XZZBlcOSR88BK1XAZVEYBpKEgH+cMm9qBzMbstbNntjw096gLOaHXtPb2RzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2I15M6O;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DBC606D81B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DBC606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y2I15M6O
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1328418a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672958; x=1794277758; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtbcAf+FvF7jZzxG9NsxCkDjvCktPNS2WNMlwIbxlfE=;
        b=Y2I15M6OyDBLSoN8WATS31mUd6nyZPFVERxf358zB7YnidBVggy+IXT+DHJw4FG5qk
         rcJIfII6a1/ECPXXCWHmre5PUmdH2+Gn3pp7wRDPaHVB6dd0hkE2Mi2S4tQTxjqWDyqD
         qBkbsMwgfrcZiYhvNWQBtfmo6F2s+ZILjKt1Dzv+xRe3ftQ4DJZ2MlhVHuloHeVLKI+S
         uGUXtYKrItyHbCzA81rAP6QHPk2R8EM4IrO+I5huFcB2dRvEeWM46RZOi7YSwD6w9Bjp
         fgybX27UA5yoWMhQOKSLt3OXck8fwBaEFJehH4E/sANoPtjRxhH7N8KBKPDVJdG78qkx
         7plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672958; x=1794277758;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtbcAf+FvF7jZzxG9NsxCkDjvCktPNS2WNMlwIbxlfE=;
        b=RBP87Jzo75V5hssVu0vGlb5jJOQndXk6d72vQ+k0HDmjNhgTrr7+7UTaYFTbucNqwn
         5SYH/aVm72FmG/sbfVheZoMLtZpKQjaqUPNnCTBv0DsA4WJb8UkxdUFhiG/JgvetNXz2
         mLvkVslcSc8d4JUC3DA4oLBczvasfNggH9JlTJjSPL57AqyO/y6Z5yW24n3I+M7sU6Io
         W8/743Hozmz/EOtcnF2SslzAyqi1cy3flitcFe0lJbdfiEholJyIItkkNCbtqzFQ04wL
         uhJHxCN2NZAl8XHYeo5wLXqxMgGbv21nZ+0ZlT5jxm9VbD9I6MQo9gO0rIoU1WWVqh7v
         YTYg==
X-Forwarded-Encrypted: i=1; AKwUvByXTesKnI43/kf64qpUoS1gQNwR0hDJu6LXru4Z4RQmuAxqPvW/GgWmvruMw38Ke9Sk1lS6zCKZY1lqLZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P0ofE6J4gSkoSw/wYajFjoyZye5JE2jj3FyxiYhNRgryA4fZf
	mBx2h0R+VHqXV6pyhr8T1z+UCB/S6T269sGq/50tRqxhqc3MXjwj4EGE
X-Gm-Gg: AYBFou1Oko0dSxxWQPNo8iiOeMmZN5BCDKXvpeA/PIyAnjQMdAUY4Ts1RVYPtupqwDz
	9c3m0wkP3uxmXDWkUVAsZU0+mJSxYAgCHHC5Z8+kQRfRaQcwk1JHBasbRUet5L7ExsFbLHrqBOL
	TDDn7P8BFZcf8exmdMxmxAtqoAbXAE8Z7MdT8vczo9hYqCMsIZuvmAa+pJJ2pBgTYpaMNlFINSP
	qGq11XjYXqs91DlryDOd7pSU7UqOPDtaqO0j6dardfxiZ0umZ3Mn6vkXd3mYzMDIYqczAMWgEtC
	6pH6SbRRV39s9N1mrzrr1TnmsXDc5RBMXXur9i/ePqD8XypWvj5BeiumXgDayJMhIctKSLRF8LV
	nQ17hJWnNrrfbhBkH7RrGFx/qJu38XTOjQKar1kfiUkUKepizNuHc3XPpYt7B3raGCRMf+Mxb8w
	haRux+KvIBReFKhyGk+u2XT/jdN3ieFGJVzEixCa0Qg7N+YoL4COBs6N35smgWBjdtnvKaeBRLj
	rXflPEcyLoYhhrpxPdrVxn5kpUOX2V6QpRwB7oZY8lhZrshJghSJdh3wkHVvzmOdElGGarKJeuo
	AQkRn+jckwQh8iMGXUr4lPQ/YI2/lRTEHxxGZqVW8j3dx/TSDBoi8HEndGu6b/KJDp5jS3PT3ks
	ApNgwoteOM+TEHeZ/3doYAXWYe0DG+QBZ8wY=
X-Received: by 2002:a17:90b:4c08:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae8957cfe2mr10200746a91.6.1793672957556;
        Mon, 02 Nov 2026 18:29:17 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c72eecasm1705351a91.17.2026.11.02.18.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:29:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 02:29:16 +0000
Message-Id: <DML7ZWOLYTYS.2BQ9L223JO46Z@gmail.com>
Subject: Re: [PATCH bpf] bpf, lsm: Fix cgroup shim selection for socket
 hooks
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrea Parri" <parri.andrea@gmail.com>, <kpsingh@kernel.org>,
 <matt@bobrowski.net>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <sdf@fomichev.me>, <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261102152913.366237-1-parri.andrea@gmail.com>
References: <20261102152913.366237-1-parri.andrea@gmail.com>
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

On Mon, Nov 02, 2026 at 07:29 AM Andrea Parri <parri.andrea@gmail.com> wrote:
> Fixes: 69fd337a975c ("bpf: per-cgroup lsm flavor")
> Cc: stable@vger.kernel.org

Drop it and target bpf-next.

> +	sk = sock ? sock->sk : NULL;
> +	/* NULL from ip_cmsg_recv_security(), no sk yet in sock_create_lite() */
> +	if (unlikely(!sk))
> +		return __cgroup_bpf_run_lsm_current(ctx, insn);

With this hunk one hook uses the cgroup of the socket or the current
cgroup. It depends on the caller.
bpf_lsm_current_hooks is for such hooks. Add the two hooks there.
In __sock_create() the current task allocates the sk. So
socket_post_create gets the same cgroup both ways.
Then there is no need to touch cgroup.c.

Something like this (compile tested only):

diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index f58dce8..485e8fe 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -66,6 +66,10 @@ BTF_SET_START(bpf_lsm_current_hooks)
 #ifdef CONFIG_SECURITY_NETWORK
 BTF_ID(func, bpf_lsm_sk_alloc_security)
 BTF_ID(func, bpf_lsm_sk_free_security)
+/* sock->sk is NULL in sock_create_lite() */
+BTF_ID(func, bpf_lsm_socket_post_create)
+/* sock is NULL in ip_cmsg_recv_security() */
+BTF_ID(func, bpf_lsm_socket_getpeersec_dgram)
 #endif
 BTF_SET_END(bpf_lsm_current_hooks)

@@ -95,6 +99,7 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,
 			     bpf_func_t *bpf_func)
 {
 	const struct btf_param *args __maybe_unused;
+	u32 id __maybe_unused = 0;

 	if (btf_type_vlen(prog->aux->attach_func_proto) < 1 ||
 	    btf_id_set_contains(&bpf_lsm_current_hooks,
@@ -105,10 +110,12 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog,

 #ifdef CONFIG_NET
 	args = btf_params(prog->aux->attach_func_proto);
+	/* args[0].type is the id of the pointer. btf_sock_ids[] has structs. */
+	btf_type_resolve_ptr(prog->aux->attach_btf, args[0].type, &id);

-	if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
+	if (id == btf_sock_ids[BTF_SOCK_TYPE_SOCKET])
 		*bpf_func = __cgroup_bpf_run_lsm_socket;
-	else if (args[0].type == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
+	else if (id == btf_sock_ids[BTF_SOCK_TYPE_SOCK])
 		*bpf_func = __cgroup_bpf_run_lsm_sock;
 	else
 #endif

pw-bot: cr
