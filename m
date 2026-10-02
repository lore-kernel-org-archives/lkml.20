Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C84F472F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957887; cv=none; b=PAeS0sHEnqeapRJa28H0u0g5hQht45HsD8um1fz4s5GkIZILEe3o4zGY+/KbGul/k44/+Cr4dg+zf5l9XfhUuw/ZEGS4xtKbHgYuS8qgfadRe/lshXMkDOX70t60jxWMo2594X1GkWD9jAWJORldi8WcMxe56sUTHJitqpBkJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957887; c=relaxed/simple;
	bh=RARzgOAd1+9fsFLy4Hz4iobRMUtC/im8jh9JoDGxPC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkAC9uMxeRfB5ClIYjiClwGhZ6HvOim+R/TOV7wmXFDMLCtXuGsHcFjIkE5j6d/XWB6fZwJkiWygRamTQXtLyeBdxtK3aARZuLZ1+qIPbyLHJbXGbHyMWyDKyeGUNoE4bJhY4V2DOIrd0sh/m0H5++z29XZoZf4SCzylNZq8NU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkvYoF8n; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkvYoF8n"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso8360402c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957885; x=1791562685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJzj3UJHIC23fa9yBSqokKxP7nnZfefuPAvJHZmQ5n0=;
        b=pkvYoF8n0TU6/AKITGLJkaOJpmhmD0PaD4xA/cgdM9XhsjCsoY5u/IfLjBF6KY4Gtl
         uL3OKvdE4GC24onKajdvBffQEHG1T+RCBcl7YRNDGMreRWd62TLP7W69J8dMGK+kswLe
         3YR3VF7Q885j9oZ0fcpNJf++UWr8C1DBUNBpuHeXdon9iA7zlNKo2tTgBSV2DE8Otkj1
         lKB3Vbr6GrbyvMGbVASyiZw9JV1hlehNMCDpZO6Ex7PMsQBycy+gPKzx5tCzNo9vyvTc
         3oWxT6Xz+P+Xvs+SKwQpfYTB4JGxoMG9T97TV3QMRtiKuKa/pCtajjake/JaRZ5j2vTW
         c4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957885; x=1791562685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJzj3UJHIC23fa9yBSqokKxP7nnZfefuPAvJHZmQ5n0=;
        b=Bxhar2zANORX2/I40OW69JFALSdBMVFLvgySOcK4MiNXflgo9mYO4Kgu4bhlsHXAm/
         tezF43p2YlgXg64DvB4KoiEo1yWVdOiHZbIL3XeW5+cnm5mk3CBL4wHwsI/+90CsoXn5
         l8dOmLxwt7hJWHyEXfy77LY06IWkCpGRxrypcePHG0Ir9aXuh8tcpDyO45gHxpAJdvgt
         kH1L1Qff5Z2AiDfirndLLdSaqHjpedAXS/msAdmL/2KTQp+rmeVFgUIfhDdULpZJLkfn
         fW4oZxHMJS7yYcOFaLpmPUP1su7lITcOIk4NNzv9f57BIxOO/v0XAgNmm4bytK8bWQbs
         8aZg==
X-Forwarded-Encrypted: i=1; AKwUvBzRv8B30/cxGA6wHK/jbfESggR7FMaSqkrnVnJ2bb+rVjzUa4JzvnagUBp2PmkFrd3RoKVZydP19VIAkIY=@vger.kernel.org
X-Gm-Message-State: AFuF++n0k//GC7+teM1dYneyinCEinZnPVqYGTm4m42yiIseNlA5/UyG
	JshSqrbswURXYIlSvSQFAkEDQi8O5O8mewKtuPa3O9LLraL/QRptnByV
X-Gm-Gg: AYBFou2lwdLnjWRYmWc2uJEbmQuk11dhm3s7KIVAiNoT5KA43xo+ZQ+LlcepjajOH/u
	ynjwZAhcQ/HMiYpTt4uGOJKnrRNZ7thTEspfzIZkgnlEQAytDG1/uJfULmcS6gP2J9joIbwT2bR
	z7M70qnUWAuJSyL6pod7MH807465ULLR3LlrzzvqzoJ2GwAgucr31JRqnLg/ZYw/7vtZAETqiMo
	NF6FD17FPbNg3of08XvMFFnNZ76nKju0+BtCvbUE1ttTnIVueXbkauONxpzaTdzCU7SLHc4dB06
	b6FaVxIyeHs5M70w5MtyimHpvLrcAglgkOQ0ZuTz4eaED0VwCjZMTtAImute+Q/2a7qZbjGqFIp
	dHuIemi5OtqNQCLdBaXkLm5dmSMsbp71j4wn2ERnQdYvxj4OGD1apbvRxjb0NWFP2EXh+I4E3lY
	ldxtWElW+becxlrvzG7j2uQDFXOar94UR6TbDQCcPRK32OyNjadlZnwfUtHbZ+oA==
