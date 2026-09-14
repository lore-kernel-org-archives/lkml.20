Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E78B145B27
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380004; cv=none; b=GcUlOMetrAGIcvSQ4xvgwd98wR2jp3dv7FPndgUzvbB11eGEYEt4pwnQrZJwFUFHmSFan9RRJ+iyaDvamy4FQtiIRX5R0De6I566RImVZvq8s39i26si1anofB9cDp3c9q/RHhhLD/uxoEV4LxaLEtGfNPhSJAvUlC80stj9NB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380004; c=relaxed/simple;
	bh=b4naa9WlCWXdDgBBJw3o2FWfn8Zxu+C00MCs2fJh1Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jjQGejhgnJ1v0GUrVqZaGVLV6sOvJyyjcB3Ew4sHYRJBvjJ9tJFl/x5K3oeg/lz8RcmmARKQSBPyRHFcfqaZBBhkE+PzS4vX83MqsS5jo/k93k1Y8iJvb43PGOfcCYqdaT4d7XR+unIXrzxhsZDn9gwjzsTjMfxv2DCaSPw0VKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/55tDZf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUEkqYzN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/55tDZf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUEkqYzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789380001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
	b=M/55tDZf8Js9zfR2Av6FDaGclj2S83iJjUn9P8g4ZiP5CC8calvZe5iE9xLJIAARIRjcnZ
	gRyVcN64XjsMElEH/I79ple7umZEk89FcBSRXTHpqwQLB9yNGUFSf9FfngTx+o/K1Q5qFH
	rMfMoL9NBDRPxmyiZwPF8xoXAKeRZjE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-NbnrhgArOcO3KAHn_ZA7cw-1; Mon, 14 Sep 2026 05:59:59 -0400
X-MC-Unique: NbnrhgArOcO3KAHn_ZA7cw-1
X-Mimecast-MFC-AGG-ID: NbnrhgArOcO3KAHn_ZA7cw_1789379998
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5677897a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789379998; x=1789984798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
        b=gUEkqYzNpu3Sy0P+HyzVbJi+9A9Fc1r3NCsdZ4rYJWVRNt37DEYliH4FEgimT9CDvi
         YUQgZw9V8foqiNxHXFeZA27k4LYc6cGpqOcW5JkrrPY2wXc5+1H+L9cxfg3Qcs6VV9Gn
         LgCJJX0XtPiijmrpfeJTBN1uHKIDQdcaz/T7UyUPp+0loXbJtB+ZpoYlTgOTG62CbrF0
         c/tzxKg7Hd/9+nulhmqM63/5B+9CRCjGkFIaqq5IeTvqbX0Md9eC6FKc/zqTctHP0LJD
         +scCTf+dDGDgMFzfW3Qhd59MPWTh4+qdhqe0XtUeYZDIrLz+cFN6wMiDAjAQPGZnUjTT
         qpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379998; x=1789984798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypy8vva409xUcIhg7UrFn+M558mkrKtyBpJ0I/QZb8I=;
        b=fZkYhR2bfg32cIv+64qvgBh+fz5hKDLZBNLKO0yg6vS9hIfo/Y2FNcw3fQpUtNiKQD
         Zk8QN9gb922GDa/iMY8G800Uz4R+RPrmUzDKI4Z1CCSOpDlrb9bz3z/htSaIAhpv/ST2
         1YEPDFEs74Hzz79WU9CgUZB+VRhIJP8+mTIvXfwYvl8rUc9uaiMYKfi2QebpFDt0CCN8
         ftgIEdWNrc5GMFooH+SJGitxAutEkIzMTw6pmi3oBcPMTQmAbfDGJL5s6waWRQ8z4YCk
         64RAbkOf/3dUO3Rnbas+069Jz3VhmHJOaY+8rCCjoiOVWU4+6aSTaQweA0T5PaoQt3ts
         hteQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbPjHuA6peez16ocZMqIA0XkO5ReKhEzPlTWVV65439qozhZwgdP3HjqmDbSA+xVDJlEzq0EvYhqBrH60=@vger.kernel.org
X-Gm-Message-State: AFuF++kxLND87E70BZfthMCEo5YINIHjrmOMoJ4a/Sos7TPOh3a8V+yW
	6hW3onHZHvl6b3rVKSD9NxJ9w33h3zJYbC9h3Mo9PW5O/dveysODzvAxb/F2FzDMfTI0lm7f0nO
	9FfzP+29NBvv8H1P6dkN00+NTsxu41XV61atHSWdVJpF1dKEEXwwApR8gSWCN5DK7Kg==
