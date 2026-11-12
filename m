Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467112;
	b=FPT95iIe/NU55GG4krPsbp4eGYBpVZTYZPTJl07gZXOOdyfSNr5G/KdZwaRDeKY/JIge
	 LceWTGtu/Cx/RNmxG0VkU+P60RN/n6nIUjALZTpD23cPcBRDGJLiEvpaFJN4e4B9pkeyK
	 q9uenm5OQnikUIiSrOpY2K7aReevgCCUcEl6G+r4syjvi5Lor480BXNbXc7fXDzpwYDBI
	 HOsHYeBYH2yriqIl19fcQwBlKcYHSh+gMxGLm+M3cKoMgJoU1jxeZYteZ7Uw385V0wGjN
	 c2PXFb7K1XN5BPvH5OJfJQmbBmvgtZ0tfinMVJZ86prvnYQI0JnrDAnLutI1A6nhpJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
	b=e2XECpS1PJMi13bYqmiebviVd/QshRkq75Z5XtjgrqvyveJ2+x6KrNA81ZsOHJEXjc/+
	 8Opk/ecXu0jwfMX3+WuLwa8x9IvfBqqY6OU5QR9PMldKDVSHeJAAKPczdJ7keaWVpcqak
	 LzHpb2FyoFEUB3NG8JwdGHSVkLQ+GrclJDvP4H28aGCWEBhPJEwd2jqVtNhs4yJdsgZzp
	 +f3kp7UV8OBSv080aVnqURic+OVhqtGoFSeIqk/qs+7qCNOTstnhIooVA3sGEgI07sKRP
	 e1h27+J+wzokuIwBS5S4IsAM2Dh7ex+hlF74aVqA488AN5gjpLe3fU7K4r8wcePOwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=etsalapatis.com;
	spf=pass smtp.mailfrom=etsalapatis.com;
	dkim=pass header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=ErZn5GOK;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617D5606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 617D5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis.com header.i=@etsalapatis.com header.a=rsa-sha256 header.s=google header.b=ErZn5GOK
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2050877a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis.com; s=google; t=1794467110; x=1795071910; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
        b=ErZn5GOKi0CEkJzCCpPNKT/ryKX64Xp9SX3BkfEIg7z0SqLdvbprdvHg91F9ccANlZ
         b+xQCYd0HJcrW9ksPlHYPcSiH0krExXJ59LCzEA+Kfbl1+HsaPPEwC4yAH9xh2Ieg1r3
         hlhdg2hFAnTYCC9HdMZoF+Qw58W5zni6RvWfHad/ATF+DtvVfurV6i0yCpzV/tZRXlvm
         dEujBKmrfMKJdt9eq4Zmb9aXueL/6L+PB0H+pKR97SVJeglPuQxEGNOzxINdrIfRVYUn
         gmNsaV2z5KhD7/hMp1GoQ+F4FtVLoXkAnzkBITMCQxVyP9V2sJhfslqtsbuf5iFPwrfI
         S+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467110; x=1795071910;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhXIIma0KyYX4XFmWxtnNZ2v8I5eSZ8V5FzW7KusbPo=;
        b=c1FYbk7MOp5JnJWR1ktjA1s/vKhapxe1XJlXkaOHT7IZcjzCQaz4j/J6RQHTh8fjx1
         BQn08A762XF2oVcIdhF5bNeLVxXw+B9gwIUOSc7nRHO087R5nz2cwZ50mkNCeaVeHa3K
         vogmcNghAj4XofA3jMW8hmsv9gFJ9ST3xmDm+6s+OdHLp1a+BMKBzvZ2HWx3GVJ0fzzn
         lebkMZiuO/6m2FKMk56a6E0XW6L+HADZrY1+ouF/Q9Jv4RW1uzH1KjwZfi6xwNbUHqLr
         VScSGAsA5S4Ih63Fnrd9EaRIvwzU/61nTVnrmw73K58DZ8zT+w4SBop3BtYwXlmbgphy
         jd9w==
X-Forwarded-Encrypted: i=1; AL+hErH/kmbxP4yOqZpitQGG2THi7CF+1QoyHmxsPslu4y8SoM5I4p91qlAQvqYYT6Gc7uuy2VDgWHjX+HwJBaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IuAxJSLZHfw0E/YV/vmssSc3brJUveCx2vlhViYrVVt4W98b8
	NEQY3ozKGfclNh6oUIK6WCVgJbmSm7B/QHi7LXlxvYQLR7lTqbKJZhMo6Eic9n0ARz4=
