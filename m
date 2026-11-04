Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788064;
	b=H7h3Sd9xk3yfG5XMPk+pSxk7EzF16ij2f7b3SodCWxAkj1CdqT1dMXvsDJ/Ltql4UwOR
	 tkSZ/ZtilipKDYzXwxsmhgAt0Gd/MX/EYcLn1mD5PZfRgckDnujvECplHxriHZ+DFBjIs
	 q4+/orWqXW7mWSQpDzNz2dVOV+Cq2SW58j1pi6iI1rcuQQ56sSL64EmIILnOg1LFP0kFp
	 QogGRY6Xy18lUZm1eaIiixTx22PXY0GcS/Hfj6AMyusShd14shGd+FU36TJanFke7Q9lV
	 cvZljkrFMSmr/zERbDckTBBWTd6zkAf/kyvfoP4Jbwnd07v3EfURYcqaP8Zd33cZRIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vx0F8Ooosw/mJ+ey/EwtNuiTXbCoWfLlzJMEU9ZwgM4=;
	b=sGazEi5DdGkOOHxZVyqBMtNwz5l8XZY10x9VQO7+S4nZOrpWEHnaC+9U8wqFESo7f8q1
	 /aaNneRStNWZgfWx3ptvCdLqUv816evdS8W/W2WX0xgDf1Ju2Y4tOargO11WokqdD6muV
	 tIiTkpShYqH1PEO2cZ0blBJNmeZyoLzTekxlFe3lsiKep/9SSnfeqSSi9ADeg+z2Zy3/P
	 9Q2yeraNYBLqdLtlWRyDTuBYb37ttSHwYAtVD4/eJvFr0cIOTiKfq9+iWxwINqxJWQJGw
	 sjLquYxj/Dl7QX0/NJRyOHwsq8ongNPynZhQsb3JaR1P5cshXvwVRjXsiPtApWgSK9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=JhjSLMjd;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74123606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74123606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=JhjSLMjd
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so330992f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1793788062; x=1794392862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vx0F8Ooosw/mJ+ey/EwtNuiTXbCoWfLlzJMEU9ZwgM4=;
        b=JhjSLMjdbmENp3xo7DmgfsPyeYJzOZpuxaNe9VuFovMBYk+TaDfPH2r16G8aKDHF7L
         PhRjBQ9gLPG5y/0cr6maacKxMlADbo5UPWzMB/vFa1CbBieKoIDFG7kjzY7mJ/bW+1OD
         lEXimteyPki+QKqSm8ox35H37L2zWL9KIgxzdICJnbcQpb5ea4/fE+UnrohT095AMxWB
         gpu5Ovj/KPQWQFhYVDYRMd0np+Cxt2/VfZGMsFrn4UuacfJf8/78tgbQT5OfxlgvVWR2
         TA1xlfkTvsLymenxcao0C3BeaoatIodcU4wq7ffWpvBofCL2Khn6LL9PsvJNTeI8wOOo
         mlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788062; x=1794392862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx0F8Ooosw/mJ+ey/EwtNuiTXbCoWfLlzJMEU9ZwgM4=;
        b=djJbQpFTtfetASjPBQ00G1uD+mqWsQr06g//VGUfFEuARTYJwLXdi8Tmd9hajjV40A
         p6GsKKVavuX+sLYA1PdQoxo0Y3kccFji2SN5piNY2B8ii+ZZRIzvLbqs69AQ9LZRU5s3
         fTwSIZLlNc7JY2r6vtNB54qX51+EJkH+fVT2Vb3T6M5mixzpq0CnyKsTxCYk4uiCW+gp
         05KBVyEIQoaNNbug/1Xczh7mqkZwcOp0r3Vmadl7oGlVDLDB3/YrFKMws/gEg+V+qkfL
         rEXMm825G5/8pmNj1k1RQ/EJLFlEQ9m8ZKY7gJn9d3tGGnXTrL3q0WsGnmpJFUIanJUw
         ttsA==
X-Forwarded-Encrypted: i=1; AKwUvBzlr/AhtCZ9FQtSCK9SP6+oktiyeXgswnMNLSLuyieWNRBPqpfvV7tQynLW53nKo0QFn246Arj/Ai+iaJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pX8DAEFsRVksl9XnHfp3FmdBme3IrbOeawUyQ78dnrJJEuvJw
	g7nmXTKztV/ebGa5ga1m6IdqaL7/b6ftKe4Smis+Mvf6Nxk7YYXZwbQKB9c8GyO5ILY=
