Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549590;
	b=KDX5rFaxy5+dtlPwGv1wv1zwAMKjxIQ78A2y0iSLQVf2jcjt8hMVR1pmU0ez9G1eIR5i
	 Bo60LOWNhCv4QUxpZp4eCbAMgUf3CV/7uo501Ynoi2s7noLMEA2ybOuYOMUfkJSKzEnh8
	 THd6z7ws62sqvNlJv3F0s6Z64KEecZFg3AS30kQ2rnUEueXY4SrnkRbsyBR42YoB9WWtl
	 YV2IvXADRpdKYJp1W36Jx0aMnk5MmAHevrMJkFIL5uf2ScKHSQYg4La/Kax25D2Wn9u91
	 J7koc7wfr62jb6kP0Nts4MAyzVCuwfM3o6QnR6BYElQbJh211Bs3Az41YYB0h/WY6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=qDdiu7ls9XDQIfTHarLgal/BKccCKhlDZU1D6BhXGx0=;
	b=Eiy8+YB6c0cwZtn6tBKOUWrYFJ2FzOBlh6Z0O/SZadB5qS2QdLiB4CvA0F98qo7R0aEb
	 GgWCcr11GrWy50MqtOEkb18Y/vrmMQtQNfFgev77q1v/2e31wDbOxIeirsUTe6xAlx6IE
	 wxdQPaCut5ypivaTnVJVrg6C0kWCPppR4LiWLJ5ISiXNTlejt32G1LpqEJ8KJSVeXt2tF
	 92ROZ6OAJEYDy65NIggeHVKsKRNJEdgRG2lCxuG/1g2ceKVhBc2bWVBS7T3fKqBSFyiCL
	 7Crl8UZHz1hyVCVTTkZEiBYn7Hnx/N9IMxOCPbrNfo6dVnzs2cp0AyHfEHOYxdZA5Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=WhaA0OJl;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F071606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F071606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=WhaA0OJl
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533778ab0bdso3072201cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792549588; x=1793154388; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qDdiu7ls9XDQIfTHarLgal/BKccCKhlDZU1D6BhXGx0=;
        b=WhaA0OJl7jf8AS6CHRCl5npa46++WEicQwXYsexkMoPKqw9Q3h4kSIjeveOEPtOeQI
         jaYgiB0cl3NQJHu/keZ32MrBc98D8b4oLfT8Y6wNaiAe4UfWBuAToFWagfEGaxnddfEo
         qu5q7/qP6mmcY2TvC5vR+ByQUN9v7Rda4N5bBRjJHQTmuEfcxPtz6L8zqEu6y1AIChe3
         p3OgT+oiD7wRnr+UKJR08zq5slkVNPdFqXF3v//bXbAqokrcTz20l3opU0VcKVFOcRX5
         nUz0Ccc8hFuW6zQCBOz6lXNCEZGINN9h7Xrab7SHL4+NEFGXvv9ohf9eKYSs8mgT7FRw
         PUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549588; x=1793154388;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDdiu7ls9XDQIfTHarLgal/BKccCKhlDZU1D6BhXGx0=;
        b=i79hAsIPyn2ZYT0hknPxr4+lTagGVBpg7xTdOjUUc6WtPlF4WzUuiCf9j/pPgmrudR
         ItMXCgP3EzYenfZUVwLtEgK+PxjjUL86V9ifRMshi5/KNiXNfvzt9bSSb2l6wGEscUaJ
         p1ZQ4ATnNhDkXJayvZmj7PkR+wYuEf27J5zKo/8n0n6vE2/N8gR7eI5cV05u+5LBTzbu
         YsZTmNMha1iTYpAk0jnU8T5+g+bHmmo+ElfnyUMP3XE+CxGPo20aLQfX9v3XjUFBhwaV
         o3CMv6b6I+pJT2oUnKhZk18GsulOoT5W06qRxWMyCYI5mTC3VvqLFdDoXRvpeZgUMNJf
         i2pQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7YQb0obPn63Lz1//7Xla7dOXpQXwtoLpG+srn7DQkE+tY6+oz3vESM9ZnqoOWk5N6A3N+1GPodQjSTvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ93Hliz369u4jjlYdf5Y3a37C5ge5frbvVGWAjrWDfIlnY6OVd
	qTB95VZYZDXMtMl4/Xwy00NiG0poD010zpHAoiFYPJPMsUTUFGVEAvvFilGHBRmfjklNGyAZ6F0
	cnkgl
