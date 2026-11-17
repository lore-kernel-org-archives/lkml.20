Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.181.117.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918849;
	b=QJmGQNBm8nK7+ZwGqT3yX49UlFpV2hhPwo16sP39k3KzSF3rj14iiMe3NV9vq8uQBrcc
	 pNguFhGX6ebrOUw2HmA0wc1wDHwDf0uj4rjqetRb7N2HhjlSpsTn9Ymg3lyRnE6mNfnU/
	 F8IybvqpQAh7EPqWC5zvdCaP250QU/IUvCiTWqauY10qSWjxiJ80eiFAoEqmFrt5XSxeM
	 9Kxa8eRyIAbksrrLLJckrQv3pJV9MevePKZZfIpoabf6jHFxqTYbCA53Qr4eU6RnKyOSa
	 zO7UZbu8iYzll8t71AXWy5RWAGhGifcsb06gcUvQUQ3yzSFa363lSPPEEM5OF6YYUJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918849;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-EsetResult:X-EsetId;
	bh=udiQZ9uQQWu7/f+tNhCCnP9r2LL6KuH2yR241zmGFYc=;
	b=dRum0MsmnSz/AG7TLRcFK7kK51AFQ9+BqSluTz+YD1/dg1Rxd5S0SrYdpL1YpJhB8MhG
	 37ngjEbb9WMSccgiwGvhgCkXOidd8cUdALzRgXjwqaR2JWuJJK4pJ9I+96pftzDilVj6g
	 PHBiyp5T1g2aWzEiOSa2kBWUmHmzFLwIKZqCkZkmfpEaQjmZ/frTe/zWIA6o9ZhUdkeRM
	 gjQpzXph461qLsVP8f/kJnVr5nRdNUXfFSxb8HZgMNuE1ufXY5Dij7yWwoo87TjncnYux
	 KsQZjrLAHNnp6csxSn3tYaGnDv8xqDEnL0Y8Q/kBX+V4x9Uv4TP+43QhNGcoFF/RxCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=actia.se;
	spf=pass smtp.mailfrom=actia.se;
	arc=none smtp.remote-ip=212.181.117.226
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF45606A31C;
	Tue, 17 Nov 2026 12:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF45606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from [10.12.12.95] (10.12.12.95) by S185ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 13:34:00 +0100
Message-ID: <f2bca889-4554-4daa-be61-635fc193a276@actia.se>
Date: Tue, 17 Nov 2026 13:33:54 +0100
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
Subject: Re: [PATCH 0/2] usbip: stability changes
To: Shuah Khan <skhan@linuxfoundation.org>, Michael Grzeschik
	<grzeschik@puzzle.ch>, Valentina Manea <valentina.manea.m@gmail.com>, "Shuah
 Khan" <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
 <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
 <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
Content-Language: en-US
From: John Ernberg <john.ernberg@actia.se>
In-Reply-To: <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: S185ANL.actianordic.se (10.12.31.116) To
 S185ANL.actianordic.se (10.12.31.116)
X-EsetResult: clean, is OK
X-EsetId: 37303A29379CA95B617466

Hi Shuah,

On 17/11/2026 00:16, Shuah Khan wrote:
> On 11/13/26 04:34, John Ernberg wrote:
>> Hi Shuah,
>>
>> On 12/11/2026 23:46, Shuah Khan wrote:
>>> On 11/11/26 04:34, Michael Grzeschik wrote:
>>>> While using usbip on kirkwood embedded machine, I came accross
>>>> some stability issues. This series is addressing the reference counting
>>>> on and usage of the event handler itself.
>>>
>>> Tell me more about the stability issues? What doesn't work
>>> without these patches? Do you have reproducers for these
>>> problems?
>>>
>>
>> Since we also had the issue that 2/2 solves: The issue we have is that 
>> we see occasional CI failures with ghost USB devices remaining on the 
>> client side after our system (server side) had been suspended, even if 
>> the device was removed from the server.
>>
>> Applying a patch 2/2 (or our version of it sent earlier) solved the 
>> issue.
> 
> Hi John,
> 
> Can you send Tested-by for the 2/2 - did you also test patch 1/2?

I have not tested patch 1/2 because we have not seen that problem in our 
use cases so far, so we do not have a measurement of "good" for that 
fix. Michael will have to comment on that one.

Regarding patch 2/2, it seems Michael prefers our version [1].
I can provide a tested-by if you rather want to pick this one.

Best regards // John Ernberg

[1]: https://lore.kernel.org/linux-usb/avToeux2DxhBWGN4@toad.puzzle.ch/
