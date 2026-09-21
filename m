Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30D146D5A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959151; cv=none; b=TR4BCm6Aoy3qXqeQY5zwM+Lz9vBcA125sDgvrY4umJ0xrEnhv7cWgR2bnY/TYjZb1rSEIqqQ1RG87CPXZKBEwxDl1V0mA2Mf+DNsSZAAI6hE1TGe6ayws5QGM/UNDPYqKRcN625KBqW1iQNNkX+u5BA6J2L9SpKwTJu+3XQQUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959151; c=relaxed/simple;
	bh=FPoIsY8rQoDwryDxs/709ysSGKfGisuqK2X/14S9Ic0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oE5il+5yJQVEi/RQkh1QwqVhPjEjzdkBElm9PKgEQG5lP2SPOQSOH5TnU/p8PyaCTDRePGMb7SleHMdwFXFWqyScVgfzG+Bx5MHpImQ/Q9IiCn6muuh4ag7N6ouR/PMRrrXF0Qq3pUWteVTCD0SWsbO8ngsnXknI1ulYI2evVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMyf3zp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMyf3zp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2451F000FF;
	Mon, 21 Sep 2026 02:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789959150;
	bh=sJB1bkNOzZgQq+4H9QThVYJkqDHUdc9VU/5nM8apPNQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=KMyf3zp+BzUf2/ainezMeCzrw0meSHq16lh8eMdy5NkZLizooTzv7D9rw9CZ5mJmy
	 DMdfio9CN3R8nRwGhcomkLk7CKhp+PvpZAUVRSD+ciH0RXfQSGUv7p1hxhll8qNalK
	 kIDLO/AUsN8tYN7RjYaHFQWtvD/0MnEOfOJ/n6mZkvDDnPxaeON5/yaj2VKBdGUsH1
	 uYnFm7gsxSJrsk1oIjBdQo6/5nAcEdWPgfj3xirwEb70XD73B30UKAc0eSn0Bu5DiZ
	 hCMucMB8j/kRz6b3ZY2svy8NMiQxIBIwhK7lnFfHdfbh1zqkQrTasPQF0xqWsppWll
	 nicU6RZQLmskg==
Message-ID: <b77fc4a3-0c8f-4470-bc0f-f9d7cd819885@kernel.org>
Date: Mon, 21 Sep 2026 10:52:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 05/14] f2fs: support large folio writeback
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915041909.2903887-6-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915041909.2903887-6-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 12:19, Nanzhe Zhao wrote:
> @@ -3799,7 +4198,10 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>   	account_writeback(inode, true);
>   
>   	blk_start_plug(&plug);
> -	ret = f2fs_write_cache_pages(mapping, wbc, io_type);
> +	if (mapping_large_folio_support(inode->i_mapping))

if (mapping_large_folio_support(inode->i_mapping) && !f2fs_has_inline_data(inode))

As we need to writeback inline data into inode via f2fs_write_cache_pages().

Thanks,

> +		ret = f2fs_write_cache_folios(mapping, wbc, io_type);
> +	else
> +		ret = f2fs_write_cache_pages(mapping, wbc, io_type);
>   	blk_finish_plug(&plug);
>   
>   	account_writeback(inode, false);