X-Gm-Gg: AYBFou1xoeMEBxguYlyBYziJjmRl/M1YCKifSrIFJGWx3RLskSIZsoUCDXySfmpVkli
	psqj1rJ/IGrHzs2fyYumX2jZdrn4ai0SAFZmytUmUi0sHYAKNtKo5dhseZpmAU2qSJBvVkiF6NB
	Nf2zCE10xSGSsZOyVrz6CZFqiEvMpK37Z8mYp4gHLecy+0BVwScyvSwhDsEmIAU3ENqGChvBWnS
	TF0r1nHKp2NAMgl52jGjhkmZ6UXK4ANc4255RhEDk2a+MzY93cLJTm40+PY5qBQsg4euWW6MfG2
	O6pCdB/oa80jUm/uUmNt+K84u1cuZA3C8ynn7HUAncohgiUOPO6vGsOh2qC7UIK/ELS61WjwwWT
	BGSEqzpi39Pxed33+fQHcW3iVVMgtDKrcuIX9jGkZIAWiktvzAELGVkjXZV3xwnTstEe35ao2PF
	tyymMLZTOcFS75bnzcUWz6FWzpfXrkLfLV/b3YLJC2EvKzBMj4YgJhNGbYrRfWYtw0HxLFMeH+B
	rtqqaDbBEgJNe63DkTZ1yUhcZ2o2crEK5xRMTLWpe4fsHriRKUJudaZJjxEFiscz8Zxegyu9cYS
	wsqyeL0f0eohue1cEb0afptC6jSboadRz0jrMrR7TSWM
X-Received: by 2002:a05:6000:4559:b0:488:79d6:a4a6 with SMTP id ffacd0b85a97d-48e6e2bc780mr22710961f8f.8.1793788061116;
        Wed, 04 Nov 2026 02:27:41 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm3299891f8f.33.2026.11.04.02.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 02:27:38 -0800 (PST)
Message-ID: <39be711e-cd56-4a04-87ee-6aa2a0b69779@ursulin.net>
Date: Wed, 4 Nov 2026 10:27:36 +0000
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
Subject: Re: [PATCH v2] drm/syncobj: Limit the number of handles and use
 kvmalloc for user-sized arrays
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Yu, Fei" <fei.yu@intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 syzbot+95416f957d84e858b377@syzkaller.appspotmail.com,
 Madhur Kumar <madhurkumar004@gmail.com>
References: <20261104030930.3852781-1-fei.yu@intel.com>
 <1d8aeaae-7c89-4a99-975b-5467c33554b9@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <1d8aeaae-7c89-4a99-975b-5467c33554b9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04/11/2026 09:44, Christian König wrote:
