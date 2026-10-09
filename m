Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BEE4F30DC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563234; cv=none; b=FVUCKitHAwFss3hbPUgfkXBOksfRkiz6XQCHXjz9BZYWD2rRAMkFyASWrDL64Rlm93leYO90x0ypgvr2XwQwukvIVBzfmOxifZb5cPRbYi92j9udw3nggx8nsoHhoeSm/A8fWe19Kep6n1o02FkmzwO0FHo1d8I9BVO6ddPVUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563234; c=relaxed/simple;
	bh=3+ISbXvxNBs6+/hE67lzmNGr70P9/qRzm+LaAlqac3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+lyoFRMBdRQKUN72FLWo7D9fGDU/vRhS7kKKHv/IrVeDzqIFsSFBWF7CWXXbDgNGpiNwselLDyf8lqrx+NGO7GStVC0gb9PW3N27W3o7o8SQL276kSr3CZreGQtxmtzt2VWoK1Jb9H22zA7oLXXZfUsyuhTK9rUb4VpOTpxEfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fFJt5But; arc=none smtp.client-ip=95.215.58.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fFJt5But"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3+ISbXvxNBs6+/hE67lzmNGr70P9/qRzm+LaAlqac3U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791563223; v=1; x=1792168023;
 b=fFJt5ButOHfCAjmIVQ/GOHQrojiSPTPUfGPnFb84/0o2sEo2GUpzfNexZgS9MQBVaEbXAn4y
 buWa0yo8PtFm3NmLDaxd67Ql3tdFx+FH6r357Ftn/DtF8RiBBv5b7mp6s6SHStgkfGxoSHvstQ6
 WFDj44i07hwAOrGMXJ34oXdI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b24a70362aefd2a;
	Fri, 09 Oct 2026 16:27:03 +0000
X-Mizu-Trace-ID: 7b24a70362aefd2a
X-Migadu-Flow: FLOW_OUT
Message-ID: <b11ab591-3839-4486-b4fe-77922addbc31@linux.dev>
Date: Fri, 9 Oct 2026 17:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: zswap: use separate compression and decompression
 requests
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev,
 dsterba@suse.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nphamcs@gmail.com, terrelln@fb.com, yosry@kernel.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kernel-team@meta.com
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-2-usama.arif@linux.dev> <asiUXpjrE61TLMxQ@google.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <asiUXpjrE61TLMxQ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/10/2026 09:16, Sergey Senozhatsky wrote:
> On (26/10/05 17:22), Usama Arif wrote:
>> Stores and loads serialize on the same per-CPU acomp request and mutex.
>> A low-priority store can be preempted as soon as the compressor drops
>> its stream lock, while it still holds the mutex. A higher-priority load
>> on that CPU then waits until the store runs again, which can take a
>> long time when other tasks are runnable.
>>
>> Give compression and decompression their own request, completion wait
>> and mutex. Since commit e2c3b6b21c77f ("mm: zswap: use SG list
>> decompression APIs from zsmalloc"), the per-CPU buffer is only used for
>> compression. The two requests can share the per-CPU transform: no
>> in-tree implementation modifies transform state while (de)compressing,
>> and shared codec state has its own locking. Loads can still wait for
>> each other on the decompression mutex, and stores still serialize on
>> the compression mutex.
>>
>> This follows the proposal from Sergey Senozhatsky for the same split
>> for zram [1].
> 
> Greetings zswap peeps,

Hello!


> We pushed things a little further for even more gains [1]

:)

Thanks for the inital patches!


> 
> Catch me if you can ;P
> 
> [1] https://lore.kernel.org/all/20261009071157.3730698-12-senozhatsky@chromium.org

I think it wont help zstd, right? It would help stateless decompressors like
lz4 I think.

We could that as a followup to the series for zswap.
