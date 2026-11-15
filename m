Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723832;
	b=NLk51I+ILXcoZ6fN3nGjj6tpjGkurrRb4s0pkYK9rZSElsk1HmLJqOTJmWBra7CuPzP4
	 kdjnId8Se1ZIwztDo42jgn2NaSF62sGkkPeHat96kyuDL/i475E8tJni1tsUMxXyLrLd3
	 aPO79SR18AoIPcdu9JZTh+Wqk3OaF/zmD+M5tNd6StLCqVm5ACax8feUdvRtN6crdHLbK
	 Cmb7o8EcuJSB7hPvN1hcdayn9JnTgtNOXalkOlNUNlRLU7yer+MCtAj+ybnEIVNMyOUdG
	 t4bO9wl/DVv8KTGLIPjlesJugUASbb/JZl1U9YiF3g4doz+K8I35UxBPrmRxqmXG85w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=bjlulku/2dq10AOxE1AaqZxjwCs9790A4Bi3utPP5NY=;
	b=J9upcqK8WZFRYev/7e5p7Jr+7t1y3AVSesz9yMe76vxsAy1JDAXeixE1GNZDsM5mA6n0
	 WESt8NKSPIgE7wHw2pRTt4981gG/RCB/s/x3WbzWWIB5gLqRxvcO+EWUPx0WMc9Qczisn
	 /AI2hkY6Mx3alFqxU5Nj2ZnB5VNUP5UtOEzzy06wDjhXPFbn+iKEj/pRZ74H8aTFAUmOr
	 8LGWCuk8DHTjQqnn1jxidtvJ+ZSfxwsh/OeMLVZmSu3iwVjKvf7IGlh2SkzotY/hP4mhl
	 hAULCwuH708cjUE4BWnemTHIkvcTl8HwUezMO7L/dOWpigtbNbR0HObAO/8vAfVYsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bV0J03Wt;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BB606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=bV0J03Wt
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37d424f1ae8so799903eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794723831; x=1795328631; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bjlulku/2dq10AOxE1AaqZxjwCs9790A4Bi3utPP5NY=;
        b=bV0J03WtsVAQmjrKBj37w00fDQYNg3toNRRrkfrzyPQZLW5lWl4La+0YgI8UXuW5Ya
         avJvgcqKEPsHMeG8zpmHkg499rCIxRHTTiDdcwiZf2kNrd2iYvRf2u8eDohkwHAR9uU7
         TppgwxcfbDXQwElAIV6GgkrWwMFWt3Z3URKjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723831; x=1795328631;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bjlulku/2dq10AOxE1AaqZxjwCs9790A4Bi3utPP5NY=;
        b=nJA5XbfVTrHUEegt9HIiV4/HPCPdaFUo+CzMq+Flu3NYcUuiBchuFySKfmU53Bx6sT
         Yb2fehHuCun57ujgnsSyPxJtrCrqN8ogM089SL5kERC7Lml2rvGA269gTKk8wiyQFO9M
         GESw2NbpprF//fL+KvwW6Cebnyt1Qfj7bOPjYCjDbnRnFeHTsXcmaDZzi73cyxPcwm1u
         FAtgAi8Qb42352hTxw8aaGp9ICt36JMZKbibbAAsnCTOI2gSynHMPh35fsAoX+db/i7U
         NzH9nLBlLk1KRxVQdtv9UYv1xWrnnUE4KyRsjc/vtMMsaEiCQx61OXgF+cb/m/GkZHr5
         w9Tw==
X-Forwarded-Encrypted: i=1; AL+hErHNeqCoU0h7bfOwtknCvC5rEvQlRj364ekdN2pzKnyE6uFCV/TKu449G9/tC3lZmWGBF0seKy5SiU/GEHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98LTpUsXH7aSZ0+Hs5sKJSfDQmSSxNDcc0emz6eMXwB8156/9a
	qPrFrRl5iQ0VY/6ajZ30N1GycwXBHA0fTVCoV4bfQK6BBBgywwYPnEYiYFUvx+nXYK4=