X-Gm-Gg: AYBFou2IRk8D/CD+E2FeUMvCF+pqvFVqHy0f2gVJCyEewmmjO4G2ztc3hudbTBwLvFC
	TNpiJXyh3nPSROlgwtuGD8vRcDG1h9dJ7XaHditL8T+NkzChi1rhXus5AmHna/HTIX/1pq5XtH9
	6+ImZkKamuJjW2pLKJxbdCS/r/k4zxm+l+PBe7mFuP+4KVOi73y1Q/o/5NKw8QYt3Njzk6O7Cmf
	CUU2dzN+e9cSPiKtqfZshMexYXoBnzIGHg0B/xY0KnyKXnhrrR3Ob4onqYA18GCdSpaXW4l+bLf
	nMdVaLzYHCs4o2G19DQ+ZENbVWvnuETOto+DQT/62bDyY7nyYfpqAhE5MJRDA2IPBd4s4T7ltDo
	Wy1/1GtMV5GGGuedceTn2r+FbhwQIMdpXDVzjWCn1Vv5gd8lP0XRHQiAMzMxBZzSkzofMESn+Ur
	dgpur5ueNDNJ5VNpHFg9tGSreUCIGzO6P9r9A8C7q58egy2lqrt2xBMkWeWEUWvgJ6bSswsWn10
	K8FguQ8h4DFb7j7WPbNS0oHFR8kENkm6OHhWeEveskxUsLS+Ie3ccip28Ex0jhRuxwdaB1ioiGV
	q/KUWNVUN0fujCkBVoPFv7mRGxAF0hu2MkfIYgWA0A/Q2k+owl2irWfQPFDfuD6ALXnI5pePkbo
	xHnYHa5LIxXjRCgGIxA==
X-Received: by 2002:a17:90b:4a12:b0:3b0:9fbf:8951 with SMTP id 98e67ed59e1d1-3b182e0346bmr4836706a91.5.1794467110421;
        Wed, 11 Nov 2026 23:05:10 -0800 (PST)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e06833sm29122375ad.68.2026.11.11.23.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 23:05:10 -0800 (PST)
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
Date: Thu, 12 Nov 2026 07:05:07 +0000
Message-Id: <DMT1I0RRNARI.1LTPB6JPWY4E9@etsalapatis.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next v3 0/3] selftests/bpf: libarena: Add
 ordered-walk and lockless-peek support to the rbtree
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Shuah Khan"
 <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0
References: <20261111100951.230730-1-changwoo@igalia.com>
In-Reply-To: <20261111100951.230730-1-changwoo@igalia.com>

On Wed Nov 11, 2026 at 10:09 AM UTC, Changwoo Min wrote:
> A sched_ext scheduler can build a task queue on libarena's rbtree, keyed
> by vtime, in place of a vtime-ordered DSQ. Such a queue needs three thing=
s
> the tree lacks. This series adds them:
>
> - Serve equal keys in insertion order, as vtime-ordered DSQs do (1/3).
> - Add rb_next(), so that a consumer can walk past tasks it cannot run
>   in key order (2/3).
> - Cache the leftmost node and the node count, so that other CPUs can
>   peek at the head and the length without the writer's lock, like
>   scx_bpf_dsq_peek() and scx_bpf_dsq_nr_queued(). Add rb_init() and
>   rb_fini() for a tree embedded in another object (3/3).
>
> Each patch adds selftests, which run with:
>
>   $> ./test_progs -t 'libarena/test_rbtree*'

Hi Changwoo,

feel free to keep my:

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

(though I didn't add them myself to v1's patches 2 and 3,
I assume transcription error?)

>
> Changes in v3:
> - Make the lockless readers static inline. A plain static function in
>   a header fails -Wunused-function under -Werror in a file that does
>   not call it (bot+bpf-ci, 3/3).
>
> Changes in v2:
> - Drop the comment on the insert helper and keep the name
>   rbnode_least_upper_bound() (Emil, 1/3).
> - Move rb_next() before the caching patch and into rbtree.bpf.c with the
>   other traversal functions (Alexei, Emil, 2/3).
> - Hand the head to its successor at the top of rb_node_remove(), before
>   an RB_ALLOC tree frees the node, so that a lockless reader never sees a
>   freed head. This drops the wrapper, was_first and the rename to
>   rbnode_remove() (Alexei, 3/3).
> - Drop the cache line alignment of the lockless fields, which showed no
>   measurable benefit (Alexei, 3/3).
> - Rename the lockless readers to rb_first_lockless(),
>   rb_first_key_lockless() and rb_nr_nodes_lockless(), and document that
>   a caller that dereferences the head must keep the node valid itself
>   (Emil, 3/3).
> - Drop __always_inline from static functions (Emil, 3/3).
> - Add Reviewed-by tags from Alexei and Emil.
> - Rebase on bpf-next.
>
> v2: https://lore.kernel.org/bpf/20261111073416.203153-1-changwoo@igalia.c=
om/
> v1: https://lore.kernel.org/bpf/20261028060046.549097-1-changwoo@igalia.c=
om/
>
> Changwoo Min (3):
>   selftests/bpf: libarena: Order equal rbtree keys FIFO
>   selftests/bpf: libarena: Add rb_next()
>   selftests/bpf: libarena: Cache the rbtree's leftmost node and count
>
>  .../bpf/libarena/include/libarena/rbtree.h    |  57 +++-
>  .../bpf/libarena/selftests/test_rbtree.bpf.c  | 303 ++++++++++++++++++
>  .../selftests/bpf/libarena/src/rbtree.bpf.c   | 120 +++++--
>  3 files changed, 457 insertions(+), 23 deletions(-)
>
>
> base-commit: 0fb18ce8a2e9de830433923cf65838933d615359

