Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B9E24336D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113541; cv=none; b=A0v1JNOs2KPl8qYrwf+gWIQxhqdzNH90IjhnXzvl7MYUVa2vmP0TScVQVBjlCDTJ/GSuNJdPz5S9bUWc9RGzl/L24HolinFKJ8eiGS2c6zTcBtu6u1sgnMua49HmRB79XLj3K8YhohYuLrfqSFTslSbOd3e7yDmsyiSSK6tRug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113541; c=relaxed/simple;
	bh=NxPk9aRtT/LaDfFpNvz28i/BOb4aylT5MfYUs/cLe/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHrFXMIteNchYmGqqOFgdBbh2Wh4Z7gsBnuAP9WGy99+58w1e1PI9dDGjKaVfR+o2nRJBty8t1JtJEvRkfoj5pY5BFHVjGPYaRn8v3CfFhvqBQRgJ9+Se1UEQ4jpVbBS9FNmbcHpKSUML5CHjZ40AIQ6uIO+fxXFOT3pn9FR3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vVA1DGE6; arc=none smtp.client-ip=91.218.175.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vVA1DGE6"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NxPk9aRtT/LaDfFpNvz28i/BOb4aylT5MfYUs/cLe/4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792113534; v=1; x=1792718334;
 b=vVA1DGE6z7zJ5BhKa/mNtq9e6uO0u0T6FlUBS+zUIpt2/TTAmboKzma9dFfPdAamb7Mktjpr
 YKmoVvC+aTzoCFFMmrpz+mc4m5FQjxXU1zGfnQWwQ/M84i5mDaY8k/jrzV3poPCDRlPSDwCg+sA
 q0+k+8Di+ZDpoC64SOAoYd0Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 307f89d17423c902;
	Fri, 16 Oct 2026 01:18:54 +0000
X-Mizu-Trace-ID: 307f89d17423c902
X-Migadu-Flow: FLOW_OUT
Message-ID: <d58ea78a-98b8-4d0c-946c-8632b64aa0a9@linux.dev>
Date: Fri, 16 Oct 2026 09:18:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Nhat Pham <nphamcs@gmail.com>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAKEwX=NE51ko2U0-TCd9+sAm8NKeGeT61HFXTnnU_q2Tn75rCQ@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAKEwX=NE51ko2U0-TCd9+sAm8NKeGeT61HFXTnnU_q2Tn75rCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Nhat


On 10/16/26 1:11 AM, Nhat Pham wrote:
> On Wed, Oct 14, 2026 at 2:08 AM Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
>> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>>
>> On our production hosts we saw swap cache only pages keep growing for days:
>> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB of
>> swap slots were held by folios that no process mapped any more, charged
> That's a really nasty situation.
>
>> to cgroups whose workloads had long exited. The only way to get them
>> back was swapoff, and with other services actively swapping on the
>> same host that is not an option.
> Is it not similar to cold file caches?


Not quite. A cold file cache can still be hit later. These folios
can't: no page table holds the swap entry any more, so nothing will
ever look them up again. They also hold swap slots, not just RAM, and
the allocator skips those slots until swap is half full.


> The recommendation for these kind of scenarios (for both file and
> anon) is to adopt a proactive reclaimer (in the same vein as senpai).
> That's what we do internally.


Proactive reclaim does free them, but it works around the leak rather
than fixing it. In our case they were charged to cgroups that had
already been removed, so there was no cgroup left to reclaim from, and
reclaiming from the parent pushed out live anon first



>> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> Code looks solid to me otherwise. Maybe include some numbers from your
> testing in the cover letter to verify that the swap cache usage drop.


Thanks, will do in next version.

