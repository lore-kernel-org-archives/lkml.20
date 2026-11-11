Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391415;
	b=j+XvlpR78I52CJdnGuHAajt+uPvs0yq10wwPXRyWxsDPcwbVkvzbI7EvHPgWr/sHp8EK
	 WB+cYTH5l0WcR+lXj2/yq47Q9LfecbZq8zw7ZseJn6kJqhMDbCMpJYc9S+5osLqB9IRKy
	 Q+FpezBNoDG5SkqJXlOIQ99qtwBY6cTMyLHeKVdY3Aoraa5hV2zYO7yUJZfPCwggtSFjA
	 HgCbBMOqV8lpvFQyEzm0LUB9ovWhVz5tmFfAdZecL/VvrWrM07diB60Fntx62MYYNnhCX
	 OXfBUv4sNwLYMnm3AcFDQ0ZaZj4JIRSu2QgmcRxTJpGWjixV+pAfvwHh+7XOUhQgM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391415;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=H6lo86pYSzb5BtbzIVnUnrxk2gJltsJqttZeB9Ctflw=;
	b=K9aIspZhx4iASaVEsVBOqKzdAGh6GUOM4SXN2U+Ui0URvmcO4hx9eSmlScdmeBZMQujD
	 yNjdCfdUguDc+fsdVqSF06k27OTz8gPK3TYfyBiRGCjn5kKY9cy8llVAtuKDogZ7zPSWv
	 t3QjfIgLF6nYl9CfZUuv8Hl8I5glidbuhcEUKWo8gr1Ai7KifVgnJfhwLUgC8udn/O3iR
	 +HqEqZ4z5QXAaetrkap8dDOexDWPve8tfgW0w9bZ679NQDgiShcFKwwO3Tiw/bjnbkw8c
	 VzLbcb4EW3sZCl/K2FpKdpKLDh4IOmG+CjUHwmdKnEiJqsM6/FCwjh7PGIzPA0gLgmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oF1Ag0f1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB6606A883
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EB6606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oF1Ag0f1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7DA1576;
	Wed, 11 Nov 2026 02:03:31 -0800 (PST)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2FE23F632;
	Wed, 11 Nov 2026 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794391414; bh=xgPXw4TVtk3gJ4JE9MRR7ILT/67E3z8uzFF5ws5fn6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oF1Ag0f1eqWEfzCTa3ADEyKK5E3X4fQXc1vK2pHdix/9u4EZnmavw91tV/vq6MCdV
	 S7BLvwU5oheaA7MMQ4Pn69aS/i9hjyv8t+1CRqeptQXy5dRP0hHZOugqGH7FNGpyqT
	 fVQc0uAM6voKqTC0gPPs2ZIaAa/q/TOHU7+zG6l4=
Message-ID: <ec002297-730b-4223-b4e6-9c133eb643a5@arm.com>
Date: Wed, 11 Nov 2026 15:33:27 +0530
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
Subject: Re: [PATCH] tools/mm: add page_owner_filter to .gitignore
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zhen Ni
 <zhen.ni@easystack.cn>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
References: <20261110013651.107001-1-sj@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261110013651.107001-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi SJ!

On 11/10/26 7:06 AM, SJ Park wrote:
> Hello Sarthak,
> 
> 
> I found you forgot Cc-ing below people who are recommended by
> get_maintainer.pl.  I Cc-ed them.
> 
> - David Hildenbrand <david@kernel.org>
> - Lorenzo Stoakes <ljs@kernel.org>
> - "Liam R. Howlett" <liam@infradead.org>
> - Vlastimil Babka <vbabka@kernel.org>
> - Mike Rapoport <rppt@kernel.org>
> - Suren Baghdasaryan <surenb@google.com>
> - Michal Hocko <mhocko@suse.com>

Thank you! Looks like I was on an older checkout where tools/mm wasn't 
listed under MEMORY MANAGEMENT - MISC, so get_maintainer.pl gave me only 
Andrew's name and the lists :)

> 
> On Mon,  9 Nov 2026 16:31:39 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:
> 
>> Add the missing page_owner_filter to .gitignore in
>> tools/mm.
> 
> Makes sense to me.
> 
>>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 
> Reviewed-by: SJ Park <sj@kernel.org>

Thanks!

> 
> 
> Thanks,
> SJ
> 
> [...]

