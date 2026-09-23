Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD704361977
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128928; cv=none; b=ry4KZyU8sgY0/9JNd3efcnxobF/I+xDcGyB0QTi4AFOBJj58WEINYIr0LJyL1mWu4B/9t8nwtweeOIux6iUolbfsNyiu2xI811P600hXQrXmKRBPOX7vYCq3w3XJ2xkaFmTyRrB/QbyNDbs3mup/jtK2d/1O5Ggv5mAsa/sLQf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128928; c=relaxed/simple;
	bh=4F5JsbzlJprC4YpFiWmEQGWzHUTlZbScOYsAXfA0KtE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=qpw7xO3BLQkPc3dTLHG4ydYze3LwXgUU78nGtH5OQprKGXp3AH7tnZu2tofM83Rh6x5Rvz+63uz/gs+45OE4ZwTONZNaOqHa7c0kuBotcOyYM7Xc3h6YMygpKSBLOFjRO+ST1YTqB/TWa+4iufzgr+DjaPxW/uj5K1s1DyjdTY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZhuZqHC; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZhuZqHC"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so330384a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128926; x=1790733726; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2bOFJvTkZBak+qel32NDS0LUD2oc5EBObgtAC51vYYk=;
        b=pZhuZqHCbZCd7POttdOxJfk9QSw7vn/M9mIwIkjJrlBf1mYNzQMhB9uMxV8DhB6zBk
         HUvWa4S7OkMLcfpg0P6/CgOcFkaWICOBjWAQ35LzppgPWqg3QQVqw8w4/j4sWwkmz5xC
         NQk0+zhBwYoNnZ2g0kwftEYLnlfu5/ARkGkJ8feSeA5/0r39ZLvN2TPvm3IrW3dmSGwf
         Oqpn4jLx7eJBbllWqEUEpbBUqjIYu3lqtat3Tf8rkf3HIk7UvrDWzuSwN+02XbiuXw0j
         O/ZzZ0E0E6xo3bEyhR7yPqml3A9qrJtwktTVPaCZn+1isvkju8j8GiNxRVMh/7vH19U7
         8JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128926; x=1790733726;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bOFJvTkZBak+qel32NDS0LUD2oc5EBObgtAC51vYYk=;
        b=zfvBIsJI5I9B76uqzG/UFz4lZd5Bqa0yMeUoJhgrhXJ1X3vPev3BeItQYFCjL0jtNf
         Ii7ltjwKngRLcwHULGNqjYcmBKGTrl+kRNuplELNF95Q8jtz8mZhlBx12gMTpsUI3a4y
         dcOe4QOupMrJSzhpCj0/6y7J8WAJuB3euYn3FI9uxEIbWyy7V5Xbiysbd5AyrUQLTSZE
         d0CJLhwGSnaemPV/u4Nb9kp+KmpLz29hxpBl5HI1yDVovGZv0Jp5EDcjMdoE0Qms5PcQ
         U/KRCi/UGxoILatkOHxFnyigHFXa8TIqetcNxOtYe1WpA86J+p+Af4hR8zS2nO16rUOa
         9DHA==
X-Gm-Message-State: AFuF++nAll91UgJTV1hs3K8zqxMeJESZ9Grxcgia2Tdc5q/9TuGmtssg
	9BaZAq/RVFntEBgSGBX5rY44fCHDdVOJpWFj40cIs5bBpKRvqloPYgayzCtnvA==
X-Gm-Gg: AYBFou3MJkOO31xZ5g6Pv74kJ66WEZjz5ZfPlXVKq77X8w7jU8ojr+F9cuU47HTzw8i
	e6P7R/suHORwDVL2kDO3JtDna6axdzPkSViGg+tnywVQt/wvA847AdXxzWGnTuWkjwJNWT1VCve
	/wmNZdCkcs4Om6hasdA6QIftd99S/7VYhLr5yQ3h0Le37xMDzxxGaCsX+pco/PeeE1+FHsGVVFa
	vQj22zv/K6Uyp3oaalDbv6xudJNXlz6Lg9jk8dpccAdqJ1TNs8zq6XAKudJKl4p18G9ya+pSz3Z
	KFs2hq3url+o+3KHwsiFmxf84TgUF6lAIzSyuHqxQHpIqjIM4NNFV9EWsjLA51WiI7fOcrF4yLz
	1p5k2xFtsQWRv0d56fuh17sEKjDMEDwUQcU1TmqlSnRpaJy3NCoaNyZItI2eOUwAd8YdAMYcAbY
	f6rZIsWR/RCajI9uxPO/GxMnAC8F+XEghKMjBsnyxWKdKP7FeRPGg2XC3JTrByFF2rABAOuvFPx
	NESoNIRjQYWMjC54I9oFLeF7wkaFkeQrL7lXPNRkj8IEwTXLAlgU+NnpP+izDf/mViZA/kYbij7
	/yU=
X-Received: by 2002:a17:90b:2fce:b0:39e:6c6a:6570 with SMTP id 98e67ed59e1d1-3a07e653cc7mr1039354a91.51.1790128926090;
        Tue, 22 Sep 2026 19:02:06 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc7c7b0sm1994886a91.2.2026.09.22.19.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:02:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 02:02:05 +0000
Message-Id: <DLMBQRAXRIZ2.2SHAA85YGTKSX@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Yuan Chen"
 <chenyuan@kylinos.cn>
Subject: Re: [PATCH bpf-next v6 2/3] bpf, arena: fix range_tree_set
 inconsistency on kmalloc_nolock failure
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <chenyuan_fl@163.com>, <bpf@vger.kernel.org>
In-Reply-To: <20260922072102.3570856-1-chenyuan_fl@163.com>
References: <CABFh=a6QOjBv1c7B0fw0AEqaBXiQJRh=8on5DUfqPC7hYuGBxg@mail.gmail.com> <20260922072102.3570856-1-chenyuan_fl@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 22, 2026 at 03:21 PM chenyuan_fl@163.com <chenyuan_fl@163.com> wrote:
> +	/*
> +	 * The pre-clear probe only decides whether a fresh node is needed;
> +	 * adjacency on either side is invariant across the clear, so it can
> +	 * run before the tree is modified and -ENOMEM leaves it untouched.
> +	 * The merge below re-fetches its handles after the clear instead of
> +	 * relying on the overlapping nodes being updated in place.
> +	 */
> +	left = range_it_iter_first(rt, start - 1, start - 1);
> +	right = range_it_iter_first(rt, last + 1, last + 1);
[...]
>  	/* Do we have a left-adjacent range ? */
>  	left = range_it_iter_first(rt, start - 1, start - 1);

In v4 I asked why the 2nd lookup is needed. It's not.
range_tree_clear() frees only the nodes that are entirely inside
[start, last]. A node that covers start - 1 or last + 1 is trimmed
in place. The split case cannot happen here because of the
'already set' check above. So left and right found before the clear
are the same nodes that the 2nd lookup returns.
Do the lookup once and drop the comment.
