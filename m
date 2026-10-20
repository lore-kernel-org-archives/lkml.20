Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464677;
	b=F/D5Iqk5xJFQ8A1bq+S7C8TY5mXMpSmeQHXNviB4FPq5Aql9wMI4m4dzqCqsFyeu48J7
	 XshPQEDJQVNYSy0sKi/BNXJAaeAXzt8BHKgjC8w6tDzWs8BNOmWi86kRRCsntHrrAPaOX
	 Uo6wht1XoAOYuy/9x/aecO1DAMLSuXU6x1xqG5fiNwXEWxDG5kO6i+p4LftKwDlrDV3Vn
	 xLQrHuqugfXbe8n3EHSBzOj01d1fAH3GvGK7vdoV8771emqxyRPAcUoD+Awf0jCOLT5qK
	 OK2yhodklRAsDJvdNiGgU+T+/oONWJD9+PU3lWbJfjN2yuYSfNQXHGrztME2ppVveAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464677;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9hHNuq8VUc33E92tTq5jQ+KBZqXa+5yqvOaNMaHxjXk=;
	b=jOkM5XlVSS4qExtTQfM1qa1hEKsmw8NHpS/rrk74o/bysiehErjMACds4KfCE0bQmjke
	 QNUzU/je4FmnDyTMmQaCpY854t2lLYRhHK4CHq9+ThPjOjYswQpVHyu+BB1PZoe7GlnOY
	 MeKX0yrBN2XmloxBHBKwg+dz9ZTp++m4+35QhJ0hq8gY9Nw0ZFmHxLaytN60nlIO9i4m9
	 qOzoKp6lAymU1aAaXHuvwZ2/XmhsGa3YMxJj/9aViiXL+3HDVvTPyyIm9OXXmvDOUtm+2
	 mLbqLwE3zpYekP+JnLmdRlNfg+V+h4GUcZuu7L8eywdwm5zdYoBNDHRO3L21rzZolxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Opp1I/1e";
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD6C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Opp1I/1e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0LhUCCHbEICJb3ocD63LGJtcQVmKNGI1w3XPmkE83mg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792464673; v=1; x=1793069473;
 b=Opp1I/1evXffFl25B7tpnPy9Gm6fePTJZ0Tix1L9fiXdnBLs3V2Wteh+Q/NMn7TgLBLlsRix
 KMsEJFqx8nSIXInlpJB8PRA780msCNl3vuARlmF8jnKyMicB//W/oYDVT13lpRL8tVoD2E+bj5g
 oSaXjLns3Lxmp6YYGmovSSms=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfee1020aa42ebdf;
	Tue, 20 Oct 2026 02:51:13 +0000
X-Mizu-Trace-ID: bfee1020aa42ebdf
X-Migadu-Flow: FLOW_OUT
Message-ID: <56d84287-3de3-4a57-a92f-ca63d6dcda96@linux.dev>
Date: Tue, 20 Oct 2026 10:51:05 +0800
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
Subject: Re: [PATCH 0/2] cgroup/cpuset: Fix partition updates using stale CPU
 masks
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Ridong Chen <ridong.chen@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261010075947.333549-1-guopeng.zhang@linux.dev>
Content-Language: en-US
In-Reply-To: <20261010075947.333549-1-guopeng.zhang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,Longman

Could you take a look at this patch series when you have a chance?

Thanks,
Guopeng

在 2026/10/10 15:59, Guopeng Zhang 写道:
> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> These patches fix two cases where partition updates read stale configured
> CPU masks:
> 
> 1. Shrinking cpuset.cpus of a remote partition can leave a removed CPU
>    unavailable to the top cpuset.
> 2. Updating cpuset.cpus.exclusive can leave an invalid local partition
>    unable to recover after the mask becomes valid.
> 
> Move each configured mask update before partition_cpus_change().
> 
> Guopeng Zhang (2):
>   cgroup/cpuset: Fix cpuset.cpus update in a remote partition
>   cgroup/cpuset: Fix invalid local partition recovery
> 
>  kernel/cgroup/cpuset.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