X-Gm-Gg: AYBFou14bFmeGQdZ31xSB25Z7nDOdg6knP4xc83YjVNNsp12BkybsMzdJ8MO/+7uha6
	qvPHM0is7rPGMZJOC/EsSaKcD0kJdEz3RbL3GK38r8xzrpGkTwE1nLqRIH3KkcSm+8YVTqfBJi2
	S/4rs4pXDSf06hv0FK/2ba0RqN7EAAB4ISMRDqPUPmCJShe2XwFtPSQ2j1xMgvgbnfMGKYxtvOB
	RNregq1ZJ9YVAD15MpTrg2KS/zKM4hzouDjOo3469SvNSEGhTXDBzlltCTr/DZodQsiz/E/ZPLU
	ITyxICX8sHS27rf0F1nDCjaU2jvadQN3fMxTo0ncMdOaKl+HAkaGF3DYcLNepFCNvzbv+6vKzZB
	vVLsfT+snZD2gGxiwr9W/3VQVyJcZBzsswE+WKl6b3UcfMHRwj6pGjC9SM1dgeeQXV5k8BpN6LZ
	Pif/SMZaVF5ouAHQ8115nEOoHaRY9Uesk9MBgnY7xIjTGtzXv38rHT83J2Dj9ONf5wjzDvF9Gbz
	xyeO4pnOBFZJQwWYUYNJdUuz/+hAheWXXWuWuIJMpY/bPlTWbMvr9+DA80YpCwaDKGbDs7A3syU
	GrnsYnIzP/Uj5ndeHcqrCjaivtyKzrJa6/APUsv2van7YHbJP8yyA0sVA617VnP8/I5ZvyutHbb
	HMYu7uggOPn3qKpfhDM9G5ZwPkdQ5Ep4mvqGhNCFCV6wvbZp5g2Tt/minnhHZKc/cEKY+Y+3yuE
	gwSZkna+06q2XZR2mPfUoWTe+/ef086UghXmfJeCJuYQ/D5vqI42edruCsgTFizTEtxSAAZ1q+Q
	5ncLWL58e3K5To=
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr4316528eec.9.1794723831472;
        Sat, 14 Nov 2026 22:23:51 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm20719709c88.12.2026.11.14.22.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:23:50 -0800 (PST)
Date: Sat, 14 Nov 2026 22:23:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Sang-Heon Jeon <ekffu200098@gmail.com>,
	Mostafa Saleh <smostafa@google.com>, Ketan <ketan.kishore@oss.qualcomm.com>,
	Usama Arif <usama.arif@bytedance.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] kmsan: fix metadata loss during HugeTLB struct page
	reinitialization
In-Reply-To: <20261114104150.58424-4-songmuchun@bytedance.com>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
	<20261114104150.58424-4-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114222347.227199839f5ffa44@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

I can reproduce the crash and the series fixes it, and I think page_ext is
the right place for these pointers. I do have a few comments, though.

Muchun Song writes:
>-	struct page *kmsan_shadow;
>-	struct page *kmsan_origin;

This takes struct page from 80 bytes to 64 on a KMSAN kernel, which means
that hugetlb_vmemmap_optimizable_size() no longer returns 0 and HVO can be
used there for the first time. From a quick check with
hugetlb_free_vmemmap=on it seems to work, but nobody would guess that from
the subject, so I think the changelog should mention it.

Documentation/dev-tools/kmsan.rst also still describes the two pointers as
members of struct page, under "Metadata allocation", so that needs
updating as well.

>+ifdef CONFIG_KMSAN
>+KMSAN_SANITIZE_page_ext.o	:= n
>+KCOV_INSTRUMENT_page_ext.o	:= n
>+UBSAN_SANITIZE_page_ext.o	:= n
>+CFLAGS_page_ext.o		+= -DDISABLE_BRANCH_PROFILING
>+CFLAGS_REMOVE_page_ext.o	= $(CC_FLAGS_FTRACE)
>+endif

This takes the instrumentation away from all of page_ext.c, when the only
thing that needs it is the lookup. page_ext_size is already visible in
page_ext.h for page_ext_next(), so I think page_ext_lookup_raw() could be
a static inline there instead. That way it gets compiled into
mm/kmsan/shadow.c with the right flags already and needs none of the
finagling above, and it saves a call on a very hot path as well.

>+	preempt_disable_notrace();
>+	page_ext = page_ext_lookup_raw(page_to_pfn(page));
>+	if (page_ext)
>+		meta = *(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops);
>+	preempt_enable_no_resched_notrace();

This is quite a lot more work than the two loads from struct page that it
replaces, and kmsan_get_shadow_origin_ptr() has to go through it twice
for every instrumented access to direct-mapped memory, because it calls
kmsan_get_metadata() once for the shadow and then again for the origin.
You might think that's a bit academic, but it does add up. For example, on
a 2 CPU VM, perf bench sched pipe -l 30000 goes from about 1.37s to about
1.58s with the series applied, perf bench syscall basic -l 300000 from
about 0.66s to about 0.75s, and a dd of 300000 blocks of 512 bytes from
/dev/zero to /dev/null from about 1.63s to about 1.90s.

1/3 says that keeping the pair together lets callers avoid duplicate
lookups, but the caller that matters most doesn't make use of that yet.
 From a quick hack that has kmsan_get_shadow_origin_ptr() look the page up
once and take both pointers from the result, the same three come out at
about 1.38s, 0.62s and 1.54s, which is no worse than before the series.
Could you do something like that here?

Thanks!

Chris
