Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978625;
	b=ETBy1KXpRhJwtSvvWbbtdJiclhLPqHB/ibWy2pcBJXTy24QXBPfHGvi5ULKzl4lnAFtv
	 k0nRVTEqDu3xYRPj6qddNBZLH9urfgpWaJPTWpTemAiRsd29xrGa050nqlFpF3c1LY0Zt
	 ktKhsrby0/H28/QoGvT9oWjPZi7stF3rv5hfMWMk3/cW+m5yAs+sbJn2CXunjDPINuhrX
	 2bYK5j7ONVRSJZCgAU/r2wfm75QlwQ+RKsFSLo7xjNDc4l1cIYfc6toXrV+7edq3V2LKL
	 H7iTfA8pDpEyJ6QifR1mil+cYhlCdr+K/WubvZHIpmDSsCQb1ecrtT1QuNuBhuIL86g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=j7OxcM6JK9uGVP+NsNZjPsClP/ZMAV7N7NhrhI2qiXc=;
	b=4FKR6FSjMUDGLez1sFrmhXo/WzoOi1wY2a/H1trB4QuFjSBegwdJvPXMvCwW5MVqgzaJ
	 cclAsSzj3OUoa4Z/8fuBBQTQIbmGyLouWKW0QloSHsdwWpeA1xnN4mRo2h8ThnZG84Rd/
	 1J0bGTKCuT1sRluXDoR5qRSYnl2Ijz+VhtvcmXhypPJASjs4qjZpJB0GKibx/E9PvTuLA
	 ikSP4r9oBPJEKs/b/2ovxBJEIh2F5AdXESkVArHcDrAauSKtD8nxZ/PR7j7feQbEVvm+x
	 FhFK1XhtRowvxMdhLuCDC4AtVcbnqUP08o4Ikwxx6rRUtbiKqXCuLPvOi/N7zW1oflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5Sg31Ox;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0E60A2629
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C0E60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5Sg31Ox
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d473cfff6so70846566b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978623; x=1794583423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j7OxcM6JK9uGVP+NsNZjPsClP/ZMAV7N7NhrhI2qiXc=;
        b=o5Sg31OxRehZGVakEmr8RRmE0tGRLuDbmG+CjRGKqEX41OKTTMA/ettg8uKP2+qlwe
         CvVvkF161KsV6ms8MT41wavxkCDd0liTKZvTjx8vUxQPakLmqQoj1CEkPSyGLfIP3sdJ
         qkyMHSFdAKW/eQ9Prm7wWPsIOXK8jxJ/wpnctTfHfPqu45oAlV3r7l38Ndh0MWbri4On
         LaOiv4iE66IMnMZO4VBwy0bwcthZWwls3ZLdFh/a8wxaT4e0cJeoV6CExfUaOAAcjHcw
         SbHMbr303rF200QEF8VyHe+6eJ9H9Y9lqjP8qzp6HK/FlqkRVQTShKQClCDQ+uLSuIiT
         D56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978623; x=1794583423;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j7OxcM6JK9uGVP+NsNZjPsClP/ZMAV7N7NhrhI2qiXc=;
        b=c3iD0dPsWuNiisofR4005WgP7pfhpsMP4HZjZ/NNYjzA1/XdWjspHu42C4uUb2L8m2
         pLcygtk0nuE3m1K8ZmL8BDBTa8Wf1Gh8b0e1g7Ny/5ZiA0DfGmQo0zB7zJFKgTvVxz7V
         r8q01eM5Ku7dWG4qihktB1ab63Ss6IHURXlPpZ4BI/Rwnvcu0iFl4MWjdoR84qsRxYbM
         f15EKgILNCOZi0CnBRCAtECXOP1CfAd3+OQso5uRSYUXhtzwArdFmH6vHCRKkKjFXfGT
         /Y6iPWxHVSBlkzkujwRCD8VfBtZKrQT7D2jrMJl+te+eU+kpC2dA8lMW891GHFIUEKkD
         lNUg==
X-Forwarded-Encrypted: i=1; AKwUvByCGgjAqrLqGGn7tw/PeesEQ+2ZyFJysl74LRatGsUnjDavWGtAh7nRlDDVinf/fM/iFgATYQCiNiKJC3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zh0dgV3chkpwf3efuYHVC3Eta7qr89efZFAI1EUCBAitGmlEE
	1VFSNOPO+JUfYIjq7+vEk4l3OnUrVTARXiSNDVdzTuwZyivURL0GFYo/
