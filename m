Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274884;
	b=czN0p+aMXXjgWOR184JGd2KpZ19C1xOGwqVlpEHCSndbq1RxhewGf3tFlBZTsUGGoBmQ
	 slmupUx7EZ1XmUG0FxC4KfWQeNPYhI1/fJBsbL7NF976yOrA0mxWsCJaeg2T57H38OXO6
	 pUmOEUQ+gvO8AFh6crj3AzJ80F6VLNthvzQF5+xM5j+pXHD+wZhmpBDIPyw6m81DB7y7Z
	 o1ML6lbDF75XwBGUTew+OTa30kzV35YYWc1I7bbJSO90sUPwZfza6q6VfkO9X21b9CdX+
	 9DFLWNPi6GJn44y4kkxmc7M8fCAPMbncYVrL17ywnX8/55GLCflsQ8CCGVMczecYz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274884;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=YLtBIHtJK3uVpZ/8u5q8GXEFGNvOwwfb36TDfvtujpA=;
	b=Kd/yjbll5LJjPJaLRbb2BDDXHB3tO0CaHaaLjhItDgRktU3rp8Lyj/dNEQGoHR+/Klhh
	 YbgYFtlDIhV12gyga/ut8H4W3Wjby2UP8zZfQ7KctBerEgLVjwMA5S4dn5TKdkm9gg7zo
	 Sjhw333nHEeMfmobw+oFS/mt5PHTUinTVHMS6u+mxa993bX8RDox2WrcXm3VjLXg9E7PT
	 x00Q0ACF7i71mLsGytdNezyZDZjfagUBwPXQGHc+y1wisR+8YSSVd8Ve727WjP8fpv6ik
	 V4c5bQ9UiNik7iZeH2CiQmOexqI9sFJeKe3hr8GAqY3HAAm1SEwdtBSoTF/jx2ZPamQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FLjc4Oba;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38025606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38025606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FLjc4Oba
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274881; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=YLtBIHtJK3uVpZ/8u5q8GXEFGNvOwwfb36TDfvtujpA=;
	b=FLjc4ObaE3ZtOifcFaf3hWuNU41TlC6b5hau+zMEw/AKGwIfJ4pde1KlsbCYj55CXG4uFj0hXklfv0jNN8YU/gtrM3IwOo9g9AJ8AtwAP9J2FknUdcKyhI6E9R2gzLJwVR5vVdGgBqqI8S+f3gfKtINxzIdZRVnVlP/5thh3Rew=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XETU7Hc_1794274879;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XETU7Hc_1794274879 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:41:19 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Zhiteng Qiu <qiuzhiteng@hygon.cn>
Cc: David Hildenbrand <david@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Alistair Popple <apopple@nvidia.com>,  Xin Hao <xhao@linux.alibaba.com>,
  Dave Hansen <dave.hansen@linux.intel.com>,  Yuan Zhong
 <zhongyuan@hygon.cn>,  Shifei Ge <geshifei@hygon.cn>,  Jianyong Wu
 <wujianyong@hygon.cn>,  Shijie Huang <huangsj@hygon.cn>,  Yibin Liu
 <liuyibin@hygon.cn>,  Fengyu Wang <wangfengyu@hygon.cn>,
  <linux-mm@kvack.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] mm/migrate: don't batch the TLB flush when there is
 nothing to batch
In-Reply-To: <20261110001816.2186986-1-qiuzhiteng@hygon.cn> (Zhiteng Qiu's
	message of "Tue, 10 Nov 2026 00:18:16 +0800")
References: <20261106041628.1177963-1-qiuzhiteng@hygon.cn>
	<20261107143456.1590658-1-qiuzhiteng@hygon.cn>
	<20261109122915.2150586-1-qiuzhiteng@hygon.cn>
	<ef12d685-d111-4a6f-b72a-77bbd1369548@kernel.org>
	<20261110001816.2186986-1-qiuzhiteng@hygon.cn>
Date: Tue, 10 Nov 2026 09:41:18 +0800
Message-ID: <8733t9v4xt.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Zhiteng Qiu <qiuzhiteng@hygon.cn> writes:

> On 11/9/26 14:07, David Hildenbrand (Arm) wrote:

[snip]

>> I am not quite happy about the folio_mapcount() check, though: as soon as we
>> optimize try_to_unmap() to batch better for large folios, it would be just plain
>> wrong.
>
> That makes sense. A large folio's mapcount alone would not tell us
> how many separate flushes are needed once its PTEs can be handled
> in a batch.
>
> Would it make sense to restrict the optimization to a single,
> singly mapped small folio and keep batching for all large folios,
> as in the scope of v2? The changelog performance numbers were
> measured with the v2 check. Or do you have a different direction
> in mind?

If there's any behavior change, please rerun the test to verify.  It's
fine to reuse the result data if they are similar enough.

>
> Moving the check to the caller would read the mapcount before
> locking the folio. My understanding is that a concurrent change
> could only affect which flush path is chosen, and both paths are
> correct. Please let me know if I'm missing a concurrency concern.
>
> Ying, since you suggested using folio_mapcount(), would you be
> comfortable with limiting the optimization to small folios?

I'm OK with it.  Thanks to David for pointing out that folio_mapcount()
isn't good here because we will optimize large folio tlb flushes.

[snip]

---
Best Regards,
Huang, Ying
