Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725318;
	b=C1wG/8z5+6E6DKoHQFzqx4yLoX9FxTfzxsnT2jE6jfPX0ipSsAxEs/hXNUDI/FJa5BDX
	 IXs9Bfhz5wJQgzRMLEj+nBSqdLBsei/Nvb3DjZkTnHdMDX0fTZCp4BX9m5PA+o/gHn6kO
	 TzdghDfGru7TU5t2yRYQkHOaqpix0PCw6VJ7v/rbYWL7a56DxGQJsE4NptPhP7B9Jds/y
	 e80piog3UZL92QjNGNAafuxGNPe9JcUU/xQc1KvKqGCd/rvbgR2UXBSby1SaVpHaLXRCj
	 pkaWJQqVOYGoWK1Q4MpMUGsYssXvy6o7rtkzlI3PaxQAmR3zQ9KtuqFh4EIutSrC2xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725318;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/ygLRDArd2qcZRlnb2YAG6JBEFLHnwKUcdybO4KmhRQ=;
	b=fBu4223uSrTi1vq4i2ExRuBIujbNSvAdXR7GLqkClV+Puhd3XVZjyZntd4cRMGYV163N
	 jVgdlEtfTS2EFCH+R5JequbpdaZDNPPa7HXV7nw4eYocMllsMe+UgA5z5rUxRUekDtqyj
	 yVCY7/AhH0DJgvJJqVep0sBpLMZnHluAj5ib6eY0mOvGBqB1Bcsidza5jxXas5r7E1pn2
	 hr0VoBOVyYR18gZKw/nXp0qQDlyjsfKvAekcVaJJfCru4sf6DiZ39/MsxaURl12qDRSdc
	 HpJVa0Cme2rqYXyAAu114ElPjIJlUxiMRF7QHEYDfEQWK9xjZboJNXrh1ehUfQGn3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXJx8p1e;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48A606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA48A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lXJx8p1e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EVSPRf8vZjWZPWFWXvzAwsJ1II8mVWMBvcu4Y1x6kdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793725315; v=1; x=1794330115;
 b=lXJx8p1eUasX2fzSD5gCO1OI3g/AW83HJ9DXJk8vDD5bQo7xzdiMhW9JYgas3xcogvLJPiEM
 Xq6tiCHXEzY0xIpMvF0Wt0Ug461eIAoZ3tDZ1BTbUWR9436X2ZiVAPM76zQerAkgdSfifUW3hCI
 jNKOsdoQBwVej+2WOugS+lLI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f9a1694e07816c8b;
	Tue, 03 Nov 2026 17:01:54 +0000
X-Mizu-Trace-ID: f9a1694e07816c8b
X-Migadu-Flow: FLOW_OUT
Message-ID: <0dce8e2f-e039-45f1-9579-91cad6563a66@linux.dev>
Date: Tue, 3 Nov 2026 17:01:53 +0000
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
Subject: Re: [PATCH] scsi: libsas: Fix interval notation
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jason Yan
 <yanaijie@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916124403.315227-2-manuelebnerli@mailbox.org>
 <9fd990b5-b4fd-423a-bd80-2bb630fc5de5@linux.dev>
 <2deda25727af9db748f86f2a3d1f61047c903f3a.camel@mailbox.org>
Content-Language: en-US
From: John Garry <john.garry@linux.dev>
In-Reply-To: <2deda25727af9db748f86f2a3d1f61047c903f3a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 14:25, Manuel Ebner wrote:
> On Wed, 2026-09-16 at 14:40 +0100, John Garry wrote:
>> On 9/16/26 13:44, Manuel Ebner wrote:
>>> Remove needless ']' from interval boundary.
>>>
>>
>> This documentation is wrong for this structure description (not shown) -
>> it should be for asd_sas_phy, not sas_phy
>>
>> Same for sas_port -> asd_sas_port
> 
> Does replacing all sas_phy -> asd_sas_phy and sas_port -> asd_sas_port
> fix this? Then I'll send a patch.
> 

uh, I don't think that anyone would be checking this documentation from 
now on, as I don't expect any drivers for new SAS HBAs which may even 
want to use libsas will appear.

John

 > Thanks>   Manuel
> 
> 
>>
>>> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
>>> ---
>>>    Documentation/scsi/libsas.rst | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/scsi/libsas.rst b/Documentation/scsi/libsas.rst
>>> index 305a253d5..9ebf2bf28 100644
>>> --- a/Documentation/scsi/libsas.rst
>>> +++ b/Documentation/scsi/libsas.rst
>>> @@ -75,7 +75,7 @@ enabled
>>>        - must be set (0/1)
>>>    
>>>    id
>>> -    - must be set [0,MAX_PHYS)]
>>> +    - must be set [0,MAX_PHYS)
>>
>> this looks ok, even though it is so trivial
>>
>>>    
>>>    class, proto, type, role, oob_mode, linkrate
>>>        - must be set

