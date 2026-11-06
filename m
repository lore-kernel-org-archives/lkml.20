Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958068;
	b=bFV7dN8k6j7hAfNcCsK6k2iiMvr94a5h+NZcs0ugjR0ogfDs44j6kbYs4QON2uBIYxfv
	 T0Yj39gNSWupugqBxC7QpojLoRPv6zyWwGJIhRkR/gvAKnK9OvdeZ4J71W4f7sRkgFZAY
	 /cnXEEXOiG2A+3+EfQG79fupT+t8UTyL1oiKIUfeiWuxhDx10YVeqWFUk8ph9/Nuewlw7
	 nFZwxitH/CwVuMV9RtDA3l0GjJJ9fMJTRZOUJlQYIB9YJqZcLEqIAiqeRin23eTw/Q7D6
	 BAjErT74594wENdx8ka6elOw0PH4KbIowlS+KP+06H5Uhi7XXP6tBOFVrVLAPTo8CiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958068;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u++veeV2UEGzavVifT+Wy9EXLAeW8NwCQG/jN4kumaY=;
	b=0XPUKRcCUtR3ElOniGz6IQfwjgm37AjvKekgni+SWWoRZZc86wYHsY4vQYuT2uU/PQbv
	 KulIsVfdDfTZyLBylWIwJFUezFRFWUF/9NpkJ1pmi5Ftmy9aaU66ELxGLP2qwrkZKQ70y
	 ghArKdysYg+DIu0I5e1vgTwKSUpDZA1S4xecWuaZwYMQbFGzy1LiWuxCk+dHu0z1mDKZO
	 ckAfYx+lRznVPT7mV6W8UB+nxY9N8noQ4ULSB84hMKP6soV3cql+81pzjThbEkH+M58t/
	 wUlxw+3XX28kBmZNiJnwm0kIPVmTbHD0mFgZ1+al0lbW2h2dNLzHQfZCWIBpr0nO7kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=DkFigBwS;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7939606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7939606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=DkFigBwS
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793958063; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=u++veeV2UEGzavVifT+Wy9EXLAeW8NwCQG/jN4kumaY=;
	b=DkFigBwSugDesKuPqOGRhlGh/bpYVZBR8orKBKf1vZinqoGkmrFJAbKp9yP1uL2Vu/bdHFXzLPpeV/c6NMNoJq6hazGym3lWLYJzSQaIPgPC0tO4bG4IkPbN5DWXJIRKKvYe2EDQQsfzbOWJCVTKPFd20l/FNtY6GNurEB8oPDk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEBIttq_1793958062;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEBIttq_1793958062 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 17:41:03 +0800
Message-ID: <76e89362-6c79-4231-9d0c-0688c026b9b0@linux.alibaba.com>
Date: Fri, 6 Nov 2026 17:41:01 +0800
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
Subject: Re: [PATCH v2 1/3] Revert "mm/khugepaged: remove definition of struct
 khugepaged_mm_slot"
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-1-4384bbfe4606@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-1-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 4:57 AM, Lorenzo Stoakes (ARM) wrote:
> This partially reverts commit b4c9ffb54b32 ("mm/khugepaged: remove
> definition of struct khugepaged_mm_slot"), as a subsequent commit needs to
> resurrect this type to store additional data alongside the mm_slot.
> 
> The stated intent of the commit was to address a NULL check in
> __khugepaged_exit():
> 
> 	mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
> 
> slot can be NULL and mm_slot_entry() is an alias for container_of(), so
> this is container_of() a NULL value.
> 
> This was benign as there was only 1 field in khugepaged_mm_slot (offsetting
> NULL at 0 results in NULL), however it was right to fix this, so retain the
> fix.
> 
> It also unwrapped KMEM_CACHE() in khugepaged_init(). This was a mistake,
> and was itself reverted in commit c14bdcc9f274 ("mm/khugepaged: use
> KMEM_CACHE()"). Therefore, retain the KMEM_CACHE() form in this revert.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
