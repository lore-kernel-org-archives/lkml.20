Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906500;
	b=Ue6qxfIlzxyywJBGAjHCCtP5RMSRhR0d111r6sYmT7BaRtl7hc2b1y3sLtrSEUebmkvs
	 VSQVBiPYhtPnhjWsFyrRvulUy2WvoLU9I3cGLRWYM/ldt+g5kiL5vpmL6J+rWIDG3Old7
	 1a4A5Px8ra4xVspkEkH3rDtfbNeZd3tg0E+9IJOoTOkTBqiTsBpK8xcI+mWSds6tawLS2
	 74JclHh7lXvM5etWtN5jLMH3Nl6yTJULP1XERApc+Fq/6xzU0GAv4IVTD14cmPe2WqYCJ
	 JAZPzy5QYx1ufYPaKXK9aKk8fy4qFI91gh6j8QVagWJtsP3vyQ0UcVrQQWqr6chPk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906500;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DKa7Qj9UXI35IZM1aRSbpTHNKHEyy/5XO6y8cuSvrWQ=;
	b=g3jVaxEh0dFKPT2d/ykmiNia5f6Fp9OCiew4dphk9OwyFAsrCkLf9Jb0Fj5dofB/e3He
	 2DTdTr1SoQvZPDogWvDE4/9Vkt9jjg8pPP2YvzgU+cH9TYeB5qAi38P5l8Y90YDXW171h
	 pdMAwmSkIWQS+vEuyDwHa2rZhi0HEDDwlf9hsa1uk8hd6YKrOo3mZ+jbYkKnhdyy1TqBn
	 p/kt1XpjjEFUFKsV7MSXFMG/Hj5HQnXndVKnmW3lOxHN+o7dX3/s8ETUrs+GdVDKLFNd1
	 0cysgjoVmXTmSQaSOwAIRd3vihzGdOXdYKoCWNc/AtWBtp8Gbs0Dy2LIgWLvzoLmmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpgXaNR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54878606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpgXaNR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AAC1F000C8;
	Tue, 17 Nov 2026 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906499;
	bh=DKa7Qj9UXI35IZM1aRSbpTHNKHEyy/5XO6y8cuSvrWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UpgXaNR5DTBuS3TrgJddBYnul2zvtcSTxVz2O7WqwK8N/NaZNBgcALFIa59Oh74vc
	 /UmoeR7UKdI7oIPhm5fQr4Q+q+WdmZF85n8ln9maPP1rvx6Dg2yYU0aEJuOFAVXt6o
	 bv/b/I1ffP2JnsNtl+Wn9kWfDEfAJ9dayZBlQcYqs/S6mFymA9KRiLC5eo//3jEbyR
	 oQr4Ttn40o6/Lq8SdXt8KOe4misshJlT4YQeafzrG69V1xEav6EJKDN8oRuq43CaaG
	 gN6wjJa01ljyre7M9HzzlQ/iqr/lwLMlULPVY4V29/wVzbwrmZunRBVcriFYOnVmNf
	 uN3NcE5+13ELQ==
Message-ID: <4649c13d-eeda-4580-8c78-67e6d3392a09@kernel.org>
Date: Tue, 17 Nov 2026 10:08:13 +0100
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
Subject: Re: [PATCH v2] mm: synchronize with PTE table reclaim for all folio
 sizes
To: Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev,
 qi.zheng@linux.dev, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
 <20261116202726.b6690f9038557df945f8b007@linux-foundation.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261116202726.b6690f9038557df945f8b007@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 05:27, Andrew Morton wrote:
> On Tue, 17 Nov 2026 11:40:22 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>> with concurrent page table reclamation via zap_empty_pte_table().
>>
>> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>> and try_to_migrate(), the other callers do not perform post-walk accounting
>> checks, so the race has no observable impact on them.
>>
>> For migration, the race can cause unnecessary retries. For reclaim via
>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>> fact already unmapped (as shown below), which may cause cold/hot inversion
>> (e.g., in MGLRU) and increase refaults. In extreme cases, failing to
>> reclaim unmapped large folios could even cause OOM in theory.
> 
> Thanks, I've updated mm-hotfixes-unstable to this version.

Please drop it.

I'll take care of it.

It would be good to delay picking stuff that I will pick once ready.

-- 
Cheers,

David
