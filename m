Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976BA3054C7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789924047; cv=none; b=vDopazMJd+p9X//nEgTJKVPawz+kKAlsHvt5qlg/he2BrSL+RFifOQ9aI69ztm/ECXJFI4MYKK4RwcqraEtiG6kEkEh0yxO13aL1yGAhIsvx0rYXKglwW5TJtuKv12p7ZnMFo2qsAGFUhNRlvCtc4MFQn8EryQd2FW+wf9TKEsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789924047; c=relaxed/simple;
	bh=MoNEDcWdGlP7UcyCq8wXBRR56spV4f4PPUO0eUL2OZE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FI21zsSKImfJyYAeh4QX5YFvSVqpIm7+clhaGswqY0w4hRg/vcKttzZ8mYkdUH/FvKkGtHzL321Xj9fC/h5/nogTXaUQKJvMN2R0QMb+kcpKpIsjWoTu+RAWtLOi/flnNukRGmp1lig/ovAjwIjjuodNqB5mpVOxNvwQ61EgzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxbYk8Rs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxbYk8Rs"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1704572a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789924046; x=1790528846; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5OXkFTl19euajO1h3c9jy1KZ0WClYAUhVVTBNP2yF4=;
        b=YxbYk8RstqpNoQLxSV22rHj2WD/9cVINT6vI6PCf3oDmUoVKamqBQMaITd6AMf88zW
         +WmYeNe6xhJyLXwgGa6owSWwffxx4malxAJX6EA0iQyCCoQk0f12JSMk4cygi1+vHALH
         ISbQsG/471I0i6Pyxu59MVm33urf6afCcopbGmfOwlZN1GPazdMyUSnUvQw6ob9EzVsU
         kqw87eLGW250yl3z0Z0Hl1idiuFfetYTFeiYJ1bXPP6iWQeyLvngAy8ag0xFPqVX2fXb
         Yb7oyGHZ5YMP6A4OIs3U3TsuiSYRS7TUs1lU955TL3Cob3eDECtyDjzqYXXfdApXH8Nw
         VVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789924046; x=1790528846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5OXkFTl19euajO1h3c9jy1KZ0WClYAUhVVTBNP2yF4=;
        b=jgWStZu4GVzyYYM5ydUe5yd7Cl+Xlu6pTDswIPMAjJfGNUn3oe7ccNkBVdQwdNglVf
         AkwJYjldD4Cx3W/StNabgFPXBhUYrtLah0k/obH/V5mPaAFCruIyMl445+sRF/goD+OA
         OZj30VehcyIdbYzBg6IeojkrHmsThd5oKxcAKV2uKAOqWCIDVQfGtZsJQxldYHigC8B2
         Q9AsNyuEm69bzuCKT1q89fUzezulDxZ6wpPkoCpj6a4AEb9L5eMfLWD+XMOhdqDnXxSS
         W9I7sZXDbJAQpkPlzV/j1INBqtt0mvgtRnAhF7fyhZfaRUXJ0FwXdkQ1GWPNnIp8vAsG
         kAvg==
X-Gm-Message-State: AFuF++k/feIlBTecXmYLNBhcExQ6pXyYJqw8UkcOTuGm0GDNoK+VtlfE
	PB52QW5q+fNTj1JbdYxO3qIV/xaRWSwMjfXYQl2O7QPASGM5EDTr7QfB
X-Gm-Gg: AYBFou0h9nhrUzmvxzwS3YbKTJfYlh/ZHInl0juIc5qLU4hxCDXtiBkvEuJLQM3MxZ4
	RVI578ErQ4DogJl73nbxZ0QsNge6YqOUE6VVcRRHrxMBQIocRjCJPqhfnfZxKJA2UaBMMFOKUwT
	2OWTsiqntVztIAqDcm2qY2d0Ed+FJR0hnsz/2qoIsFI8nil79yMWybho4jgBuM0CGJw1FT8CTqH
	NncVsJVYdfh9U/mfIkkWZ6FtB2o7PsYH46bDcOkb2+DeDTUdZ6+LlnxvjtNcsHG38pLhCzS7+se
	vaR6ActpYTDk77Bcn3iDhjl1xRJcJLivUghPfdBJGyU+OVIp0z3KZtsZj0bz591LwwiIT3CBEHG
	rnXGvb8HZft8n7Teytk9Tbg3vQVMXgXCBPwgQWys+ultAEyG2XQ9FEZS7aCurF4MAHqyWOL8Idm
	JlIi7XfJg5NiOPZdHPeqAzish4acy/JvDUvavNf6f/rFWATN/sAn+gRvl13/0QOjTN68fg3HEUr
	L5r99WxevR8aZbxZvG3sl55KGmZvVq2qSyhCgimOp7fE9X8l2ysVaTiVsLKaSlmLiok/qilR+XL
	ItcS
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id 98e67ed59e1d1-39e54d37ad0mr12487465a91.2.1789924045869;
        Sun, 20 Sep 2026 10:07:25 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02900f84fsm8679011a91.2.2026.09.20.10.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 10:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 20 Sep 2026 17:07:24 +0000
Message-Id: <DLKB4AJ21W5Y.VSMC8ZB4EK9@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, "Peter
 Oskolkov" <posk@google.com>, "Xiang Mei" <xmei5@asu.edu>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] bpf: propagate cb_access from freplace programs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.17.0
References: <20260920163211.795547-1-bestswngs@gmail.com>
 <20260920163211.795547-2-bestswngs@gmail.com>
In-Reply-To: <20260920163211.795547-2-bestswngs@gmail.com>

On Sun Sep 20, 2026 at 4:32 PM UTC, Weiming Shi wrote:
> =20
>  struct bpf_prog {
>  	u16			pages;		/* Number of allocated pages */
> +	bool			cb_access;	/* Is control block accessed? */
>  	u32			jited:1,	/* Is our filter JIT'ed? */
>  				jit_requested:1,/* archs need to JIT the prog */
>  				jit_required:1,	/* program strictly requires JIT compiler */
>  				gpl_compatible:1, /* Is filter GPL compatible? */
> -				cb_access:1,	/* Is control block accessed? */

No. keep the signle bit.
