Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008315;
	b=uXUvKhW9WM5vEi1lV2isG2Qze2LRrRurNJhQ63pXGrJNCZwFVIZwnG9Jw8EpqP7uUJ99
	 cXDFEf4S+TpKqqgv59wOMfY6Iygip8cIf4wp2liUCSQUbOfpHU/KTDfAtNMEqhoSNRJTX
	 BsIrBJn/m5PmF8Yp6uMUh26w3G7DuVUBNJ0N4LncwS64+oOxm6bEYXQkCpckwhWcQ7xS7
	 WEBfsqD+mAtHUxDJBqukPiFl9az3qpHVJeO3/nAJpL/VMOhsPhbVG40oYGCvTnfb6U/ka
	 nWX0/uDmKzj9N0nwGwu6b9dNwtvhybwQyxDQSSqkADHFOccffu46s/8klv0/0MVGh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008315;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lYPa8kg2EtIwfOZw7CZi0DilOcT4hEy9fRcyMfL076k=;
	b=Z1KzBmwAeUbQwIVQYU3iA4er/oet/jsEJfNdX1QyqfIev7wrsfp62kTkHt8wubhM/jtA
	 dR70L/qTupcqPw2xvDrMNYUAsHvEX/RxhhKe06SXFzsEeqRoWZAJn/HOp6ifvV895adg0
	 QmbNVEAV3mrVupcyn+n3g3Mt6QWKZvsRrNiOGP5w3Bd4Z4tS3TuwmP+sQ9Hf3qGVGHiQq
	 EPfufAK6gYBlVIKtzF0Kr7JiTQbOvFs7dDyWWU+watYA/Ee6qBvvnr1778KvgJ3YWyOxx
	 wEHvw1dMDUjjAuXILWxcaT5T5A26B1GsrWUlGH5PtDItKnGXGaZRTVGzSFyMHnePimg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNjygxAU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29682606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNjygxAU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A1F1F01828;
	Mon, 26 Oct 2026 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008314;
	bh=lYPa8kg2EtIwfOZw7CZi0DilOcT4hEy9fRcyMfL076k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SNjygxAUKQsgRdJGwwkDVu6actTZe3YlqOk3+VTB9UT07TKVL0SC3SZnOGZeCr0Rt
	 oIYgl0c/ZF4m8TGW4iEQ27iHikTPnaGnDGxbny+iuWk37x1Dgr7VzceulskaMmxBaJ
	 Haq0V0rLxbev+ZMQJOmS+AQLWYH1nPyMPKwW+3Ox64YA4W+mN9HNjirc201upz7/lV
	 2MVGUv/X0tOJj5TlSmxeTbm94EV3gW0vioHNIpEoGbSncQS9/Xcex/zNEkkI2mJpLX
	 XjaTU9U9xI6p1HMs/4sXGdtizAXnGpd4huFlpWVpOM6HhipDDOUOzXbDksBCw2Snvf
	 Py050TJGKoaSA==
Message-ID: <916c7258-5b2f-438f-b59b-db9dde28889e@kernel.org>
Date: Mon, 26 Oct 2026 10:51:47 +0100
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
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: Yuanhe Shu <xiangzao@linux.alibaba.com>, kaitao.cheng@linux.dev
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>, akpm@linux-foundation.org,
 vbabka@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com,
 ziy@nvidia.com, wangkefeng.wang@huawei.com, tujinjiang@huawei.com,
 mgorman@techsingularity.net, chengkaitao@kylinos.cn, muchun.song@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
 <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
 <20260929034123.2705745-1-xiangzao@linux.alibaba.com>
 <331b4e40-8d0c-4333-b2b6-b81e4c4b2e17@linux.dev>
 <877bjowf9i.fsf@DESKTOP-5N7EMDA>
 <20261020071600.3695395-1-xiangzao@linux.alibaba.com>
 <95a5ab94-5d91-4a01-a417-19f27aa91b54@kernel.org>
 <fbd5ae06-b6da-48f6-9c46-188fb6ba9684@linux.dev>
 <bc1b3255-99f7-49c8-bb52-bada6df80f72@kernel.org>
 <23d3756c-1a87-402d-80b4-c838dfc29f4d@linux.dev>
 <9da90d76-031f-4211-b9de-439cbf7bc63d@kernel.org>
 <49966df8-c092-40de-a05a-ff6d69382dd4@linux.dev>
 <e4c3ce3a-c19b-418a-a92e-40e077f1ea63@kernel.org>
 <58cfeba3-a3c0-426e-ba97-8f82da5b1e8d@linux.dev>
 <20261026025747.1432066-1-xiangzao@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261026025747.1432066-1-xiangzao@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 03:57, Yuanhe Shu wrote:
> On 10/22/26 20:39, Kaitao Cheng wrote:
>> Here are a few subtle corner cases I came up with. They may be
>> extremely unlikely to occur.
> 
> Both cases set the flag while the memcpy still succeeds - that is
> the "how this makes sense" for checking after the copy: a check
> before it misses them, the recheck after it catches both, and the
> refusal is the same either way (the data is still good in case A,
> already bad in case B).  What no flag check, before or after, can
> catch is corruption whose hardware report lands after the last
> check; that needs architecture support, as David noted.

Yes. And you really want to avoid reading corrupt data an triggering some
undesired HW reaction (MCE )etc.

> 
> The migration paths spell out the same placement and races in v2
> (patch 2, just posted), and the fallback patch ("mm/highmem: refuse
> to copy hwpoisoned folios in the !copy_mc fallbacks") is posted as
> well, with the races in its changelog.

Sorry, which patches did you post? Do you have a link? Do the supersede
both patches here?
-- 
Cheers,

David
