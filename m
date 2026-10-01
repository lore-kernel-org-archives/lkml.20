Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67E547059
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837769; cv=none; b=qcF8nSAV78GrdXiDDWtJ4f3/9OtfKM8KKL8kA2wgEWwWoZ+nG0oe9UswWg2Py9u7/TXwi2UfPN6LzYzY+ek07Z3fv7E4uw6MlPNop89mxEFaSaM+ujaxInVMy0PQslEeNkAT9fjQrppah3g6Yf9lxZ50u28wvTdCoZ6gPJ6a5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837769; c=relaxed/simple;
	bh=XlsVLu+icFID6upUfeoVlAPJzRPwpg7aOdtVoGExR4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uICw2yFcqPXt/agbglYHAR1vIKfLEZwlUMK0/TX3q7CFZQs2DaByOpxOe1oCTr6zzBk3jH06mIV6Hnsw+zIiuHYoND9UkydgqKvRl9byKaCfD6LWmqrVDMdDsGZPkUfzz1tG+5OFvhFoXS7gisDwCJpJXeAHWMqOO7eYc0zH0dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0Jv2bUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0Jv2bUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353011F000FF;
	Thu,  1 Oct 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837767;
	bh=6bN6HNlcFQi10O1FNblhHULj/JwszE3SaFmNdNyfDw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=G0Jv2bUSp7QTNsyHQqyGV9oSEjrpgb0hsbqrRxGrrndSRNBVoXYO2RjARgPruAkeS
	 yGQA/8Xd8ur7KF9XEfZfu+5+YVPkFmATfJ08UdgHkuySryiVJFY3IleUnoDtFHu6p8
	 IDw2NzHKWOHaLbU4O2N/aS+W9VxrlDR/6o9q6hC0SrtqTkkkahApqfeig6fmKQDTND
	 0c+UP7kAWY1wwgCSEO4xHRuqdtlXrY6T8LblD+X8tz2Skh8t9MbqEWNCRbyLpvfBWy
	 +aDFY/s9uxg4regj9M4IOxNHewLkJHeLnD6lalkdqrl2Ff7Lk/NKHUVOJYRkFXl/Et
	 95f4IotXLAJww==
Message-ID: <f481da3a-88aa-4cfe-96ce-d332b812525a@kernel.org>
Date: Thu, 1 Oct 2026 08:56:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: =?UTF-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org> <art6x0XpWcT2aUyy@gremlin>
 <CAFPGN2jPGhcWVqa3k16RWMaMR3TwKyhFbYYF4D3L6L85T8E96g@mail.gmail.com>
 <7d120555-0c31-474f-893b-e5ee3466ead4@kernel.org> <arz82IHw4MqGTb6l@gremlin>
 <091706d4-96cf-4dbd-8f9f-97ebd3f8d81b@kernel.org> <ar00Lx1xB5rvKOdu@gremlin>
 <ar1y9pekhVr19MDm@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ar1y9pekhVr19MDm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 22:42, Jose A. Perez de Azpillaga wrote:
> On Wed, Sep 30, 2026 at 05:09:26PM +0100, Lorenzo Stoakes (ARM) wrote:
>> On Wed, Sep 30, 2026 at 06:08:15PM +0200, David Hildenbrand (Arm) wrote:
>>>
>>> Sure, but I still got CI noise because the patch was apparently not even
>>> properly tested?
>>>
>>> So I really want people that send "fixes" to test stuff first.
>>
>> Entirely agreed!
> 
> if nobody has picked this up, could I take the wrap around part on its
> own? I would implement it cleanly and test it before posting :)

I assume the first step would be to identify which cases are actually
problematic and try to see how we can easily (not AI schlopped) extend existing
selftests to highlight any actual problems.

-- 
Cheers,

David
