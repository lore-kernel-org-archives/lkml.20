Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889878;
	b=qyjmklJcmB8CdjXbk9kKLSJZ40o0mpflK01BlgHrNJnOAx7P+GRf6D5ZaxfrMs20Tc1M
	 xi/dyPUYW1WnPVCWkZrn9+cZZ+SKC9NVJoRsqcya+0xvPwYeJq+iyD2AXD4uOlF97RTa2
	 Ne2oxbg3zTTxprBsVJIb/WFOXTi/BLjn//kR9/+obo0bhWlkIZVIB0aH9zcjd5XmVGtf4
	 3hcOVvcCwqKQXcJtMgKl3n721SqoHFrSCoPbJm5rDR4Kt4hBxCijdm9zjDy2rwpgKqRe1
	 nURqtdb2+f3f5kX6ODhRQIkY0JvttGEzrSSTA7pA9Sc6X1jBVikURpDHebUv8YZzpRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889878;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lqZbiQstnR2DuR54/WGBZxvodEOQqhrP3VI1lbs9zDU=;
	b=5TYE9dZZyLuQrfYf+8ZxsO2AQS3q4ydkPbFqjguu+BjKvPaYbSR+ijElzFUmXsii6GvE
	 sdcR49WLSZYHpImZuL1D+gCwpvB1ITjQQddB3kB1XVcbKEKCyohXlykXWx8vEzcKWBInS
	 aH7uK/ii7JJpm269DSCajXNUnK9l+UvnePZRwa35DAMfTG8fvPOWKZia7tFHqFGHUxear
	 yCUXGz0XRRmgcRTXppc6ulIv4I/gSk/WHcUGknJmOW8sBjPeEVkc1TwVzNNFv6wOQPX8s
	 dI+Ehhpfp5DjXJ3RR81pfuNPcK5U3ZhQ2fFUM6fgEDuD1MviXTfeS/p/FDs5h0qTixQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="YKsKWB/S";
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A7606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD5A7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YKsKWB/S
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s1XIhhAbkiuR+LRrAAyJZxoadoJ6x7G66AeDRmhS0j4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794889874; v=1; x=1795494674;
 b=YKsKWB/SYHKIobz5RSraVaUR+LZfFzCQihyM5a/sxiGfnJdiPWslQI3LfqmqOANawWHsOSki
 bWNWNXhw3D+NgNTHLbsTuBOj/O2j+0t5S3jVM039el2x9BUs7h4gY6wbgpesLJakk6RjohxKoNX
 npRtrIPR4rrSZl/VbyIgRWYQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7644f7f50bb22da7;
	Tue, 17 Nov 2026 04:31:14 +0000
X-Mizu-Trace-ID: 7644f7f50bb22da7
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: fushuai.wang@linux.dev
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangfushuai@baidu.com
Subject: Re: [PATCH] sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()
Date: Tue, 17 Nov 2026 12:31:03 +0800
Message-Id: <20261117043103.16267-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261110032117.44762-1-fushuai.wang@linux.dev>
References: <20261110032117.44762-1-fushuai.wang@linux.dev>
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

> I think the biggest difference of sched_push_current_non_preferred_cpu() and
> balance_push() is that sched_push_current_non_preferred_cpu() runs in irq context
> while balance_push() runs in task context.
> 
> So, a balance_push() path be like:
>     task context:
>     migrate_disable()
>         preempt_disable()
>         migration_disabled = 1
>         preempt_enable()
>     is_migration_disabled()
> 
> While a sched_push_current_non_preferred_cpu() path be like:
>     task context:                       irq context:
>     migrate_disable()
>         preempt_disable()
>                                         is_migration_disabled()
>         migration_disabled = 1
>         preempt_enable()
> So I think a recheck is necessary.

Ping.

Regards,
Fushuai.
