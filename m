Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DE46F482
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784140; cv=none; b=hLaAlFHXToFGpd05t/5m0OdxJCEgsw2APbr79QuSGPOVh8ixRuG3Ckx8+pIPtISxX2A32dzkJu3l34jVx2a41Y8d3mVsb2s5Wr6Sy2ozfhYAEpj16zsbVn9TF/a4IQm7b85ZX6N/hOvnNmh3i9oeLdXfcXiIoAGGS5FD9c2VA2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784140; c=relaxed/simple;
	bh=AAZwLzfr8jr8YZzC3uwVFUEWgXqesfwXs8POQkuBsbo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wr0c7TldIHp2R/7hFs0TxVWDrM8yfR1q+YeD/E5BsOayLBJ4CY6MllXTC8KYnb4+ZHAwdfpsO2zO+fAirRwchZY4UDofxpBnwHxMKomBr/4DWGdvtf3VYXnKC0msJdhiZ2jtYTOPJrb9VPCq8KhZYPmlE7jP/notvon+Oq5ezqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=s55hlTWj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="s55hlTWj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a68ca482e2so4361420a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1788784137; x=1789388937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJm8oYa2XMgACvK1LNx+Nj4anO8CYxc+Hsnqz6K6hAA=;
        b=s55hlTWjRIy/MDCaR0egHL9ltglEOE2im7UrWD3yTr/JrKyJwZTpX/Md+HSWYFWYML
         srPMcIGkRsd1K687NBA8/jXrnjCoZdYDMnPky+v37ZX2s73W2ojUt2f9Udpc51tteo5c
         XUK9GSM8fTcmU+OSn2hR+KkCXgX5QKpu+nzcnlwj1CBponDT7UyITLdofFY+F/cLGz+7
         QpqpGB4uMdCYV/pOvVOl4TWaeiEjJiy524aQrG2JYTn6wfwbYsB3MdYsq8zRb3yvxiTQ
         0JV1rBZlNwQZYbuJYudE7iIOxYlboaJ1ycrig6nmjKdSyt+5rM5cf1xyq5R2RaDXxvsH
         /gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784137; x=1789388937;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJm8oYa2XMgACvK1LNx+Nj4anO8CYxc+Hsnqz6K6hAA=;
        b=UwulkGjp7m/S6ciqTujv8jM47ZXp8HRUlyOkJl1wjY7yXy/YkKwzNl+oA6jAb1GYHE
         AoWbXbiH+t/ZbKC1j0vbiIiEGAzYMY3cAv2qr3Ihvkf/Ox6JmixxAnzwbQISla1hH0Sm
         ltSP9s4FDsXZpY/oad1lpC7V4AdUCkeSvoDd7zdRFDfPHBN2STxHqeJoS2WJGMM3osXF
         +XAXO0xlhRH0npInZ5o+95TTooD+DOf3iNXz6ZgtwvzpcuVaonMUsr0sXZAQFjLn6Iri
         eJZuLmf66b2QlmNONNbNdHNBNtCJuvXFbcssw6w1Lp55MDPBrXPl3g+3nDk+F2kiXO2g
         28/Q==
X-Forwarded-Encrypted: i=1; AKwUvBweM69tRtYrUwMr4Kx7yMjVkxe6zwzRflTFFmsNCImJp1yUbovqAAWMPlXxKPCLIDQQ2xyKw7TThsDqe0k=@vger.kernel.org
X-Gm-Message-State: AFuF++l8M2Ce8lM/iLB7aD15BnMsfRoSIWewZTXFghjLQkR2tafX8MWv
	V27csORIIgQHDMPOgpAnegvjlHBQpAQLxRV85TvoqET3Hp/DZpnt1Ts8ewiR4cCzUuw=
