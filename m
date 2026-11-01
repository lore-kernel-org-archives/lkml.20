Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494990;
	b=mALT49X3VFvRw2G2DdXksS2KAXqI7bEX/xRrJArD8kclgZmvlfmYCU46C0c7qqPM/6xv
	 2kKBI6kT+/jwvuO8KCx3Y0WZRuk2CNNPKtZwnPwuf3wwDhe+SEGq/Q/7AUG91ljdcjJ+y
	 y4q3vmusdSDa9SeUaTC0KL6/8e0vVIXXqASQQa0IqX3OBrlBgo+PFL/uE27OEzUhhX1sn
	 tspxlpc3iZyaN/kBkfvW7HICn56tJoriUGwuiYW3qY7mAYCztCgZUEOZB3u5hn5NrWbni
	 cQeohypBa6p1yghe/wqIiFW0XKFcAMClfpO/LiaaxwOmSBPjc+W83IWSbUnwATtXC1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
	b=tarzAtRoJ04Mg5exYPtNxiQteLk23QJePD1QwgWhOGMw1WgeHmivqjmw69ZbgZ0WIoN5
	 quZdtI3bNckf8ir5lye5la+BPocA140i6Iq+xV4j49v4kakddV8AHZ3616UDX7mnrms5y
	 YtsSRytGyK9twwk5eoQtf8itfbMFR4cjOplTMVQkjRh38ygk/5u18dv0nuW/kPIM99B+o
	 ehMdUe6N2472ueVh42ngvrBVOceJB0LPyTtJqGvTK+hO5VbGaPFtruZ6P2MLyKYOLie4W
	 +W/4s/QYFYp+oPvvjO6InvSfYNDde2tMch5szU9/6jETGYhcQd4x5nGi+Ee+POUYzrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e80VcSTP;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888E606A31E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1888E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e80VcSTP
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso621157a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793494989; x=1794099789; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
        b=e80VcSTPEtt+Rqb+MVQ7zyTHE1DjqfAfg4HaJ1qxZqT47NXqiL0RJkcrMzTz7Jgw2q
         BNgkv1CdagEzyEPK9CqJ3ElM6tP4DsQGcuQN9c5U+5/rElou5PiS0yMPgA+csE0rLTrS
         RRf7Lj6ZW3STr8rwnVdX0snKtXHEC6K260p8EhcOijSK5hOLpVkfSJjm98tpv5UtgdF6
         u7oIy2ErClch2aW+dXVQrAan3ZSNhGsO/4iU9QU944mQr38Kgktm8k/X0n51TyeQXjWN
         iIuJJ2uHNYdOT4SC6ODalg6slpVi5JFxDnEfmx7LtADgEaHhLxR6TWzXfJP4/RPxbg9R
         rkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793494989; x=1794099789;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/U+dm6O7ibLuqp1u5mfZ05KhbMMiFWjnF5fZVcet2uE=;
        b=J8TNetIwfloKUcrovbxq+8C2j7p0ZqXYP9wtPln852u/cssYO3xVDM4OKPf3dN2g50
         OFh24oBANg5wDW5ZjLs/l6+dQH62jGn8durOHThkjH4YBbkb+ypyw5UbmW2ddXErJTaI
         ri5KsKiudEZ4ED4Jl5orgAU7XqRDJFh4Okph2HajXGlXWHKcbDUgDdwvp5Zy+UCU80ua
         zVQoouZvCQM4XC2xs0gAgGEjtIC5eYCe7x+HJRRTFtSjyQxlnrqmM7Px1gZJD/63TJOA
         dnVEHXtfxzROy3l4acDsE5jCTuGXRDKZu8QE/RD38UOiLTZnYvROPC7ER3TrzDe+zkdp
         n7og==
X-Forwarded-Encrypted: i=1; AKwUvBxDPkQ7bGcIYmBpqxv+g4CwS15y/aeKan3efDXtbIVzRr3f36WeP0hNdltFYj32C1ucPt9tJamOBNS3iyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hqKFTrLPR4H/x981EbfMdYd/uFRTWoAeqtYKZJeYY/1yLiJr3
	qGz9DqjCWgOzy2NJAdrdQqAe+H/4DcMRvONR3heh1wrcs8R9b7eU+INt
