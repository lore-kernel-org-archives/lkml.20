Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA102335BBB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500772; cv=none; b=D1GIxaSkV2PU+WNSwgPRJ4+NJTp+6Kco1XmHmhYquPYv8wqUtL8jTqZK897dceFVgcBAt2ejTf7g591k+htFKFg+p53qBGNwcD5u5Pz0IEXrQ3MTpUhWQBXN7JzhYu1ka4ao2p07wiHaesr9HwJPBdJ7gxRndPoDsqsbn0pq+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500772; c=relaxed/simple;
	bh=+p9muWoFiyM9sOBvVa06eGraG+/N0W0Tuk17+ALO2TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq7hiFL3I+n5UQxWe8Mkdzag7enkQmsBWurAL/n+tUvJZj2Jg92w1p1wM6GcieST/nV3nUxG/EK46BroJvL1LSQINpOvyMf5znALGa8l6+QAvAFXyyWwy0rjV0t+wM6mlhxcK3xD1CHva+ktJ6SUb+J+5Bz6GOzvwtGLVeNE3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Er+bNteN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er+bNteN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbee846deecso1007810a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788500770; x=1789105570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk539GniTdCZ8Wj9Su5lzhCLfBhK51JlU0xrDVWOeAs=;
        b=Er+bNteNI+1quJAkkegTQyKHx9QlJ7gMwsEw0otX/w8myHnKU0HT5JjQaAsxrAaSrQ
         0zNaVmzgtqS2opww8CE1d6xfctLyxcqArLz4GLDqu+mga4eKtt7616VUCYJjTuaqOIy+
         vVrt727nuzbCg/fREvqfPaqXfMvwUUltpeiaeIp6t24/yaUoemzl7b3U+H8fGvDjiypa
         oDnI1Le75rmTQ9VMHUm2iDhQH9qKzclH0/bI7r0z53fM6/QpkqE/XcoagdzFeRPLrehU
         X+LiOCgabsvbBaS+qlpW0qH/4EUfPS7CCHqHabbYrmYbaaAD1qhYeaDp+TiCtFSagF+O
         OCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500770; x=1789105570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk539GniTdCZ8Wj9Su5lzhCLfBhK51JlU0xrDVWOeAs=;
        b=iv6yHGR5PU9m5JUsSf2YdkuVHWP2VFVXkHutwFWP1fsNg1wZcq6SnQXkN+6elqclzI
         XY2x9vi4wZPVcLejfBcC0/5esr7aTDs5go5jPTIJiD7wkrZmQ40KvyBR+9amhgJbgGO8
         +O6KLWymqaBYb0T4S7Wagv8gcntDUPoHdQq9nUsUOCCfkc/wNbOyNxM243jjTFdCxz+1
         AzU0LKePi30hYmLg00E5zt/H9w5LWqBeMxIxdieCTI0YZKbzJyX0Rg6OkSCz+27fRT7D
         9Lgm/jA+IczVPmT/BI3B2KwHB3fDKqTzwvPl6EZlP7SD/rKDwncBwnlCC1G2SxPcfSkn
         GJdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/8E6WhawyUdIOGBHrt8R9TDonmsQC09Pv776WKD/i/Un4UP3C/v9qt5V7M2OC/3RKwjWPPW4yFM94CHY=@vger.kernel.org
X-Gm-Message-State: AFuF++kpql5iUfOhfrtrC7X5Vkj1RIZMr5H1PhG4D4HOEjpnf/Qa59v0
	d9a6Mvctq60eRKZo54yxYiFLyw8Io7MQlCT+OdquQeFMHqFHCCG5rvvut0mO0+L9
