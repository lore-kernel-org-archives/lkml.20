Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396573;
	b=TXiHjFJV2bv5FpXp9GEGzGPo+W9bKSM4DPX8LWk7sZPCOaUImoQgrq8Dtexx9Z6pOcWR
	 wk4HCH6Mq8GPeJMEQPDOTpWMB5CjfBA5qRE8788ErQeA9mVfv7kSmkDeeU/jM3L/8vGE6
	 cTC/CYGhZgORi2WLx9RXXIMGgEB3EpbM1P9wXN+VTNoP9fqY5I5WakVZUDWjQJTmHbCRw
	 DDeLfGWfM2fAEiEFBbkTZYW5ZeuUTeQ1WYlAYGDMzDIEumszt8e6CuYrEcS8qYYkzMXYt
	 eRvIZldbHm+rKAQoEMbAMeF1nejDy4X51QtkroICpVhtffJt3xIfDUnbGoX9Nt4m4pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=Q8gUr6YQpOMRYWSFdHxvUy3rBFE83YPVYbXBV1p9Los=;
	b=rDHbUiLY/y0xwh+uD0AaeiM0uTTjK0Q2sFchEjitPbTCvAlCCwGRPHEV/UzhCl1gaU2q
	 Oscp+Mvz7Zvo1foZOqK1olhIWwd7WT0427Olr1/KdRJJCHLCOIFKnl7gz7WYfHEu8ToO9
	 uj+XIzc4XzXd7xo2/Slgc5Mc/wnWjN1NWMrcnnBWYGOWqSfzIuE90C3Xd7qeXwfdovgej
	 j13jKph+QzvaKIf/3yuUDerj3G82ZsbEAgg06fZzD8JTpIhj4Py2LOztC82rg3OsGSU1J
	 6DkC8gRNiNqqehtXgG6pwI5rIoBQxAkkLdqTv1BQA+bwEBc4QZUns6kcRk0MSHBaeOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl7utlAL;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B8606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928B8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl7utlAL
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bb5afa736so54811eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396571; x=1795001371; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8gUr6YQpOMRYWSFdHxvUy3rBFE83YPVYbXBV1p9Los=;
        b=dl7utlALocldmlkR7C5aRRy9z+1xWwUA0DXUtzlofmnoI1Dw0HhFnekB/G9Rl8cdKQ
         /hY75msaXUKJE2r4mqv2K2HhUmYpZu0lSnJixqqUy8yG/KhzyVmtXJW3f6bUNNVWZTv0
         wf+3Kmp2jAVC6e6wMgmSSigp381IZhNl/Pv95yyIHHoSuWk9p59YpTBYtjR0uX1JjN85
         JdcxdxYDHsGtsd0OhyFe5fOzk3ELQ2bvh7MgylK/eM+st9tBEUn1xtqeTFWkvGWErNpI
         Hn2hlc0rGcgFbLCT+/49J27ozOvUj7P74s9avTF5IHqS2LBtdAfe0SxgRV/Wl3bdLOVc
         yJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396571; x=1795001371;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8gUr6YQpOMRYWSFdHxvUy3rBFE83YPVYbXBV1p9Los=;
        b=jzZhEkq+aVBgf97ctfdneZIZmw0nGR7eShPoFl16tDQUQrSRQqnhan4ECad3mYvUEC
         /eqiY/CrjSHEi0cqKBUuzWgNW/meEIa8OtMDsXfXYbD+N6EnOnxMoZwl7BRzttFtG5Gi
         OB8cazyoueo8wS/KQiNIrI2knzgnhRvb1dj6yjeJdpSeC57kutMmmiO8JygKciRPKSnW
         HTHjP/XkM8USZVQAxMFgvHrru+W9r4u9J3X9FGJuVFpKMlZhD4UncT1D7G2iSnVubIKP
         qAnYuXSnfI8eF1BkTJNpLbvbNdkucRpLpSzUkqDTC7H+7/m5Mhw7kJ1ftx34blLhBFaW
         ttYA==
