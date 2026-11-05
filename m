Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895841;
	b=W0dDVpT89bVDInPIpiMQDXEuL3yIMDu6uyP/JAXE8pmu9MDCz3S7hPX+p0k0uofJxEgj
	 oMMwlGeiQJ8s4ty07IC3t5l01M0ClxQ81GvSLYf95UMvmL7WI+Q538cQVnKRs0wNfTMGE
	 Vp5c8meqY7oL4WklPdhEoAPpua0VL7XN63GOhZLzykkSZ5QM7u6tlvuBp1oMZsKAlEuyJ
	 QzS7OsKDQPJNOQucVUMBzw+5W3khhjh3ZWhG9D2+Tg8TTCCLDCI3fvRZDe9T8ORFU9hEw
	 UUr6LjI+fJcG40OAg1+RpaL3BVPIME0NSEuksHGGRkZSbjUJqPSsb7yTE1YayEdDFnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=vEatsYln1JH/NSaGPfeQTStpuozS299aWgZQYhTiFGE=;
	b=HEYfBprFgMrSATbiDUmXv844SSDOfVpMp+4vMUePl/ExtoxWSrhFgOWn5wl/KATovH6f
	 jx2x7pHVxrBOD/m+Px2CDeygPsa/GuwOBp+z0s6USkcEuqgYr6klOVvDDfjG7sBLm9B1r
	 Jf08gES+xCA+W30xIj446wG8QCDkp9Lu8NS/5/YEQb0adVcpNsCjzOfXqD6+m/fcCrIKU
	 QNf6GkMeAkU/qQ6KVUHKUxkytyw4ohl0M5YdV5S8EHRauewbP9CeXYYXT+XJ+I8mQPgRl
	 baiVCvS8Q2fVXGxarxG4BZKqJ2sbopzOj9u4YkFBWyIvGt2w0mKTgf2Gx6x+HndVLww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyvtEmvN;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5E3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyvtEmvN
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89ff475a152so932752b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895840; x=1794500640; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEatsYln1JH/NSaGPfeQTStpuozS299aWgZQYhTiFGE=;
        b=PyvtEmvNdSkVSX4+M670yPyZ0FpkwbJzhNSx86sdw0LY9UKFfNGKwR16qRtIVxG7KU
         +K7ZAFPFHZMb6Ug4SzX6sLU14GHBrHiokhbIGwYxyv+pRVS9uWq8gryicZf3Ghb0B/Fu
         uZ1zSk4KPQF+EqnGb03/gq+m1jVZmXKyrHZ9MBZ9cZN7Nj4opqc0fbn674Iw6vHAYLen
         FsmqRJb0zQtj3x3Swgqqv6kuArjPswccWiwQ2FDdzj6LFMwF/LALamGNGiDis4Wm3u+A
         q+FnPotYcyzFg52pDqAektvxWWJQy49sPEgvJ40aiZE/D8nHGeZKVrmHVRvDeseCPfUc
         /EJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895840; x=1794500640;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEatsYln1JH/NSaGPfeQTStpuozS299aWgZQYhTiFGE=;
        b=LWmAvfdyiGAgo1dMG1xzqrUm3hhEE6iNy0IeUucKqUSKzbADZAVsj3DHB+Cpjt1SsK
         IMDScov4r8HIHXSaOm72RNyYzFy8sIK9332GDr+hY1VWytkJprIP6Rk2Wzxcm/45ThHH
         7Rni10xKzwOn6iwk5tVdVOlvMWU1n2GvVN1LQatP1a+rvA5rmSwburyIvBw6AaPRCAAa
         /f/yLN4my92u1Pd5P0lhmVYJYauwmSO5MWQD+F+Vv/UdBGj1ChQJqQzhGVETY/kIy5lu
         C5HjQKd0oWdBplyRIq+EQaSAWQNTtQeJNMp0QQOqBBpvdVM2wy97U1YRTn7EHUKZNmyi
         16Wg==
X-Forwarded-Encrypted: i=1; AKwUvBym5HXSTZWkG7UQ+saEnB4vk91bLOwDAdKTWl3qMN0oN9kWfpLgNHj23qOph9BZuEHiQFq/Y49KHDtU1rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w9IvO8StjFrMUdIsgY/JynGZpkU8xwiKRHtPQWtN8CPCLNh8A
	WqJb/DPLIo6E3wP5gV+FLIpLzflNXHcER5gXzC+2dmTpVMS5o2cN5xJp