X-Gm-Gg: AYBFou11205pughQYqIyjXgrFQjwjXf9rFNJ1PsTZ/vCTp1jc0QQVajqtb49k+drMEK
	eeXEYHGwSbFwz5EtLV+fqjH75Z6hLFzq1smNqm9+ZpaoIU7QmRV7Mokx7RQ0yo9smjKPvpDH2AV
	n5mP8DAGWpitzw5b1wro+uEomhxqcUJLtHPCr9EXmLXJbUVDEJZLoS+ytIf+2R541BFvZY6IotM
	m4gfQ2J+qs8JpnN9rJKNtQjRnELkWN3ulAvAqKYBaCaLKCncprMRm4L5g6VaDGYX23oTR0WJk95
	dLiySOPBFn2WjzIOtwZuqOieU/AhwfXXGCkyLpVNYvppF3K36dE/4iQPi3qa59KElnV9tzjng3Z
	7Bq7vqHBSjvHvZjgTpggsrLzLzOoiN36jcA0H7jbgOhJ5yl6R91L8+XgqlqQH8AC3kgPlfYpcFC
	lGo7/b9dhxLaK2xuPcx1/oKgtb5J6WzxTn5NconJqmkuIu5/LBo+AXkjAHOarJpvm0L5HSl1Pwk
	dC4
X-Received: by 2002:a05:6402:270a:b0:6a6:32f5:90b4 with SMTP id 4fb4d7f45d1cf-6a7e90a5f76mr13059715a12.22.1788784136511;
        Mon, 07 Sep 2026 05:28:56 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e66eb84dsm4416331a12.2.2026.09.07.05.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:28:56 -0700 (PDT)
Message-ID: <96eb6288-5c85-47c0-8f72-57d6f138851e@ursulin.net>
Date: Mon, 7 Sep 2026 13:28:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/sched: cache the timeline name to fix a
 use-after-free
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com,
 stable@vger.kernel.org
References: <20260904080618.2098450-1-malhyuk97@gmail.com>
 <20260904080618.2098450-2-malhyuk97@gmail.com>
 <f25f2a91-b72e-4392-ab53-c11ef60e0fe0@amd.com>
 <ee27d37269f609192cdfd7a217d9731d7dca04c8.camel@mailbox.org>
 <a41a35b8-c78b-4c18-af11-26374918f222@amd.com>
 <7e4497506bb051fd1c25ed54f88a8036084e779c.camel@mailbox.org>
 <81e51d72-d608-46d0-a986-390ecd6f468a@ursulin.net>
 <d3d2ae0ae55fb07780f643de9517f3668484575a.camel@mailbox.org>
 <47464619-890d-484f-986b-9a6c06cd89b0@ursulin.net>
 <c3434f0a80318390d183a3a2f8f8fb3ae71c9906.camel@mailbox.org>
 <2aa58eb8-a33f-45b9-8ee0-518d72160f41@ursulin.net>
