Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678533;
	b=xmSFUv6doeFFlSg7M72tuxlm63jRiLYglEO/4BoqOrlwKJonGVCqr3M8rmuCor1xQIWY
	 7wm/AP7HwDNZhdHhOFLDKXc0ECWbQcR6AT+jVUEMND/0w+U/Hyx/r9+610cX3UdVNulxm
	 alaiRS5zRw8EyKZRNQO4EdDaNhMsYCy9m+AQo6momh9AP+0QRnpO3LsLRcPA5cj/XiNyC
	 e2aHFTEg5+Mh1kvjqjBUz/wBDaRV1KhDA4a6A8z91JeYFzSUWd6qlnT4/FeO1g/dek8oC
	 Q6IaSNaqcJaINhDF/TJhLOtVd3x1T739cmVjEiRYlEaNUzWXPVUIvmCjEIlcRodRapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678533;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=epyFtwYSPrjZ9PLrBopoV0b/lvcyA6ik39i7A0Z5zyw=;
	b=cqM19GY9VxvhZW1ZzZ60b2Q0bk/FJCxEBgdRmwQ/ALmPb0QATeSwe8mgCjBG5l26h8SG
	 UEWTitIl78bRiC9VJPD9zI1RvyNZsbkUXtyew9i72BB8VL7QtL9wHWqOnLZSkSTS2RukH
	 jpOc2B5lOcnCmSkxZN1HMiIf3S++ZfRtQvCRMJMnsMYYyYyvLOu9h/IH7wL9GLXVm9RhN
	 bnXVauIzj/0Q1QxkI3MqfWRS4kRb8Jgc1BZ6Xu9Qk5ZuifDqC453NZaACf7kMIQtgNXYR
	 0F+mD5CIEiAsLTUH11OM4enmLxSjAWrRHHbOD6pXRVKRKIVJEZoY+PN7i1qI7CSdE8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lpyzliUI;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4E606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lpyzliUI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D2eJJQ4mGSfAGvCg/Pv88qDyEOPbv9qYIjiQF32h0dA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792678531; v=1; x=1793283331;
 b=lpyzliUIKs4LjhFXKiHVYWTmluEHXqpgeDCJLGWn69FOTK4zA/5yvj8QmmNmtgGzZPDE8KRd
 I43VFKeWo6S7MwS76z1Txwh/8zULjpL2xMsKCsVF2TRT4BECrET+iJivnhJwt52GX807ZzrCy5y
 XtupR1dF8HI1lgxPFBtbgffU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e51268da0f0b5f4a;
	Thu, 22 Oct 2026 14:15:24 +0000
X-Mizu-Trace-ID: e51268da0f0b5f4a
X-Migadu-Flow: FLOW_OUT
Message-ID: <d42eeea9-2172-487d-813b-d90d9ae1c973@linux.dev>
Date: Thu, 22 Oct 2026 22:15:14 +0800
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
Subject: Re: [PATCH-next 4/6] cgroup/cpuset: Minor fixes to
 prstate_housekeeping_conflict()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-5-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261022031643.1351877-5-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/22 11:16, Waiman Long 写道:
> Commit 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when
> doing housekeeping check") changes the way prstate_housekeeping_conflict()
> is being used by considering all the exclusive xcpus to be owned by the
> partition when doing housekeeping check. However there are two minor
> issues reported by sashiko with that patch:
> 
>  1) In partition_cpus_change(), prstate_housekeeping_conflict() can
>  be called with an invalid partition root. In that case, there are
>  no isolated CPUs that are going to be returned back to the system to
>  become housekeeping CPUs, so the calculation of the del_cpus cpumask
>  is meaningless.
> 
>  2) The checking of del_cpus in prstate_housekeeping_conflict() to see
>  if it can contain an active housekeeping CPU that can be returned to the
>  system ignores the fact that an active CPU not in HK_TYPE_DOMAIN_BOOT HK
>  cpumask will not become an active housekeeping CPU when it is released
>  by an isolated partition.
> 
> Update the existing code to handle these two issues properly to make
> prstate_housekeeping_conflict() produce more accurate result.
> 
> Fixes: 9527ff78a413 ("group/cpuset: Consider all the exclusive CPUs when doing housekeeping check")

One trivial nit: the commit message says "group/cpuset" (missing 'c') in
two places, including the Fixes: line.

Thanks,
Guopeng