> On 11/4/26 04:09, Yu, Fei wrote:
>> From: Fei Yu <fei.yu@intel.com>
>>
>> The syncobj ioctls allocate several temporary arrays whose size is taken
>> directly from the u32 count_handles provided by userspace:
>>
>>   - handles and syncobjs in drm_syncobj_array_find()
>>   - points and entries in drm_syncobj_array_wait_timeout()
>>   - points and chains in drm_syncobj_timeline_signal_ioctl()
>>
>> These are kmalloc() allocations, so a count above KMALLOC_MAX_SIZE /
>> element size trips the WARN_ON_ONCE_GFP() in ___kmalloc_large_node():
>>
>>    WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x10c/0x170 mm/slub.c:5459
>>    Call Trace:
>>     __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:5502
>>     __do_kmalloc_node mm/slub.c:5519 [inline]
>>     __kmalloc_noprof+0x3f6/0x710 mm/slub.c:5556
>>     _kmalloc_noprof include/linux/slab.h:995 [inline]
>>     _kmalloc_array_noprof include/linux/slab.h:1211 [inline]
>>     drm_syncobj_array_find+0x3a/0x440 drivers/gpu/drm/drm_syncobj.c:1241
>>     drm_syncobj_timeline_wait_ioctl+0x18a/0x640 drivers/gpu/drm/drm_syncobj.c:1356
>>     drm_ioctl_kernel+0x2df/0x3b0 drivers/gpu/drm/drm_ioctl.c:817
>>     drm_ioctl+0x70e/0xba0 drivers/gpu/drm/drm_ioctl.c:914
>>
>> The wait entries are 64 bytes each on 64-bit, so with a 4 MiB
>> KMALLOC_MAX_SIZE a wait on more than about 64K handles already fails
>> today, with a warning.
>>
>> Fix this in two parts:
>>
>>   - Reject more than DRM_SYNCOBJ_MAX_HANDLES handles with -EINVAL in
>>     drm_syncobj_array_find(), which every ioctl taking a handle array goes
>>     through. The limit is derived from the largest per-handle allocation
>>     (the wait entries) and the INT_MAX size limit of kvmalloc(), so none
>>     of the allocations above can exceed it. That is about 33M handles on
>>     64-bit.
>>
>>   - Switch the six allocations to kvmalloc(), so that large but valid
>>     handle counts no longer depend on physically contiguous memory.
>>
>> Using kvmalloc() alone is not enough: the reproducer asks for more than
>> INT_MAX bytes, which hits the WARN_ON_ONCE() in __kvmalloc_node_noprof()
>> instead.
>>
>> Fixes: 3e6fb72d6cef ("drm/syncobj: Add a syncobj_array_find helper")
>> Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Fei Yu <fei.yu@intel.com>
>> ---
>> v2:
>>   - Drop __GFP_NOWARN (Christian).
>>   - Add DRM_SYNCOBJ_MAX_HANDLES, return -EINVAL above it, and switch all six
>>     arrays to kvmalloc() (Christian).
>>   - v1: https://lore.kernel.org/all/20261103085002.3100723-1-fei.yu@intel.com/
>>
>> About the limit: INT_MAX / sizeof(struct syncobj_wait_entry) is about 33M
>> handles on 64-bit. It is the largest count for which every allocation stays
>> below the kvmalloc() INT_MAX size limit, so it does not add a new policy
>> number. Today the real limit is much lower: a wait on more than ~64K
>> handles already fails with -ENOMEM (plus the warning), because the wait
>> entries are a kmalloc() allocation larger than 4 MiB. If you prefer a lower,
>> fixed limit (e.g. SZ_1M) or GFP_KERNEL_ACCOUNT for these arrays, I can
>> change it.
>>
>> Testing on v7.4-rc1 (x86_64, KASAN, virtio-gpu in QEMU):
>>   - syzbot C reproducer: base warns in ___kmalloc_large_node() (size
>>     0x100000920), patched is clean, ioctl returns -EINVAL.
>>   - wait / timeline_wait / timeline_signal / reset / signal on 200000
>>     signaled syncobjs: base fails wait and timeline_wait with -ENOMEM and
>>     the same warning; patched all succeed.
>>   - count == DRM_SYNCOBJ_MAX_HANDLES gets past the check (-EFAULT from the
>>     short user buffer), count == DRM_SYNCOBJ_MAX_HANDLES + 1 returns -EINVAL
>>     for wait, reset and timeline_signal.
>>   - kmemleak clean, checkpatch --strict clean, W=1 clean,
>>     DRM KUnit 667/667 passed.
>>   - IGT syncobj_basic, syncobj_wait, syncobj_timeline on virtio-gpu:
>>     202/202 subtests pass, same as base.
>>
>>   drivers/gpu/drm/drm_syncobj.c | 40 ++++++++++++++++++++++-------------
>>   1 file changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index f1d4da1685457..c01cf164a4f9e 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -220,6 +220,13 @@ struct syncobj_wait_entry {
>>          u64    point;
>>   };
>>
>> +/*
>> + * Upper limit for the number of handles passed to a single ioctl. The
>> + * largest per-handle allocation is the wait entry array, keep it below the
>> + * INT_MAX size limit of kvmalloc().
>> + */
>> +#define DRM_SYNCOBJ_MAX_HANDLES        (INT_MAX / sizeof(struct syncobj_wait_entry))
> 
> I really wonder if we should put that into the uAPI files?
> 
> Not that userspace is potentially using it, but this is part of the uAPI and makes sense for documentation purposes.
> 
>> +
>>   static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>>                                        struct syncobj_wait_entry *wait);
>>
>> @@ -1051,7 +1058,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                  lockdep_assert_none_held_once();
>>          }
>>
>> -       points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
>> +       points = kvmalloc_array(count, sizeof(*points), GFP_KERNEL);
>>          if (points == NULL)
>>                  return -ENOMEM;
>>
>> @@ -1064,7 +1071,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                  goto err_free_points;
>>          }
>>
>> -       entries = kzalloc_objs(*entries, count);
>> +       entries = kvzalloc_objs(*entries, count);
>>          if (!entries) {
>>                  timeout = -ENOMEM;
>>                  goto err_free_points;
>> @@ -1185,10 +1192,10 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                                                    &entries[i].fence_cb);
>>                  dma_fence_put(entries[i].fence);
>>          }
>> -       kfree(entries);
>> +       kvfree(entries);
>>
>>   err_free_points:
>> -       kfree(points);
>> +       kvfree(points);
>>
>>          return timeout;
>>   }
>> @@ -1238,7 +1245,10 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>          struct drm_syncobj **syncobjs;
>>          int ret;
>>
>> -       handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
>> +       if (count_handles > DRM_SYNCOBJ_MAX_HANDLES)
>> +               return -EINVAL;
>> +
>> +       handles = kvmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
> 
> That kvmalloc_array() + the following copy_from_user should probably be replaced by using vmemdup_array_user(). But that should of course be a separate patch.

