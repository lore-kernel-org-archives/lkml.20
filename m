Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413119;
	b=PUzDXtuVnWYb6hm+oi7tUecIwd8fj0bxwun9Mr76ePDVJXi3/kN7ImADzeBpqTH3uh4h
	 XzFFEZZgDjgYk0beohvrWaHd/fUt/VnY/br8+IHTPWGaGzufRdPijaQhp03w9Z45Rzp2s
	 h1dSl9vM3u+v3Rvh4oETmf55NH6KYQao3CMkRCMj8oJDzYGzY53vZizOj379xe1aK35Th
	 N3vJjUbmmoKZRv+Jjj9Zfh9uTsiG5bzzx4QozftnhkI9q4yoKAEj0OCKwRHXAvTJFs7Sj
	 S+GRwGSzZZz6FEa97juTwPz1AiOpXR8vucqu0/A4vZkLClDhKUyoBV3RfzdkslHGPMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413119;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vgUyxZr3jp6uPGx0b4XwC4Qf9E1Vwd28NNkJ7vQnXkM=;
	b=LQUtincPu8Dbbjkd3BoMB4uBT31APAiL52PY3PDgldLhCphCfBIno9PI2vgFnVdpDqxQ
	 sCRlTckpWEqhJGuxKbzkEEhSc3hPyphzGKQ+aRMXehRSs2NcT7VUAGQM+gIkLeZYdhIGJ
	 q1FPUASlLrXdUvR/UIy9A4l7ypSOXaJkTAcuWFcRFlBM4aj76kZ9KvZSoShd78G3EiQ1f
	 Qxzvw3AEk6CVAMfmElZAHbF1t5KDWGJnwxUtsqk8Fqji8a8T45B2E30xOgjNyM6Ac0b7K
	 YtJUir/q4g2xvYpNBLSdxptp+hJeJ3U7NlsN4LUg41hiEkFftrW2Tk8Q0wjRqljeRKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xrlwGNgk;
	arc=none smtp.remote-ip=95.215.58.200
Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47EE606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xrlwGNgk
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xD34cqqqS4yDJ5ebssDBJAARql9kbmOvm4FiIbCzonk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794413116; v=1; x=1795017916;
 b=xrlwGNgkto/lyvRjBXnRvIkPFKjNllzpesqAiNHXdjlTD61RsW44UJIxzyJtIAZ6l6Zvnqob
 j92IfW+4TtfFKENEpFL8669KjBrJ1Y/3zt4qYUx0DNoS1llEFl9gcNcMU6d4nFSSRan6zUOMF6c
 YRTf5PD+rU5w3qBe4Yt1uMZg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdc56c3804abbbc3;
	Wed, 11 Nov 2026 16:05:14 +0000
X-Mizu-Trace-ID: cdc56c3804abbbc3
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 08:05:08 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Runli <mingyu.he@shopee.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, littleswimmingwhale@gmail.com
Subject: Re: [PATCH v2] mm/bpf: Always flush memcg stats when explicitly
 requested
Message-ID: <avSR4bHP2HX5-OQo@linux.dev>
References: <20261111071434.34547-1-mingyu.he@shopee.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111071434.34547-1-mingyu.he@shopee.com>

On Wed, Nov 11, 2026 at 03:14:34PM +0800, Runli wrote:
> memcg_rstat_updated() stops walking the ancestors when a memcg exceeds
> the flush threshold. A concurrent flush can leave an ancestor below the
> threshold, so the early exit prevents it from receiving further updates.
> 
> Consider root and leaf on a 4-CPU system, with a threshold of 256.
> CPU 0 is flushing another CPU's stats after CPU 1's stats have already
> been flushed. The counts below are shared stats_updates counters:
> 
>   CPU 0 (root flush)                CPU 1 (leaf updates)
>   ------------------               --------------------
>   clear leaf->stats_updates
>                                    add 64 to leaf and root
>   clear root->stats_updates
>   finish flush
>                                    leaf = 64, root = 0
>                                    4 more batches of 64:
>                                      leaf = 320, root = 256
>                                    next update:
>                                      leaf > threshold
>                                      break; root is not updated
> 
> Root remains at the threshold, which is insufficient to trigger a flush,
> while further leaf updates keep taking the early exit. The periodic
> forced flush restores progress, but until then the root's aggregated
> statistics can fall far behind. For example, page cache grows at rate of
> 1 GiB/s, a two-second wait can leave the reported usage about 2 GiB below
> the actual usage.
> 
> Make bpf_mem_cgroup_flush_stats() bypass the update threshold so BPF
> callers can explicitly flush stale statistics without waiting for the
> periodic flush.
> 
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Link: https://lore.kernel.org/all/avKy9oMwDRjKjfzm@linux.dev/
> Signed-off-by: Runli <mingyu.he@shopee.com>
> ---
> Changes since v1:
> - Make the BPF kfunc flush unconditionally, as suggested by Shakeel.
> - Leave memcg_rstat_updated() unchanged.
> 
> v1: https://lore.kernel.org/all/20260911032905.63683-1-mingyu.he@shopee.com/
> 
>  mm/bpf_memcontrol.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
> index d8f579c28560..f8552651b6d6 100644
> --- a/mm/bpf_memcontrol.c
> +++ b/mm/bpf_memcontrol.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/memcontrol.h>
>  #include <linux/bpf.h>
> +#include <linux/cgroup.h>
>  
>  #include "internal.h"
>  
> @@ -154,11 +155,12 @@ __bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, in
>   * bpf_mem_cgroup_flush_stats - Flush memory cgroup's statistics
>   * @memcg: memory cgroup
>   *
> - * Propagate memory cgroup's statistics up the cgroup tree.
> + * Flush the memory cgroup subtree and propagate its statistics up the cgroup
> + * tree, regardless of the number of pending updates.
>   */
>  __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
>  {
> -	mem_cgroup_flush_stats(memcg);
> +	css_rstat_flush(&memcg->css);

Please expose mem_cgroup_flush_stats_force(memcg) which call
__mem_cgroup_flush_stats(memcg, true) or something like that. We have some
bookkeeping in __mem_cgroup_flush_stats() which we should not skip.

>  }
>  
>  /**
> -- 
> 2.39.2 (Apple Git-143)
> 
