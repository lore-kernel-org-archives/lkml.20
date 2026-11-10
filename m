Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291861;
	b=yyTAfjn6NYGDfim28sbH5f43OgZRAbWiU+Z7eVfd16kIhFVG0mwTL7npnea7O68tKaqi
	 kwOWRiJKmY4JXrmHjlCaqg/VlOnvLwpxLUhlHk9KW6zZfDA5p41RD+uZBkOwHow3qIrs4
	 LS8EjG1lNa7Ygc7sR61oQYYC6xNmQWgEGAT44KgngZx7c88JyjBQxs33oHIvKv8/MjDi9
	 +jp7/1LbR5VYd+bJrHZuRnC42zgULMqzPbeOaJtNribjkf3v9W7Uj0qm+CmhERRssYw8i
	 6vR9qUiaMTEvdIoEsMD6D6gLCHUanTFNa1aXRFddeQjG3sfXkYhQKkSFbnoSdS35WiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291861;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BL+W2T/2cuMST/SB8p0zoQbSb3TF01znFaP7YILvqJQ=;
	b=U/9qbDGxanz5YqzK+TOJOgT3X+Oj9Dh9jyp0bM7/IWUg6m5uWK//TPakszhNtRnUysWQ
	 ToWYeJ8w2/ofWohVot0mPGWVNL+waSU93Jvos7bY8IoGntU2uqQtkhx5lZCcyLip1JIc/
	 pWxq7vezx2kyCLVG4i7k23b2qTNjl9TfP0/pmDMvnxOhrIDG89jAQYnqcTlYYhdxTNqRP
	 Hrq6QGycWoHrPM6RFZbMt4xJyG9DGlnkbvP3n9/BkJhSU6ejDqfanB/cBKAr0e/tCVyop
	 MH2dKUQLALBrXwEcNOvAl84VAkUryb6++qmFIdSYTVZpUiqkUSWbXL/6xPl1op6W7Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u7Ozoluy;
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u7Ozoluy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7ght3jiINuFCMHMQNMsTCNCFy1DQnY7GC46bKdA/Shk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794291855; v=1; x=1794896655;
 b=u7OzoluyaEZu/1fB41vNlYs5mPIqZG1ptnG6WIv3AEo6L3+dk6Da+n/w3jZE5PLCZXFEv+Kk
 Sv2d+NgBbKEGka+cYl5zIBinDqYPZqu8zH5FmTssDGa0X/WGxKGO0/8z79hJhy3Bn8gk7Bs5GcH
 FW0U/UlTP8VqE2Ps92rE9whs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9578d8396b621a0b;
	Tue, 10 Nov 2026 06:24:15 +0000
X-Mizu-Trace-ID: 9578d8396b621a0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d7fef280-a076-42c6-a6c6-cf355bbbc29f@linux.dev>
Date: Tue, 10 Nov 2026 14:24:07 +0800
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
Subject: Re: [PATCH v3 3/4] cpuset: settle isolation state when CPUs are given
 back to parent
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long
 <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Guopeng Zhang <zhangguopeng@kylinos.cn>,
 Ridong Chen <chenridong@xiaomi.com>
References: <20261107120100.3587595-1-ridong.chen@linux.dev>
 <20261107120100.3587595-4-ridong.chen@linux.dev>
 <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/9/2026 11:20 PM, Guopeng Zhang wrote:
> 
> 
> 在 2026/11/7 20:00, Ridong Chen 写道:
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> partition_xcpus_del() only updates isolated_cpus when the partition that
>> gives back the CPUs has a different state than its parent. CPUs that were
>> further distributed to descendant isolated partitions are not taken into
>> account, so isolated_cpus_release() has to be called afterwards in
>> several places to walk up the ancestors and fix isolated_cpus.
>>
>> Make partition_xcpus_del() always set the isolation state of the given
>> back CPUs to the state of the parent that receives them. As the
>> effective_xcpus of a partition covers the CPUs distributed to its
>> descendants, the isolation state of those CPUs is settled at the same
>> time. Boot-time isolated CPUs are still preserved by isolated_cpu_update().
>>
>> compute_partition_effective_cpumask() invalidates a child partition
>> without going through partition_xcpus_del(), so do the same there: the
>> CPUs of the invalidated child take the isolation state of its parent.
>>
>> As the parent may be shrunk and its effective_xcpus not updated yet,
>> only do so for the CPUs the parent still owns. This is to keep the
>> isolation state correct for now, the in-place invalidation here will be
>> removed later in the partition rework.
>>
>> isolated_cpus_update() assumes the old and new states are different,
>> which no longer holds now that partition_xcpus_del() proceeds regardless
>> of the states. Drop its @old_prs argument and the WARN_ON_ONCE() so that
>> it simply sets the isolation state of the given CPUs, and use it
>> everywhere. The state check in partition_xcpus_add() is dropped as well,
>> as setting the state is a no-op when the states are the same.
>>
>> isolated_cpus_release() is no longer needed and is removed.
>>
> 
> Hi Ridong,
> 
> Would it be worth briefly mentioning in the commit message that this patch also fixes the issue described here?
> 
> https://lore.kernel.org/all/20261105130344.664336-4-guopeng.zhang@linux.dev/
> 
Thanks, Guopeng.

As I replied to Longman, I will add it.

-- 
Best regards
Ridong

