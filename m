Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28190489FD6;
	Thu, 24 Sep 2026 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256391; cv=none; b=FacD9dNWAphEiMpA8GhSoqlQ3XOZ4fHgZ5eCQ5szt1PRjv3NW+pacfAkI88QfHAaJtWmD62/dSRopuJVfo8JV5U4jybY19MiM4JQamJ4SH5ggOJb1zV/furkZsG2l36QHW6uPonaEVEf/66zxWBqF9H93dSL+4bsZBnqFflOhOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256391; c=relaxed/simple;
	bh=TMxMY6dpKY12lXJIR9MB8qhRoe/rIKmgZbGZ38PWC9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n7POQD0lMjqNstzpIkT19wBjHTsmqPQ5OVj/puNxDrq080OYyfha+whS8kQn07eVNe9PWJZ7/fkYSHoQusXFGorgUIvSaXMdQrb6g+3cNgt+/VFoyO8wvxkY+GDJx5GGGR1deDj8ToQUKXxlimUuaMroL4gxZfy/AbbK/wZdLPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXoEyJpb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXoEyJpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15541F000FF;
	Thu, 24 Sep 2026 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256388;
	bh=kjlo8XBtE9TxB1LKTX/vUG/maDWdF6slESEL4axLxF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EXoEyJpbObkYPw/DP1BT2piCT31gRKuurm0smBCDhbkQwG4a2mfShKuql3FVVLIjm
	 +yA/famYpOLn89tGaZGE+MzXDC1ESpo5SncCDOsPksbiM3Bvm3pVL55WPEW2ZEFrTS
	 PJe6teyjuYG0jkQsqYCFIhZon1XF4icI4W44CDhYIwY7CHPbsaGFygYPIsCv8RvtW8
	 8HlnJpEghYdF0tIp4r24+iUYmRjjr/Np/xzuf8gTk6o+gyERUXhEtTdy9J/qN7F7hr
	 tbZlHPvZtTXvrpoq1AhVWxM6YNeYJTZ9D0iFATWWZqb8GNhSvZp7In4Qz+IfdXphnC
	 ffIWYWAo54S0A==
From: Pratyush Yadav <pratyush@kernel.org>
To: sashiko-bot@kernel.org
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Samiullah Khawaja" <skhawaja@google.com>,
  "Pratyush Yadav" <pratyush@kernel.org>,  "David Hildenbrand"
 <david@kernel.org>,  "Alexander Graf" <graf@amazon.com>,  "Baolin Wang"
 <baolin.wang@linux.alibaba.com>,  "Mike Rapoport" <rppt@kernel.org>,
  "David Matlack" <dmatlack@google.com>,  "Hugh Dickins"
 <hughd@google.com>,  "Lorenzo Stoakes" <ljs@kernel.org>,
  sashiko-reviews@lists.linux.dev,  linux-kernel@vger.kernel.org,
  kexec@lists.infradead.org,  linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/6] liveupdate: luo_file: look up outgoing tokens
 by id
In-Reply-To: <20260923225550.32AC21F00898@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 23 Sep 2026 22:55:49 +0000")
References: <20260923224408.3745689-1-pratyush@kernel.org>
	<20260923224408.3745689-2-pratyush@kernel.org>
	<20260923225550.32AC21F00898@smtp.kernel.org>
Date: Thu, 24 Sep 2026 15:26:24 +0200
Message-ID: <2vxzwlsa4w73.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 23 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] liveupdate: NULL pointer dereference in liveupdate_get_token_outgoing() on incoming sessions
> - [Medium] liveupdate: flat ID namespace in liveupdate_get_token_outgoing() risks cross-handler collisions
> - [Low] liveupdate: O(N) indirect function calls in liveupdate_get_token_outgoing() list traversal
> --

Let me reply to Sashiko for this patch since I think we should take this
regardless of where this series goes. I think struct file is the wrong
primitive for liveupdate_get_token_outgoing().

