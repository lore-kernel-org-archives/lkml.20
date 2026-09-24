Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34544A92C9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280522; cv=none; b=dkN1G2apHgbV32oLbtxUvdqojdIa2iE2YZpjbsyMvd9Cp4kW2t3tdWsgSOEGXmNbwZkxNy7VsLyzblIff4kHfEzeUAtSAA/XugmIVoAkv6HSm7sLYqsuxvHe0NN/KJ63xvDhfI3LhEBARNw2kTRawWep84fQjxVpp6V85DmDAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280522; c=relaxed/simple;
	bh=VnpDTS14tLqQ4Jw3vNMwhP5cW5pyfsrnEwAGStbJ+II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f51jh6jEXRkzcjfG4qFayJdKQ4tTZSHazfQdEqTaOEMCWzjByhpQJZ3QFESlvy9ZEgy0MdMoZAvUF/lQcJbvjcmViOPkjum21ms1HwArFIKHn6PXQr05/DjHyIBlK3sqABdOyH92wkYodZ7y3OMPV/Jqq7+dYbSzxxflIdXm36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OguHXzKT; arc=none smtp.client-ip=95.215.58.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OguHXzKT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VnpDTS14tLqQ4Jw3vNMwhP5cW5pyfsrnEwAGStbJ+II=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790280517; v=1; x=1790885317;
 b=OguHXzKTGLoSvFuNcHoD5zZ1DCyfbaY8iG/oTKiOAfQ0LQbiY1G14Lp6UMa7qRWPULdijipY
 aJtBgBHyiBqFloVBd+XUpfGmscFzHZT+WpjITtt3gKjGd6X6oWh7MSxRNixhVokNdlWDW++nvQA
 GBiiFd+XnCxrYiNW4DcuKghE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ac9eebf04bba0dba;
	Thu, 24 Sep 2026 20:08:37 +0000
X-Mizu-Trace-ID: ac9eebf04bba0dba
X-Migadu-Flow: FLOW_OUT
Date: Thu, 24 Sep 2026 13:08:35 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, axelrasmussen@google.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	david@kernel.org, kasong@tencent.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, 
	qi.zheng@linux.dev, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	weixugc@google.com, yuanchu@google.com, hannes@cmpxchg.org, kernel-team@meta.com
Subject: Re: [PATCH] mm: remove the unused zone->unaccepted_cleanup
Message-ID: <arWDLhfBmd1UuUHD@linux.dev>
References: <20260924191103.3475117-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924191103.3475117-1-usama.arif@linux.dev>

On Thu, Sep 24, 2026 at 12:11:03PM -0700, Usama Arif wrote:
> Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
> memory handling") removed the zones_with_unaccepted_pages static key and
> the work that decremented it, but left the work_struct behind in struct
> zone. Nothing uses it anymore, so let's remove it.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
