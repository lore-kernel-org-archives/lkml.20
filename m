Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61243785D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978197; cv=none; b=b1UlHD+aTXQTeksR/pGZS+3gnFp+VJT5TRa19uDiufGL0mVmT2vT8T94sqIF4jTYTQfZsrbpki/fd93pbe28Cy23DXcmK0JpZoAFyYmZYSzRxzrah0Vqzb1hoZMiz5rN4kByxiEkSXw/YGR0hdqRZWvRdgcT3NjNrqFb5hA1l/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978197; c=relaxed/simple;
	bh=xig6BGfz5V/iXtxMWcEdOR3c10+zRfBhvI+1JKT9EqM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bA6waFIu2/+AHO1dopNmLSV7k4uzMFAm1oZVOgXdNT2pk8zwAaBWfzyrB+0EJ2LMqULt9LytOavUO+7MxVkOR0L+HRtTQfaX7Ys6WlIX6e+iCoqLtUmvetYQBm4ke9szQyNLWFn2+YzmRUED3fhP8RfNZZbjfphbaxQigSK1NfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FtyGHLFT; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FtyGHLFT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xig6BGfz5V/iXtxMWcEdOR3c10+zRfBhvI+1JKT9EqM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789978193; v=1; x=1790582993;
 b=FtyGHLFTEB1bmiiRdHgRaIUP0yWs7gYNtyWPGkifikwlzvHS6b0+JudwGOUw6sAELOfWgjHL
 4862xpHMulmyzmdepzX73xvpzbbVBtiCgoweHJUd6aoMkYpm2RBd5op0qSnEo4TxLeJlkG4OXS1
 4Sn3SI9LBTCeaWwZvNphBf38=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3220937097d8cdc9;
	Mon, 21 Sep 2026 08:09:43 +0000
X-Mizu-Trace-ID: 3220937097d8cdc9
X-Migadu-Flow: FLOW_OUT
Message-ID: <828b0f0e-b260-4df0-ae90-f89fe8196e48@linux.dev>
Date: Mon, 21 Sep 2026 16:09:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guopeng Zhang <guopeng.zhang@linux.dev>
Subject: Re: [PATCH 1/2] docs: cgroup-v2: Describe boot-isolated CPUs in
 cpuset.cpus.isolated
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20260918102359.71826-1-guopeng.zhang@linux.dev>
 <20260918102359.71826-2-guopeng.zhang@linux.dev>
 <ae7daed1-8fc6-408f-8201-756efc8c5c7d@linux.dev>
Content-Language: en-US
In-Reply-To: <ae7daed1-8fc6-408f-8201-756efc8c5c7d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/21 12:29, Ridong Chen 写道:
> 
> 
> On 9/18/2026 6:23 PM, Guopeng Zhang wrote:
>> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>>
>> cpuset.cpus.isolated is documented as empty when no isolated partition
>> exists. This is not true when CPUs are isolated at boot with
>> isolcpus=domain. cpuset_init() adds those CPUs to the isolated mask,
>> and isolcpus=<cpu-list> uses domain isolation by default. They remain
>> listed after a partition using them is released.
>>
>> Document the boot-isolated CPUs as well.
>>
>> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 2ec582985b5b..272e9f2432bd 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2625,9 +2625,11 @@ Cpuset Interface Files
>>     cpuset.cpus.isolated
>>       A read-only and root cgroup only multiple values file.
>>   -    This file shows the set of all isolated CPUs used in existing
>> -    isolated partitions. It will be empty if no isolated partition
>> -    is created.
>> +    This file shows CPUs isolated from scheduler domains by
>> +    isolated cpuset partitions or at boot with "isolcpus=domain"
>> +    (including the default "isolcpus=<cpu-list>" form).  CPUs
>> +    isolated at boot remain listed after any partition using them
>> +    is released.
>>       cpuset.cpus.partition
>>       A read-write single value file which exists on non-root
> 
> Could we keep that terminology and avoid repeating "isolated"? Something like:
> 
>       This file shows the set of all isolated CPUs used in existing
>       isolated partitions or isolated at boot time via "isolcpus".
>       The latter remain listed even after any partition using them
>       is released.
> 
> With that:
> 
> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
> 

Thanks for the suggestion. That reads better.

I'll make one small change and use "the domain flag of isolcpus" here, since isolcpus also supports the nohz and managed_irq flags. I'll update the wording in v2 and add your Reviewed-by.

Thanks,
Guopeng

