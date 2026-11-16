Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812900;
	b=fXPF8YsTgT0tejfrxyq4zfcLxcPyLOeh59FduZXUmt55AUCUcOVq6AUsQs4zBMWfZ8jd
	 Ptq0AJUzv6t4HtGozjAt0fm82P5YRI58FSEmkz0eU4D1nhmyL50c/ZSobhwfD/EkosqBA
	 wcd4qhHJWKTHurVcUc9YxnllamfuyCLILik3KN2qcyOml4jF2QXTbQkkY5liTfr1Qd0Sh
	 mHoKIOulNalO+YJc09nCnF32XDjIH0bsxY1jneN/hsVqcIVCF+q2PTQAGl4snFdI5AYae
	 9zXRuMnLyP565F2bHxqyGBHkbOYRSlZ+d9Qfz/wpPLhrSiZmbY0dEA+MoHgXpXUKTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812900;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ku1GaLDZkKaVwDYDZ0Af5dH0wVqeYKJe066PDuuveYg=;
	b=0KaHUCVTQp2Cph2CZi85MsPcs9oHJ3mDyV4LdiJ/7UUfAXZIsGOQ7+AZOtJxFLVYbsq5
	 HePwqS4CMo4+391qQNeyti+k8rIZnmzBkTKdCl1uPZ+uY9azlcAeafFD3nRDAN+tpsPd0
	 aYgMFGO+AM+dTuimfNP8YEixBBikxvfm65xN2WM+P96/oFsr7T6qWYqljoP7KFgxCx9ZH
	 BLEDQsH7id9PfyTKhvWEDvRyNPOUgd93/Sj8IfMfsldp94IbLWV1d+p8u7CH9xYZcZuQ1
	 YXBAic56zT2rx4hvWX6TEcEVp2haGBUSLV1GeFxDRSjgOkqHVDYGDv8x7LPo2Qt6Nnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B1KV+0OO;
	arc=none smtp.remote-ip=95.215.58.245
Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC6606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=B1KV+0OO
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6vrI7gFyIbpml94nt7zmiCUdpXp3+pLUaoOSBcJrx1g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794812897; v=1; x=1795417697;
 b=B1KV+0OOVFo2JP5I1KIbCCFTBhiwXJBAdoUaQWGW1pUTW1rl/rODGG7AC2YcJzg6FvoREkSi
 0cEuOcBWjq7mqOVxLKsAydm8II6G2ol/ZRF4fmeobzb8S672znKUaBwm5QhBlzLDSQOgs00Ft7I
 ryZHEyJfRRw7Z4C8UVsq0ziQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 97b20a8296e0957a;
	Mon, 16 Nov 2026 07:08:17 +0000
X-Mizu-Trace-ID: 97b20a8296e0957a
X-Migadu-Flow: FLOW_OUT
Message-ID: <b5d6f382-0e33-4737-8c8f-03f5536249d9@linux.dev>
Date: Mon, 16 Nov 2026 15:08:08 +0800
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
Subject: Re: [PATCH-next v4 5/6] cgroup/cpuset: Handle remote partitions
 before local partitions in cpuset_handle_hotplug()
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 Guopeng Zhang <guopeng.zhang@linux.dev>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261116012330.2271010-1-longman@redhat.com>
 <20261116012330.2271010-6-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261116012330.2271010-6-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/2026 9:23 AM, Waiman Long wrote:
> When there is a valid remote partition underneath an invalid local
> partition with subpartitions_cpus cleared because of missing active
> CPUs in the top_cpuset partition, the current iteration logic in
> cpuset_handle_hotplug() will handle the invalid local partition first
> and potentially make the local partition valid. The remote partition
> will be handled later with the potential that both the local and remote
> partitions will be valid with overlapping exclusive CPUs violating the
> cpu exclusivity rule.
> 

Hi Longman,

Patch 5 and Guopeng's patch [1] handle the same case: after hotplug,
top_cpuset has no usable CPU left (no active CPU, or no active boot
domain housekeeping CPU). But they take different approaches:

- Current code: clear subpartitions_cpus and invalidate all the
  partitions.
- [1]: only invalidate the partitions that can give an active
  housekeeping CPU back to top_cpuset.
- Patch 5: invalidate all the local partitions but keep the remote
  ones valid if possible.

I think we should agree on the expected behavior first. My preference
is to keep it simple and invalidate all the partitions as the current
code does. The problem is that in the same hotplug pass, after valid
partition A is invalidated and its CPUs are given back to top_cpuset,
partition B, which was invalid before, may become valid again. B puts
its CPUs back into subpartitions_cpus, so a valid partition visited
after B is not invalidated (patch 1), or B overlaps with a remote
partition underneath it (patch 5). If invalid partitions are not
allowed to become valid again in that pass, both issues go away.
Do we really need to keep some partitions valid in this case?

[1] https://lore.kernel.org/cgroups/20261111134250.16852-2-guopeng.zhang@linux.dev/

-- 
Best regards
Ridong

