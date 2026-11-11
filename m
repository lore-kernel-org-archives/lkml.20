Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394315;
	b=w9W3/95dI/OEzqjg3CASNzSu6GikZHpmve6XvhF0DAwW5YYt9cpZwLq4xDf6VaEo9WxV
	 VcNT1nTl4O9i8rGVuS/oGKQfTCcoJELYLjac80Eyo4VlO9OrbG6DjnPgJ4g/ZUbEqmrB4
	 l2Xy54kQJtfIt2iudF1cki+aiMLJOSXQyKGXoRJ+S3MydtdsnpFKkbuOXx0T4iSItTzqs
	 g/jxMxO0TLu9mMJUhBp4KsWYcS19bPIWiRO/RDquxtDuXedwS7sTnmb6w22qdgV3aDxwZ
	 rMa4Qnz1mhNGQwPS6aYV81wv2YC+cBXPlCg0iYDCvMSTzojRI/PHOw4+Rx8LMJmLguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394315;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5AVpUvbziS4tLtkl71xz9vkUGVuY/mbFEqqFLF/VE2U=;
	b=quNCikTHybljHXOqdubd0iJstTh7Tj1iX1Gs1c7o5w0Ys/hjvWyb3fHjCTDiV0YTZ1gs
	 fB0Vvn5aXzKm2lrkpgcIYk2ksgbbyM/7xibf7nNMHRG4W9gBHKBMsRnjIqiVYs8pW/Vmd
	 uKnSlSNROtMxt96d0nSljFUrXBD/fgsp0jOunZctG/n9OngBgjrdANZHujUOCN1EhpLVl
	 2ugWCHfenisX/OcVccADedDac4k0i7Db/kI6hYk0jsd1lhPwEeJU6Z9dyo60tfyrcUp4T
	 EwTmcsr54wn/bB96WtITuZgx05e2zNR/SAPQJyl1LngWMs1qi1pfMAf6Rz4qIExjEhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKLbtLzK;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FD606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18FD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKLbtLzK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w8Ajrj08Qy2iipL85FFRK03LHNYTUCHQy59AnCWVRj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794394312; v=1; x=1794999112;
 b=aKLbtLzKuV1HlEwkwP3ApoFgaPivMXLvlSHlz+a/wlESPJMeSXG7C7Run9+sJhiMMDSxhBa0
 yGsuK6bZBJXePZ1mZammjvcXu76ySG3FNVcGBlPL1o+PRxlLIck38iZ8p7AMgDJLS+cgGh4j5IB
 LN8Io8Dy3V5aCv6UwV/nRALU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f93127dded52155e;
	Wed, 11 Nov 2026 10:51:52 +0000
X-Mizu-Trace-ID: f93127dded52155e
X-Migadu-Flow: FLOW_OUT
Message-ID: <cd2d157d-5029-4a6e-8561-2cb21cb337dc@linux.dev>
Date: Wed, 11 Nov 2026 18:51:47 +0800
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
Subject: Re: [PATCH v3 1/3] cgroup/cpuset: Reject updates that empty the top
 sched domain
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261110050324.173461-1-guopeng.zhang@linux.dev>
 <20261110050324.173461-2-guopeng.zhang@linux.dev>
 <0c302879-0d06-4c90-970d-6c9b40946f0f@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <0c302879-0d06-4c90-970d-6c9b40946f0f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/10 20:13, Ridong Chen 写道:
> 
> 
> On 11/10/2026 1:03 PM, Guopeng Zhang wrote:
>> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>>
>> Boot-isolated CPUs remain in top_cpuset.effective_cpus, but are excluded
>> from its scheduling domain by generate_sched_domains(). Checking only
>> effective_cpus when distributing CPUs to partitions can therefore allow
>> all boot domain housekeeping CPUs to be taken from the top cpuset.
>>
>> The resulting empty domain triggers a warning in build_sched_domains()
>> and can cause an out-of-bounds CPU access in build_perf_domains(). Both
>> root and isolated partitions can trigger this, whether local or remote.
>> For example, on a 32-CPU system booted with isolcpus=domain,10-31:
>>
>>    echo 0-9 > A/cpuset.cpus
>>    echo root > A/cpuset.cpus.partition
>>    Oops: general protection fault
>>    RIP: 0010:build_perf_domains+...
>>
>> Require local and remote partition creation and CPU mask updates to
>> leave an active boot domain housekeeping CPU in the top cpuset,
>> accounting for CPUs returned by the same update.
>>
>> Add test cases to test_cpuset_prs.sh to verify that every partition
>> update leaves an active boot domain housekeeping CPU in the top cpuset.
>>
>> Fixes: 9b496a8bbed9 ("cgroup/cpuset: Prevent leakage of isolated CPUs into sched domains")
>> Co-developed-by: Ridong Chen <ridong.chen@linux.dev>
>> Signed-off-by: Ridong Chen <ridong.chen@linux.dev>
> 
> It would be better with: Ridong Chen <chenridong@xiaomi.com>
> 
Yeah, I'll update it.

Thanks，
Guopeng
