Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341749C4B5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354745; cv=none; b=S4tHtoo80SOxv3yGpM6CDFfB2Mf3jFLDnQQAHKcUbbhcXirI9ZX5hkSfmkls4rhlKA0XEHX8S0BnOlT4pm5mxBwoMEdaDzquZOPxGQLzHSFOLXMboIjufUHPHoFbEslHJwFNuukBLxLc4AmCCNyPmaN4FS2LK8TMJSNPXKUFwaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354745; c=relaxed/simple;
	bh=pWiGWVM8uPo7xXln28/zOskJ7rT1JvdyNVtmCcWXqcY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAcVKbEM7IoV42XjAvgpAbbECjmYsQJS4ZA86Vul3WEn48Jr3lWxiPZGbLKghBaFaeBVLU45YelRfZDcV0X6Mt6eejiOgXpNy0aEFKUVHQ+IAG26Vb6vjuLmi71kPSl9iUfQ37cYC5AKlnPbXpLtcbwOjbQ+ZXpt60Vv3anKCd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TikqBULY; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TikqBULY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so837268b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354743; x=1788959543; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=28GLq6NNTuabDAm8b5PyzUlgoNa+fBPwUe8jszYCNbg=;
        b=TikqBULYiCoGsgG1NRTjxI9Pu1ytq7Pk6vb3o5hFgln2thuvA4asWzQRqUlML1de61
         MzKmpciXSVomeTWgk7p14zMOnTqj20PL58spPXSZjjejprgfCwhYfV3WlGU0KKgWIYce
         RBeoEr53laHeAZFanNqIal4JiGWSTZFJLi7Zfqq5vQkyjj2SIrtEQoRWVr6CMrQAX7G1
         Me+9C0kKhU1FO3Dq0vtMNIgNwxMnXGtjTtEilCTXpZgo6cogDdkCnkpI8r8G4Qqdv3Bg
         JCjNHPnohmHgySpfUBPxfnO/0fU0eDskKJJfApTQiCd5Cau/B+KcP+gOfxL8kXrrgTSS
         bblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354743; x=1788959543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=28GLq6NNTuabDAm8b5PyzUlgoNa+fBPwUe8jszYCNbg=;
        b=pv4lMgN+qozUXpUFGRl2dM5GROWNA4cwnX3k3fSW/ZOqWHJu5PDXZKkF7hZY+P+NZn
         EjpDpmlruUjY1HHnFAmaQHf9nZD4Ua4L7tEQt1hCm8iyj3uXKE7iDgiLi6Mx9hK5+zba
         uxrdZTw2nQMVFElKwj3JsR7SVQjYNdZzLy+ddxYkVc6e6j9KeHuVWGeytpH2tegcP/1V
         WD+wvIfcQUNc6+TVjWt9p/oMrS5YUeldfWAEwl/01pAWQFlwd17eXOtrjXyEF5cf0jVY
         dejifVWcsoIq6+nFkk2omKzgGvZgRncjglMJnwzZXv6l7I7tTNd6AklHS9oao+iuanFu
         jzyw==
X-Forwarded-Encrypted: i=1; AKwUvByzR7ZkHOQ/UdiU/wnC7RZkS1dzWnsrKBh3mk8uihWhzu54Q8LTZOOF601Do+cj7U4qc/ClGDrPiftjjL8=@vger.kernel.org
X-Gm-Message-State: AFuF++mpAg8yJxARVO7svhfubOkghjdNpgvPShdgCpJwbP0f6kw49BrB
	2O3eBNZTiZhBT3tHxoyDmJeMp66CVlOzFQhY52Odguc+6fOc+QLZueB6
X-Gm-Gg: AYBFou2SqBKCfyfdBKg5R06oqx7lCII+9LdYjVEE9Kt9jCvFOXdVl+x1yMOWL01V65u
	wnZqcINoMiMO/9G/JhtXE7NsNkNuhtRAU8LYp/DEI4NPQVx3MqSUAZBBoUZkTdhp3v7MH2fhOMT
	OTOub5Gzs4XVd8L5wZ1cpq4hTXJth1eCbQZfGezX28cp3QRsKV36FxNmxdqE06y3xtBkvSJbizk
	EywKQICl3IBLBGzFDO3CjcHIRTCj67FXoqep49XRQEQOcvzU25GW+ehPXNOBjKH1dD1Cuvld3qp
	3cSP5e0qQOSfDb8UCDmieTsV5bIOMOfxBO2+YHaVslG3LeojmGlQUa/CxiGLnDUB6cOVTaplXr2
	M+Hb7TVWFxk1gjAhD+7OsxTUR96cIHHK2ZrPrPcL6fp+gxTdxZ9hzKs7ilMCZA19iOBM3TiDCJ+
	pWG+X4DwUrnszkDjfsM53D11+9woGPwSLZGhU5CnoQeiOjZFMErrrWrSDc
