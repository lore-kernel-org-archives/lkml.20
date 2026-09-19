Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526E1CAA92
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821564; cv=none; b=dkvR/gL0Wsj6jZdAwzk8nYglf3VsH10Irj3q664HwQRtrimVf7yi0zhbhgU00q2gUCRqvYhoczusSAqkx9Wv4a/iqoNDAwMePSNQaPdcF9FRG6OUMzlCVvC5p9VNRUslfrGWME9YVb9bDKBfc0cu0URD1xIMo9FFB2ZFLEiMtRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821564; c=relaxed/simple;
	bh=63TAU/20trh3z6ZWmLlRWwzB6HR6yfQpshRqu4iyzzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shSaPV7POYS6PJaNj2OpxJg2jHGHwGV+9FpSEFEJwNXldbu9n4F5z+sn3OkB6NZUKHIXub3ZpTyFdCsCedml4gtkV8vrVrRDp1flyJnwXWAWBnhPbdkAh5Lzm63oARwA3WRM6w/r/xAFpC5aZPVFCLNlYbJQDNdWV8OEW/xLpig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PB5lQdny; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PB5lQdny"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=63TAU/20trh3z6ZWmLlRWwzB6HR6yfQpshRqu4iyzzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789821558; v=1; x=1790426358;
 b=PB5lQdnydCZ+8HxpMA6fr1TxMOUTZ0dGEfTVtjzKq4p9Qfl6Z28VZLewJJODMtjSgOriE43z
 s60beLBYJu6Y17MAv9kUicQOXxXT3RH07Ad32d2awo8Di3FM31PN8bERGm/yg/cTkM7AbGyqczX
 q7q4yxBWVj2Gvi+BMi29Wn40=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 39ea79bec7641d4d;
	Sat, 19 Sep 2026 12:39:18 +0000
X-Mizu-Trace-ID: 39ea79bec7641d4d
X-Migadu-Flow: FLOW_OUT
Message-ID: <f38bce8f-ee47-40aa-a215-e2e605d17c91@linux.dev>
Date: Sat, 19 Sep 2026 20:39:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] Docs/mm/damon/design: clarify bp is basis point
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, David Hildenbrand
 <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 damon@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260917142210.90829-1-sj@kernel.org>
 <20260917142210.90829-11-sj@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260917142210.90829-11-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 10:22 PM, SJ Park wrote:
> DAMON design document uses "bp" for "basis point" in multiple places.
> Because it is not clearly mentioned, it is difficult to understand what
> "bp" stands for.  Add the clarification.

Exactly ;-)  I had such confusion when I was reading the doc.

> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/107dc6ba-697e-4b25-ba3e-8ce2499cac9a@infradead.org
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: SJ Park <sj@kernel.org>

Acked-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