X-Gm-Gg: AYBFou2/FsfiKKk/erOT7aCtqnrPqJZbfkEod30a4ukn1obud3k8VwASH/Z9K11KwEv
	2L9QokSBapUt1ww6JhFV0peuWv6c8TAokQijPkpDM/CTTTEfzuCS3Df8IW086eGa2GiAECd8R0P
	IUwP6/LxqEaRyuJIy5Sj2uP1piFobsK0xEO7zd3Rsv2/3sLxlkU1aLJw3D4npmdBYqHNeWqPR80
	iqA6SGprc6WHFPtO4DaXhnQA0iNx+cT/6EIrfYK3fXfrqBD4MMBtibOiBSTmuLxUvYesPEamekG
	izeeCN/gSrYqL11RrqJXeFfHYPlW7S7xqPZP3Q0en4lwzbioRxigF4Efsay7GFMk4in7Ne5YRLk
	z87hpDWUm5dMBP6QyoJmGfuWrgDR0U1T0viX6nwxasg==
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3464025a91.7.1789379998030;
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:39d:eda4:43f2 with SMTP id 98e67ed59e1d1-39deda4487amr3463941a91.7.1789379997512;
        Mon, 14 Sep 2026 02:59:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm27206495eec.29.2026.09.14.02.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:59:56 -0700 (PDT)
Message-ID: <ca30e5e2-2bb5-40ec-8357-d5c3eab8a6f3@redhat.com>
Date: Mon, 14 Sep 2026 19:59:46 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/7] firmware: arm_rmm: Add support for SRO
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-5-suzuki.poulose@arm.com>
 <f00d01d1-8df0-4865-8e52-c85171cf4ca5@redhat.com>
 <4f18aa66-2296-4b63-87f5-6ab493faecbc@arm.com>
 <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1fca136f-5802-449a-81f1-3a76c31a2f74@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 6:19 PM, Suzuki K Poulose wrote:
> On 14/09/2026 07:22, Suzuki K Poulose wrote:
>> On 14/09/2026 06:04, Gavin Shan wrote:
>>> On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
>>>> RMM v2.0 introduces the concept of "Stateful RMI Operations" (SRO). This
>>>> means that an SMC can return with an operation still in progress. The
>>>> host is expected to continue the operation until it reaches a conclusion
>>>> (either success or failure). During this process the RMM can request
>>>> additional memory ('donate') or hand memory back to the host
>>>> ('reclaim'). The host can request an in progress operation is cancelled,
>>>> but still continue the operation until it has completed (otherwise the
>>>> incomplete operation may cause future RMM operations to fail).
>>>>
>>>> The SRO is tracked using a struct rmi_sro_state object which keeps track
>>>> of any memory which has been allocated but not yet consumed by the RMM
>>>> or reclaimed from the RMM. This allows the memory to be reused in a
>>>> future request within the same operation. It will also permit an
>>>> operation to be done in a context where memory allocation may be
>>>> difficult (e.g. atomic context) with the option to abort the operation
>>>> and retry the memory allocation outside of the atomic context. The
>>>> memory stored in the struct rmi_sro_state object can then be reused on
>>>> the subsequent attempt.
>>>>
>>>> Wrappers for SRO RMI commands are also provided here because they depend
>>>> on the rmi_sro_execute() implementation added by this patch.
>>>> Delegate/undelegate handles are also added here because they now use the
>>>> SRO/stateful command infrastructure and are also used for the memory
>>>> DONATE/RECLAIM flows.
>>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>> Co-Developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>>
>>
>>>> ---
>>>>   drivers/firmware/arm_rmm/rmi.c | 586 +++++++++++++++++++++++++++++++++
>>>>   include/linux/arm-rmi-cmds.h   |  41 +++
>>>>   2 files changed, 627 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>>> index 5b0e342ce3d58..4f9898ece7547 100644
>>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>
>>>
>>> I would drop rmi_granule_range_{delegate, undelegate}() by combining their logics to
>>> their only callers rmi_{delegate, undelegate}_range(). More details are provided for
>>> rmi_{delegate, undelegate}_range() in the below.
>>
>> Ack
> 
> I have moved them closer, but kept the logic separate, since this is not
> a simple RMI call.
> 

Yeah, it's fine by moving rmi_granule_range_{delegate, undelegate}() to their only
callers. However, the unnecessary if statements can be avoided in their only callers
rmi_{delegate, undelegate)_range(). Besides, rmi_delegate_range() would come before
rmi_undelegate_range().

	while (...) {
		ret = rmi_granule_range_undelegate(phys, top, &next);
		if (ret != RMI_SUCCESS)
			break;

		/* Buggy RMM ? Let the caller leak the pages */
		if (next <= phys) {
			ret = -ENXIO;
			break;
		}

		phys = next;
	}

The variable 'out_top' in rmi_{delegate, undelegate)_range() may be renamed to 'next',
indicating it's the next (starting) granule for the RMI calls.

Thanks,
Gavin

