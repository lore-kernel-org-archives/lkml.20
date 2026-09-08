Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9CA47604B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856362; cv=none; b=RIk3SVe0D26aRNJI4YvoN9z9tnOJaNYmESdh7Dej0su37Gr4NMKxqtZbQEd8JC2jrLi8+jHXsSfkbXGI+BOSagyIXPA57woh3ks/Yg5iN7HqMlGOwIMoxM7+07a/bgC/dPNFOp48yaTL3KoEO597Mk0Jo3sWOBWEemFP0r7Vp44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856362; c=relaxed/simple;
	bh=E7eYuLoZleOAMi5aybzFXUMotlL4x/aHsP+MlHsKC0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R90fYWKuvBkzYFHtV1x1y8S2pR4O+Tm2T1/5FSoQA+5vixgm5xTpWOTp28ak24YWkme3p4umRifwHFEqQ7zXJkC/gMCPWIwIswVpEY9aeYe1JTnIHaf+HCpq+YXBU6NTV8iBatGEhTzynSku9t38CCmbn+aS+PaU2UdB0PFsg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhsa/3Q7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhsa/3Q7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dbe4d247so2409997f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788856359; x=1789461159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRu051t1h1A6nzfqSoDX3YwLGwKiY0jwf7brkaReOLM=;
        b=mhsa/3Q7cCeickXHq9ZMZ3uxWQdKmEmmQtdIUVXsKQW4BHdb5cdkzoO9RjMJFj2cYG
         VC+5hOVHeWJuTM0vsyNoM4Zk1Ms2CamqDJDW3QLQ4mq1mt+OyvLrxgO1kovI4UzC/559
         2eUgn8PZaPfu5Qq9cQIYoW6s9VMj+bF4vBc7DVdmFcxPme5tbvSQHBP45UTAeIGREmN2
         oSib516mITG+0NqLjtwMcXoxQuh8rmIMu6jmHnZA34MumsIyVsyZ/j2LwHEejCpIad6J
         2xdVDzwQpyAktbZz39JS9p4xw/mTKS+Cw1PJ3w164kB0qr7dkBC6o7dUvyj94VkK+nNa
         5O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856359; x=1789461159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRu051t1h1A6nzfqSoDX3YwLGwKiY0jwf7brkaReOLM=;
        b=cUoj4RdnOHc+dlWDhOaitkqNf6YM+Rd8NFQnWutzrOwsUPwxIHd+/5Y2Swe6xKgPIT
         11YW3247aUhMiT96z3KUQuWVAqqIi1UWMUNVjhgxLz1p2zt8vXDKQytXIqlJ1imNVEea
         S/2qEMN3fryJOjM79v9Rt6sZAaXmmwa0aEDtPVRZctZFKLqVvOG9e0EB4iWGRw2cJNo1
         u/jsJ0QhZTsfIRm4kPoRMEAAJRdPeeFqgPwyJXnS0A+OwNI/14GoonTCSXpsgaZcKULT
         dBKEP2u8YPAMygDAMZ7nFx78dlQGNai2Su1WDSd9oXT1PCRb5byVG7zF/v5wf/CYc0/V
         mvlw==
X-Forwarded-Encrypted: i=1; AKwUvBzXagiygXDGXaaPA95sUP0JN+BZvhMcjT2nuZ2+d5ld29LLik97+Xh64PSNu9NFeh5aJRYE2F7Et6/EAiI=@vger.kernel.org
X-Gm-Message-State: AFuF++mVpMRKxrlTQ+sHpN39cyWqGfdo2s1SPa0I4Arigy1UES1Mb0Zc
	2ScqQqXceyFs6sn0ROa/ZqAy3RBCHzz0PKxY7Xdz/jQ6L6vsxGcRkpSF
