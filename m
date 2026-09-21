Received: from mta0.migadu.com (out-236.mta0.migadu.com [91.218.175.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A7565192
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980343; cv=none; b=UOfgSX9cb0pHgDdLD5cxRmcm6DKibUt9eYQRRhmQe/Qkik3LbQCGzCjLEdY5d9MImG+S2No0SsRMqok8/xqRw5syok9bnG4a0Avjn20B89PI2wdFCSVOCeGU2G2kYBmSAjGwWxB3qicS/AWScJxDICuWplmIAGwyq3NlJzgwJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980343; c=relaxed/simple;
	bh=uUTNbuu97K8eZK4ytwE6k6w7euavFhJ9/KPf1WBW8ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lh6K3tJ3Ue6hqFcLE20pgqrjA74tVUprxNuFnrah6l+CRPV49whFdlLltrh4DZLSASOoPN6oebRe05T221SRxD94Vi58juHCyq/QvmRM5cAApLdlNNEpT9fzuZ/HG/Lh62B+33ErcNxXRCSkznJg0NWKPfFWsPaA5X4IDpG+P2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iGHXoEwE; arc=none smtp.client-ip=91.218.175.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iGHXoEwE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uUTNbuu97K8eZK4ytwE6k6w7euavFhJ9/KPf1WBW8ww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789980339; v=1; x=1790585139;
 b=iGHXoEwE+22ygJgFiLiciosWND8QzLgqOeqsNQDB6g8SvUOCk36mcvAEwHIUFD95jgQUe6lC
 sUu/5aGTdaE6hBCSvAQrK+mNZY6g9FG62Iw0K4DcqTwnK9mm9f+BBur16NA3u6yS04lAstApNjw
 4x0Ry7stp6DjpJZxrZ5otflE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6597ae8b033e4958;
	Mon, 21 Sep 2026 08:45:22 +0000
X-Mizu-Trace-ID: 6597ae8b033e4958
X-Migadu-Flow: FLOW_OUT
Message-ID: <37d369cc-dac6-43e7-83a8-a5ecdab0d1f3@linux.dev>
Date: Mon, 21 Sep 2026 16:45:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/17] erofs: use folio_attach/detach_private() instead
 of direct assignment
Content-Language: en-US
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Dev Jain
 <dev.jain@arm.com>, Ying Huang <ying.huang@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Barry Song <baohua@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sandeep Dhavale <dhavale@google.com>,
 Michal Hocko <mhocko@suse.com>, Gregory Price <gourry@gourry.net>,
 Hongbo Li <hongbohbli@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Kairui Song <kasong@tencent.com>, Chunhai Guo <guochunhai@vivo.com>,
 linux-erofs@lists.ozlabs.org, Qi Zheng <qi.zheng@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Muchun Song <muchun.song@linux.dev>
References: <20260920-remove-pg_private-v5-0-bb68b6a21869@nvidia.com>
 <20260920-remove-pg_private-v5-9-bb68b6a21869@nvidia.com>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260920-remove-pg_private-v5-9-bb68b6a21869@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 10:28, Zi Yan wrote:
> erofs_onlinefolio_init/split/end() use folio->private without setting
> PG_private or increasing folio refcount and it works. But after PG_private
> is replaced by checking folio->private in a future commit, it can break
> folio_expected_ref_count(), since the folio has private data without
> elevated refcount. Change them to use folio_attach/detach_private().
> Folios during this process are locked as they are in the process of
> readahead, so no parallel migration/folio split can happen.
> 
> Furthermore, because folio->private is used to store in-flight I/O counter
> and the counter reaches 0 when all I/O completes successfully without error
> or being dirty, ->private=0 causes folio_detach_private() to not drop the
> elevated folio refcount. Solve this issue by using bias=1 for the counter,
> so that ->private stays non NULL throughout every attach-to-detach process.
> Add a macro EROFS_ONLINEFOLIO_BIAS=1. While at it, fix the comment about
> ->private bit layout and add EROFS_ONLINEFOLIO_COUNT_MASK.
> 
> It prepares for a future commit that removes PG_private.
> 
> Assisted-by: LLM
> To: Gao Xiang <xiang@kernel.org>
> To: Chao Yu <chao@kernel.org>
> Cc: Yue Hu <zbestahu@gmail.com>
> Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
> Cc: Sandeep Dhavale <dhavale@google.com>
> Cc: Hongbo Li <hongbohbli@tencent.com>
> Cc: Chunhai Guo <guochunhai@vivo.com>
> Cc: linux-erofs@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Gao Xiang <xiang@kernel.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

LGTM! Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
