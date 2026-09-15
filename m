Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA283DAAD4;
	Tue, 15 Sep 2026 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499206; cv=none; b=DwvnnZDNKOq70wpE7iXWydzOcK5aptYOxYFjNOEp8VHCXtOKKP06SKNd/USUZF/XyrzLeAN1PWZbKtrafW3j+4hD6hKlFDBhY1WQO/EE+pKDRCJmDxjYUFMLAW1RbL5WGIdiCq3FF1yi8hRUygTgdSJ6kUSbjVjaI2xcLTBwvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499206; c=relaxed/simple;
	bh=gumlr/GqX6cF6RSTi+qwgYubkmqyrtVgLeWZvuc4/Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFwDkTR0PYGXw+83nPfhkXNK9soDGJZb3YVv+psZzvYQT0tOs8JfnKPOxA99bKiHFOOF9zP9BBwB3u/vadEYZSwDcag83IYLL5e9G/wiixprv00VWcJQ6r0YvvylPuwLR+iObMs7eSg1Q1Be4FC7TYhU8QNtvYNSUhPPJN1hQ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bo0/mgxz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bo0/mgxz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OUYtQpgBPLuj7yRytKfvp24wERJMCxuXVbcvj5Jm6oI=; b=Bo0/mgxzovV+Y0o0ufU0EoaD1O
	+SxDs+ByZzZ8L///YaNaqF4WJwO0m86K8Hk5o4v2FNYmEcnYHvzprnMYww4z0usa2iGoTbUK2W1xP
	z0J3XlklgzZFP1gA7Wsglp5wkv872DtFIPZOMZJLEtzmzFZN2zW8z237AW0J+oOUwvdEpMcp5R641
	2M86WJuMA9p12Say5WiyzjU+535RQj8LU0d72BYckOBIzRVdFTYDKRZg+0TScVJfBrk6E5lYVbtfJ
	IFETfYDSVr12WsjZfoY/aPptR20zD0zx6TTzrNkWpfY/tQKXOEyhpV/udruGeX5f6aOmylkV6apzx
	5yZGuxyA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YUK-00000007pNq-0fGX;
	Tue, 15 Sep 2026 19:06:40 +0000
Message-ID: <ae2964c7-7875-4966-ad1c-b98d6050d42e@infradead.org>
Date: Tue, 15 Sep 2026 12:06:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: zynqmp: use literal blocks for commands
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>, Ronak Jain <ronak.jain@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260914060615.1398531-1-rdunlap@infradead.org>
 <87ik469wd4.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ik469wd4.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/15/26 11:56 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Use literal blocks for 'cat' and 'echo' commands to separate them from
>> the surrounding text. Otherwise the lines run together, without any
>> clear break before or after the commands.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Michal Simek <michal.simek@amd.com>
>> Cc: Ronak Jain <ronak.jain@amd.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: linux-doc@vger.kernel.org
>>
>>  Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |   70 +++++++---
>>  1 file changed, 50 insertions(+), 20 deletions(-)
>>
>> --- linux-next-20260911.orig/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>> +++ linux-next-20260911/Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
>> @@ -141,32 +141,44 @@ Description:
>>  
>>  		Usage:
>>  
>> -		Select over temperature config ID to enable/disable feature
>> +		Select over temperature config ID to enable/disable feature::
>> +
>>  		# echo 1 > /sys/devices/platform/firmware\:zynqmp-firmware/feature_config_id
> 
> I was sure that this wouldn't work, since the literal block is not
> indented relative to the containing text.  Sphinx does the right thing,
> though... so applied, thanks,

Yeah, I did test it and looked at the output. :)

-- 
~Randy

