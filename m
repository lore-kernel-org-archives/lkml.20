Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495670;
	b=xbhpVbe+SJIVwxNLh052TcgdC0M3GJsVXgwpJGcYU340jxAxmSjFuOxMLFIubyTQlEgF
	 M5qAWkM3QL7WGEtKH0WZGeB9R41M6XxKga89nbTqM8ol16Sl/cEiTEbBFyKg/QL6oX2aA
	 tMX3axqS3T/5f24sg4bUaP/TMATVUT7deDnthT2swSaEi6PcfTQe4hGpMakzwNgCouHYH
	 I5TnY7XM2beqhVJw/mbKVydzRfE4GqEaLUvYxpd7+IVMuZEMSDldeOX1xEBLy8Su8VLEg
	 svDXO0ASiIElbLuni1/o60YC7qrzM5TnOrkVoxcsTspQRABuKKCo6BXFC0L3cywrogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495670;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=54dQOH2g4LxtCry7r3xqEFdS6hXfu/AH/gaD2EbPV8k=;
	b=hSoxoIt99wX623ZrNvKTXUt2d9yjgJbl1s30qhWs2XRDYXv07p1XhZLQB8LhY3WdUcAu
	 wybJoJbCn1AvPYT0ircNNElYE6iTE9ayoz0shkJI2PgNEiKgdVdfrR/+/JpR2GXjZ5521
	 omm80TZ+6pH7AUd/cRAB54tzVIoFDmXJIfpmg2BbsofYsaa0G3wnlSOTLIuG6kV8fVzFQ
	 74qocj/hQM7TnuIfBcY28iUnTxffjAOJv0ug9jspBrb6/CAg92APsBxFvGqLn/BGmWQEb
	 sv7fphzqtXtgDCbieNjE0NFfq9eToROMd3HvNISkOM5kw6fsxOdY6PVO4qKv1O2ZEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gAlzpKVC;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7E606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A7E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gAlzpKVC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8sOUs6FJNb9GzvdrnPJnQT6cgTMijJ3pE3NhbGSXCRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792495667; v=1; x=1793100467;
 b=gAlzpKVCZ1wbgklRWJJr1JfcWJ0kgLzMdA+eCoHVyvL3LpdFc7XJT8pFdEw3F7Fdmy3XLlyU
 1bL/mkwRt/q21wfgATsUl+t4w8NiKFCKMtibzQkkDeqxjIetWFwJAQDTcDykAqxppUaEA8ETzBD
 WkN9ODQCpw5CDMvRD+8ww43w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f5736f767ff4eb48;
	Tue, 20 Oct 2026 11:27:47 +0000
X-Mizu-Trace-ID: f5736f767ff4eb48
X-Migadu-Flow: FLOW_OUT
Message-ID: <fbd5ae06-b6da-48f6-9c46-188fb6ba9684@linux.dev>
Date: Tue, 20 Oct 2026 19:27:42 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/compaction: skip folios containing hwpoisoned
 pages
To: "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Yuanhe Shu <xiangzao@linux.alibaba.com>
Cc: david@kernel.org, akpm@linux-foundation.org, vbabka@kernel.org,
 linmiaohe@huawei.com, nao.horiguchi@gmail.com, ziy@nvidia.com,
 wangkefeng.wang@huawei.com, tujinjiang@huawei.com,
 mgorman@techsingularity.net, chengkaitao@kylinos.cn, muchun.song@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260928105805.1215770-1-xiangzao@linux.alibaba.com>
 <20260928105805.1215770-2-xiangzao@linux.alibaba.com>
 <99cbd960-439d-4672-aba9-6b49697db8b3@kernel.org>
 <20260929034123.2705745-1-xiangzao@linux.alibaba.com>
 <877bjowf9i.fsf@DESKTOP-5N7EMDA>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <877bjowf9i.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/11 21:14, Huang, Ying 写道:
> Yuanhe Shu <xiangzao@linux.alibaba.com> writes:
> 
>> On 9/28/26 20:12, David Hildenbrand wrote:
>>> On 9/28/26 12:58, Yuanhe Shu wrote:
>>>> folio_mc_copy() does not close this hole: it only detects corruption
>>>> at copy time and only where ARCH_HAS_COPY_MC is implemented (x86_64
>>>> and PPC64; elsewhere copy_mc_highpage() degrades to a plain copy).
>>>
>>> Then they should implement it.
>>
>> Agreed, and nothing here replaces copy_mc.  Two things the check adds
>> while that work is pending: on archs without copy_mc the plain copy
>> does not fail, it consumes the poison - the same poison consumption
>> commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
>> THP") refused to risk on the split path, at your suggestion; and the
>> refusal happens before the copy is attempted at all, while copy_mc
>> recovers only during the read.  The check and copy_mc compose.
>>
> 
> Is it good to implement the trick in copy_mc_user_highpage() and
> copy_mc_highpage() if the macro copy_mc_to_kernel is undefined?

On architectures with hardware error correction and exception recovery
support, accessing faulty memory automatically triggers an exception,
which itself guarantees atomicity.

On architectures without such support, even if we implement this logic
in copy_mc_user_highpage() and copy_mc_highpage(), checking the hwpoison
flag and copying the data remain two separate operations. They cannot
be performed atomically, so there is still a race window between them,
however small.

Moving the hwpoison check after the copy might address this issue.
Is there anything wrong with my understanding?

> ---
> Best Regards,
> Huang, Ying

-- 
Thanks
Kaitao Cheng

