Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD0477E4B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639539; cv=none; b=iaIWZykyF/c9YaC0XPskrJ72FgmxWFM3IeKdgCssIT+gMfD7YosHTvFsBfyn4C9AwowXF0iOOdivM7vPPsrdJmwA0P0NuAB6S7xmn2fMtNXE22LQdp7tu96GiZmhFtpFoyRdfhNjN0wM030kdadbZBLWMtbz6QU83PggrRaek4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639539; c=relaxed/simple;
	bh=/tZHzVllun6wYA77y8xQTAiwknDz8pgNlCRFsI3jAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzBRZaE1OKqQqT5Lm9Vt+6N7lp7HalXujoh/4yEWxX7h04jXt/b1F+HpdAO8SrS1awX8YSsibFTJLqfKW8DA0P/RIscpk32ENsCcpHt8mNiQvcGst8r08jIXoYPkjNFbjHcPnz8u0YOUs6DGKxOz2fvB7BAKo+47yyaKogmpf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YFqVzS95; arc=none smtp.client-ip=91.218.175.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YFqVzS95"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/tZHzVllun6wYA77y8xQTAiwknDz8pgNlCRFsI3jAaQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789639532; v=1; x=1790244332;
 b=YFqVzS95tIUZvKGur1qzM7qmgLoKfQrIwtXyQlgsXsTWGpvgxTYkIPLHzxu76FY+NAAaERQ5
 VNvYSIpfdlkCet+3+fnNRLfudlTahYkfFGH2rTpCaYV7T3yRzvxMId9VRC3/F3OcNEETw5AM5Zn
 iQ1KJXQrwQyPacXEXD7P4Ng0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5049fdc33711d8e9;
	Thu, 17 Sep 2026 10:05:06 +0000
X-Mizu-Trace-ID: 5049fdc33711d8e9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 17 Sep 2026 18:04:57 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, baohua@kernel.org, youngjun.park@lge.com,
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev, david@kernel.org,
	linux-kernel@vger.kernel.org, Baoquan He <hebaoquan@kylinos.cn>,
	kunwu.chan@gmail.com
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
Message-ID: <aqu7Sep9nHUS2DmR@fedora>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>

On 09/16/26 at 06:19pm, Baoquan He wrote:

For Sashiko complaints: 

============================================================                                            
Subject: Re: [PATCH v3 01/14] mm: xswap support for zswap                                               
                                                                                                        
│ xswap entries are added to the zswap writeback LRU but                                                
│ zswap_writeback_entry() rejects them with -EINVAL, so shrink_memcg_cb()                               
│ retries and zswap_reject_reclaim_fail keeps climbing.                                                 

Right. An xswap entry has no backing store, so it should not be a
writeback candidate. v4 no longer adds it to the zswap writeback LRU;
zswap_lru_del() tolerates that (__list_lru_del() checks list_empty()
first, and entry->lru is initialized before free). The shrinker then
neither scans nor counts these entries. 

│ swap_vma_readahead() does not skip xswap, unlike swap_cluster_readahead().
                                                                                                        
Right, I only added the check to the cluster path. v4 adds the same                                    
SWP_XSWAP check to swap_vma_readahead().                                                                
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 04/14] mm, swap: add xswap cluster grow via VM_SPARSE vmalloc                    
                                                                                                        
│ Returning -EBUSY from vm_area_map_pages() skips vm_area_unmap_pages(),                                
│ then the pages are freed while their PTEs are still populated.                                        
                                                                                                        
This path is unreachable. vmap_pages_pte_range() does return -EBUSY, but                               
vmap_pages_pmd_range() and vmap_pages_pud_range() normalize the return to                               
-ENOMEM, so vm_area_map_pages() never returns -EBUSY. A collision takes                                
the -ENOMEM path, which calls vm_area_unmap_pages() before freeing the                                  
pages, so no freed page is left mapped.                                                                 
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 05/14] mm, swap: add sysfs create interface for xswap                            
                                                                                                        
│ maxpages smaller than SWAPFILE_CLUSTER skips the rounddown(), leaving                                 
│ si->max unaligned.                                                                                    
                                                                                                        
That needs 2 * RAM < SWAPFILE_CLUSTER, i.e. RAM below about 1MB. Not                                   
reachable in practice.                                                                                  
                                                                                                        
│ sysfs_create_group() failure leaks xswap_kobj.                                                        
                                                                                                        
Fixed in v4: kobject_put(xswap_kobj) and clear the pointer on that path.                                
                                                                                                        
│ pr_info() after enable_swap_info() races with swapoff reading si.                                     
                                                                                                        
