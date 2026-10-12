Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B182BF3F3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774395; cv=none; b=LyUFtAb9rWrS42iY1GnP7HcQ4m8AJlfIBo9js1Zvr8lxcOcPwpKRsm00IkUHTjqrthNy0rWfkJYYMNAVifHgaGsvJfgkYvcsyyqTTVpst8Sr7atsMl4mAolg7b10YQNOTzqV/wFSL7VFqR6vkfozpLsjtdUeUIjqzPdPSbXbye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774395; c=relaxed/simple;
	bh=lWRJAzCXfzatvkdgJjzxDixw8EVDzMh3HkSFHxYJ5Go=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uQby5v5/Ys/fr/4AEKHGxhLJfQHsNJtO5S3sXnEYTLCycj9WUX1N0aQnJVXVndw89cZuVPbswreKYt5Fuod3fh/cINv+NwEIxsocu9Xpdj92hsdDefuZvZJYCzpys+MtfYgpWihZlidMOa5cCZ4rKQeKSzhJsi9nsL3Am9juF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkHjlQ+W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkHjlQ+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2C51F0089B;
	Mon, 12 Oct 2026 03:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791774393;
	bh=n9ZRVZAhPl0REZUvWy9Yao07ThdaPGKA/SPLB+UrlLQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=fkHjlQ+WdOiIsPLnMTSxK89S6+KXM2Kfu37oDdOHwd+qyvL7oUiULjfq+avuvWwdH
	 Aw67iK23Duv9PQpG27FaE2/oZqRkiUlfkx/mkxZUp2PFHTklEWddSg61fQNNCT1BPk
	 c+TnUAuKDGPN1UyRqCRKeZT6nTqm7SZrCblkhZX40ES63GkQltMUAnvEMHXFJRV7Ch
	 sWtjjYJcS4mtoAZBkEWXBXOwBvPqYDYrQmFdBvmL/pCJVw3SIWp0SU8hvradm7hOpK
	 hfTb+gFNnYFv9ocg3ld0b0VWjm81ehOR9TMZNQZ1VS17eFGVBPq4XLcvwvrfteZHme
	 00+mj+Wiq596A==
Message-ID: <e12debf8-87d0-4c17-8973-98e950c2047f@kernel.org>
Date: Mon, 12 Oct 2026 11:06:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v3 04/17] f2fs: support atomic file large folios buffered
 write
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009161224.4163796-5-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261009161224.4163796-5-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:12, Nanzhe Zhao wrote:
> +	/* If index is beyond the end of file, reserve a new block in COW inode */
> +	if ((index << PAGE_SHIFT) >= i_size_read(inode))

Can you please check all "xxx << PAGE_SHIFT" statements in patchset to see if there
is overflow issue?

> +	if (f2fs_folio_may_unlock_balance_fs(folio, mapping, need_balance)) {
>   		folio_unlock(folio);
> -		f2fs_balance_fs(sbi, true);
> -		folio_lock(folio);
> -		if (folio->mapping != mapping) {
> -			/* The folio got truncated from under us */
> -			folio_unlock(folio);
> -			folio_put(folio);
> -			goto repeat;
> -		}
> +		folio_put(folio);

Then we can call f2fs_folio_put(, true) to clean up the codes?

>   	if (folio_test_large(folio)) {
> -		err = prepare_large_folio_write_begin(inode,
> +		if (f2fs_is_atomic_file(inode))
> +			err = prepare_large_folio_atomic_write_begin(inode,
> +					mapping, folio, pos, len);
> +		else
> +			err = prepare_large_folio_write_begin(inode,
>   					folio, pos, blen);

Same question as it in 03/17, can we relocate?

Thanks,
