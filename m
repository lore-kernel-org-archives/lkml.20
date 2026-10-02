Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881B468C06
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790983790; cv=none; b=XG8xK/80XfvmhgUd0qCYtu9dww/TUmcpunMnceUyL0pg9MDgjEw4jkB2dPN97owMXxG0DyczUvQyhyfgK3y5SxU8T35G5ZqzVlMGjfmSilxxvZ+R+eK6SQSsBY7AoMqWu4YG/o1v2zUTfAZRcJvUuU7eT9likQiKxSJxRsT1rpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790983790; c=relaxed/simple;
	bh=JqmySC+xzWMTX7R78OgixtR+z8aXbsP/GeUYqG/FcMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXj4gTH6iEExO++4YHBMO+3apX4UQK28iTdgNBP2vFzKsHlIanRDVwDjJyQA94tByBeP3drQZFyYBHhHv0ysDlb6zSLQ7nJ72UFUQbTPz/AO+dYbFYBCNNMT6OHcf/94eu6SeeOlSDmdITFkA7+Lh2SlDot73bX2entO0jlaGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUlYLozi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUlYLozi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96871F000FF;
	Fri,  2 Oct 2026 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790983789;
	bh=9DCAvEBt+9vx1zK/ZDVHfLqQ3aCPVbKhtlr64cyEutM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUlYLozifUr2EaRMqWwVpFFfAD7TRXCyxFN7IGaYRA1KcMOOYPkNaX025vNna41yb
	 3v7wW95xvSNmy7EyuEOBqwUj8Xcvm2xX2ZZgmEcicZqZXt2LgEpzO1vlUEY7nl6v+h
	 OLXsJHgVH+uNR1vHztzj8vILzXnCG3u4dm942Drr4ZEsa/quODy+fXQOYKuFJT7afQ
	 wbWdjnSM/HUsHLq0Sjc69+TbXBqxrejyy4PW+8B8WVRhRaSCH2tC7ik6noCuyoBR5t
	 vifNyhegZZF4PyURnmI6KWuJOJ8Sqkv4d6VYdC03fF1CI9CWtizklcUwafBpZlYsUf
	 rF3f1Ozyv7Ajg==
Date: Fri, 2 Oct 2026 16:29:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v1] f2fs: convert pagecache_read() to use folios
Message-ID: <20261002232934.GB15366@quark>
References: <20261002114338.12073-1-nsvatoslav515@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002114338.12073-1-nsvatoslav515@gmail.com>

On Fri, Oct 02, 2026 at 02:43:37PM +0300, Svyatoslav Nikolenko wrote:
> Replace page-based APIs with folio equivalents in pagecache_read()
> to migrate fs/f2fs/verity.c away from struct page.
> 
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>

This will conflict with
https://lore.kernel.org/fsverity/20261002223705.2175542-5-aalbersh@kernel.org

I'm checking if that one will go into 7.4.  If so, this one won't be
needed.

- Eric
