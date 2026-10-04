Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A0E44A3EA
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117587; cv=none; b=pz/PcVdi3KYOkPngoml8KHiq8qT8L4K8CEffjWou+dAuivU4Ldxer/PqvpDtACyJSNaOFR/KAmeh/cCLO8p7hKQbZes7Mimv2e0VMMMr1xkVtb2IH/aO+t0SypGAE3Vbrd2ikB0tIfC0nboSNqyTuVEoDY/ESzZ72s62/8zQAVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117587; c=relaxed/simple;
	bh=GjG9IXEV3KJ1cynJiT/y41reNwnp88Iy9TKL1JQcBbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGp8yrHKajSo2gJ78Yc+fBPijgogPBmGQhk7JXWbVLfnjA6CKd7yd2pZWLEQxoA6H0jX2NXYMhoIbxyawiMucHDcxIrOxcgiQwrizNROINWJuONWW+CbmeJ90v5m5rMSsNmSJ2KMF6r0tsymqA2WQUszjQmkyNbROzqCjyp5RCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nRcqtA1u; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nRcqtA1u"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GjG9IXEV3KJ1cynJiT/y41reNwnp88Iy9TKL1JQcBbc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791117578; v=1; x=1791722378;
 b=nRcqtA1uW8d1T+SF0YOBZE1HWCyO4M9CBEtw8Uo87/jFFsvmu7HrkMzQLfKtGsBKnYRf0HsJ
 LER+fVq/+KeY8i/xTBHRsxUS/NcpUAGsBEoIWcj5MkxIbzv2dJB2aCJps8qiAMvT/1G2lgB25dS
 V9W0ZvQ0JPsNnzIPCMXKljCg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e71eaeadc4a5a23e;
	Sun, 04 Oct 2026 12:39:38 +0000
X-Mizu-Trace-ID: e71eaeadc4a5a23e
X-Migadu-Flow: FLOW_OUT
Message-ID: <0b188796-502f-4d1d-8b57-08e6540531ef@linux.dev>
Date: Sun, 4 Oct 2026 13:39:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/30] mm: PMD-level swap entries for anonymous THPs
To: Zi Yan <ziy@nvidia.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, linux-mm@kvack.org,
 ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <ebc72eb7-daf3-45be-8994-b51e5e301b56@kernel.org>
 <D596001F-875E-4061-8124-68B0DB34CF19@nvidia.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <D596001F-875E-4061-8124-68B0DB34CF19@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>
>> I was hoping that we could get this into the next merge window, but as we are
>> approach rc6 and I didn't even manage to review all patches (shame on me), I
>> assume this would be a quite fit.
>>
>> So I assume this series is one of the things that we'll try to get in shape over
>> the next merge window to queue it early after rc1.

No worries! Really do appreciate all the reviews and the feedback! I will need to
learn your magic of reviewing so many different ongoing series at the same time.

> 
> I am going to review this series, since I have done with Lorenzo’s VM_SPECIAL one.

Thanks Zi!

> 
> 
> Best Regards,
> Yan, Zi