X-Gm-Gg: AYBFou35fRfsyUFlQPxbIfwwtP4pmOyCm31GswoYTVnNql1IvBxqdhWgDfKDQ5RZc05
	vHeISZV6WysYbbADcjrHjroE0yGcTQYGcdMp0KvSp51tie07BEjA9Q4JjYt4LwSDae5Aa6hpOlV
	mFVrC30W2LVSv9NUpouUdhA1ofbv6ccDwL17s8xAyyOIlZD0tGZWvmmHHIBD0o8Rl7WPwtdL4SN
	HnodUxHvYbkM8E4xiNPx9wLS72MwbkqYIhEaYW4EATbRzUOlHUx2SCcmMCQyVdxWiMnnQkKlNLf
	8Dw6gZp913QMc0jS2LieQ1yJftT9zQ0TautiMGMapcCxpzeANNL6Xdp/m39le3rE+vHyqpH0n63
	yNj5Wx1c+3FjYsUqwUcUpWhEbqFjidpBqPm4bmdCoay/k2bk3BYdEScy72+aTtWffje+rF3PbNB
	Qsa3ujHxmPNGzxPlASd0NESW84lSBXK10E0qhXptTV+Uji6s/iAPsR4y7z0YoNBQkDcHD3yuCxS
	oTlN14k7jK2sFIZ5Nr10renWfg7B/qsuwnnthxXzhv090lpGVcngnxKbZc6XFYYq5Vdhx4DlxuS
	GoEEbURtrfEVsVDABY1vpJiXH8ytUQgRc4HHkrszbWlUq6qVbjR/uI8NQOgXOpTSs7Y9HDVB+k+
	6BCeRqiuFGpwniNRRwB9JWXnbuXs2uK8wCNKeY8PUyFokv9mYUOc4qnVxRw==
X-Received: by 2002:a05:6a00:1911:b0:874:705d:f649 with SMTP id d2e1a72fcca58-8a9bf90a9a8mr16161273b3a.43.1793895839850;
        Thu, 05 Nov 2026 08:23:59 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe12f6sm2215796b3a.4.2026.11.05.08.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:23:59 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:23:58 +0000
Message-Id: <DMNF03AQLNXY.27PRD8XBEYX77@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, "Zi Yan" <ziy@nvidia.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Dev Jain" <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance
 Yang" <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Kiryl
 Shutsemau" <kas@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman
 Long" <longman@redhat.com>, "Suren Baghdasaryan" <surenb@google.com>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH 4/5] mm: add and use mmap_read_lock[_killable]_nosteal()
 on contention
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <3a77219e-39e5-4e98-8f88-6f90bccf69f0@kernel.org>
References: <20261103-khugepaged-latency-fix-v1-0-a07ab16ac860@kernel.org> <20261103-khugepaged-latency-fix-v1-4-a07ab16ac860@kernel.org> <3a77219e-39e5-4e98-8f88-6f90bccf69f0@kernel.org>
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

On Thu, Nov 05, 2026 at 02:16 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> On 11/3/26 09:27, Lorenzo Stoakes (ARM) wrote:
>> With down_read[_killable]_nosteal() available, it becomes possible to
>> release the mmap read lock in such a way that a queued write lock always
>> takes precedence.
>>
>> Expose this to mm through two new wrappers - mmap_read_lock_nosteal() and
>> mmap_read_lock_killable_nosteal().
>>
>> Make use of this in scenarios where the mmap read lock is dropped
>> explicitly for the purposes of relieving mmap_lock contention - the BPF
>> task VMA iterator, and lock_next_vma_under_mmap_lock(), which is where
>> /proc/$pid/smaps_rollup re-acquires the mmap lock after dropping it on
>> contention and falling back from per-VMA locking.
>>
>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> ---
>>  include/linux/mmap_lock.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>  kernel/bpf/task_iter.c    |  2 +-
>
>
> I'd appreciate an ack from BPF folks and a confirmation that I could take this
> through my tree :)

Sure. Pls take it through your tree.
No conflicts with bpf and bpf-next.

Acked-by: Alexei Starovoitov <ast@kernel.org>