X-Received: by 2002:a05:6a00:1307:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85ed1d08ca3mr5963021b3a.4.1788354742377;
        Wed, 02 Sep 2026 06:12:22 -0700 (PDT)
Received: from localhost ([45.112.46.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a8fbsm1329126b3a.35.2026.09.02.06.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:12:21 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 2 Sep 2026 20:53:51 +0800
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>, 
	Dave Young <ruirui.yang@linux.dev>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] crash_dump: Fix potential double free and UAF of
 keys_header
Message-ID: <apgYPxG3VjhColxZ@Rk>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
 <20260828084900.1496839-2-coiby.xu@gmail.com>
 <76f634e3-9adb-4ae2-b2b0-a7e13a2f93c3@huawei.com>
 <apWEBBMz6aFBeefa@Rk>
 <dbfbccf8-8344-4893-a93f-ef6d316e0f7b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbfbccf8-8344-4893-a93f-ef6d316e0f7b@huawei.com>

On Tue, Sep 01, 2026 at 09:36:10AM +0800, Jinjie Ruan wrote:
>
>
>在 2026/8/31 21:44, Coiby Xu 写道:
>> On Mon, Aug 31, 2026 at 03:39:35PM +0800, Jinjie Ruan wrote:
>>>
>>>
>>> 在 2026/8/28 16:48, Coiby Xu 写道:
>>>> If kexec_add_buffer somehow fails, keys_header will be freed. Depending
>>>> on /sys/kernel/config/crash_dm_crypt_key/reuse, it will lead to the
>>>> following two problems if the kexec_file_load syscall is called again,
>>>>   1. Double free of keys_header if reuse=false
>>>>   2. UAF of keys_header if reuse=true
>>>>
>>>> To address these problems and also make it easier to reason about the
>>>> code, keep two invariants,
>>>>   1. keys_header will always be freed at the end of kexec_file_load
>>>>      syscall except during kdump image unloading for CPU/memory
>>>>      hot-plugging support
>>>>   2. There will always be valid keys_header if reuse=true
>>>>
>>>> Fixes: 479e58549b0f ("crash_dump: store dm crypt keys in kdump
>>>> reserved memory")
>>>> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/
>>>> memory hot-plugging")
>>>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>>> ---
>>>>  include/linux/kexec.h        |  6 ++++
>>>>  kernel/crash_dump_dm_crypt.c | 66 ++++++++++++++++++++++++++----------
>>>>  kernel/kexec_file.c          |  2 ++
>>>>  3 files changed, 56 insertions(+), 18 deletions(-)
>>>>
>
>[...]
>
>>>> @@ -369,9 +387,6 @@ static int build_keys_header(void)
>>>>      struct config_key *key;
>>>>      int i, r;
>>>>
>>>> -    if (keys_header != NULL)
>>>> -        kvfree(keys_header);
>>>> -
>>>>      keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
>>>>      if (!keys_header)
>>>>          return -ENOMEM;
>>>> @@ -415,8 +430,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>>>          .top_down = false,
>>>>          .random = true,
>>>>      };
>>>> -    int r;
>>>> -
>>>> +    int r = 0;
>>>>
>>>>      if (key_count <= 0) {
>>>>          kexec_dprintk("No dm-crypt keys\n");
>>>> @@ -424,14 +438,15 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>>>      }
>>>>
>>>>      if (!is_dm_key_reused) {
>>>> -        image->dm_crypt_keys_addr = 0;
>>>>          r = build_keys_header();
>>>> -        if (r) {
>>>> -            pr_err("Failed to build dm-crypt keys header, ret=%d\n",
>>>> r);
>>>> -            return r;
>>>> -        }
>>>> +        if (r)
>>>> +            goto out;
>>>>      }
>>>>
>>>> +    /*
>>>> +     * keys_header will be copied to reserver memory later and then be
>>>> +     * cleaned up at the end of kexec_file_load syscall
>>>> +     */
>>>>      kbuf.buffer = keys_header;
>>>>      kbuf.bufsz = get_keys_header_size(key_count);
>>>>
>>>> @@ -441,18 +456,33 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>>>      r = kexec_add_buffer(&kbuf);
>>>>      if (r) {
>>>>          pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>>>> -        kvfree((void *)kbuf.buffer);
>>>> -        return r;
>>>> +        goto out;
>>>>      }
>>>> +
>>>>      image->dm_crypt_keys_addr = kbuf.mem;
>>>>      image->dm_crypt_keys_sz = kbuf.bufsz;
>>>>      kexec_dprintk(
>>>>          "Loaded dm crypt keys to kexec_buffer bufsz=0x%lx
>>>> memsz=0x%lx\n",
>>>>          kbuf.bufsz, kbuf.memsz);
>>>>
>>>> +out:
>>>> +    is_dm_key_reused = false;
>>>
>>> I think there's still a bug for arm64 here.
>>>
>>> When is_dm_key_reused set to true, the outer while loop prematurely
>>> clears the is_dm_key_reused flag at the end of
>>> crash_load_dm_crypt_keys() in the very first iteration.
>>>
>>> Consequently, subsequent re-entrant calls to crash_load_dm_crypt_keys()
>>> falsely perceive the keys as not reused, forcing a redundant execution
>>> of build_keys_header() which overwrites the global keys_header pointer;
>>>
>>> This induces a silent kernel memory leak.
>>
>> Thanks for reviewing this patch and raising the concern! Unless I miss
>> something, I don't think the global keys_header will be overwritten
>> because kexec_file_post_load_cleanup_dm_crypt will called to free the
>> memory during the end of kexec_file_load syscall.
>
>Hi Coiby,

Hi Jinjie,

>
>Not really on arm64, as below:
>
>kexec_file_load syscall
>-> kimage_file_alloc_init()
>   -> kimage_file_prepare_segments()
>      -> kexec_image_load_default()
>         -> arm64 image_load()
>            -> load_other_segments() while retry loop
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>               -> crash_load_dm_crypt_keys()  -> May be called
>repeatedly!!! Memory leak bug here as I described above,

Thanks for providing the stack trace to help me understand the problem!
Now I see what I missed. I also notice your 
"[PATCH v3 04/17] arm64: kexec_file: Fix elf_headers memory leak in retry loop" 
is addressing the same problem for the elf_headers. I'll have a careful
look at related patches and re-think the solution.

>
>      -> kimage_file_post_load_cleanup()
>
>>
>>>
>>> 92 >-------/*
>>> 93 >------- * The location of the kernel segment may make it impossible
>>> to satisfy
>>> 94 >------- * the other segment requirements, so we try repeatedly to
>>> find a
>>> 95 >------- * location that will work.
>>> 96 >------- */
>>> 97 >-------while ((ret = kexec_add_buffer(&kbuf)) == 0) {
>>> 98 >------->-------/* Try to load additional data */
>>> 99 >------->-------kernel_segment = &image-
>>> >segment[kernel_segment_number];
>>> 100 >------->-------ret = load_other_segments(image, kernel_segment->mem,
>>> 101 >------->------->------->------->-------  kernel_segment->memsz,
>>> initrd,
>>> 102 >------->------->------->------->-------  initrd_len, cmdline);
>>> 103 >------->-------if (!ret)
>>> 104 >------->------->-------break;
>>> 105
>>> 106 >------->-------/*
>>> 107 >------->------- * We couldn't find space for the other segments;
>>> erase the
>>> 108 >------->------- * kernel segment and try the next available hole.
>>> 109 >------->------- */
>>> 110 >------->-------image->nr_segments -= 1;
>>> 111 >------->-------kbuf.buf_min = kernel_segment->mem +
>>> kernel_segment->memsz;
>>> 112 >------->-------kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>> 113 >-------}
>>
>> Btw, I assume the above text is not related to the discussion, right?
>
>The code closely related to my description above — the arm64
>crash_load_dm_crypt_keys() — is exactly called within the
>load_other_segments() in the while loop mentioned earlier. Therefore,
>crash_load_dm_crypt_keys() may be called repeatedly before
>kexec_file_post_load_cleanup_dm_crypt().
>
>We can refer to the arm64 commit 108aa503657e ("arm64: kexec_file: try
>more regions if loading segments fails") , which introduced the retry loop.

Thanks for the explanation and also pointing me to the reference commit!

>
>Best regards,
>Jinjie
>
>> [...]
>>
>

-- 
Best regards,
Coiby
