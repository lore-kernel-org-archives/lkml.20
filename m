Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751163B9D98
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724497; cv=none; b=r8xDnvg1vZzldwioXFBfbzL9IJi+HbYseDXIQeh91bPRbPpxGQEQzKe77tYvUjeEbkyc3P4oOMFMJulQwS72AMBhyjeQAcsRyhw+4COsBcCKFpQrHLnptDMMC/bBYycMOEtfXlbW2yL3ti6v8OfrswTADADJJwMRkNkRij3q/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724497; c=relaxed/simple;
	bh=9Wm9MWcPeCrfUq+Fgllhb0/cQwSioK542sOcG4HHx8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GOWeZKN+pV6glOqvyXIyZawWXdn1ZKCIpp6fY679sNP4GGY18gpdrjOFNgwYN/pvweq2Zvwpd/2QTY6brTRsrn1lT3OFXQiIPsg6jOgNfXgUoJjCm7VCieopz70sYeVaO72yw4HmXE3MIU39HuUqDQyR+mb30rLyugavgymIOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fxWRXjyG; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fxWRXjyG"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791724484; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=CNQ5DbYdzL7ALCQqnfip1aC0MxoL7NSH7AFsKCWEGRk=;
	b=fxWRXjyGR9c4uVpghVOR/hUuWZEWqGNb+7saBZbSL1jM4Ak975tSlcvXsA9UuS8j1tsjuqUnnRga0vV/vWwwvpjw+LJQafJNLeEovDFDvlsi/q7RXUfItIqh2awa/xknCcGw/Ayy47M1L7yaz6Gcx+boKkApss6p3+/WdrXBYss=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XCYCFd4_1791724473;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XCYCFd4_1791724473 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 11 Oct 2026 21:14:42 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: david@kernel.org,  akpm@linux-foundation.org,  vbabka@kernel.org,
  linmiaohe@huawei.com,  nao.horiguchi@gmail.com,  ziy@nvidia.com,
  wangkefeng.wang@huawei.com,  tujinjiang@huawei.com,
  mgorman@techsingularity.net,  kaitao.cheng@linux.dev,
  chengkaitao@kylinos.cn,  muchun.song@linux.dev,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned pages
In-Reply-To: <20260929034123.2705745-1-xiangzao@linux.alibaba.com> (Yuanhe
	Shu's message of "Tue, 29 Sep 2026 11:41:23 +0800")
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
	<20260928105805.1215770-2-xiangzao@linux.alibaba.com>
	<99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
	<20260929034123.2705745-1-xiangzao@linux.alibaba.com>
Date: Sun, 11 Oct 2026 21:14:33 +0800
Message-ID: <877bjowf9i.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Yuanhe Shu <xiangzao@linux.alibaba.com> writes:

> On 9/28/26 20:12, David Hildenbrand wrote:
>> On 9/28/26 12:58, Yuanhe Shu wrote:
>>> folio_mc_copy() does not close this hole: it only detects corruption
>>> at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
>>> and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
>>
>> Then they should implement it.
>
> Agreed, and nothing here replaces copy_mc.  Two things the check adds
> while that work is pending: on archs without copy_mc the plain copy
> does not fail, it consumes the poison - the same poison consumption
> commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
> THP") refused to risk on the split path, at your suggestion; and the
> refusal happens before the copy is attempted at all, while copy_mc
> recovers only during the read.  The check and copy_mc compose.
>

Is it good to implement the trick in copy_mc_user_highpage() and
copy_mc_highpage() if the macro copy_mc_to_kernel is undefined?

---
Best Regards,
Huang, Ying
