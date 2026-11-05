Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876673;
	b=r76rU64rIRwDtfAvN/0BkmlsHcptTtiDKRdX8ZU0IWKoBtjQVPZDxasOvz59+JH+2xf1
	 Zeiqyp8fMhIeLRgfiIFV+xrhYw7NJoXC041Iv14dPIIwgJp7tHiIng9DUDrRVD72SIzX2
	 gfvDM6N3tXc1rw1x/3c4DE+Sd7HHP0+xFOstAdgAFg98m8UXzgY+mEKP/ITPO4uX5D0mg
	 sBgMvsb8WbLdzej6DE8Q+Imk1IJYjBHXKZIRNyWqxnUFjKJzOQl8x+All9fcT2iaU+ZbE
	 Pv7FfdUh2B2LnQsYDpglmmXyQz2Kkya66wF80DIgLO7efYTRRFcPmoWYUlUz/QRhzvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FFlRj7zu5hDTpY8G/PTsL3dfYcV7jbNwNQB5CRVczZA=;
	b=wgCNpJXSVFllaKfBkrSZZFGao4ALPtYHzgPmOssIUFHXQT8wgE9JeJZRfFi6V/Ghfubq
	 4yTUtWIkb2k2HNBYLycyljqBA03iFfizjillyJwP06yl1XfoBRbDVEpNwYmxEweYmrY90
	 3UsDtI0LSQzP4UmnvmXnxDXeYMNCyG9lrh+JduoVALZTU8JFblwXujmawcMF6gUjdaAQf
	 mrYcox1K2sydyWQEFQk0cOhcjxxXXjw0q+eAPCJqclGReFVC+tJYiCr8d1PmxwshMt7Ox
	 bGIJ6EVQmMtvdUJjUxNHiP87CbgNMVywD7MKoOFdpGB0DjQbnf4kPZhapIa3YOaorGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b="OxlsBi/H";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0068606D802
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0068606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=OxlsBi/H
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso832130f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1793876671; x=1794481471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFlRj7zu5hDTpY8G/PTsL3dfYcV7jbNwNQB5CRVczZA=;
        b=OxlsBi/HWf0dHT0jruMtytc/+14rT23pj+T6Go9RhQuViZskkKucwwNufVG0iWiL2O
         nvrvzoPp4bd7fHYbDFiI2/1fgQRP567W294PD2L6epcPvmYTXKe/yB7L5hheyFaoF81g
         reF3sXiNCtcZvgmSrDZxDg58ugu/NVjbGanKmW8ba0myfZqoBxVy2KqRW3PkbixBhO9p
         IR7Xo9Y8o1+eHWWK5BFQrywfqxhylN2qVMqlqWiaUxCK0NjkGGUglsGwwY66W8Ql/LAk
         dp7iMn3OjP4ryaJ8rjUn2uPamje030yJE4SlfGSg5EAkmvjp1oqGRC/kyjb5kw96ooTP
         EWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876671; x=1794481471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFlRj7zu5hDTpY8G/PTsL3dfYcV7jbNwNQB5CRVczZA=;
        b=cN6e6jGR08L9qMIg6Z4Cdy5jmVlPq1w4aLBPKRCNKtz01njBdewkOFTWKgG9Owcwfi
         e2ckxuk66qeJ5oDEzC7Tk8PJeApWCm1AKkwcU5pvz+2jrYzfWn33A/+t11chbhoxk0Sy
         fUKyL1Y4vI5yAFZMPxmhqh59+a3qlOBMJQZoA1GnK3BD8PsBmCaj7c4qSxfRbsSXOsT0
         wQQWwVsvl0A9i4TXoNJafh+hExyaSC8KpgiLQlu6JAi3EuyEApXYZDWFRneIkQNeN/Ug
         eAc09H89ZLa2dfaeWjUNQaXgluJj7k1pHsASsP2ZVInNnUqydl49JxIlsQR6cJlg41bc
         synw==
X-Forwarded-Encrypted: i=1; AKwUvByms2zYVXXOrXcuPurQ8cnnl22bBLWzDzl3lZ+GoVobFrBRV3p3+Batzqk3R0t1AUF4c8D2HcTiI8h0510=@vger.kernel.org
X-Gm-Message-State: APuU4Z95ubtsAnA2wW8aV74qHCZUWhOAG6r9GySmLyfCvJ0bERAOLebm
	KL2dBjs0wJXM9uWO1ftbGr4LRbcDEq8huu5xFhF9Fm3ueSoDBMZE3EDhRptMM2lOhXs=
