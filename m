Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735263B637E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211091; cv=none; b=qSQCwEDvWEHa9HiHw6G0fceGcxRzWB/zbv0Rgx2BfoK56KTEZUVBduVpugR2X3ftD03IPoqvnEWqva/k1dvnaJCP98W4HZHVqHsshC8uIQL1ahXHNz8IYPjJZWKoNhQRFas11lI7fiVAKX4aT5fpPQ0r0rJsuGP8bGnsp8tSAdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211091; c=relaxed/simple;
	bh=Jkr0QkdfJr8FnChtSeQ1/rbXDmxEeCZhzllNdvHj41E=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IQLmE3KtEsi84PyZYK8WEExqyfnp9KWlmlq21tPC2eHw2aIDgAXJVQ/Ir3V05vu0cqLeGwK7ASn7WA9CxCMgiNruKSmBYYiixwmK5y4JNLmgYQvnsg8Z2foCZQUqR9pMmy8Do5hvI4x79duTBuCQwMNGTTOjdKWwWOxd/wXvB30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=DxysTwHj; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="DxysTwHj"
Received: from [192.168.166.159] (unknown [67.168.101.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6EEC120B7169;
	Fri, 16 Oct 2026 21:24:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6EEC120B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1792211084;
	bh=XVseF3WjgNaALzXpdva0ly98MIiOy+tOaXSz0sYI6nU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=DxysTwHjaTwuscpg9clg6DRk/8fASA47SYykJrj60fMhmQuUh4J2irNj6iEDxtGhC
	 dJcCr58PacCoF84pb+wPPYvRdwUU6TvdA5HrIa4FUCmngcfHkIQ6WyKPVNjBMp4JKw
	 rkbRjsFM+cJykzGifalhgLCQTAjAvpNE2VMi9JZY=
Message-ID: <ff9fff49-769e-4b4f-8012-e12e8c473501@linux.microsoft.com>
Date: Fri, 16 Oct 2026 21:24:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Dexuan Cui <DECUI@microsoft.com>, open list <linux-kernel@vger.kernel.org>,
 easwar.hariharan@linux.microsoft.com
Subject: Re: [PATCH] MAINTAINERS: Remove KY from the maintainers list
To: Haiyang Zhang <haiyangz@microsoft.com>
References: <20261008171348.91738-1-easwar.hariharan@linux.microsoft.com>
 <LV5PR21MB4704FC4A8175F692E1FB0E18CA9C2@LV5PR21MB4704.namprd21.prod.outlook.com>
From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <LV5PR21MB4704FC4A8175F692E1FB0E18CA9C2@LV5PR21MB4704.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/2026 13:50, Haiyang Zhang wrote:
> 
> 
>> -----Original Message-----
>> From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
>> Sent: Thursday, October 8, 2026 1:14 PM
>> To: Haiyang Zhang <haiyangz@microsoft.com>; wei.liu@kernel.org; Dexuan Cui
>> <DECUI@microsoft.com>; open list <linux-kernel@vger.kernel.org>
>> Cc: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
>> Subject: [PATCH] MAINTAINERS: Remove KY from the maintainers list
>>
>> KY has retired from Microsoft and his email is now bouncing. Remove the
>> entry from Maintainers.
>>
>> Signed-off-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f53047aa8d3c1..f263ac010209e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12161,7 +12161,6 @@ S:	Maintained
>>  F:	drivers/media/i2c/hi847.c
>>
>>  Hyper-V/Azure CORE AND DRIVERS
>> -M:	"K. Y. Srinivasan" <kys@microsoft.com>
>>  M:	Haiyang Zhang <haiyangz@microsoft.com>
>>  M:	Wei Liu <wei.liu@kernel.org>
>>  M:	Dexuan Cui <decui@microsoft.com>
> 
> Could you add KY and Long Li to <src>/CREDITS file,
> which list the people who worked on kernel for a long time.
> 
> Thanks,
>  - Haiyang

Wei sent an identical patch to Linus already, so this patch is effectively
EOL.

Thanks,
Easwar (he/him)
