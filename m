Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54194963CA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160302; cv=none; b=D3XbLkddb5EMpaN7jbrtov5MoxhwDEnWYRoSg97TuY4A/fdSZDWftAAjno91VV87wYVMJSzsDe8ysek3mnZmL5hY1OQyzsFGGr3aJbMqLVJ89+oHXVMa806j7ijoaXR32l6Dsxe7xqwnrgS47mg8MMiYfQCZPBFhEHey2VxkUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160302; c=relaxed/simple;
	bh=kVNpesvgrfW7+la91+NgzPoHzggt5NrCEQqMCwVCfxM=;
	h=To:Cc:References:Content-Type:Mime-Version:In-Reply-To:From:
	 Subject:Date:Message-Id; b=i/qOyX8tH9Y4epL4FkNktElfHn6x/ZpPVitDNjZugreKFu9MuY3u2m+6daq/Ly7U/elSKgxJRQAXUvizT5lpZ1tvHGdsgbGNesltFS2suVVvJkWUldtMS2DY+bhfFaUduelWpSOE3gZXqSZ3U9BrV8Mlic31r3C7Da5d7tMa+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BGZw0I2C; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BGZw0I2C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790160256; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Nqv9iReYafi7FmQKoclNU8zhxDXLZYLgjK3zzzvhSHQ=;
 b=BGZw0I2CIfAyJQMeTz5ahQmDoXjqcKjUr1BF+LVZvJZGT4OZU+axDO5+Mp/t+UEcUq3YTv
 OPjzMO84zUVLIVoZXZSrknp3KVJ/b60hQHMDTdiaCB2Yj0rprdzY8i0ZUFIFQpCcC6cmVR
 Kk/DZNK1zG3ATzq+dHKCHCeXF/opmMLspcVzIWOjp/XwJFTQomP0W19eO+iACclmfAl0wZ
 SrHdZ4Bv+Tx09ju/EFFV87awu8fHexfyj8OnzLBgu33oUXxtoF1eBTeRF4OONlPwyVfEfR
 JBwIPKzSHhuMtXWbqxzyY7oaiPAS74Jk7L6oQnk8DlPJ4YMJccbKGoqUUHJNsQ==
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<clrkwllms@kernel.org>, <rostedt@goodmis.org>, <nadav.amit@gmail.com>, 
	<linux-kernel@vger.kernel.org>
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com> <20260921095359.3784458-5-zhouchuyi@bytedance.com> <20260923092819.OVgjJ9Gb@linutronix.de>
User-Agent: Mozilla Thunderbird
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ab3ad7e+6b76d0+vger.kernel.org+zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260923092819.OVgjJ9Gb@linutronix.de>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: Re: [PATCH 4/5] x86/mm: Decouple kernel TLB flushes from flush_tlb_info
Date: Wed, 23 Sep 2026 18:43:55 +0800
Message-Id: <956efada-ac6a-413c-ac90-324eae428025@bytedance.com>

On 2026-09-23 5:28 p.m., Sebastian Andrzej Siewior wrote:
> On 2026-09-21 17:53:58 [+0800], Chuyi Zhou wrote:
>> --- a/arch/x86/mm/tlb.c
>> +++ b/arch/x86/mm/tlb.c
>> @@ -1487,38 +1487,47 @@ static void invlpgb_kernel_range_flush(struct fl=
ush_tlb_info *info)
> =E2=80=A6
>>   void flush_tlb_kernel_range(unsigned long start, unsigned long end)
>>   {
>> -	struct flush_tlb_info info;
>> -
>>   	guard(preempt)();
>> -	init_flush_tlb_info(&info, NULL, start, end, PAGE_SHIFT, false,
>> -			    TLB_GENERATION_INVALID);
>>  =20
>> -	if (info.end =3D=3D TLB_FLUSH_ALL)
>> +	if (end =3D=3D TLB_FLUSH_ALL ||
>=20
> info.end might be TLB_FLUSH_ALL because init_flush_tlb_info() might set
> it so. But 'end', which is passed as an argument, should not be
> TLB_FLUSH_ALL or can it?
> And if so, wouldn't the check below cover it anyway?

I couldn't find any callers passing TLB_FLUSH_ALL as end.
flush_tlb_kernel_range(start, end) is used to flush actual address
ranges, and flush_tlb_all() is available for unconditional full flushes.
So I agree that we can drop the explicit check.

The ceiling check does not cover all possible inputs, though. For
example, with start =3D ULONG_MAX - PAGE_SIZE + 1 and end =3D TLB_FLUSH_ALL=
,
the expression (end - start) >> PAGE_SHIFT evaluates to zero. The
ceiling check would therefore select a range flush, whereas the explicit
check would select a full flush.

I added the explicit check to preserve that behavior of the old code,
but the current callers do not need it. I'll remove it.



>=20
>> +	    tlb_range_exceeds_ceiling(start, end, PAGE_SHIFT))
>>   		kernel_tlb_flush_all();
>>   	else
>> -		kernel_tlb_flush_range(&info);
>> +		kernel_tlb_flush_range(start, end);
>>   }
>=20
> Sebastian