X-Gm-Gg: AYBFou3RJw5GeqP7E2v5R1PF7pHUJ8VmToCPQoto2BdGizkuNHqqN37+AZcJRf2MPtb
	VMzH7zuUt529/CJYype1Q9awSyqViVR2sp+MkDiBC9cUXe9oqyoS+Yvnh4VbtMY9ihfod0vSsGv
	XR5mbAYyAl5tEYqBoXx8nkwd4emnDixMNHlDg5GQWTDXptxJelJDgcm9W39CjR7vGLqYQ+8L3xt
	F4uSS+JBIyvvr+EYIkh2x+QLhx2k4tiRJEZcutnoIWYi60FP0jgCk1a12Y0zWlqMFAbycM4gEq3
	1fqAoA+vS7cwpMnvhprtyUDj767Hjzeja+iBnrbZlYfOpD/8PIRtpk7cNULojS7uE1edUTHMhJR
	ULAEAm9uIXXCd7XTGm31B7kWIhw/Ngk8ZD5lpEi6pcoe1nZTBZsGHLPMBKGhAzYJxJv0IdmfeQq
	pUWbwTKsZw3D4TmN/sYrbfdKvxKX6p/D4deLGBdVfXZW1YlAe9+qe9V1lXK3NPUjFUMFYIit2/9
	8sQEiYkI/JL0CgGPbo4duUydhluK5Flfxhi9WOpiC8vFZk0ItiPnyvwW3cXZwXGwZb4/IBvl/Ek
	1TaFSiVRa/3lkkxXWm60CRET/AC6As9RhsJTlAQsvmdj
X-Received: by 2002:a05:6000:2889:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e6e2e769amr38528504f8f.11.1793876670833;
        Thu, 05 Nov 2026 03:04:30 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm10471113f8f.45.2026.11.05.03.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:04:30 -0800 (PST)