X-Forwarded-Encrypted: i=1; AL+hErGAQ2pvFMeZmJ3uoUtzBn5eL1/vxTOuHMPrwYWWnWVp5WjwA4K0HcQfsXYHvwHqD3ePYgCeq7VuyGdgops=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PoVFpMr857m6ZKo9XXIcSrUDD3gNYcX55FjnbiJecvDuZs5a9
	PtlE9w1HNzS5TC5W7IkTN8dBnzdqHsYS3qhKV+SQbrCdokNVm1Q9FGIpFhHe0b84J5A=
X-Gm-Gg: AYBFou2MuAYYquKAb5PStYSjjjYGQgsbdMGuwM1rXArd3elR3p6FCQVflp9nG4hhWvA
	ZL85kB8eCHPDoWMwMs9YDhvxFJaS9WNf4s4+ZD/qFi63ZSQLiSreDNu5nqxFZqydaA3AZ9J0n4N
	9VJ+7Ly8ho8kNcxzBvYBT6L6hg5Ihy+Qobz/Jt6RHN9yR/qUnCHFYnD+JsPO7hTXE6OKO2IttJ/
	XupTYClwCrf3v/rzql/qKOhWYfk8TQl4odKww/aESYh6Mk+UB7LzHtmgIywOdtELiJ/yVF/JTyW
	IaK1p9Ocy9932PMRI5hS+/JInr0SwIVtOOBq9nM3E5dPnLU1RzSWIAWJCBOhBg2Y5OLN4w99Nb3
	Gzzwrr0eUbpb6eC7hYwGFx1FMBw5BqBs//o9B6rQitU2c5XcbYvCWSJXgg4mjhIapmXznqSr4HT
	yGYD+oSceYRC9yHwYwUS+a5vvkDW/JI9OOV5YmAf8AIzk2F2QQ/OCPH6L4ZJz+bNJICVh42UgBH
	6O1Rlx3XntpVXdN0ozXpHvkOj+yvE6O4pgT+t0fxgfrOZDjF99HIs30VaxMyAS1BiTx4vkOjR0J
	v4fsiJ7rpZKLzpGgYNPHnsIR/BX+PZOKOYFNjmGe/f8YKAyvumLt9fnaE6k5o/UDKvU=
X-Received: by 2002:a05:7022:5f1c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1b3c02e9530mr2733676c88.2.1794396571126;
        Wed, 11 Nov 2026 03:29:31 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm17527411c88.7.2026.11.11.03.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:29:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <avPwLHMalD_kzD-z@google.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-1-caee41684aba@gmail.com>
 <CAKEwX=M6dJMccGcDqp2S-66cbegdivnB6MqQRj6tQ2u18UH62g@mail.gmail.com>
 <avPwLHMalD_kzD-z@google.com>
Date: Wed, 11 Nov 2026 19:29:26 +0800
Message-Id: <179439656670.2142163.17566683934241550445.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-11 13:35 +0900, Sergey Senozhatsky wrote:
> On (26/11/10 08:00), Nhat Pham wrote:
> > On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> > >
> > > CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> > > counters are updated regardless of this option.
> > >
> > > Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> > > stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> > > debugfs is unavailable.
> > >
> > > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > ---
> > >  mm/zsmalloc.c | 33 ++-------------------------------
> > >  1 file changed, 2 insertions(+), 31 deletions(-)
> > 
> > FWIW, LGTM:
> > 
> > Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> > 
> > But I come from the perspective of large(r) server machines - I'd wait
> > for the feedback of embedded folks too :)
> > 
> > Sergey, how do you feel about this direction? We've run the stats
> > collection (even before we select CONFIG_ZSMALLOC_STAT to expose the
> > stats to userspace) for eons, and it was never a bottleneck AFAICS in
> > our fleet...  And the stats files seem trivial, relatively speaking?
> 
> Yeah I guess I'm fine with this change.
> I think this can be just one patch.
> 
Yeah, Nhat had the same suggestion. I'll squash them into one patch in v3.