I'll ignore Sashiko on other patches. It does raise some good points,
but code correctness isn't the main point of the series. I'll fix them
up on the main posting if we agree to go in this direction.

>
> commit 17b042e4901cfc25a86dec1038092fbe1eb5d060
> Author: Pratyush Yadav (Google) <pratyush@kernel.org>
>
> liveupdate: luo_file: look up outgoing tokens by id
>
> liveupdate_get_token_outgoing() is used to look up tokens of dependencies.
> It does the search based on struct file. LUO provides file handlers a
> get_id callback that can return the unique identifier of a resource. This
> patch uses ID to look up dependencies in liveupdate_get_token_outgoing()
> instead of struct file.
>
>> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>> index a39992da504fb..51817d202ce26 100644
>> --- a/kernel/liveupdate/luo_file.c
>> +++ b/kernel/liveupdate/luo_file.c
> [ ... ]
>>  int liveupdate_get_token_outgoing(struct liveupdate_session *s,
>> -				  struct file *file, u64 *tokenp)
>> +				  unsigned long id, u64 *tokenp)
>
> [Severity: Medium]
> Will this flat ID namespace risk cross-handler collisions?
>
> Because liveupdate_get_token_outgoing() searches across all preserved files
> using just an unsigned long id, it loses the context of which file handler
> the ID belongs to.
>
> If different handlers use overlapping namespaces, such as IDR indices or
> pointers that might alias depending on object lifetime, a lookup intended
> for one handler's object could incorrectly match an object from a different
> handler that happens to appear earlier in the list.

The IDs are supposed to be unique in the whole session. That's the whole
point of the ID mechanism. If handlers use overlapping IDs, the handlers
are broken and should be fixed.

>
> Could the API require the expected file handler context to scope the search
> safely?

This can be done but only when there is a need for it, which we have not
seen so far. Without a use-case, namespacing the IDs per-file-handler is
overengineering.

>
>>  {
>>  	struct luo_file_set *file_set = luo_file_set_from_session_locked(s);
>>  	struct luo_file *luo_file;
>>  	int err = -ENOENT;
>>  
>>  	list_for_each_entry(luo_file, &file_set->files_list, list) {
>> -		if (luo_file->file == file) {
>> +		if (luo_get_id(luo_file->fh, luo_file->file) == id) {
>
> [Severity: High]
> Can this cause a NULL pointer dereference on incoming sessions?
>
> In an incoming session after deserialization, luo_file->file is initialized
> to NULL and remains NULL until the file is explicitly retrieved.
>
> Because liveupdate_get_token_outgoing() is an exported API that accepts a
> generic struct liveupdate_session, an in-kernel caller could mistakenly pass
> an incoming session.

That's a broken caller and should be fixed.

>
> Prior to this patch, doing so would safely return -ENOENT because NULL == file
> is false. With this patch, luo_get_id() will blindly pass the NULL file
> pointer to the handler's get_id callback.
>
> Handlers like memfd_luo call file_inode(file), which would cause an
> immediate NULL pointer dereference and kernel crash.
>
> [Severity: Low]
> Are these indirect function calls necessary during the list traversal?
>
> Replacing the direct pointer comparison with luo_get_id() performs an indirect
> function call (fh->ops->get_id) if defined, on every iteration of the
> files_list traversal.
>
> Because this function is used to look up tokens for dependencies, it can be
> called for every dependency of every preserved object, resulting in O(N * M)
> indirect calls.

A very large number of files with dependencies need to be preserved for
this to be a problem. We haven't hit this bottleneck so far and don't
think will hit it at least in the near future.

>
> Since the ID is a constant property of the preserved file, could it be
> evaluated exactly once during luo_preserve_file() and cached directly in
> struct luo_file?

Not a bad idea to be fair. But that's an independent fixup.

>
>>  			if (tokenp)
>>  				*tokenp = luo_file->token;
>>  			err = 0;

-- 
Regards,
Pratyush Yadav