Content-Language: en-GB
In-Reply-To: <2aa58eb8-a33f-45b9-8ee0-518d72160f41@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 07/09/2026 12:06, Tvrtko Ursulin wrote:
> 
> On 07/09/2026 11:47, Philipp Stanner wrote:
>> On Mon, 2026-09-07 at 11:28 +0100, Tvrtko Ursulin wrote:
>>>>
>>
>> […]
>>
>>>> How did the others fix that?
>>>
>>> Combination of kfree_rcu, synchronize_rcu and storing the name in an
>>> object protected by those:
>>
>> […]
>>
>>> For the scheduler (nouveau_sched_destroy()) the same, kfree_rcu.
>>>
>>> That makes scheduler timeline name vfunc safe:
>>>
>>> static const char *drm_sched_fence_get_timeline_name(struct dma_fence 
>>> *f)
>>> {
>>>     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>     return (const char *)fence->sched->name;
>>>
>>> sched is then RCU protected. sched->name is already static so not a 
>>> concern.
>>>
>>> As you say nouveau_sched_fini() only tears down the scheduler after
>>> fences have been signaled it seems adding two new kfree_rcu make is 
>>> safe.
>>
>>
>> I don't see how any RCU mechanism would make anything here safe.
>>
>> As long as ops->release is implemented, ops will never be set to NULL,
>> (with or without RCU) – so everyone who holds a reference to finished-
>> fence can still run into drm_sched_fence_get_timeline_name() and cause
>> UAF on the sched pointer *and* the name pointer.
>>
>> Moreover, all of this falls apart should the driver unload.
>>
>> So I maintain the position that we only get it right by having the
>> signaled-bit be the decoupling point.
>>
>> Or am I missing something?
> 
> The driver fixes you asked about and I listed work(ed) in the context of 
> 506aa8b02a8d ("dma-fence: Add safe access helpers and document the 
> rules"). In that "world" it would have been safe. Did 035219a760ed 
> ("dma-buf: dma-fence: Fix potential NULL pointer dereference") break 
> those fixes a bit?
> 
> I can try my IGT and see..

With RCU frees in xe it is harder to hit it reliably for KASAN to 
notice. Guess I would need to have a way to flush the RCU callbacks from 
IGT but I did not bother with that, it seemed easier to check the 
returned name. Since it is not returning "detached-driver" / 
"detached-timeline" post signalling that proves things are indeed broken:

$ sudo tests/xe_sync_file
IGT-Version: 2.5-ge37a85b91 (x86_64) (Linux: 7.3.0-rc1+ x86_64)
Using IGT_SRANDOM=1788784104 for randomisation
Opened device: /dev/dri/card0
Starting subtest: sync_file_race
[2178.517756] (xe_sync_file:10970) CRITICAL: Test assertion failure 
function test_race, file ../tests/intel/xe_sync_file.c:130:
[2178.517790] (xe_sync_file:10970) CRITICAL: Failed assertion: 
!strcmp(driver_name, "detached-driver")
Stack trace:
   #0 ../lib/igt_core.c:2089 __igt_fail_assert()
   #1 ../tests/intel/xe_sync_file.c:155 __igt_unique____real_main136()
   #2 ../tests/intel/xe_sync_file.c:136 main()
   #3 ../sysdeps/nptl/libc_start_call_main.h:83 __libc_start_call_main()
   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #5 [_start+0x25]
Subtest sync_file_race failed.
**** DEBUG ****
[2177.516393] (xe_sync_file:10970) DEBUG: 'drm_sched'/'rcs16' = 1
[2178.517745] (xe_sync_file:10970) DEBUG: 'drm_sched'/'rcs16' = 1
[2178.517756] (xe_sync_file:10970) CRITICAL: Test assertion failure 
function test_race, file ../tests/intel/xe_sync_file.c:130:
[2178.517790] (xe_sync_file:10970) CRITICAL: Failed assertion: 
!strcmp(driver_name, "detached-driver")
[2178.518762] (xe_sync_file:10970) igt_core-INFO: Stack trace:
[2178.523313] (xe_sync_file:10970) igt_core-INFO:   #0 
../lib/igt_core.c:2089 __igt_fail_assert()
[2178.523428] (xe_sync_file:10970) igt_core-INFO:   #1 
../tests/intel/xe_sync_file.c:155 __igt_unique____real_main136()
[2178.523436] (xe_sync_file:10970) igt_core-INFO:   #2 
../tests/intel/xe_sync_file.c:136 main()
[2178.564635] (xe_sync_file:10970) igt_core-INFO:   #3 
../sysdeps/nptl/libc_start_call_main.h:83 __libc_start_call_main()
[2178.564690] (xe_sync_file:10970) igt_core-INFO:   #4 
../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
[2178.564892] (xe_sync_file:10970) igt_core-INFO:   #5 [_start+0x25]
****  END  ****
Subtest sync_file_race: FAIL (1.054s)

I'll copy you on the updated IGT for reference.

Regards,

Tvrtko

