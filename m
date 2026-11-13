Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565075;
	b=b/QQQ0iXbyu/WvMAO/FUnvy3ScswYAzpLYNuupynzuYyjQDgV70DKtdf0gnaS4G7KGle
	 UrKW7FYP4rcxAKAsO5yZhZOVU1vXv8Rq9Ue8QfuuJ6WxQtQTd1a0GiWA8jKKgtOok6JKc
	 X9f/UPFUmdPy/8XNgLJpfkb+bQ6dUnV2sCR/2WOmDae82yNwL4QxSD/KxrMRhXbw7tqU5
	 gYDsUV/5SxveNd4CIJQ7zoQaKCEx7RyVhDFtOkFv/Ej32zVUPXgJaOZv4e+IAVuO17fYz
	 EppL6gC8wboCrNebRkT2MaXxnsCJQNl8QDo9bYhUHvoUUk2bO07Fpw5HZIvP4JXYQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565075;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sZLmD7hsU/6QEyVPCXGzkI+ZZAvpViPfzCZeFeE5hYc=;
	b=IgOUKPIKZhhzh+FM4XOUUivVtOg+MTFJS9xB1KdyflLEiuQWGX3CsW++D/2kKaLx3sq5
	 K4XLEy6YtmZ73F9jdFYCo683Cp9nS24PvvMRwzYIr72VK27XCc4jgW/8kbN4OiEkskj+q
	 nB6kNfFHlnNxUsOe4FCOrh7uEIODdlvofdiNHcjD0e9Hdj6qbTOPGJXUvITPvoQ/tFpcn
	 1ADEtMy0lsutWlEhm1mlxXwReLJl2jluHIlc0FV0QPHOfLgviPn2sky25SbbabdxRxEnv
	 htTe3EqoIsyl28e7uiW6vYz0VbBJd8j1DBFQf1yr6oN/EVXN2jatX7Xu1K2VRbR092A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mlh/iknC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA36606B114
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mlh/iknC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BBC1F000C4;
	Fri, 13 Nov 2026 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565074;
	bh=sZLmD7hsU/6QEyVPCXGzkI+ZZAvpViPfzCZeFeE5hYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Mlh/iknC2FK9BSatYYtrb6t4ST8Cm5jjehZaswXTPr5pAlNcGKwzX2FZoGuo1ouZN
	 m95lpM3urmBlqh9o9LHelgPLM31Iv3JsQSI2DiQ7MeguGWmhN+eU1CVvWjvr8biRWx
	 8V5d4/DbXA4p0h8v1Ne3tgOTBuiUlX9hndMwxyZ6gbKxxY/tkRS6SAumtWNjX+Q5qt
	 iQHaJl583sJf3P+TNZ3M4VNlv9l7crdo9scokax2cT+Xl5azcdoZrTW4mXISMNKPdH
	 tRhEI7NG4e+FxFS9U+05A3MtKdr1BwNB081ybDO92bYdamQToNYRwQ7WBF+NDgbEGi
	 BUtgQwy3lFtCQ==
Message-ID: <5ca50c99-8dfb-42b1-b593-16bf264581e8@kernel.org>
Date: Fri, 13 Nov 2026 11:17:49 +0100
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
Subject: Re: [PATCH] mm/folio_batch: document missing struct members
To: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 05:10, Oscar Alejandro Sánchez Lucero wrote:
> Add missing kernel-doc descriptions for @nr, @i, @percpu_pvec_drained,
> and @folios in struct folio_batch to fix warnings.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
>  include/linux/folio_batch.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
> index b45946adc50b..7731dcd249a8 100644
> --- a/include/linux/folio_batch.h
> +++ b/include/linux/folio_batch.h
> @@ -18,6 +18,11 @@ struct folio;
>  
>  /**
>   * struct folio_batch - A collection of folios.
> + * @nr: Number of folios currently in the batch.
> + * @i: Index of the next folio to process in folio_batch_next().
> + * @percpu_pvec_drained: Whether the per-CPU deferred LRU queues have already
> + *                       been drained during __folio_batch_release().
> + * @folios: Array of pointers to the folios in the batch.
>   *
>   * The folio_batch is used to amortise the cost of retrieving and
>   * operating on a set of folios.  The order of folios in the batch may be
> 
> ---
> base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
> change-id: 20261112-folio-batch-doc-fa4f7e18ec85
> 
> Best regards,

Waiting for more review before queuing this.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
