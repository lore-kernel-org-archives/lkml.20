Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B721944E66A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349228; cv=none; b=pNMrVfSgjgO0WHlbbod7han9+w35eFtxojU/g5AWrbX1jNECqYvr8zoG533ng7ecAVCVH4bqaW3cdShlgpnqk3Q+h012/dNM2+6hoWDzvdPz7nRpsf2G99KHQdmqMdCMrYtYQ7/tOjQeJT0dJ9vKBH+iV2TYKLQCt6wwGCf1/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349228; c=relaxed/simple;
	bh=1i3xnhnCocof9ehF0PfN3zlVeV8K880AMEybAJOgCVI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KFLA5tHvN0JFKYUCquGn0W9TVTijNct3eyQAephrzLsVKjLvITD0ogxmwhX15MdtzyzEYopVmtY1wBlr2mb/jFRq8v2UPJob8lIvdBDGMI3fGuNVR+9PI77bdU5N9ND9kb+68fNHAxhTRbUq8veJ0T7hImHNJAQq9K0J9dazUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apOPbevj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apOPbevj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1545955a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349225; x=1788954025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVkVuPhoPxzk6Z94L3N0Zj2zqqxuaLOIcq/Bx7B8iNM=;
        b=apOPbevjkr7Ag1PYky8FK+XSbYzKcHd0Gj8pEwf79In0Lq7O1cqRgqkAzJlYVy+EzZ
         uyj+K8OwdOwZKPo22us0I8aIegtioZXmsE1WVzQEpQ4z22fL7p1Ga3eQ70EgVoRQ6CsQ
         8++/JVcKxmXaKk2/T9KGdT1Zi5/luJbA9a7VOruyz+0J6ygcls02KPvGHRGA2P+ra3Bs
         Y/14whKNFxgA9e7PggKeqSKNCQx7BtFoExF42AGERmRd2xVN0a0WiU2nY89+rTi6JpTp
         jdGXYIm//mHmazg+wPXLjLF6OiawNUxIORUC25fht3ogZuNfFIseHa93MAjGKrGbAUpE
         R07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349225; x=1788954025;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVkVuPhoPxzk6Z94L3N0Zj2zqqxuaLOIcq/Bx7B8iNM=;
        b=JOGHYTJUhCEN+2VzZMkXGvwGHBYgOhLAa/OS3pvqHxTU4zu+L7hqvuXFpGQUApl5oB
         aGaCsjb28x0PlqenEhisS00jGZdH4FYwUKto1b2i1jra33wODzmYBkyEzGNy+KUKbfvu
         +Z8D3E3FWkUHrTrcD02VR/dUrM+Modo9RDIGJBgAotgWsg7/sBApY85QZsGIutTPV38i
         RJ7b44+n4KbZDQ8rvClYsrGLKpPksetb1HYrvttOC0M4lV7fQYdpdAJSwYP1QBMq9Ihu
         kujX27NL1utiegt3MVlvwqE/uRxkX7bgsRVilxuoaQ/7C7w6YNm903RmVrJ7IY3gNZYS
         wHIQ==
X-Forwarded-Encrypted: i=1; AKwUvByCEPWKgtaievGubnSkSNQOC/+lRGMbPxXTlxKi2jpt38L3fjD24IndIj00uU7I8Ehm7rqw4sWr37PCTqI=@vger.kernel.org
X-Gm-Message-State: AFuF++mw5bZN6AVXy9eSOKr/gNI9yr4Kcx5e+bqsKcZnJL22hHqiVa7Q
	PTV0GjbyraHsutUBXL5NNwOrlZqGrIMEqdzjN81YVyHM4gsg9CUfgeYv
X-Gm-Gg: AYBFou1EU8AsannA7HfvByLer9DreobH9B8RalkAimuhYuh4MfwzYRGqZH6eUIeXM/P
	ac2OI46AkA5WLBjRJRfOU6a9kTkIU2JPYZXC3nwEqpRu8rMV3qAhi+Ba+sMqMICOafkX1nXBCLx
	UdVY9oL/UZSfFjn1l2SofBWznoYLFgzK1MceN2+cjUNLFfu64gH0zDfxxuitel2Q6QZ4Akwb1bo
	fq54XgmeMXvTfTX2CE5+iG4a8wBUtguthTzTcZJlN2TJqEI+SkhUquMvntg8oKNrws31oqrGlBY
	x/WyJ723/teyIxfmO4zbtVmDfof2MFVibBLTq7A1Ig/5lOno4KmareGsvwuXTD0QwMgh8wJYb5d
	wiSPJ1e7mGlbh8aN8EIx+3hQNtBEQulNfMGSZp6cTSW8Td7w2JZMexxzMYZqfWhId8OUTEGogTW
	fDZM3NFeb8RTwiEYbKzbtcePBbTW1ULDNT60nJQt1RhVwjyLXQB04so9nEDzfqHiKS38FgOUjxG
	t7lms6HYFshwV+b294td/U=
X-Received: by 2002:a05:6402:218a:b0:6a6:584:d9e7 with SMTP id 4fb4d7f45d1cf-6a6832e4fa1mr3314668a12.15.1788349224695;
        Wed, 02 Sep 2026 04:40:24 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm939877a12.13.2026.09.02.04.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:40:23 -0700 (PDT)
Message-ID: <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>
Date: Wed, 2 Sep 2026 13:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
 <apcKQBRCFeF-usK7@kernel.org>
Content-Language: en-US
In-Reply-To: <apcKQBRCFeF-usK7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2026 19:24, Mike Rapoport wrote:
> On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
>> On 31/08/2026 13:32, Mike Rapoport wrote:
>>> For large sizes kmalloc falls back to page allocator anyway.
>>>
>>> And the doc is out of date unfortunately.
>> I think it would be a good idea to update the doc first, and by doing so
>> officially change the API. After getting this change approved, it's indeed
>> safe to rely on kmalloc() even for larger memory allocations.
> The documentation always lags behind the code and "official" API is what
> include/linux/slab.h says :)

This is what I found in slab.h:

  *
  * kmalloc is the normal method of allocating memory
  * for objects smaller than page size in the kernel.
  *

Maybe this needs a clarification too?

Regards,
    Eli
