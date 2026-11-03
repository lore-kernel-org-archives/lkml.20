Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708964;
	b=nb7vZSwMe7BhKWCTAWCTOFGzssRz+hs7IFkybwqv48Gy6FYeST7o7Ne/yoLdGw2oh3Ai
	 YSRydpZbu2UualcTKGDtdxpwbn4lt2xu+hovRD+R3tyEFSvqE0KoRwa+9wn6p6bp6DkFq
	 j6J0zniyFWvfHm0XrMJ9xIqffmP/x/veSLaAWGQWloeMGUN40qtLGwKsjQ5pY07E+cKPC
	 QOPM9OmbMb4vUuutZpG5dQbybJUuxVtPFto1+4ZGfSehQnAuDF1TWgy5m0SyqhV/MUHj3
	 iwgtJOwtQ4SvrPRv2u5E1qCFRMnfEuNkmhXfCborenn2Qj1i/tTWKyQaE/v3HuPGimw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708964;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dhbxbNBi67wyAuSwSug1/s9Go4nceNJIYCCRWxPbymk=;
	b=TgoG6JOTWImR3+Gevs2FCgp/2HAjl8NE+oOg57POMT+zSLFc0zBPc4SRDxuR/d6oqLaQ
	 gSehbUeRE6v8gAVvvDEf+NJDKO3gb2Y+tu7gsdjVEu+8Kos6un42qIKWXikYbZwec5oNP
	 CgtZph+mnL+NUBSaHHq5M9rwBBWR+cAauOLij1kCylL9kUJKBgQW+Jgl/Zda71IUVfVfZ
	 pSlf0H+qO3ag+JVgFJ0m/cR9vLC+MO1r8l8Q6wBSYSKvOcJuLlJkhBKR3nW2Z7DcvvSu+
	 O5NbvmiJPuVCwDhD8z22x9WJ5qnRQireVrQoCTikoe+MyYBKHlpfYXPOVNb1u4KFdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="s/kSrIPz";
	arc=none smtp.remote-ip=95.215.58.171
Received: from mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F064606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F064606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=s/kSrIPz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PF34Ywqq3DrUpqxYnrkdwuEKtKWivf29bfPHI77oMDk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793708961; v=1; x=1794313761;
 b=s/kSrIPzXkIGCH9t1lqlcayf5MiiB6tA0eDDKjCDcWkTDapCIoQDJ/z9rDhaHDEPtasg/VQV
 q9hNCHRiFdNFLSbkddlo9jwSgKP7xH42LtKjol2mBGAoNw6qBDxAZmYyjdD9DjKa6/uhfWAtatT
 jVKewPGlRw6ouQuPiydoxNvU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 814c7918c8892395;
	Tue, 03 Nov 2026 12:29:21 +0000
X-Mizu-Trace-ID: 814c7918c8892395
X-Migadu-Flow: FLOW_OUT
Message-ID: <9c9827ff-4541-4a55-8e80-33b5298d8b16@linux.dev>
Date: Tue, 3 Nov 2026 20:29:09 +0800
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
Subject: Re: [RFC PATCH -v4 03/22] cpuset: generalize the validate_partition()
 interface
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long
 <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Koutn? <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Ridong <chenridong@huawei.com>, Ridong Chen <chenridong@xiaomi.com>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
 <20261101114206.2434398-4-ridong.chen@linux.dev>
 <950ad328-d16d-4cfc-b130-6a43530507ae@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <950ad328-d16d-4cfc-b130-6a43530507ae@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/3/2026 6:25 PM, Guopeng Zhang wrote:
> 
> 
> 在 2026/11/1 19:41, Ridong Chen 写道:
>> From: Chen Ridong <chenridong@huawei.com>
>>
>> Refactor validate_partition() to take the parent partition, the new
>> partition root state, the new effective exclusive CPUs and the CPUs to
>> be deleted, instead of a trial cpuset. A NULL parent stands for a
>> remote partition, whose CPUs come from top_cpuset. This makes the
>> interface flexible enough to handle both local and remote partition
>> validation.
>>
>> The housekeeping conflict check is folded into validate_partition(). It
>> is skipped when the parent is not a valid partition root, as @cs can't
>> be a valid local partition in that case.
>>
>> Use the new interface for local partition enablement in
>> update_parent_effective_cpumask() and in partition_cpus_change(),
>> replacing the open-coded checks there. The order of the checks is now
>> the same for both paths: empty CPUs, housekeeping conflict, then no CPU
>> left for tasks.
>>
>> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> 
> nit: is this old tag still needed?
> 
> Thanks,
> Guopeng
> 

Hi Guopeng,

Thanks for the review.

Yes, I think it is still needed. This patch was originally written
and posted while I was at Huawei, so it keeps the original author and
Signed-off-by, and the second Signed-off-by records that I am now
carrying and resubmitting it.

-- 
Best regards
Ridong

