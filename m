Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719378;
	b=j8MesXVOBJNFfxe3J4EhR+anfYd81pPK/BVfpsqYqfeCumB/M0qZilwCbt1ANENuwZR3
	 0Mejs9nGQ6gjnrq5WRSOqIuiFyOdDpReZ8JDLvm1VbSGeiHsIbyTk8lY1iaVeJ6rbpGLV
	 6x4u1SZvt1Rz/Jz98FljJKS5YuDmL//z8HaOOa0UCqV1jXfTy3FIY7TeOloTs1ATGew+O
	 W6V2ZklACTl5f0RDYiUAoPLgK9X7xM2FvYbx2C68VW2J+YO24rpG/W8z2cjJRpKy4hVGG
	 b3hU7d8xM+DtyGebkFSn+DX0aCITsXYUMB3nqmoPuJ8qKvmMRDP+QRu65kblzJmvd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719378;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PY0NJAPke28sO3SvXiUYBiEZjRXhf6oHVUh0MyPbglg=;
	b=RNbg6XXlPK05JzOeJpcijTPePAj+v/C5UfnW64EY2taUeUjGfCmAPz/8LmFmi4KLNto3
	 WSYyAljagFrG22gIEUxVBAjtpmQii//CObzJxWbVmxSYKnvGxZcCRi0UzjvlMW0eUMGQl
	 I7rxhPe0G7lywrtFrYw2EO66tQLvQPI14VNpz9BUFJBiKeJPR49QWAoBdpzMGillAYITY
	 u6IZcrerfnD1oj7YpFtxWS1JEV8FtpD2g2jbxmnNCFujzAjrinwGDkUR/X4Az47RxUAnR
	 RagSJmdAg9gSfB9FK8F6B8XUzC+wvlUQ1Glhbk/gfThSHsDmtkzwnwrepPuGb5aUWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nBwAcoea;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25654606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25654606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nBwAcoea
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792719368; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=PY0NJAPke28sO3SvXiUYBiEZjRXhf6oHVUh0MyPbglg=;
	b=nBwAcoeaI0Bqnxqgex/IIFjGDHG35WOiWhQ8hX2ckH6WhvBhtq0iXqgosLNmcUiuDrNdUuAEdVuIu/r+SVXgmGEF2ML31Nfpn+xcD+aM/sQmM+aWhjIG0RIbLUer8MwZivOS6aCyGVYm8DgxfUMOq0do3FL9gdYIvuA9mzRGqBw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XDKY5aF_1792719366;
Received: from 30.74.144.154(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDKY5aF_1792719366 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 23 Oct 2026 09:36:06 +0800
Message-ID: <4e647816-0b8b-4a75-8777-8580a574d752@linux.alibaba.com>
Date: Fri, 23 Oct 2026 09:36:05 +0800
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
Subject: Re: [RFC PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache in MGLRU
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com,
 baoquan.he@linux.dev, david@kernel.org, hannes@cmpxchg.org,
 kasong@tencent.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 liuxiang.277@bytedance.com, ljs@kernel.org, mhocko@kernel.org,
 qi.zheng@linux.dev, shakeel.butt@linux.dev, weixugc@google.com,
 yuanchu@google.com, zhangbo56@xiaomi.com
References: <0cbd219d-f69d-4f72-aec5-43e1f2d978de@linux.alibaba.com>
 <20261022102726.56682-1-baohua@kernel.org>
 <fc302ca3-6bf6-4bde-b3e8-8d2e93a4e4ac@linux.alibaba.com>
 <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4z9GZkpV+mpoGogma4oSX4cHy+2UDzyUQSjjOLOfekEPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/23/26 5:19 AM, Barry Song wrote:
> On Thu, Oct 22, 2026 at 7:26 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> [...]
> 
>>>>                    }
>>>>
>>>>                    if (should_run_aging(lruvec, max_seq, sc, swappiness)) {
>>>> -                       if (try_to_inc_max_seq(lruvec, max_seq,
>>>> swappiness, false))
>>>
>>> This is quite tricky. If we pass swappiness=0, anon aging will be
>>> skipped. Do we want that for GFP_NOIO cases? I mean, these are not
>>> real cases where anon aging should be disabled.
>>
>> No, we have real use cases where 'vm_swappiness' is set to 0, which
>> means the workload never reclaims anon folios. So in this case we don't
>> need to age anon folios.
> 
> My concern is that setting swappiness to 0 for GFP_NOIO also skips
> anon aging, making it behave the same as a real swappiness=0.

It will not. We will force anon aging for GFP_NOIO case.

> However, GFP_NOIO is only a temporary state, and subsequent
> allocations may not use GFP_NOIO.