Message-ID: <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
Date: Thu, 5 Nov 2026 11:04:29 +0000
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
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 05/11/2026 10:43, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 05/11/26 06:22, Tvrtko Ursulin wrote:
>>
>> On 03/11/2026 15:53, Sidong Yang wrote:
>>> There is no way to tell how much of the NPU a client uses. Implement the
>>> DRM usage stats: account the time each job occupies a core and report
>>> it per client as drm-engine-npu, along with drm_show_memory_stats() for
>>> the BOs.
>>>
>>> The cores are identical, so they are reported as a single engine with
>>> drm-engine-capacity-npu set to rdev->max_cores, the number of core
>>> slots. The time is summed over all cores, with an atomic counter as the
>>> cores complete jobs concurrently.
>>>
>>> Jobs can outlive the file that submitted them, so the counter is
>>> refcounted and each job holds a reference. The time covers the whole
>>> period a job owns a core, so it also includes handling the completion
>>> interrupt and the gaps between the tasks of a multi-task job.
>>>
>>> Document the keys in the rocket driver documentation.
>>>
>>> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
>>> ---
>>> v4: Report a single drm-engine-npu key with drm-engine-capacity-npu,
>>>      instead of drm-engine-npu0..2, as drm-usage-stats.rst specifies for
>>>      a group of identical engines, and document the keys (Tomeu Vizoso).
>>>      The subject no longer says per-core. Gyeyoung's tags are dropped as
>>>      the accounting changed.
>>>
>>>      Still depends on commit 6eff1d69dae8 ("accel/rocket: search every
>>>      core slot when a core is removed") for rdev->max_cores.
>>>
>>> v3: Add a rocket_engine_usage_create() helper for the counter
>>>      allocation in rocket_open(), to pair with
>>>      rocket_engine_usage_destroy() (Gyeyoung Baek).
>>>
>>> v2: Size the per-core counters by rdev->max_cores, the number of core
>>>      slots, instead of the number of cores bound when the file is 
>>> opened.
>>>      Sashiko reported the out-of-bounds read and Gyeyoung Baek 
>>> reproduced
>>>      it with KASAN.
>>>
>>> Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1- 
>>> sidong.yang@furiosa.ai/
>>> Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1- 
>>> sidong.yang@furiosa.ai/
>>> Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1- 
>>> sidong.yang@furiosa.ai/
>>>
>>>   Documentation/accel/rocket/index.rst  | 28 +++++++++++
>>>   Documentation/gpu/drm-usage-stats.rst |  1 +
>>>   drivers/accel/rocket/rocket_drv.c     | 70 ++++++++++++++++++++++++++-
>>>   drivers/accel/rocket/rocket_drv.h     | 15 ++++++
>>>   drivers/accel/rocket/rocket_job.c     |  7 +++
>>>   drivers/accel/rocket/rocket_job.h     |  4 ++
>>>   6 files changed, 123 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/accel/rocket/index.rst b/Documentation/ 
>>> accel/rocket/index.rst
>>> index 70f97bccf100..53c9aa7e2229 100644
>>> --- a/Documentation/accel/rocket/index.rst
>>> +++ b/Documentation/accel/rocket/index.rst
>>> @@ -17,3 +17,31 @@ project.
>>>   Hardware currently supported:
>>>   * RK3588
>>> +
>>> +.. _rocket-usage-stats:
>>> +
>>> +Rocket DRM client usage stats implementation
>>> +============================================
>>> +
>>> +The accel/rocket driver implements the DRM client usage stats 
>>> specification as
>>> +documented in :ref:`drm-client-usage-stats`.
>>> +
>>> +The NPU cores are reported as a single engine, npu, with a capacity 
>>> equal to the
>>> +number of cores. The time is summed over all cores, and covers the 
>>> whole period
>>> +a job occupies a core.
>>> +
>>> +Example of the output showing the implemented key value pairs:
>>> +
>>> +::
>>> +
>>> +        pos:    0
>>> +        flags:    02400002
>>> +        mnt_id:    33
>>> +        ino:    749
>>> +        drm-driver:    rocket
>>> +        drm-client-id:    246
>>> +        drm-engine-npu:    2296549300 ns
>>> +        drm-engine-capacity-npu:    3
>>> +        drm-total-memory:    24216 KiB
>>> +        drm-shared-memory:    0
>>> +        drm-active-memory:    1920 KiB
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/ 
>>> gpu/drm-usage-stats.rst
>>> index 70b7cfcc194f..288764730d23 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -218,3 +218,4 @@ Driver specific implementations
>>>   * :ref:`panthor-usage-stats`
>>>   * :ref:`xe-usage-stats`
>>>   * :ref:`amdxdna-usage-stats`
>>> +* :ref:`rocket-usage-stats`
>>> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/ 
>>> rocket/ rocket_drv.c
>>> index 2bcfe4ab3c68..e22e8623db64 100644
>>> --- a/drivers/accel/rocket/rocket_drv.c
>>> +++ b/drivers/accel/rocket/rocket_drv.c
>>> @@ -3,8 +3,10 @@
>>>   #include <drm/drm_accel.h>
>>>   #include <drm/drm_drv.h>
>>> +#include <drm/drm_file.h>
>>>   #include <drm/drm_gem.h>
>>>   #include <drm/drm_ioctl.h>
>>> +#include <drm/drm_print.h>
>>>   #include <drm/rocket_accel.h>
>>>   #include <linux/clk.h>
>>>   #include <linux/err.h>
>>> @@ -68,6 +70,38 @@ rocket_iommu_domain_put(struct rocket_iommu_domain 
>>> *domain)
>>>       kref_put(&domain->kref, rocket_iommu_domain_destroy);
>>>   }
>>> +static struct rocket_engine_usage *
>>> +rocket_engine_usage_create(void)
>>> +{
>>> +    struct rocket_engine_usage *usage;
>>> +
>>> +    usage = kzalloc_obj(*usage);
>>> +    if (!usage)
>>> +        return NULL;
>>> +    kref_init(&usage->kref);
>>> +
>>> +    return usage;
>>> +}
>>> +
>>> +static void
>>> +rocket_engine_usage_destroy(struct kref *kref)
>>> +{
>>> +    kfree(container_of(kref, struct rocket_engine_usage, kref));
>>> +}
>>> +
>>> +struct rocket_engine_usage *
>>> +rocket_engine_usage_get(struct rocket_file_priv *rocket_priv)
>>> +{
>>> +    kref_get(&rocket_priv->engine_usage->kref);
>>> +    return rocket_priv->engine_usage;
>>> +}
>>> +
>>> +void
>>> +rocket_engine_usage_put(struct rocket_engine_usage *usage)
>>> +{
>>> +    kref_put(&usage->kref, rocket_engine_usage_destroy);
>>> +}
>>> +
>>>   static int
>>>   rocket_open(struct drm_device *dev, struct drm_file *file)
>>>   {
>>> @@ -86,10 +120,17 @@ rocket_open(struct drm_device *dev, struct 
>>> drm_file *file)
>>>       }
>>>       rocket_priv->rdev = rdev;
>>> +
>>> +    rocket_priv->engine_usage = rocket_engine_usage_create();
>>> +    if (!rocket_priv->engine_usage) {
>>> +        ret = -ENOMEM;
>>> +        goto err_free;
>>> +    }
>>
>> Glanced over this patch by chance and it very reminded me of 
>> drm_sched_entity_stats tracking. That object is reference counted by 
>> the entity so I think it would satisfy your requirements. We would 
>> only need to add an accessor like drm_sched_entity_get_runtime() and 
>> just call it from rocket. Thoughts?
>>
> 
> I believe we tried something similar in the past (commit 97804a133c68)

You mean df622729ddbf? But yes, I don't think I knew about that.

> and it ended up being reverted after this regression [1]. I would be
> great to give this idea another change (specially now that we have
> drm_sched_entity_stats), as it would also be useful for V3D.

It makes sense to me if Philipp and Danilo will agree so adding them cc.

It would just be adding u64 drm_sched_entity_get_runtime(entity). 
Nothing else would need to be exported and the implementation simply 
locks entity->stats and returns the runtime. As long as the caller knows 
they haven't destroyed the entity it is safe since entity holds a 
reference to the stats object.

If rocket and v3d can use it that's a reasonable starting point for 
adding common API. Three users would be even better than two though, 
going by the long standing DRM tradition. :)

Regards,

Tvrtko

> [1] https://lore.kernel.org/dri-devel/3e00d8a9- 
> b6c4-8202-4f2d-5a659c61d094@redhat.com/
> 
> Best regards,
> - Maíra

