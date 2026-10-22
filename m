Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636093;
	b=AMnnaQXE3ol7Yydk7SO8A6WqzsKGtlOkx1b5uPPajZJjPMOGcGJzBonuW+paR3P7bcUh
	 ByoQwA4iImtKYmDPGxTueu0lzvVDradG/nmAuUKNragChPgBRkabbasPXo6bcNBygpsrd
	 hANv2K8+mDazBRz3jFPb8unQIkMctZ7HnEjnJmW3t+knTV3WptRMQa2iJGWHH084zcYxZ
	 ilXAK/FbMtIPAEgp9lOP6l9AI1Lg6yW6/BmedQbptZu14c12wxTQCWOEhdyH2qhRlCUOp
	 pm41hY4z1FITTjjY/oBF/vCgmfnuxmvI5ZnY8rBLEqOiaE5jCtoOOGKOBZ8Dce2n7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:To:Subject:Date:Cc:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=xruEMXmxKsYyy3/7Uv5aUsYVZ6xRBTshqU8cnD7X6m8=;
	b=T5R6TwI96tYxvdNtR+mAbf60Jzar7NId6IjelU9/ckdsNRbU01zNcszZG26tlbHLefay
	 ky3hZ5IjpwRI5sY91c40DOunBF6QLjS4McLSQdYF4ORdJmpTfwNVRmHz73QzZ6xlUAuwO
	 4H5UVgONXLTs9iC6yfbt0Z6sKPUWYEqAcbu7VEAMdb+5iLjh6KI6WXpe1eDJZMIfqEuqz
	 Zk2PvN/baJVU5Y1FIUAtB0AlDxxwdyCr6UkDOq9e9xoiFxFrEz6bs8R+cfG+YrCG5u3qP
	 2oFGBWJyn6ZLZoQGtFu1i2Kv3faWZILq8yo1J91dMeqi0gSctMwuBi8K2SmbMaGiDaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=utexas.edu;
	spf=pass smtp.mailfrom=utexas.edu;
	dkim=pass header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=nXBXmYpB;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031CE606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=utexas.edu header.i=@utexas.edu header.a=rsa-sha256 header.s=google header.b=nXBXmYpB
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d290b10a35so607825eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1792636091; x=1793240891; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:date:subject:to:from:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xruEMXmxKsYyy3/7Uv5aUsYVZ6xRBTshqU8cnD7X6m8=;
        b=nXBXmYpBirikcttyx9/5JLJT4vDIsSgTxxKc2Q+QM0P/YSHZVvJlli/wRgaW6jlwIJ
         8gx+AYrpMZRCMw7qLUaMlg2yRrJo7k30lyCmwZzaeOHYU5b9NuXF1kSZmY7Un26bKGFn
         ppwkRPzNEWkIv23LWxaLgs/glqQYstb1P19e1btE4ajwkgKywl59wDcz5Jy5VQUsYEiQ
         B+KdRJE906oj/8ryBUMc2NdKfo4YMajjBqVxWoy89MxzxuTAl4Cd0y3yv1pI9JFjzNWe
         3jYE5hrslakvLkCPbW8dZr/kWE8tjNUsDoG9aeTtgHbSwFwmmZVIk8iQbP1Z01jdbQMZ
         ozow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636091; x=1793240891;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:date:subject:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xruEMXmxKsYyy3/7Uv5aUsYVZ6xRBTshqU8cnD7X6m8=;
        b=XMBdbx7V2YI9mFvCKgGvvDdSUUdc4qzjQY3a3iAOGw/JkDfCxDzj9SjXvtx1MPdQVL
         X5Az29MkA/T2zj1wThJO65rqaXsJfN0t7ehqhY4zaAKPQ5fwgsCjAqOR9TsCyvfXrXWq
         mi+FdIUd/XosVu9sqMDK0w73X7SYEWu9PIYPBre6Cf5xFbPulJkyRQuWKzGERzyRfIJ9
         xH3JtHDmvLgg9CAsFFG7xzWEAjkkXfL+y/N/g9kNDn7AMQSB1OMd44zL/2Czjw+JVQ2o
         G2tMHScM21j+F9m3LTC51UT2RqO3tvwvJXTo+hZUeju6+PGCIs6x/7zA7NnfI1EIEySb
         ZBRA==
