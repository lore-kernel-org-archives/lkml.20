Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709180;
	b=zPMp9JBd0cPw8qp342qSVU0XHk8thBxEb2bfqje0f62Whqs0qEke2sD4sujbr/DS262l
	 zCtldzm7uu+xlDjk7tcp07ZFdJoAY5fUrRPj0KO8vM4tYmG6Ub7qjScEdn7pbZJrL7Auh
	 cfKubv1aqcvM2iK+LqXfgr0imHedhhLZPH0Pn4KOLmyZvU65VXNIfUOqRT4XJHuQZGkZH
	 nCbELuDDXYi8i0A1X/yO9nb65U0rwvrMY7Izx41DaQUR3CQreNaL6sbbj2XBipBtIdU+e
	 QS31bsgPDkYfFTlub1X8YIyAzSk04ql9UqvT3cwsaU5RkxmGE9JdwN/Snfq2bmoHh+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:User-Agent:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
	b=keE8lKGKzsS/uqmkRcp37rNlFRUZe0JfLxq7kPCeAtNpkQNV7LlNlF9YCE6JHtHdBXay
	 drwdyOyE/Bh1MSShSP1uKeGQAAHXbZa3DeJM++Pn4hgMJQYEkcKOiiHndT2wJmL0GxDrn
	 hNkZiC7DcvfcfOlgQ50VB1+bh/bGvGlq8uCEo5PoPru+EvAitOHj1rcriYgxAx3nv8Vm5
	 +ehrkI1tyF2OA+pmEg4TowKnVCr/u4elT2chzZOwJa2FBzytxeaxO/f81JuVuOkE/XyUb
	 c2tUpiacNQPl3OnTEKOaWjjBPR1fCsrCYZwShHjElFTzRvpMQ5KY5+EsUWm9f5sf5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V9dimx24;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A48D606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A48D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V9dimx24
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so1915065ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709180; x=1793313980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
        b=V9dimx24kbBHXJ1P8vGSuF2WRcO3WtupmscAFAK7qit1JBN7+rsaM4uQ0QvOmi3B1e
         OlPJWZjH+841XvikNKbTweptQtwW3JkFjd/+cGweNrqzY4QnLyQWb2s3zuR8SLvbmlC6
         lrAmFBMaZxtIWv0wLtertobAQ7V6rLTmYDqBr4WWPm8KQSjJxxmV47sKaKi0yTdUMOl0
         wIioL1Us5cnqm4kvrZbnr395yEyIcU7hI9JAzGmXFBfOdlLsFFuiuhFDd/sfNAIN3tE2
         FYzb3iI+/Vpj1UwveLgeo6Vx/begviZEwvJoW6PntMNwAP6xvIwxxNwGNAyvkKefV0Ns
         CtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709180; x=1793313980;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
        b=sSj5mRaX1gvdhF3UWE9y8wDdPsRc0vOyc9r5ATD/C56re6UytfMEd/hCwlwC/inH3U
         jcF/4gaHBrqu89quOFgJjARQd39lPuUfvpzcNcK5HaSKf3RpBKjBwk73kUFiBxCjiz8L
         1NHXk/eZOmJyDYpzAInpmZasTOVMaaSS+AyTNkx88R2/n34YZmsE7vYx2eOw+3LC+bOt
         hn29aeBn5gymPH1lo7xAAQyRI2DdQ0n9TnLMRFi2ngwknWQDnRpmK/MZpcM2JFpEgXsX
         NfScaBW05nPxBe9uzDEa5C6BUkHhBQ+hgjxbaYFKgenWOvMGXgMMObCq5QIMxkXJaSCc
         gfXw==
X-Forwarded-Encrypted: i=1; AKwUvBwHxelDHuAHNtCbMA4O54AwoLJkrl/oC98J8LQBLVplQ/lph6R8oU23aT8hNy3EIkynBWMfgwnNoUH6LPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr4LbgU9oQWo9WLnboNfaubIu6azNR4k2exn1nDjYK6y26G9RB
	j5PPK1bDjPY3yeDwmbRiAoOvif6zdQv32xZ9swvreRZSx4AtJm4FJ+8RdNF61kd1CQBRBcM0nAy
	PzdRJ4nnu9g==
X-Received: from plbjk4.prod.google.com ([2002:a17:903:3304:b0:2e2:f517:75b])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f687:b0:2df:8382:918b
 with SMTP id d9443c01a7336-2ea7bc6f70emr7274925ad.0.1792709179486; Thu, 22
 Oct 2026 15:46:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:46:19 +0000
In-Reply-To: <atpzgIOeEecUN9Qu@slm.duckdns.org> (Tejun Heo's message of "Thu,
 22 Oct 2026 10:35:12 -1000")
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022155352.1293020-1-wfelipe@google.com> <20261022155352.1293020-3-wfelipe@google.com>
 <atpzgIOeEecUN9Qu@slm.duckdns.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

Tejun Heo <tj@kernel.org> writes:

> On Thu, Oct 22, 2026 at 03:53:35PM +0000, Wilson Felipe Pereira wrote:
>> struct pool_workqueue tracks runtime counters in pwq->stats[],
>> pwq->total_in_flight, and pwq->nr_active, but reading them currently
>> requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
>> debuginfo. This makes it impractical to inspect workqueue stats on
>> systems without drgn or debug symbols.
>>
>> Add /sys/kernel/debug/workqueue/stats to expose per-workqueue stats
>> directly from the kernel. Iterate over the workqueues list under RCU and
>> sum wq->retired_stats[] with each pwq's stats[], total_in_flight, and
>> nr_active to report queued, active, and running work items alongside the
>> cumulative pwq->stats[] counters.
>
> This isn't really a justification. What do you use these numbers for? If
> this is for live monitoring, why debugfs? If for debugging, what's wrong
> with drgn?

This will mainly be used for continuous monitoring and exporting the
stats from the machine (CPU time, queued backlog, etc.). Also to quickly
check if any item is queued or stuck.

Why not drgn? For continuous monitoring, running drgn on every machine,
with vmlinux debuginfo, and memory footprint from Python/drgn, while
having CONFIG_PROC_KCORE available, it adds up. Having a simple file
interface, it can be read from an existing monitoring collector.

Why debugfs? If sysfs is picked, not all queues are in
/sys/bus/workqueue/devices/. Using debugfs, a single file can include
all queues. If you have a suggestion, I'm open to change this series.

Thanks!
