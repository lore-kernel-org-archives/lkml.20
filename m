Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69A125A0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922099; cv=none; b=VDvugb24/zFYIeFnroqMXMpapw/sp9LmiAKQ1JCii4jKA2PRBk1QSk12KWQ4jWtQwl46PFuPf2HQkhgN9U5kDRlu8ncbJ8sgj5qJWb1G5p4NqElW0PiwWWY21i+PwEfzZkwQvnMeAhGMzzWWNjzonCtQ2rhLlibGjyfrQgbaUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922099; c=relaxed/simple;
	bh=axH7mh+o6Amq/lL1QmfOdPrEK4lBf235zZ05h/Y3g8I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JaHNZKDk9tO7ZwmjjuyoWIRdnT7z0L2PVCHNuNPyzxuM5G4e8w1sYvyoP2mV4ioJRVl37h9fK3K1pcJ+SGIdo9uFe+BZXXo2pYhH0zVUSGdZ4PqSJ2f+lWJZZoXtNrb/RBYIN0Ispda3RtwJENWD3hJd24rajSmyJPa/9Uz3n9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtaRaHP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtaRaHP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64541F000E9;
	Fri, 28 Aug 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787922098;
	bh=fL5mMIwmmDluqgLzIsaCvXtwyjBSi3fUOKO2iyL8nZc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=XtaRaHP0TJXMJMQj0Er6XCFY1WMB02eV6Dqv7MJ0jw4KqwN+CG3APTRmnBeDfObK4
	 67ECsFGebhl0ETTlzAvI4bUJgPgOWuNMwmp7CH51yGpCT799T+UB5kBE39moT0OgQQ
	 Xs/vtlAsq1oW6l8D7kBDjcUarOh60OHUvF4w8lZnZSz3Faf0/cg1UsUeyrCkfDym9C
	 cncwBPnIIh7ayRUr/pMqHIJFbgHrqquyTDPMkr7xhwxRIWiBrjs+ik+7cO8v1Yj88+
	 0uYI76jTXGgcwjc9qRuESwDijF57BKe1wCY5GIZT2sclQpuP3PtT/p2MO7wVg4RJAJ
	 uogK+bHGfSSUw==
Message-ID: <d1225b18-7e4f-4214-a618-c359ed5d59ac@kernel.org>
Date: Fri, 28 Aug 2026 21:01:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>, qiwenjie@xiaomi.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v1 00/12] f2fs: introduce metadata cache
To: Wenjie Qi <qwjhust@gmail.com>
References: <20260820031721.12218-1-chao@kernel.org>
 <20260824100752.3890850-1-qwjhust@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260824100752.3890850-1-qwjhust@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Wenjie,

Thanks for sharing the info, I guess we can discuss after we upstream
this serial. :)

On 8/24/26 18:07, Wenjie Qi wrote:
> Hi Chao,
> 
> At Xiaomi, we have an out-of-tree F2FS node-cache prototype for mobile
> workloads that retains clean node contents in compressed memory after
> page-cache reclaim.  This is different from this series:
> F2FS_NODE_CACHE is the primary cache and can hold dirty authoritative
> data, while our compressed contents are clean and disposable.
> 
> In our mobile workloads, clean F2FS node pages can represent roughly
> 100 MB of uncompressed working-set memory.  We have observed an LZ4
> payload-to-original ratio of about 0.1 for these pages, excluding
> zsmalloc fragmentation, entry metadata, and workspaces.  Node reads are
> also on latency-sensitive paths, while memory pressure can repeatedly
> reclaim and later reread the same node pages from storage.
> 
> These are observations from our out-of-tree mobile workloads, not
> benchmark results from this series or current upstream Linux.
> 
> If the primary metadata-cache model moves forward, the direction we
> would like to explore is one F2FS_NODE_CACHE slot per NID with mutually
> exclusive clean representations:
> 
>      UNCOMPRESSED_CLEAN <-> COMPRESSED_CLEAN
> 
> Active, dirty, and writeback entries would stay uncompressed, and a
> slot would not retain stable copies in both forms.  Compression would be
> prepared outside the shrinker and direct-reclaim paths.  Shrinker reclaim
> would continue to discard clean entries without compression, allocation,
> or I/O.
> 
> If an optional compressed representation for clean, idle F2FS_NODE_CACHE
> entries fits your intended metadata-cache roadmap, would it make sense to
> discuss the clean-entry state and lifetime contract first, and prototype
> it on top of v2 once the base cache is ready?