Btw I tried to do that some time ago:

https://lore.kernel.org/dri-devel/20251106132645.28208-1-tvrtko.ursulin@igalia.com/#t

I have as local, more recent version which applies, but apparently never 
sent it.

Interesting part should also be the other patches from the above linked 
series which avoid allocations altogether for the vast majority of cases.

If there is interest I can re-base and re-send after this is merged.

>>          if (handles == NULL)
>>                  return -ENOMEM;
>>
>> @@ -1248,7 +1258,7 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>                  goto err_free_handles;
>>          }
>>
>> -       syncobjs = kmalloc_objs(*syncobjs, count_handles);
>> +       syncobjs = kvmalloc_objs(*syncobjs, count_handles);
>>          if (syncobjs == NULL) {
>>                  ret = -ENOMEM;
>>                  goto err_free_handles;
>> @@ -1262,16 +1272,16 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>                  }
>>          }
>>
>> -       kfree(handles);
>> +       kvfree(handles);
>>          *syncobjs_out = syncobjs;
>>          return 0;
>>
>>   err_put_syncobjs:
>>          while (i-- > 0)
>>                  drm_syncobj_put(syncobjs[i]);
>> -       kfree(syncobjs);
>> +       kvfree(syncobjs);
>>   err_free_handles:
>> -       kfree(handles);
>> +       kvfree(handles);
>>
>>          return ret;
>>   }
>> @@ -1283,7 +1293,7 @@ static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>>
>>          for (i = 0; i < count; i++)
>>                  drm_syncobj_put(syncobjs[i]);
>> -       kfree(syncobjs);
>> +       kvfree(syncobjs);
>>   }
>>
>>   int
>> @@ -1572,8 +1582,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>          if (ret < 0)
>>                  return ret;
>>
>> -       points = kmalloc_array(args->count_handles, sizeof(*points),
>> -                              GFP_KERNEL);
>> +       points = kvmalloc_array(args->count_handles, sizeof(*points),
>> +                               GFP_KERNEL);
> 
> Looking at the code the handling of allocating the array and the just memset()ing it to zero when it is not used is really sub-optimal.

AFAIR I tried to improve this ages ago by converting to get_user but it 
was foiled by arm32 (IIRC) cannot do 64-bit get_user. Otherwise it would 
have been possible to avoid the allocation and just read as we go.

Regards,

Tvrtko

> 
> But that is just a side comment and should probably be changed in a separate patch as well.
> 
> Apart from those minor comments the patch looks good to me.
> 
> Regards,
> Christian.
> 
>>          if (!points) {
>>                  ret = -ENOMEM;
>>                  goto out;
>> @@ -1586,7 +1596,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>                  goto err_points;
>>          }
>>
>> -       chains = kmalloc_objs(*chains, args->count_handles);
>> +       chains = kvmalloc_objs(*chains, args->count_handles);
>>          if (!chains) {
>>                  ret = -ENOMEM;
>>                  goto err_points;
>> @@ -1609,9 +1619,9 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>                  dma_fence_put(fence);
>>          }
>>   err_chains:
>> -       kfree(chains);
>> +       kvfree(chains);
>>   err_points:
>> -       kfree(points);
>> +       kvfree(points);
>>   out:
>>          drm_syncobj_array_free(syncobjs, args->count_handles);
>>
>>
>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>> --
>> 2.43.0
>>
> 