X-Received: by 2002:a05:701b:42c3:20b0:147:5149:d12d with SMTP id a92af1059eb24-14f5b70fdcamr3720638c88.18.1790957883694;
        Fri, 02 Oct 2026 09:18:03 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f468c08absm6985681c88.8.2026.10.02.09.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:18:03 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	brendan.jackman@linux.dev,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	odys.yuan@gmail.com,
	qi.zheng@linux.dev,
	rostedt@goodmis.org,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	surenb@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	yuanchu@google.com,
	ziy@nvidia.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/compaction: stop repeating failed async compaction on every THP fault
Date: Sat,  3 Oct 2026 00:17:44 +0800
Message-ID: <20261002161744.859093-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar-8Vkchzn4QobA6@gremlin>
References: <ar-8Vkchzn4QobA6@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

Thanks for your review. I would like to respond to your points,
quoting your mail below.

> NAK.

I understand your right to NAK as a maintainer. I am not asking
you to withdraw it automatically. I am clarifying the facts.

> This series is buggy, and has triggered my AI detection script.

If there are real bugs, I will fix them. But an AI-detection
script finding bugs is not proof that the code was generated by
an LLM. Automated review tools commonly find bugs in complex
kernel code. The dhm series has been in development for a long
time and has gone through several versions; the dynamic core
isolation design touches many kernel subsystems, so bugs found
by automated review are not surprising.

> It is kernel policy that you must disclose this with an
> Assisted-by tag like:
>
> Assisted-by: LLM

I agree with this policy. I did not use an LLM to generate the
patch code, but I used GLM to help run test data. I will disclose
the GLM use; if an Assisted-by tag is required, I will add it.
If I ever use an LLM to generate code, I will disclose that as
well.

> It is also kernel policy that you must fully understand and take
> responsibility for every patch that you send.

I understand and take full responsibility for every patch I send.

> The script noted:
>
> - Output rate: since 09-28 he has sent KVM SMM CR3/Hyper-V,
>   ext4+jbd2+quota "shrinker scan budget accounting" (the same fix
>   applied to three shrinkers; jbd2 went v1->v5 in 3 days and v1->v3
>   in 3 hours), blk-mq SRCU tag sets, a blk-mq sync-run, ublk x2,
>   a 4-patch bpf-next verifier rework, mm/migrate move_pages (v2
>   sent 10h after v1) and this series. That is ~9 unrelated deep
>   areas in 4 days from someone with 4 commits.

I respect this guidance. I do not often have time to send
patches to the community; work keeps me busy. I am not spamming.
I only recently had time to send work that has been in progress
for months:

- The dhm series has been developed for a long time and has gone
  through several versions. The dynamic core isolation design
  touches many kernel subsystems, so bugs found by automated
  review are common.
- The bpf series is something I started while optimizing bpf
  earlier but did not have time to finish. Similar work was
  attempted in 2019, it is complex and not easy to write, and
  this has been pending for more than 9 months.
- The KVM SMM CR3/Hyper-V fix comes from a real problem I hit
  using Win11 WSL2 + virt-manager. I fixed it internally a long
  time ago but did not push it upstream. I only sent it after
  finding Win11 still had not fixed it.
- I have been working on storage for the past few months. The
  ext4+jbd2+quota changes are the same logic in three places;
  once one was found, fixing the others followed naturally, as
  documented in kernel docs. The v1 of those three small patches
  already received Reviewed-by tags; I only made small changes
  and added test data after a reviewer raised a different
  opinion.
- blk-mq, ublk, mm/migrate, and mm/compaction are performance
  issues I found while working on heterogeneous KV-cache AI
  optimization over the past months, using perf, ftrace, bpf,
  etc.

> Given you sent your first mail on 21st September and have since
> been spamming complicated series across multiple different
> domains, I'm absolutely not confident that you have any
> understanding of this.

I am not spamming. I only recently had time to send work that
has been in progress for months. The areas are not unrelated
from my side: they come from storage, virtualization, BPF, and
heterogeneous KV-cache AI optimization work.

> It also noted that you had a previous email, realwujing@gmail.com,
> which you have silent switched from, which also bore the
> hallmarks of AI slop.

realwujing@gmail.com was an old personal email address. I no
longer want to use it, so I switched to odys.yuan@gmail.com.
There was no intent to hide anything; it is simply an email
change.

> It also found several glaring flaws with your series, so it's
> clearly not upstreamable.

If there are concrete flaws, please point them out, or I will go
through the Sashiko findings one by one and fix them.

Thanks,
Qiliang
