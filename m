Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980819F121
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407940; cv=none; b=cMjQwuNHQcXdrvmplANfA8/fyMLWQB2HPyddDjR6hOuTjq5OKsVeRFRFON1HmNyLD6Sp/8iumvhDKJ9vPsJTiGQXFJgg3beO85zyxi3elpA58ANPI+8DT6aBD3gLazvfDtkYE9stoz3NbFJYSRqWtsGSpE8p8PZ2mMMySHCH2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407940; c=relaxed/simple;
	bh=1RHq3pONl8esLTSxNKCpksTu23y8ZOXZohCtVwPGb+g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=o5ZUNchOanBpdo0DawPBQfLKs/wc+Qyr482Cg4KBP3DpRWfUAuaeAGc4ZbS76ncbKj37AvCx4ZNAhXoTu2CrvBWOaykLRARciQDx3pWptVfnxObeKnWzgwxZpWNw+oy4ALMOY6CBjTIAPXwt06BZ6oh4PDgIEtmNmFq2at08eRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrzIY10V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrzIY10V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6191F000C4;
	Mon, 19 Oct 2026 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792407939;
	bh=k4q66emTtkmRiUAUpJo6ZluKPMmUw0EN7H7khyWm514=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=IrzIY10V8O0NDas70qmNAussg089+Vj/D4jG4Ml9sqcpB8uRB8Q5FPus5LxwJcPa1
	 RxtLalxqarvEj6Mb5HtMt67X0SVL3ZFMpzA5l1wBCyJ+FA6Bu0KWVFJwLC6mrizm3x
	 EPOrsto//l/AthadeaKhbKh0spe0Q28/m7+mksRo5VgWl1TYKASRnAg7VIA11o9GAU
	 4Dgskp4vNQzSHRe1wrRSXyRRwjybrpRi6upQ35ku9ADkS/YD9daXsKJKLLiVj1CAsr
	 TvZ+6M9OmqNOHAgBtvufnsxDRVXoKxp1JKgAVNKuFn8tFmmPmvG7O401hv/WOc4P5p
	 cTrutJ9fVXKHA==
Message-ID: <b52ee3f7-e849-4444-b870-7f9ec87f8541@kernel.org>
Date: Mon, 19 Oct 2026 19:05:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, daeho43@gmail.com, daehojeong@google.com,
 sunqiuyang@huawei.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH v4 2/2] f2fs: refresh pinned allocation boundary after
 resize
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <cover.1792116883.git.qiwenjie@xiaomi.com>
 <226abf7d629d7345f450753a42e924b436c99ec0.1792116883.git.qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <226abf7d629d7345f450753a42e924b436c99ec0.1792116883.git.qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/16/26 13:44, Wenjie Qi wrote:
> Online shrink updates MAIN_SECS() but leaves resizable_tail_secno and
> pinned_area_max_secno unchanged. The pinned allocation limit can exceed
> the new main area when shrinking beyond the reserved tail.
> 
> Consume the reserved tail by the number of removed sections, clamping
> it to zero, before refreshing the shared pinned allocation boundary.
> This preserves the boundary while shrinking within the reservation and
> limits it to the new main area otherwise, retaining the zoned limit.
> 
> Save the old tail count and restore it before rolling back the geometry
> if the final checkpoint fails.
> 
> Also bound pinned section allocation by the current MAIN_SECS(). Range
> evacuation temporarily reduces it before moving cursegs, while the
> cached pinned boundary still describes the old geometry. Otherwise, a
> pinned curseg can be reallocated into the range being removed.
> 
> Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
> Suggested-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