X-Forwarded-Encrypted: i=1; AKwUvBweXVS1zYdrkuOv/bF7hTJiAyspwdNB6bGe1druedM0UpkXzgkGtC/xknWrvSCwO3Wt9dJazhQcd1I+tso=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2tPwabD8YOuGJVTQGz/nc7wuMVo+DOgixLTE6ymD4LbuT3e4K
	dVJYtE6fIT20myvNSDjqtAdl6xR9eui1iB+QMCP/yQ1qT1NpndEPRMnWZ0lYqTZhtz8=
X-Gm-Gg: AYBFou1uMjl99YjOIj2vhKci2LJ8Gbz3FRDt6PNZrz38702AteNvqK7Gm9Y7s7R1Ejj
	mqljfO4Quq2yQ3iKLq2mTRV3XPHlSyEnV49h1+l8dS9EYU7vacqYgtgOq+E+WVwWRpN45DGIkoW
	PDuUG/zBAjadWPtNDAoafRKi/h2i20/eQUohULVpHsKwj4PeMIYTFBezr03FPH8L2e2UZU3ZoVD
	SQLMKKmxQCNqNJEpDasQNX1vfWetIABT2ggebfO/FNZny+1oVRtRr+9kMANQZTUdWXQrghb5x+I
	xj5pBygiVqFbEo6aOXQ5LUkhfnXxqBIEa+67FnKbPqcUAb7nyGAxXiv6kIel25JnowwByZWG7ax
	L9+gollZEhnRWCQsSBY4L4XJNXm2Hvvf2spIyxkRDYhnJhf1mu/172xDOw3JpFFCJ+CrenJWRip
	sZch6wbo+MNQK34BUXnzVoOUjgVf0KT827kPcBanOi8DbYt419vnawGsusrjpLO9f74sUTxULl3
	/nX7UrtkopXRhmuHnIhJxqPrE37Sya5kklceckD2Jvo+Qh8dySN5RRg7lbYI6fxU/M27qwNcZpt
	vnEDgD5CPS6SAq6f5mWyNQrh7zeavzpzYfiP/TuMmFgumrlg7Q8MtlWRe83/9gC62ou90YiArPD
	pJ2u49KxvAOpDPjrBw8lAf8m3BIOkZaKRAB41fDOx8SzAOuWyeiUMzKATKHh2VHSCDbcweLZ/9B
	lsIm7l4xAHDPzpqBQryDc=
X-Received: by 2002:a05:6820:813:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-70941fbb729mr2897081eaf.56.1792636090730;
        Wed, 21 Oct 2026 19:28:10 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([173.174.112.101])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm3431624fac.1.2026.10.21.19.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:28:10 -0700 (PDT)
Message-ID: <6ad974ba.a8122b97.39a7e6.f867@mx.google.com>
From: karim.sabar@utexas.edu
To: matthew.brost@intel.com
Subject:
 Re: [PATCH] drm/xe: Use kvmalloc for the VMA ops page-table update array
Date: Wed, 21 Oct 2026 21:28:08 -0500
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <atkLLH47Zd6vMX3B@gsse-cloud1.jf.intel.com>
References: <atkLLH47Zd6vMX3B@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hey Matthew!

Sounds good to me, the fallback of trying to bind the vma one at a time sound=
s good to me. And it is actually a bit broader than my patch since it covers =
the -ENOBUFS case as well. It should also be easy to get through drm-xe-fixes=
 and then backported the normal way.

I can write it as a v2 & test it on my Panther Lake device, I have a small re=
pro that does about 20,000 mappings and fails after suspend (every time witho=
ut the fix). If you'd prefer to write it, I can test your patch as well.

Thanks,
Karim