X-Gm-Gg: AYBFou2JDy1d6ULLMhhlYKKPkO7iEO7TihBhMrF1tcAsp4nzrDGfp2r827nOGdesPwp
	uxnnC+8YCoNdHvi9Ze0IFsEciHRQf2Zgzm1Af+Fz9VrjESyxEOlYiNWBEDYhj9lmZosfdogTu8A
	B957XcFLAqmg68iMp4pzljTj9WWfxFN6VYklWltY0uluWxedPCQZAekd5QtVRG1yAifX6ZbzOVO
	Fa3EaIHmlMpc5WVCjrfqMlK2KHEe08RjCgvWxa2CLpDS4MKJ/o3x/K4ha8BDDqkbgGPRGjoXeea
	NXzm7FTnOJVBvgOlWrIT2A/d86wJAwSCLL7bs3TXsBua59OawaxOlIlFOOvxQkKzxJAeWAt++DX
	GpfojdBeRlf4fuuP/CKVWPy5pkZYUfmjpzafH9bscRXUPYB+q15DaW6wUvFrPI3r9ELnJ+joZvM
	U9ac6YxSkJEnxsasYB2aMVznIHbMhATWVwOpyiC3kernSbz37XWYfb49FsYf33W785uKy3pdnKT
	DYXnVNgYVMPYBI80Tf+zz8rEEypfp5YxatdrVYq0fIclnKOTU1dpJX2znlscx4N2a8wNzMT+8ql
	nxZ8jX9y9Mq3R50r5ILSZvXwMxlkCQR5ZajdweImWdV7ZzQFFjQLO9QYpXzsQ0NCGKrJ3KABKaD
	hnz3E7Lso6qjTSF2TXOe9QQHtf46BwZqcEpDk88WotEAxy5ekjAm61iDdNGul2KqJUc+1XRP5Gd
	a95AD1fRN6FWjt9EQvNrGe6EtGqI4Aq6AEwLDayF8mWTJUx+aJrzHduI22s9BCa5bkboHgMqNZp
	Mdcl5CHoT2x
X-Received: by 2002:a17:907:7fa5:b0:c4c:f846:1f1d with SMTP id a640c23a62f3a-c4d351f29d0mr243614666b.3.1793978623026;
        Fri, 06 Nov 2026 07:23:43 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c1d55sm87914166b.62.2026.11.06.07.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:23:42 -0800 (PST)
Message-ID: <092a1b61-0343-43be-9cba-c880949aebe9@gmail.com>
Date: Fri, 6 Nov 2026 16:23:41 +0100
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
Subject: Re: [syzbot] [iommu?] memory leak in iommu_fwspec_init
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: syzbot <syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com>,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, kevin.tian@intel.com,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com,
 syzkaller-bugs@googlegroups.com, will@kernel.org
References: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
 <08037337-f8ac-4bca-b849-4c856d0bb68c@gmail.com>
Content-Language: en-US
In-Reply-To: <08037337-f8ac-4bca-b849-4c856d0bb68c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 16:08, Krystian Kaniewski wrote:
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want syzbot to run the reproducer, reply with:
>> #syz test: git://repo/address.git branch-or-commit-hash
>> If you attach or paste a git patch, syzbot will apply it before testing.
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup
> Please move the fix out of iommu_fwspec_init() and into
> iommu_mock_device_add(), and leave iommu_fwspec_init() unchanged. The
> same core-level approach for this leak was already rejected by Robin
> Murphy on 2026-11-02 [1]. iommu_fwspec_init() is designed to run
> together with iommu_probe_device() or with a caller that cleans up after
> a failure, as of_iommu_configure() does. The defect is the early return
> in iommu_mock_device_add().
> 
> The leak happens because iommu_mock_device_add() returns the error of
> iommu_fwspec_init() without freeing dev->iommu. iommu_fwspec_init() can
> allocate dev->iommu with dev_iommu_get() and then fail to allocate the
> fwspec. The mock device has not been added at that point, so no bus
> notifier will ever call iommu_release_device() for it, and the
> put_device() in mock_dev_create() frees only the mock device. When
> iommu_fwspec_init() fails, iommu_mock_device_add() should call
> dev_iommu_free() if dev->iommu is set. The check is needed because
> iommu_fwspec_init() can also fail before it allocates anything, for
> example when dev_iommu_get() itself fails. The existing dev_iommu_free()
> on the device_add() failure path is correct and must stay. One error
> label shared by both failure paths is a clean way to write it.
> 
> Please change the tag to:
> 
>   Fixes: 2a918911ed3d ("iommufd: Register iommufd mock devices with fwspec")
> 
> That commit added the early return that leaks. The current tag names
> 72acd9df18f1, a v5.7 change, so stable tooling would try to carry a core
> change to trees that do not even have the mock helper, which only exists
> since v6.18.
> 
> The commit message has to describe the new placement: name the early
> return in iommu_mock_device_add() as the cause and explain why nothing
> else frees dev->iommu for a mock device that was never added.
> 
> While rewriting the message, please also keep it short. From the
> kmemleak report, the allocation chain (dev_iommu_get, iommu_fwspec_init
> and iommu_mock_device_add with their source lines) is enough. The hex
> dump, the object address, the comm line and the syscall entry frames can
> go. Two or three short paragraphs are enough for this change.
> 
> [1] https://lore.kernel.org/all/7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com/
> 
Please disregard the previous mail in this thread. It was meant as
review feedback on syzbot's AI-generated patch for this report, which is
still in moderation and was not posted to this list. It does not refer
to Qing Zhang's patch, which already makes this fix in
iommu_mock_device_add(). Sorry for the noise.
-- 
Krystian Kaniewski