Fixed in v4: the message is printed while swapon_mutex is still held.                                   
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 06/14] mm, swap: add xswap grow trigger on cluster allocation                    
                                                                                                        
│ free_clusters can be populated concurrently after the scans, so the grow                              
│ block is skipped and the allocation fails.                                                            
│ -EAGAIN from xswap_map_clusters() (another grower won) is not retried.                                
                                                                                                        
Fixed in v4: retry alloc_swap_scan_list(free_clusters) once after the grow                              
attempt, which covers both cases.                                                                       
                                                                                                        
│ backing pages are leaked on swapoff.                                                                  
                                                                                                        
That is fixed by the patch that follows ("mm, swap: free backing pages in                               
xswap_unmap_clusters"); patch 06 has no unmap path yet.                                                 
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 08/14] mm, swap: free backing pages in xswap_unmap_clusters                      
                                                                                                        
│ The teardown callers retry the unmap in an unbounded while loop.                                      
│ kmalloc_array() under memalloc_noreclaim_save() is a high-order,                                      
│ non-reclaimable allocation that can fail under fragmentation.                                         
                                                                                                        
Both fixed in v4. The array is now allocated with kvmalloc_array() and                                
GFP_KERNEL. It can fall back to vmalloc and it can reclaim, and the                                   
unmap always runs in process context, so this is fine. If it still                                    
fails, we unmap in small batches using a stack array. So teardown                                     
always makes progress, and no page is lost. The function cannot fail                                  
now, so we removed the while() loops and the shrink rollback. The                                     
counters are unsigned long now, and an overflow gives a warning.
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 10/14] mm, swap: refactor swapoff and add xswap_destroy                          
                                                                                                        
│ sysfs_create_group() failure leaks xswap_kobj.                                                        
                                                                                                        
Same as patch 05; fixed in v4 in xswap_sysfs_init().                                                    
                                                                                                        
│ sys_swapoff() mixes goto-based cleanup with scope-based cleanup.                                      
                                                                                                        
This is pre-existing upstream style in sys_swapoff(): CLASS(filename,                                   
pathname) and out_dput/filp_close(victim) are already there before this                                 
series; the patch only moved them while extracting __swapoff(). Both
pathname and victim are released on every path.  I left it unchanged to                                 
avoid unrelated churn, and there is no standard CLASS for a struct file *                               
from file_open_name() anyway.                                                                           
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 11/14] mm, swap: require zswap for xswap devices                                 
                                                                                                        
│ The fix only checks zswap at create time; runtime disabling of zswap and                              
│ runtime zswap_store() failures are not handled.                                                       

Yes, this is a known issue. The create-time check cannot cover (a) zswap                              
being disabled after creation, or (b) zswap_store() failing at runtime                                
(pool full, allocation failure). In both cases swap_writeout() cannot                                 
write the folio out, so it stays in the swap cache until it is faulted                                
back in.                                                                                              
                                                                                                      
So this is a temporary state. The writeback series on top adds the                                    
fallback (write to disk when zswap refuses an xswap page), and then this                              
case becomes the normal swap IO error path that every swap device has.
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 13/14] mm, swap: add sysfs per-device size limit for xswap                       
                                                                                                        
│ del_from_avail_list()/add_to_avail_list() use try_cmpxchg() without a                                 
│ retry loop.                                                                                           
                                                                                                        
That is the pre-existing pattern in these functions (they already used                                  
atomic_long_try_cmpxchg() and skipped on failure before this series); this                              
patch does not change it.                                                                               
                                                                                                        
│ DIV_ROUND_UP(val, SWAPFILE_CLUSTER) overflows for a huge val.                                         
                                                                                                        
Fixed in v4: clamp against (unsigned long)nr_clusters_max * SWAPFILE_CLUSTER                            
before dividing.                                                                                        
                                                                                                        
│ a limit write that makes the device full leaves it on swap_avail_head.                                
                                                                                                        
Fixed in v4: after updating si->pages, call del_from_avail_list() when the                              
device is full, add_to_avail_list() otherwise.                                                          
                                                                                                        
============================================================                                            
Subject: Re: [PATCH v3 14/14] mm, swap: shrink xswap to the ceiling when it drops                       
                                                                                                        
│ the hardcoded excess can include an in-use cluster, and the whole shrink                              
│ aborts.                                                                                               
                                                                                                        
The limit write clamps the new ceiling up to the clusters covering the                                  
pages in use, so [ceiling, mapped) is free and the validation loop passes.                              
The only remaining window is an allocation racing the shrink, which just                                
defers the shrink to the next trigger.                                                                  
                                                                                                        
============================================================ 