On Wed, 21 Oct 2026 11:57:48 -0700, Matthew Brost wrote:
> On Tue, Oct 20, 2026 at 07:08:27PM -0500, karim.sabar@utexas.edu wrote:
>> From: Karim Sabar <karim.sabar@utexas.edu>
>>=20
>
> Thanks for the patch. I do see the problem in the old code.
> Unfortunately, we will not be able to pull this into drm-xe-next or
> drm-xe-fixes, as 7.3 is already out and 0e33330f1238 is included in our
> 7.4 PR. As a result, this would need to go directly to stable.
>
> There is also a risk that predates the series containing 0e33330f1238.
> If the bind has to run on the GPU, you can still get -ENOBUFS later in
> the bind pipeline if the bind is too large to fit into the
> migration-layer BB. If that occurs, the proper fix may actually be in
> xe_vm_validate_rebind(). If xe_vm_rebind() fails with -ENOBUFS or
> -ENOMEM, we could call a new function, such as xe_vm_rebind_iterative(),
> which would run each VMA requiring a rebind in its own job. This is
> effectively what Mesa does in userspace when a bind operation returns
> -ENOBUFS.
>
> We could probably still pull that approach into drm-xe-fixes + have
> naturally backport to stable, and it may ultimately be the better
> solution.
>
> Let me know what you think. I can give this an RB, but I'd like to hold
> off until we've settled on the solution we want to pursue here.
>
> Matt
>
>> Big games die after every s2idle resume on flat-CCS iGPUs. The exec
>> ioctl keeps returning -ENOMEM even with 11-16 GB of RAM free.
>>=20
>> On suspend xe_bo_evict_all_user() evicts every user BO in XE_PL_TT on
>> these parts. On resume the first exec rebinds every VMA in one go and
>> xe_vma_ops_alloc() kmallocs one 384-byte op per VMA as a single array.
>> Final Fantasy VII Rebirth has about 33,500 VMAs which means a 12.9 MB
>> array. It's over the 4 MB KMALLOC_MAX_SIZE and can never succeed.
>> __GFP_NOWARN keeps it out of dmesg.
>>=20
>> Data from a Panther Lake handheld (SteamOS kernel 7.2.7), kretprobes
>> after resume:
>>   xe_vma_ops_alloc  -ENOMEM on 63 of 63 attempts
>>   xe_vm_rebind      -ENOMEM on 63 of 63 attempts
>>   BO validate, TTM populate, PT prepare  never failed
>>=20
>> The array is only used by the CPU and doesn't need to be contiguous.
>> This switches it to kvmalloc and kvfree.
>>=20
>> With the same change applied as a module on that kernel, the game
>> survives every sleep I tried with zero ENOMEM. The biggest array was
>> 30,753 ops (11.8 MB).
>>=20
>> drm-xe-next already does this through commit 0e33330f1238 ("drm/xe: Add
>> struct xe_pt_job_ops"), but that's part of a big series that won't go
>> to stable.
>>=20
>> I tracked this down and tested it on my own device. I used an AI
>> assistant to help with the debugging, i.e the kprobe tracing and
>> reading through the xe code. I ran every test, picked the fix and
>> reviewed the change myself.
>>=20
>> What I couldn't do: this is build-tested on drm-xe-fixes but only
>> run-tested on the SteamOS 7.2.7 kernel through an equivalent module,
>> not on a mainline kernel.
>>=20
>> Fixes: 2e524668c440 ("drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops")
>> Cc: stable@vger.kernel.org # v6.11+
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Karim Sabar <karim.sabar@utexas.edu>
>> ---
>> Downstream SteamOS report with the same data: https://github.com/ValveSoft=
ware/SteamOS/issues/2962
>> ---
>>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 99e42bd29..5caef443b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -703,9 +703,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, b=
ool array_of_binds)
>>  			continue;
>> =20
>>  		vops->pt_update_ops[i].ops =3D
>> -			kmalloc_objs(*vops->pt_update_ops[i].ops,
>> -				     vops->pt_update_ops[i].num_ops,
>> -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>> +			kvmalloc_objs(*vops->pt_update_ops[i].ops,
>> +				      vops->pt_update_ops[i].num_ops,
>> +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>  		if (!vops->pt_update_ops[i].ops)
>>  			return array_of_binds ? -ENOBUFS : -ENOMEM;
>>  	}
>> @@ -742,7 +742,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>  	xe_vma_svm_prefetch_ops_fini(vops);
>> =20
>>  	for (i =3D 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>> -		kfree(vops->pt_update_ops[i].ops);
>> +		kvfree(vops->pt_update_ops[i].ops);
>>  }
>> =20
>>  static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 til=
e_mask, int inc_val)
>>=20
>> ---
>> base-commit: d2ce8fcd778ee6d92748c92d23a56d4416c29d86
>> change-id: 20261020-xe-kvmalloc-vma-ops-2637ebf81cfd
>>=20
>> Best regards,
>> -- =20
>> Karim Sabar <karim.sabar@utexas.edu>
>>
