Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5E38330C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801956; cv=none; b=qmcHcGZjxAjnfVMUq0aYlG+EgTDgG22l1OyKvXBZWe4DJIO7bTIsf8nERMwCnpaCJBJMpFj3yp8gDdSx4ql+qfy7y1MfA8BWDods2t93zlA/V3RnKzPa47/QhtASsbKeVXUgLbXxD73ymF8vo+aX/FRuB012SxajP+bUIk6g5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801956; c=relaxed/simple;
	bh=ddVMFRsVGcKgsL7SkWDPczYJzCzKG8VUFkLJy6MMGUU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e5Dx16aGreFzzISLs5IyOxogj62DZHAYckuPLp6TyQHKIQ89tPhynqH4ledZmO4h/Exx9j1kycyFmKLST7rUGp0gh8d+o4djXvVowA9d5tD/Zk+BAtbOUlfJDgCYMvvMKMKHY43gae3rdO6FiIuiXwSIrJmXU+fRkUevZqJVcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2Q2eBr4f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2Q2eBr4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317DA1F00A3A;
	Thu, 27 Aug 2026 03:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787801955;
	bh=AXsP2YwUZlHzTTtZN5E9nJJQjf2x64DhwUQoXN0R/+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2Q2eBr4fQrLW0DYCTT7cshE8D6sM9epklZxbZJsNyxlYyEn2eF1Xx0ZkmoXf2yKvg
	 lJR20JEiX0WjMQZwS0azL1NoaaX/icyB10J99MzOjxQmXDwUrQcnxSQEwQO/u3euhL
	 7iZqmAkJAWcuuYDlyUrMX6C6TvsWSfTkRplTdEVM=
Date: Wed, 26 Aug 2026 20:39:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] alloc_tag: fix a leak and a deadlock around
 shutdown_mem_profiling()
Message-Id: <20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
In-Reply-To: <20260817062726.106511-1-hao.ge@linux.dev>
References: <20260817062726.106511-1-hao.ge@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 14:27:24 +0800 Hao Ge <hao.ge@linux.dev> wrote:

> Two fixes for issues reported by sashiko:
> 
>   1. percpu counter leak on modules loaded after profiling is disabled.
>   2. AB-BA deadlock between module load and /proc/allocinfo readers.
> 

Thanks.  AI review asked two questions.  One pertinent to your
alterations and one pertinent to Suren ;)

	https://sashiko.dev/#/patchset/20260817062726.106511-1-hao.ge@linux.dev

I'll queue the patchset for 7.3-rc1, with a note-to-self.