X-Gm-Gg: AYBFou3cECMAkgh6jyQYmXshdjdQwU9BRV0EKQ3N6EGAPhpnlntIf+Pb1QwoBfRZpbA
	Yf39o3Dr13H9qGELAyeFcTOOSKTiDJ2nvicex72EcIStYui0Hh2u4DjqDUOPsRtfxTHNDuUx1hP
	IfQdF+ev446Hq+gUuXy75kG04xmhWKLR7VzlDIRDEK6p/TUhXjMAA69GyPnD2+dxSFI2hAbGbDn
	xejZ0JzxwATnjSmrEnvDy5/4hm4TdCDeOHI5RNpP5NLeebIWDeiMonat56AZkBj7OjJ17flrpLn
	pDDrVNOOuJ3TSpOHuvMZEiaN/Q7Grim0Nwi89x/WdtQ9qOO15yVDIMnzoIzrpFzSIAyBEMMSBFj
	SNrc0W3Iq2YyAB6umap6dwhchs0zGRbXQlfZnK0YD/TnyBOerDw68vsycDOWYijSMUuCgbFJhjj
	N9j9YBn2PokKQ90MUoETwCCxWLWGhRnDJ3IrpRvbyyNifVTeTOaQJC28cev9jNQxbLMrYdx1Pz4
	L8ppwPeiDCgnbMIIKclhVJpLMx5bp+Ugq3xfBQGSNTgisvJPrZi7Ajqbkwfk+wwjwxaWu/tnuT5
	3iwmP9PBq7XVl/JvjcL3CDmlmjc=
X-Received: by 2002:a05:622a:1248:b0:535:a5f8:a5c2 with SMTP id d75a77b69052e-5369b8a4bc2mr10226291cf.66.1792549588210;
        Tue, 20 Oct 2026 19:26:28 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c42b17sm13170296d6.40.2026.10.20.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:26:27 -0700 (PDT)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v3 bpf-next 2/5] sched: use static_branch_likely()
 for the NUMA balancing tick check
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
 eddyz87@gmail.com, memxor@gmail.com, mingo@redhat.com, peterz@infradead.org, 
 juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 akpm@linux-foundation.org, david@kernel.org, gourry@gourry.net, 
 tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, shakeel.butt@linux.dev, 
 roman.gushchin@linux.dev, yu.c.chen@intel.com, zhao1.liu@intel.com, 
 tim.c.chen@linux.intel.com, lizhe.67@bytedance.com, bpf@vger.kernel.org, 
 linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261019064157.29885-3-laoar.shao@gmail.com>
References: <20261019064157.29885-1-laoar.shao@gmail.com>
 <20261019064157.29885-3-laoar.shao@gmail.com>
Date: Tue, 20 Oct 2026 22:26:09 -0400
Message-Id: <179254956989.1919196.954997201143423051.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-19 14:41 +0800, Yafang Shao wrote:
> task_tick_fair() checks sched_numa_balancing on every tick. The
> static_branch_unlikely() annotation reserves the nop for the disabled case,
> so the default configuration (NUMA_BALANCING_DEFAULT_ENABLED=y) pays a
> taken jump per tick. Flip the polarity to static_branch_likely() so that
> the fast path matches the default.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

same with this one, this is useful separate of your series, please
submit separately.

Acked-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
Gregory Price (Meta) <gourry@gourry.net>
