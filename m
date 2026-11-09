Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224773;
	b=XjUOhtwLpoJi96q+fi6jnAQ/8UWuv8kwtJNFHHOPOxIf0xlCMcxycBSrRQYJk05CX57C
	 JbUdxlKKOA+E9ZdvyC6XneegGnhOTdSJMvJ0wmCFvocAXXQLeszxIKLr22IhFXmcS56VJ
	 vfVoRHH5PBaVntv/dfX1ison2P8K/JAZnn2mS7t9yR+VNH7er4fNTMuFgflWUA9ulh/Ez
	 +t432H1X0HHvwvDKr0MKw11nwaIRJlYNeJpDvkIsNrrMhVS2hyiYupT1IVXbDOhuG5hyw
	 6WrbYEmCKQRts3hjGlwqIhhlv/kOvy5sIgeeGsnTP3xdqNFAMxuL67i8sA0zNOSZ07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224773;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=inz3V9aU2hIOsAXbZhSDYnlb/bzphfFnZ8kzbgYaBlk=;
	b=NejnI3+Dhtuula9uVKYXf4p/YL4hbv1VfrLyZVezqoPFS1kc9BWOOOdP5vmJ79cvuty8
	 eJZrBxfRBY8io1RX2CxhaNdK94iQeBKVRLf5PMB/pjMe1nGkosspdtdn2BrrnIPUsSmA1
	 31vLmYvLdqQ82QlhXNF6KHJ42sDP9T9G2FIRo6SGET5omA5GtgNp3e9d20mQIrdi32AIS
	 /rE3G0Us1HY37ZftPFVoFLUckbXjKZrUuT49zbYv2XNbyZOH3DlxxfTBUqs3t59Fw+s2u
	 ymoc+SjJPHQNrbcImubKf3pgRyFrLQBEk/t/ilRfrdTcHHCLc1TGqyNb7h0kVneXJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="UDy/zwRf";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC463606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC463606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDy/zwRf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAF5E1516;
	Mon,  9 Nov 2026 03:46:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82E5C3F85F;
	Mon,  9 Nov 2026 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794224771; bh=SOsE0hHxasXXtCdWlJUe4/zvLfJPTM6n0JuFxF70CN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDy/zwRfRVfaKPLb7UyUTEVdxwfIEUun+o4m7fcFxRLUAcfno6nYRFQjV5M6F+Pio
	 A6Sn55YA0I9Okn0Ll2VnuRamAovaLYJkwAcHoH4M48T9VYGbMxabRyQmf5f59KTPPn
	 P+13J0vg9TLWbf1tXUcrvSBlQKyRQR/3Otr6CZsA=
Message-ID: <a7a484d0-9458-4051-aad0-983341dfb0e6@arm.com>
Date: Mon, 9 Nov 2026 11:46:09 +0000
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
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
 <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2026 10:34, James Clark wrote:
> 
> 
> On 09/11/2026 01:24, Jie Gan wrote:
>>
>>
>> On 5/13/2026 9:32 AM, Jie Gan wrote:
>>> Two related leaks when _coresight_build_path() encounters an error after
>>> coresight_grab_device() has already incremented the pm_runtime, module,
>>> and device references for a node:
>>>
>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>>     never called, permanently leaking all three references.
>>>
>>> 2. In coresight_build_path(), on failure the partial path was freed with
>>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>>     frees the coresight_path struct itself; it does not iterate 
>>> path_list
>>>     to call coresight_drop_device() and kfree() for each coresight_node
>>>     already added by deeper recursive calls, leaking both the 
>>> pm_runtime,
>>>     module, and device references and the node memory for every element
>>>     on the partial path.
>>>
>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>> _coresight_build_path(), and replacing kfree(path) with
>>> coresight_release_path(path) in coresight_build_path().
>>>
>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>>> coresight_grab_device()")
>>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>>> than tracer")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Gentle ping.
>>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index 46f247f73cf6..c1354ea8e11d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>>> coresight_device *csdev,
>>>           return ret;
>>>       node = kzalloc_obj(struct coresight_node);
>>> -    if (!node)
>>> +    if (!node) {
>>> +        coresight_drop_device(csdev);
>>>           return -ENOMEM;
>>> +    }
>>>       node->csdev = csdev;
>>>       list_add(&node->link, &path->path_list);
>>> @@ -851,7 +853,7 @@ struct coresight_path 
>>> *coresight_build_path(struct coresight_device *source,
>>>       rc = _coresight_build_path(source, source, sink, path);
>>>       if (rc) {
>>> -        kfree(path);
>>> +        coresight_release_path(path);
> 
> @Suzuki, there's a conflict here. This will need to be 
> coresight_release_path_locked() if we also take "coresight: etm-perf: 
> Serialize AUX topology access" from my Sashiko fixes.

The changes needed by the patch are already what your patches does.
Apologies Jie Gan, I have merged Jamess series which solves everything.
So, we can ignore this one.

Cheers
Suzuki

