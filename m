Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451E3D8128
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701263; cv=none; b=NAjax+vbEld6mTxTBfbE+0tawGK4OjWlzhH80PhBT1cHLnR7rtJboXXNLm1cqcpnrFV2FN+7m1abo5LD2xK8kIoIqz4B5urhqFh7TrKLjkNg7UANIqb74rAmIWW5CDewO+tie68Rvi7Cql3lNOsxbgqVSMjPnxPt1o3ECcxRQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701263; c=relaxed/simple;
	bh=lbhGi4o2SC0IANPATUSt6s9fXNLBC+atgB/IchScY9c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Zt1i2hpDS3ESen162rtVakdN88E3lfwsS8PJ5zHKGRTzoyKnkMQF4FJj6E/VADpqr+xCpAphBgkMpLMcYtAZw4N2CyaKKQRQe+r33amMTDlc1tk1mL5FkD6eFG9J6eeIAqInnoZiMTHcoEAiqD0RxmsLBLcv5uTbFJkBzlUJMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qfn8QFMN; arc=none smtp.client-ip=91.218.175.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qfn8QFMN"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lbhGi4o2SC0IANPATUSt6s9fXNLBC+atgB/IchScY9c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789701252; v=1; x=1790306052;
 b=Qfn8QFMNW6NkCtAk4yoEKcVWALgKpPrWGz4Ttx/ojhq+jBDz3f3mw7hPIJp8qCq6qSmlTeQO
 kOoln+tHJOi2TcJboRPJsqtPBSIFsxkF08QzVQyX4RfoK7Y0M7sKWiQ7u02W7C7lc526MzBILtZ
 kOtosbBRcJVj60uq68+rFZN0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e6758c9efe7eb6d1;
	Fri, 18 Sep 2026 03:14:12 +0000
X-Mizu-Trace-ID: e6758c9efe7eb6d1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v2 1/2] mm/hugetlb_cgroup: move per-node usage on cross
 node migration
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260918-for-hugetlb-charge-v2-1-2b6d8c2bdc36@kylinos.cn>
Date: Fri, 18 Sep 2026 11:13:57 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <kees@kernel.org>,
 Colin Ian King <colin.i.king@gmail.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Mina Almasry <almasrymina@google.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6BC6926A-38D3-47B3-A676-D89DFF8E212A@linux.dev>
References: <20260918-for-hugetlb-charge-v2-0-2b6d8c2bdc36@kylinos.cn>
 <20260918-for-hugetlb-charge-v2-1-2b6d8c2bdc36@kylinos.cn>
To: Hongfu Li <hongfu.li@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 18, 2026, at 10:56, Hongfu Li <hongfu.li@linux.dev> wrote:
> 
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> hugetlb.<size>.numa_stat uses folio_nid() to account usage in
> __hugetlb_cgroup_commit_charge() and __hugetlb_cgroup_uncharge_folio().
> hugetlb_cgroup_migrate() only moves hugetlb_cgroup pointers, leaving
> per-node usage behind on the source node during cross-node migration.
> 
> When the migrated folio gets uncharged, we subtract usage from the
> destination node counter. This creates stale usage on the source node
> and unsigned long counter underflow on the destination node.
> The hugetlb.<size>.numa_stat interface exposes these incorrect per-node
> usage values to userspace.
> 
> Add a hugetlb_cgroup_move_usage() helper which moves the usage from the
> old node to the new node, and call it from hugetlb_cgroup_migrate().
> 
> Fixes: f47761999052 ("hugetlb: add hugetlb.*.numa_stat file")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

