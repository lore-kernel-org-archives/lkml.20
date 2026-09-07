Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252647126F;
	Mon,  7 Sep 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794512; cv=none; b=GZKANFpuykTszqysrFkmjz/YFkqKXbuWuR1OhR7YLOL4ahY4aR0BWvhdSB+FfmeiPnBoUMkGft51hCriFOsvQ49rliG8JdjteMMm3thw//NrGIDIjCmoE1bcWHZXlcQv+9FDoEKLkpX286JtuYhQPM4LdIwLo5RG9lMtXXCz/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794512; c=relaxed/simple;
	bh=gbkKpIew57EIPW7i4koNPoT1xxuDhPfRv78v7DQZwg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdFbjlq+vQNWGYO77xXp/BlB8MIhKvMrfoaj4BOwE2M8VFDzMCeyVav+9+dSoXRRzTRua0NIIcs2B4yvByvUpGS8ZUpmTV40VOROa9E0zhc4uT+dA6mzI8i0p76snpvzJi5kN8G5Kj29rbauEj52cvGqn+fo4zqWUn0aXoz82Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ogz4sWjT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogz4sWjT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212B91F00A3A;
	Mon,  7 Sep 2026 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788794510;
	bh=a+5RFC0Baa759aALArIRHXad42pi6d3/PpgEA3XTA2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ogz4sWjTJY5QbcKXGIExzvS5zIXOtlYSUNoeRn8Gs93j+EAHKuN84lMLMFlibCZgH
	 3kPwDtLwZFAH9heyTvxgLQ0aLlzeNS2IAIQLQs+vj1aq6tchv0Zb/TDF3oI2zdvdOp
	 TFuU3M4PuHIbaD5rqiRoU1ghaOz1/qSAYUUdbAOLCkfMrf64E+8gPhciMPX1r5uNVa
	 5MtfZPBfI6uhUbgig8EIvl53OwNiNwbHTWg5AOcatks4ZCei+zWkEvsUc0R7nF2Zej
	 VbC5JRUpGfPDpWhyIoHW5PTPkXU6wIIy+/CA5KBRCMFgR1kmBiRGygqD/RY9YUT4jd
	 UbbhET7ejLVCg==
