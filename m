Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754546;
	b=SlZuDOzWzhmCYfX64Gz2dX/zT2wLE75jUmH4hFnw6BhZ4/5bNYXuKPuAuaE/Vg/gvt3v
	 O090puiEY/ObzRw1WOTL/IYG4JR4qLPNy8Nfdnq2R6SzcqSOU0vzoFBI2QEclvvJc6GOI
	 f5MAtXbhSWfmEwOiPdbHfmWQ4WjW2iXnNQIu6gxAw7vOtvTuB9i3Bmf/c0Qwm1AaaF3tN
	 /xzPfCPZmWhqjCh2UlkYE6y4PS6FXOXURi/KHEN6R6ZYzp7T+ZGE997CD8zVWoFrc5Xw3
	 brkLftEK6r96uozJZZTJxi13VJ9wcIwdLeZg5fynnwm30nRKUC2rMWEaF6oBslR5C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754546;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DNwT7MNivvmsp5v/G1sivGjjeFDSrEE4yVOfX4tFs4M=;
	b=Z5yzbwcadmRny4455RP3wY+fvCigT7XNGgTHBjPxPvjb/vfWIgQuQRcLbe0d+NXprCCn
	 hN7nDQoCMVH12mGWzk+C9MgiAMTcEKiMQWVomcM8b9cH1lUTq+FU1Zw9N+Eo3vK89ZJlU
	 W6Ov0Ayjv0ILkKijfbfwC0dzNBIRjm9pro7ovcnE9juXqN42NlyjNyAMYxHtPgSFX6pP1
	 s5DY/z2vZuveS0jH19m1GWwq8tJZp0LNRxI2HTiNMwaxpgRmfGB5kRaT1QfXcmuAip5+/
	 rPAxzo//JEJmWrNBsDANjEywAHRdJIEPJdyOq5urGR3zMT14R4B7yAUjrCG3al+gJTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wLARo31D;
	arc=none smtp.remote-ip=91.218.175.68
Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07985606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07985606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wLARo31D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UYbkNfTSJAbnMkgRK5RbseIFJJx2cVqZzvm9C00qXZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793754542; v=1; x=1794359342;
 b=wLARo31DHaReFtavynBp863pM1J3r5+hVQ6MX9Z4rPoiNHUjDwjqMGFWXSluNureUdJ+52jr
 sn4+Joq353j/BgLkZgr8ne8hxIhVJ3vW06opsuEyiIBkCHwMOgWX326pNDSZp+cjKfwVtfrW4Ln
 gY7QvlD4hYvMpiMFMrjyq0A0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09a24c3c5e0efcac;
	Wed, 04 Nov 2026 01:09:02 +0000
X-Mizu-Trace-ID: 09a24c3c5e0efcac
X-Migadu-Flow: FLOW_OUT
Message-ID: <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
Date: Wed, 4 Nov 2026 09:10:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: alloc_tag: use the ll64 types on powerpc64
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>
References: <20261103155454.534649-1-sashal@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20261103155454.534649-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/11/3 23:54, Sasha Levin wrote:
> On powerpc64 __u64 is an unsigned long unless __SANE_USERSPACE_TYPES__
> is defined, so printing and scanning the __u64 fields with %llu warns:
> 
>   allocinfo_ioctl_test.c:93:73: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> 
> Define __SANE_USERSPACE_TYPES__, as other selftests do.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Hao Ge <hao.ge@linux.dev>

> ---
> KernelCI's powerpc kselftest builds show this. The define makes the same
> change on alpha and mips64 and none on the other architectures; the
> x86_64 and 32-bit builds don't change.
> 
>  tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 74fd64b2370cc..18c761fecfde0 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +#define __SANE_USERSPACE_TYPES__
>  
>  /* kselftest for allocinfo ioctl
>   * allocinfo ioctl retrieves allocinfo data through ioctl
