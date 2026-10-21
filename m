Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599170;
	b=DX85rzwu8f2jBYvzGNMbW7z2LpuIWTkpWclM5VrKYD6TO9tBbkxqlnJMjgy+wu0P1x9x
	 kxSEo7YdCXmn5SJm/djF6ig4TQ/MPFMPe/bQo09Miq0xauolhEQ9QyabkzETtp1aAec2j
	 1E3p4MsLMexjqPuaiEijgewsn/if3KoHcejT6/KKxz6eBzAe03OmXO5QZUifMmEqJA+Ir
	 qMqHccuBU7i66XyPaFsWFmJvKj1NxQyeQAgEKLjDURKbPSIwka4RgKcEAaJXjdv7D3dNc
	 yAjW4FPKruJdQaS5VO9ShfI4Ht8+aMQn8cI/VH3ZAoz4Zx+bmbGmCyhtBz4ithpZEZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599170;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fWCXC5NTHDGlDclEH2O75YYSkPzzTN8RMoYOZpRdROY=;
	b=Yns1/U1Rbx+LJSEbSx6onyCiXXb7URKJGkJGZxCDPB/JvTYNLLGmecxD1N3xSYQiq4hI
	 7HXwBhM7ZWGGS9tknvLgWTSnxV5J+9RX2ClUCliDNfr6k3ekaDbKg2ckdvMm6pcDm07qf
	 5tQeD6n4VEoD4e2RXMed4oIdpnrfUG6XDrpZrBNtyLO4eNBbmT7A8WhFD4Nd9OuXU15iM
	 HTUJ9J2RqohzDft+DSVFVq2gG2n49GbSJQE50A0Sd9U/PzGMwBpehg3rXtH+5Py0ROjKp
	 cxXyvWzQ/TTMeEQnB1A+OihlpdF7B30Dlpq9ydUX/qtX8/+8d9dIElti/5BfLOK/LDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBRFoX8I;
	arc=none smtp.remote-ip=95.215.58.41
Received: from mta1.migadu.com (out-41.mta1.migadu.com [95.215.58.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC660A381F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBC660A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TBRFoX8I
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E7cWh+ZF7GRhp7QeoNOeMiC4IRFKXkLJvJ6m7Tdn1+M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792599167; v=1; x=1793203967;
 b=TBRFoX8IfarmXP3muakvbtwd0Fnn3QkkD4ckj09YU7HdTxPcPh89Uos/XU2JNQ/FoCS4cfxi
 jY9el39vZ3+nuLjJejOVLV8ZO2aZZ+v2Q7EtY8BM/ASk7vXopV+beNHyiGno7OoNKsaIm/rlV5T
 e0/6T1gBLeK5+yVvR090buvk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d1bddb8955e5cc6b;
	Wed, 21 Oct 2026 16:12:47 +0000
X-Mizu-Trace-ID: d1bddb8955e5cc6b
X-Migadu-Flow: FLOW_OUT
Message-ID: <167a14f0-6a6f-4db1-a34b-905a33d5290d@linux.dev>
Date: Thu, 22 Oct 2026 00:12:32 +0800
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
Subject: Re: [PATCH v2] mm/ksm: keep soft-dirty and uffd-wp when merging a
 page
From: Lance Yang <lance.yang@linux.dev>
To: samarth.colleges@gmail.com
Cc: akpm@linux-foundation.org, xu.xin@linux.dev,
 Kiryl Shutsemau <kas@kernel.org>, chengming.zhou@linux.dev,
 peterx@redhat.com, rppt@kernel.org,
 "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <efa6a28c-f0f9-4d1e-9cce-fec2c08e7d9f@kernel.org>
 <20261020055518.36087-1-lance.yang@linux.dev>
 <3da45e6d-2b46-4fff-9ff3-241f70d68296@kernel.org>
 <f6bdf823-be42-4184-87d2-fc7c128f4786@linux.dev>
 <68f17ee7-d272-4475-8a59-645442e2c210@kernel.org>
 <ath8JTlITYcXsyLg@thinkstation>
 <2329ee64-f9be-4826-a496-65344e9a9c18@linux.dev>
Content-Language: en-US
In-Reply-To: <2329ee64-f9be-4826-a496-65344e9a9c18@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Samarth,

Could you send a v3 with just the soft-dirty fix, as David
suggested? Leave the uffd-wp/RWP bits to me (I'll take
a closer look).

On 2026/10/21 17:49, Lance Yang wrote:
> 
> 
> On 2026/10/21 16:55, Kiryl Shutsemau wrote:
>> On Wed, Oct 21, 2026 at 10:21:53AM +0200, David Hildenbrand (Arm) wrote:
>>>> +1. Did it ever actually work there :) Why not just skip them and
>>>> call it a day :D
>>>
>>> I think QEMU just always sets MADV_MERGABLE and later activates uffd. 
>>> So that
>>> needs some care to not disable them. So let's rather try to get it 
>>> fixed properly.
>>>
>>> Can you send out proper patches? Thanks!
> 
> Thanks David! Will take it over next week and get proper patches out :)
> 
>>
>> +1.
>>
>> Lance's direction is right. Unsharing is not an access: do_wp_page()
>> already skips the uffd-wp fault on FAULT_FLAG_UNSHARE, and RWP should do
>> the same.
> 
> Thanks Kiryl! Will take a close look at that :)
> 
> Cheers, Lance
> 

