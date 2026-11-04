Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785302;
	b=Kw8M/J0dRrQOhYyQF9AlfRaqCh3Ym/Aa7yGFsFYvKr6MdhBZQ2HufL3Y7QYdNKkj+k/r
	 FiSPc1lgS1uHmCDNPShmXGURZ08+9XkFQizhgmJQFgcpmqs1mXkwpVP308T2CwLkPIGKq
	 Yz3h2iV1yptAUZqbNzM7987GN3UaiyK3NVwfKFdNV300SWzFJl9GMlgln+CBhDjDlKt9M
	 HHlF6pXTbpxksvPvZJXOjmc2DMIPVM4URKkMDVa6XH3x0jUXHTyTPFAdIjYm8b9EYxY2U
	 S4KW3sbcLSZFNwkN7yRJ1W9X9yiTRGB9DyPZzW611lxja0o6qZTQaGEqxHcLIA0PxwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/c8hVYKhMMh7/DfCYh54Utq4oZ1iPTgNxmSL7+jkyU4=;
	b=3alWev1yTVmeu0qamVv7G+JcchvZ4qQJ8jlp6IcL/U9IFYajUuUxS3/wmWeoM5O0uM1Z
	 JM5mQsG6P4gz2Zalqkvk3m/3jSg9n1VbMcFgFpMpCu9GjADdK8hLeIA9zpJyOmYyVtpfR
	 8nQEQy9xjfbEAwwa8EqFCZzUyqywkjXtjCnyN+/TbE/wh4R8xlPS0HwyF2Qmfge56X6GB
	 aIwif3grI/M7x/j3tca01CK0wlcO7yRCUmAAFcViZ76Tt2fVXYe4RI3nC+GZSqXbYsW+5
	 9AcLjjcuDAVVI/v8ZgcM5bAAxgIIl+YNwxNepfI10/CUWTA7Fl9GgX+/0EPhujLrxaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlC0Kzjn;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDF606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DDF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlC0Kzjn
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b0a204584dso70008a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785301; x=1794390101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/c8hVYKhMMh7/DfCYh54Utq4oZ1iPTgNxmSL7+jkyU4=;
        b=dlC0Kzjn4x/4ck/LKqBSKOawR0L5q8emxyOfHW57AOCTJIlXGG3Y480B1VTLLTIRG+
         MSAm7RCas5i1enRqbN1amcUmsNL2j9L48ubMPExDQAKcBy6yabVaEWj1vc3CMXbqp+Td
         7/PiTKa5Ki3V1gtS9M6jU3tLDdobUsmgyH4qGrdoY99eoL5dGVor8Hx5GgRF659Kxtoh
         YjEWCzMT4wHqRMZz22pMU0+OZyjV67+MJ860ygDsC16orcRecyfZ+UY9jCBcd1yRnZ8/
         7dfwMX9dNIe9o/iafNdE2RwLoZfkTN4m1o0Hwqzw9jTcHJWTYZr63WEFnI2H5pYhiLty
         IKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785301; x=1794390101;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/c8hVYKhMMh7/DfCYh54Utq4oZ1iPTgNxmSL7+jkyU4=;
        b=OkpMKEyo+JuTL+jmVE8li0iJ3QDKLeECEBPwepYOKVfBO5f61JtDjmWXrjSbLQSdJy
         hk6fqiT5IzFQHp48mbd3s97cFxZxknfL1vYDVUOorOLJ1haaEBMeYPVnVNk2NhcrXayZ
         ygb0VFy3w2qXYOpFPdCliWu2WvB1678Kg0k38SV9/zdn8wp2Ei7+h1/xK+LzNOEVh3PO
         Zi/PTSorydS6f1zLR3dBrZo+QTvQrNx+C8zrBdoxKV0C9goAhbTxvHejwaEnWqiaY5Ol
         IZ9835KA2eFaN2DtyBU6y42Ov3x9DLLa+N/PIiT9aKCpm6BzoMBkCgejnDKdJdvEq8fI
         KNSA==
X-Forwarded-Encrypted: i=1; AKwUvBygpygElsT1cAOmarUAzTdn+KAWdW26LQ+LmnPkbMSBa2LVnCnu9XKq+nuGYMhf6bOxVw2rcnPITRbmYm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C3K0l+awIKf8SM0paVmb0TeLxgTLflkFH2pfmB2wkoXXgpgSQ
	o4cgG1/6TdurRLAbIJ5IAkiKFdTV1KaUiE+hOFmYiXWOtsnvZhOlzmQb
