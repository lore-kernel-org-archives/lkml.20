Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792630398;
	b=mPuWV5Dz1l3VXq2wA0uD9ghFd495wHBXI6uuYaaqVHeVInWzv7ZHqBFHgMaogEr/Tawt
	 uOM5bqKaZigIkqBKI9aDJp+VKxXvz278Am0hW39Lfivsy/h3nWRPCQX0NKu71CVMK9Sjd
	 89cabcqBT3ntBGO/9Qo2krO1CToTxuaYZz6qm6WUjGjkMzNq8tbOfwrXtatWvHMUb4U3O
	 CCZJg2hU7fzw2iu1sDKA3HtbUmDR/Zz0GFWkO3hePvCodKLJYQwQnmoJ+b/MhqjJ/TwS8
	 jmJRSNRcsUSig+xJ5OGWRNfmbDKGWSpf2k50oz8EHgJ5GfMdAlSOd3LNBIslRZqimtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792630398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=nAnyIUkmbq6HJDHmZZfXywINd719pbGy8aLPkmBqx+Q=;
	b=N6FZx24yO2TFhsA3BMHVqAJ6HbLX+1ABgW2pNCMobvKHYmfv8Y/q73g0ncDfJr4FXTl7
	 hKTODIHZD3zXP9FToJZ0Lcc+thtAoIiH/KgP+6+0K0VWYWd2YBRjmqvJ4N74kTlpNslRN
	 LrSxYaYT8sCYavPEmTmFfZDpfEwlDZYwRzi7w1w+9ayFOU51Iwkw14xpcmnHlschSjvJE
	 A90ghgyyatGXdmAyev/0kx0X61sU3iJMsGLaa9s10eq6NY3UCmj6SdMrBJTUANeyW9rpv
	 3SsYZyKc7G9GLT1DPRw3jUWZOmL5yomSYWWNG4eJ06Z7ICdpuLK6Kb9vHknfDzoZqTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5U7ntPK;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B9606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20B9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5U7ntPK
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so837019a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792630397; x=1793235197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAnyIUkmbq6HJDHmZZfXywINd719pbGy8aLPkmBqx+Q=;
        b=K5U7ntPKD8UyQ/CrPTx7fpoOAKCFS/Qgji/9LLJ9yHCnBaqiWli+i4J/42KezggYAT
         LOkDj/aUFPyOm+5N95EYlkBeFq0fLt7oNgW4G93XOK+CEuJDBN4Po+EosKDsvDtvDluR
         u26RLijFTXnQXOO5pPR8Hvs6iUCw+1u0TShP3vcWMkZOPq5APMikRKAoki7chvIB6sG5
         v8HhjPyRrxs50JUZdPaBbDY7q9P+plWkuj30frEjevW2IiG7QQ975ixNRtEGDem3NhiF
         7Jon3d9fenBmoP21EhtCHKu3x6eG1zpQWJqngILShIFpqoxpXXsaBXA98ElO6V75jEzk
         yBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792630397; x=1793235197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAnyIUkmbq6HJDHmZZfXywINd719pbGy8aLPkmBqx+Q=;
        b=bl83vXqkazkdSYkrUZAnGRiIq3CDRyK/tPUj0b9dJPHKVP9VvYfMPgDOzb1wz0dwbD
         2ZlRyJor6mU8pR7LZpRQp5IUzRVJcJLHl20ZG6L1uaoDJYD9fzYUacte+tQjflBUfq46
         dP5qGBuQrYZ6ffWZMC2koLTebN07qP6Smb5Q7Xg/1Fa7aGp9kFKJ8CTVNBPesDMg9RxG
         Wu+citJFhaedJLSuQLx8rQgGzo0giTFWUdxzGzIRJkvZQBSTvnLp6JuAe8iOWCIiwc+P
         0AB/MAUM+qJN5UfkBsxZF9bj/XoCUDZBfmXkqpvLoleVZ5OMlgkLmdTwF77k1m+rZ80s
         ouHA==
