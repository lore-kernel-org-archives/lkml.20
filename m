Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353922;
	b=j7I5PdKmyvvdvARKwnz0Umy8F/QKIVrr98JUDoGdsq7tsXtc3qdPOoCj+XSwtvd6UpMZ
	 4O4PqraLIcjTSliyYr5I9gstEffM/JoUSOG1jrHjPduCD+O6H9yxVTRPfg3DgDoXSYpDS
	 6UlTL4y0v0i51XYewMWsUxDWEymRz4kh7LG284IrqDZLPlp0dV3Wo0yL5OF5C7ELjvQ1W
	 njV8Hm7yAieuPh/qpeR9FCq3J0pmZVrpPphWWUwDWFIKzs8OOANdCaDowGAYmGKzfFg8z
	 xkNnZIClJPmYzkTr+DVEhZRMYaoC+/JVtt/NJnISBOXqh8ZR1DLyt/llXImbU6FXv2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353922;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sSHdcYGiw5uX+5DAMChQVQ2kwmuuDQLs53wCDoEKCUM=;
	b=LrzAAphw/OCH40b6XSZNd9k1Dgmge2Nz4t2r4y+UNdOZtBXC7kcO9f7xTQM17cHPfMn1
	 KqQnu8KkuQRuctS90s1aK6Ma4zjA62zYQ6zfGu/MPIPNCpoTgfR0A3RVNa+jRXtdsu+UW
	 I2/+WaLacHdxaPGl7d53xmM3AnTphsJ/o3gq+BH6P/0hxIJ6dL5Zm0/1CFfdNA4OgegVk
	 q6Sr1tWPrLJsPyhZbi+CNXMQLZ41je9d1HgJNcEIp/qasnJNUobBmBojQPW7Wyl9Hdhs6
	 lHWdsHCo/vk33D1lGZkFHYNwmtRtO2K62HH0zKcytBvlT2K6w75xERIO52yQS1CXHAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2AVRSIoT;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261D606A321;
	Tue, 10 Nov 2026 23:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D261D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2AVRSIoT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sSHdcYGiw5uX+5DAMChQVQ2kwmuuDQLs53wCDoEKCUM=; b=2AVRSIoT3Hlc8p9Sd8i66krZfT
	AsX+HzKMnBK1ZvBOM3NCUsLweaED6aOyyYY5O6H3hRpyis9u7MfumFVhuxLeTcy1DWDoVKzY76nl0
	USOdsN9GqeGIEdFhstDlpsnCQF1jgRIL+ySv9+ezQCCblD/1ecnsbUkwr/raKmcEpF0x82e//KF60
	cwPoByUOMGaZuS2LT1JU1jUQocjInmKQNSNALKBmq2wmmoMRtXi7ZbuiA7pYH444eytVZXYPJqDJ+
	Dfm3BhZGi561eACEhIAo7nbLei5zuTJrvcYkt3+XJ/REGWu36OSyALZ5NYP0m35kbR0DjD77C50bc
	hH7Jru+w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvQF-00000005FZd-0c6N;
	Tue, 10 Nov 2026 23:38:39 +0000
Message-ID: <9e128735-6f0c-4293-af09-1808b3b32c2e@infradead.org>
Date: Tue, 10 Nov 2026 15:38:38 -0800
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
Subject: Re: [PATCH] Documentation: Add category of subsystem-apis
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105181542.3071-2-manuelebnerli@mailbox.org>
 <43787755-f0ef-4338-b0d6-fcffcdfcc402@infradead.org>
 <cc36e81bf914e1ba3d641d2fe5aa38c52a275ece.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cc36e81bf914e1ba3d641d2fe5aa38c52a275ece.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/6/26 3:52 AM, Manuel Ebner wrote:
> Hi Randy,
> 
> On Thu, 2026-11-05 at 14:01 -0800, Randy Dunlap wrote:
>> On 11/5/26 10:15 AM, Manuel Ebner wrote:
>>> Add Bus and Communication category to reduce number of items in
>>> 'Other subsystems'.
>>>
>>> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
>> driver-api/index.html
>> This LGTM but at first I was wondering why I2C is listed here but I3C
>> is not.  I3C is listed under driver-api/index.html. So are some other
>> buses.
> 
> I think the actual reason is: There is Documentation/i2c/
> but no Documentation/i3c/ . subsystem-apis.rst links to Documentation/<name>/index.rst ,
> core-api/index.rst links to Documentation/core-api/<name>.rst .
> 
> however there is driver-api/i2c.rst and driver-api/i3c/index.rst.
> Thats why Documentation/driver-api/index.rst has this:
>> Bus-level documentation
>>     ...
>>     I3C subsystem
>>     ...
>> Subsystem-specific APIs
>>     ...
>>     I2C and SMBus Subsystem
> 
> The structure is weird.
> 
> driver-api/index's justification is clearly stated, subsystem-apis's isn't.
> What is it?

"... how specific kernel subsystems work from the point of view of a kernel developer."

so it seems to be kernel internals and maybe some "theory of operation" type
documentation.

> 
>> That is a little confusing to me. ISTM that we need so *not* have
>> 2 places listing bus documentation...
> 
> I'm not sure about that. If the files serve to different people/roles both
> should be kept, adapted and refined.
> 
>> Anyway, this is a good start on that. It could be merged as is.
>>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks
>  Manuel
> 
>>
>>> ---
>>>  Documentation/subsystem-apis.rst | 21 ++++++++++++++-------
>>>  1 file changed, 14 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
>>> index b1ad48bb40..4e886897d3 100644
>>> --- a/Documentation/subsystem-apis.rst
>>> +++ b/Documentation/subsystem-apis.rst
>>> @@ -24,6 +24,20 @@ Core subsystems
>>>     timers/index
>>>     locking/index
>>>  
>>> +Bus and Communication interfaces
>>> +--------------------------------
>>> +
>>> +.. toctree::
>>> +   :maxdepth: 1
>>> +
>>> +   i2c/index
>>> +   pcmcia/index
>>> +   spi/index
>>> +   w1/index
>>> +   usb/index
>>> +   PCI/index
>>> +   peci/index
>>> +
>>>  Human interfaces
>>>  ----------------
>>>  
>>> @@ -72,11 +86,7 @@ Other subsystems
>>>     cpu-freq/index
>>>     edac/index
>>>     fpga/index
>>> -   i2c/index
>>>     iio/index
>>> -   pcmcia/index
>>> -   spi/index
>>> -   w1/index
>>>     watchdog/index
>>>     virt/index
>>>     hwmon/index
>>> @@ -84,9 +94,6 @@ Other subsystems
>>>     security/index
>>>     crypto/index
>>>     bpf/index
>>> -   usb/index
>>> -   PCI/index
>>>     misc-devices/index
>>> -   peci/index
>>>     wmi/index
>>>     tee/index

-- 
~Randy

