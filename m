Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114DA3E5EC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508479; cv=none; b=kjb1FmPc2sps9to6HRIaHlI7AEnHkiwDD2uPfHZn5rqNMW8gi+08fUuQjQc70FJcTUMxazoRBEC1LyD5C/SdTdjJnWkFa1P6wwV/ALXSRa2kmRsrSli0R3PfFjxmyAc9GkT/hjDNTEdFpte5M2YSD+gcM8eYjSx2bXgaEPH2sqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508479; c=relaxed/simple;
	bh=6qC8Ni4tDtc3gmlylU4vhslXgLxsNtNyHr1gOGFlpwM=;
	h=Date:In-Reply-To:To:From:Subject:References:Cc:Mime-Version:
	 Content-Type:Message-Id; b=juBBcjS29F5zplZHraVXVWEGtmJgcM+M1UKuqM5z/Gsslpec/kJemA8wN5YP8pgApHyRWTjrYLjsQBbelxvhc1UM68os+/iXrzmdlCr3l+ZBFZ+af7wNz+gwH+emOhI1ja1zwL0Ax08rbDMI8Ml28W/AqVX6l5pERxSY3//tr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Llnxih+M; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Llnxih+M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788508467; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Ax3wq7xG2etI0tSETSkKj7Cg6btJnJ1zFJzmioMSXQA=;
 b=Llnxih+Mq/Txg9CpBBhP2ULz2rVLBYdnJFDqbFgc+pHo+p43IVWT+GoL4e04ooC9i21BrQ
 ImuRdExnt/3SlFNHUr14Tv4LfMNpufczs+eK5r000RE6FavFl50IkTNX/bk6v8X3euheb0
 HvXOAk9xLmlk+2e6W//QHimYwA1S/kNScBLCeaJ/BvAnas8nMg2XaUb5CxlUehEYwCvrKh
 fMz+i2WXQk5SghEwY/cAxGEZTfQjF6rI2eaqwKTc2cPcNzr5Ob2jGzBeF8PlNcKVeNgy9B
 /xiuDrzqIV9Nn8EcJYi7tiauSPZ3nXt7VcgCcx51l2lTFdbhWSiOn9IpCfr2WA==
Date: Fri, 4 Sep 2026 15:54:08 +0800
User-Agent: Mozilla Thunderbird
In-Reply-To: <20260903092906.764a9098663aaae3e4e8fa48@linux-foundation.org>
X-Lms-Return-Path: <lba+26a9a7931+0868a8+vger.kernel.org+lizhe.67@bytedance.com>
To: "Andrew Morton" <akpm@linux-foundation.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH] x86/lib: make clean_cache_range() zero-size safe
References: <20260903071125.1946-1-lizhe.67@bytedance.com> <20260903092906.764a9098663aaae3e4e8fa48@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, 
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <x86@kernel.org>, 
	<linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <1e72a5a1-2534-4016-a311-9c66ddd05941@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 9/4/26 12:29 AM, Andrew Morton wrote:
> On Thu,  3 Sep 2026 15:11:25 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:
>
>> clean_cache_range() writes back each cache line in the range
>> [addr, addr + size). A zero-size range is empty and should not perform
>> any cache maintenance operation.
>>
>> As pointed out by Sashiko [1], clean_cache_range(addr, 0) currently can
>> still execute one CLWB when addr is not cache-line aligned. With size 0,
>> vend is equal to addr. However, the loop starts from the
>> cacheline-aligned address containing addr. If addr is not cacheline
>> aligned, that rounded-down start is below vend, so the loop can execute
>> one CLWB even though the requested range is empty.
>>
>> That gives zero-size callers observable side effects. For example,
>> arch_wb_cache_pmem(addr, 0) should not write back any cache line, and
>> memcpy_flushcache(dst, src, 0) should preserve the usual zero-length
>> copy semantics. If the rounded-down line is not mapped, the stray CLWB
>> can also fault.
>>
>> Return immediately from clean_cache_range() for size 0.
> Thanks.  Sashiko might have found a few similar issues in there:
> 	https://sashiko.dev/#/patchset/20260903071125.1946-1-lizhe.67@bytedance.com
Thanks for pointing this out.

I had a quick look. These comments appear to point at related
pre-existing corner cases in cache flush helpers, and one of them also
touches the DRM cache flushing helper. They are independent from the
specific clean_cache_range() issue fixed by this patch.

Would it make sense to keep this patch focused on clean_cache_range() for
now, and handle any additional cases separately if maintainers think they
should be fixed as well?

Thanks,
Zhe
