Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247944;
	b=3L57RGVtPo9Yaox4xa296kXINCQkFR9mNObnnf8VMnRTw6009Qqo1fAjECHh8GOQ0Pyl
	 QfmBhxnt4cMWEFJFMF+jg153v9PAEuRmipbwEUPHnDyhfbhxC+hG88o9XUq7xI/+GWYJG
	 XaRpaFquM+Mgkl8Even0xVE4umjC3BItnred4ajBiek+Ze/Ufu7QKzC4CNHK9u93bOq4u
	 lyVI2foq6buO1qUmNqVMNFtNNKN8Kss1Gay/+7D0p/fOL+RXCMScZAJwOw/Ck3PJOjFjB
	 WtHMj9/j9DGViPRY/vQIM+5b4H6wWwdg271hm15g9aulknb+1pw1mJDuF/jGpiai9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tBC4/NmO2zgQtfBxKcPngAWQ7uwqZiYLnLuVSCbwzqk=;
	b=5EU59cSE9yc+3RJXXZ7X/16ypfzGCvZHrgSOu4k2MzzPYRNicKD8CMSxrXzeqjju3SbS
	 0SbHqsg2gKzvLIN4Vm76iv/bbjJZuMOIhmlIwuQ9QUve58atwyHrPi+2BiJe7yElP5KDe
	 lqVDv4VJ7pfGLkFm/Zpu1G7z2VZQSDMTEkjAvLdDL6RNTsITxuf3gBMfwrkVhawE3rXE3
	 VYE7q/pTTBvpTwIBW9GqnyDhdbz5d6/RmJWsiCx36xTw+G5WjRH1OyDA3b2LB74XPibi1
	 E1tEuWaTRmWeezHkmDYmK5GUpad31LLVE0CkiH/qy3P3aZbmBpbnTnuXIYgw/KUQogw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jn99jLHa;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E8606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jn99jLHa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=atljCCTK/fj5aHjLEJvo0PUUzPCzwYh2AWWInU7Lvfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793247940; v=1; x=1793852740;
 b=jn99jLHahbl7ej1wL5FDpP5Fj4SFLiqYgcgw+x9iF8sGg8SDm8uyur7F7TMLqf7FfvEt5N9o
 fnFqBQqn/MpBH7MsINDkHAz1cljO4rdurwaaPQg66TZB9224+R6ckS8jo2JLwqgOuSefgYc82AE
 8Oc/CnF6csh66LJCFZ2dB1sE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 687ed835cbe95f64;
	Thu, 29 Oct 2026 04:25:37 +0000
X-Mizu-Trace-ID: 687ed835cbe95f64
X-Migadu-Flow: FLOW_OUT
Message-ID: <25bd4ed8-1132-4fa1-b48a-c50564a6dc7c@linux.dev>
Date: Thu, 29 Oct 2026 12:25:32 +0800
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
Subject: Re: [PATCH] mm/sparse: simplify the vmemmap alignment check
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20261028121129.39916-1-kaitao.cheng@linux.dev>
 <auIeDjoOQej4AT9b@kernel.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <auIeDjoOQej4AT9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/29 00:08, Mike Rapoport 写道:
> Hi,
> 
> On Wed, Oct 28, 2026 at 08:11:29PM +0800, Kaitao Cheng wrote:
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> sparse_init() is called only once during boot, and the vmemmap alignment
>> check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit over
>> VM_WARN_ON() here.
>>
>> Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
>> preserving short-circuit evaluation.
> 
> Do you think it's worth the churn?

I think saving two lines of code is nice. It also eliminates a variable,
even if only in debug kernels.

I’ll send a v2 following Muchun’s suggestion. If the consensus is that
this change isn’t worth merging, please feel free to ignore this email.

>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
>> ---
>>  mm/sparse.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/sparse.c b/mm/sparse.c
>> index 6acb628c8a73..248bee2d39b9 100644
>> --- a/mm/sparse.c
>> +++ b/mm/sparse.c
>> @@ -277,10 +277,8 @@ static void __init sparse_metadata_init(void)
>>   */
>>  void __init sparse_init(void)
>>  {
>> -	if (compound_info_has_mask()) {
>> -		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
>> -				    MAX_FOLIO_VMEMMAP_ALIGN));
>> -	}
>> +	VM_WARN_ON(compound_info_has_mask() && !IS_ALIGNED(
>> +		   (unsigned long)pfn_to_page(0), MAX_FOLIO_VMEMMAP_ALIGN));
>>  
>>  	sparse_metadata_init();
>>  	sparse_init_subsection_map();
>> -- 
>> 2.53.0
>>
> 

-- 
Thanks
Kaitao Cheng