X-Gm-Gg: AYBFou15I/r/58gVL4qjywwZDx3FiSJT6XkFzRqUqjbS0n2XOZNQWgS9x4xL8iSgDjr
	jbM0fD5SxfdvcxlRsbgOwLVGdbrtwt0BEJgpCdphDBEtdkWa5Z7d4YpRyYV0c1xUfJHN6fVmI7H
	I6spUqHMIL/PK8p2ONc+qMu8uTyv5BJimWfpDboyVXN8a8D/zCT8/2Un9AY8zxjhA5JKM04zYTH
	flSpXhiz6ijXQz/pObzqctxg1hbeBJjOxrLhezO4fTI0Be5Jdx/AFGcbpfyEsiPsS4XxCAe4VS8
	X4NG7dAze6QaM/ADqvKyt5DmKcfGNlA/B366yFVoKemka6Dj0SJvHRMA8OtMeGRgb5BJwLv7j7L
	y4eVdDId6I7CmfVlE4IhEnC/Z4kT+p/xngr4drmNpc/CEQPi2TC/8gx536glld3HzarT0MEny1y
	s5WUkOoLi6Cfv1S2isKsh1whwDcBanjwMl+9YsHVXbxUIJbNKsZD3A4WX6CeTBdu8tu411KtugI
	rrrl6GMMr4sG7m3ATlu2cNKWD6HXM5SFttEd83m49q2JY4lJnZIVKs2/BLdLrVYxU48REc8duII
	KlDCcT+5LyNy2O0LOea5HUp7ihzEztzlibPnWGZ+s59enUEWbhdzrkcG
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr13058560a91.4.1793785300942;
        Wed, 04 Nov 2026 01:41:40 -0800 (PST)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm8661386a91.12.2026.11.04.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:41:39 -0800 (PST)
From: Qing Wang <wangqing7171@gmail.com>
To: xuhx@hust.edu.cn,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: mm/slub: has_pcs_used() reads remote per-CPU sheaf state from flush_all_cpus_locked() without synchronization (data race; KCSAN  blind spot: slub.o is uninstrumented)
Date: Wed,  4 Nov 2026 17:41:32 +0800
Message-Id: <20261104094132.2665206-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <363227fe.1d637.1a1a124c2b0.Coremail.xuhx@hust.edu.cn>
References: <363227fe.1d637.1a1a124c2b0.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 at 19:21, 徐晗翔 <xuhx@hust.edu.cn> wrote:
> flush_all_cpus_locked() calls has_pcs_used() for every CPU to decide
> which flush work to skip, reading each remote CPU's pcs->spare /
> pcs->rcu_free and dereferencing pcs->main->size -- all locklessly
> (mm/slub.c:4041-4051, inlined into flush_all_cpus_locked) -- while
> the owning CPU's alloc/free fast paths mutate exactly those fields
> under only the per-CPU sheaf lock (pcs->main->size++/--, the
> pcs->main pointer swap in __pcs_replace_empty_main, etc.).  The
> reader runs from kmem_cache_shrink() (sysfs shrink attribute, memory
> offline) and is, as far as I can enumerate, the only cross-CPU
> consumer of this state outside the sysfs slabinfo walkers (excluded
> -- they read other fields under a different protocol).  I verified
> the race with KCSAN after discovering why nobody has ever seen it
> reported: mm/Makefile sets KCSAN_SANITIZE_slub.o := n, so BOTH sides
> of this race are structurally invisible to KCSAN on any stock kernel
> (verified at the disassembly level: the four accesses in
> flush_all_cpus_locked compile to bare cmp/mov with zero __tsan
> calls).  On a diagnostic build that only flips that Makefile switch
> (no source change), a shrink+churn workload on a dedicated cache
> produces 436 reader-pair reports covering all five writer families,
> including an 8-byte pcs->main pointer swap with an explicit "value
> changed" line -- the snapshot prerequisite of the (extremely
> unlikely, source-argued) use-after-free chain: a stale pcs->main can
> outlive its sheaf's retirement (spare -> rcu_free -> call_rcu ->
> kfree) if the reader is preempted between load and dereference.  The
> practical impact of the race itself is a wrong skip decision in
> sfw->skip; the fix is to move the emptiness check into the target
> CPU's flush callback, where the state is local and locked.

You're right, there is a data race in has_pcs_used() reading the pcs
fields.  The possible consequences:

1. has_pcs_used() observes an empty pcs and sets sfw->skip, so the
   flush is skipped and the memory is not freed in time.
2. A very unlikely UAF: the reader loads pcs->main, and the old sheaf
   is freed before ->size is dereferenced.

For the fix: could we simply drop the has_pcs_used() check?  The cost
is some extra workqueue overhead — flush work would be queued even on
CPUs whose sheaves are empty.

--
Best regards,
Qing
