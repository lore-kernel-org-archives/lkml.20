Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04D41D64E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919927; cv=none; b=WnFe7vtf373Cxj8RAslqcbKWAGYH8W2ISTQxSR2Bl67SgehOLRksodYA/U0EOACeGYvQVvIX9tkrbDPFQF+Wp907ZePhrCfgpTEDhDhZ/cV2DoBSbX7kd51qdttEX3638DZZz0qs30zoa0xrh/Blye1ifmpxVHOGKgWmN4refh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919927; c=relaxed/simple;
	bh=N0uAKidTk3ca0AXb8umQvyCorPxqR1VjKwd3mlVvnDU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FwVQ8j/VOK0zuaLJ7rfixfAXJ12Y8b47f0hDXQ/LkctzfA9JAdyTY2NRoXScaIL0L0nbA5rXOFSscvNCO+HEV2PTc0QLB6SwrKX4s8IGPSi58+82cGldk0VlHpyF/J9eHQ8CRX97Rwc6qyHZnIaoy3kdrJZoxyp+PnY5fm7soR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE29sBoA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE29sBoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFA51F000E9;
	Fri, 28 Aug 2026 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787919906;
	bh=xZ9me54ezhfBhhLAqHw8CbjXHmjjvbvgWR0OVYdLObQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OE29sBoAshZwOVX+xFOEH9c+7aLynmgSJps5ULMrEHd46t53tLpe03Nr5BwQpFVWa
	 I9o4lQmdPxtr5hsDPTEQBkcp/Yl2NkVOUjyj2e2xwgf7DIjLLcMBz8lPft8SgivtVC
	 kSZ1oZ3qjhBLY9jEX6w5paD5xUiIdYOmNIRHFXAJuyQ8SFSoOI8Snenoe1zAU8qF3x
	 j3p7Z4S7o3ENLIIPE8sbVXaALTun8jgaMoEda6Zc3EdmvYwXWeb/mjkYPXY+x0Yuej
	 Jeyvt7N/cDbBdOTo4KSJ9B+vOgCt2jGFFxNT0pbcCBGI5GokfHrWODzrWLE2W4/y23
	 Xq855ST1At/gw==
Message-ID: <12dc55dd-f85d-4f21-8eac-f1042bcf0565@kernel.org>
Date: Fri, 28 Aug 2026 20:25:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
 <b4711014-844e-45c0-b85a-4e3a98d7137c@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <b4711014-844e-45c0-b85a-4e3a98d7137c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/28/26 20:00, Chao Yu wrote:
> On 8/27/26 04:04, Daeho Jeong wrote:
>> On Tue, Aug 25, 2026 at 6:03 AM Chao Yu via Linux-f2fs-devel
>>> +               f2fs_lock_cache(entry);
>>>
>>> -                       if (ino != folio_get_f2fs_data(folio)) {
>>> -                               folio_unlock(folio);
>>> -                               continue;
>>> -                       }
>>> -
>>> -                       generic_error_remove_folio(mapping, folio);
>>> -                       folio_unlock(folio);
>>> +               if (!f2fs_is_compress_cache(entry)) {
>>
>> How is this possible?
>> or if (!entry->cache)?
> 
> I suffer a panic from f2fs_bug_on(sbi, !f2fs_is_compress_cache(entry)) here,
> it may suffer race condition w/ shrinker.

I changed like this, because:
1. we will never update entry->ino after initialization, so it's safe to
check w/o lock.
2. f2fs_truncate_cache() has checked entry->cache by itself, so it doesn't
need to check w/ f2fs_is_compress_cache() outside __f2fs_truncate_cache().

	for (i = 0; i < nr; i++) {
		struct f2fs_cached_block *entry = entries[i];

		index = entry->index + 1;

		if (entry->ino != ino)
			continue;

		f2fs_truncate_cache(entry, false);
	}

Let me know if you have any concern about this.

Thanks,

