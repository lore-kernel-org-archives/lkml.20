Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CE294A10
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720302; cv=none; b=eBz55VRYLsEJIAiD2hfRmy+EisC6mdmtgYRljwHFaI25LpGvKVPWnqLuty44TpbaudlRp+JmwRIUapW4xOIJkq4+4E4zIvOfKkCxMc0H7/05P09X6Na1hiUfgnaEJmqkzkXvipV1GWqUNZdNSworStma0iKRpgnCJpuMBoo+cp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720302; c=relaxed/simple;
	bh=3aimT6K2JGeFaFjkJgg7TJftDXL/zIHvw4seWuqgM1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omLGiFtpm+GKhiBKCGIMyHgTENMRjlszb4Oz3M5ZfxG6E32uTHyL4p+9huTtn6dlmV+zH/HPB5UbM6KPlaHxDKgWqDsT05a6JcZUbjfMZVLDMWB3F2N+RMKrPpIyCbWI0ZZHpUv14Kod3zRTTJaKXSQGfasCcDpevyk+6GJ9iaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yG9p+Imk; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yG9p+Imk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789720289; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=FGJV51rngyzKywv8yDe/42c8NOW0jQAbCo5gyMHbDMI=;
	b=yG9p+ImkSx2jLQkdof04UjDS+yHZzrskAgj/sQUErgZET4USbhoO18qOxSmEhc5xHAM6LLxduOytJ5JNqPtIpZgBetQNTdjc7YLVPaI0+XijqahD1yBK7uasnAJfHgTmnJIzehd5Mg6rvHqcFXhY7Sh+4t3Gmv5pz357TUl+t2Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XBAf9VQ_1789720287;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBAf9VQ_1789720287 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 16:31:29 +0800
Message-ID: <6c9d4520-188c-42da-841a-fdd160fed008@linux.alibaba.com>
Date: Fri, 18 Sep 2026 16:31:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm: shmem: don't expose 'deny' and 'force' via the
 kernel command line
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org,
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
 <eeb806b057f2097a4d8d2edcb9ccf850aad8f38d.1789701677.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wRWYx8QkBNQqLUDwcBr014dErSqj4mmwL6u+3w7U2QPA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wRWYx8QkBNQqLUDwcBr014dErSqj4mmwL6u+3w7U2QPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/18/26 1:45 PM, Barry Song wrote:
> On Fri, Sep 18, 2026 at 11:58 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> Based on the previous discussion with Lorenzo[1], the 'deny' and 'force'
>> options are testing-only configurations and shouldn't be exposed via the
>> shmem kernel command line.
>>
>> So drop these debug options from the shmem kernel command line and update
>> the documentation to make this clear.
> 
> If it is a debug option, it should not be exposed through sysfs :-)

Ah, let's keep it compatible for now.

> Maybe we could rephrase this to say that it can only be switched at
> runtime through the `shmem_enabled` sysfs interface?

After the changes to transhuge.rst, this is essentially what it means. 
Anyway, I can make it more explicit in the commit message.

>> [1] https://lore.kernel.org/all/6e4aae7b-2c71-4109-945c-6481efde3636@linux.alibaba.com/
>> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
> [...]
>> +static int shmem_parse_huge(const char *str, bool skip_deny_force)
>>   {
> 
> The name is a bit weird. What about `allow_deny_force`?

Sounds good. Will do if no other objections.

Thanks for reviewing.
