Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E863AFB07
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258275; cv=none; b=DrqmTKLjlTG5DuS/Rd/jtMiAFU28x+AMdS86NR9Lx9kaOjUTezispfNEBelacnl9PYWejQlfyS6PSHfa5G5R3LR5PcIYi8VE8mkDvopXX60fdtYN08DIuJBE96mOpeBRWMqUzz5GRdFDT3DqmE19Dko62vxdar3YVmoOKW5UMhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258275; c=relaxed/simple;
	bh=9k3NM+GMaKAarPmrh1Kuc1/EcoWrWb+bHH6oZChuuHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNZbHw86YVEchWGlHYcGwvK41jTrvOmQ43anU7qdaxNAxfQ+dIyZLBSLydM1rh7SOBdZsqMJgekFtHl1I29szUvvp8T+7rCrmFHrCW9HMWmFPN8Bm9oxGqN1x701ByBPMXk1dt5G+Xh+MOxMFD/rtQpOOeWWv3rH4wgf72NR+k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZ8KWyJd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ8KWyJd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df54150dfso563146f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792258272; x=1792863072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=746x5o1XAfb2RKvAoprpp2XG5c9g1cO4ICwQpVICiVk=;
        b=BZ8KWyJd2I4BeHs00VzBB7+CdTJStjzv/aKgCsuOxT1Kb/ar4E4iF8hKOb17X5zKLc
         EWUJrQvb2VGJnw0zidIQ4B1kIibhssf5hD68peEOrQOrrFflXF51dwHmIhvrz404FnpH
         gE9DH+hdPuZNZgILskTxw0JXgdSygfKnQphJ5LQo6fR3L+YsoRE+U+UJLKAEnjagRvvn
         EOiWSDBwy+Ohtv+fr28/q5lbctjGyrM/X4WUP9ZwxJb9ywCYCu4cFl2OZGBRrdvlx0iz
         RuPICPOv39Bt10Rs7y07DdOBtXU7oaQsJE2RH1SAhG61EDyYeEvGZ1Mh5Dx9pzcoD/hj
         fRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258272; x=1792863072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=746x5o1XAfb2RKvAoprpp2XG5c9g1cO4ICwQpVICiVk=;
        b=GibRX70ej6NjY9u2AmK45LfzhE2rl0JkDgH2AsfEPoUarYvk9hlEbPj1fbmL1Vo6bI
         H76dMi1eXN2sSuPBMsSEBwVU5D2YdxFZGcuQKGRhtm0UtgN5owNf9RDhbIAt7pU2aIS2
         4Rbh6OgYBVr+ZP/1vz7vieBbwp8+0Kj8L361LC5bZmqGYQIGGCRZcLhtcjMDuhZ99e5c
         1GOWu/PH+H5QUYStMMhAJRlKNEze9UXGxx9Qu1JDi4EOUutBjAjJxHkBGKuchBCwO8jb
         D2lXBUDMOP5VNAj1DRaVoBlscuf0WUi+6jOcrPsrZhWB3hpvVX78PQ2+8Abg0Bw0s+zz
         qNXw==
X-Forwarded-Encrypted: i=1; AKwUvBz3CdHpjQHhWJQ6M40MvwBKzYCu1dp+bYLnr1sJ6eVIJIUH+rJW229TzOz0CCRdTln2oEcBI2NYpuhxT40=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIwXUQ/Cl+3uALuw3dKTZeA7Z3ikEKvW/z6GQVjV3O3ZijAsKu
	PUR+00Zji2XgSvV489QRexat300O42Bf2bKQdM1xzEFq6HF17mWazjLl
X-Gm-Gg: AYBFou3wv1nC8d28CufPT53bXq97ulbEw+RpYY0fHkOzmuA39ygm7ATOGslT1T5WZ0J
	U8/03dWMtCRQ7kl78+rb9d7SANgiA4mEjfDvXIH7NDOo3SB3oekx1MxO9FAv2tFbhtqD1DEJycb
	tvs72Qa1SAuv+rLOf3GJ16K6T9y6dp40avDmQ+qnFyu9ys1SzJUTN5Cz4Kvog6dHKXFoElmvhpC
	EIyPGtCmtpdS4GnMJ5s8rKQJAom0LpAi0lDnJ24fVsIKJDKy+i7myBM1fMG8SjdzaFj57Us772W
	V3EGSGnom6e1PQYVTY0j1h6ReM+yd/lKUc1QjTuQsTOGYhKYTp6RCZXByNXDHRSCT23wdjPj9cu
	gN+gEyPbq4QiVtY1Q1ApKnnqWEWUYPTaY7/s+AnlxKkG3+y3pXTDOH27DnQZ6w66u5h2GOiOAzv
	jzGGp4yFsuz/knaisGWI3Lcmv2N8wgvu5sa8A0+YINQnMdVC2mFR/S166MVqNtTMkjyrhvssmQF
	VGO
X-Received: by 2002:a05:6000:2313:b0:48e:b8f:f7d9 with SMTP id ffacd0b85a97d-48e0b8ff983mr3535275f8f.6.1792258271710;
        Sat, 17 Oct 2026 10:31:11 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm12164710f8f.43.2026.10.17.10.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:31:11 -0700 (PDT)
Message-ID: <d9182d0d-408b-4ba8-b3af-173ea397f0d0@gmail.com>
Date: Sat, 17 Oct 2026 19:31:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm: hugetlb: add explicit page size to hugetlb_cma
To: Qi Zheng <qi.zheng@linux.dev>, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1792136742.git.zhengqi.arch@bytedance.com>
 <fd905db7e48354ad139cc68b66fe776cd7f2dd8c.1792136742.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <fd905db7e48354ad139cc68b66fe776cd7f2dd8c.1792136742.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 12:07 PM, Qi Zheng wrote:
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Accept an optional @<page-size> suffix for hugetlb_cma. Initially accept
> only the architecture's existing CMA page size. Preserve the behavior of
> unsuffixed arguments and the existing hugepagesz/hugepages options.
> 
> Validate the suffix before applying the existing capacity, percentage and
> node-list parser.
> 
> Save the arguments during early parsing and process them at reservation
> time, after architecture-specific page-size information has been
> initialized.
> 
> Assisted-by: LLM
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

this LGTM so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
