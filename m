Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709659;
	b=pcAIVRckNHhFRgnUbuyi3ltQw6ge2UnxiWUKtqhwaxGF8vtGgyCEBubyDt3FAn1VYET7
	 Kaxa5GWPWKjF3o3womOii9US5taaLo7/gzqV3JnOyMKuXohfHSghik7ujfl8qiZAhg88h
	 rn66FH+do+1YX2JKR0Uw8eENNEAuHIzS1zM2atqEZLz0hvybntoDEJCLkzkDa8sDcv7jJ
	 LY/Ne0boLk/zxWwPw000kNP2VjPZUEj/LPco/PXmMqu1cVXwTK8OnvZ4auvxbMpQ+l3HE
	 VKp2gEXlLKIzhYdk+aGegqMf29kmR5IgghBhKd3N3STgkU2DstLfBqldPhJSMtOlS/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NYVAHLrztlkXJBkmM5zy+74Kzl65MS3LN/LLEypDeDA=;
	b=G0SMqAHo+SC0gZyNYox77GlNSbam2bSqn2vverOy2tYtYQScs91N8rolImz+DSPGl1kL
	 cfxoJellLJJYrhdJbzutysibznAlTeYVLb2+lz4jn4wxsL+s7G6Q/wFrb1Ot8X8NeAv8M
	 A3CNDnVP6UsoKKKVA9iGKWqUzRpj2YOmpNgSx265EP0D0rRJPFnHV8x+W62yw4dqvIF1f
	 BAG3nncKscFqdRmVL5zR/iXVzDbVj+9g0F6ByttBQlYjErjtMKAL8VNgkWZmphVGassrj
	 LCX3+1qDnBmh8+vzIoC+JW8TvjgZhLkxPetK26cPn0oPd45AX3agFzMdFnF0Y/2T6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="J/0owWe2";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4997606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4997606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J/0owWe2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE9A41595;
	Tue,  3 Nov 2026 04:40:54 -0800 (PST)
Received: from [10.57.79.188] (unknown [10.57.79.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7218B3F628;
	Tue,  3 Nov 2026 04:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793709658; bh=gogTsLKDlsXz4VUWeBOml0TBarLR76MOybfBRSYzeTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J/0owWe2uTrWOpANjWFObM0r81Mf0Lv4BddrvhW1PS55vLuMa4HJYXriLAQYpomVc
	 qJBiTiKIJrlUJjnoVBsf1fbebD5xnlKVAZkb/3j+76ejCGycRnTCBsymFXluj2Bwys
	 VEo8vZQGOBjEI7kWQHN3FJwxtP+64Srpygo+d/A8=
Message-ID: <42f8e9e9-858a-4a0a-bbf7-daaeba368736@arm.com>
Date: Tue, 3 Nov 2026 12:40:54 +0000
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
Subject: Re: [PATCH v2] drm/panthor: Add more reviewers
To: Akash Goel <akash.goel@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karunika Choo <karunika.choo@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Florent Tomasin <florent.tomasin@arm.com>,
 Daniel Stone <daniels@collabora.com>
References: <20261030144305.666845-1-liviu.dudau@arm.com>
 <20261030144805.667158-1-liviu.dudau@arm.com>
 <6ce83db8-f696-4507-88e1-0e113b8da8a3@arm.com>
Content-Language: en-US
From: Chris Diamand <chris.diamand@arm.com>
In-Reply-To: <6ce83db8-f696-4507-88e1-0e113b8da8a3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 10:58, Akash Goel wrote:
> 
> On 10/30/26 14:48, Liviu Dudau wrote:
>> We now have more people that can do reviews and contribute patches
>> to Panthor, so add their names to the list.
>>
>> Signed-off-by: Liviu Dudau<liviu.dudau@arm.com>
>>
>> ---
>> v2: Forgot to add Chris Diamand to the list, fixed.
>> ---
>>   MAINTAINERS | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 89ea35a35c680..ef92c462a8381 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2321,6 +2321,10 @@ ARM MALI PANTHOR DRM DRIVER
>>   M:    Boris Brezillon<boris.brezillon@collabora.com>
>>   M:    Steven Price<steven.price@arm.com>
>>   M:    Liviu Dudau<liviu.dudau@arm.com>
>> +R:    Akash Goel<akash.goel@arm.com>
>> +R:    Karunika Choo<karunika.choo@arm.com>
>> +R:    Lukas Zapolskas<lukas.zapolskas@arm.com>
>> +R:    Chris Diamand<chris.diamand@arm.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Supported
>>   T:    githttps://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Acked-by: Akash Goel<akash.goel@arm.com>
> 
> Best regards,
> Akash
>

Acked-by: Chris Diamand <chris.diamand@arm.com>

Thanks Liviu!
Chris
