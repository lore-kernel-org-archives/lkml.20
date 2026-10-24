Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817106;
	b=iDbH9IsccvFkhnxGIh1tKJgXHrLIN2MVaPHyw0a70a6PRI+ln3JLKQVSKapM0DiaCWj2
	 9qaPlxBuT3ayQ4pEywsjbUNiSS1Lol3qotqjCSkS3ul/UNTgrKSNy/3MvWJviCOma4mZw
	 02jEi1ZL54YfVTdmZ2EyRZxanFMUtZEYyKmdYNzcBoXUONaMpxjGCyzJLo3uITFH+OwV8
	 3aoe43xGSZdxyw1ZQvrB5jQNURZFYdk4zGOnAWiIWEXlBKxG6pMwxrlg4UP9u2QtI+ODd
	 LfXJNl50efsGx4Pibn3E57CgH47wT3BnNxJZ7enw3kSSznjyDlgNYy6QSNTCYe/h9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817106;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=IkTExJ1xt4czrppb7I7mUL52p2q4p/WVjeziJB6ECHU=;
	b=idszLv5PbXB4KhR8TkwGJJ5hqF+9FLHCAzfsLawspTK1W4FsmMASYj9zrsmd94EyVMFY
	 CO4nrI0AOPxSRJwbr3TFvhPGViajfKaTLqoxhlkfVRYs9SIkGAsks9FroRcYXEOCnFzXA
	 YoCbCgfdZBK0K726Eid2HhZgZtkbJZw7hePpPPywVv9No4XVDgM5rKPBy5vfgHMew4Mai
	 1L3okiUV3e/GPEiAhGaTrWvl9TQql54CvZcrYkrgdv+gUOP7z4hoTAfVK1rh1Oe0pmfK6
	 5CQtuxXBeNtxaCvOGVKESFDkTa4WYeH7SR8KLU3XAGMVesdSDPAkVqAQxNPC/un/jFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=if3Z+TJx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF75606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=if3Z+TJx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8DC1F01828
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792817105;
	bh=IkTExJ1xt4czrppb7I7mUL52p2q4p/WVjeziJB6ECHU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=if3Z+TJxI1bXf/vuydBkj2ivHmkCVAqHzVk9OFXSEy1B+mOLms0ke7TXA039Z7Gs6
	 t6Vs5LOQzauh6G1nEpx5RCtPuzRJTEay/IMWkhsmTi1M2RUff6El4JtLZiqA1QhtAP
	 9QZhqJhvRvybwETE2aMycuZrVEaTrWYsh2XHZJIG1QLtK25HKoBztPK+a22j4cOF5g
	 an2a6xFpk1tKLwkrc+YpotG7GR3bTVFn5Qe5ofiv1NITJel10SbKWb9lfy03vZEzmP
	 uVGipa0d1fp3Vp6xNAoWHtCSjUZVf7UF0m3YyRuiYpqgW+B73VhJoeOa4GGbJJAtuH
	 3gwadCRud0pEQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43fbcb4393so212701066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZ5e2XTD/JGFgBezCawLOHl22n4euUmsEYDaoLHfk27MeS7B0dNKnEMSDylWUIl68VDRi7Q2MKT2BTXpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn31Z0qHpowNTL5dxm2YlPUrvq558u6f5jnK/g0xu3ttOEQQJc
	Qvwt02cmmV70ZmDga4xsD4c0J7DHeNZnq8ObtauS9kdE6Nzh0LnO0BBnOB6DSRYW6AVsKdpQeFJ
	vz3wVjjM+veu7C6Nmiz+MUq1cbA2bFQM=
X-Received: by 2002:a17:907:d9f:b0:c45:c030:732c with SMTP id
 a640c23a62f3a-c46bdea5694mr92508966b.41.1792817104588; Fri, 23 Oct 2026
 21:45:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022092514.2590010-1-huiwen.he@linux.dev> <20261022092514.2590010-5-huiwen.he@linux.dev>
In-Reply-To: <20261022092514.2590010-5-huiwen.he@linux.dev>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 24 Oct 2026 13:44:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9SW_D1gwMhD8gVjVJAcPoxiXvHB0TvDLqnjw8TpGCKRw@mail.gmail.com>
X-Gm-Features: AclHuK8Kwr3rWA83HAQi48hy7B3QNMUE-TB8Aiiq6UAFJonGlI7eqeiW9f6hFRw
Message-ID: <CAKYAXd9SW_D1gwMhD8gVjVJAcPoxiXvHB0TvDLqnjw8TpGCKRw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ksmbd: send READ payloads with MSG_SPLICE_PAGES
To: Huiwen He <huiwen.he@linux.dev>
Cc: linux-cifs@vger.kernel.org, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -35,6 +35,47 @@ bool ksmbd_queue_request(struct ksmbd_work *work, bool use_write_wq)
>         return queue_work(wq, &work->work);
>  }
>
> +struct aux_read *ksmbd_alloc_read_buf(size_t length, bool allow_splice)
> +{
> +       struct aux_read *ar;
> +       size_t alloc_size = ALIGN(length, 8);
> +
> +       ar = kzalloc_obj(*ar, KSMBD_DEFAULT_GFP);
> +       if (!ar)
> +               return NULL;
> +
> +       if (allow_splice && length) {
> +               unsigned int order = get_order(alloc_size);
> +
> +               /* TCP references to tails must keep the whole allocation alive. */
> +               if (order <= MAX_PAGE_ORDER)
> +                       ar->page = alloc_pages(GFP_KERNEL | __GFP_COMP |
> +                                              __GFP_NORETRY | __GFP_NOWARN, order);
Order-8 and order-10 allocations can easily fail when memory is
fragmented. Since MSG_SPLICE_PAGES does not require physically
contiguous pages, could we allocate individual pages and use a bvec
iterator instead? Please see drivers/nvme/host/tcp.c as an example.

> +       }
> +       if (ar->page)
> +               ar->buf = page_address(ar->page);
> +       else
> +               ar->buf = kvmalloc(alloc_size, KSMBD_DEFAULT_GFP);
> +       if (!ar->buf) {
> +               kfree(ar);
> +               return NULL;
> +       }
> +       return ar;
> +}
> +

> @@ -47,6 +49,29 @@
>  #include "transport_tcp.h"
>  #include "compress.h"
>
> +/* Switching affects allocation, not ownership of existing READ buffers. */
> +static bool read_splice;
> +
> +static int read_splice_set(const char *val, const struct kernel_param *kp)
> +{
> +       bool enabled;
> +       int ret;
> +
> +       ret = kstrtobool(val ?: "1", &enabled);
> +       if (!ret)
> +               WRITE_ONCE(*(bool *)kp->arg, enabled);
> +       return ret;
> +}
> +
> +static const struct kernel_param_ops read_splice_ops = {
> +       .flags = KERNEL_PARAM_OPS_FL_NOARG,
> +       .set = read_splice_set,
> +       .get = param_get_bool,
> +};
> +module_param_cb(read_splice, &read_splice_ops, &read_splice, 0644);
> +__MODULE_PARM_TYPE(read_splice, "bool");
> +MODULE_PARM_DESC(read_splice, "Page-backed ordinary TCP READ sends");
Can we set enable/disable it via ksmbd.conf also ?
