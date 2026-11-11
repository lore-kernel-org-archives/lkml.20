Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416299;
	b=uF5h/N3jTRZ4M1im94kXV2SaD8wEGDy9i0QrYoN1v0ylf1AFNZLPdRFo0mFHcvJ8HpWC
	 WcAyrW8GxA4XaTued3Z0/H49ZmHOIxqdNAIYQUfFI5QhR/i+87Gxgkf3xUL/wj62ZMdEq
	 tJM5k79wTK4uYdEnu8yGwVDbY4cPEvLapHPFxnBv5wHvyPI88xn6e3vIlJ8GCm8L5OfY8
	 tLJOq3CakT4uAbsRKOpcrEvaKG/n8FMDztKPZRuCrU5rUSTNZvpCq6boOtpErfOHGY6GD
	 mBgwfFqt0B0FDeTzH8OjhoJBXS4GXPH1P3ZFomwWQ+vmXvXWET1fS+eAHvXnQ1l/KUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416299;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vvWX93MsVl5BkD00p1pCQUQtW9EPlb72dAVwC8h839Y=;
	b=4ctmask2vmHoG9pwrAtDWnLaPdtRC9MhyB/2LM929MTlRvn5sMok+xn5m2Pz1uD8PGgP
	 9OuWyD7GL1Mb3yl4l6CDvt3kuwjQJKsly/dc7dtEGfUUjSdiW5LSylX/YuTCVh0fTwRxR
	 lOWQTnEuL+YNAAo3PlKMSBazdHn4ipP0oRxKeQdChqu3RKlMBJgD6UAeJXz+/OC2Jkf41
	 6NJaCrw+iw/RbhwOXlM6qQ8U1LCE7ckVqT/T06Y1bssBXgXYOOfJFdSsSN2JBIb4hrx4w
	 wrCl/boPvHEKkmQdgFN96JtdAjyCAb/Hk95+r/RqlyZpityrCw9MSATlO2VuDFArLPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=edhSwXa+;
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14B606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA14B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=edhSwXa+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S5159V/Pr/U9wfU6GuHiJLwFjQaFGKXwt7ZwLcTa2AI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794416295; v=1; x=1795021095;
 b=edhSwXa+F3Q76Fb8vb7NffcGd7UuLFy5S57mQsf3WSUMV8EaInW97ZnCqouTtXynvlk+z0+3
 BfjWRWV00ihD5cl4JNkf9yuMaoM0LZ4F7cPFFI+kHby9Cg9wPrwVkhzjTkDYZnEwi75MPoUKr7M
 UWeCbf/DTviGqSa/asu61S+Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5984f67eb3c1846a;
	Wed, 11 Nov 2026 16:58:12 +0000
X-Mizu-Trace-ID: 5984f67eb3c1846a
X-Migadu-Flow: FLOW_OUT
Message-ID: <784dadf6-41c9-4c91-b341-4d4179d7a8b8@linux.dev>
Date: Wed, 11 Nov 2026 22:28:05 +0530
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
Subject: Re: [PATCH] drm/amd/pm: use the VBIOS trained UCLK levels on the
 MacBookPro16, 1
To: Alex Deucher <alexdeucher@gmail.com>, James Skillen <jahs@jahs.net>
Cc: Andre Eikmeyer <dev@deq.rocks>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng
 <kenneth.feng@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261024162109.307247-1-dev@deq.rocks>
 <20261102232450.61301-1-jahs@jahs.net>
 <CADnq5_P5Ly4Pb8WqPaN28yDHG8jSjoEHAfDKAqSgTrSj14Pr1Q@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <aditya.garg@linux.dev>
In-Reply-To: <CADnq5_P5Ly4Pb8WqPaN28yDHG8jSjoEHAfDKAqSgTrSj14Pr1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/11/26 20:05, Alex Deucher wrote:
> On Tue, Nov 3, 2026 at 3:21 AM James Skillen <jahs@jahs.net> wrote:
>>
>> On Sat, 24 Oct 2026 18:21:09 +0200, Andre Eikmeyer wrote:
>>> The Radeon Pro 5300M and 5500M of the MacBookPro16,1 (Navi 14 boards
>>> 1002:7340/106b:0210 and 1002:7340/106b:020f) stop answering SMU messages
>>> as soon as UCLK switches into its third level.
>>
>> This is the hang reported in drm/amd issue 6005, which has the
>> umc_info analysis and test results from both boards:
>>
>>   https://gitlab.freedesktop.org/drm/amd/-/work_items/6005
>>
>> Could v2 carry a Closes: tag for it?
>>
>> I tested the patch on a MacBookPro16,1 with the Pro 5300M (1002:7340
>> rev 0x43, 106b:0210, VBIOS 113-D32207P1-019), on linux-t2 7.2.11 (Arch
>> v7.2.11-arch1 plus the t2linux patches) with this patch on top. The
>> userspace pp_table upload from the issue was disabled for these boots,
>> so the corrected levels came from the patch alone.
> 
> Can you try this patch instead:
> https://patchwork.freedesktop.org/patch/765668/?series=174386&rev=2
> 
> Alex


The patch is the above link is a vibe coded mess that sometimes works, sometimes won't with appropriate discussion done by the author himself. The once sent by Andre in this series is clean, simple and logical.

Reviewed-by: Aditya Garg <aditya.garg@linux.dev>
Tested-by: Aditya Garg <aditya.garg@linux.dev> # MacBookPro16,1 with AMD Radeon Pro 5300M

Support for more models as claimed by the vibe coded patch should be done after appropriate feedback from the users in another series. Unfortunately after every few kernel versions the most number of regressions we face are from AMD GPU drivers and untested patches are the cause everytime.
