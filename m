Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196047;
	b=5YZHbXJkpQ4fUu/RU38d1PoGoEKSoNVU3JCIVn4BzbuS3sOts8BZNQEGPyxmEj6DERS8
	 PP4NFKSRVeKrrVbOG3vz5NMoM48bogpsh9UsmhlUJqKcIbVf2kR4FOP6ZxIohndWd/TwT
	 bYkUz5Jt8tgdmIwBYxz/xC81JKK2S7IResEs+N1WbF8Sqw3u2sj2lyAnwYsehz9w3ENgL
	 qdaZVAcLia3kD8neCn4nQ69nQ1z5uSSrAF/aLQ1zGpxN0ET0ZOisb4a/xljK7PfhiUnol
	 CI32Dm1esBk8rP3YUgkyr1bxS5+hQAaqDlb8hWLTnd1K+moLaplWn8WgUxeFYawx+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196047;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-OQ-MSGID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7+1+PZFd2GII1zKvv2aHrH8V0Dvf1LcNr2LNa2B/+bw=;
	b=anLQN602dof11IpBhSMYM7hcOuodxXU11L5+Rqpqqq6x1UtZ8dCSs/ertXyGDn0KsRTw
	 +UPKtzOr8vHLhETLJI0M16NAa+SvvRwXrBThjKhfVp7KX76+jCX+akHGaVhbPHpjDEAP5
	 9PLFbu97x/kXRIo2vl8MIyICD56PenkvjRgDSN2Up4OiJpBPrQDUcnMtW/sDtynDTizYg
	 em9Vk22oSSnzmAMcbg/gY4BeO4WA9OfvBiHNZib+OFA0wPVDiCKfxz+4kcXEdhlWV6Z6T
	 Tq4B0gwI2OAm/EtFwNhb93MozKFHP22f71w5xrhY+YfEkOGDnDKYtfBNb9LtkW6uPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KDC2SmH3;
	arc=none smtp.remote-ip=203.205.221.236
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4204606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4204606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=KDC2SmH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794196038; bh=7+1+PZFd2GII1zKvv2aHrH8V0Dvf1LcNr2LNa2B/+bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KDC2SmH3UdUqTAj/naxHFvfTao7XlpSet7tQIZzg+YBlYiMajF461CMioKaj/0pCy
	 I5mx2c1PQD8Rzhbl3Pkk4CTd89aviDffBfYETGfgiPu1svwCEhYLD2QrpQDLYpia7j
	 FRkDC1GNAEMhw90KrGYcivjnNGgrmoKeF7Ks6ZDI=
Received: from [100.125.153.207] ([139.159.170.67])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id BCF20465; Mon, 09 Nov 2026 11:47:15 +0800
X-QQ-mid: xmsmtpt1794196035t0rwr8jma
Message-ID: <tencent_90CC2DA414E74CDF71D24A6ADAC784336206@qq.com>
X-QQ-XMAILINFO: NOGirAuTnwHF/KpxD9OFSpM3LriLQs2mH/B0slkH4kz1eDZ9sqIUCKMvAsfqo+
	 pLJXc/Fu+EW2AJk7AkmtqhruK1se1lIbdRaT9NiNIpMKzN+cQ4ytdg69LVtsoGJ2zywNMaEDW/Ck
	 g1Om437R3M2X+3/ZDZJTgo8hcARoNJ+oxvMs/xf82IOYx2zxrpKwwHlEQddO31wzmwFuEbwWobm4
	 ia3HB38VCW+ZMdYN08EgcSQ54ZhJmr79++EaLqp7WSScIH0fe5R5FWP85TGasObfpZwmpEAC8YwT
	 x6heU80jK0DqyBTCq/KyPeiBnZBPjJqAC0ugnj9hVpLklUP2RaaolOm8NuXdt11ULirrvvi8ExPV
	 x9x2zlGvUBkD1AsPf62urvPQk8TguPOMS02f4nP+ASVv89HWI8GqtGh/zBU5hraTLHlc2vMxKgAg
	 vAtcQzjsI15W1aLEDGqx+Ok2w83TVMZIjEQGc0jaRPVHDyUkBMZGw7QTtVZb09J89cgCNLkUQInl
	 SenKGqMFscDKWuC8YDf/RQBhHH26yyoNWMgszcbL3iJwDfPg6fUxJPTPKVfJHDQoFG9orrnBXFVE
	 oR+1tBDHrJ6UYNCG0NmynRLjXeAIK5wb+qfvR9/ijVIeo/6osIX4k9Ly9AAmhudAHWPV8Q0SiEuk
	 9upCL5bS5SfHZkqwQAPuaeLfFTNlyKxpJ8ju5X19NdlGHJrR8tnz4/G/9f1Ek/VCnw88MMtyw2tF
	 u8FdiMK0529VKzzCLSvURYXbBtmBb/ql5KIez0IvEHhXvPBMLMbJbjLLRvJO0x8GPNyRjd7ZTG1f
	 pmoIWM4sLzo6p/VSnERfdD0m4tAHON2iExo6kytw8qFu1Lv6zxdGyCFNRRTKJC/9uXGYmWe0d2cD
	 oatJwXWawuaItDqYTmYNkNv4FYzviFps0f20ZnkchHxYYdm42M3J25tsVJxxtAnYNTCxIrSFa866
	 OPiobQH68ZigCsfkdH5ZYkz/2YT/Y2svAbsmlQIOjvdop5JpxGZhiKged4rOS85a7d1rOdDFfsdr
	 tU86MNLAuv06+uUHNXPHpDIP51+4mSMGJvhr34s6X8JjNGPWSsNuCLZgrf9/o=