X-Gm-Gg: AYBFou2CfSIm7qpXxsIjbBq8PRdvk3B7XCoDprIOcobklgQnE6ufARkMoQn7wBKaLT7
	fWPwqO7xZbXU84duOkdPanpNQWL4OW3GRJ8YLJ8D/lTvozSpoZ2RIkO8A7xzsAv+1ZiBfMNva0b
	4R+IJvOZvRwNA041ZhlZAUZkgQdH5KMJ5Qu6VZJw0To4eUYuKJfVHYhOA35KitOstShXAy87SGJ
	tpeUnqWXz/sSE6KFMzQidj+srYn1jpq126gEplMGSz4Ru1FJUqXNgwVTw59wY0SPgnSVOf7icXh
	Ytzo+qJ2Qe5nqhSpOpo1FiWUBWokedkuldlax7Bp2Mk97t7fw4pe6pGaNscjqQ4Ym/I7H4mjRz3
	iedZUohgGxjRXfnekW8PombR2nnOziNEnet+Hmk2rm9nl28n9SIK2KLZdDFu2DeJ2veXzHq65vN
	d800ZxMD+Pk4h+m4ypdlRRPt984oCiewzF9Y6pPNNyu7qzP0es9DaF+SZhQvcfL2+rG86CGWAqS
	WpE5TJQTM//zVQAGG+Gbq72FZaOX2+Yahh6HHn6f5mTNp8Ycw8AKPaQpJA=
X-Received: by 2002:a05:6a20:2d20:b0:3d3:ae50:97cd with SMTP id adf61e73a8af0-3da3a217583mr5400981637.26.1788500769794;
        Thu, 03 Sep 2026 22:46:09 -0700 (PDT)
Received: from localhost.localdomain ([240e:46e:1a00:17c3:cd45:a98c:4d40:1db8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455158babsm458700a12.4.2026.09.03.22.46.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 22:46:09 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: jinkehan@didiglobal.com
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	mhiramat@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rppt@kernel.org,
	tglx@kernel.org,
	x86@kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH] x86/kprobe: Fix crash when probe cs call
Date: Fri,  4 Sep 2026 13:45:48 +0800
Message-ID: <20260904054549.98217-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260827025756.GA26653@didi-ThinkCentre-M920t-N000>
References: <20260827025756.GA26653@didi-ThinkCentre-M920t-N000>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 at 10:57 AM Jinke Han <jinkehan@didiglobal.com> wrote:
> When I used eBPF to probe the call instructions within a function,
> we encountered a kernel crash.
>
> The ebpf tool probes the 257 offset of the __hrtimer_run_queues
> function.
>
> <__hrtimer_run_queues+249>:  nopl   0x0(%rax,%rax,1)
> <__hrtimer_run_queues+254>:  mov    %r14,%rdi
> <__hrtimer_run_queues+257>:  cs call <__x86_indirect_thunk_r12>
> <__hrtimer_run_queues+263>:  mov    %eax,%r12d
> <__hrtimer_run_queues+266>:  xchg   %ax,%ax
> <__hrtimer_run_queues+268>:  mov    %r13,%rdi
>
> The scene of kernel crash is as follows:
>
> [73665.737181] BUG: unable to handle page fault for address: 00000000000f41c9
> [73665.744253] #PF: supervisor write access in kernel mode
> [73665.749643] #PF: error_code(0x0002) - not-present page
> [73665.754843] PGD 0 P4D 0
> [73665.757390] Oops: 0002 [#1] SMP NOPTI
> [73665.761073] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: P
> [73665.782671] RIP: 0010:__hrtimer_run_queues+0x106/0x230
> 
> Note that __hrtimer_run_queues+0x106 is __hrtimer_run_queues+262, which is
> at the 6th byte of the above cs call instruction. Since the cs call
> instruction occupies 6 bytes, the exception occurred in the middle of that
> call instruction.
>
> The root cause is that when using eBPF tools to probe in the middle of a
> function, kprobe with int3 is used as the underlying implementation.
> During single-step emulation of the original call instruction,
> int3_emulate_call assumes that the probed call instruction is 5 bytes
> long. However, the actual CS-prefixed call instruction occupies 6 bytes,
> so it constructs an incorrect exception return address. When the CPU
> returns from the kprobe handler, the next instruction to be executed is at
> the address of the last byte of that CS call instruction. Coincidentally,
> starting from that address, the CPU fetches and decodes a completely
> different instruction, which ultimately triggers a kernel crash.
>
> Fix the issue by using the actual instruction length obtained from
> the instruction decoder when constructing the exception return
> address, rather than relying on the hardcoded CALL_INSN_SIZE macro.
>
> Cc: stable@kernel.org
> Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")
> Signed-off-by: Jinke Han <jinkehan@didiglobal.com>

LGTM
Acked-by: Yafang Shao <laoar.shao@gmail.com>
