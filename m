Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544064;
	b=MOdncxskXs/fDenEgxP/2Sq1My+c7ThCvLPcgVPSUZ7iaaSYSSqhsy7bf1yfqxsLsc6C
	 WzLY8WQCwOSd/Zk38QyunqwkIC71G+w8tJ8MjfAdv6AYSdE1Bc9xxtAglsd+onyjXlxbz
	 6jiknwMKEk2hypmPLrcF34e+XL9w8saowffvF5KFgw+p8MGtUTl9g/8zDH6gjtADsc7TV
	 ZhL9PaJWvL0BPyrCuL3lbiRY1QJepqOHDB4qsSTNQR4vrf6ls8Jn+R2V9zLu2cnwXb5U/
	 JYYdftCSd+ABa9GWV8BacIbnONyoacY66Irk0ctorHUGbFaturgv2Q0L8nIZzQm/L2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=ddDWPbeZ30rBGVuXwO4qlxfXVwbuSPzUuAr284nFCLY=;
	b=hYr3CFcOjQSwGvQ1La+KX8qOcA27kwC7E9HO5OgKPqsCBfV1PxdkirfCAoG/9B/vCVps
	 wXFkNq1vJAIcQ4IT/kw/OaShwSeHJcWpsEtnohxE1xFAxEq14DOKv9IIW0uRti43Y5cN5
	 5NdtPc+l5vO+kaYT9THMKLSkIJ9G/D163lrtQATlQBeX13rcOKWNOjblNV71YzsOVzdbH
	 NFSJ28FR0snVknKfCLB7izCSEzAbxpukqP9n9gHga9xYwZjyog2ZN7CKv2ULpOufJh5vx
	 NxR3bgp+VmYpu04X6TLyLcAXSl4hH4IW7TfVE064rc72y2CfOoaEDX4dc8ktUZAl6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5OC2FBK;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B4606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5OC2FBK
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so536218a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544063; x=1795148863; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddDWPbeZ30rBGVuXwO4qlxfXVwbuSPzUuAr284nFCLY=;
        b=g5OC2FBKh6a9lARx55uhsvz0mvO9Us9QCQuTYJMK6BrZSA7ABICnlS47qVmjB6zbQp
         ux+7HF4ytLuc8cNznw/K9d15gFSD0owx8ionzMjtroyHHiKRne/axX9Cnjlnsp5Duzgw
         n+FskRk4hXAO0sQdMRO3WtF3UPp6I30entapgh4jE+tOrNe/yvv3POznAof4GLgj8ILt
         fPuRqLoASLMsho4HjRVJ8hnVco7G+8mdbRmbkiXzdUBbohNGeGdGdgjrWt1DDWGFhDsH
         t7grUknwpqEJKiWVDn+OXn+fXE4215PL9yOkwd0RAFaBhGH2xAHzMKFbu2JyZ2AGRRz6
         OlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544063; x=1795148863;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddDWPbeZ30rBGVuXwO4qlxfXVwbuSPzUuAr284nFCLY=;
        b=ye4mQKWg6/d+Pu3gSFeDa8tcMXi636Dv7wutj1ZjbXRB0drZQz6sK3vGroSKVNJhIs
         qIIBEUq1QN8fqzTaDBwTUnEzRP5SRFJu4FM3CcoB1awfScNZCyXQAueH6cyFUWxddnMY
         Bxn3ubBL3h3ZUxOxWnbNrgEJMd6FNpWMvu8Ac58kGJ09+RymVpfMIt5qjXWwYhwaIPYe
         9qMeRkyxt25RSnGM+RhNjviTnT5jOEgQCoOeBZ6ym/f88CopxQYmUHnkCclC/S8s77Y6
         uJRSHEQd/Ox6tBjrumlFzJAuCqodlI5sSjxcAe3R4R+YRZ3A1xNXQJcYPs9eVXjaZ+EP
         2rUg==
X-Forwarded-Encrypted: i=1; AL+hErFQOKT4ccx7HS7mq36E0yfQx+z8TXB8Fh9hmD3LlccDpHrLpfIXomyvgunzjj1YQkmEDFsk8pMhyCtqJYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z86TQ9eQ662hG3w3rV2bOu9aktvoV+iy1RJUUP9r6poGpFDZMQQ
	2TnvecyG8Qh7L65wyTEBhpZqWnNQwgcthFHA11unqFqpAdzBdzj8G5Sr
X-Gm-Gg: AYBFou1Vo6YbGmOfcboMo7peNxUcl9JC9438hv+Im0EYeYBnI8PQnDOSISeU/BuAdbd
	uKq+rT0ZPVkbYNJ3mYIVQ+ZQTe5VH4gZkj2UxNKd2mkauz7wuO9hvgp3lqSpETlSbjlRnfBgKA3
	Nma7ldhrQgdCn0AZKaD8ejzgn+ZlngjP1RlN1QpgjryNErVCglw/etFABNLYYUPMeAIv3VP57U6
	FX3X5oP7swwJX2kLPZf/66OZZ+OAgZQm5aFOn9YYiQJPM+E/YvBLmlwSZ32KSlH/kO9YdBy5wt9
	nQoK43yynhqPHPAwHJPjqC6QyctLyQGkxZb5C4QiyyDXJjOuSbzkaW9sQM0XsfPfuCXwoQJRpYJ
	xJAzIsmO8ZxnS2d4geg3XySbFRRUuGabzUbya10g0PmXb2e2scjhyhWcrrqKn2IaRti7BJygMzG
	PVxFh5Z3U8G6m642q+T41msdkHdUzE4yJKD17Bxt/1yWT73q0NDO24v+VqRYpVqEmOyG2PzAXxz
	wSs2jKCF42oVItKQJpgOXYEjckrPEckGRIqsCgH/n331qdYsjUcU4NQmTjVWvTulLdYpfTVXVOq
	wTzO1sAhKeLwPf3X9ddbVSOr1vEA060IIXGq1XXDOjyTNtMm/b0yZaqU3u/vsJLSn8NvqTRbnbq
	ice5m9eboCRZgkxavEhNq7Ye5C8rFXDJVQg==
X-Received: by 2002:a17:90b:4d0b:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b1b0a48f95mr999049a91.46.1794544063053;
        Thu, 12 Nov 2026 20:27:43 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm4061385ad.46.2026.11.12.20.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:27:42 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 04:27:41 +0000
Message-Id: <DMTSS10JMVNJ.VGHU9E75OZ5@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Test that a drained task_vma
 iterator keeps returning NULL
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kang Chen" <k.chen@smail.nju.edu.cn>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
In-Reply-To: <20261113024500.922824-2-k.chen@smail.nju.edu.cn>
References: <20261113024500.922824-1-k.chen@smail.nju.edu.cn> <20261113024500.922824-2-k.chen@smail.nju.edu.cn>
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

On Thu, Nov 12, 2026 at 06:45 PM Kang Chen <k.chen@smail.nju.edu.cn> wrote:
> +		addr = (void *)(unsigned long)skel->bss->last_end;
> +		ctx->addr = mmap(addr, getpagesize(), PROT_READ | PROT_WRITE,
> +				 MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE,
> +				 -1, 0);

This mmap() fails when the test runs after attach_probe in the same
test_progs process.

You didn't even test your AI slop :(

    test_task_vma_iter_next_after_drain:FAIL:mmap new VMA unexpected error: 12 (errno 95)

I'm tossing all of your patches out.
Submit them all as one patch series and they better be tested this time.

pw-bot: cr