X-QQ-XMRINFO: M/715EihBoGS53Pa7FxY/h8cOY8DgkUKgQ==
X-OQ-MSGID: <676c4f1b-1daa-48d9-b444-11db0fda69fd@qq.com>
Date: Mon, 9 Nov 2026 11:47:15 +0800
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
Subject: Re: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
To: Catalin Marinas <catalin.marinas@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, pratyush@kernel.org,
 leitao@debian.org, mpilaniy@redhat.com, yeoreum.yun@arm.com,
 graf@amazon.com, pasha.tatashin@soleen.com, akpm@linux-foundation.org,
 baoquan.he@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org
References: <20261105125442.2282987-1-ruanjinjie@huawei.com>
 <au4JOjnQlx2aSpiE@arm.com>
Content-Language: en-US
From: Jinjie Ruan <2118537295@qq.com>
In-Reply-To: <au4JOjnQlx2aSpiE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Catalin,

在 2026/11/7 01:07, Catalin Marinas 写道:
> On Thu, Nov 05, 2026 at 08:54:42PM +0800, Jinjie Ruan wrote:
>> image_load() adds text_offset to kernel_segment->mem and subtracts it
>> from kernel_segment->memsz.  For CMA backed segments this breaks the
>> load path: the payload is copied to page_address(cma), which is the CMA
>> base, while image->start is set to the adjusted address, so kexec jumps
>> into the middle of the kernel.  kimage_map_segment() has the same
>> mismatch when a segment has been moved.
>>
>> The adjusted memsz also breaks the release path: the CMA pages are
>> freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
>> allocated, leaking the tail of the allocation.
>>
>> Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")
> 
> This commit only removed the randomisation. The one you want mentioned
> here is cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0 in preparation for
> removing it entirely"). Although this removing never happened (see more
> below).

You  are right!  we should correct the commit.

> 
>> TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
>> LTS kernel carries a non-zero text_offset.  Drop the adjustment and
>> reject images with a non-zero value instead of booting them from a
>> wrong address.  With the adjustment gone, segments stay at their CMA
>> base and the release size matches the allocation.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
>> Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
>> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v2:
>> - Split out from the patch set.
>> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
>> ---
>>   arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index 78b1f956d8d7..7d6baea3d28f 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
>>   	kbuf.bufsz = kernel_len;
>>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>   	kbuf.memsz = le64_to_cpu(h->image_size);
>> +	/*
>> +	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
>> +	 * honored; reject them instead of loading them at a wrong address.
>> +	 */
>>   	text_offset = le64_to_cpu(h->text_offset);
>> +	if (text_offset) {
>> +		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
>> +		return ERR_PTR(-ENOEXEC);
>> +	}
> 
> If it's only CMA getting it wrong, can we not just set
> image->no_cma = true here and continue as normal?
> 

Yes, it also works.

I tested this cma problem on QEMU arm64 with cma=64M and an Image header
whose text_offset is 0x80000.
- Without fix , it jump 512K past the CMA copy and never boot;
- With the fix, it loads from normal memory and the second kernel boots.

> While text_offset is 0 now, I don't think we concluded it should be
> deprecated. There was a recent push back on the attempt to document the
> always 0 behaviour:

Thank you! I will fix it with your suggestion.

Best regards,
Jinjie

> 
> https://lore.kernel.org/all/20260604140839.1930847-1-linux@rasmusvillemoes.dk/
> 


