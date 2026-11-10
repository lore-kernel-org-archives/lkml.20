Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324309;
	b=WC+Lqt4IgWcmCoQBWdwv9DR0teW9xWPU+OcUYwe4aPML7aTEwd3DtXLJo9Hl7c9RYJz6
	 lBbmLbaUv3h9K7499W43L3ZlkDI9TFAXh4CH3gTk6NloMr3Aw7Hbq/uojx9TZIH4xvVQg
	 RdUKxr7YhWRE7v58t8XbhAcwmnxtUeqXoTQlP6qAOyW9mXOiHN/MJbf9n6TTHhPhzZEXa
	 ettzQ9HzNylg7EY1ccLq3WiJ43ooQn9UsXOvKlgyC6ycJAfMtO1WGzwrU6LOD12hyDN8P
	 +9iDfX4jYht7p30dotPyYWSa0xj2akYyVX4pmSwSeg8L286Mo19S3MxFy1jaQ5umiMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324309;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZxHsaK8/Nc8cB5gd1xWnchJme5sokD+PiLu0QduYwF0=;
	b=mglIgrj8tUMRt1j+wj5/6KKgG+raxGCzVlfid4981EQ1UTeU+33DHm7/lDdp8Q7l1yUe
	 cvwa/CGw34Mc1h1UEnmd/L2TWWNLdGk33uSu8LQbuCcWPIJcjDfMbxFG3VbsmHMk8fFIF
	 Mtu/ok9WtHPdblHjp0tHqvvcgjwMcQJAjH//kLsL20GgvO5fxbhggfcTWN9neh450EYO5
	 f40pqeq5Kj9NL8Tmp/UfWUDSdm8ZKPlyFOo8JMvRFE8/TzqvSInI4MZGCNJD9IJ5YG+j3
	 VtxHqUcIB07/qN00ZdYy33s95HUH+QVhgTYCBNFw7dpsoQXGLqd2XWTySl1rJpt+l0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NBgLUCYw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F362F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F362F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NBgLUCYw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 514F01477;
	Tue, 10 Nov 2026 07:25:05 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EB393F85F;
	Tue, 10 Nov 2026 07:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794324308; bh=KyJGfKTqMKWcdpGq28AE4r7i+T5cmpj/njBVE62d1bE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NBgLUCYwVxUQk7+f5b/WN0ZoVuVFBcBpq3nkb/N8ILa0LarygzCPSmM+SmsZ+QfLY
	 P9ODmXUjwKufv2M6yQernOgA9xob4TypGD4z0do69DKUlNNZCfmA1lLDP8htII36Ba
	 MyO7xPuLNSymRfurSDCJhAFBi3R/JT2U0iGe7rZc=
Message-ID: <83fe9c8a-c2d1-4859-b17c-9c350609d1ec@arm.com>
Date: Tue, 10 Nov 2026 15:25:04 +0000
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
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
 <20261110084804.GZ9176@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261110084804.GZ9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2026 08:48, Leo Yan wrote:
> On Mon, Nov 09, 2026 at 10:51:30PM +0000, Suzuki K Poulose wrote:
>> On 16/10/2026 17:55, Leo Yan wrote:
>>> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
>>> it in trbe_enable_hw() postpones cleanup until another run starts. If
>>> AUX output cannot restart, for example when AUX space is exhausted,
>>> that clear never executes. Clear the status in arm_trbe_disable()
>>> after disabling TRBE instead.
>>>
>>> trbe_handle_overflow() can start the next run without calling
>>> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
>>> while TRBE is disabled, before attempting the AUX restart. This also
>>> leaves the status clean when the restart fails.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>    drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
>>> index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
>>> --- a/drivers/hwtracing/coresight/coresight-trbe.c
>>> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
>>> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>>>    	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>>>    	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>>>    	WARN_ON(buf->trbe_write >= buf->trbe_limit);
>>> -	clr_trbe_status();
>>
>> TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we
>> endup running the first session with unknown values. It is safer to
>> clear this at enable_hw.
> 
> This is incorrect. trbe_reset_local() is called locally on each CPU to
> clear TRBSR_ELx, it has been guaranteed when the first session starts.
> 

Ah, you're right. Ignore the noise

Cheers
Suzuki

> Thanks,
> Leo

