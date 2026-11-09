Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237671;
	b=27Ab5QEwfv5koLf24ZXwfTQPZqvjE4WA5/tIFD8OvdAgJTWbqsIgjIOk7VM2qbYYdwc0
	 PTfgSaF+S2rvoW+HZ6rHR9j2HvQi3B8YnZYiAyDCveDqmOYCMZPjoLmWQAWLVWkSWcJfV
	 Vzav+oGJcdQgrwiFktxqUX9AtOGw+a8WS2BYGsezTs4CUjgw84/JGwVOcHNuVjdwjXSM0
	 szXBSxcbDVDetKvfGvXJHpChGp6EUMFuhLfdWXxjhybmJy3P/bj4ZSLutlUhVcFj+mHco
	 sMrRV5ZhfIq4Sl167H5d3tTVPPubdXmzbGSXV0E74IY509YMcX46plrdxlGIukEN6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237671;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OEaMkvm58VQCFxWgZiNZttKo9RWAkrg2Jpi3EFl1TRY=;
	b=xZZt+qYhlsNzo3gtneFldEqbUTn7iXXI2wQaqfoVKTOm7AdP8R/0q/WasdThwjtnBYl2
	 lYb2iQQ8i7KzDcK5QtKVqp9LflUR0Lj+P0ltWHMf4cMVXkfl+hpVyALfrtswyOUnCb4ju
	 P7PbhVNqU8wVmAunx2nhV8xt3lpYnQOjtpk0Fu2naUW1yqvvYi3iwnjbZsAivtIYQXGPg
	 BRO8wYR38QwIncaBS5/9Neh/MRiLIxKbrV8dTI4SGqFhauSyJAWcipvbKMNx9pYg6YYp5
	 4PwuRjQ4n33+gCEbDJ3qCUgcYIa2SjoN1wmt1Kt5gwX0o3GkCPly37xsp2JkXT0k3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15653606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15653606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kKN1FrR88/XC1lM8GArCouvp/sFgokTYp7hs6x2CE6E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794237661; v=1; x=1794842461;
 b=hzKzNuukR/bLfPSEESlfqIPRohJP6/oZvgw4/qj4TEKohZ4CqfAypR4+ThZoVCV2HrveS0kV
 IVm+EbUqTbnyTGkmYSjsTpbiwcR9ysoXMp8gOk0ovaRCKzbmqLLDSIGJtcNzZK3BL8YXhGLcw6u
 ruyRT6LdZJqOU4b+4KnrUMRc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 14f7012e0815e2fe;
	Mon, 09 Nov 2026 15:21:01 +0000
X-Mizu-Trace-ID: 14f7012e0815e2fe
X-Migadu-Flow: FLOW_OUT
Message-ID: <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
Date: Mon, 9 Nov 2026 23:20:53 +0800
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
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Guopeng Zhang <zhangguopeng@kylinos.cn>,
 Ridong Chen <chenridong@xiaomi.com>
References: <20261107120100.3587595-1-ridong.chen@linux.dev>
 <20261107120100.3587595-4-ridong.chen@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261107120100.3587595-4-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/7 20:00, Ridong Chen 写道:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> partition_xcpus_del() only updates isolated_cpus when the partition that
> gives back the CPUs has a different state than its parent. CPUs that were
> further distributed to descendant isolated partitions are not taken into
> account, so isolated_cpus_release() has to be called afterwards in
> several places to walk up the ancestors and fix isolated_cpus.
> 
> Make partition_xcpus_del() always set the isolation state of the given
> back CPUs to the state of the parent that receives them. As the
> effective_xcpus of a partition covers the CPUs distributed to its
> descendants, the isolation state of those CPUs is settled at the same
> time. Boot-time isolated CPUs are still preserved by isolated_cpu_update().
> 
> compute_partition_effective_cpumask() invalidates a child partition
> without going through partition_xcpus_del(), so do the same there: the
> CPUs of the invalidated child take the isolation state of its parent.
> 
> As the parent may be shrunk and its effective_xcpus not updated yet,
> only do so for the CPUs the parent still owns. This is to keep the
> isolation state correct for now, the in-place invalidation here will be
> removed later in the partition rework.
> 
> isolated_cpus_update() assumes the old and new states are different,
> which no longer holds now that partition_xcpus_del() proceeds regardless
> of the states. Drop its @old_prs argument and the WARN_ON_ONCE() so that
> it simply sets the isolation state of the given CPUs, and use it
> everywhere. The state check in partition_xcpus_add() is dropped as well,
> as setting the state is a no-op when the states are the same.
> 
> isolated_cpus_release() is no longer needed and is removed.
> 

Hi Ridong,

Would it be worth briefly mentioning in the commit message that this patch also fixes the issue described here?

https://lore.kernel.org/all/20261105130344.664336-4-guopeng.zhang@linux.dev/

Thanks,
Guopeng

