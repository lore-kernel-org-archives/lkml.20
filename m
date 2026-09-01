Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21A336195B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222920; cv=none; b=aMX69K3ELhAoe1gXxgeqwhJOLE4s3PIt8HtXYzX3McqMRpB8+RFz8+gB1PA26YGuTQt307ojvteN9j0VCBep8dTVm/yogeZmnwqYmQKAxqhMHL8MGZlM3CERKTyrbXJjdGu7v4lH/Ua50wxYcLeHxmTjkxrHf56Tt0OYzZb5rPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222920; c=relaxed/simple;
	bh=QGjmouhU85A24VIlDfCn+dqw2VA5ylqcokJVz4lhMSM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GxPRz4E/WvWl4L8DPclFN4EdtiA4/NQttwA8osvUKzR4xLPcdxRwDUAcj7PpdTCSTBRvtFecUlIfH6+Rr8vGYHUuW9xvDsOFdjgNxsTGZbMrPVntrnCVmviP+onu0gtMV4JswJHtsF1psB3W/8D9UsnztYL/dr8MOVutXGHINOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tEEnlXgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tEEnlXgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E367C1F000E9;
	Tue,  1 Sep 2026 00:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788222914;
	bh=TtgnC0qQbwgwZqX+/7An9hPq7Lj/TxBIjcu6YHD7uns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tEEnlXgtDQRrrkftouMH2JPPiUrbmkYxLIp2aqFb6fCxflQywXO2RqerlU5uKj9EI
	 Miwux2yRLUWC69s+9tPG8Gh3scHiXuoc+gp5ZTejr+N8lbCdZzfSWZ63s8yaLCu8t4
	 KSWX0p7SRQyLe4Dj7izBfdjC5ZHQx2CCa31Ts5rc=
Date: Mon, 31 Aug 2026 17:35:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com,
 vivek.kasireddy@intel.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] mm/memfd: don't unreserve hugetlb pages on -EEXIST in
 error path
Message-Id: <20260831173513.41184f1d27cd83f2c8f9b935@linux-foundation.org>
In-Reply-To: <20260831090631.29227-1-hongfu.li@linux.dev>
References: <20260831090631.29227-1-hongfu.li@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 17:06:31 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> If hugetlb_add_to_page_cache() fails with -EEXIST, a concurrent fault has
> already instantiated the folio in the page cache, and the reservation now
> belongs to that folio. Calling hugetlb_unreserve_pages() in that case
> incorrectly removes the region backing the cached folio, and a later
> truncate or inode eviction passes a negative (chg - freed) into
> hugepage_subpool_put_pages(), corrupting subpool and resv_huge_pages
> accounting.
> 
> Skip the unreserve on -EEXIST; failures other than -EEXIST leave the
> reservation unconsumed and still unreserve it.

Thanks.

AI review might have found another bug and it suggests that your
proposal only partially fixes this bug:

	https://sashiko.dev/#/patchset/20260831090631.29227-1-hongfu.li@linux.dev

