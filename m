Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584990;
	b=jNbRHGskkCs3Cea4ks4PSd2Pt0IzWpyaniO7D5ZSSiNPyy9F9fQTSemm6ts4tAjxAdwY
	 RiUv1Y/0ZIYLAv2ZEmGIm0NfMKh2GEnkN9737I3LznfAU/6iye+Wde6w8b0TlK7nzHl8i
	 om+bb9gcWiXWx7fYafBMYRW6IED/WH91u+c4XVe/YIIwIJkzlK9rH0qnNb7hbNblu74Vx
	 ayKhWqMOQSIXgt7iFxfXsdI4YJCg6NIQMmWV2LmHlDuCxq5atqR2ngGORO5zswaAQBuW1
	 1qwPcDIDcmfHeP6DshYtNTPaUAZWkbeTd7hk4UsmtLoZSrtk/BAI/To/rWNarc8Goxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
	b=XcE2N57fn86yXghmIC7q7ji2xQnmT8SaZf/eosbBxuUeV+uUq/Lnl5ZmBWAW9hqqNENf
	 XaBVT7m55qvSkBovDgoPkKK/25VAeirfgkH6pBtYKRqcY2ORVn4/Mx1775h0c5vnuquab
	 s9MIclBH9EcOitui7YDPJjgKscsSK/2nB2D09V9JNpvkEF5+VHSKH0dpDhO1nTAB+4plT
	 HT3eUkZEqC5D0Hfnxh5VZKut7mge2YxW8yvWLYVnz8eV45AQ0VuefNRR2dIP4WoJZ8Ux1
	 ctOdNZXvJGnlRiZHzYENsN0aNSfgiXfbRKK7z7b1mkwh3j350qyJgcyq82a/UKNw5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt6PRoTj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4223F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt6PRoTj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso1208445f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584989; x=1795189789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
        b=gt6PRoTjK9ushlCFmi0ZnyNwfS/RFssMXZcQGe2pK8ReE6W1cTJq9QVXKDgbsK7I/u
         QLCMljabk098avfl3K3IKbEHTrqIYq/AXSVFB8HFvwXiRgwuyPlUahqfKNnMoEHeWNhY
         M2X37MoMwgmAp9EJ0/2KidunymAnbPVB/RfOfz6vOoMoK5qp61eGjdqgAqsrjikxAQ9g
         VOSArufYGvu8H5cOCLxjsC78AuSgMVvDEJSKrB+upnCPCmd2dfiRfNqp2vhbKW5FbpPK
         9ovQ/9GGKfOYZbuRQ3U45LSKN9r42DvPuu/0zHggVTglptLhHgJaueP7ItMzfSE6n+Da
         5p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584989; x=1795189789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFCVBlkrizuZWlE0hb6CXLduUGl+Zuu3dMj5O1kjYAw=;
        b=k119SYqNeeG6cItOlhhBSF29NP7748zoMbLloWMC6BBsz2Ot9eMK4EQeNGKVDEYQ+e
         NqkXGF0R038NEH+T/Ae+I9xuoFo0yFhuAQ4KujljRPDZGuSr3Hf3D+ETOUnGAUGSnPS3
         6+KkNCYlwA0yC+mk8cEbm5p4qgJxSdofdSJN4+YIASclHnTfbl9lPzcJCb2s2CtrTpFp
         uSJI6O/gqYWf9tVZmC0a1v73sUIyM0LBBHxo2KY93hru/Oj2RXs63SY5NJOL3LXuGSAE
         8tgcYexKoG/cBhkHfs5s1pFjJZ0mabY7DL5Eh2xPTV3OOR2yRqjWfhWMR/zG07D6QlJ/
         BsFg==
X-Forwarded-Encrypted: i=1; AL+hErH7UrY3Hw40AJm9YlDQhb0aqQiLArWdRFnUOBMAzbKrPwMeI6obuQw9Ge+t9u+G3eO4X1XMO8YVPVJ7gCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9izwKK11NxLXzBbrwUU2fQVsb0NdgzZuldEk5yG/hjOO7P2R9I
	UElyIb6eQBblmT2RRo+eIDNApZUmi729ae+Y6Lm6mfCGr7/lbxD5YfK7
X-Gm-Gg: AYBFou0koj7eJYiJiN7U/aoejKrwCAUk+mln9WqohFNFWSZgh+lultu8GClzK4jd1Em
	y54zVWqdvtffJo0tl3QqHKpJ/OSfPaS3OaiRrV7juMYDY3cv5XJ/hynrp3n+tjhklZ0jMI7qT/L
	gzt+aec2/foJgVzs9c4OfKGYRicXidpFFVInhGWT4bxfYxBQxWAUmTjDrf50uxk5qfDXOObxTxa
	tJ/nEihsGsZIUxV3QFVIoT1IYjo8lKPFWIMD8tuF10IbAeQbUl/gcHCxjs0Emy/Ndlq10WlAaVK
	C3zy2EuGYzV5REzRuvd75zLVatIFHlsNlMQeDofnPGjV88M/RwMvQrDL9PY/tGPsVeXu7Otsd28
	r/2tivg9BIK8F2I/Qxi5Skit7NxEq2Rx1KtAQgmlm3RynZ3Vxikb+WfnWkkVUyrl36/SunESwh/
	S9XAX0hc9FPYjMKAAlCN+8XubxUrbgS/TzsJ4/NylqL9BjdO5aj6KmbMNoXyoJ+GGPp49nmph8B
	iqzz6G15BBu73uoYUv/3ToQZ4cM9TRhOIxyUw2o/XzRfOLQb4jIz/FpfecCPD1Myux4OiaKs7jl
	eIveBrXOkklFULeoCkqC0pZQ8kmBFVxiwNAfWIQKMXAfl9M3UuJ9wiwgGFjd24Lf4lCVDhI8d9a
	AnQ==
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr6770868f8f.21.1794584988524;
        Fri, 13 Nov 2026 07:49:48 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm6797151f8f.1.2026.11.13.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:49:48 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	will@kernel.org,
	boqun@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	m.szyprowski@samsung.com,
	kayracizmeci@gmail.com,
	weihengqiuu@gmail.com,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only where room was made
Date: Fri, 13 Nov 2026 16:49:43 +0100
Message-ID: <20261113154943.14429-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <818f0461-4635-464c-be20-461cd4cd8341@efficios.com>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com> <20261108185406.1549770-19-mathieu.desnoyers@efficios.com> <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb> <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com> <20261113150438.9119-1-parri.andrea@gmail.com> <818f0461-4635-464c-be20-461cd4cd8341@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 10:20:16AM -0500, Mathieu Desnoyers wrote:

[...]

> Neither is needed. I propose to carry your patch in the next version,
> unchanged, right before this one. I already carry your cpuset_mutex
> fix that way. I rebase my patches on top of it. Then one series fixes
> the order of the two, and the selftests run on both.
>
> Tell me if you agree, or if you prefer to keep it separate. If your
> patch is picked up on its own first, I rebase on it instead.

Sounds good, thanks.  Please carry it unchanged, with Sebastian's
Reviewed-by [1].

[1] https://lore.kernel.org/20261113153549.Z8XPohWU@linutronix.de/

Thanks,
  Andrea
