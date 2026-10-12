Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F631352B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774073; cv=none; b=neBzUFG3H5549izc/1GY1i/1RxS4+CHdhkxLLhZiFAIlt/kt3xqT9ik7fk6KJCPOOnrhkmv3EFyo0HcEVb3Br8mUZ0qPXIKycALl7t53HPwpf3mm5kzoNBaVdlqW78GzXr6+q1iiveuZYCjCT94NC/TFLAvNW8lEHYWTivR+nhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774073; c=relaxed/simple;
	bh=JFAx7Gk7xIgDyXKnC74ceC6Twxtl5GD9OSPXkgF9V14=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gv4ImEZOD6rV66CXkDidJls7FEKDv8W3oNPO4p+sTSkZ3JVil3elNMcO8fpdWS/B+0RyPhSYHRAhK4ONv/blOmkAMXDJfEwuRu/zQbDXbmdjnrkagfI1v8e6xAAaCLWR+5rBAsUHzGlJ0S+ZLJzVTDhEVc39TnHRRiEqzSlqkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PdqQlJ+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PdqQlJ+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB9E1F0089B;
	Mon, 12 Oct 2026 03:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791774072;
	bh=Akzdmk8ispYdrVaiRaEkBsWQAezgYlwqc2eqIbTZKn8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PdqQlJ+l9LfLboA8j4ZOLMM3RuB928UbWAXehTxA5jvHobjodbdPu2HYq2fEHOYT/
	 /OP4JJt02XnLgq1PcyFxkM60CXZQHJ36QriUhKah1OxtO1H2Z8hdJR0jLYljP+7wQA
	 pVqG/dH/XlKpugb+BdI58SJa7y/vhBLJt+N82tvyEcWf5P9qdNi/RwWAd3rYTb460H
	 xX8tuWjZ55S9LkEQC4btfetStiJM5Cm8nPPzA0Q174EscH1GgjyeY9U985wm9qpKHs
	 8RUhxhqq2IO+0Zotqxh+xhMLGunH5hfG3rNeSGWVSGMby+73YSI3dYckvDS/SurNXl
	 z3mO2KLfkhhyA==
Message-ID: <efb9eda2-371b-437c-8652-ed25c842f11a@kernel.org>
Date: Mon, 12 Oct 2026 11:01:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
Subject: Re: [PATCH v3 03/17] f2fs: support regular file buffered writes on
 large folios
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
 <20261009161224.4163796-4-zhaonanzhe@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20261009161224.4163796-4-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 00:12, Nanzhe Zhao wrote:
> +/*
> + * Drop the folio lock when a node was changed, then balance the
> + * filesystem and reacquire the lock.
> + *
> + * Return: true if the folio became unusable while unlocked (being
> + * truncated), false if the folio is still usable.
> + */
> +static bool f2fs_folio_may_unlock_balance_fs(struct folio *folio,

f2fs_balance_fs_folio_locked() ?

> @@ -4198,11 +4501,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   
>   	*foliop = folio;
>   
> +	/* Clamp the write length to the folio size. */
> +	blen = min_t(unsigned int, len,
> +		     folio_size(folio) - offset_in_folio(folio, pos));
> +
>   	if (f2fs_is_atomic_file(inode))
>   		err = prepare_atomic_write_begin(sbi, folio, pos, len,
>   					&blkaddr, &need_balance);
> -	else
> -		err = prepare_write_begin(sbi, folio, pos, len,
> +	else if (!folio_test_large(folio))
> +		err = prepare_write_begin(sbi, folio, pos, blen,
>   					&blkaddr, &need_balance);
>   	if (err)
>   		goto put_folio;
> @@ -4222,7 +4529,19 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   
>   	f2fs_folio_wait_writeback(folio, false, true);
>   
> -	if (len == folio_size(folio) || folio_test_uptodate(folio))
> +	if (folio_test_large(folio)) {
> +		err = prepare_large_folio_write_begin(inode,
> +					folio, pos, blen);

Is it possible that we can relocate prepare_large_folio_write_begin() after

else if (!folio_test_large(folio))
	err = prepare_write_begin(sbi, folio, pos, blen,
					&blkaddr, &need_balance);
else
	err = prepare_large_folio_write_begin(...);

Thanks,
