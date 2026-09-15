Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C834519A1;
	Tue, 15 Sep 2026 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501849; cv=none; b=kqJePXCRMk7ywzreNc9FnPnUurjlOXdO2OtoPQN+OUyUToTStcRYgjk9gCwEXAOgKyE11mgS7vvg/l3U/qRwJuUUha5+0p2XdB0laiVy0b7yCMEKNCHARuDM/ZdimKFo4dvGy/fvSWONFXALwIDHva7Gz1B9MFp3EKcxg5SGyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501849; c=relaxed/simple;
	bh=3n6hCy5qf1bpU5V2M7BtUUCa8Y7p8YbTuKLOJUx7d8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IUO3xSukzhwRSRd0UEK+lGcLhAdM4rsDOKYn9Rd6os06RGOWU+mZbP3UVXrQFObs2NYObiHH1HjZYnDzZkiZKi+HrrstK6vVmGCsJZL4h0L5JdIOzswic5ZtLoWb9Yc+6+DrRlIBehRA1E7sSwQ/wip3kcYFklKX19mxa2hsLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WqxcUu3c; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WqxcUu3c"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EE69B408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789501846; bh=jXOczofUEvkrBqpcuYbGbpcliZ0gOlKLqfrv/EClXo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WqxcUu3cx8hBBdXdwyYjkTITe55X2kp5l2yxw5xsZtUWp+hMBdYNe446ZB5AhJ1LD
	 CgWDVsvblGmUxsVOQFTt04CqVu23eeTqWMKywgBC1UkcbRcDHyoNTz/5BKUGLTyKpL
	 cVHIy5pznUuMgrqZyZUSl/XpYxAJ6TFjUFzJrbjCrkOQ9YV6CAMNOkuPGDtmZEpfHI
	 caa6EMrAGw1vPOTLhzJXHNdNX+xJO6ZaWPtY/aov6H6c9n3YyQYb3zrWwGSDEiMV3R
	 hraNXTl41LdPXlluVmbOKBuAG60VqSjB/Lo2KMD+Y/UbQQEl2J6JTGxqRMrBxtPM84
	 Yv40afzMGvgtw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EE69B408B4;
	Tue, 15 Sep 2026 19:50:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
In-Reply-To: <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
References: <20260914060615.1398531-1-rdunlap@infradead.org>
 <87ik469wd4.fsf@trenco.lwn.net>
 <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
Date: Tue, 15 Sep 2026 13:50:45 -0600
Message-ID: <87eceu70q2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> On 9/15/26 11:56 AM, Jonathan Corbet wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>>> Use literal blocks for 'cat' and 'echo' commands to separate them from
>>> the surrounding text. Otherwise the lines run together, without any
>>> clear break before or after the commands.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---
>>> Cc: Michal Simek <michal.simek@amd.com>
>>> Cc: Ronak Jain <ronak.jain@amd.com>
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>>> Cc: linux-doc@vger.kernel.org
>>>
>>>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>>>  1 file changed, 50 insertions(+), 20 deletions(-)
>>>
>>> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>>> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>>> @@ -141,32 +141,44 @@ Description:
>>>  
>>>  		Usage:
>>>  
>>> -		Select over temperature config ID to enable/disable feature
>>> +		Select over temperature config ID to enable/disable feature::
>>> +
>>>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
>> 
>> I was sure that this wouldn't work, since the literal block is not
>> indented relative to the containing text.  Sphinx does the right thing,
>> though... so applied, thanks,
>
> Yeah, I did test it and looked at the output. :)

Heh...it's nice to know that at least one person does that...:)

jon
