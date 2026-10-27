Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065236;
	b=l0jzYa6QIovOj/7vN58kqEZFzfI5FiQp7XEJ5Wu5uNPat4XHt7w+nC9xKhbCw4DI+oQ1
	 Q6K9XkS2Ce0AbZyvWH9WxAY+BI1+bgm8cnrWbK6WmAOg+UHY5pgN19OvDFnBHcAkSPlP3
	 URPcmKhyp/djTpoow3C2JN6mcVbMBTMYFherQBk4C45g6UkTtxWDZ930n1C0mRab4k5UQ
	 w8as1NeXReE7vZ8GW5q3nBCmzKKM6pemmnprwKqTRqjwBRYPe/Fs7er1nqx0lUWKnv8Zv
	 daHMNy9AUUh0McrgozAMB5MPcVW67mWhgJM077sGgB3VGVuaUWQzhY+7ITCXNTZUXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065236;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=NrPCgCR6mBUX3MhIsaxSBayJHSlp6Zq7G4BS5OHlkcw=;
	b=OhoXlV6XwDWC9dwfwan6Pnc8wVJMAmj3qm3+gz4WGets47WQXZEddVbMX9p6LhWb55ds
	 5zpQQtuaDFYu/vHuDYsFbEY/lVnr7R0G5d6Kq7r06NMgOXoqFx83AC8BS13J+bKsQWUoW
	 X2+NevGIuQSu3zfwLUolrvl0Pxz3i7sfwQPrI1T+DzKvvI9QqQFlnwC2DSAJ3rXr9jvVL
	 S4j4BbgU5EAwzqGq+ssByCNzLLpf4eev0YEd7sTBwFtu8wvkH/ibA7g+ufNKc/9XMVnJC
	 XLee/7MXthLQiCUCOajglOFFXn/MAm8JIzW16W4h6aY3sau/a40VT3DX2puOSIc58Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mgUD9SDy;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFE606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DEFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mgUD9SDy
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793065233; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=NrPCgCR6mBUX3MhIsaxSBayJHSlp6Zq7G4BS5OHlkcw=;
	b=mgUD9SDywUox9j9yF4AlmAqmmgFoPnz2IbsEjQQl4ORmjPXE5Dm3Q2YLgUOIRpsf+pF2mV7fpz4ZNxkBW7kGkFA72YInNmzdvOpQIj7G5i5qL08tfEKGrByugUDhZpZxmqyJ5mBpK0C00KcW77/BkH22AU9ZNG7a3vDc/LmdCYU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XDc33Cj_1793065231;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XDc33Cj_1793065231 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 09:40:31 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: akpm@linux-foundation.org,  david@kernel.org,  Kaitao Cheng
 <kaitao.cheng@linux.dev>,  vbabka@kernel.org,  ljs@kernel.org,
  liam@infradead.org,  rppt@kernel.org,  surenb@google.com,
  mhocko@suse.com,  linmiaohe@huawei.com,  nao.horiguchi@gmail.com,
  ziy@nvidia.com,  wangkefeng.wang@huawei.com,  tujinjiang@huawei.com,
  mgorman@techsingularity.net,  chengkaitao@kylinos.cn,
  muchun.song@linux.dev,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
In-Reply-To: <87pkww7lnl.fsf@DESKTOP-5N7EMDA> (Ying Huang's message of "Mon,
	26 Oct 2026 19:21:02 +0800")
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
	<87pkww7lnl.fsf@DESKTOP-5N7EMDA>
Date: Tue, 27 Oct 2026 09:40:30 +0800
Message-ID: <877bj37wfl.fsf@DESKTOP-5N7EMDA>
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

"Huang, Ying" <ying.huang@linux.alibaba.com> writes:

> Yuanhe Shu <xiangzao@linux.alibaba.com> writes:
>
>> Where copy_mc_to_kernel is defined, copy_mc_user_highpage() and
>> copy_mc_highpage() stop at a hardware error during the copy, report
>> the not-copied bytes and queue the source page for memory_failure().
>> The !copy_mc fallbacks return 0 after a plain copy instead.  With
>> PG_hwpoison set while the data stays readable - software-injected
>> poison (MADV_HWPOISON, the debugfs corrupt-pfn injector) or a
>> transient hardware error - there is no fault to recover from: the
>> copy completes, the destination folio carries no poison marker, and
>> the poison is consumed silently, the same poison consumption
>> commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
>> THP") refused to risk on the split path.
>
> As far as I know, software-injected poison is used for debugging only ,
> so I don't think it's that important.  Hardware poison state in DDR is
> sticky; that is, even a transient hardware error will cause a permanent
> hardware poison state until a reset.
>
> Therefore, the primary value of this patch should be to reduce machine
> checks (and panics) during memory copies.  If so, we should place the
> check code before copying.
>

Another factor to consider is performance; the change shouldn't hurt
performance.  Please do some performance tests and share the results
too.

---
Best Regards,
Huang, Ying
