Received: from mta0.migadu.com (out-54.mta0.migadu.com [91.218.175.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26847605D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253296; cv=none; b=o2Jva6tB1ASQZOnO+DojLW+57SHw2qxAh5uf6N19X0vDF/3RY2R5LWpyrqFzh8Uc21IbjfO/xq1RD92rBjyT81w74qa9fp9zuIJxdRLPRMq4/HEqH+YOFY4efq8rq8hJaz31fKe5DbzwjXkfbCOe1x9X8A1OhJ8Qpqic7uF41SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253296; c=relaxed/simple;
	bh=/98Lx4TS3E3kYGDS5L20jZGNtHv6ocMq1GkZIw07U60=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a5TKIELEKzMgYW6PznyRqonH1fwChq2DTf0P2nLS06zNiin6gqYhCDkg9YIbHLrrZJ1RAglXXJ9YWVM8tW0+QbpKVgcA7RKSXYG6HpzPZGOd3Jg9AlC9i8z45aaJExqW75OpisbqBAyp55F0onfngQBtkZl+MupQ4FLEpw1ZqPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GH8879Y8; arc=none smtp.client-ip=91.218.175.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GH8879Y8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/98Lx4TS3E3kYGDS5L20jZGNtHv6ocMq1GkZIw07U60=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788253289; v=1; x=1788858089;
 b=GH8879Y89mbLKycbpRcyCEcukj8kZ9fqMLngEnQ/biKbBhp9o+L+WOkRvDptiiTyz5RVxI7e
 kH9riEgVVlqlNIzxV7nP3GTTFXOoX3Amfprj7MgquCHj6xNZsGJ3tTwhzqMG9DJ4vJpBanUPe3B
 ODR6g00OnoY/uu8ARlIR/asE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce5e7722b69386e3;
	Tue, 01 Sep 2026 09:01:29 +0000
X-Mizu-Trace-ID: ce5e7722b69386e3
X-Migadu-Flow: FLOW_OUT
Message-ID: <017b391d-2687-48f4-938f-b23a5b116690@linux.dev>
Date: Tue, 1 Sep 2026 17:01:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: hongfu.li@linux.dev, hughd@google.com, baolin.wang@linux.alibaba.com,
 vivek.kasireddy@intel.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] mm/memfd: don't unreserve hugetlb pages on -EEXIST in
 error path
To: Andrew Morton <akpm@linux-foundation.org>
References: <20260831090631.29227-1-hongfu.li@linux.dev>
 <20260831173513.41184f1d27cd83f2c8f9b935@linux-foundation.org>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20260831173513.41184f1d27cd83f2c8f9b935@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/1/26 8:35 AM, Andrew Morton wrote:
> On Mon, 31 Aug 2026 17:06:31 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:
>
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> If hugetlb_add_to_page_cache() fails with -EEXIST, a concurrent fault has
>> already instantiated the folio in the page cache, and the reservation now
>> belongs to that folio. Calling hugetlb_unreserve_pages() in that case
>> incorrectly removes the region backing the cached folio, and a later
>> truncate or inode eviction passes a negative (chg - freed) into
>> hugepage_subpool_put_pages(), corrupting subpool and resv_huge_pages
>> accounting.
>>
>> Skip the unreserve on -EEXIST; failures other than -EEXIST leave the
>> reservation unconsumed and still unreserve it.
> Thanks.
>
> AI review might have found another bug and it suggests that your
> proposal only partially fixes this bug:
>
> 	https://sashiko.dev/#/patchset/20260831090631.29227-1-hongfu.li@linux.dev

Thank you for the reminder.

I have carefully gone through the Sashiko review report.
The issue it pointed out is valid. I will address this
remaining problem and send out a v2 patch shortly.

-- 
Best regards,
Hongfu

