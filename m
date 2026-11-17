Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908097;
	b=eSGr9YZnfKIUindzXtN9W5q++AwwlPU+XUhd6Vg/aGuwE2tfNF5Z6hC8e65+RC9+ycrC
	 lcaHI11Bn7D/3N/h/jTvAtARLpksuMiQPrRvi91ZgjEt1jEA68o9putXKeJmwZB9VdMY+
	 YGWje7jqyj0v/He5lQLQg2PjTRn49bCvXsbiW2+n6Zc0MpKrI7YCbuiBnopayC3ir6n+p
	 ms23ymKXQ8VVPGhl/x05k1SosAQDlN6hAPBfPdw5rlZ6BEaT0B9d7gj4wIT1BVLkBW4zg
	 K4C47aH/HKJRuCm/mHHMVd5oN2oD+du0cmu73tUT+hX9SRCgDkqahtZdFcmXTwUB7vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908097;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=W1YsXbWBgPDg6QmDoypidC2lwCkMp91z6UTOMZbX2UE=;
	b=Irl3XAd0ScsHtgyirIT1Z1aVyj70AbRx6zrvcthRXPCBvjzLBtmoMMo2e0Mt/xeyop2J
	 Jdwxm0S3W5L8QYTosz5lPxs7YIKyo2+j86dsOuM9qFOmNLZbOJHNIqn4EqPetdHGDkA/g
	 c99hwDj+RlVkEmtzc6dkvHBLalBFWdo9M19jsyi6wCgKnMYPuzwsl7gWi0osEROuKKvHE
	 VYNZlci40c27L7MDb6SUYtQgYfYcbEl0AxcjYD3EPTVL+QOy+3xbhWufjTOvdfF7cmry7
	 +m8kPSaJew3RpvotXmrlLHllN5xFmzYgpuNzNypTaJktx4IcHlQ+l9riHLgUNzPkI4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JFtQSkzn;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E56606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JFtQSkzn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=W1YsXbWBgPDg6QmDoypidC2lwCkMp91z6UTOMZbX2UE=;
	b=JFtQSkznZOknHa8HZjyHu84HXxspA0TJzmkgv/DYqp9Nfsxm8LvuC5m9sYJi0y
	jPA1fgR4dcLOoxCCdlj619pnkDtcJg7UZU1Uq1gHsQ3GEzAR+WSOEtYQ99emqGsu
	i+RyFY3rVRSMkHLxONTIdJb5FMwQvrkuwEVp9ttv90D6A=
Message-ID: <43104eeb-100d-41c9-a783-360b866021ec@163.com>
Date: Tue, 17 Nov 2026 17:34:16 +0800
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
Subject: Re: [PATCH v2] selftests/mm: handle implicit read permissions in
 madv_populate
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: shuah@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Xionggui Chen <chenxionggui@lanxincomputing.com>
References: <20261112031811.56500-1-evers_chen@163.com>
 <20261117070606.3752-1-evers_chen@163.com>
 <486cd251-f7eb-4162-a1c7-92f04f480a6f@kernel.org>
Content-Language: en-US
From: cxg <evers_chen@163.com>
In-Reply-To: <486cd251-f7eb-4162-a1c7-92f04f480a6f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDnj0mYH_xqCdPlIg--.15158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWUKw1xtFWDCw4ftw1UWrg_yoW5JF1DpF
	ykJ3WYyF4rJF17Aan7WF1xXFZ0v3Z2yF48Xw4Fqr90vwnxKFyxJr47KayYk3ykJFZ5X3Wr
	Za45uasruw1DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um9aPUUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC6xrH0Wr8H5qycQAA33

Thanks, David, for the Acked-by.

I'll send future patch revisions as separate threads.

Best regards,
Xionggui


On 11/17/26 16:58, David Hildenbrand (Arm) wrote:
> On 11/17/26 08:06, Xionggui Chen wrote:
>> From: Xionggui Chen <chenxionggui@lanxincomputing.com>
>>
>> The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
>> without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.
>>
>> On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
>> VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
>> with PROT_WRITE. MADV_POPULATE_READ checks this VMA permission, so it
>> succeeds and the test fails incorrectly.
>>
>> Adjust the expected result for RISC-V using an architecture-specific
>> conditional, while preserving the existing behavior on other
>> architectures.
>>
>> On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
>> while the updated test passes all 16 tests.
> Thanks, please don't send new revisions in reply to previous revisions next time.
>
>> Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
>> Fixes: e5bfac53e310 ("selftests/vm: add test for MADV_POPULATE_(READ|WRITE)")
>> Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
>> ---
>> Changes in v2:
>> - Use an architecture-specific conditional for RISC-V.
>> - Remove /proc/self/maps parsing.
>> - Remove the additional PROT_NONE test.
>>
>>   tools/testing/selftests/mm/madv_populate.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
>> index 7fce5d0b622b..fa26ca2d8cf6 100644
>> --- a/tools/testing/selftests/mm/madv_populate.c
>> +++ b/tools/testing/selftests/mm/madv_populate.c
>> @@ -81,8 +81,13 @@ static void test_prot_write(void)
>>   		ksft_exit_fail_msg("mmap failed\n");
>>   
>>   	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
>> +#ifdef __riscv
>> +	ksft_test_result(ret == 0,
>> +			 "MADV_POPULATE_READ with PROT_WRITE\n");
>> +#else
>>   	ksft_test_result(ret == -1 && errno == EINVAL,
>>   			 "MADV_POPULATE_READ with PROT_WRITE\n");
>> +#endif
>>   
>>   	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
>>   	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");
>>
> No that's a simple fix :)
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>

