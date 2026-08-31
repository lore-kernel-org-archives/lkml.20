Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A9B3C3F4D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166833; cv=none; b=YdiTrHhrX5rTIvqk6CkesDco4KahVQ+EtYJHMq9A2s8Bc7RzWPRq5wz9OxN/a8+dX2tzfHme5D6sXRbyvJVFnaX9AQI0Oc21AbXkq2unILWVAvr0RdNAN0BR4WSFaM5L7K8TllLXfq2EojGVElR8+OPSjMfUjy+AVAMRPl+mD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166833; c=relaxed/simple;
	bh=tXJJS1ZKb5uzVFOCA2iPcruVFPqHXLlMjFV8FS2vK6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsB4PA+NC2D+qVmIbWqHpVx5j423MTTpr2wGSR5pcqe/AsqBhEJ7oXouXSNxY1UdMptwqBTim9eV3T8kEKmdjla9BbhO+12u3iH1Ht2Rb/uQQZq431DWXLDlRClr115fSPTdGT/UcFJCKt2zDaZGUW/SAsKdLPW9p9/NACWvMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P82GTbEn; arc=none smtp.client-ip=91.218.175.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P82GTbEn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tXJJS1ZKb5uzVFOCA2iPcruVFPqHXLlMjFV8FS2vK6g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788166828; v=1; x=1788771628;
 b=P82GTbEnw4RYNlE7NDGjfb58cOUJfCUOYhfnkvPoNs5R8M7nK2MDqKPQFUNKbdvrw4iUyzcy
 nsD5jEVd8gIYHjtfvIFAFTozK1n0rVRihznOsqsDZWG0w0Ob4mNM3P1Tny0YSzGLAm5BTTrFtVU
 2Y54oDr2Sxx5K4y1GZb3T4Ko=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 521dab822fb867cd;
	Mon, 31 Aug 2026 09:00:27 +0000
X-Mizu-Trace-ID: 521dab822fb867cd
X-Migadu-Flow: FLOW_OUT
Message-ID: <8411e51c-92fe-41b0-9de0-e9cfc5a50301@linux.dev>
Date: Mon, 31 Aug 2026 17:00:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at 1
 GiB
Content-Language: en-US
To: Nimrod Oren <noren@nvidia.com>
Cc: "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20260831075635.2244437-1-noren@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260831075635.2244437-1-noren@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/31 15:56, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> pageblocks for every eligible populated zone before capping the result
> at 5% of low memory.
> 
> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> configurations, but scales poorly with larger base page sizes. With
> the default arm64 pageblock sizes, the contribution per eligible zone
> before the 5% cap is:
> 
>    4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>   16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>   64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
> 
> Consequently, min_free_kbytes can reach excessive and unwanted levels.
> 
> Add an absolute 1 GiB cap to the recommendation, in addition to the
> existing percentage cap. This bounds the automatic recommendation to a
> sane value on systems with large pageblocks while preserving existing
> behavior for typical systems with 2 MiB pageblocks.

Sorry, I haven't been following the previous discussion.

One nit: why 1 GiB? It feels a bit arbitrary to me ...