X-Gm-Gg: AYBFou33HvciX4X2XvDOs8CyQfICqWmenDQBRKQIdEiAcOp0UqsIdqjHcB2nOP2Jinq
	KqZhsw1xT9s9jqvfF//v/9+Kg/GpxjdaNsn8k0lQoO1OcwJ9IZLuj3nG/Zr4E/9Nr+JLkjWtHla
	f0qmBEWFeMfgRmEXBBaju70zRv4pJdJWl7+aMGtIqkkcXx/zyyxdDIOqUdXlZBmy54zeQ/Ez3H0
	MR5PF45QMNoYDYxaZb3ma1tH+DHy5OioBZR+LKibhcfi6EPnmsSEXG3zem8MO5WcH2XMu5s8V/0
	loN2UO+TNyw+sRswrTdYVzluUt2fDVWbCTrvIg+Ucffk5gXGdHOFQ3I4+bxu6fJnLpADGSicIWc
	nD34on22tZNdMxjaCj7jgov9OY5XsOi1Y7iPfJ6bL8yVgiW+T1M3ykzeotH5pIb1P7rjBoS4/i3
	jqOESX9Oz+JnduLwu3hqUA3HpLvvYP5ipbhomMH9D830Easw3vRfdfetmhWB+2D/EqiM7tR4Eo1
	dmCOkegx8P95XoFwjCXGseGEQU7LFVP/HWSo7Zsx2K6GovMPTR+/s063IPnxMFa5wrpsQXftoCv
	vPmUtow+xRbCkYZUeuxNFUsylEZyfGMNNO2V+jSVGDAWRQJLl1MgeOWnRx9QwHn7ByCSZbHuPxr
	oV2uaMJMwt6YpB+va9G2xnsZatuFrqwFf2w==
X-Received: by 2002:a5d:588f:0:b0:485:847f:fd9b with SMTP id ffacd0b85a97d-48586e4a62bmr48379038f8f.6.1788856359104;
        Tue, 08 Sep 2026 01:32:39 -0700 (PDT)
Received: from [192.168.100.51] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm35535684f8f.4.2026.09.08.01.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:32:38 -0700 (PDT)
Message-ID: <9fd0ed6b-e732-4485-a7b5-0380b07d3fc4@gmail.com>
Date: Tue, 8 Sep 2026 10:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: remove unnecessary ret variable in
 ocfs2_calc_xattr_init()
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Andrew Morton <akpm@linux-foundation.org>, kernel test robot
 <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202609040247.8B3lmoqX-lkp@intel.com>
 <20260907132202.48834-1-krystianmkaniewski@gmail.com>
 <b63bd2bd-229f-4636-9c89-8f1686ab087d@linux.alibaba.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <b63bd2bd-229f-4636-9c89-8f1686ab087d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Joseph,

Thanks for letting me know and let's drop this patch then. I've just 
received an email a few days ago after my patch was applied to upstream 
Linux and there was this finding, however I didn't expect it's already 
addressed.

On 9/8/2026 3:23 AM, Joseph Qi wrote:
> Hi,
> This has already been addressed by:
> ed57836ff300 ocfs2: make ocfs2_calc_xattr_init() return void
>
> Thanks,
> Joseph
>
> On 9/7/26 9:22 PM, Krystian Kaniewski wrote:
>> Commit bd7c05fb4a47 ("ocfs2: fix circular locking dependency in
>> ocfs2_init_acl()") removed the only code that could change ret in
>> ocfs2_calc_xattr_init(). The variable is now always zero, so remove it
>> and return zero directly.
>>
>> This fixes the reported Coccinelle warning without changing behavior.
>>
>> Fixes: bd7c05fb4a47 ("ocfs2: fix circular locking dependency in ocfs2_init_acl()")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609040247.8B3lmoqX-lkp@intel.com/
>> Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
>> ---
>>   fs/ocfs2/xattr.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
>> index 35bcbb0ff607..ab3b645983c9 100644
>> --- a/fs/ocfs2/xattr.c
>> +++ b/fs/ocfs2/xattr.c
>> @@ -640,7 +640,6 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   			  int *want_clusters, int *xattr_credits,
>>   			  int *want_meta, struct ocfs2_acl_state *acl_state)
>>   {
>> -	int ret = 0;
>>   	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
>>   	int s_size = 0, a_size = 0, acl_len = 0, new_clusters;
>>   
>> @@ -662,7 +661,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   	}
>>   
>>   	if (!(s_size + a_size))
>> -		return ret;
>> +		return 0;
>>   
>>   	/*
>>   	 * The max space of security xattr taken inline is
>> @@ -729,7 +728,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   		}
>>   	}
>>   
>> -	return ret;
>> +	return 0;
>>   }
>>   
>>   static int ocfs2_xattr_extend_allocation(struct inode *inode,
>>
>> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
