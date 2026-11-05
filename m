Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852146;
	b=mVjboV77OC1iFJrmrZvBOjIdxarP7xy+n7voNLWDgHpSmw7MzguWSRnvlvZPp8W/mHET
	 Vks9BBDInVFznGGUnXPdgJxlt3kMJh7CRpUGd/QNAdIZJ15R63z1qw3UniEbZV0wiZSwD
	 Kj5zplZOsmvZQlI+O2C1uRRUr7/VwT4d8TpaKSoB59IHycQzf6fUn1dXAm5SlA4EF7iRM
	 ju2+gK5dEFv+4PvWZzRzkcbiRATklyPYgIjKfGN1kxTkU0SZSyQpzyYSQbETmiVoHyhml
	 oAlufgNR8jqZ/xeiVdskzLlCINj8q1yM6N8DiyI8iI08p09jC6x8xX/gZFf1ds4hfmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852146;
	h=DMARC-Filter:DKIM-Signature:User-Agent:Content-Type:To:Mime-Version:
	 X-Lms-Return-Path:Content-Transfer-Encoding:X-Original-From:
	 References:Message-Id:In-Reply-To:Cc:From:Subject:Date;
	bh=QZwA1ylfcTQpoiqvqbwvBbujn8CAZYbBXuwI3cwgUxk=;
	b=VGvgqyJ0AJXBSJbhIegINP0qeCkmR2zOfGhFMxD49P+ENaHKmUI+ElD5aVwT693BXDsu
	 2aIR5nThJFetBcTwOhCPAUx7EfQjzQODcb583LCBLLjQO8H2X5uTlImphEFmsh6Iwy+tq
	 yIxvsyiK5g/4tAgEtOGlnD49Jtzo2puUJfgWRC17cPEpwUe6hqPRAfSj4JRoCLzhaY3PR
	 mXbum2g6aKMAHQ4awrobac/6NklCGFbfOnfGW2WtbNSNfbhXbGBtGIGxty7l5wtvWImUR
	 TMN6Vkayx5FZjtgZfFF+tsqi7VBq9fseoV8mtfgiXV15ebEsYBi3WOWN3hu6euMdx9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dcoBMuqC;
	arc=none smtp.remote-ip=209.127.230.115
Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD37606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD37606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=dcoBMuqC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793852139; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=QZwA1ylfcTQpoiqvqbwvBbujn8CAZYbBXuwI3cwgUxk=;
 b=dcoBMuqC9Ugy3/YP8rWZ9pogd982RtlOsQiKGJDu90izjwKAI0D12GAblLdJ/1/2xWrPHM
 JD3nRIEe9hdHLCUDNiNNCgnAWjsqQgyzVB8WeEHdVc6AYV1534xJR2186bXWA4gzG7XbNS
 S1qtyz8ztDMYWjbQzel8ZBHCkf8SohvKVIUs+tOezwhfXd7d0m2jeeJ2VPoLOWOj+BpUmT
 nIfn/1yWVA/7WBu9Nz90YTzuM902nJsja1PFa6SU9c/7tLjDb+PyR+t81Onyz4dr0fPZkP
 +6yRdXCmmW7GQxKqK/J6HDDjmVJaFa8ZXjuOI8z4wsMFebocPTStJMvUgTjxeQ==
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
To: "Will Deacon" <will@kernel.org>, 
	"Catalin Marinas" <catalin.marinas@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26aec02e9+737ce7+vger.kernel.org+zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <at-czRUYRPRxi9dy@arm.com> <aus2Aq12Z-PKvoW7@willie-the-truck>
Message-Id: <56ed8952-fb5a-4f88-90c9-6fe5476237cc@bytedance.com>
In-Reply-To: <aus2Aq12Z-PKvoW7@willie-the-truck>
Cc: <mark.rutland@arm.com>, <oleg@redhat.com>, <ruanjinjie@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Date: Thu, 5 Nov 2026 12:15:24 +0800

Hi Will,

On 11/4/26 9:41 PM, Will Deacon wrote:
> I can't quite get my head around what it means to set NT_ARM_SYSTEM_CALL
> in this context. Suddenly, in_syscall() will return true, which has
> implications for things like signal handling that seem bizarre if we're
> not actually in a syscall. Should we be avoiding this situation to start
> with?
> 

I ran an additional arm64 KVM test with SIGUSR1 and SIGUSR2 queued at a
group-stop. After the tracer set NT_ARM_SYSTEM_CALL to __NR_getpid, the
second signal-handling pass saw syscallno=172 (the control saw -1),
although the task had not entered a syscall. I did not observe an
incorrect restart: x0 held the first signal number (10) by that point.

system_call_set() assigns syscallno before calling
update_syscall_orig_x0_after_ptrace(), so retaining the early return
will not prevent that state. I can investigate separately whether the
regset write should be rejected at such a stop.


> I was trying to limit the scope of this hack as much as possible, so I
> think I'd prefer the early return tbh (i.e. just drop the WARN_ON_ONCE()
> and update the comment).
> 

Agreed. I'll retain the early return, drop WARN_ON_ONCE(), update the 
comment, and send v3 with that minimal change.

Thanks,
Gongyi
