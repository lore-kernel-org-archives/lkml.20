Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6D2D0C82;
	Wed,  9 Sep 2026 05:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932773; cv=none; b=UkWqlJkNgXZx7bVXnMxDbSH6TmCPFZwWsg8He0kW8iZ5lmtLfivmSqdbPjiF7x2QrNCpP4Mc/9Az8YYTenXvWeBLDazT4Az+31E4zt/B3edoUv+v0TeFrHgDO8T+SfTgsXnsX1tnBTFW9n/wwTGvUkpoOhhNC1uRAIkoerFc+r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932773; c=relaxed/simple;
	bh=k9FnsTbUM4kasdZRxHlzpexgVujgyDTwyLPUKLqlA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m90F8SFx3Uh9LMwKzIzKlSF+dMaleyOELsMgOJiQOEAdTsXXnA4jx3NKitntrGr56KZX2luA+wTeW21anJ5dcvvS4fFzYhrrSn9n75YRDW1w8x67jpE/wOa3Hi3C+k1mxs5UuvvQa5CPsONX1wjoxQxPukm0eadbTkD/BFO9ipk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T0cuy4vG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T0cuy4vG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=SBM06s4g0kz7WS7W0WwfUM/yQZv7aEJIy1mSj1Suf2A=; b=T0cuy4vGnRVWzGLlFpeqepm5yI
	nN/a3ScRtQlRiJDsxHj7G3b2yuume1i66BbQnDaA0ehQ9c5PpoLB9WN39nOzqSV+3CS6QUMgfDUFQ
	6uFpz1se7xPMwX+RVOR8aG1oSGz0gQ58SyhyuF729/OstExP3LVD9F5sv+vUA1orAvoNSQU+VOYfW
	B3jnAQ7wNAOFBZsiSvztUmy8Avtqd0qutipI0rok5CEV4jpGehGUruH1k7f8K4q2XJ8MkgLwOK/B+
	hbz29Tk2s1VL4zFlY7CgEURFYHglh3JcMl1+TaZscPjJEW8Cmn0Am4fe9ZZ1j1hv6s7f8JC6o00/u
	nbEhlwIg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4B8H-0000000AoeL-15Wq;
	Wed, 09 Sep 2026 05:46:05 +0000
Message-ID: <c0d5f2e9-9bd1-46fb-8111-d3af6b6c9e66@infradead.org>
Date: Tue, 8 Sep 2026 22:46:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
To: Coiby Xu <coiby.xu@gmail.com>, kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>,
 Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-9-coiby.xu@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260909003657.1570544-9-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/26 5:36 PM, Coiby Xu wrote:
> If crash hotplug is supported, dm-crypt keys saved to reserved memory
> will be taken care of automatically. Thus it doesn't make sense to use
> configfs/crash_dm_crypt_key/reuse. Not reserving
> image->dm_crypt_keys_addr makes it implicitly to disallow using this
> API. Currently x86_64 and ppc64le have implemented crash hotplug
> feature.
> 
> Also update the doc accordingly. Note two doc issues are fixed as well.
> 
> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>  kernel/crash_dump_dm_crypt.c              | 12 ++++++++----
>  2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 7587caadbae1..0bf2eb100a05 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>  
>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>      # Add key #1
> -    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
> +    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
> +    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>      # Add key #1's description
> -    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
> +    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>  
>      # how many keys do we have now?
>      cat /sys/kernel/config/crash_dm_crypt_keys/count
> @@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>      2
>  
> -    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
> -    # memory
> -    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
> -
>  2. Load the dump-capture kernel
>  
>  3. After the dump-capture kerne get booted, restore the keys to user keyring

                             kernel is booted,

>     echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>  
> +For CPU/memory hot-plugging, you can reuse keys already saved to reserved
> +memory before reloading the kdump image,
> +    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
> +
> +Note if crash hotplug is supported, this API is totally unnecessary thus will
> +be disabled automatically.
> +
>  Contact
>  =======
>  
-- 
~Randy

