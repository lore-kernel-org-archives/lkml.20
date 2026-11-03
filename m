Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685236;
	b=Fsa+hJodnDsE46E+8FcfrdplvPO7vx0y0vNIa8AUaRzWGPAAMeBv0vho51ed/ryGhYPq
	 XeJ3NiPaVf4aJHmWvlQt+p8FqGgoUIiLh9pj6jsvbgQv9/T5ZHarFuq7T/jgUgzrwxRo2
	 QEfQEeO43V96iu2hFTnxMm6/DY4uD5PTJIIa0BmCKhJ9DMxLx62IvplSe9XkNkv6oy6gX
	 uKQbMJkDDbuUwJxZXetmRKNk2TiZxBGlKBn72RTrrUYYzIHRO1IR/vDCbSeluypyG6nrv
	 2V1mKdEWIOLg/XmB8KzMjb6H3iCXL8TEbJKnMzjg/MS3vzB6j7K5075EA+TAIYN9syw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LQOSfvYjsc0pne7U/QqZbr4f9DH/Fqk28lPhlIhBOEA=;
	b=yu0qOBj4nL3ladRlyiSqAmwcdYG3Eu9AHz+vgYeNP+I2o/WiT9Js2MctRMluPWX0E03x
	 /oGeZHGO7fsPTtHsBOB9t/9n29LK8SQxW/mBNEltVoc1PxjF6fzwFKvqSlBnhYYLQ/6eX
	 xzr6hnnFVgqKaBWngbjOCXPQIas3hRpb7nzhtFkCsDUIwg35LFqZrO374L89EJqX8mbZS
	 VlceSvhFt9F07Pox3pNsmlc8fWXFcAG7mbEYgzvqB2h1HvQX7uyCGTRlAmVDI6m7Ig4eN
	 qefDXHImGg9s7Z2Va3NR2XJEYHVr+HPjwjS7ivQT9q9zscophSJn2HzyLiYwryephAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=StFthbsA;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85DB606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85DB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=StFthbsA
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9572e892dso26981245ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793685235; x=1794290035; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQOSfvYjsc0pne7U/QqZbr4f9DH/Fqk28lPhlIhBOEA=;
        b=StFthbsAOp6jdyLITZCeesv53uxGdx7tmGtLXJFplgrKgU6dRrKMf31aKh5NByS080
         ZOxD6LKwIZiR5Fk42GJDFakkKnrBJZAWMGjtRT2y+xdNvyAUiHjcENxUIk4LM/GrR/1l
         chTPZSNddCb07kj3GMXweJSzTRLUzlQRt6I19JPyha71MOsj3hAnhvMT0yLOKGNSFdRW
         S1mqRoQrXlfpI+3YE+odNwJHwKsb8IwbjujPeAs4Qk+RXB6r/XmUNwBYD9H8dDoUsiDc
         D6tOZ+xc1vtUEIQEuTP3Ap2xUIq9vUAp8iPPcuQeO5YORSsE8Gnfaz4+GZXoE2dn2IuD
         M6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793685235; x=1794290035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQOSfvYjsc0pne7U/QqZbr4f9DH/Fqk28lPhlIhBOEA=;
        b=XOkp42uqgoPmzYKtlluNZvOzdR6eAShHm/ZGhY0aCN083OAsYZnXNd2rUTl0wwxp9m
         qE9NvVMpzbT2bBN3IcyttQ5ejWUtKXao/B/qbjHEC7X8Lr3RoDkelQphknvecLlv4LSs
         3p58egYpXn6IdCoLEmG0E3PT1F+HsqQhdZp6L/GaExZ8Htp7zOaqvR72h6P9r1yiwVK1
         VOMGvOjFMifrf4kHjjK/dtyLzpVWUZfd9RmPuoZ3G1Vs8GalnzGcJWYP1+mAZ6NGRpGJ
         Mg7DLfWmnib7Q8lQ4kvJErkY8wycQu+lTlkinsEZ15b7z1BZ3sSgV6supXCgeBZMJsps
         hvbw==
X-Forwarded-Encrypted: i=1; AKwUvBza6LO9KkzyI8B3iQL0OFGC3S9l01B+kGLxkXgepUCy7gMBJofkbdQOgql1LXn/g8I/QhpIfQ52zCZ69K8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zwHcdU8YlSXqPPwnIjwSR8fR7ZHXVVG5TuWKsZZdkZvGkDrMh
	Q0Bejo51Z3W8B+iUrsRmmpKvMCih0CAxPNm2vHfvnd1lsosweXmWOKj6iK0V6wCXtc9RVHvtKXT
	rDFZ2UA==
X-Received: from plbmv11.prod.google.com ([2002:a17:903:b8b:b0:2e9:4bb7:2719])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1251:b0:2df:9497:3c89
 with SMTP id d9443c01a7336-2eb36526a09mr102814215ad.59.1793685235115; Mon, 02
 Nov 2026 21:53:55 -0800 (PST)
Date: Tue, 3 Nov 2026 05:53:54 +0000
In-Reply-To: <34f32e63b803f9f7faf0b0a5754219e48a986136.1793616950.git.x-professor@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <34f32e63b803f9f7faf0b0a5754219e48a986136.1793616950.git.x-professor@outlook.com>
Message-ID: <aulzHJaoSQOWbw_l@google.com>
Subject: Re: [PATCH net] tcp: free saved_syn after an RCU grace period
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yingjie Wang <x-professor@outlook.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, 02 Nov 2026 10:55:58 +0000, Yingjie Wang wrote:
> tcp_reqsk_record_syn() allocates saved_syn separately from its request
> socket.  bpf_sock_ops_get_syn() can load that pointer while processing a
> retransmitted SYN under RCU.
> 
> There are two ownership transfers which can let another CPU reclaim the
> allocation while such a reader is still using it.
> 
> First, tcp_move_syn() transfers req->saved_syn to a newly created child
> socket.  The child can be closed and tcp_saved_syn_free() can reclaim the
> allocation before a reader of the old request finishes.
> 
> Second, inet_reqsk_clone() shallow-copies request_sock during request
> migration.  The migrated clone becomes the owner after
> reqsk_migrate_reset() clears the old request's pointer, but a reader which
> already loaded the pointer from the old request can still be using it when
> the clone is released.
> 
> Both request and full TCP sockets currently free saved_syn with plain
> kfree().  Embed an rcu_head in struct saved_syn and use kfree_rcu() for
> both teardown paths.

Please add rcu_dereference() in bpf_sock_ops_get_syn()
and RCU_INIT_POINTER() on the writer side.



> This follows commit e3f33b0a1d89 ("ipv4: free
> inet_opt and ireq_opt after an RCU grace period"), which fixed the same
> ownership-transfer pattern for IPv4 options.
> 
> The issue was confirmed with KASAN on v7.3-16007-g36aad21d50d1 using
> temporary kernel instrumentation to widen the reader and request-migration
> window.  KASAN reported a slab-use-after-free read in
> bpf_sock_ops_get_syn(), with the allocation freed by __reqsk_free() from
> reqsk_timer_handler().  The same explicit migration test completed without
> a report with this change.  A patched kernel without the delay
> instrumentation also completed a successful migration and seven saved-SYN
> reads without a KASAN report.
> 
> Full allmodconfig and allyesconfig builds completed with W=1.  Existing
> warnings outside the modified files were made non-fatal with
> KCFLAGS=-Wno-error; the modified files emitted none.

I'd drop this paragraph or move after --- since it does not
add any value after review.

---
pw-bot: cr