Message-ID: <5d4c247c-b8ea-4d3f-b2b9-d442d372fd03@kernel.org>
Date: Mon, 7 Sep 2026 17:21:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Content-Language: en-US
To: "zhen.ni" <zhen.ni@easystack.cn>,
 Andrew Morton <akpm@linux-foundation.org>
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
 <a6ce8684-116b-42f2-a88c-154eb86bad59@kernel.org>
 <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSNWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBrZXJuZWwub3JnPsLBsAQTAQoAWhYhBKlA1DSZLC6OmRA9UCJPp+fM
 gqZkBQJqFFy6GxSAAAAAAAQADm1hbnUyLDIuNSsxLjEyLDIsMgIbAwUJGtCBUAULCQgHAwUV
 CgkICwUWAgMBAAIeBQIXgAAKCRAiT6fnzIKmZJIUEADFx/tREzUImHrEwVHeSvDFmA7tJysI
 UVrlvrM09E7GIuzphzv7jYmo8n3ANpCczLEVr4G0syYQdTigaZgv3+FQDIIzhKih1IHhu1Ei
 XHlywNWKnQxxQEUNi5Mwx43wQz5XVw9F1A7gtKBKNtfogO511hAbrzagrYajyQacEJ/+sfhZ
 9Da8ltHIXD8pcYaHUfQgEusCgmEd9+KrUwrTbckFKmYq5chuE6yJ4J0EmWknL096jIE6CnzF
 FRslQ3B1UKDjxVsm1ZHfir5NeWszLkTvGFsddFaWTgh8UycESG6VQzKXjjewXu2pG7YQYRpj
 QKm1W5X2TkwWkXRBZTmfmbhxIUMh3+zf5wQ463rSmDN/8v81tdqBtAW6rH/kzg1GvkaTHXn0
 507yEHFzBksk2viAuIxxr7km8+/KARYLIdGtx30EG8cKzAUZOK6WqxtNCsXUJNrVE8CWrCaD
 icoNu7Fs1c5hmPHdSTnU48ce67449DdnO4neLSNhRiGlMHJgfJUmgrxu/hcYeOZ3haWmEQ2w
 uW1Mh01OHi8QZHCEyAbABrPs9GUgccc/4eYXX9hIgxfSkYzn8f+8NuIFPWl/0uTvjgqU29FQ
 SbzOLxHq9439Ox40G5mS5eZXRGxITYR+6TXvRGI6P/264jvflnr/pDGUttaikU+0W+1uxgKH
 cmYbEc7ATQRbGTU1AQgAn0H6UrFiWcovkh6EXVcl+SeqyO6JHOPm+e9Wu0Vw+VIUvXZVUVVQ
 La1PQDUi6j00ChlcR66g9/V0sPIcSutacPKfdKYOBvzd4rlhL8rfrdEsQw5ApZxrA8kYZVMh
 FmBRKAa6wos25moTlMKpCWzTH84+WO5+ziCTsTUZASAToz3RdunTD+vQcHj0GqNTPAHK63sf
 bAB2I0BslZkXkY1RLb/YhuA6E7JyEd2pilZOrIuBGl/5q2qSakgnAVFWFBR/DO27JuAksYnq
 +aH8vI0xGvwn75KqSk4UzAkDzWSmO4ZHuahKtQgZNsMYV+PGayRBX9b9zbldzopoLBdqHc4n
 jQARAQABwsF8BBgBCgAmAhsMFiEEqUDUNJksLo6ZED1QIk+n58yCpmQFAmfIHFQFCRYU6J8A
 CgkQIk+n58yCpmS2PA//bqN1LfcotmArgElsa+0EGZSQlYgK48pm8WAeTXTngudP9IJ4SuKY
 HR5RNjHcBeqN+Me0zxRqYzRb8nGanHEkDyf4Im8DQM8d6vbyU+FcPmG4skud4kgS1zMHnlVd
 SXfSIwKC/hKgdHG8aBV7545Lz9X6Iohea+94wneD0aw/hqF+QWewGZhWJriWAZtvEkzNjQOi
 4U9F/trLten/x7bpphDSnDMKJtITbtzATT1Dq7o7VpIUK1nCTQALMuMjKCdi8OdU/+V+R3O4
 0PXWvX8qrvqYapVbZ+9KqT74FsuB0Ya9uXwgBF2Q6cRuETZk5vqaqKxzqoQZCO8AOz/58j6O
 2RHNy/mZEN+7tJ5Tsq42zVJ4jxsT8b9YplavCMsnBgDeRWhcbYhCyttoL7nYISyWg4kQYZ/P
 wIV3OuNv2f8iKYsxNsRuClOAF82+gvqOy1/1pprFjy8uo2pkoOrb63aOP3vO5VHnRKgra6dq
 NcaZ+c6J4H+nEJGi2SkHAUJz5oBzuThvPudLvPA/SK8sKoM01IRxSihev/S/5WLazXB1PGem
 OCbvzC1IjWJJraxiDJ5IygokapUa2RP7+WBR22skQ3SSl6G107QgWKSyTOGWEaRmV53vxQLV
 jXuCmzSSasTL60zq5yGrT4/DYQVSNEUiUbG4pYekxJujNeEDkUlky0Y=