X-Gm-Gg: AYBFou1Havie1zeFvA+piaRaPSCMI4I/fVLiQaJmHx+BpccfOgyBkeMNRp6RMBGz2Na
	9YGLbjVMWi3UC3KJ53YnLkW+k+kw5fpBQRpuPPknzvANs4eeo2g01Gi3eC/MObeVPtgHJJVAXQe
	6yRSvJbioaSYUYjKx0uVkpSardievWpdZD6DcXItq8irll5w51b1sz9SudwIxUMslBRQx5wdfe2
	MzM50PResZYMsbGN4M+w303LcwdYjwsjtl/JZWhkh9+vzl+P2L3rmPX+2sUbFrgqxe5oKE5OGYl
	7i7fN/l9LVbWkBHfGp9WF4LuSHgdvgnoQa2+yfSTLPljnRxPCDtzCzegpl1ypaUIcN1nKJQFYyU
	ME7YMLip29BkymNmqIzgUoq9vt3Afa2z6PZ70nrVM2h8kCXgYJJmuqabg4huLRW8odW92Oqv+UF
	iOOhGik0RY7dG9hRyGJj6hJFUC8iZM+kcJCG8/8OVfEvfBB3RKSv3HaBmjRLoc4xJPSk02TejAR
	HvfKOWIIKmUEgGu5vvqAN7thLV2hDOwT4mFIRSU8LukFMnklVnZH+JeNWsCwsIdnEyPfbvoVUCX
	pvNfdDSxcpFqeIbPLqehMSMPUgDwt7TjrKqBn4EWbI/+8k3Jojnh9YJ/kOaPLiV9+K/dKUDARc0
	u0m8fWBhjA8sWoXpZdsFjuTiFXO22sERCs7/VFaGrWDiPPZyTaj0WkvY=
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr5688613a91.29.1793494989295;
        Sat, 31 Oct 2026 18:03:09 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98afe3sm13151497a91.12.2026.10.31.18.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:03:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:03:08 +0000
Message-Id: <DMJGWV96Y5SV.33OTYFHFZQ1WT@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>, <david.dai@linux.dev>, "Gavin
 Guo" <gavinguo@igalia.com>, <bpf@vger.kernel.org>,
 <sched-ext@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: libarena: Cache the
 rbtree's leftmost node and count
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Changwoo Min" <changwoo@igalia.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Shuah Khan" <shuah@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
In-Reply-To: <20261028060046.549097-3-changwoo@igalia.com>
References: <20261028060046.549097-1-changwoo@igalia.com> <20261028060046.549097-3-changwoo@igalia.com>
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

On Tue, Oct 27, 2026 at 11:00 PM Changwoo Min <changwoo@igalia.com> wrote:
>  struct rbtree {
> +	/* Writer fields, on a cache line of their own. */
>  	struct rbnode __arena *root;
>  	enum rbtree_alloc alloc;
>  	enum rbtree_insert_mode insert;
> +
> +	/*
> +	 * The leftmost node and the node count on their own cache line.
> +	 * The writer keeps them current, and readers may read them without
> +	 * the writer's lock (see rb_first() and friends).
> +	 */
> +	struct {
> +		struct rbnode __arena *first;
> +		uint64_t nr;
> +	} __attribute__((aligned(RB_CACHELINE_SIZE)));
>  };

That's 16 -> 128 bytes.
Without perf numbers it's a premature optimization.

> +	ret = rbnode_remove(rbtree, node);
> +	if (ret)
> +		return ret;
> +
> +	if (was_first)
> +		rb_set_first(rbtree, next);

In an RB_ALLOC tree rbnode_remove() frees the node and then rebalances
the tree. first points to the freed node all that time:

  CPU 0, holds the lock            CPU 1, no lock
  rb_pop()
    rb_node_remove()
      rbnode_remove()
        rb_node_free(node)
                                   rb_first_key()
                                     first = rbtree->first
                                     first->key    <- use after free
        rebalance
      rb_set_first(next)

buddy_free() poisons the node. A prog built with ASAN gets a report from
rb_first_key().

rb_erase_cached() moves rb_leftmost before rb_erase().
Should it be the same here?
Move rb_next() from patch 3 in front of this patch. Then at the top of
rb_node_remove():

  if (rbtree->first == node)
          rb_set_first(rbtree, rb_next(node));
  WRITE_ONCE(rbtree->nr, rbtree->nr - 1);

and no need for the wrapper, was_first and the rename to rbnode_remove().

Patch 1 looks good.

pw-bot: cr
