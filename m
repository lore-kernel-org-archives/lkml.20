Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CD400987
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170933; cv=none; b=IviJEUMMqGzZupYDd/eoyN25PGK26F0ebrrYdqX5YyBGTtDBcoccP6SjqZaZEbmyMXm9PRCzA5ja/gf8Yca1+YjDBpqnN/n7O5DKMupzx1rEnZXf6/YMdrT3qaiNzW3ta3iSzJqiy9zoMbNn/6d7nFtjnZEhBNibXd60y4281JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170933; c=relaxed/simple;
	bh=tLnReXmhVdRvFaQKJDAq8PXo4nJzzNLxzvfuSmZADnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR3JWkEPgO9DGd6UUiOOgGLEB/9GmuIk/2ZnhufcZnPN4pW0ayJjk3fZfWrngY1I3xTuu3zClzVNIieJ5NTn5EZaktbQFtvtn1+c1OxFONdXCHd39mzcCBwPSoPH044lKeq1cfBIzdDO/d64lQSG+jk0uSVRjYDFrvFvffBbS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jk0tFo4R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jk0tFo4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083031F000E9;
	Mon, 31 Aug 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788170931;
	bh=z/Cx6rxW4jszDkKMv1lPDOHzq0Kq6lt8KT1TIKFLaG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jk0tFo4RReOyXlIFcgroPA+8suCmv2Nba4g65fn0HkMxjGx1OyMBiEpom5lvDzxF/
	 PtVSstnd31fRPZ1b0gxikrJxo+PWN8feTqfXz/cYf37GGXaHCKyuxzIQitgqBofbwP
	 gJDv5PlJVBGHzHdTRnKzu72beXZhEKYvltMwFhV6GNOTOH0fvtO7Nicb5So/diZMOv
	 JCvNHqtGXYe2w6Ii2dSkR03WGjQCsRwMrlmiCLtjsg2hpg0B44OK6CTjjtlKu3pC1L
	 6KVlQ3Yq1HYREur3cBlWdNpqalPb7o+OGUVIpyAXKtT0WMsl5MIZynMQXe0OEG3MDs
	 YmBby4J493vFA==
Date: Mon, 31 Aug 2026 12:08:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Tao Cui <cui.tao@linux.dev>, kees@kernel.org, cyphar@cyphar.com, 
	containers@vger.kernel.org, linux-kernel@vger.kernel.org, cuitao@kylinos.cn
Subject: Re: [PATCH 2/2] userns: don't clear the install target map on
 map_write() failure
Message-ID: <20260831-ammoniak-blaskapelle-abbitten-db32791d39b7@brauner>
References: <20260828091659.358700-1-cui.tao@linux.dev>
 <20260828091659.358700-3-cui.tao@linux.dev>
 <37ur33kehusvq7scjflrr3df6d36xtaminoricp6ituocpapef@3we4ql6o2ozz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37ur33kehusvq7scjflrr3df6d36xtaminoricp6ituocpapef@3we4ql6o2ozz>

On Fri, Aug 28, 2026 at 11:51:10AM +0200, Jan Kara wrote:
> On Fri 28-08-26 17:16:59, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > At the out: label of map_write() the destination map is also cleared
> > (map->forward = NULL; map->reverse = NULL; map->nr_extents = 0)
> > whenever the write failed and the extent arrays had to be freed.
> > 
> > However, the destination map is written by the successful install
> > block above, which has no failure exit; every error path reaches
> > out: without having touched it.  A second write to a mapped
> > namespace is also rejected with -EPERM before any parsing happens,
> > so the clearing can never roll back a previously installed map
> > either.
> > 
> > The three assignments just zero an already-zero map.  Remove them.
> > 
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> 
> I agree this is a dead code but it kind of makes it easier to argue about
> the correctness of the error handling branch. I guess I'll leave it to for
> Christian to decide whether he wants to take this or not.

Nah, let's leave this as is. :)