In-Reply-To: <a98bde94-d1fb-4246-b7c6-e64303d8388a@easystack.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/7/26 06:08, zhen.ni wrote:
> 
> 
> 在 2026/9/4 16:25, Vlastimil Babka (SUSE) 写道:
>> On 9/3/26 06:18, Zhen Ni wrote:
>>> This patch series adds process and memory cgroup filtering support to
>>> page_owner. Following the previous series that introduced print_mode and
>>> NUMA node filters:
>>>    https://lore.kernel.org/linux-mm/20260707115411.1714314-1-zhen.ni@easystack.cn/
>>>
>>> This series adds filtering capabilities to page_owner, allowing users to
>>> filter output by specific processes and memory cgroups. Users can now
>>> filter page_owner output by PID, TGID, COMM (with wildcard support), and
>>> memory cgroup path. This makes page_owner debugging more focused and
>>> efficient for tracking memory allocations in specific contexts.
>> 
>> I wonder about the usefulness of all the new filters. In my experience
>> page_owner is useful to find a kernel memory leak code, and for that the
>> stacktraces are most useful. Dealing with things like pid/tgid/comm/cgroups
>> sounds more like your aim is to profile and optimize particular userspace to
>> use less kernel memory? In that case, isn't it rather the area of memory
>> allocation profiling (or maybe tracing with bpf), not page_owner?
>> 
>> Moreover, tracing or bpf can already do such kind of filtering and AFAIK
>> ftrace filters for tracepoints are nice and generic, while this is adding a
>> bunch of custom parsing and filtering. So that makes me somewhat sceptical.
>> 
> 
> Thanks for the review, and the scepticism is fair - let me first
> clarify where I agree with you, then explain the niche I think these
> filters fill.

Sorry but your whole reply reads like a LLM slop. It took a lot of mental
effor to actually try and engage with it.

> In memory usage source analysis and memory leak analysis, I believe
> page_owner has its own unique niche:
> 
> 1. Nearly all historical allocation records are queryable. Dynamic
>     tracing tools (bpf, ftrace) cannot do this.

This seems totally the opposite. page_owner gives you the current allocation
snapshot. Tracing can provide the full historical record of allocation and
freeing, which can be also postprocessed for snapshots.

> 2. The full allocation stack is recorded via stackdepot. Memory
>     allocation profiling as a code-tagging technique cannot do this.

I think there's some extension (or plan for it), Suren would know better.

> 3. Zero extra usage cost (works as long as page_owner is enabled) and
>     a low barrier to entry (one echo line versus writing a bpf
>     program).
> 
> On the pain points that motivated the series. On production machines
> with large memory configurations (e.g., 250GB+):
> 
> 1. Collecting page_owner information takes minutes to tens of minutes.
> 2. The output is several gigabytes to over 10GB.
> 
> That makes the raw output nearly unreadable and forces post-processing
> with tools/mm/page_owner_sort.c, adding further workload. The root
> causes are:

the "workload" is just cpu time though

> 1. The PFN scan itself - unavoidable, it is the price of page_owner's
>     core function of covering every page.
> 2. Printing every stack for every page - this dominates the cost and
>     is avoidable. stackdepot already deduplicates stacks and keeps a
>     refcount per unique stack; page_owner then re-prints the same stack
>     once per page, and page_owner_sort deduplicates it all over again
>     in userspace.

Since it's avoidable, why mention it at all? Oh I know, LLM slop.

> The filters target exactly this waste: they keep page_owner focused on
> the user's area of interest instead of paying the full print cost.
> 
> On the overlap with dynamic tracing and allocation profiling: the
> features do look similar, but the usage scenarios differ. page_owner
> is not enabled by default on production systems, so most developers
> rightly reach for the lighter-weight tools first - dynamic tracing or
> allocation profiling.

Good! That's an argument against.

> But when page_owner is already enabled, or the
> lighter-weight tools cannot solve (or cannot conveniently solve) the

Adding custom filtering code to kernel vs user convenience is a trade-off.

> problem and enabling page_owner is an option, the advantages above
> kick in: the historical snapshot is filterable in place, and the
> filtered output is small enough to read directly.
> 
> So I see the filters as completing page_owner for the scenarios where
> it is the right tool, rather than competing with the profiling and
> tracing tooling.

I'm not convinced it's worth it.

>>> Targeted filtering provides significant performance benefits on large memory
>>> servers by reducing both execution time and output size. By filtering at the
>>> kernel level before reading, only relevant page allocations are processed,
>>> dramatically reducing the amount of data that needs to be handled in userspace.
>>>
> 
> Thanks,
> Zhen Ni

