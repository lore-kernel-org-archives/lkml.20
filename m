Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB45452B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081704; cv=none; b=qlzs3zkRsKgX9Dt3gsaMvDv/7eFCPpa3jDY1UUYSzMkXguZyM1uQn/cSnoHA/iHUYVb9NIdKdXAUPFGZl9VltKHfpffSwZnmxWdGMPibaaVLdYxGGBKKxeTcwyq5Tbgec52Qip1NjnB8GkN41Sehn3P1YMRX+lpXxUzB63bLV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081704; c=relaxed/simple;
	bh=FFxHiQYcjgILl+Zqr38rhbNvEsrzzjIqXE46oCelFqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=to0hL6HGCc1IOwSzD2lmQkrDVraheOIJRkAeyMb/a2I9fVODwD5WJvsG4xBGmDMFZdNfiSIFyVuWRP2M3d34lNinCcTUF//Lb0bHRza+hdOGiVe5ujiVNcO9yJMDyr4OaY7aSaX/aS2IuJlTudVD9Pz37g0DvWfcBrhqYLCEsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X4Z4+Hko; arc=none smtp.client-ip=91.218.175.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X4Z4+Hko"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FFxHiQYcjgILl+Zqr38rhbNvEsrzzjIqXE46oCelFqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790081695; v=1; x=1790686495;
 b=X4Z4+HkoL/GUjapbPGa6pyqQyIgNql7/xCdBdGDhzNdJ2YVOJ297ziJJCzb29YUrCo9C5q2k
 QJCCpTkZo92VxAEG/8vEwggGsn/yVMAIXJ8Bsnp5QJx5xCAuFyKEBqYcteBJBM2/axzq6kbjlix
 yqPK1R5natYWXCjhgwPDCV7Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84d8d0402c82fe38;
	Tue, 22 Sep 2026 12:54:55 +0000
X-Mizu-Trace-ID: 84d8d0402c82fe38
X-Migadu-Flow: FLOW_OUT
Message-ID: <4659ea28-19fc-45ee-804e-1cc7091f4bbd@linux.dev>
Date: Tue, 22 Sep 2026 13:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 07/29] x86: mm: add PMD swap-exclusive helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-8-usama.arif@linux.dev>
 <0df7e349-9d11-461f-8b8b-68bbddbe1f3d@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <0df7e349-9d11-461f-8b8b-68bbddbe1f3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 22:43, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:27, Usama Arif wrote:
>> A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
> 
> As a general note, we try not to talk about "this patch" or "later patches".
> 
> Instead, just say "Prepare for X by doing Y.".
Ack, I have started all these patches with "Prepare for keeping a PMD-mapped
anonymous THP mapped by a PMD across the swap round-trip..."
