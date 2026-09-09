Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3175678ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960918; cv=none; b=YR2qDjS2BvMlutsSqO5ZtjfBkzl3AB+1j81PNECXf9rtaVI5beYMXrWflnTJX+Rx/Pj/9HXy+CQoh4z0/XE5yEP8ZYwqMkNujdvOjUDYRD/pQ00V1NxCHTZP3E7sELK0u6T5nEKhDo8YK6xS6kA3K0Jbw0b9aIKbGXhSK59XXu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960918; c=relaxed/simple;
	bh=pYAXFeuFVimJwDLBUI4en4oiYVdoAA0vzKgHRiam0R4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/ei6BeKG8j8AEKdPBQPRC1dUnATBzdhi2vTROxA6ANfUHoxyNaM4DxUXEmtQ1r8YeTaMN/HocU+PrJhaFbQiU5hwxtryNKKb7eLNeBOexhBx4/BuBH3JRuSf4bG/6Al4FeLfm8ZWURPhnSmfSEhRcoIgBOFi7GtTCrUkIe/d5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXHo/mVH; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXHo/mVH"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-861f30636f9so88847947b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960916; x=1789565716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IF7gGSnNHvzeRxMeQJEXPfnNoiV1RgOi8xQaXNAluos=;
        b=aXHo/mVHlqCY04RXO/+yLgAoiVc8v+p/f7jRRx+a4qrfZE53PLwBi3PvDHKeSezwje
         600DrGithzi+RJ1XmZ3EOoX8JmRETN6Zc4cHC4rqHpUuhND3jQ3DqYcqrmotoOza2GkB
         CJS77HQnLiP0bDDemhEPiU1zqaQVl1sdD/n8qQ3R48qKTlj+lROE+MsJGjjE28dCDpNW
         4JTwZ+VtcLQwU2N0T0KT7EwhGda22E439GC2l/KMqEblQuLhKgJAK78mpc32BOpyUTgU
         Ez+wVzdJCEBcXgSyBpBA43HLwgM5ZfcA8IkhXh98NNLOMj0JBiKXTGMlpUXKQ875DVdT
         salg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960916; x=1789565716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IF7gGSnNHvzeRxMeQJEXPfnNoiV1RgOi8xQaXNAluos=;
        b=l1uYptJJR19q9wWGIA1/M01Qf4zyxjrriKRLWhrxIWHQy1EomOnxt9U9rCFLhaD8CK
         j0mC/TDoic5i7ssothtvW1aruNESI0zVn9dal2I8uPnXNl7zw57DQgEblmzZbE50A6GE
         GOY5Xt6lRgneND6fYhPo4h1Gf4AI2scXR/kjf5pIBTpwtSPlqdQxzCS1lrHFensXjS3q
         a/usMWF+OH3Acisf0AmFBnSiuLBcXKYWntQLnosd31HOLzUxOMvd5OQ9XnUzIh4FYihN
         BxzKxO+63Xwh3M9DUWRQFos0hk0SEHf2RaiHIITEF93+qUI9hQdbq5sUhgx1GS95nAKd
         Wiow==
X-Forwarded-Encrypted: i=1; AKwUvByZ5ae7fmJm29gRbR/tmUjcWNQQbX+zoZI/oUILWVf5DFlSHk2it6zoWc6f0n6VgvSWVD0njMniruPgrbk=@vger.kernel.org
X-Gm-Message-State: AFuF++n5vIFb7bjzBi+TUZi95iwAp7gNM4SoskiL/tjcdrKZ5OKfG2pT
	jVtrGmzsa51u6RFs5PzqdWDWty3sWRoLA+r47ZtiRKSPbWDuH4rHzhzj7Vp9BSchyaZ6JElm
X-Gm-Gg: AYBFou0kpkB+SjuEpCxEs980cErqNkeUhkZI4LHMWlHCDLzd3CeyRhliM8D9LhYd5le
	mJC8K5muHCrlPaAOFnebC9zTgc2dMtwOWyh7lrHNfM1DiQzWojK0nwrzPFD5MMZ2pDxmrZ4UapO
	oXyj9O/gukYQ/meI+ODcvMcMIlKb7iqSrAURTvb0nVb2t/svDhG6MVVd7BxOzk/4KfOh+5h0JY/
	W4uEGwW6hBEvS47+DB5XKk85d3/HGZ2eQip92GfVB8euRZnabXsKLVPUQ76zECXY26y2Grauus9
	XQukSPITJCMhpqKpy16GiAxdWLGXlwKCDNjn3Mdi1AK2xFgEa0ru40XOhxvPd0ZiX01RpvS7D/a
	Ygo+xxG4Q4aUnIk7N98pnDhJfWJJ12mS3KPcJA5dBKMD5lSIcsg6CSUC5QlgoJ9BffWqeNLc1uZ
	QueWMYgf1CPVpr1bMPj7Swgs72aYQt0kbm/tdyz80ttUp8lDXgUGpIK68FT3TIsk9bow==
X-Received: by 2002:a05:690c:ed6:b0:816:b469:cd12 with SMTP id 00721157ae682-87122f5564bmr131074277b3.8.1788960916082;
        Wed, 09 Sep 2026 06:35:16 -0700 (PDT)
Received: from localhost ([45.112.44.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-881575de059sm2427287b3.18.2026.09.09.06.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:35:15 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 9 Sep 2026 21:33:02 +0800
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Message-ID: <aqFfvCpcrbN-8qcs@Rk>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-9-coiby.xu@gmail.com>
 <c0d5f2e9-9bd1-46fb-8111-d3af6b6c9e66@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c0d5f2e9-9bd1-46fb-8111-d3af6b6c9e66@infradead.org>

On Tue, Sep 08, 2026 at 10:46:03PM -0700, Randy Dunlap wrote:
>
>
>On 9/8/26 5:36 PM, Coiby Xu wrote:
>> If crash hotplug is supported, dm-crypt keys saved to reserved memory
>> will be taken care of automatically. Thus it doesn't make sense to use
>> configfs/crash_dm_crypt_key/reuse. Not reserving
>> image->dm_crypt_keys_addr makes it implicitly to disallow using this
>> API. Currently x86_64 and ppc64le have implemented crash hotplug
>> feature.
>>
>> Also update the doc accordingly. Note two doc issues are fixed as well.
>>
>> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>  kernel/crash_dump_dm_crypt.c              | 12 ++++++++----
>>  2 files changed, 18 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>> index 7587caadbae1..0bf2eb100a05 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>
>>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>>      # Add key #1
>> -    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>      # Add key #1's description
>> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
>> +    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>
>>      # how many keys do we have now?
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>      2
>>
>> -    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
>> -    # memory
>> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>> -
>>  2. Load the dump-capture kernel
>>
>>  3. After the dump-capture kerne get booted, restore the keys to user keyring
>
>                             kernel is booted,

Thanks for catching this typo! I'll apply your suggestion to next
version!

[...]

-- 
Best regards,
Coiby
