Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516599;
	b=PrUWAykh20OwqBcaqUnyfT4R+5+N+SwvF1gvhVIxrkwyISuN97LjPQB34L98iHpPtyIp
	 O00MO+hSLAuwSt23uoF/8A3zgweY/vH/BqBJZWGb+6bPBuwJPShpanAQT++uUzMChycrq
	 OgmHZAhcn1SArE0YlHZFxYgVvqtz6iZcGYfwFFTWk25WxpYvNloKxhM1NtkOrd93JWEB2
	 eUZxZUKelU6HXyrmbPLwfbBVJbE8BLFIdxEJEUhLMLcVWF/qnKBlNJBScaNRgOhdywGFI
	 q8U4mIaBIjHsJvc9iosHu17JhecJQRRjGmHYDRQ6Wx/slPEGUyxIIuNyjr3GLGhQNNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516599;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nl7Y0ltmyhqsbFrqqW2pUAR4nkRi9ta+ZSmouMpNStM=;
	b=dJVXubk5TCcsZg7xQA4EoRtSNOjZCQk6VHi6QlEkWXu4y9j6Xy/AHhcuBbK8uyTkFCnP
	 fW2ECLbNJlhH926MuhxovxO7dulyuIFMRhaS60mRI3zRDlrSlrz14iKVTKe3j4k3+6VTd
	 rKxm0ll2IQxgYl7cmrc3TgB+qp/YaR7BeP+HMxQDYFC0rvg3D7SvF85YdSks8+JHzitDQ
	 o1oMevGts0/jGJppboNzL15i4pCGaJE2NSA4OS45o63kOhDcI0MYFXkqQRfpR3DieT2MU
	 k11q3Nn2/MBv2ty9tXBlKr5Hxyy6ElxJ6M4wcX71XRexyp8dTDCd7SoXtfLNty2XIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HmjRhNtF;
	arc=none smtp.remote-ip=91.218.175.219
Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3E606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE3E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HmjRhNtF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NgTxkg5an6zNGb4TVDESTT1yytc+uqZLeNaP03K8SIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793516593; v=1; x=1794121393;
 b=HmjRhNtFP9MTztqwBXEtL95Ec+JUIBP8UAMMaDh9y+UYyL9u4Pl9plQG65BKci3WldEU1R7e
 38MrqN3TYft4fUXWOhuEtvpaOe01NmvNWLXim9Q21guiaevNuUNrLQTwrnWOV8HuxzQ4QVTtRSp
 iYioR48rRW07brpc70Y4Qdc0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 221077d0a1b97b8f;
	Sun, 01 Nov 2026 07:03:13 +0000
X-Mizu-Trace-ID: 221077d0a1b97b8f
X-Migadu-Flow: FLOW_OUT
Message-ID: <c0201c6a-be33-4ebf-b190-f819d4605363@linux.dev>
Date: Sun, 1 Nov 2026 15:03:08 +0800
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
Subject: Re: [PATCH 07/12] mm: hugetlb_vmemmap: simplify shared tail page
 handling
To: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, James Houghton
 <jthoughton@google.com>, David Hildenbrand <david@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-6-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020115824.823278-6-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/26 7:58 PM, Muchun Song wrote:
> The remap walker currently carries a shared tail page selected by its
> caller, even though the optimize and restore callbacks can derive the
> same information from the folio being processed.  This adds redundant
> state to the walker and couples its interface to caller-side preparation.
> 
> Derive the shared mapping state in the callbacks instead, keeping the
> mapping policy with the PTE being processed and simplifying the remap
> interface.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   include/linux/vmemmap-optimization.h |  6 +-
>   mm/hugetlb_vmemmap.c                 | 89 ++++++++++++----------------
>   mm/mm_init.c                         |  6 +-
>   mm/sparse-vmemmap.c                  |  5 +-
>   4 files changed, 49 insertions(+), 57 deletions(-)
> 

LGTM, so:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

