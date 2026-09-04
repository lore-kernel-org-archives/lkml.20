Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7633A1A55;
	Fri,  4 Sep 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510315; cv=none; b=mfKrzbJEwqgvjkGy5IJkj722HSFbRYJ36wvA+PE5QxJuoIuHeURI1UQR+l3QpdEsNkRiKVupm4ioadFni4yfX2V8WaHWHFd2vQTcmMfOlGsuBP3uT49ekuBsRiptdNOoSeg+QilGTtHuTvjExCQ6XllJ6mobFfdDF6H37pICBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510315; c=relaxed/simple;
	bh=UDPnaDGN0cR9jdX2OcNPa6XVzzHVDqU566S0sdnx58c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMufw3d3qEfI855vWX23Tmj4k3riWteiixM/GsDbWoRHLf1sy8Ymjnc35jIC5WQaIdYBM+fu1RLbvT8kdzo0NFTHaR22uIiFiJBP8N5a4zdNUFdcgIBb3qzCV4LVbhHBd7JX0luMGzsCPkm3LhmSm9KEERxEoRRLrqYyIE+JwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYzhgz46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYzhgz46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F170B1F00A3D;
	Fri,  4 Sep 2026 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510312;
	bh=rccA36EyuXOhMqphuckpFvf8Da7GhE5PelXowHSaKKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jYzhgz46a22ezQusLxk9qVWzQI2UXXiD8DvEw/lOqkhOwdgrCWcO1PeVLXJQtj5a/
	 Mcfwj2o6LtGuledzus610SHt1SyAQvI86ZINLZpIhtF2VF74lauraRJIXGzwPMv6UG
	 H56+HTYNcZHd+wcjFFv+F2AxBzXaQTMeHKICum90zwAIpr+jAHb6T8t5lguaRQ9t97
	 apn1TZ22uiUV2x/KtlgbQ4IpEUbB0fxwq0HYxBD8jGWmMfM4D6uqX/5B5u3jLnn8na
	 gOZ9ym87/tUs5+GmYkYFRb9iaAs8vYA47cMEWF8pL8wyIKjDBho1F51y2u4HQvcge1
	 fe4Vbz8zJgbwg==
Message-ID: <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
Date: Fri, 4 Sep 2026 10:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
To: Zhen Ni <zhen.ni@easystack.cn>, Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
References: <20260903041819.1776630-1-zhen.ni@easystack.cn>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260903041819.1776630-1-zhen.ni@easystack.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 06:18, Zhen Ni wrote:
> This patch series adds process and memory cgroup filtering support to
> page_owner. Following the previous series that introduced print_mode and
> NUMA node filters:
>   https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
> 
> This series adds filtering capabilities to page_owner, allowing users to
> filter output by specific processes and memory cgroups. Users can now
> filter page_owner output by PID, TGID, COMM (with wildcard support), and
> memory cgroup path. This makes page_owner debugging more focused and
> efficient for tracking memory allocations in specific contexts.

I wonder about the usefulness of all the new filters. In my experience
page_owner is useful to find a kernel memory leak code, and for that the
stacktraces are most useful. Dealing with things like pid/tgid/comm/cgroups
sounds more like your aim is to profile and optimize particular userspace to
use less kernel memory? In that case, isn't it rather the area of memory
allocation profiling (or maybe tracing with bpf), not page_owner?

Moreover, tracing or bpf can already do such kind of filtering and AFAIK
ftrace filters for tracepoints are nice and generic, while this is adding a
bunch of custom parsing and filtering. So that makes me somewhat sceptical.

> Targeted filtering provides significant performance benefits on large memory
> servers by reducing both execution time and output size. By filtering at the
> kernel level before reading, only relevant page allocations are processed,
> dramatically reducing the amount of data that needs to be handled in userspace.
> 
> This series extends page_owner filtering capabilities with:
> - PID filtering
> - TGID filtering
> - COMM filtering with wildcard support
> - Cgroup (memcg) filtering for containerized environments
> 
> The series is organized as follows:
> 
> Patches 1-3: Add PID, TGID, and COMM filtering support to page_owner
>   - Support filtering by process ID
>   - Support filtering by thread group ID
>   - Support filtering by command name with wildcards
> 
> Patch 4: Refactor memcg handling to prepare for cgroup filter support
> Patch 5: Add memory cgroup filtering support
> 
> Patches 6-7: Update page_owner_filter tool with corresponding features
> 
> Patch 8: Update documentation
> 
> These filters are particularly useful for:
> - Debugging memory leaks in specific processes
> - Analyzing memory usage in containerized environments
> - Isolating allocations from specific services or applications
> 
