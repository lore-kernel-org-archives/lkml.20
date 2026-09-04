Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097FF51E43F;
	Fri,  4 Sep 2026 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546961; cv=none; b=lo8X/e8SRG+8f2TAt+kvr/iUkXRYMaqwXkA4x6T6NYPnQa2SikF3Y4DdRe0PiPOb21iIIuy/Q2SJSQvz9YoUEVPkODhd2QL4UACaqitX1RPpJejALLmDFTSn1LDiNNLuSR5K4gXAbinflNzlOqL6daqwd6nXpEXjhf6fC2G28y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546961; c=relaxed/simple;
	bh=n936EpbmcusfU14UodCSYyAujaqKY+TYJiDTthYeU5Y=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SmylFCL97KqCu1JOYHnE6lNCyyASeO4T+JXOvCraofL9ZYtVJhIM1G8yDpXr8o+hn6atVEu+I6Otl9Z8WN3OqE1o2pmf0UfFp30OeaBJeXBTeuKxmcvZbKZB9RyaECRNdTRm4Ya89UfEGr5LeZt9jODscNo5EFH5/mo9jm8EC8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1EyUNV9W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1EyUNV9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B491F00A3D;
	Fri,  4 Sep 2026 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788546959;
	bh=I30u9zCE0YevZf3NSqMe25cL/Wy1MD4kJk0l05DMgMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1EyUNV9WPJh2tyFiCTV5U0EGxGioKPwqcD5jUVhZsOPQMXJWTFUIDYwx5Ws2jRUij
	 VRCe/9M/laHqPUygfQAb3XrdnaCFq0Nz6xpE2r8rEEbPhO4g3CD1ZTv31s4E++0c64
	 qz26iqznCNfvAk+W+K57XLCc9RT4LlGRTDUEQZYY=
Date: Fri, 4 Sep 2026 11:35:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Disha Goel
 <disgoel@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the origin
 tree
Message-Id: <20260904113558.b8e68cf4ada8ee538ffafd76@linux-foundation.org>
In-Reply-To: <apsJzO0mzuBJhH8l@sirena.co.uk>
References: <apsJzO0mzuBJhH8l@sirena.co.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Sep 2026 19:11:24 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   tools/testing/selftests/Makefile
> 
> between commit:
> 
>   4ff32f084c158 ("selftests/filesystems: fix missing and stale TARGETS entries")
> 
> from the origin tree and commit:

"origin tree"?  I assume mm.git's mm-nonmm-unstable was intended.

> 
>   5550456dad376 ("selftests/filesystems: Move file_stressor to dedicated subdirectory")
> 
> from the fs-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

OK, thanks.  I'll send "selftests/filesystems: fix missing and stale
TARGETS entries" over to Christian.
