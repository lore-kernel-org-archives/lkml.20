Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBA379EE6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801090; cv=none; b=C+hKpOI2KktAXhAjDS5PfTX86gMzUhsCJxrcHMuJuYN1c+VIZ3gVRDS1B7YCbjsnMp/QOm87s5/LVipTsW+WKtBudLS7RMDpd1IV4KCJP6WdP6WubziRJJxcuWuCSgj4k+LpLm+nAMQ5cy8S/aF3UmvIwTO9YeBCvL+vo57fZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801090; c=relaxed/simple;
	bh=+T1tOVbfUN4Lo+0hahQlXSONN5e/e2xiiQN9+qi0i6Q=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Fxe60vhr/Q584ilw8kKSmaJFp3lGpmPbNbnjoPYkN81MPnlWGWLwNP82Clks1s4aR0R4DEGYCEx0pVxKCqA1DnmeBFU1+HXKAuvth0hQgGWo+gAPXWJ9+9K96QbIdhBpBhOLXJTmCMGp0bYuLeA3AFL2qmeaQGRlMrGwiNuIlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPL7oQ0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPL7oQ0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970AB1F000E9;
	Thu, 27 Aug 2026 03:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787801089;
	bh=B4G2OfJCXFLvW2ZfNSEkZA/MTBfDinhkmQW7E0EEGmg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=RPL7oQ0up+oc0cCToP8b5TKS8AxovnR1IzMRqix6Vmwkmje6chMoco4ODwl1t6Jav
	 Ri2nMvlI/OOo3KxhDkPKaXdAwap4hvtj3Qw/PchHYWydhkB+wuvNURyXHUM2pynmj0
	 YNwa0IQnNH8PoNOlWaF+HbWzMcykJMDEw4h7yapyUTj3+wVTj5y3mNYuHLfZ9hfv0m
	 ZwIBe2S7qLvCh+y7KrS9TdaBKzBUjWt8oITv4oLnqu0QJSX4ndwzgy3B7b5byOMCUJ
	 22AZx4apCjKcCCcOWJKanhthVHRTAPyVcSaGNKiWOwr47S35UtH3s90uTSacuE/QWW
	 736g+CLF6/TMA==
Message-ID: <8e02060f-6921-4d3c-abb2-cc36fe1e9594@kernel.org>
Date: Thu, 27 Aug 2026 11:24:47 +0800
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
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 04:04, Daeho Jeong wrote:
>> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
>>                                         bool drop_dirty)
> 
> -> __f2fs_truncate_cache() without locking?
Or, I guess you mean we need a cleanup here?

What about:

void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty)
{
	if (!entry->cache)
		return;
	f2fs_do_truncate_cache(entry, drop_dirty);
}

static void f2fs_truncate_cache_locked(struct f2fs_cached_block *entry, bool drop_dirty)
{
	f2fs_lock_cache(entry);
	f2fs_truncate_cache(entry, drop_dirty);
	f2fs_unlock_cache(entry);
}

f2fs_truncate_cache() was exported for using in other .c file, in the meantime,
static f2fs_truncate_cache_locked() can be used inside cache.c.

Thanks,
