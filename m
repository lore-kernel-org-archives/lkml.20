Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996406;
	b=BS4VzOUJqseXSxg2g2dF/bScnCxBaiqJSF/IVtfZ4zeQcL3iYDDds3RSh1WXblxer71F
	 sMPBcfyi0IbM4rfLaAuw7AIn7Jh5D75GawOu+OfmWx5wODdBZsq/9IZfWnHK0AF9Mv+gW
	 nf4l1fX9YAJmdBa12P4v6p+s2OKzpC6ofpoRiI0c1AZ25nk49rNpMQ5CWPwC3IW6WsbXv
	 s2s1gQehOyghBF7BtuNXcoa6G1UxOs5xpqeis3NhHJf0bz1YrgJruSauDCsTcyQWZsRqi
	 x9kDMUF/WIS1FTt1r1fNJlkz2JvHZo+qwaaOkxyXaEhc6zsis3PD7Bg/AOc054iOCrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IGK4DQjcIX187U9vI9ioaxMrjg9ZTSKqMzVUmGClviU=;
	b=IbW+/9KFLy3MXZ7pdiB7rsLaYPh7nuiEdjw7sHlB3ogtEJZ3YOx7CtgMlteTF5tI2SQG
	 Qd9eAWtI3BJphAxh+0b4jtgTZ1tCKibdasx4zNn3hTCgUk0WgIHtwwfxYRTcc9gyQZzc3
	 zl6x96MulnA51+FfU74SvK7z+WMX42DPERbMzMNKsXLCXie7J1TuKJJyRMTgdyWwzksyz
	 6ZFfkBrOWFcbVciqvAjcaxGwFIcq3Y2z3NHPaQkisE9/h8OOr8mFF7wESfCIYEsjbkNJL
	 lmH4d0i4hEpTI0FAYTSlPuaPZ1OZd7LUjL4BbASomotvPiSNrG3P8ol25We/mlGTqPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hRhTLQV5;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDB606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9FDB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hRhTLQV5
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso153353866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793996403; x=1794601203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGK4DQjcIX187U9vI9ioaxMrjg9ZTSKqMzVUmGClviU=;
        b=hRhTLQV50B6IWErTtrVVNq+7KVVENRzQF3wBEWiH9u3Sucp0iVU+VUsKh4z3HIu5vU
         pq6VmUoBaqHfiNHy9giHsbE3tlbfaGcLcW2MYLpNk7wgm/mM2t2V3qndkulvOf/dk1TM
         ahADn/v32B/35/OJZ4dbdKMN9tzJXDvx3QbcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996403; x=1794601203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IGK4DQjcIX187U9vI9ioaxMrjg9ZTSKqMzVUmGClviU=;
        b=dx7NCu53QudsfuEMiLQFkaCXsgFxdFXRkRCuESHUxh7Qw6DNuvGFW4M200oUe7SNnt
         /nu5dVgfUHrP7JxeUM0yQVszBphE+M55rc/AnSahBeyKfa5pTtH1GCVAocuVW1qkIi9p
         jBU1Ic5PJxhthqz5eMUCQp9zcXkXDTCbC5ocM29/iOtaqWdnbdJJj0BFQjy5ZO234kIA
         f0tXKPdmYndGGC25RBhFs9W7I/S1cg7sMWyew0mBp2/BrnxGtOCChy94DnTt/8PKjcGI
         eJXiFJm5Mb6vv7hXxKBk9M0y+o9nd7rj5unh0bx+3OK1mclBeDreMquJGn8MPPq3QxHD
         IM1A==
X-Forwarded-Encrypted: i=1; AKwUvBzOEi/cGRJNeLAtQcJGI3rt7aRzxWLYBuVKMqBUv+NxxGsC3KNAKrijt9IqmP6Ri5tagNyzB0ptvrRrRRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QYeCaOvRGlHE/tFlWqbEQAB3+kgFxCTu15xvLKwCSUGO71oUl
	w6Ivl4jDINUSXe51BV6UZZRuTYiSZnn6x+oF24wb8Fa01w70VSXSmNIEwQKzX2/CBH6tUcvVVQy
	ajz8D793m/A==
X-Gm-Gg: AYBFou1NwsjApGACl6ZguQdQWeTyYi+2036H7cxFoucKsM0ateM9nDb/gh1Gy5XB/5j
	ZGfAcHMtDDsCy+a7zIsxKMmhbv9wvV4q1LInxqf758agCKcZsvvl7DIyJ2ad09wgJNe0TEx29Th
	p6NVFLVWxkTtDTYqM9vR7G3IggZoNcNDT1SJjziU6HpOzQM5yXX9YRsFnPu0V58SufJX48M52j4
	SbQzhjmEKI8NIQM+2K12oiJTFmTWcBxLFGR9HzKHAZZPfCfo5NrddeWYkXZBIHLewO5iY1YikUx
	vgD571rKvzwbYiYEhK8qJOl0Zvtfu9WZ4qZTH/GvWFYOzzXMaK1JiDJdBVkcGZjSdnnYVl5Gvj8
	6VD5mEwdjZgWbAkBQpD0k8l8HvN73kGmC19WmXShyoY548ifVgiIVQPYl4+kYMUIXqlRRv4W8pm
	uHo57duvz0Ygr2dHM5/pd8aaiBzoE93/sa/x2ger8xg1AzMjXq6tTMTopLUb0STLxlYbVQPKG37
	ZOgW+TyZpPhR3eBNrSwRvYs0PObvjfSbPdHYRfj/3T0RChrwUWCq9HSiETyP9m0X3w2HmtXQ3C7
	LRPBx9vD9kCZ+gQ4DbSLPU/310KnLt6pcRcKR+2XAmCKHkzmSfIKQzC9Y/BRkkhwLPpH6KwJTF9
	0aQ==
X-Received: by 2002:a17:906:c102:b0:c3f:84aa:af0d with SMTP id a640c23a62f3a-c4d354b9d2dmr290399866b.18.1793996403238;
        Fri, 06 Nov 2026 12:20:03 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562ea8csm101538466b.22.2026.11.06.12.20.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 12:20:02 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso153350666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:20:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy3lMttPllqOQOJNku8YTcf+VdV8AQjjFgEgsupyMogRGW8FtrniFlhn+jdpxiFp/GDdqArteRS5NhzGwA=@vger.kernel.org
X-Received: by 2002:a17:907:d22:b0:c29:659e:2fd2 with SMTP id
 a640c23a62f3a-c4d35519e9fmr286852966b.27.1793996401983; Fri, 06 Nov 2026
 12:20:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
 <20261104-allein-bepacken-hitzig-5e517d3c129f@brauner> <20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
 <CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
In-Reply-To: <CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Nov 2026 12:19:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi-B--TBQuYjz6J6vKtEMpNSm4_wVRzTP_vE=uTLb7P5g@mail.gmail.com>
X-Gm-Features: AclHuK94jU-Q2Wt87Ad4tvQ_sMRVW1xDG99ONHJ5t99rOlTRyHhYCt5Ue-I2zS4
Message-ID: <CAHk-=wi-B--TBQuYjz6J6vKtEMpNSm4_wVRzTP_vE=uTLb7P5g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, 
	Christoph Hellwig <hch@lst.de>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 12:10, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It does compares 'count' to PROC_BLOCK_SIZE, and then after that it
> just allocates PAGE_SIZE and does

Ahh, this all goes away in "scsi: core: let procfs copy in writes", so
never mind.

             Linus
