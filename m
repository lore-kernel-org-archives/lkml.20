Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F0481A8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639200; cv=none; b=EHH2UXz784nsncAylvoGfrERFxM7B8j/e1Odad3cucGkcE5gHmk8/Egor6px+mirBPQiTOOGHQ3thEvnnDv6tF0uh2JTNZTcp54HvcakjvviAiNze4lQUxvUwpX28M0pfGKmQYEcpk3oIIgiQQvPX2tjaVf597WzXGd2waWg1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639200; c=relaxed/simple;
	bh=lPbr0GlFl1qWFLKZRgE+NZbWUkPC6kT+o+ZMBUR9dJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYXzR1eAEOo6lc6op3w3e671qHSNEZEDa6Zjn1dW/4kbs7UWut6Q7jPacSY45o7ucFz+7YKyLO2eUyElNFhmFmi/Wxy8bsDJ0a2V4Cs2AyDLgSneqFBREjNH++70sOXk8wBMt55YNzVliFWkxV4HJbE+pURkRHQqWBMZr31kVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n197orrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n197orrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC351F000FF;
	Thu, 17 Sep 2026 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789639194;
	bh=rHt157+yBiRSCduhhuqli6luHdUzlejn58B4cMvCDzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n197orrtCx4Bb2bmHB4DM8dWbLdMqQa+evif6TFaYfJOIGLwpDyfrp9sqTnXpu6l6
	 suEJ6LrnzY9kZEblR5EWAXAMVmk/XiYKeebRsgijfbic2zelWwM8LqcGUhTQRvq30I
	 8pJl8oF/eJWyUQsko4VWcWVw1OCG7OJsBBaIMK54PlAKM/ZW4DhsCUc9z+a4aSs7TQ
	 BsEl/Aya5exe1iGNgpmUEvjr2+kVhZiGVqL8XXSwXdTh5a3Lk2wlgKcoj9s3D/jOKB
	 Jm3LTyJy5yxG/wh0Y+iUCu6BWzsVavtVAeTaIi1hxSv3UccHgnrVqk9RMz8/RbI6O1
	 KM7wJQjI7p9lQ==
Message-ID: <276ab9d5-74b7-48bf-9cd5-94de0190f221@kernel.org>
Date: Thu, 17 Sep 2026 11:59:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] mm/ksm: use per-VMA locking for find_mergeable_vma()
To: xu.xin16@zte.com.cn, tujinjiang@huawei.com, akpm@linux-foundation.org,
 liam@infradead.org, surenb@google.com, rppt@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, chengming.zhou@linux.dev,
 usama.arif@linux.dev, gourry@gourry.net, harry@kernel.org,
 vbabka@kernel.org, peterz@infradead.org, borntraeger@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/13/26 06:17, xu.xin16@zte.com.cn wrote:
>>>    Patch 1 removes an unused 'vma' member from struct folio_walk.  It has
>>>    never been used since its introduction and is pure cleanup.


I am trying to figure out why your replies don't show up as properly threaded in my inbox, making the discussion impossible to follow.

Looking into your mail:

https://lore.kernel.org/all/20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn/raw

Message-ID: <20260913121716693wiN5osmShywgtitghSm7G@zte.com.cn>
In-Reply-To: <40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com

Something is messed up there in the References: tag.

It should be

References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn> <40c0c081-d636-407b-898e-f40f3d5d38cb@huawei.com>

-- 
Cheers,

David