X-Forwarded-Encrypted: i=1; AKwUvBzcrZCwWIV/ucMbXK6Tf+6aPAMiX06YCw1nCnYhAQFAdeqYxi0/GvwVAaXZ8poXskpyhuq3hwWuxrshCok=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc6+MpFBdsRWcd7fjrUdFwhqrNB0tvHnoZObSOatmWIJruUifv
	/5I/MW0cFvGfqqFJaaeYBbwZsiEmJ9J65i4+Xq91WX8p95uUV64H9V9U50ESbw==
X-Gm-Gg: AYBFou3weXEm/uE/+lCQk2W51cqyazf2Y6nLKEEOSJx8KpnbBlt8ML4EQFLKKH/hcqr
	r2zi9Zv1s0luJdhUMH4ulBH40oetD8BeijGFaB4s3IR5ZIdVUEbV+x/qKhpf0J9dYRYPRSAQobh
	dcnizRrKOJqsIq8JNv0nWvHggRXp1oiYZcGVU5HryJhgeEtLo6QfJfcU6VDz4901bScoGHEZUi7
	+VumanUMDvvkqxEQvdAlfPYEAJjomWf3JuxusRpON5onIkTijijPdYUIeQx3AcPS1H8QRt2mZTK
	vp9FpltaLcR4x6jJrgpYWOhlpYBydM5LDXNqZeZQ+UKIqpxejRjo/1fri7VYyqEotjea7hPC8zV
	un138zwT3opnREqv7nwrR5t6Y1m8GyCEKc9QC1027ogmQxclbUKqn5bZO54UiwF4GIYzu+GvDnQ
	ineogQWYv4k55WpL8o5D2GRKewt767njx9LrJ7iuptPL1oUi3TgYdIrwrn3zzAdI/BO9sGc80vQ
	aw4CGlPSZxHCc+ECjkk8BviGxAogG1AYMI2cvep8Sf6kXhK6MIPRKCw3r/Brfq2+x5/Upe3H9xf
	B7f78MjAPbBPSYS1iM63yAT6jvMTB5fMMoBn9jdacsqP
X-Received: by 2002:a17:90b:548e:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ad86f23619mr2983726a91.57.1792630396853;
        Wed, 21 Oct 2026 17:53:16 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c4dsm1605274a91.7.2026.10.21.17.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:53:16 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Nico Pache <nico.pache@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: khugepaged selftest: intermittent collapse_full(madvise:anon) failure and low-memory false failures on arm64 64K
Date: Thu, 22 Oct 2026 08:53:03 +0800
Message-ID: <20261022005303.750032-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020024116.2949892-1-hanzhijian1991@gmail.com>
References: <20261020024116.2949892-1-hanzhijian1991@gmail.com>
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

Hi Kiryl,

Thanks — instrumented as suggested: errno + thp_collapse_alloc_failed
printed on failure, then 30 full runs on the same setup (QEMU arm64 64K,
6G, linux-next 20261019). The failure reproduced 11/30 times and the
data does not point at allocation:

  6x EAGAIN, 5x EINVAL, 0x ENOMEM
  thp_collapse_alloc_failed=0 in every failing run

Per madvise_collapse_errno(), EAGAIN maps to transient page states
(SCAN_PAGE_LOCK/PAGE_LRU/PAGE_DIRTY_OR_WRITEBACK/...) and EINVAL to
"intrinsic" scan results — neither is the allocation-failure path,
which would have shown ENOMEM and a bump in the counter.

One thing that stands out: madvise_collapse_retry() retries EAGAIN only
once, so two consecutive EAGAINs fail the case even though the errno
table documents EAGAIN as "trying again might succeed". Could the test
retry harder on EAGAIN (loop with a short sleep), or is the single retry
deliberate to expose genuine kernel-side transients?

For the EINVAL cases I would need kernel-side detail on which scan
result is being hit; happy to run instrumented (tracefs or a debug
counter) if you point me at the right knob.

Full 30-run logs and the instrumentation diff available on request.

Understood and agreed on the low-memory guard — dropped.

Assisted-by: LLM (QEMU test harness and instrumentation)

-- 
Zhijian Han
